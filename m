Return-Path: <linux-usb+bounces-3973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C180D11C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 17:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953351C21238
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 16:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5087A4C632;
	Mon, 11 Dec 2023 16:22:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 1C1E995
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 08:21:57 -0800 (PST)
Received: (qmail 134870 invoked by uid 1000); 11 Dec 2023 11:21:56 -0500
Date: Mon, 11 Dec 2023 11:21:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Christian Eggers <ceggers@arri.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  Oliver Neukum <oneukum@suse.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 1/3] USB: core: Unite old scheme and new
 scheme descriptor reads
Message-ID: <c89fa5da-171f-48cc-ac9a-7949c45b5e54@rowland.harvard.edu>
References: <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu>
 <22131556.EfDdHjke4D@n95hx1g2>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22131556.EfDdHjke4D@n95hx1g2>

On Mon, Dec 11, 2023 at 11:40:38AM +0100, Christian Eggers wrote:
> Last week I upgraded within the 5.15-stable branch. Since upstream commit
> 85d07c556216 ("USB: core: Unite old scheme and new scheme descriptor reads"),
> there are problems detecting a directly attached USB hub. I identified this
> commit by bisecting and get the same result during upgrading within the 6.1-stable
> branch.
> 
> Hardware: ARMv7 NXP i.MX6ULL with directly attached USB hub (Microchip USB4916).
> Log messages:
> 
> [    6.150881] usb 1-1: new high-speed USB device number 2 using ci_hdrc
> [    6.215484] usb 1-1: device descriptor read/8, error -71
> [    6.377532] usb 1-1: device descriptor read/8, error -71

Is the old_scheme_first module parameter for the usbcore module set?  

That and the USB_PORT_QUIRK_OLD_SCHEME are the only things I can see 
which would cause those errors -- and apparently this quirk never gets 
set in current kernels.

In particular, I'm not aware of anything in the commit which would cause 
this sort of change in behavior.

> [    6.581934] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> [    6.642853] usb 1-1: device descriptor read/8, error -71
> [    6.803355] usb 1-1: device descriptor read/8, error -71
> [    6.920418] usb usb1-port1: attempt power cycle
> [    7.051419] usb 1-1: new high-speed USB device number 4 using ci_hdrc
> [    7.192320] usb 1-1: New USB device found, idVendor=0424, idProduct=4916, bcdDevice= 8.02
> [    7.192348] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    7.192363] usb 1-1: Product: Orbiter USB hub
> [    7.192376] usb 1-1: Manufacturer: ARRI
> [    7.193263] hub 1-1:1.0: USB hub found
> [    7.193951] hub 1-1:1.0: 7 ports detected
> 
> The "device descriptor read" and "attempt power cycle" error messages definitely
> haven't been there before the commit mentioned above.

Are you certain of this?  That is, have you tried booting your current 
system with an earlier kernel?  And have you tried comparing logs and 
usbmon traces for kernels with and without the commit?

The very best test would be to run a kernel _at_ that commit (i.e., with 
no later commits installed) and then revert the commit and see how the 
resulting kernel behaves.  In other words, compare two kernels whose 
only difference is that one commit.

>  Disregarding the additional
> log messages, the USB hub (and its devices) seem to work.
> 
> I didn't try reverting this single commit as it seems that later changes depends
> on it.

Yeah; if there really are problems they will be fixed by updating that 
commit, not by dropping it.

Alan Stern

