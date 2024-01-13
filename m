Return-Path: <linux-usb+bounces-5008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6482CE77
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 21:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70EA31C210F6
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 20:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDFBC8FF;
	Sat, 13 Jan 2024 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKmpdMcV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2185D16410
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd84600920so39748521fa.1
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705178882; x=1705783682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TtXydRq7uPCiK+JsswtKZCMQrX5KqPeRCDi1lLGCH4=;
        b=EKmpdMcVdttcgftcUJ/U0Ejyhy64ihV3MvOxBe6FMB7VRJYKndcN/UOpDi3jr/F16p
         WoSAKkUFxHSHJLD8RtKTeKOfAjiBhB5j5fc2MsLkTwHlvo2EN+sujHRpM9ns7XKzeZPF
         31kY+PxGRYX05BCeobfo/Cl0nrJkXhmobKAUqgkdSi8fI2XKxVO36sXYIvfzumPaK5jy
         Z8jedouTBeTmoxbII4nlhd2VyHeq1/72Z42LDLQwg7eKgLuSH/A5licPur0z8s3MLXsk
         A7KoX//xGQPCDh+pQzPwhzi1vJbiWXx9iHRvhEpmvsVo+4guH8NDBvSJzOWIhnbBTmgA
         pd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705178882; x=1705783682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TtXydRq7uPCiK+JsswtKZCMQrX5KqPeRCDi1lLGCH4=;
        b=iymXAv23x/CCiEmoQ36ZYSnji1YK1YuqEi5vaI7b8evSGmYDZ6NnuF5k7Jh//u6ern
         q86EaoX/ZGG230r4uezSbG8ULyhL591KVhPvtC2KopI/sBwZPiNuIc1mJChdqhEzry7y
         KB+y2nXk4HcpmreEZAYbtiKWtZI0CKOUoD5fKeJYfu3QEaENHvXF5UCVHGvF2tZcb/A7
         /0+jbb1S6AwkNlNggd+5GhJ4VArq436RWh3Ksp66ND/ewFDhQE19M8FFPWGyTNkPO05d
         zbX157NBFIbC1nxfOgt+8kChHR6uAtMmTdFW10pYTLSNF6DUf4ILIalJOl7FSZtuxml9
         1/Pw==
X-Gm-Message-State: AOJu0Yxi5yegf/Wc9/LpBwyPUmiciQV+XYPe4NXdI6iIiZTr0egCjL7Y
	38pCsEtfepzLx8aQYVT10/8SgWGe7i8=
X-Google-Smtp-Source: AGHT+IHo3WOP8pNC83qq9AgN7nvf6hvjnX0Jz9cI8P/ZdQCzrBlmvqtyXDL+P7d+uX9/Bs0hKDqkcg==
X-Received: by 2002:a05:6512:ba0:b0:50e:7f69:847b with SMTP id b32-20020a0565120ba000b0050e7f69847bmr1862017lfv.68.1705178881805;
        Sat, 13 Jan 2024 12:48:01 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id m20-20020a0565120a9400b0050ea8c7b2edsm930528lfu.304.2024.01.13.12.48.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 13 Jan 2024 12:48:01 -0800 (PST)
Date: Sat, 13 Jan 2024 21:47:57 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: "Transfer event TRB DMA ptr not part of current TD" spam after
 USB disconnection
Message-ID: <20240113214757.3f658913@foxbook>
In-Reply-To: <20240112235205.1259f60c@foxbook>
References: <20240112235205.1259f60c@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

CC'ing XHCI driver maintainer.

> Disconnecting a high- or super-speed UVC camera from USB 3.0 port
> during recording prints a lot of these errors.

I made progress on this issue and I know what happens, I only don't
know whose fault it is and what the proper solution should be.


The host controller, in case it's a hardware bug:
NEC Corporation uPD720200 USB 3.0 Host Controller [1033:0194] (rev 03)


And this is what happens when errors appear on a running isoch EP.
I added debug code which traces execution and prints full contents of
the failing TRBs.


# errors in single TDs at offsets 3c0 and 3d0 are dealt with cleanly

[ 8350.611162] xhci_hcd 0000:02:00.0: handle_tx_event: ep_trb_dma 108b043c0 comp_code 4
[ 8350.611166] xhci_hcd 0000:02:00.0: dump first TRB: 108b043c0 -> 000000010986e6a0 0004099c 80001424
[ 8350.611168] xhci_hcd 0000:02:00.0: dump last TRB:  108b043c0 -> 000000010986e6a0 0004099c 80001424
[ 8350.611171] xhci_hcd 0000:02:00.0: process_isoc_td comp_code 4 last_in_td 1
[ 8350.611172] xhci_hcd 0000:02:00.0: finish_td: comp_code 4

[ 8350.611287] xhci_hcd 0000:02:00.0: handle_tx_event: ep_trb_dma 108b043d0 comp_code 4
[ 8350.611291] xhci_hcd 0000:02:00.0: dump first TRB: 108b043d0 -> 000000010986f03c 0004099c 80001424
[ 8350.611293] xhci_hcd 0000:02:00.0: dump last TRB:  108b043d0 -> 000000010986f03c 0004099c 80001424
[ 8350.611295] xhci_hcd 0000:02:00.0: process_isoc_td comp_code 4 last_in_td 1
[ 8350.611297] xhci_hcd 0000:02:00.0: finish_td: comp_code 4

# then a chained TD appears at 3e0 and 3f0 and signals an error at 3e0

[ 8350.611412] xhci_hcd 0000:02:00.0: handle_tx_event: ep_trb_dma 108b043e0 comp_code 4
[ 8350.611416] xhci_hcd 0000:02:00.0: dump first TRB: 108b043e0 -> 000000010986f9d8 00040628 80001414
[ 8350.611418] xhci_hcd 0000:02:00.0: dump last TRB:  108b043f0 -> 0000000109870000 00000374 00000424
[ 8350.611421] xhci_hcd 0000:02:00.0: process_isoc_td comp_code 4 last_in_td 0

# process_isoc_td found that it isn't the last TRB in this TD and didn't call finish_td
# the driver still waits for 3f0 completion, but 400 arrives instead

[ 8350.611536] xhci_hcd 0000:02:00.0: handle_tx_event: ep_trb_dma 108b04400 comp_code 4
[ 8350.611540] xhci_hcd 0000:02:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 4

# now everything is out of sync and the last message repeats ad nauseam


To my layman eye the chained TD looks OK (and has the right total size
of 0x99c). So the question is if the hardware is right to signal failure
on the first TRD only, and how the driver should handle it?


Thanks,
Michal

