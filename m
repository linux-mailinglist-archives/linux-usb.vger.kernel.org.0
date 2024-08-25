Return-Path: <linux-usb+bounces-14064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA4995E460
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 18:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CC71C20A01
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 16:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CD71547F9;
	Sun, 25 Aug 2024 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="n3skjvhl"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA1153BEE
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724603579; cv=none; b=AAldIlhX8lq3uycMLgSaAVReEzsa/dEhx/Qqd+jX1V6qnNL3RvpNw7uw8yMjLkuUtweRP8mL2X4WkhIdUqK3+1fnh2Btq30V+4GbppNzAMcm2HRhYy8T31Nk12pD1T+UBR54iHqL4KQ0XEvyxoolJuOkq9Uht9ALrvSW6zdEeX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724603579; c=relaxed/simple;
	bh=xq8f8zD6O5kAlwoulhWL2QDmotsCqcUp9hDl+qYlL3M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpP2X1gM3vprZ0A9DMpRQDhHbvE0Ex4Uvgl2u3fU5hYHQkPYXfzhFeTA9nCnwkfKiDZq3YC6mW9VvVscgVapNu/g/AMxwb3Nwx2d1tbZ9ZiaL/NFAOMGPwkYiy09BMJNHAV5eFYZA7Gks/6AmaxBABnDxaDcDrC74/ydsMbZwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=n3skjvhl; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 375EA1249238; Sun, 25 Aug 2024 18:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1724603566; bh=xq8f8zD6O5kAlwoulhWL2QDmotsCqcUp9hDl+qYlL3M=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=n3skjvhl65uiFfGjIwEyeTab0syR0UO22Jx4o9CjIHAaZ9yfL2UlNAWAutnmmfIS4
	 Ibgi3dwvvlwzpHr5gKQJpGlNz8cnL9EvyFpjyDOGWIye4CgfnPA5UgQbTnTnH8FWBL
	 RlbU97iro90QwZqW/hh/3+/GJpb24ZpvMB34bT9XYk+9u9CU/5GIKZSlzfz19qCtRY
	 f5exc/y1u2bUx1hZdvWnf186i7/OzkqnYptgR7UFDXcjACZkLP/5hayqjira0zn3sp
	 kPIC7VxvDJnK0ipjRoSl3hrcZhvDoGHdoctgc+e3qdzbz7RYe22spUutLZQ/YWw9/z
	 94R7M57CHNJNQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 973331242081
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 18:32:38 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 8F51076CA64; Sun, 25 Aug 2024 18:32:38 +0200 (CEST)
Date: Sun, 25 Aug 2024 18:32:38 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: linux-usb@vger.kernel.org
Subject: Re: Strange issues with USB device
Message-ID: <Zstcpow2lccrx4hH@alphanet.ch>
References: <ZsjgmCjHdzck9UKd@alphanet.ch>
 <20240824084437.342426dd@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824084437.342426dd@foxbook>

Hello,

Thank you for your input.

On Sat, Aug 24, 2024 at 08:44:37AM +0200, Micha?? Pecio wrote:
> Looks like there are some stream-related xhci_hcd bugs here. You may
> have more luck with UAS disabled if you need this system working ASAP.

I did this first.  I still have regular SMART bugs every 20 minutes:

   Aug 25 17:58:35 video udisksd[896]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K7KNYR4H: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)

However, during ~6 hours of intense reading, I had only once an USB issue:

Aug 25 17:31:25 video kernel: [12176.640245] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
Aug 25 17:31:25 video kernel: [12176.727876] usb 4-1.1.4: reset SuperSpeedPlus Gen 2 USB device number 9 using xhci_hcd

No other consequence.

My next step will be, as suggested, to try the latest kernel release of today,
this time without UAS disabled.

> I am able to find the PCI adapter responsible for a USB bus like this:
> 
> $ ls -d /sys/bus/pci/devices/*/usb8
> /sys/bus/pci/devices/0000:02:00.0/usb8

$ ls -d /sys/bus/pci/devices/*/usb4
/sys/bus/pci/devices/0000:01:00.0/usb4

01:00.0 USB controller: ASMedia Technology Inc. ASM2142 USB 3.1 Host Controller
[ 1b21:2142 ] https://linux-hardware.org/?id=pci:1b21-2142-1043-8732

Have a nice day.

