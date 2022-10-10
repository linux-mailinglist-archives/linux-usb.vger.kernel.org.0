Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860445F985D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Oct 2022 08:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbiJJGaZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Oct 2022 02:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbiJJGaW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Oct 2022 02:30:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E125D4D803
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 23:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6CF37B80707
        for <linux-usb@vger.kernel.org>; Mon, 10 Oct 2022 06:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9224AC433D6;
        Mon, 10 Oct 2022 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665383418;
        bh=bUpCKdXUGAOGHbZbjspKEQzb06riL8zbw788NeAxA4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AIHA5il+is0MY6w9L1y3aQApTDcWkvHMYQ7O9En0/K7uHZ8OdD1yCYVBQAf2t/Xvr
         jPbXhhiLNYPQ1CQfiU+V3bMF9Ge9V5h3R3LVQ/Tv/0Pkb6qwtCiPF6uHa1x22wy6MY
         P60JZwxgGQmzamkIpn5Co1NcbRkxHLPHHEvGx79o=
Date:   Mon, 10 Oct 2022 08:31:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH 3/8] usb: chipidea: host: add suspend/resume
 support for host controller
Message-ID: <Y0O8Jeb36P65vx93@kroah.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
 <20221009160813.776829-4-xu.yang_2@nxp.com>
 <Y0MUdHsGa+UfaO2u@kroah.com>
 <PAXPR04MB8784E2AE0AEE9ADB152E46E88C209@PAXPR04MB8784.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8784E2AE0AEE9ADB152E46E88C209@PAXPR04MB8784.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 10, 2022 at 02:54:02AM +0000, Xu Yang wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Monday, October 10, 2022 2:36 AM
> > To: Xu Yang <xu.yang_2@nxp.com>
> > Cc: peter.chen@kernel.org; Jun Li <jun.li@nxp.com>; linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH 3/8] usb: chipidea: host: add suspend/resume support for host controller
> > 
> > Caution: EXT Email
> > 
> > On Mon, Oct 10, 2022 at 12:08:08AM +0800, Xu Yang wrote:
> > > The controller's power may be powered off during system suspend. This
> > > will add suspend/resume support when the controller suffers power lost.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/host.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > > index bc3634a54c6b..dc033272c31e 100644
> > > --- a/drivers/usb/chipidea/host.c
> > > +++ b/drivers/usb/chipidea/host.c
> > > @@ -459,6 +459,16 @@ static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
> > >       ci_hdrc_free_dma_aligned_buffer(urb);
> > >  }
> > >
> > > +static void ci_hdrc_host_suspend(struct ci_hdrc *ci)
> > > +{
> > > +     ehci_suspend(ci->hcd, device_may_wakeup(ci->dev));
> > 
> > Why is the chipidea driver somehow now tied to the ehci driver?
> 
> The chipidea host controller driver has been tied to ehci driver from the 
> beginning. Here, this patch will enhance the host controller by using ehci
> suspend/resume functions.
> 
> > 
> > Are you sure you want this?  Why?  Is hcd always a ehci device?
> 
> As the host controller may suffer power lost after system suspend, there is
> a need to restore it correctlly after system resume. ehci_suspend/resume()
> will handle the generic parts of controller suspend/resume, at the same time,
> ehci_resume() could handle power lost case by reporting this event to root
> hub and reset host controller in a normal way. So it's exactly a good choice
> to use them. 
> 
> As per chipidea RM: The USB 2.0 Controller is an instantiation of an 
> EHCI-compatible core which supports high-, full-, and low-speed operation.
> So this hcd will be a ehci device all the time.

Ah, sorry, you are right.  But the build breaks so you need to fix
something up to so that this dependancy really is there.

thanks,

greg k-h
