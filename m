Return-Path: <linux-usb+bounces-14568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08538969F68
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98771F23D24
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CCE1CA6AD;
	Tue,  3 Sep 2024 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="iQ0sun4Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08279EA
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371585; cv=none; b=ReGmzA08Kn3GodKvYQpFxuFxwFA9W9FcqqM7AEI9Fjb7tKUlQqidHeYYPNKkqcU2BZN7zVsr76waYkBzCfBwsPEAah2VievivNWkMhMna4Ss5o56PAihE2PpgA9wmuTQ/9du9k5/6xRGCFesex6wc4n3rQjYuSnKaSHbANbdjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371585; c=relaxed/simple;
	bh=cvBLhzBr3woUyEwAwZjD75qq021opmH+Mx2r5LZtXqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9N3uf2vNVurMXW0LTqa/eQkhv4lKihX4nOFN9UT2nWitTRmJB/g+oRoMmfLKO4tTXv66kIsprzMnlUMBFnIxdeO3V5BZRUrx2oCHIpTv0HtGlKtsOo416s4JQu4HXS6XH7ynAQ8uEsLplrjgpZ2/tbNoWu1/I0BEFYQUA/f/J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=iQ0sun4Z; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id F3FEE1242069; Tue,  3 Sep 2024 15:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725371580; bh=cvBLhzBr3woUyEwAwZjD75qq021opmH+Mx2r5LZtXqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQ0sun4ZUZdAf6VdnLyyzycNn9hZkaHZPNwJaV7T3YUF0wsTa35FrgeAT87I4Oifh
	 XYVN5IyQvTiDcxPYB3Vq3jKM8tRb474G0qaavqPJ/QTdTL1ClZeoN0sB511PtP9zWQ
	 CM4ChaDkXnGZftl83VRf2SchH87lkZe9fv/+5QR9y0X+jRfDZ1sPLqwK8Iv2QWUnYo
	 pqxSao/BdEO1aXi4oTtI99C0SPJoR5NGgYWhptGvPpCnYTMFwzh6EqfRsGXjUXqpM1
	 6BNBOwwiZ0xCqXL+0AbR7DJMD2hKqE4THhVAZO1dyETUI/7uOlRWcod0/IFat8ikzs
	 KzrSHVz6v0tZg==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id C6BAA12414A2;
	Tue,  3 Sep 2024 15:52:43 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id AF11F76D139; Tue,  3 Sep 2024 15:52:43 +0200 (CEST)
Date: Tue, 3 Sep 2024 15:52:43 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Micha?? Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtcUq37F6gqgzifm@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
 <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch>
 <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtcUGe0FWxpO6058@alphanet.ch>

On Tue, Sep 03, 2024 at 03:50:17PM +0200, Marc SCHAEFER wrote:
> Just patched as instructed & recompiled & re-run the same test, probably won't
> hear from me for the next few hours.
> 
> Sep  3 15:49:32 video kernel: [  110.660593] md: check of RAID array md0

Well:

Sep  3 15:50:43 video kernel: [  181.320257] sd 15:0:0:0: [sdb] tag#5 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN 
Sep  3 15:50:43 video kernel: [  181.320268] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 00 d5 10 00 00 00 04 00 00 00
Sep  3 15:50:43 video kernel: [  181.321080] sd 15:0:0:0: [sdb] tag#4 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN 
Sep  3 15:50:43 video kernel: [  181.321088] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:50:43 video kernel: [  181.321897] sd 15:0:0:0: [sdb] tag#3 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN 
Sep  3 15:50:43 video kernel: [  181.321905] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 14 00 00 00 04 00 00 00
Sep  3 15:50:43 video kernel: [  181.322675] sd 15:0:0:0: [sdb] tag#1 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN 
Sep  3 15:50:43 video kernel: [  181.322683] sd 15:0:0:0: [sdb] tag#1 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:50:43 video kernel: [  181.352247] scsi host15: uas_eh_device_reset_handler start
Sep  3 15:50:43 video kernel: [  181.444451] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 15:50:43 video kernel: [  181.491830] scsi host15: uas_eh_device_reset_handler success

