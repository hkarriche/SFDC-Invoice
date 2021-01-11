<aura:application extends="force:slds">

    <aura:attribute name="message" type="String" description="Modal Message" ></aura:attribute>
    <aura:attribute name="modalHeading" type="String" description="Modal Heading" ></aura:attribute>
    <c:lwcModal aura:id="modal" message="{!v.message}" modalHeading="{!v.modalHeading}"></c:lwcModal>
    <div align="right"> <lightning:button variant="brand" label="Show Modal" title="Show Modal" onclick="{! c.showModal }"  />
    </div>
   
</aura:application>