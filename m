Return-Path: <linux-usb+bounces-14725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E933796DD18
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 17:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B1C289881
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 15:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBCF1A01B7;
	Thu,  5 Sep 2024 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="eAqsCwCh"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCA2F870
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548497; cv=none; b=Js3qomoHwrFI/nCyOvMAMVwy6ZHMoy+6fm+mAk/QQbgvH1Exdan9rWzxDeMdan68Tahg0JyutxMytbT5d+TJfG5Q+rhtiKzYSKP9VqDxPMemrOuZtuep1LXCsEKyih43WR04DfanoS+cf6HULF7jualPDcLdlRqhJOz2NWxjbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548497; c=relaxed/simple;
	bh=kg1mHuNKVKpSfpemQ7kB0cvTy02UFBPIAZy9GJ/Qn3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWjcpFy4QjIRH6YkInMbgYi9JxXvju2u9Fe9KBxrqC0z5yrsnQSQOIkscoXaTfd34HKr9Pth2Y6XPGu0ifu7hMt2gtf6h+fveeChkbLtACU9YboAU/nSfYXzQbHE7hIa5S2pR+iBB0XyszIHpOv0Y1Jm5ks0Mp0qTCsVSJ934jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=eAqsCwCh; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id CB22E124439A; Thu,  5 Sep 2024 17:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725548490; bh=kg1mHuNKVKpSfpemQ7kB0cvTy02UFBPIAZy9GJ/Qn3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAqsCwChtaC7ePBpKwUlivlDQDOb1EWA30LTAdDmJfGjB7jvfNX+Yu6p96sQgVRk/
	 ePCCpop61Nmsu7Pqa56eyRd3wUxCaQBX8Zc9OZjg41u2tTzWmWL65YRkSXIO4nIYa0
	 JArAgUZDinAbFrUvyt/k0UOkGEFiFS4yI4uoJWxOz6BHwD2oflIbNhTqZlUOnEB/RS
	 zaiWQdgWv2DI56YNnVeRIVtenpdbZHuPO5DI/B2tYsHcJotAzm1dx6ry/7NDc6jpfI
	 9Q4mBemryqqqaSB4LRXsPKg57AivqHZeacPduRu8a1Mjp0dSL1a36YNUiil7GbYbld
	 I5cHAVEAuBoDg==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 7BEFF124094F;
	Thu,  5 Sep 2024 17:01:07 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 6C38176C9FE; Thu,  5 Sep 2024 17:01:07 +0200 (CEST)
Date: Thu, 5 Sep 2024 17:01:07 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtnHs8udyl6bfGdF@alphanet.ch>
References: <ZtcHOlqlQMMD4LzY@alphanet.ch>
 <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch>
 <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>

Hello,

On Thu, Sep 05, 2024 at 04:52:41PM +0300, Mathias Nyman wrote:
> From bf7bbf8dbf92dc06e108a103f5f01b3f416339da Mon Sep 17 00:00:00 2001
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> Date: Thu, 5 Sep 2024 16:20:22 +0300
> Subject: [PATCH] xhci: Debug patch: handle halted ep if TD is not found.

