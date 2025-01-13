Return-Path: <linux-usb+bounces-19236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6860A0B449
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 11:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08351643B1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 10:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7718A1FDA8B;
	Mon, 13 Jan 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTtlxEUX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD0B2F56
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763382; cv=none; b=Xk97Ht8FyXu6NfUcNawP4J+dQ42O0Gcf8UAO8jvhHuO8UqPJLekND0B6Afl47cnJerPLahhcWPi2ZmWDuzqCBT/ZkNbdQu6bZATos8Q59e6+BSJN1Bww7H3fzWS0TqOryr4xMGE/wuYwSBbDNQZSYlvJAZFbtFPsvnsJ5+8nqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763382; c=relaxed/simple;
	bh=3cj4cool69GaO204u8AIyaKR1hBE6Rv0H2G9hxoqfbk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UM8waKZ0GIW0efy2RpnsgpbaDg/2drk5p6BdKEuvdsR1y9P6OS+XyMoGNz97jh96x+ZHYf0jWiiT00GSYiW/sSGmRRA3qxzMAI07EGz93Fvb02FSoEOhFIMszPAS2QVbqyuUFHM5+r+UeBpR7yB4tXs/npcJdv4GoJxoYCJR9yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTtlxEUX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso5935033a12.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736763379; x=1737368179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA3+e2wXXM6ALvLprSJrD0PS3m8c+4Yyl+Ne/tpRJXc=;
        b=fTtlxEUXCTad7iEKXFKe6EsZJL2bEqYwG5Kp5LqLoLzgoahcU8ahsv4ST6mXRaRN5J
         0Ylmh3oKOlCmWydC632xtYZuDjIomnrbR7FcNqEhwsirAZA9++QLqaT4Crd/mDOjeDtu
         +1SeMsDNnYQTOpUdUwycw1PMDnpHILVMXT0Mv3QAoCywa/u0cLjs+nwH9Fuw7sw/FGH5
         psVREcE/Ai+AZ0xagGOopk5jnkRbeTxcf2/ThOb5PwQb5FaTFpPgHaAgJ6kUwtDx8U2n
         lM1QrV7z4yBq3s7LFUs5bU3mhGzfFCS3VaNeuoFtCYzWM7kMBY3+2aHXxWEehFZzOiIr
         7f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763379; x=1737368179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA3+e2wXXM6ALvLprSJrD0PS3m8c+4Yyl+Ne/tpRJXc=;
        b=nUhidhAMo+OtfBK/kR50k498g0KsCLuOcjpwGART7oiZLsMWEvH0A1bIUxjPvGy5ZA
         hnyeyq/URorRRHFeo5xz/lGgbaY2IvxBSgP/6c711qlchK0xqIXH5CSuJkPEmnEyWR+c
         hsgJV0ep8WSvAPIC6lSOVev4nUBMq0b8A44CmeVEd0FpHmZtGgq7Krk1t9qidZXIF0BS
         dJtl9Uxb8eDXqM3dorxGZSUH3Qoy3eqivvwMtjH2RPQHGx8dHQ6wGMzBXSmRHAx8Aitq
         SpR+/iZK0EgB2S7Ognwqh20eLfvFcOia1UZ81ghMvJgcgQwbtu/P8jswOAeIRL7FVN6f
         sh+A==
X-Forwarded-Encrypted: i=1; AJvYcCWW1O7Va5lMad5KOTRTV2ExR04Anpuv0OHAWD1sl8Q79PEWh7b+KBmWC7+qaWidTi2nYfF4giXNntA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykYboBPOPYY/FxXa9U0jSXrcE+mnbsMnGaBR9AFBgUzWoRbRrn
	g30AokLtz5UGblVcf9ECv6O23dSWEPWsHNvpzA9t3L7zYKZTPcyj52q+tw==
X-Gm-Gg: ASbGnctqwo3UoyA2UPkd1aoT/aJV0VuiJDqKokSSiJYNP/MMouk+oa7VoFwPW1WceCU
	z1WJQ7IxPyLKq1f51Qwp94kHwmVpaZbMDx/E3Sd0FToVVx4RAG0Yns20qhMe6AgU6HD9WtSIvot
	vDm5/zE3dt0R/Oy9dLB7yQYwYnvQY8cZ+rIFxKMULLa/M2GKNnADRgIK3GJHF2cRimDNq4LahJJ
	tHlHzWjkFrNz3FEHQ7l7oa97L8tTRFSOhrKDwUFPra9g6AETbU5zKh2IQlC36Jl3hegsww=
X-Google-Smtp-Source: AGHT+IHjIIirzWgEW8j3aIqR1SPQx3IVxKL+zpInupqcbNhNyWUcHPv0G+Gql2WYIUt8lpzv+V3CJw==
X-Received: by 2002:a05:6402:274d:b0:5d6:5139:7e97 with SMTP id 4fb4d7f45d1cf-5d972dfbbc2mr16124100a12.1.1736763378445;
        Mon, 13 Jan 2025 02:16:18 -0800 (PST)
Received: from foxbook (adqh85.neoplus.adsl.tpnet.pl. [79.185.141.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a5277sm4567991a12.80.2025.01.13.02.16.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jan 2025 02:16:18 -0800 (PST)
Date: Mon, 13 Jan 2025 11:16:12 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: xhci: set page size to the xHCI-supported size
Message-ID: <20250113111612.5726c3f6@foxbook>
In-Reply-To: <0825d8a0-d2f7-49a1-b6a9-a65fc865e923@linux.intel.com>
References: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
	<20250108142822.649862-3-niklas.neronin@linux.intel.com>
	<0825d8a0-d2f7-49a1-b6a9-a65fc865e923@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 10 Jan 2025 14:35:50 +0200, Mathias Nyman wrote:
> On 8.1.2025 16.28, Niklas Neronin wrote:
> > +	page_shift = readl(&xhci->op_regs->page_size) &
> > XHCI_PAGE_SIZE_MASK;  
> 
> Should we check that page_shift value makes sense here?

Maybe it would make sense to validate it. Interpreting PAGESIZE wrong
is potentially dangerous, because the xHC will assume that scratchpad
buffers are of this size and it can write to them whatever it wants.

Before the buggy ffs() patch 81720ec5320c, the driver used to pick the
lowest set bit or warn if all are zero, but then it still ignored the
calculated size and used 4K.

I would probably be safer to use the highest bit, or just reject the
xHC if it sets multiple bits (5.4.3 says: "the supported page size",
not "a bitmask of supported sizes").

0xffffffff looks like a brain dead chip and not going to work anyway.

> We used to hardcode page_size to 4k, and don't really know if all xHC
> vendors have a sane op_regs->page_size value.

FWIW, all of mine report 4K as per debugfs:

/sys/kernel/debug/usb/xhci/0000:00:10.0/reg-op:PAGESIZE = 0x00000001
/sys/kernel/debug/usb/xhci/0000:02:00.0/reg-op:PAGESIZE = 0x00000001
...

00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI Controller (rev 20)
02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 300 Series Chipset USB 3.1 xHCI Controller (rev 02)
06:00.0 USB controller: ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller
09:00.0 USB controller: Renesas Electronics Corp. uPD720202 USB 3.0 Host Controller (rev 02)
0a:00.0 USB controller: Etron Technology, Inc. EJ168 USB 3.0 Host Controller (rev 01)
0b:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev 03)
0c:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller (rev 01)

Also ASM1042 and ASM3142.

And I have an NVIDIA Tegra board which runs some antique kernel and
doesn't warn, so PAGESIZE must at least be non-zero there.

Regards,
Michal

