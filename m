Return-Path: <linux-usb+bounces-3519-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C57FF922
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 19:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51541C20EF6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 18:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F3559163;
	Thu, 30 Nov 2023 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 7AD651B3
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 10:13:29 -0800 (PST)
Received: (qmail 256744 invoked by uid 1000); 30 Nov 2023 13:13:28 -0500
Date: Thu, 30 Nov 2023 13:13:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
  linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  netdev@vger.kernel.org, oneukum@suse.com, pabeni@redhat.com
Subject: Re: [PATCH] net: usb: ax88179_178a: avoid failed operations when
 device is disconnected
Message-ID: <e8e4ac26-9168-452c-80bc-f32904808cc9@rowland.harvard.edu>
References: <e2faf901-84de-41ad-804d-6c86bc304ef1@rowland.harvard.edu>
 <20231130172525.193069-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130172525.193069-1-jtornosm@redhat.com>

On Thu, Nov 30, 2023 at 06:25:21PM +0100, Jose Ignacio Tornos Martinez wrote:
> Hi Alan,
> 
> Thank you again for you comments.
> 
> > What are these unnecessary operations?
> Sorry if I was not clear, I was referring to the reading and writing 
> operations that are commanded within stop and unbind driver functions.
> This operations are necessary if we unbind to get the device stopped in
> a known state but if the device is detached, they are failing and imho
> they are not necessary. That is the reason why I was trying to detect 
> when the device is really disconnected, to allow sending commands only
> if the device was still connected. 
> 
> > In general, drivers should treat "unbind" the same as "disconnect" (in
> > both cases, the ->disconnect() routine is called).  If a driver tries to
> > send commands to the device while the disconnect routine is running, it
> > should expect that they might fail and not generate an error message if
> > they do.
> >
> > (Also, note that the USB core will allow a driver to send commands to
> > the device during unbind only if the .soft_unbind flag is set in the
> > usb_driver structure.)
> >
> > And in any case, a driver should _never_ try to communicate with the
> > device after the disconnect routine has returned.
> Ok, understood, very helpful clarification.
> In any case, I was referring to the internal operations during stop and
> unbind. And if any failed operations are commanded before and after
> disconnection (if any), try to detect with the warning to be sure if there
> is any problem.
> 
> I have checked that other drivers are using USB_STATE_NOTATTACHED to check
> and confirm the device disconnection. And I am trying to analyze other 
> drivers to check if this can be done in another way. 
> If I use -ENODEV as Oliver suggested, I think I wouldn't know if the device
> is disconnected previous to any operation. But maybe this is the way.

I see.  Your approach isn't all that bad.

Another possibility would be to have the unbind routine set a flag in 
the private data structure, and then make the ax88179_write_cmd() and 
ax88179_read_cmd() routines avoid printing error messages if the flag is 
set.  Or don't bother with the flag, and simply make the routines skip 
printing an error message if a transfer fails with error code -ENODEV.

Alan Stern

