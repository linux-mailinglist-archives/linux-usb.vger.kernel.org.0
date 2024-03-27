Return-Path: <linux-usb+bounces-8481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C588E8EE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D4A2B2D2F7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F390D1448E4;
	Wed, 27 Mar 2024 14:21:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D34CA1369B8
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711549282; cv=none; b=ZAZUz0YyvK9X/O/noE39+MJlyMgJ7m6qF+tBIVw6XbuUjdMJJ9v4f4UCq91ZdE4dB8dFC01c3XPHYwvvV76LanUijLIj665qYmm8NBQBBIOFo98SBsNZ4QkTdPqXO2J/hsxMA3e2mHpK9GVY7FfeNzD3GBVu3yKPpDtt/u+Pweo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711549282; c=relaxed/simple;
	bh=wVZikXz90bRied4WNuk55XjnAyVLku4154DxaB2rEOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEI+/38KJfphL7kqEIOj4VWmTFXUCvz4Ex3v+3WQ8gHvINmYlNVr3RnloE4IQZdfngyeDA7tRewE0D5885+1OrBTWQZx2ti9PH0vRHij88ImL9wpJyeVn8MMEcD5f6X1k6BC0OyccpPdG/zNT7B1fgHHCSemfCagJRrEaPfds0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 927408 invoked by uid 1000); 27 Mar 2024 10:21:19 -0400
Date: Wed, 27 Mar 2024 10:21:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <62a33e61-b202-4af5-bb91-96dc87783eb3@rowland.harvard.edu>
References: <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
 <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
 <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>
 <1b2ccaf6-597c-40fe-877a-4ed1fab5261b@rowland.harvard.edu>
 <3939f491-4890-4a64-9f41-8c3bf738bbc3@sairon.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3939f491-4890-4a64-9f41-8c3bf738bbc3@sairon.cz>

On Wed, Mar 27, 2024 at 02:24:34PM +0100, Jan Čermák wrote:
> Hi Alan,
> 
> On 19. 03. 24 17:03, Alan Stern wrote:
> > Change the HUB_DEBOUNCE_TIMEOUT value to 4500, the HUB_DEBOUNCE_STEP
> > value to 250 and the HUB_DEBOUNCE_STABLE value to 2000.  That just
> > might give the device enough time to settle down and start working
> > before the computer tries using it.
> 
> sorry for the delay, I only managed to test it today. You are right, with
> the timeouts adjusted, it enumerates fine after a while, without any
> descriptor read errors or anything like that:
> 
> [  210.957371] usb 1-1.2: new full-speed USB device number 5 using ehci-pci
> [  211.037728] usb 1-1.2: New USB device found, idVendor=0658,
> idProduct=0200, bcdDevice= 0.00
> [  211.037747] usb 1-1.2: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [  211.039764] cdc_acm 1-1.2:1.0: ttyACM0: USB ACM device

Great!

> If it's worth anything, usbmon trace is attached below. Anyway, do you have
> any ideas what could be done to make it work without doing any detrimental
> changes? I was thinking I'll try to reach out to the vendor at this point -
> they should be aware their device might stop working with recent kernels,
> and they could explain the quirky behavior, or implement any changes on the
> firmware side (if it's even possible).

The ideal solution would be if the vendor updates the firmware to
prevent the device from turning on its pull-up (thereby telling the
host computer that it is connected to the bus) until it is ready to
operate.  There's no good reason to have that > 1-second period during
which the device claims to be connected but does not work.

Another possible solution, a lot less attractive, would be to change
the initialization code in the hub driver so that if it sees the
device disconnect itself from the bus, it restarts the entire
procedure from the beginning.  You'd end up getting a bunch of error
messages during the initial non-working period, just as you do now,
but afterwards the device should be detected and initialized okay.

Alan Stern