[  608.093834] xhci_hcd 0000:01:00.0: Cancel URB 000000000dbb6adc, dev 1.1.1, ep 0x85, stream_id 4 starting at offset 0xd99660d0
[  608.094084] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[  608.094092] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 00000000d99660e3 stream 4 slot 9 ep 11 flags C
[  608.102907] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
[  608.102917] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000d99660d0 trb-start 00000000d99660e0 trb-end 00000000d99668d0 seg-start 00000000d9966000 seg-end 00000000d9966ff0
[  608.102932] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[  615.255042] sd 15:0:0:0: [sdb] tag#1 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN 
[  615.255053] sd 15:0:0:0: [sdb] tag#1 CDB: ATA command pass through(12)/Blank a1 08 2e d0 01 00 4f c2 00 b0 00 00
[  615.255061] xhci_hcd 0000:01:00.0: Cancel URB 00000000d6ee9176, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd9964440
[  627.213658] xhci_hcd 0000:01:00.0: Cancel URB 000000003f481828, dev 1.1.1, ep 0x85, stream_id 4 starting at offset 0xd99660e0
[  627.213702] usb 3-1.1.1: stat urb: no pending cmd for uas-tag 3
[  640.087462] sd 15:0:0:0: [sdb] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN 
[  640.087473] sd 15:0:0:0: [sdb] tag#5 CDB: Read(16) 88 00 00 00 00 00 0b b1 38 00 00 00 04 00 00 00
[  640.087480] xhci_hcd 0000:01:00.0: Cancel URB 0000000023438a34, dev 1.1.1, ep 0x85, stream_id 6 starting at offset 0xd996a7a0
[  640.088192] sd 15:0:0:0: [sdb] tag#4 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN 
[  640.088196] sd 15:0:0:0: [sdb] tag#4 CDB: Read(16) 88 00 00 00 00 00 0b b1 34 00 00 00 04 00 00 00
[  640.088199] xhci_hcd 0000:01:00.0: Cancel URB 000000004a1a39e1, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd99609a0
[  640.088906] sd 15:0:0:0: [sdb] tag#3 uas_eh_abort_handler 0 uas-tag 5 inflight: IN 
[  640.088910] sd 15:0:0:0: [sdb] tag#3 CDB: Read(16) 88 00 00 00 00 00 0b b1 1c 00 00 00 04 00 00 00
[  640.088913] xhci_hcd 0000:01:00.0: Cancel URB 0000000051d05311, dev 1.1.1, ep 0x85, stream_id 5 starting at offset 0xd9968c80
[  640.089630] sd 15:0:0:0: [sdb] tag#2 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN 
[  640.089633] sd 15:0:0:0: [sdb] tag#2 CDB: Read(16) 88 00 00 00 00 00 0b b1 3c 00 00 00 04 00 00 00
[  640.089636] xhci_hcd 0000:01:00.0: Cancel URB 0000000097b7903b, dev 1.1.1, ep 0x85, stream_id 2 starting at offset 0xd9962840
[  640.111444] scsi host15: uas_eh_device_reset_handler start
[  640.111455] xhci_hcd 0000:01:00.0: Cancel URB 0000000009cd9f08, dev 1.1.1, ep 0x87, stream_id 2 starting at offset 0xd999b580
[  640.111874] xhci_hcd 0000:01:00.0: Cancel URB 000000006f25243c, dev 1.1.1, ep 0x87, stream_id 6 starting at offset 0xd9988d60
[  640.112370] xhci_hcd 0000:01:00.0: Cancel URB 00000000e23080f4, dev 1.1.1, ep 0x87, stream_id 1 starting at offset 0x121d280
[  640.203759] usb 3-1.1.1: reset SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
[  640.251136] scsi host15: uas_eh_device_reset_handler success
[  640.530396] xhci_hcd 0000:01:00.0: Cancel URB 00000000b1755fe5, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x1241110
[  640.530677] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[  640.530686] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 0000000001241123 stream 2 slot 10 ep 11 flags C
[  640.601761] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
[  640.601773] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001241110 trb-start 0000000001241120 trb-end 0000000001241910 seg-start 0000000001241000 seg-end 0000000001241ff0
[  640.601776] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[  659.704587] xhci_hcd 0000:01:00.0: Cancel URB 000000006e0f08cb, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x1241120
[  659.704641] xhci_hcd 0000:01:00.0: Cancel URB 00000000d606866e, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x1242b10
[  659.704737] xhci_hcd 0000:01:00.0: Move dq deferred: stream 3 URB 00000000d606866e
[  659.797268] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
[  670.808024] sd 16:0:0:0: [sdc] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN 
[  670.808041] sd 16:0:0:0: [sdc] tag#5 CDB: Read(16) 88 00 00 00 00 00 0b b1 e8 00 00 00 04 00 00 00
[  670.808049] xhci_hcd 0000:01:00.0: Cancel URB 00000000083b09de, dev 1.1.2, ep 0x85, stream_id 6 starting at offset 0x1249590
[  670.808671] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN 
[  670.808680] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 00 0b b1 e4 00 00 00 04 00 00 00
[  670.808685] xhci_hcd 0000:01:00.0: Cancel URB 00000000fa6ae129, dev 1.1.2, ep 0x85, stream_id 5 starting at offset 0x1246e80
[  670.816805] sd 16:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN 
[  670.816814] sd 16:0:0:0: [sdc] tag#3 CDB: Read(16) 88 00 00 00 00 00 0b b1 e0 00 00 00 04 00 00 00
[  670.816820] xhci_hcd 0000:01:00.0: Cancel URB 000000004f2648ab, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x1245660
[  670.824382] sd 16:0:0:0: [sdc] tag#2 uas_eh_abort_handler 0 uas-tag 1 inflight: IN 
[  670.824391] sd 16:0:0:0: [sdc] tag#2 CDB: Read(16) 88 00 00 00 00 00 0b b1 d0 00 00 00 04 00 00 00
[  670.824396] xhci_hcd 0000:01:00.0: Cancel URB 00000000dacec9a6, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123e0b0
[  670.839350] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
[  670.863954] scsi host16: uas_eh_device_reset_handler start
[  670.863965] xhci_hcd 0000:01:00.0: Cancel URB 00000000b5479938, dev 1.1.2, ep 0x87, stream_id 6 starting at offset 0x1238140
[  670.864475] xhci_hcd 0000:01:00.0: Cancel URB 0000000065be6261, dev 1.1.2, ep 0x87, stream_id 5 starting at offset 0x1236250
[  670.865057] xhci_hcd 0000:01:00.0: Cancel URB 00000000f292ee34, dev 1.1.2, ep 0x87, stream_id 4 starting at offset 0x12347a0
[  670.960178] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
[  671.007562] scsi host16: uas_eh_device_reset_handler success
[ 1208.115301] xhci_hcd 0000:01:00.0: Cancel URB 00000000b06303bd, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd99694a0
[ 1208.280245] xhci_hcd 0000:01:00.0: Cancel URB 0000000098d971a6, dev 1.1.4, ep 0x85, stream_id 5 starting at offset 0x12c5370
[ 1208.319764] xhci_hcd 0000:01:00.0: Cancel URB 00000000254728ca, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x124a1e0
[ 1808.217512] xhci_hcd 0000:01:00.0: Cancel URB 00000000e5c0481e, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd996a260
[ 1808.465583] xhci_hcd 0000:01:00.0: Cancel URB 0000000038d97298, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12bc070
[ 1808.513103] xhci_hcd 0000:01:00.0: Cancel URB 0000000077091b68, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x1249550
[ 2408.314570] xhci_hcd 0000:01:00.0: Cancel URB 0000000013cfeb9e, dev 1.1.4, ep 0x85, stream_id 2 starting at offset 0x12be890
[ 2408.353399] xhci_hcd 0000:01:00.0: Cancel URB 000000000add27c3, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x1248eb0


