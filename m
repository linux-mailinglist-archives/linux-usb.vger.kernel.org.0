Return-Path: <linux-usb+bounces-14728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6789496E109
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 19:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E2C828A66B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 17:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D731A2C2C;
	Thu,  5 Sep 2024 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="BnddEp6F"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B81A0B0F
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557097; cv=none; b=Wb7e5ejokilqJCJ7D7s614R79W33Cov0CsMSdlDC05oQXiAgM1uOgIYHa/k7JlfW7kiEiFbb/PXJLnbT472UHeMVIQVfiNz8keljnyBM3OzHsuBBZLeo+iut4EYSKURNu8biWIZIMYIeQ25JkqR4rqK8sY2TL5IdADrz8sua+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557097; c=relaxed/simple;
	bh=je2IA+vKzC++qMHMwpoWtptV5qCPDiSA9Qsv+g+3MAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz7wDdUPuj1nfAmtbc/xt8i8RkklIuCC8J29ge3/WWOoujmPPJ55BQHPrjv+AFFLna0PAtHXzGGzeyNDOfBvRpgPhsEfJhgX8lsvpAArkHKzq3p6adIKcNJa+2vQ/LQ6Zx6AG8y3qXr9RFRakW9U/D/+hI3SrNJQpxUnniw+5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=BnddEp6F; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id DDDE512417A1; Thu,  5 Sep 2024 19:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725557085; bh=je2IA+vKzC++qMHMwpoWtptV5qCPDiSA9Qsv+g+3MAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnddEp6FonqZ+MMERwstxYCo+wVGemBQ/j87b8vORx+yS/rx39gE4jFTuDOETcpI7
	 rmXNYw2Wg5tMdBhIIeYahvSIs9F+ThHUtFJNmQRmpWEqvFsJc10UzqfEYPMXaQ3Qn3
	 3wKaMkUY8jj7yKwDbL5b7pLNn9k2bNwjuN8BrnsAHzJfCqC5T3UIhBS+DVVwJnk+y+
	 Qscqlz0UuruEAWOEx5YznKvW+DtIXBQ9IT6ODDZ3akGBkwYV0fjyUtZObPJdhOfCJZ
	 byorK+NLsoVmjA/0P3bpYW7Bab4xWsjjHSMRMXljxj45pxbttg/Zj8mYDYMMLM9mrx
	 CpQIEwvrMZoxg==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id CB24C12426FA;
	Thu,  5 Sep 2024 19:24:09 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id BBD1176C9FE; Thu,  5 Sep 2024 19:24:09 +0200 (CEST)
Date: Thu, 5 Sep 2024 19:24:09 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtnpOfv2qXCUy5/i@alphanet.ch>
References: <ZtcUGe0FWxpO6058@alphanet.ch>
 <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch>
 <ZtnI57FYnoz1xKxF@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtnI57FYnoz1xKxF@alphanet.ch>

On Thu, Sep 05, 2024 at 05:06:15PM +0200, Marc SCHAEFER wrote:
> [ 3040.780444] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
> [ 3040.828021] scsi host16: uas_eh_device_reset_handler success

