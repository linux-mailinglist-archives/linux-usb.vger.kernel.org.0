Return-Path: <linux-usb+bounces-36674-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP/uKv238WngjwEAu9opvQ
	(envelope-from <linux-usb+bounces-36674-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 09:49:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E973490BE1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 09:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E70273087CAC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 07:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB1B3A6B77;
	Wed, 29 Apr 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFVlAsdh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D83B530B
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448683; cv=none; b=fJuAHrb9gmidrFbGnlRzeA74o6mCHB7BRIfw6xIEp4yfU1V25pRB8wjdZgOekrDJ2AhXLu+Uo1ml5aOwcPNwW3NwWq40AqIxH4X40EeUwcqsgz21ylwDWg+WuqE/Sh12QJA10wmXI0jW4Gj1K8X91HUsxClVeq2Gx1VuTF9A9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448683; c=relaxed/simple;
	bh=S1xirAsunqBsaJrTgWmqDgYZT6H2TGNo5Tf1W/ap6RM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwOBY50Yy5vSzjLS7qehjsI+JcgswDWUrO82sSZA/hlJnPveGB8Lo1dggLuZG2RUgZNoHyUNotLeZOgi0e918GKpBWbEMSTJjtYpRy5LmfDsXvaxhTuJsFttrHPs2idpRYps4FXZgwBEXX1FSeYTOKRI9GGBbmt6NJEF1oieMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFVlAsdh; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so117219741fa.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777448680; x=1778053480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoM7C7e4XibuCJ9YojNGXt7iettPXSnJEZfOHNyZngY=;
        b=jFVlAsdhcmmVHbLm9RhuqViHT9/6l8Ebg3Z4tp8c3QpD3n5agMvPso9sarfSSr2BLw
         hhSGD9+Rj6lFUCy361fNAT5I5SnzQq4XRzwcXwlndsEU3oiHIll0s0ACT6WBUC/KoPkr
         GyKROMu6B17cOR8TNLNjhDcjySz9cNN8Sp+5txVydyOUH14Ms/YxucjnFyVvU9ghXT2C
         kJnsKgo+XrH3jph6zeEyNmWXP/345IH/WluXTQmb0o6Lp7++/vXuw+WKwC1YP1EpfjBr
         O+SMJHQNe48yDCF+ff0DjJTU//46q6vr3iDSXfpx9n37mX3bNupBEjHWT4CnAGpr83QR
         Qobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448680; x=1778053480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoM7C7e4XibuCJ9YojNGXt7iettPXSnJEZfOHNyZngY=;
        b=W/Dod5uzCC8lTYvgBOxJzxh63VAdVWc07aU9ZXgIQ8cNgp1gHEBt2+/AFweXpG3IlC
         YegZehS+O1bQROHbLRGekdWRIOa8Yzgs8cdcQCWzP/B1XdYolAg8w3sPg6OlhUZPIYGB
         yvZG58Pa7LuRsCvm4aBt/UQle8LwYI/mNauNOOwyRDPGJyKJhnBPBitJ43BkIyMA0XAP
         Sx89JG7rTet8EiNpuN+ZgGZrqyPIEFeQS5+NoChUTaZmxqtpPEJJ22bbJ8Fm2Jgtq/xT
         vuJW1wi/mndsNpB09UqFE1ifPO17LL3FGjGyGmSkeJwUJpEmjXusoq1PyrAohsQFIFgj
         WjMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jpB92kP4P+DR9k0EBVY8RBQVZEq51PJr4zvBcIWepynU/tRl5kHUHw3kzwR/y58sOL8m3tFPDoLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64xZnBF/Cbax2RskKEUIiHzV/pVdAtjCQJUFvCntv7n3GNstm
	fNW7ccpM0qUClD+K+tsg+8scI+UaVdpbUZo2GkV0cvODFT0uQaKXhlLU
X-Gm-Gg: AeBDies4bJfkN7ByG4qfmbPNE+S9qzL9GcmGDwwuE2T4BySastCOmlXX0E3/iza7Stn
	hwZMF6kxDv9FkB03AdCysL83iIb6sjgzUkCdEQ/gkoTMy26/eSbSqYrfSZAl3wVSVwX0GOyq5cl
	HxQZsBRQMJDHFq9965VJGdtD9VLf7h3Ggrxbcj6XzHFbevILm20E4dKFF4OJFEFz5Vuvy9JJYha
	Gaa/PxhK/lioFZipe7kA0lGC0Xo36iQhxC114OGRB0Y0pyiE+QP+XFO0J1qpB/OF9vN9MxYlEOD
	5dzY7HSkxir0ymB3NznLqrK5vbZnw5CLnMFoOvLbtpsSflMsfpJMgcuPMZQVudDBi0jj6uc2L7j
	tqQVo0ODpVrcseF+UipGjTtn5jZNTmf6H0ay5ofTqX2ICc+JCdqo+EE8+32iJbAH850Fe6vpbwI
	xoUuZrRojwF2NMv6CS53NIRSxG6dzKqa2IBqJjlbJAqBQ=
X-Received: by 2002:a05:6512:3b11:b0:5a3:e5d7:e37f with SMTP id 2adb3069b0e04-5a74662e765mr2443023e87.41.1777448679575;
        Wed, 29 Apr 2026 00:44:39 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f96b055sm3029451fa.13.2026.04.29.00.44.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 29 Apr 2026 00:44:38 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:44:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Lee Jones <lee@kernel.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Sarah Sharp <sarah.a.sharp@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20260429094434.0825c059.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB62171E25C3202950069F09D9D2342@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20251220141510.1bc1ef19.michal.pecio@gmail.com>
	<20251222064252.GA1196800@google.com>
	<2025122253-stopper-tweed-6e68@gregkh>
	<20251222085543.4d7430d5.michal.pecio@gmail.com>
	<TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<2025122250-commend-bondless-c7e1@gregkh>
	<TYUPR06MB62171E25C3202950069F09D9D2342@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1E973490BE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36674-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, 29 Apr 2026 02:50:43 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> Hello  Greg, Mathias Nyman:
>=20
> Even after updating the kernel, the issue persists during the wake-up pro=
cess
> after the device has been put into sleep mode when connected to digital h=
eadphones.
>=20
> The error message is as follows:
>=20
> [465214.519817][T17247] msm-dwc3 a600000.ssusb: [2026-04-26 07:38:16.8712=
88]vusb dbg: [2026-04-26 07:38:16.871288]DWC3 in low power mode
> [465221.257099][T24488] check_valid_request: card#:0 dev#:0 dir:0 en:1 fm=
t:2 rate:48000 #ch:2
> [465221.259370][T24488] msm-dwc3 a600000.ssusb: [2026-04-26 07:38:23.6108=
42]vusb dbg: [2026-04-26 07:38:23.610842]DWC3 exited from low power mode
> [465221.690852][T24488] usb 1-1: 1:1: cannot get freq at ep 0x3
> [465221.690947][T24488] uaudio_iommu_map: type:0 map pa:0x000000089a6ae00=
0 to iova:0x00001000 size:4096
> [465221.690956][T24488] uaudio_get_iova: exact size: 4096 found
> [465221.690959][T24488] uaudio_get_iova: va:0x00022000 curr_iova:0x000240=
00 curr_iova_size:4186112
> [465221.690962][T24488] uaudio_iommu_map: type:1 map pa:0x000000091c53700=
0 to iova:0x00022000 size:4096
> [465221.690994][T24488] uaudio_get_iova: exact size: 32768 found
> [465221.690996][T24488] uaudio_get_iova: va:0x00422000 curr_iova:0x004320=
00 curr_iova_size:4290592768
> [465221.691001][T24488] uaudio_iommu_map: type:2 map pa:0x0000000974e5c00=
0 to iova:0x00422000 len:4096 offset:0
> [465221.691004][T24488] uaudio_iommu_map: type:2 map pa:0x000000092ff0b00=
0 to iova:0x00423000 len:4096 offset:0
> [465221.691008][T24488] uaudio_iommu_map: type:2 map pa:0x00000009086d400=
0 to iova:0x00424000 len:4096 offset:0
> [465221.691011][T24488] uaudio_iommu_map: type:2 map pa:0x0000000903d4200=
0 to iova:0x00425000 len:4096 offset:0
> [465221.691014][T24488] uaudio_iommu_map: type:2 map pa:0x0000000899f4000=
0 to iova:0x00426000 len:4096 offset:0
> [465221.691017][T24488] uaudio_iommu_map: type:2 map pa:0x000000091c49100=
0 to iova:0x00427000 len:4096 offset:0
> [465221.691020][T24488] uaudio_iommu_map: type:2 map pa:0x000000089926900=
0 to iova:0x00428000 len:4096 offset:0
> [465221.691023][T24488] uaudio_iommu_map: type:2 map pa:0x000000093b4d300=
0 to iova:0x00429000 len:4096 offset:0
> [465221.691052][T24488] handle_uaudio_stream_req: ret 0: qmi response lat=
ency 433 ms
> [465223.771840][T24494] handle_uaudio_stream_req: sq_node:5 sq_port:207 s=
q_family:2a
> [465223.771858][T24494] check_valid_request: card#:0 dev#:0 dir:0 en:0 fm=
t:2 rate:48000 #ch:2
> [465223.827409][T24494] uaudio_put_iova: curr_iova_size 4190208
> [465223.827414][T24494] uaudio_iommu_unmap: type 1: unmap iova 0x00022000=
 size 4096
> [465223.827425][T24494] uaudio_put_iova: curr_iova_size 4290625536
> [465223.827429][T24494] uaudio_iommu_unmap: type 2: unmap iova 0x00422000=
 size 32768
> [465223.827463][T24494] handle_uaudio_stream_req: release resources: intf=
# 1 card# 0
> [465223.827467][T24494] uaudio_dev_release: for dev 0000000000000000
> [465223.827472][T24494] uaudio_iommu_unmap: type 0: unmap iova 0x00001000=
 size 4096
> [465223.827517][T24494] uaudio_event_ring_cleanup_free: all audio devices=
 disconnected
> [465223.827561][T24494] handle_uaudio_stream_req: ret 0: qmi response lat=
ency 55 ms
> [465227.360186][ T3223] android time 2026-04-27 06:38:29.711646
> [465232.791611][T24493] handle_uaudio_stream_req: sq_node:5 sq_port:207 s=
q_family:2a
> [465232.791615][T24493] check_valid_request: card#:0 dev#:0 dir:0 en:1 fm=
t:2 rate:48000 #ch:2
> [465233.213670][T24493] uaudio_iommu_map: type:0 map pa:0x000000091094f00=
0 to iova:0x00001000 size:4096
> [465233.213683][T24493] uaudio_get_iova: exact size: 4096 found
> [465233.213686][T24493] uaudio_get_iova: va:0x00022000 curr_iova:0x000240=
00 curr_iova_size:4186112
> [465233.213689][T24493] uaudio_iommu_map: type:1 map pa:0x000000089a6ae00=
0 to iova:0x00022000 size:4096
> [465233.213712][T24493] uaudio_get_iova: exact size: 32768 found
> [465233.213715][T24493] uaudio_get_iova: va:0x00422000 curr_iova:0x004320=
00 curr_iova_size:4290592768
> [465233.213720][T24493] uaudio_iommu_map: type:2 map pa:0x0000000968e5f00=
0 to iova:0x00422000 len:4096 offset:0
> [465233.213723][T24493] uaudio_iommu_map: type:2 map pa:0x0000000968e5e00=
0 to iova:0x00423000 len:4096 offset:0
> [465233.213727][T24493] uaudio_iommu_map: type:2 map pa:0x00000008caa5800=
0 to iova:0x00424000 len:4096 offset:0
> [465233.213730][T24493] uaudio_iommu_map: type:2 map pa:0x0000000a91af000=
0 to iova:0x00425000 len:4096 offset:0
> [465233.213734][T24493] uaudio_iommu_map: type:2 map pa:0x00000009d38c100=
0 to iova:0x00426000 len:4096 offset:0
> [465233.213737][T24493] uaudio_iommu_map: type:2 map pa:0x00000009e1e0500=
0 to iova:0x00427000 len:4096 offset:0
> [465233.213740][T24493] uaudio_iommu_map: type:2 map pa:0x00000009f8ea400=
0 to iova:0x00428000 len:4096 offset:0
> [465233.213743][T24493] uaudio_iommu_map: type:2 map pa:0x00000000a751900=
0 to iova:0x00429000 len:4096 offset:0
> [465233.213791][T24493] handle_uaudio_stream_req: ret 0: qmi response lat=
ency 422 ms
> [465248.503579][T24411] usb 1-1: reset full-speed USB device number 2 usi=
ng xhci-hcd
> [465248.641732][T24411] Unable to handle kernel paging request at virtual=
 address 00000000ef808000
> [...]
> [465248.643670][T24411] Call trace:
> [465248.643673][T24411]  dma_pool_alloc+0x38/0x2a4
> [465248.643684][T24411]  xhci_segment_alloc+0x9c/0x1c4
> [465248.643692][T24411]  xhci_alloc_segments_for_ring+0xbc/0x170
> [465248.643699][T24411]  xhci_ring_alloc+0xb4/0x1f0
> [465248.643705][T24411]  xhci_endpoint_init+0x3b0/0x4bc
> [465248.643711][T24411]  xhci_add_endpoint+0x1a4/0x29c
> [465248.643723][T24411]  usb_hcd_alloc_bandwidth+0x230/0x3d4
> [465248.643729][T24411]  usb_reset_and_verify_device+0x1e0/0x744
> [465248.643741][T24411]  usb_reset_device+0x154/0x23c
> [465248.643756][T24411]  __usb_queue_reset_device+0x3c/0x64
> [465248.643764][T24411]  process_scheduled_works+0x200/0x9d8
> [465248.643772][T24411]  worker_thread+0x154/0x3b4
> [465248.643780][T24411]  kthread+0x11c/0x1a0
> [465248.643791][T24411]  ret_from_fork+0x10/0x20
> [465248.643807][T24411] Code: 942f5097 f9400e76 aa0003e9 b40002f6 (f94002=
c8)=20
> [465248.643812][T24411] ---[ end trace 0000000000000000 ]---

Looks like this time somebody tried to reset a USB device while
the segment pool is destroyed, not created yet or corrupted.

Again, xhci_hcd dynamic debug would show what led to this and
whether the pool was supposed to be ready at that time or not.
The pool should always be ready except during xhci_resume() and
after xhci_stop(), so it's unclear how this happened.

Again, chances are that something is trying to resume USB device
concurrently with its parent host controller.

Regards,
Michal













