Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5526056C897
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jul 2022 12:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiGIKA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Jul 2022 06:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiGIKA0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Jul 2022 06:00:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026464A827
        for <linux-usb@vger.kernel.org>; Sat,  9 Jul 2022 03:00:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 92F3C60C84
        for <linux-usb@vger.kernel.org>; Sat,  9 Jul 2022 10:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC97C3411C;
        Sat,  9 Jul 2022 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657360825;
        bh=ngOHIe0s2kCky1AnUDf6iFnf0NBTb/LQ053oidgwiUk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rsid3L6qKO17zsM7gBpPTldR0eDrhCwSa9YCuR47Tgqn9n1lUjLNlxb6OJy/AxrG/
         zZcE01wW8WxF/HYtDHxcy/hrClxrJ3FBf64j0jfMyEZLqBtI0mD3Y0WHmOCqCfR7/a
         ZvfY6Ad700eW99YCNoXMIo0hfTimeQuCraiNNVq/JvZN/PYPvbhc5sr1b1U76wJtPP
         6lm/xuWnxaN4u+yUv0STZKH7BxgZCl9O0/aUEw39rgfpRbbxVF/tdOUO+fuTBQG4UV
         5QJ9Ys5Cdls/F2/hsiD5XJ1OWprH/k+a4bVbH2os0lZI45AznpPbE9FY6g9a5yrUjw
         W+ePvkO2eYtvA==
Date:   Sat, 9 Jul 2022 18:00:19 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: chipidea: udc: check request status
 before setting device address
Message-ID: <20220709100019.GA1517786@Peter>
References: <20220623030242.41796-1-xu.yang_2@nxp.com>
 <20220703004209.GB1382015@Peter>
 <PAXPR04MB8784CA907581DCFDCFD196128CBE9@PAXPR04MB8784.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8784CA907581DCFDCFD196128CBE9@PAXPR04MB8784.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-07-04 01:59:45, Xu Yang wrote:
> Hi Peter,
> 
> > -----Original Message-----
> > From: Peter Chen <peter.chen@kernel.org>
> > Sent: Sunday, July 3, 2022 8:42 AM
> > To: Xu Yang <xu.yang_2@nxp.com>
> > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Jun Li
> > <jun.li@nxp.com>; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH] usb: chipidea: udc: check request status before
> > setting device address
> > 
> > Caution: EXT Email
> > 
> > On 22-06-23 11:02:42, Xu Yang wrote:
> > > The complete() function may be called even though request is not
> > > completed.
> > 
> > Would you please explain more when the complete() is called but the
> > request has not completed, and this happens before set_address has
> > finished?
> 
> The following sequence will be a case:
> 1. the HOST sent SET_ADDRESS control message to DEVICE.
> 2. the DEVICE acked this message and queued a usb_request (0 data length) for future IN transfer.
> 3. somehow the setup interrupt is not cleared by USB controller


You mean even software clear the OP_ENDPTSETUPSTAT bits, but controller
itself doesn't clear its interrupt, and trigger the same
interrupt handler again?

> or received other setup token rather IN token.
That's possible. Have you found that at bus analyzer?


> 4. the driver will go through below functions:
> 
> isr_setup_packet_handler(ci);
>   _ep_nuke(ci->ep0in);
>     usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
>       req->complete(ep, req);
>         isr_setup_status_complete();
>           hw_usb_set_address(ci, ci->address);
>             usb_gadget_set_state(&ci->gadget, USB_STATE_ADDRESS);
> 

Would you please add your above description and send patch again?

Peter
> Xu Yang
> 
> > 
> > Peter
> > 
> > > In this case, it's necessary to check request status so as not to set
> > > device address wrongly.
> > >
> > > Fixes: 10775eb17bee ("usb: chipidea: udc: update gadget states
> > > according to ch9")
> > > cc: <stable@vger.kernel.org>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/udc.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > index 0c9ae9768a67..8c3e3a635ac2 100644
> > > --- a/drivers/usb/chipidea/udc.c
> > > +++ b/drivers/usb/chipidea/udc.c
> > > @@ -1048,6 +1048,9 @@ isr_setup_status_complete(struct usb_ep *ep,
> > struct usb_request *req)
> > >       struct ci_hdrc *ci = req->context;
> > >       unsigned long flags;
> > >
> > > +     if (req->status < 0)
> > > +             return;
> > > +
> > >       if (ci->setaddr) {
> > >               hw_usb_set_address(ci, ci->address);
> > >               ci->setaddr = false;
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > 
> > Thanks,
> > Peter Chen
> 

-- 

Thanks,
Peter Chen

