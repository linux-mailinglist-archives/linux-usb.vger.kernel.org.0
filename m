Return-Path: <linux-usb+bounces-14727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8012296DD4E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 17:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8DC9B27E5D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 15:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D077519E808;
	Thu,  5 Sep 2024 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="Had9xLpz"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2724D19DF7D
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548803; cv=none; b=uu1S39WvhrkpC6/nZo52uXHvR89qxpHgjJaUBAfitwg/ruaNLqVzBqeRflfKbfBAgDgnSk9rVryBOz6SzBl9P0l5WC4NQ0dCtjkC7cXYEqj4r5O8hu1bpRrcaGa1aDJStDVSg77dP5rk+HtqwWKSmEU2qFL/X1qznb4CLihrFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548803; c=relaxed/simple;
	bh=9ytE5K3Zf/0QRPxbhOpspB/0KK52/Qs3EtAI4+9LAmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1nn7sWu48DRta78F/x/X75GA5mm/vAVKThPs67P0kT1DU6rbteSeRSp2q/+2LOd+EkTHoB0lQyCIP5T/xNFLv9Rg8L2GsX4iEucBA+12iqOHf6FnYqaKD9jzxBoZE/sVQvyETiY86m7/OOTiLGy0wlNCIryhyTlop0ioaSg9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=Had9xLpz; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 7E72E1243CAE; Thu,  5 Sep 2024 17:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725548797; bh=9ytE5K3Zf/0QRPxbhOpspB/0KK52/Qs3EtAI4+9LAmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Had9xLpzxSrGwFSVaLk4MfMY5SppxodYSLF1GPvPJBqHmS8RP8WJROb22yduRkapy
	 j9czyPybKBE2HQ3NnqraTUuJ7kQkO2r4TKobOkkS2ZOpWoLvBCvGpDikn2/mBO8h1t
	 qqystXXuEzpjF15xkyXMRtChmEtpkQES/DzuHpUw9ERaH7tAK9RTvMqIo8zGorOIjs
	 g/bjrrxVLZSo4F+4uFwG6tP421S/c/tioX3PegXI6UbzDTgMH4stDttH7LUg75/TWP
	 UAlOndxtRdyEpWGshIcnDj7JD0BZggjY+EXUVjGQW1Vr8mUt2DSnHKNkBDoeBwkvM0
	 HvoNcnwn73IOw==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id A51F71240AFF;
	Thu,  5 Sep 2024 17:06:15 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 95FB876C9FE; Thu,  5 Sep 2024 17:06:15 +0200 (CEST)
Date: Thu, 5 Sep 2024 17:06:15 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtnI57FYnoz1xKxF@alphanet.ch>
References: <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch>
 <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtnHs8udyl6bfGdF@alphanet.ch>

On Thu, Sep 05, 2024 at 05:01:07PM +0200, Marc SCHAEFER wrote:
> [ 2408.314570] xhci_hcd 0000:01:00.0: Cancel URB 0000000013cfeb9e, dev 1.1.4, ep 0x85, stream_id 2 starting at offset 0x12be890
> [ 2408.353399] xhci_hcd 0000:01:00.0: Cancel URB 000000000add27c3, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x1248eb0

[ 3008.111367] xhci_hcd 0000:01:00.0: Cancel URB 000000006fcf715a, dev 1.1.1, ep 0x85, stream_id 2 starting at offset 0xd996ba10
[ 3008.322520] xhci_hcd 0000:01:00.0: Cancel URB 000000005b67abcf, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124d6e0
[ 3008.322786] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[ 3008.322791] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 000000000124d6f3 stream 1 slot 10 ep 11 flags C
[ 3008.326893] xhci_hcd 0000:01:00.0: Cancel URB 00000000ac6e4a01, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124d6f0
[ 3008.415617] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
[ 3008.415633] xhci_hcd 0000:01:00.0: Looking for event-dma 000000000124d6e0 trb-start 000000000124d700 trb-end 000000000124def0 seg-start 000000000124d000 seg-end 000000000124dff0
[ 3008.415640] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[ 3008.439200] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 4
[ 3008.439221] xhci_hcd 0000:01:00.0: Looking for event-dma 000000000124d6f0 trb-start 000000000124d700 trb-end 000000000124def0 seg-start 000000000124d000 seg-end 000000000124dff0
[ 3008.439225] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[ 3027.526318] xhci_hcd 0000:01:00.0: Cancel URB 00000000bc2575b3, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x124d700
[ 3027.526352] xhci_hcd 0000:01:00.0: Cancel URB 00000000ca7402e9, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x12490d0
[ 3027.557504] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
[ 3040.380154] sd 16:0:0:0: [sdc] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD IN 
[ 3040.380166] sd 16:0:0:0: [sdc] tag#5 CDB: Read(16) 88 00 00 00 00 00 3b 13 98 00 00 00 04 00 00 00
[ 3040.380175] xhci_hcd 0000:01:00.0: Cancel URB 00000000a59c9666, dev 1.1.2, ep 0x85, stream_id 6 starting at offset 0x1242320
[ 3040.380784] sd 16:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 2 inflight: IN 
[ 3040.380793] sd 16:0:0:0: [sdc] tag#3 CDB: Read(16) 88 00 00 00 00 00 3b 13 6c 00 00 00 04 00 00 00
[ 3040.380799] xhci_hcd 0000:01:00.0: Cancel URB 00000000cb16251e, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x124a2d0
[ 3040.388880] sd 16:0:0:0: [sdc] tag#1 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN 
[ 3040.388889] sd 16:0:0:0: [sdc] tag#1 CDB: Read(16) 88 00 00 00 00 00 3b 13 94 00 00 00 04 00 00 00
[ 3040.388895] xhci_hcd 0000:01:00.0: Cancel URB 000000002dd4d275, dev 1.1.2, ep 0x85, stream_id 5 starting at offset 0x1245b90
[ 3040.396532] sd 16:0:0:0: [sdc] tag#0 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN 
[ 3040.396541] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 00 3b 13 90 00 00 00 04 00 00 00
[ 3040.396547] xhci_hcd 0000:01:00.0: Cancel URB 00000000262be495, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x12479c0
[ 3040.411468] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
[ 3040.440138] scsi host16: uas_eh_device_reset_handler start
[ 3040.440148] xhci_hcd 0000:01:00.0: Cancel URB 00000000c9d6ca1e, dev 1.1.2, ep 0x87, stream_id 6 starting at offset 0x1254470
[ 3040.440567] xhci_hcd 0000:01:00.0: Cancel URB 00000000fc41ecc1, dev 1.1.2, ep 0x87, stream_id 5 starting at offset 0x1256010
[ 3040.441159] xhci_hcd 0000:01:00.0: Cancel URB 000000006fcf715a, dev 1.1.2, ep 0x87, stream_id 4 starting at offset 0x1257280
[ 3040.780444] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
[ 3040.828021] scsi host16: uas_eh_device_reset_handler success

