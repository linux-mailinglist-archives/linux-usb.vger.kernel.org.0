Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6B646BF02
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 16:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhLGPTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 10:19:22 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:38968 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhLGPTW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 10:19:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AFA97B8181B
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 15:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38D4C341C1;
        Tue,  7 Dec 2021 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638890149;
        bh=bo9XQDcZjJpM35NuTmZ4xB9NHpn58lVEbZZKNoWRdYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K5KpxdZCqZosO5TGF9GKDayf7tojRMxmJb96hGwNzXfLNVGWVHDZVjAkE0Q4cbVv+
         3kaINfXJXRucn24r/1olqp60TCVMZ1d0sk8okyTwP4CTcJHxsPSG6Nx3Jjo6wqTNki
         WXLFtMgm4U+ByKfCBJZuhKGOTO9uPBUks6Z2dCjk=
Date:   Tue, 7 Dec 2021 16:15:46 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Chugh, Sanjeev" <Sanjeev_Chugh@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
 release
Message-ID: <Ya96omTSiwDNoRu5@kroah.com>
References: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
 <YaoS3RoqkGkf6NFa@kroah.com>
 <361b7459f1d64f5e8b7bccaa2dd536e5@svr-ies-mbx-01.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <361b7459f1d64f5e8b7bccaa2dd536e5@svr-ies-mbx-01.mgc.mentorg.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 07, 2021 at 05:54:06AM +0000, Chugh, Sanjeev wrote:
> Hello Greg,
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Friday, December 3, 2021 6:22 PM
> > To: Chugh, Sanjeev <Sanjeev_Chugh@mentor.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: Re: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex
> > release
> > 
> > On Wed, Dec 01, 2021 at 06:28:08AM +0530, Sanjeev Chugh wrote:
> > > Rogue usb sticks can cause endless port connect change events due to
> > > unstable electric connection between usb chip and the port. Port
> > > connect change will cause device enumeration for the new device
> > > connection and new device processing is done with the usb hub mutex
> > > acquired. This can cause very short time gap between unlock/lock of
> > > hub device mutex. So if some thread is running at low priority than
> > > hub_thread, it can face hub device mutex starvation.
> > >
> > > This commit introduces a sleep of 25ms after the hub device mutex is
> > > unlocked in hub_events so that if hub_thread is stuck in a endless
> > > loop, all other threads will get fair amount of chance to acquire the
> > > usb hub mutex.
> > >
> > > Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
> > > ---
> > >  drivers/usb/core/hub.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c index
> > > 00070a8..0be2acc 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -5763,6 +5763,17 @@ static void hub_event(struct work_struct *work)
> > >  out_hdev_lock:
> > >  	usb_unlock_device(hdev);
> > >
> > > +	/*
> > > +	 * Rogue usb sticks can cause endless device connection
> > > +	 * events due to unstable electric connection.
> > 
> > What is a "usb stick"?  Any usb device could cause this, right?
> 
> In my test case, I have used a usb pen drive of Sandisk Make of 32 GB capacity. But yes, any faulty usb device or even faulty usb cable used for the usb device connection can cause this issue.
> > 
> > > This
> > > +	 * can cause very short time gap between unlock/lock
> > > +	 * of hub device mutex thus causing mutex starvation
> > > +	 * for some other lower priority thread. Thus sleep
> > > +	 * would give fair chance to all other threads to
> > > +	 * acquire the usb hub mutex.
> > > +	 */
> > > +	msleep(25);
> > 
> > What normal code path did you just slow down here?  Why not slow down the
> > disconnect path instead of the connect path?
> > 
> In case of faulty usb device, USB device enumeration doesn't succeed at all and comes out of hub_port_init() from a failure path. There is no device disconnection path in this flow. Therefore, this delay is added after hub_port_connect_change() is done trying to handle the port connect change event.

So you are going to slow down all valid devices just to handle the fact
that an abusive device can cause the system to slow down?

What exactly is the problem if you plug in an abusive device, that you
are trying to solve?  Is the system still supposed to be running
properly?  Why not just remove the device or disable the port when
detected?

thanks,

greg k-h
