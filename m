Return-Path: <linux-usb+bounces-14731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0C96E1CB
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F2A28916C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 18:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4B717BEB7;
	Thu,  5 Sep 2024 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="JQf8vrw2"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972114F125
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 18:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725560449; cv=none; b=aVKvAAAJ0kq8YrPAOZys7QbLD2NazjawcPxMlk/lLmZeGSX9FP/Wt6CZ7eFOwDc2w2cEixr2yIcKC4eytOqBLra+VWQBAGYkSvKAfnfda1tq7A3vugRaM/dSAZPppPayC0OrMN+aVGhxi47QBB3ydxhyE9iAxRvrwY0VPpFFyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725560449; c=relaxed/simple;
	bh=vvpjCqetMAG88+kL6LLSUSVjybBMjcEHFITLiAYjhzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3hgTHr7J5DOiAucA3w0rJ3RDbRvPaa9/9ALWNU/Lz0VUDVk69/pIrNBxAtvdV7Acz6xl3NRqaXkWrhTEv/D/pONIpxfCbfJ02l/8d1+KWKRt+EQFWGSu4FgbycXPcFMI2FEDRJrAiU2IBENxjtMgCCe/KyOSdmedbmQSnGWqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=JQf8vrw2; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id BBC891241E8F; Thu,  5 Sep 2024 20:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725560443; bh=vvpjCqetMAG88+kL6LLSUSVjybBMjcEHFITLiAYjhzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQf8vrw2QJVnMNh+tdYcxya89mD4ZyjULSCe1OW+YqzDs7RCNaulE5FAu8WkIThzw
	 5uOEVLfkmcxMz0F9GS1IrY8F17QBFmDXFU62OHsEG/HMoxhZRDe6Qspd6GrfRdBndk
	 BrSktcJTVtuYKt0qEXURnzQ0QM0WuRQe1ai7ZFlVNhHOl9G0ZwfEViQAlcIfkI8ilc
	 QKoEwrVXHwHJMQ3zEBPeNDxtfNuC4sBu8ZYobdPF/036VnaHKUJ+6rYI0Iigf1LwwI
	 3n60/iUt8GHXFRzu5GShFg9ZJWq+0FXID5QFDdBuKJyvq7mcyAXhrXIwm0UkmNbm8+
	 /ZDW9wLooxS2g==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 1EF1B1240E99;
	Thu,  5 Sep 2024 20:20:22 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 14A9A76C9FE; Thu,  5 Sep 2024 20:20:22 +0200 (CEST)
Date: Thu, 5 Sep 2024 20:20:22 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <Ztn2ZsPtxmCTiR78@alphanet.ch>
References: <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch>
 <ZtnI57FYnoz1xKxF@alphanet.ch>
 <ZtnpOfv2qXCUy5/i@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtnpOfv2qXCUy5/i@alphanet.ch>

On Thu, Sep 05, 2024 at 07:24:09PM +0200, Marc SCHAEFER wrote:
> [11439.415660] xhci_hcd 0000:01:00.0: Cancel URB 0000000016ac95a1, dev 1.1.2, ep 0x87, stream_id 2 starting at offset 0x125ba20
> [11439.506778] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
> [11439.554356] scsi host16: uas_eh_device_reset_handler success

will be the last for today, I need to switch that system off; tell me if you need more testing in the next days,
or if you want me to try another patch.

[12008.284174] xhci_hcd 0000:01:00.0: Cancel URB 0000000090b5176d, dev 1.1.1, ep 0x85, stream_id 4 starting at offset 0xd9968570
[12008.304987] xhci_hcd 0000:01:00.0: Cancel URB 000000002e91894e, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd996d3b0
[12008.455398] xhci_hcd 0000:01:00.0: Cancel URB 000000005dc3cf7a, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cbbd0
[12008.655053] xhci_hcd 0000:01:00.0: Cancel URB 00000000bf6df69e, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x12462c0
[12608.587299] xhci_hcd 0000:01:00.0: Cancel URB 000000000bba8481, dev 1.1.4, ep 0x85, stream_id 2 starting at offset 0x12c8160
[12608.710654] xhci_hcd 0000:01:00.0: Cancel URB 0000000081721183, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x124b320
[12608.769588] xhci_hcd 0000:01:00.0: Cancel URB 000000003b126d1a, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124d3f0
[13208.378251] xhci_hcd 0000:01:00.0: Cancel URB 00000000660f02e0, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd996eb90
[13208.510815] xhci_hcd 0000:01:00.0: Cancel URB 0000000041b8cbc4, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12caf70
[13208.520577] xhci_hcd 0000:01:00.0: Cancel URB 00000000631d6a7f, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124dd80
[13808.312954] xhci_hcd 0000:01:00.0: Cancel URB 0000000002d4a85e, dev 1.1.1, ep 0x85, stream_id 5 starting at offset 0xd9966f90
[13808.338110] xhci_hcd 0000:01:00.0: Cancel URB 00000000ac0cd10f, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd99693f0
[13808.491390] xhci_hcd 0000:01:00.0: Cancel URB 0000000004e1b961, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cabd0
[13808.494873] xhci_hcd 0000:01:00.0: Cancel URB 00000000bb1acc45, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cabe0
[13808.575935] xhci_hcd 0000:01:00.0: Cancel URB 0000000030c9f1cb, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124c1f0
[14408.348038] xhci_hcd 0000:01:00.0: Cancel URB 00000000660f02e0, dev 1.1.1, ep 0x85, stream_id 6 starting at offset 0xd9963ee0
[14408.405056] xhci_hcd 0000:01:00.0: Cancel URB 00000000fa1abcfb, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cafd0
[14408.536603] xhci_hcd 0000:01:00.0: Cancel URB 00000000cba223fa, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x1246a70
[14408.557641] xhci_hcd 0000:01:00.0: Cancel URB 00000000e7e45b0b, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124db30


