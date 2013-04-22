class SkeletonNode

  constructor: (ctx) ->
    @jointAngle = 0
    @angle      = 0
    @x          = 0
    @y          = 0
    @ctx        = ctx
    @parent     = null;

    @children   = []

  renderChildren: (ctx) ->
    child.render(ctx) for child in @children

  addChild: (node) ->
    node.parent = @;
    @children.push node

  render: (ctx) ->
    ctx.save()
    ctx.fillStyle = "rgba(0,0,0,1)"
    ctx.strokeStyle = "#000";
    ctx.rotate(@angle * (Math.PI/180))
    
    if @parent?
      ctx.beginPath()
      ctx.moveTo(@x,@y) #we were at parent, move to this node
      ctx.lineTo(0,0) #parent is at 0,0 until translate
      ctx.stroke();


    ctx.translate(@x,@y)
    ctx.rotate(@jointAngle * (Math.PI/180)) # deg2rad

    ctx.beginPath()
    
    ctx.arc(0,0,5,0,Math.PI*2,true); 
    ctx.fill();

    @renderChildren(ctx)

    ctx.restore()


window.SkeletonNode = SkeletonNode;






