Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8548625AEB0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 17:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgIBPWK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 11:22:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgIBPV1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 11:21:27 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EADBB20767;
        Wed,  2 Sep 2020 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599060086;
        bh=x3POqbn4b/hj4C4s0Hk+zf9rTRiYWs7wlVg18R4VMcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q+zfeqOR+6hdjoTVnVBLGhd8rHUGFE0NW2iqszVvebJ6RN7fOjeJ9cbCJm8RJFvFj
         xLJfjWXjni//s3sYQxALkrMTfpdpKnCC6TVeC0gPIy18dZyCtjQEVUFnOAp8OIj8Bt
         nL0PMy9kYEOiLpMAwsIIX0r/wXP85mGZBdf6ZENw=
Date:   Wed, 2 Sep 2020 17:21:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        stern@rowland.harvard.ed, linux-kernel@vger.kernel.org,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 04/10] USB: core: hub.c: use usb_control_msg_send() in a
 few places
Message-ID: <20200902152151.GA2032878@kroah.com>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-5-gregkh@linuxfoundation.org>
 <20200902145701.GA624583@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902145701.GA624583@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 02, 2020 at 10:57:01AM -0400, Alan Stern wrote:
> On Wed, Sep 02, 2020 at 01:01:06PM +0200, Greg Kroah-Hartman wrote:
> > There are a few calls to usb_control_msg() that can be converted to use
> > usb_control_msg_send() instead, so do that in order to make the error
> > checking a bit simpler and the code smaller.
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> One problem in this patch...
> 
> > @@ -3896,27 +3875,14 @@ static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
> >  	if (u2_pel > USB3_LPM_MAX_U2_SEL_PEL)
> >  		u2_pel = USB3_LPM_MAX_U2_SEL_PEL;
> >  
> > -	/*
> > -	 * usb_enable_lpm() can be called as part of a failed device reset,
> > -	 * which may be initiated by an error path of a mass storage driver.
> > -	 * Therefore, use GFP_NOIO.
> > -	 */
> > -	sel_values = kmalloc(sizeof *(sel_values), GFP_NOIO);
> > -	if (!sel_values)
> > -		return -ENOMEM;
> > -
> > -	sel_values->u1_sel = u1_sel;
> > -	sel_values->u1_pel = u1_pel;
> > -	sel_values->u2_sel = cpu_to_le16(u2_sel);
> > -	sel_values->u2_pel = cpu_to_le16(u2_pel);
> > +	sel_values.u1_sel = u1_sel;
> > +	sel_values.u1_pel = u1_pel;
> > +	sel_values.u2_sel = cpu_to_le16(u2_sel);
> > +	sel_values.u2_pel = cpu_to_le16(u2_pel);
> >  
> > -	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> > -			USB_REQ_SET_SEL,
> > -			USB_RECIP_DEVICE,
> > -			0, 0,
> > -			sel_values, sizeof *(sel_values),
> > -			USB_CTRL_SET_TIMEOUT);
> > -	kfree(sel_values);
> > +	ret = usb_control_msg_send(udev, 0, USB_REQ_SET_SEL, USB_RECIP_DEVICE,
> > +				   0, 0, &sel_values, sizeof(sel_values),
> > +				   USB_CTRL_SET_TIMEOUT);
> 
> This effectively changes GFP_NOIO to GFP_KERNEL.  Probably you should
> leave this particular call alone.

I thought about that, but for some reason thought that usb_control_msg()
would eventually call for an allocation with GFP_KERNEL, but I was
wrong, usb_internal_control_msg() calls usb_alloc_urb() with GFP_NOIO,
my fault.  I'll go fix this up, thanks for the review.

greg k-h
