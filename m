Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27C92797E5
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 10:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZIVS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 04:21:18 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33674 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726037AbgIZIVS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 04:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/jBjNyXFVcEkEmYAAIiSZtnG1IQ3YJQhHGhHXds/5fk=; b=UQDKIyHshWjdhAEc9rjixxCGug
        lOyVMw6stFqiFtOtl9tvlzoBIxIXRElOKl7zk/R79P+kGaDl8ZUKM7/alB4L2N5gOW9QGOujQLbVk
        uvwY5eV+ZmzMeLKsjtdP4wQR7uykUteet2VfWMWmlNlpntU9vS6uph1jVsis9Vmg2HR8=;
Received: from [94.26.108.4] (helo=karbon)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kM5SB-000376-3X; Sat, 26 Sep 2020 11:21:11 +0300
Date:   Sat, 26 Sep 2020 11:21:08 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 1/2] net: pegasus: convert control messages to the new
 send/recv scheme.
Message-ID: <20200926082108.GA6770@karbon>
References: <20200925143730.GA3111407@kroah.com>
 <20200925160200.4364-1-petkan@nucleusys.com>
 <20200925160200.4364-2-petkan@nucleusys.com>
 <20200926054457.GC631346@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926054457.GC631346@kroah.com>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "zztop.nucleusys.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 20-09-26 07:44:57, Greg KH wrote: > On Fri, Sep 25, 2020
    at 07:01:59PM +0300, Petko Manolov wrote: > > From: Petko Manolov <petko.manolov@konsulko.com>
    > > > > Move all control transfers to safer u [...] 
 Content analysis details:   (-1.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-26 07:44:57, Greg KH wrote:
> On Fri, Sep 25, 2020 at 07:01:59PM +0300, Petko Manolov wrote:
> > From: Petko Manolov <petko.manolov@konsulko.com>
> > 
> > Move all control transfers to safer usb_control_msg_send/recv() API.
> 
> This says _what_ the patch does, but we can see that from the diff.  You
> should describe _why_ we are doing what we are doing, so that everyone
> understands the need for the change.

Didn't want to parrot the reason for usb_control_msg_send/recv() existence, but 
i guess you're right.  5 years from now i would not remember anything. :)

> >  static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
> >  {
> > -	u8 *buf;
> > -	int ret;
> > -
> > -	buf = kmemdup(&data, 1, GFP_NOIO);
> > -	if (!buf)
> > -		return -ENOMEM;
> > -
> > -	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
> > -			      PEGASUS_REQ_SET_REG, PEGASUS_REQT_WRITE, data,
> > -			      indx, buf, 1, 1000);
> > -	if (ret < 0)
> > -		netif_dbg(pegasus, drv, pegasus->net,
> > -			  "%s returned %d\n", __func__, ret);
> > -	kfree(buf);
> > -	return ret;
> > +	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REG,
> > +			            PEGASUS_REQT_WRITE, data, indx, &data, 1,
> > +				    1000, GFP_NOIO);
> >  }
> 
> Again, why isn't set_register() now rewritten to just be:
> 
> static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
> {
> 	return set_registers(pegasus, indx, 1, data);
> }
> 
> Much easier to show that it's all converted properly :)

There's a catch - adm8511-based devices can only write to a single register via 
specific control request.  This request expects the register number in wIndex 
and the value in wValue.  A bit of a brain fart which is fixed in adm8515.

Admittedly, I could open code set_register() and avoid a kmemdup() call since in 
this case 'data' is going to be NULL.  However, set_register() isn't heavily 
used, except for the setup phase, so i went for the prettier/simpler approach.  
Which reminds me that i should put a comment explaining why is that.


cheers,
Petko
