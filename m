Return-Path: <linux-usb+bounces-2846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828657EA525
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 21:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 704A7B20A34
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 20:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561CA250EF;
	Mon, 13 Nov 2023 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0276E24200
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 20:58:07 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id ED479D52
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 12:58:04 -0800 (PST)
Received: (qmail 1195406 invoked by uid 1000); 13 Nov 2023 15:58:03 -0500
Date: Mon, 13 Nov 2023 15:58:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Kempf <aakempf@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <98418f3d-79d7-44e8-897b-de8e0e20f968@rowland.harvard.edu>
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
 <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
 <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>
 <ZVJ2EBlh8We2NrcF@ryzen7700x.fritz.box>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVJ2EBlh8We2NrcF@ryzen7700x.fritz.box>

On Mon, Nov 13, 2023 at 08:16:32PM +0100, Andreas Kempf wrote:
> On Sun, Nov 12, 2023 at 11:28:47AM -0500, Alan Stern wrote:
> I attached the usbmon output collected on my laptop and the lsusb -v
> output for the device (collected on the "problematic" desktop).
> As far as I can tell, the first column and the timestamp, as well as the
> bus number are different, so the following command might remove these
> parts:
> 
> sdiff <(cut -d ' ' -f 3- busdata.txt | cut -d ':' -f1,3-) \
>   <(cut -d ' ' -f 3- busdata_laptop.txt | cut -d ':' -f1,3-)
> 
> I cut the laptop file short as I started playing something which created
> a lot of data quickly.
> 
> I should say that the laptop is a few years old and slower (Thinkpad
> E485) and probably does not support the same USB versions as my desktop.

That probably doesn't make any difference.

> > I've removed the first part of the usbmon trace.  It shows an ordinary
> > device detection and enumeration.
> > 
> > > ffff888106725d40 503577493 S Co:5:002:0 s 00 09 0001 0000 0000 0
> > > ffff888106725d40 503578614 C Co:5:002:0 0 0
> > > ffff888106725d40 503578910 S Ci:5:002:0 s 80 06 0309 0409 00ff 255 <
> > > ffff888106725d40 503581615 C Ci:5:002:0 0 34 = 22033100 35004300 31004500 35004500 33003100 36003500 42003900 42003300
> > > ffff888106725d40 503581622 S Co:5:002:0 s 21 0a 0000 0000 0000 0
> > > ffff888106725d40 503583615 C Co:5:002:0 0 0
> > > ffff888106725d40 503583619 S Ci:5:002:0 s 81 06 2200 0000 004f 79 <
> > > ffff888106725d40 503587625 C Ci:5:002:0 0 79 = 050c0901 a1011600 00260100 09e909ea 09e209cd 09b509b6 09b109b3 09b409cf
> > > ffff888106725d40 503587756 S Ii:5:002:6 -115:32 64 <
> > > ffff888106725c80 503644602 S Ci:5:002:0 s 80 06 0302 0409 00ff 255 <
> > > ffff888106725c80 503646631 C Ci:5:002:0 0 34 = 22035300 6f007500 6e006400 20004200 6c006100 73007400 65007200 20004700
> > > ffff888106725c80 503646635 S Ci:5:002:0 s 80 06 0301 0409 00ff 255 <
> > > ffff888106725c80 503649624 C Ci:5:002:0 0 50 = 32034300 72006500 61007400 69007600 65002000 54006500 63006800 6e006f00
> > 
> > That part is normal also.  It shows a Set-Configuration request, HID
> > Set-Idle and Get-Report-Descriptor requests, and a few Get-Descriptor
> > requests for some strings.

This part is the same in the new usbmon trace.

> > > ffff888106725140 503649650 S Co:5:002:0 s 21 01 0100 2203 0001 1 = 01
> > 
> > I don't recognize this request.  It's probably a USB audio thing.  Its
> > most notable aspect is that the device doesn't send a reply.  Maybe it
> > gets confused?

This request is also the same.  But in the new usbmon trace, the device 
sends a reply almost immediately (under 1 microsecond).

So there's no difference in the data being sent back and forth on the 
two systems. The difference must lie somewhere else, and available power 
is a likely candidate.

If you decide that you don't want to pursue this any farther because
it evidently isn't caused by a software bug, let us know.

Alan Stern


