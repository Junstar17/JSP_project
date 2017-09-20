<HeaderTemplate>
       <ul class="list-unstyled">
           <li class="row board-row list-group-item">
     		 <div class="col-sm-3 col-xs-9 text-center">출고번호</div>
               <div class="col-sm-1 col-xs-3 text-center">출고일</div>
		      <div class="col-sm-3 hidden-xs text-center">품명</div>
		      <div class="col-sm-3 hidden-xs text-center">품번</div>
		      <div class="col-sm-2 hidden-xs text-center">출고수량</div>
     </li>
       </HeaderTemplate>
       <ItemTemplate>
           <li class="row board-row list-group-item">
   			<div class="col-sm-3 col-xs-9"><%# DataBinder.Eval(Container.DataItem, "SND_NO") %>
                   <span class="visible-xs"><span style="font-size:smaller;"><%# DataBinder.Eval(Container.DataItem, "ITEM_NAME") %></span> / <span style="font-size:smaller;"><%# DataBinder.Eval(Container.DataItem, "ITEM_SIZE1") %></span></span></div>
   			<div class="col-sm-1 col-xs-3"><asp:Label ID="lblSndDate" runat="server"></asp:Label>
                   <span class="visible-xs"><span class="pull-right"><%# DataBinder.Eval(Container.DataItem, "S_QTY") %></span></span></div>
               <div class="col-sm-3  hidden-xs text-center"><%# DataBinder.Eval(Container.DataItem, "ITEM_NAME") %></div>
		   <div class="col-sm-3  hidden-xs text-center"><%# DataBinder.Eval(Container.DataItem, "ITEM_SIZE1") %></div>
		   <div class="col-sm-2  hidden-xs text-center"><%# DataBinder.Eval(Container.DataItem, "S_QTY") %></div>
  </li>
       </ItemTemplate>
