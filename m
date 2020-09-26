Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53FB2798E6
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 14:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZMo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 08:44:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZMo4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 26 Sep 2020 08:44:56 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15DF3221EC;
        Sat, 26 Sep 2020 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601124295;
        bh=+OEP5X4kG2TTtg9OUnUV8rjYjEcCuBfsH8+UdTJYDPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IpZGXisvxLd2SBg3AeOQf7gm7Z5S9+jTWidsz/1aKWwRomF75nD0I/pNqKnYD7VWa
         PAyxw8+tEFt2W4S/dWwwVT1YbzHE5Adr8ena7cXHNgGvDLBk/J/uM8AuM+7zXb/ZTn
         aVwE/l6fEAC0rOS0NUmuqeKBKByRGCzxMOIoEIk0=
Date:   Sat, 26 Sep 2020 14:45:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Petko Manolov <petkan@nucleusys.com>
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 1/2] net: pegasus: convert control messages to the new
 send/recv scheme.
Message-ID: <20200926124507.GA3321471@kroah.com>
References: <20200925143730.GA3111407@kroah.com>
 <20200925160200.4364-1-petkan@nucleusys.com>
 <20200925160200.4364-2-petkan@nucleusys.com>
 <20200926054457.GC631346@kroah.com>
 <20200926082108.GA6770@karbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926082108.GA6770@karbon>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 26, 2020 at 11:21:08AM +0300, Petko Manolov wrote:
> On 20-09-26 07:44:57, Greg KH wrote:
> > On Fri, Sep 25, 2020 at 07:01:59PM +0300, Petko Manolov wrote:
> > > From: Petko Manolov <petko.manolov@konsulko.com>
> > > 
> > > Move all control transfers to safer usb_control_msg_send/recv() API.
> > 
> > This says _what_ the patch does, but we can see that from the diff.  You
> > should describe _why_ we are doing what we are doing, so that everyone
> > understands the need for the change.
> 
> Didn't want to parrot the reason for usb_control_msg_send/recv() existence, but 
> i guess you're right.  5 years from now i would not remember anything. :)
> 
> > >  static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
> > >  {
> > > -	u8 *buf;
> > > -	int ret;
> > > -
> > > -	buf = kmemdup(&data, 1, GFP_NOIO);
> > > -	if (!buf)
> > > -		return -ENOMEM;
> > > -
> > > -	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
> > > -			      PEGASUS_REQ_SET_REG, PEGASUS_REQT_WRITE, data,
> > > -			      indx, buf, 1, 1000);
> > > -	if (ret < 0)
> > > -		netif_dbg(pegasus, drv, pegasus->net,
> > > -			  "%s returned %d\n", __func__, ret);
> > > -	kfree(buf);
> > > -	return ret;
> > > +	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REG,
> > > +			            PEGASUS_REQT_WRITE, data, indx, &data, 1,
> > > +				    1000, GFP_NOIO);
> > >  }
> > 
> > Again, why isn't set_register() now rewritten to just be:
> > 
> > static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
> > {
> > 	return set_registers(pegasus, indx, 1, data);
> > }
> > 
> > Much easier to show that it's all converted properly :)
> 
> There's a catch - adm8511-based devices can only write to a single register via 
> specific control request.  This request expects the register number in wIndex 
> and the value in wValue.  A bit of a brain fart which is fixed in adm8515.

Ah, I missed that, good catch, sorry about that.

greg k-h