Sep  3 15:51:14 video kernel: [  212.052745] scsi host15: uas_eh_device_reset_handler start
Sep  3 15:51:14 video kernel: [  212.057515] sd 15:0:0:0: [sdb] tag#3 uas_zap_pending 0 uas-tag 3 inflight: CMD 
Sep  3 15:51:14 video kernel: [  212.057524] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 10 00 00 00 04 00 00 00
Sep  3 15:51:14 video kernel: [  212.057529] sd 15:0:0:0: [sdb] tag#4 uas_zap_pending 0 uas-tag 4 inflight: CMD 
Sep  3 15:51:14 video kernel: [  212.057531] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:51:14 video kernel: [  212.057534] sd 15:0:0:0: [sdb] tag#0 uas_zap_pending 0 uas-tag 5 inflight: CMD 
Sep  3 15:51:14 video kernel: [  212.057537] sd 15:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 d5 14 00 00 00 04 00 00 00
Sep  3 15:51:14 video kernel: [  212.057540] sd 15:0:0:0: [sdb] tag#5 uas_zap_pending 0 uas-tag 6 inflight: CMD 
Sep  3 15:51:14 video kernel: [  212.057542] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:51:14 video kernel: [  212.148874] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 15:51:14 video kernel: [  212.196890] scsi host15: uas_eh_device_reset_handler success

Sep  3 15:51:44 video kernel: [  242.757206] scsi host15: uas_eh_device_reset_handler start
Sep  3 15:51:44 video kernel: [  242.761872] sd 15:0:0:0: [sdb] tag#4 uas_zap_pending 0 uas-tag 3 inflight: CMD 
Sep  3 15:51:44 video kernel: [  242.761881] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 14 00 00 00 04 00 00 00
Sep  3 15:51:44 video kernel: [  242.761885] sd 15:0:0:0: [sdb] tag#0 uas_zap_pending 0 uas-tag 4 inflight: CMD 
Sep  3 15:51:44 video kernel: [  242.761888] sd 15:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 d5 10 00 00 00 04 00 00 00
Sep  3 15:51:44 video kernel: [  242.761891] sd 15:0:0:0: [sdb] tag#1 uas_zap_pending 0 uas-tag 5 inflight: CMD 
Sep  3 15:51:44 video kernel: [  242.761893] sd 15:0:0:0: [sdb] tag#1 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:51:44 video kernel: [  242.761896] sd 15:0:0:0: [sdb] tag#5 uas_zap_pending 0 uas-tag 6 inflight: CMD 
Sep  3 15:51:44 video kernel: [  242.761898] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:51:44 video kernel: [  242.853347] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 15:51:44 video kernel: [  242.901194] scsi host15: uas_eh_device_reset_handler success

Sep  3 15:52:15 video kernel: [  273.493674] scsi host15: uas_eh_device_reset_handler start
Sep  3 15:52:15 video kernel: [  273.498377] sd 15:0:0:0: [sdb] tag#3 uas_zap_pending 0 uas-tag 3 inflight: CMD 
Sep  3 15:52:15 video kernel: [  273.498387] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 00 d5 10 00 00 00 04 00 00 00
Sep  3 15:52:15 video kernel: [  273.498391] sd 15:0:0:0: [sdb] tag#4 uas_zap_pending 0 uas-tag 4 inflight: CMD 
Sep  3 15:52:15 video kernel: [  273.498394] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 00 d5 08 00 00 00 04 00 00 00
Sep  3 15:52:15 video kernel: [  273.498397] sd 15:0:0:0: [sdb] tag#0 uas_zap_pending 0 uas-tag 5 inflight: CMD 
Sep  3 15:52:15 video kernel: [  273.498399] sd 15:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 d5 14 00 00 00 04 00 00 00
Sep  3 15:52:15 video kernel: [  273.498402] sd 15:0:0:0: [sdb] tag#5 uas_zap_pending 0 uas-tag 6 inflight: CMD 
Sep  3 15:52:15 video kernel: [  273.498404] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 00 d5 0c 00 00 00 04 00 00 00
Sep  3 15:52:15 video kernel: [  273.841780] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
Sep  3 15:52:15 video kernel: [  273.889421] scsi host15: uas_eh_device_reset_handler success