[ 3608.147001] xhci_hcd 0000:01:00.0: Cancel URB 00000000cfca4963, dev 1.1.1, ep 0x85, stream_id 5 starting at offset 0xd99656b0
[ 3608.347015] xhci_hcd 0000:01:00.0: Cancel URB 000000008c57d9fc, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12bc300
[ 3608.388293] xhci_hcd 0000:01:00.0: Cancel URB 00000000960695fa, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x1245780
[ 3608.405579] xhci_hcd 0000:01:00.0: Cancel URB 0000000040df0558, dev 1.1.2, ep 0x85, stream_id 5 starting at offset 0x1246b20
[ 4208.131724] xhci_hcd 0000:01:00.0: Cancel URB 00000000a37db473, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd99696c0
[ 4208.175736] xhci_hcd 0000:01:00.0: Cancel URB 00000000bc2575b3, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12bd960
[ 4208.187844] xhci_hcd 0000:01:00.0: Cancel URB 000000006450b3ee, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123e010
[ 4808.165397] xhci_hcd 0000:01:00.0: Cancel URB 00000000bcd65caa, dev 1.1.1, ep 0x85, stream_id 6 starting at offset 0xd9964960
[ 4808.439706] xhci_hcd 0000:01:00.0: Cancel URB 000000000d48b0aa, dev 1.1.4, ep 0x85, stream_id 6 starting at offset 0x12c7ef0
[ 4808.439981] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[ 4808.439984] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 00000000012c7f02 stream 6 slot 12 ep 11 flags c
[ 4808.450328] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
[ 4808.450339] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012c7ef0 trb-start 00000000012c7f00 trb-end 0000000000000000 seg-start 00000000012c7000 seg-end 00000000012c7ff0
[ 4808.450342] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012c7ef0 trb-start 00000000012c6000 trb-end 00000000012c6700 seg-start 00000000012c6000 seg-end 00000000012c6ff0
[ 4808.450345] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[ 4815.511438] sd 18:0:0:0: [sde] tag#2 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD 
[ 4815.511448] sd 18:0:0:0: [sde] tag#2 CDB: ATA command pass through(12)/Blank a1 06 20 da 00 00 4f c2 00 b0 00 00
[ 4827.561107] xhci_hcd 0000:01:00.0: Cancel URB 00000000f889834b, dev 1.1.4, ep 0x85, stream_id 6 starting at offset 0x12c7f00
[ 4827.561149] usb 3-1.1.4: stat urb: no pending cmd for uas-tag 2
[ 4838.551833] sd 18:0:0:0: [sde] tag#5 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN 
[ 4838.551844] sd 18:0:0:0: [sde] tag#5 CDB: Read(16) 88 00 00 00 00 00 5e 0e 68 00 00 00 04 00 00 00
[ 4838.551851] xhci_hcd 0000:01:00.0: Cancel URB 0000000060654a2b, dev 1.1.4, ep 0x85, stream_id 4 starting at offset 0x12c27d0
[ 4838.552637] sd 18:0:0:0: [sde] tag#3 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN 
[ 4838.552646] sd 18:0:0:0: [sde] tag#3 CDB: Read(16) 88 00 00 00 00 00 5e 0e 64 00 00 00 04 00 00 00
[ 4838.552653] xhci_hcd 0000:01:00.0: Cancel URB 00000000c9d6ca1e, dev 1.1.4, ep 0x85, stream_id 3 starting at offset 0x12c16c0
[ 4838.553490] sd 18:0:0:0: [sde] tag#1 uas_eh_abort_handler 0 uas-tag 1 inflight: IN 
[ 4838.553499] sd 18:0:0:0: [sde] tag#1 CDB: Read(16) 88 00 00 00 00 00 5e 0e 4c 00 00 00 04 00 00 00
[ 4838.553505] xhci_hcd 0000:01:00.0: Cancel URB 00000000606f5552, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12bc220
[ 4838.554297] sd 18:0:0:0: [sde] tag#0 uas_eh_abort_handler 0 uas-tag 5 inflight: CMD IN 
[ 4838.554306] sd 18:0:0:0: [sde] tag#0 CDB: Read(16) 88 00 00 00 00 00 5e 0e 6c 00 00 00 04 00 00 00
[ 4838.554311] xhci_hcd 0000:01:00.0: Cancel URB 0000000073658d32, dev 1.1.4, ep 0x85, stream_id 5 starting at offset 0x12c5b70
[ 4838.571830] scsi host18: uas_eh_device_reset_handler start
[ 4838.571839] xhci_hcd 0000:01:00.0: Cancel URB 00000000a59c9666, dev 1.1.4, ep 0x87, stream_id 5 starting at offset 0x12b3730
[ 4838.572354] xhci_hcd 0000:01:00.0: Cancel URB 000000008f565be3, dev 1.1.4, ep 0x87, stream_id 4 starting at offset 0x12b21b0
[ 4838.572852] xhci_hcd 0000:01:00.0: Cancel URB 0000000030251b45, dev 1.1.4, ep 0x87, stream_id 3 starting at offset 0x12b07c0
[ 4838.911904] usb 3-1.1.4: reset SuperSpeed Plus Gen 2x1 USB device number 9 using xhci_hcd
[ 4838.959751] scsi host18: uas_eh_device_reset_handler success
[ 4838.961714] xhci_hcd 0000:01:00.0: Cancel URB 0000000070aecd12, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123e200
[ 5408.178027] xhci_hcd 0000:01:00.0: Cancel URB 000000005133b009, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12ca0a0
[ 5408.197159] xhci_hcd 0000:01:00.0: Cancel URB 0000000042d212a9, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x12446f0
[ 6008.377030] xhci_hcd 0000:01:00.0: Cancel URB 00000000d926a669, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cba60
[ 6008.383668] xhci_hcd 0000:01:00.0: Cancel URB 00000000d926a669, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123f4f0
[ 6608.120797] xhci_hcd 0000:01:00.0: Cancel URB 00000000420fbfe4, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd996e6f0
[ 6608.346528] xhci_hcd 0000:01:00.0: Cancel URB 00000000b5001cab, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x1240990
[ 7208.423485] xhci_hcd 0000:01:00.0: Cancel URB 0000000019740e95, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cb460
[ 7808.207628] xhci_hcd 0000:01:00.0: Cancel URB 0000000003573fb8, dev 1.1.1, ep 0x85, stream_id 2 starting at offset 0xd996b960
[ 7808.225093] xhci_hcd 0000:01:00.0: Cancel URB 00000000bbf3ec9a, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd996a2e0
[ 7808.400889] xhci_hcd 0000:01:00.0: Cancel URB 0000000061d24d64, dev 1.1.4, ep 0x85, stream_id 2 starting at offset 0x12c8730
[ 8408.150859] xhci_hcd 0000:01:00.0: Cancel URB 00000000bbf3ec9a, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd996e550
[ 8408.261059] xhci_hcd 0000:01:00.0: Cancel URB 0000000011ae71fe, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cb470
[ 8408.265920] xhci_hcd 0000:01:00.0: Cancel URB 0000000011ae71fe, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cb480
[ 8408.375649] xhci_hcd 0000:01:00.0: Cancel URB 000000001205207d, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x1241630
[ 9008.424016] xhci_hcd 0000:01:00.0: Cancel URB 0000000071f5017f, dev 1.1.4, ep 0x85, stream_id 5 starting at offset 0x12c27b0
[ 9008.482300] xhci_hcd 0000:01:00.0: Cancel URB 0000000052e28d9e, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123f3e0
[ 9608.216059] xhci_hcd 0000:01:00.0: Cancel URB 0000000030c9f1cb, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd996e440
[ 9608.266058] xhci_hcd 0000:01:00.0: Cancel URB 00000000d926a669, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12ca1c0
[ 9608.442165] xhci_hcd 0000:01:00.0: Cancel URB 00000000cfde56f3, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123ed90
[ 9608.460643] xhci_hcd 0000:01:00.0: Cancel URB 000000007ec69eb5, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x1240520
[10208.257206] xhci_hcd 0000:01:00.0: Cancel URB 00000000757012df, dev 1.1.1, ep 0x85, stream_id 5 starting at offset 0xd9965870
[10208.279752] xhci_hcd 0000:01:00.0: Cancel URB 000000004ce38a09, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd996a830
[10208.454859] xhci_hcd 0000:01:00.0: Cancel URB 00000000911bf602, dev 1.1.4, ep 0x85, stream_id 4 starting at offset 0x12c45d0
[10208.457464] xhci_hcd 0000:01:00.0: Cancel URB 00000000b8b0856c, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123fdb0
[10808.247403] xhci_hcd 0000:01:00.0: Cancel URB 00000000ac6e4a01, dev 1.1.1, ep 0x85, stream_id 5 starting at offset 0xd9966eb0
[10808.266162] xhci_hcd 0000:01:00.0: Cancel URB 000000005b67abcf, dev 1.1.1, ep 0x85, stream_id 1 starting at offset 0xd996e100
[10808.463915] xhci_hcd 0000:01:00.0: Cancel URB 00000000d1d4ead3, dev 1.1.4, ep 0x85, stream_id 3 starting at offset 0x12c7cb0
[11408.271740] xhci_hcd 0000:01:00.0: Cancel URB 00000000958cc608, dev 1.1.1, ep 0x85, stream_id 5 starting at offset 0xd9966e00
[11408.291484] xhci_hcd 0000:01:00.0: Cancel URB 00000000d4318848, dev 1.1.1, ep 0x85, stream_id 3 starting at offset 0xd996acf0
[11408.487625] xhci_hcd 0000:01:00.0: Cancel URB 000000005870ecd2, dev 1.1.4, ep 0x85, stream_id 3 starting at offset 0x12c7cd0
[11408.493209] xhci_hcd 0000:01:00.0: Cancel URB 00000000f35ec432, dev 1.1.4, ep 0x85, stream_id 1 starting at offset 0x12cb970
[11408.644558] xhci_hcd 0000:01:00.0: Cancel URB 00000000a8590814, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x1244520
[11408.644806] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[11408.644812] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 0000000001244532 stream 4 slot 10 ep 11 flags c
[11408.752645] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
[11408.752658] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001244520 trb-start 0000000001244530 trb-end 0000000001244d20 seg-start 0000000001244000 seg-end 0000000001244ff0
[11408.752663] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[11427.863376] xhci_hcd 0000:01:00.0: Cancel URB 00000000653d8d4e, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x1244530
[11427.863417] xhci_hcd 0000:01:00.0: Cancel URB 000000007e4211ac, dev 1.1.2, ep 0x85, stream_id 6 starting at offset 0x1249630
[11427.863517] xhci_hcd 0000:01:00.0: Move dq deferred: stream 6 URB 000000007e4211ac
[11427.887079] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
[11439.358616] sd 16:0:0:0: [sdc] tag#5 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN 
[11439.358626] sd 16:0:0:0: [sdc] tag#5 CDB: Read(16) 88 00 00 00 00 00 d7 14 0c 00 00 00 04 00 00 00
[11439.358634] xhci_hcd 0000:01:00.0: Cancel URB 00000000467cea42, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x12437c0
[11439.359230] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 5 inflight: IN 
[11439.359239] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 00 d7 13 dc 00 00 00 04 00 00 00
[11439.359245] xhci_hcd 0000:01:00.0: Cancel URB 000000005f878ee4, dev 1.1.2, ep 0x85, stream_id 5 starting at offset 0x1246ef0
[11439.367317] sd 16:0:0:0: [sdc] tag#3 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN 
[11439.367326] sd 16:0:0:0: [sdc] tag#3 CDB: Read(16) 88 00 00 00 00 00 d7 14 08 00 00 00 04 00 00 00
[11439.367332] xhci_hcd 0000:01:00.0: Cancel URB 00000000ea5db08c, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x1241370
[11439.374888] sd 16:0:0:0: [sdc] tag#1 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN 
[11439.374896] sd 16:0:0:0: [sdc] tag#1 CDB: Read(16) 88 00 00 00 00 00 d7 14 10 00 00 00 04 00 00 00
[11439.374901] xhci_hcd 0000:01:00.0: Cancel URB 00000000c4ea53a0, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x123f770
[11439.389862] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 10 ep 10 with no TDs queued?
[11439.414612] scsi host16: uas_eh_device_reset_handler start
[11439.414624] xhci_hcd 0000:01:00.0: Cancel URB 0000000076469c9b, dev 1.1.2, ep 0x87, stream_id 1 starting at offset 0x125e670
[11439.415117] xhci_hcd 0000:01:00.0: Cancel URB 000000005737d298, dev 1.1.2, ep 0x87, stream_id 3 starting at offset 0x1231a00
[11439.415660] xhci_hcd 0000:01:00.0: Cancel URB 0000000016ac95a1, dev 1.1.2, ep 0x87, stream_id 2 starting at offset 0x125ba20
[11439.506778] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
[11439.554356] scsi host16: uas_eh_device_reset_handler success

