Return-Path: <linux-usb+bounces-29417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E284BEB237
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 20:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99C234F0231
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 18:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CDB3064AF;
	Fri, 17 Oct 2025 18:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2dKfumm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D852C21D4
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 18:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724064; cv=none; b=kwhs4MTJrhGsKd8Rn4dBZhjDBsSFZyOvTvzcpNRV9TRP7HXjmhJCCNGJRDOSiplbI+qWsn07+rLHmmUNh7N6jsDTS1Z5GXJ6kZY2/Q30pVw2ZMlFHdpdQaPQ0myvbN8s2u6R/CWSI+g648KpM0fKSqD0D0QPNnz3S/Po38Hs+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724064; c=relaxed/simple;
	bh=l7aLsr3lGwl503/0vFKteyC9mgKn1yeC8RV1DXvNdko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJsmkZfaM+e9/hmlqt6Frwgz3UUizDs0jHJV2rrr1Qdgc6RLZo/SshFcwn8aAnozab8S1B3PGq0S+NBIrhX/c/uSLFkvAFyR4LlJ8wgK4QTjnBzlrpISmfOxNXeKg8Ve3cITXmhsaNHFmArDddXCrtrLgGO/pHF1V/YjOQSU2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2dKfumm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b40f11a1027so404113566b.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 11:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760724061; x=1761328861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlVS/YQvuUI66d8E0zD5tvcwrlr3PI6dGId22I7Pyhg=;
        b=l2dKfummH06pCxaiTL0TTmkA+ujxgaRy6XQ5fWvLRxaYWwBKv/0z7tOBiP07sIqyk+
         5Vh7Fsn39OVyVEmV9sXaIyN5/wvpsDqOQRHNfNyJmosXU/MYEcmboE/5Rp4lxGex443Q
         gkTOSepCIARfSR5EjiqVVT15H6+3+z6gH6FTPpmpaRwGm5lGYoBZffb9WzdfyMb+18Dz
         uVauXa6V1zFM25TmMDf0e4sJZkXZun4NeDHEgFccaz1m0zyqU10W4wMu7EB+sdIbDPIg
         VtGJ+7Y7l+T+gp8qsTALWlFlLdxWs7z7YTElHEadMeA0s2X6/9rOmXrd4kFk6WqjOKwp
         8AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724061; x=1761328861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlVS/YQvuUI66d8E0zD5tvcwrlr3PI6dGId22I7Pyhg=;
        b=aFyy8cIZgpQFAlMmiuOYPF8TyllMB24WCLXR880H/7Ubw5GmyYj8QIv+P8buq1zclR
         Ph0sgNbiVPdZBjL9tkdjJDo0hEZRKhSMqxt0bp7rM1eXGj5q0OBhpOKV670d3noMstCP
         pO2ByGw/xlgKfq5npDwH40oKqwjosac9S0dLvHkk5ab5J7wMgpLTqdFthFTuPUAFfIDS
         +L/BToL3HU3IBbzTRS/9Ua9KRVI5Hz8ykfiK7ml8gPugb00eYfHObfosBRSDjXTbuNLY
         vMj5nMNwAFi3mUGXKEwCaqSWxwrarFdlXlJUiz1SKjUQxwfvgO2ftkvGZDY6T5PuvQ5D
         w0ng==
X-Forwarded-Encrypted: i=1; AJvYcCX+5IWARxPjxKAuuxk+ndnJI8qHJwjgHTA8JkyM9X6Fbc26mA5ciZ56bgwcTE9IVYD+VCnFrQF4G1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3q83PaTffuZv2vzlpanC0kguAmHt9ivwrHfcUX3aT34P5As83
	z0UGwCxjLVxZXrBy59UzLx5ZN7Dc7+IQCe4gvogg/Hmq3cjMmV6+hs0d
