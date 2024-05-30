Return-Path: <linux-usb+bounces-10702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429E8D5255
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 21:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA211C22E5D
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 19:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138AA14B978;
	Thu, 30 May 2024 19:30:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 8DDD1135A7E
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097400; cv=none; b=OpoKB5ZISoAHRwaWm/wCpBTapffQe0badawM1Pj9HndZZ6Ly9Xb6G9ktQWug5PNPdzvmfZCrk/2Rih9qI8mbm6EwjLwBbF3pPI/utz/KR7qv/6H207k8X1Lq/otdbQfYM08euEsaApv9qH68R4sxD+tY4oRYG91maWKt4EimY14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097400; c=relaxed/simple;
	bh=5RqQqepqqf6bWmt9zKJed1n2+mqr7b6YhlzMVTRM5EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLV0JULhmB4vsMfucpUH90bKiS3GwNaKNhw3VKsYC4K92CTIW5dvxwGOVEwdd2Au7grrw6/JmZMjVw9aT0TiBbfScB+jw/D36HtOB0/WHWxaJG0wMwoha6zFTesAZ32wZkj8Mknq3ayO1t0IbwIKxK2jcfz1l984PmtWzShRkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 15199 invoked by uid 1000); 30 May 2024 15:29:57 -0400
Date: Thu, 30 May 2024 15:29:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB: Issue with WASD keyboard connected through Lenovo docking
 station on resume
Message-ID: <f9ab729b-9e0d-48e6-932d-95b3e11323ec@rowland.harvard.edu>
References: <8046886e-2e13-4cdc-844e-6a0c1a00c381@efficios.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8046886e-2e13-4cdc-844e-6a0c1a00c381@efficios.com>

On Wed, May 29, 2024 at 03:20:37PM -0400, Mathieu Desnoyers wrote:
> Hi Greg,
> 
> I've been having issues with my WASD keyboard since I've had my T14s
> Lenovo laptop (about 1 year). I thought it would eventually solve itself
> magically, but it appears that drivers have not developed self-healing
> capabilities yet. I'm now investigating to find the culprit and I would
> welcome some pointers.
> 
> What does not work:
> 
> - On a Debian kernel 6.6.13+bpo-amd64 (but had this issue for a while
>   on prior kernels as well),
> - WASD keyboard is plugged through a ThinkPad Unversal USB-C Dock v2,
> - Laptop (Thinkpad T14s) goes to sleep by unplugging the USB-C cable
>   between laptop and dock,
> - Laptop is resumed by plugging back USB-C cable between laptop and
>   dock.
> 
> Most of the times (but not always), the keyboard does not come up and
> I have to physically unplug the keyboard from the dock and plug it again.
> The keyboard is a legacy USB device: Bus 009 Device 108: ID 04d9:0169
> Holtek Semiconductor, Inc. Keyboard, as shown in the lsusbvvv.txt output
> taken when the keyboard works (see attached).
> 
> I'm also providing the lsusbvvv-fail.txt output which shows the state
> when the keyboard fails to work (see attached).
> 
> This seems to work fine on resume if I plug the keyboard directly into
> the laptop USB port.
> 
> I have attached the suspend/resume sequence dmesg log from two cases:
> 
> - success is when the keyboard is connected to the laptop USB port,
> - fail is when the keyboard is connected through the dock.
> 
> The following lines from the failed dmesg are interesting:
> 
> [537001.699412] usb 9-1.1.3.2: new low-speed USB device number 103 using xhci_hcd
> [537001.831646] usb 9-1.1.3.2: device descriptor read/64, error -32
> [537002.079982] usb 9-1.1.3.2: device descriptor read/64, error -32
> [537002.319449] usb 9-1.1.3.2: new low-speed USB device number 104 using xhci_hcd
> [537002.451522] usb 9-1.1.3.2: device descriptor read/64, error -32
> [537002.692000] usb 9-1.1.3.2: device descriptor read/64, error -32
> [537002.800394] usb 9-1.1.3-port2: attempt power cycle
> 
> AFAIU, error -32 points to negative EPIPE.
> 
> Let me know if there is additional information I can collect to help diagnosing,
> or configuration tweaks I can try. The problem reproduces easily, to getting more
> data should not be an issue.

It sounds like the hub that the keyboard is plugged into on the dock 
doesn't work right all the time.  You could try plugging the keyboard 
into a different hub (interpose one between it and the dock if necessary 
-- or for that matter, interpose one between it and the laptop, 
bypassing the dock).

Alan Stern

