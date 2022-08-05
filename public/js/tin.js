'use strict';

var tinderContainer = document.querySelector('.tinder');
var allCards = document.querySelectorAll('.tinder--card');
let total_card=allCards;
var nope = document.getElementById('nope');
var love = document.getElementById('love');
var data = [{ value:'', flag:''} ];
let Header_param = document.getElementById('tin').value;
console.log(Header_param);
let arr=[]
let count=0;
let learn_flag=true;
function initCards(card, index)
{

    var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
if (document.querySelectorAll('.tinder--card').length < 10)
{
   if ((count ===4 || newCards.length===0) && Header_param!==":Users"  && Header_param!==':MoreUsers' && Header_param!==':Matches')
   {
      if ( count===4 )  alert(" learners quota filled  ");

      if (newCards.length===0 && arr.length===0)
      {
           alert ('sorry no   learners meet your  criteria  ');
           document.getElementById('tin_form').setAttribute('action','/data') ;
          document.getElementById("tin_form").submit();
          learn_flag=false ;
       }

      else {
          document.getElementById('tin_form').setAttribute('action','/team') ;
          document.getElementById('tin_form').setAttribute('method','post') ;
          document.getElementById('val').setAttribute('value',JSON.stringify(arr)) ;
          document.getElementById("tin_form").submit();
          learn_flag=false;2
      }


   }

    if (newCards.length===0 && Header_param===':Matches')
    {

        if ( count===0 )  alert("SoRrY but no one seems to have liked you ");

        document.getElementById('tin_form').setAttribute('action','/tin:NoMoreUsers') ;
        document.getElementById('val').setAttribute('value',JSON.stringify(arr)) ;
        document.getElementById('sid').setAttribute('value',data.value) ;
        document.getElementById("tin_form").submit();
        learn_flag=false;

    }


}



if (newCards.length ===0 && learn_flag )
{



let moreflag=false;
if ((Header_param===':MoreUsers' || Header_param===":Users" )  && newCards.length===0 && arr.length===0 )
{
    alert("Seems like theres no more  users  left  ");

           document.getElementById('tin_form').setAttribute('action','/data') ;
           document.getElementById("tin_form").submit();

moreflag=true;

}
if (moreflag ===  false)
{
    var r=confirm("do you want more cards");
    if (r===true)
    {

        document.getElementById('tin_form').setAttribute('action','/tin:MoreUsers') ;
        document.getElementById('val').setAttribute('value',JSON.stringify(arr)) ;
        document.getElementById('sid').setAttribute('value',data.value) ;
        document.getElementById("tin_form").submit();
    }
    else
    {

        document.getElementById('tin_form').setAttribute('action','/tin:NoMoreUsers') ;
          document.getElementById('val').setAttribute('value',JSON.stringify(arr)) ;
                document.getElementById('sid').setAttribute('value',data.value) ;
        document.getElementById("tin_form").submit();
    }
}

}

    newCards.forEach(function (card, index) {
        card.style.zIndex = allCards.length - index;
        card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
        card.style.opacity = (10 - index) / 10;
    });

    tinderContainer.classList.add('loaded');
}

initCards();

allCards.forEach(function (el) {
    var hammertime = new Hammer(el);

    hammertime.on('pan', function (event) {
        el.classList.add('moving');
    });

    hammertime.on('pan', function (event) {
        if (event.deltaX === 0) return;
        if (event.center.x === 0 && event.center.y === 0) return;

        tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
        tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);

        var xMulti = event.deltaX * 0.03;
        var yMulti = event.deltaY / 80;
        var rotate = xMulti * yMulti;

        event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
    });

    hammertime.on('panend', function (event) {
        el.classList.remove('moving');
   let flag=false;
      if  (tinderContainer.classList[2]==='tinder_love')
      {
          flag= true;
      }
        if  (tinderContainer.classList[2]==='tinder_nope')
        {
        flag=false
        }

        tinderContainer.classList.remove('tinder_love');
        tinderContainer.classList.remove('tinder_nope');

        var moveOutWidth = document.body.clientWidth;
        var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

        event.target.classList.toggle('removed', !keep);

        let value=event.target.id;


         data = {
             value:'',
            flag:''
         }

         data.value=value;
         data.flag=flag;

        if (flag === true) {
            count = count + 1
        }
 arr.push(data);
 console.log(arr);


        if (keep) {
            event.target.style.transform = '';
        } else {
            var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
            var toX = event.deltaX > 0 ? endX : -endX;
            var endY = Math.abs(event.velocityY) * moveOutWidth;
            var toY = event.deltaY > 0 ? endY : -endY;
            var xMulti = event.deltaX * 0.03;
            var yMulti = event.deltaY / 80;
            var rotate = xMulti * yMulti;

            event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
            initCards();
        }
    });
});

function createButtonListener(love) {
    return function (event) {
        var cards = document.querySelectorAll('.tinder--card:not(.removed)');
        var moveOutWidth = document.body.clientWidth * 1.5;

        if (!cards.length) return false;

        var card = cards[0];


        card.classList.add('removed');

        if (love) {
            card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
        } else {
            card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
        }

        initCards();

        event.preventDefault();
    };
}

var nopeListener = createButtonListener(false);
var loveListener = createButtonListener(true);

nope.addEventListener('click', nopeListener);
love.addEventListener('click', loveListener);
console.log(data);
document.getElementById('message').addEventListener('click' , function ()
{
let  kek =   data.value;
    console.log("pressed message for ",kek );

    document.getElementById('tin_form').setAttribute('method','get') ;
    document.getElementById('tin_form').setAttribute('action','/data') ;
    document.getElementById('sid').setAttribute('value',data.value) ;
    document.getElementById("tin_form").submit();
})