X-Gm-Gg: ASbGnctj91qWcaE8urgNjG0fzmNIhVmgq68bm17jpvx5nbaqgEr2o/9MG/DG0e3sB5U
	EhRYWBVQJkh/y3BRjV+PhpuMQqd43u7qRzMXVxKpglBnwmgPkqZQm9arBlzb0vSMsuVF+y4XLYa
	2xqUZaTGuxHiFzdjBkWWuVhqcgBEHI1/zB+khuzxyrX+bjOC1fPOWXE1vPdcgVnFcrkzuQlapYh
	MQEMo8Oo1xrVmbYiHQXumV8tx1mLxPkyepr/vXT8fYzwQ4G6cohjH2khSs9/7SWLBFsJpEE4LpD
	0JZ7iGbMllJKj4LbU8B/lviSBfvzFukl69/I/LTz1iXhxJC/PBKe8/y4D+2kjHaOBXsAZHt4z3/
	MEMTQnVFvhraAHt0WZwEJLJ8tbgZfFFisXt+G+MZgCNxFojg609wBwTZ+yFZ2jaB7Va6+aY6gTM
	YoGZECBLQbn8tYZRBRfPntDwc0NpcHecGzpptLGA==
X-Google-Smtp-Source: AGHT+IH1KVJ+ui/ZFAQLBIIcPCJ0zajE4Hz1riJD2bNBYJiDVQwg0SYyy8DeHRjdB5rZgfmpvEK4Iw==
X-Received: by 2002:a17:907:7f2a:b0:b3d:c3ee:406b with SMTP id a640c23a62f3a-b6475706d92mr409758166b.61.1760724061223;
        Fri, 17 Oct 2025 11:01:01 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83914d0sm34210466b.21.2025.10.17.11.00.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 17 Oct 2025 11:01:00 -0700 (PDT)
Date: Fri, 17 Oct 2025 20:00:48 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Samuil <samuilsgames@protonmail.com>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-usb@vger.kernel.org
Subject: Re: RTW88 USB Wi-Fi Adapter (8822BU) Disconnects and Fails with USB
 Write Errors - Status -71 & -110
Message-ID: <20251017200048.6e748dae.michal.pecio@gmail.com>
In-Reply-To: <7qi-6tBb1frj_rYuHZflT1akP5I6yA2yxTA7Gg8IQBlDIwSqiWx76AFmcirkfHv5VmqQ7CZ4SesZSswoDKzOt3kbgh3MI-4CqEq-RrxHnns=@protonmail.com>
References: <zjR8G0R1ZUFe9h8_ibO-LWc9OOJyMThA9jp9ftYbETLG3IN0cHPvhCAaC9ypGKPbapsbzTH5VqnDhFcX93GkwnG1BEyETplFQmRiGGshBz8=@protonmail.com>
	<20251017005947.54e1944b.michal.pecio@gmail.com>
	<7qi-6tBb1frj_rYuHZflT1akP5I6yA2yxTA7Gg8IQBlDIwSqiWx76AFmcirkfHv5VmqQ7CZ4SesZSswoDKzOt3kbgh3MI-4CqEq-RrxHnns=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 17:25:03 +0000, Samuil wrote:
> > Does it happen every time on every boot?  
> The disconnect happens on every boot although rarely the device is
> able to reconnect again. Usually, however, the adapter just stops
> working until I reboot again.

Well, I had no luck reproducing this on v6.18-rc1.
I left it running overnight with ping traffic ~700KB/s each way.

> > May we know what 'lspci -nn' says about this 0000:02:00.0 controller?  
> 02:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 400 Series Chipset USB 3.1 xHCI Compliant Host Controller [1022:43d5] (rev 01)

Similar to my B350 chipset.

In some stress tests it showed a HW bug which currently isn't being
worked around by xhci_hcd and I think this bug may be responsible for
at least some of the noise you get, namely this sequence with constant
"event dma" but increasing "TD at":

Event dma 0x0000000105a9e110 for ep 0 status 4 not part of TD at 000000011fd2bd30 - 000000011fd2bd50
Event dma 0x0000000105a9e110 for ep 0 status 4 not part of TD at 000000011fd2bd90 - 000000011fd2bdb0  

It's a broken state which rtw88 can't do anything about. The dynamic
debug I asked for may shed some light on how you got into this state.

Whether fixing this would enable rtw88 to continue is unclear, because
everything likely starts with a "Transaction Error" on endpoint 0. That
could either be a one-off error (harmless if xHCI recoveres from it and
rtw88 retries whatever it wanted to do), or the USB device crashes due
to some traffic pattern unique to your network or whatever.

> Are you using a USB 2 port for the adapter to be working properly
> without configuration?

Nope, I made sure to run it SuperSpeed on my buggy AMD chipset.
This is probably unique to your network traffic or hardware (poor
USB link quality? maybe try other ports.)

Still, I would be curious to see this dynamic debug if possible.

Are you able to compile and run a patched kernel?

Regards,
Michal

