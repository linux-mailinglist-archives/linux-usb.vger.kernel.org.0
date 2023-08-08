Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E297747F0
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 21:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbjHHTWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 15:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbjHHTWD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 15:22:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7307910E9DA;
        Tue,  8 Aug 2023 09:45:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04C5162438;
        Tue,  8 Aug 2023 08:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAECC433C7;
        Tue,  8 Aug 2023 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691483201;
        bh=1ijsJa2eh4p1IcCoOuBZVpoxzDn4f5UY3AUI/la7Uu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z2mh4nj4UTCvyovhEk3tQD6tH0991P3wRL7uqwF0I7iL1RV1pjAIjwq6eTQ8ZJS7C
         uyTXP7yyRpyY1wDj3M+ATiEKgwDQUeASy/5cAZe9RZlnaW/MwJ2QU2s1V92VaV74LR
         C1TqPzCd8b4FSaY4wUlcxRcTKJ2mzBh3CYytWM/0=
Date:   Tue, 8 Aug 2023 10:26:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Zhang Shurong <zhang_shurong@foxmail.com>, jgross@suse.com,
        xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: fix potential shift out-of-bounds in
 xenhcd_hub_control()
Message-ID: <2023080845-talisman-ravage-0b58@gregkh>
References: <tencent_15DD79B42AD8A0D64A7CDC24D4FE6C85800A@qq.com>
 <2023062628-shame-ebook-56f2@gregkh>
 <4825193.GXAFRqVoOG@localhost.localdomain>
 <tencent_942CC5C35E410E3545C2E386BE566B8B1405@qq.com>
 <2023080659-turban-exemption-1196@gregkh>
 <3481a644-1648-4fa9-86eb-2a0b86b8f47a@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3481a644-1648-4fa9-86eb-2a0b86b8f47a@rowland.harvard.edu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 06, 2023 at 11:15:51AM -0400, Alan Stern wrote:
> On Sun, Aug 06, 2023 at 04:27:27PM +0200, Greg KH wrote:
> > On Sun, Aug 06, 2023 at 10:11:43PM +0800, Zhang Shurong wrote:
> > > 在 2023年7月1日星期六 CST 下午11:51:43，Zhang Shurong 写道：
> > > > 在 2023年6月26日星期一 CST 下午1:52:02，您写道：
> > > > 
> > > > > On Mon, Jun 26, 2023 at 07:48:05AM +0200, Jan Beulich wrote:
> > > > > > On 25.06.2023 18:42, Zhang Shurong wrote:
> > > > > > > --- a/drivers/usb/host/xen-hcd.c
> > > > > > > +++ b/drivers/usb/host/xen-hcd.c
> > > > > > > @@ -456,6 +456,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd,
> > > > > > > __u16 typeReq, __u16 wValue,> >
> > > > > > > 
> > > > > > >  			info->ports[wIndex - 1].c_connection =
> > > > 
> > > > false;
> > > > 
> > > > > > >  			fallthrough;
> > > > > > >  		
> > > > > > >  		default:
> > > > > > > +			if (wValue >= 32)
> > > > > > > +				goto error;
> > > > > > > 
> > > > > > >  			info->ports[wIndex - 1].status &= ~(1
> > > > 
> > > > << wValue);
> > > > 
> > > > > > Even 31 is out of bounds (as in: UB) as long as it's 1 here rather
> > > > > > than 1u.
> > > > > 
> > > > > Why isn't the caller fixed so this type of value could never be passed
> > > > > to the hub_control callback?
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > greg k-h
> > > > 
> > > > Although I'm not knowledgeable about the USB subsystem, I've observed that
> > > > not all driver code that implements hub_control callback performs a shift
> > > > operation on wValue, and not all shift operations among them cause
> > > > problems. Therefore, I've decided to fix this issue within each driver
> > > > itself.
> > > > 
> > > > For example, in r8a66597_hub_control, it will first check whether wValue is
> > > > valid (always < 31) before the shift operation. In case of an invalid
> > > > number, the code would execute the error branch instead of the shift
> > > > operation.
> > > > 
> > > > switch (wValue) {
> > > > case USB_PORT_FEAT_ENABLE:
> > > > 	rh->port &= ~USB_PORT_STAT_POWER;
> > > > 	break;
> > > > case USB_PORT_FEAT_SUSPEND:
> > > > 	break;
> > > > case USB_PORT_FEAT_POWER:
> > > > 	r8a66597_port_power(r8a66597, port, 0);
> > > > 	break;
> > > > case USB_PORT_FEAT_C_ENABLE:
> > > > case USB_PORT_FEAT_C_SUSPEND:
> > > > case USB_PORT_FEAT_C_CONNECTION:
> > > > case USB_PORT_FEAT_C_OVER_CURRENT:
> > > > case USB_PORT_FEAT_C_RESET:
> > > > 	break;
> > > > default:
> > > > 	goto error;
> > > > }
> > > > rh->port &= ~(1 << wValue);
> > > 
> > > Hi there. I apologize for reaching out once more. I'm feeling a bit puzzled 
> > > about what my next step should be. I'm unsure whether I should rewrite this 
> > > patch or attempt to address the issue at the caller level.
> > 
> > Try addressing it at the caller level first please.  If that somehow
> > does not work, then we will take a patch series that fixes all of the
> > host controller drivers at once.
> 
> It's not feasible to fix all the callers, because the calls can come 
> from userspace via usbfs.

It can?  Hm, that happens through the call in rh_call_control(), right?
But there, we do a bunch of validation before calling hub_control() so
why can't we do the same thing in that one place as well?  Making
invalid requests from userspace should be disallowed (or we can catch
this in the usbfs interface.)

thanks,

greg k-h
