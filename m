Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2861B7629A2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 05:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjGZD7T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 23:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjGZD7A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 23:59:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F0E35A8
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 20:58:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6FBB611D8
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 03:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD88DC433C8;
        Wed, 26 Jul 2023 03:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690343879;
        bh=MBLoFS5JSci7pfNBmvPrhmUUA3fjbMKShyLQ9ulaE5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ltCI5/ZfR7sABqQWeew0+exT93BZATsB3vEdDrFz0hefSdVlxX1xZ3AFVIev3+42s
         IM1556Xaoql5fUZrSPwtlH7QHWYcreqdMXgVdhApKM1q2vHpRNZPEV2w54UX2YbaSU
         fhgSR6OfrxxdbsushB9RcRoSAkh6Q0kF0b6JNUas=
Date:   Wed, 26 Jul 2023 05:57:56 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "heghedus.razvan@gmail.com" <heghedus.razvan@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH] usb: misc: ehset: fix wrong if condition
Message-ID: <2023072629-referable-enchilada-16aa@gregkh>
References: <20230705095231.457860-1-xu.yang_2@nxp.com>
 <DB7PR04MB45050DD873B70F1A0F41D0CB8C00A@DB7PR04MB4505.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB45050DD873B70F1A0F41D0CB8C00A@DB7PR04MB4505.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 26, 2023 at 01:54:15AM +0000, Xu Yang wrote:
> > -----Original Message-----
> > 
> > A negative number from ret means the host controller had failed to send
> > usb message and 0 means succeed. Therefore, the if logic is wrong here
> > and this patch will fix it.
> > 
> > Fixes: f2b42379c576 ("usb: misc: ehset: Rework test mode entry")
> > cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/misc/ehset.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
> > index 986d6589f053..36b6e9fa7ffb 100644
> > --- a/drivers/usb/misc/ehset.c
> > +++ b/drivers/usb/misc/ehset.c
> > @@ -77,7 +77,7 @@ static int ehset_probe(struct usb_interface *intf,
> >  	switch (test_pid) {
> >  	case TEST_SE0_NAK_PID:
> >  		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
> > -		if (!ret)
> > +		if (ret < 0)
> >  			break;
> >  		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
> >  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> > @@ -86,7 +86,7 @@ static int ehset_probe(struct usb_interface *intf,
> >  		break;
> >  	case TEST_J_PID:
> >  		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
> > -		if (!ret)
> > +		if (ret < 0)
> >  			break;
> >  		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
> >  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> > @@ -95,7 +95,7 @@ static int ehset_probe(struct usb_interface *intf,
> >  		break;
> >  	case TEST_K_PID:
> >  		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
> > -		if (!ret)
> > +		if (ret < 0)
> >  			break;
> >  		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
> >  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> > @@ -104,7 +104,7 @@ static int ehset_probe(struct usb_interface *intf,
> >  		break;
> >  	case TEST_PACKET_PID:
> >  		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
> > -		if (!ret)
> > +		if (ret < 0)
> >  			break;
> >  		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
> >  					   USB_RT_PORT, USB_PORT_FEAT_TEST,
> > --
> > 2.34.1
> 
> A gentle ping.

Have you teted this?  It feels odd that the code could be that broken,
how did it ever work in the first place?

thanks,

greg k-h
