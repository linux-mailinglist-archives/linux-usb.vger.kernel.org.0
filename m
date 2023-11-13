Return-Path: <linux-usb+bounces-2836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B17EA2C5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 19:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A30280EA6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 18:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2938222F06;
	Mon, 13 Nov 2023 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92328224F1
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 18:23:34 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id BCD84D59
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 10:23:31 -0800 (PST)
Received: (qmail 1190331 invoked by uid 1000); 13 Nov 2023 13:23:28 -0500
Date: Mon, 13 Nov 2023 13:23:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Kempf <aakempf@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <996cb993-447a-41f0-a9c6-5ff37c360746@rowland.harvard.edu>
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
 <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
 <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>

On Sun, Nov 12, 2023 at 11:28:47AM -0500, Alan Stern wrote:
> On Sun, Nov 12, 2023 at 12:03:42PM +0100, Andreas Kempf wrote:
> > This whole issue is extremely confusing to me as I cannot really figure
> > out a pattern. Today I tried the following:
> > - I plugged the device in on Linux: issue occurred
> > - I plugged the device into a different port on the same machine on
> >   Linux: issue occurred.
> > - I plugged the device into an Android phone: played audio immediately
> > - I plugged the device into a Laptop running Arch on 6.6.1: played audio
> >   immediately (?!)

> > - I booted the machine on Linux with the device already plugged in:
> >   played audio immediately (?!)
> > - I booted Windows and plugged in the device: played audio immediately
> > - I plugged a keyboard and a mouse into the port: no issues
> 
> Yeah, it's really hard to tell what's happening.

Here's a thought: Maybe the problem is caused by insufficient power.  
That could easily explain the odd behavior you see (some computers can 
provide more USB power than others; the power available over a USB 
connection may vary with time; the device's audio functions might 
require more power than the simple USB functions used for enumeration).

Is the Sound Blaster card powered solely by its USB connection?  If it 
is, you could try connecting to the computer via a powered hub.  A 
powered hub should provide plenty of power over its downstream USB 
ports.

Alan Stern

