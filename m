Return-Path: <linux-usb+bounces-24028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62819AB97FF
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 10:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65ADB17E8A6
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAA322F392;
	Fri, 16 May 2025 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9Ul91F2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA722F386
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385092; cv=none; b=rL9qDfv4REeVN8VzJa7OFK6x+sxIwB1i5eyynKw93KBSKJE69CxD4JFooOapk/1zYvRKQsVM5p4gdPjMu4KlKOpsLPQu+ui3tphnemv5crAl/mZ8lr4oofhsJMg1WSPUPfiY3oYEBIz62QgXsJvqBO8mIG1HtPYTgRXUjo+h9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385092; c=relaxed/simple;
	bh=izC76TJimWR9irt61nqfuXp2b3TX9UylzIWfIIndbic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUH1El1FI6v3dhhasWZDCoKXTZhfshHA9SUzKLuVDMGfcuSlpK8bYmqUDzvvP4uNiFOz9XJpAWtdHvvpQ/J9dNnpDzvBe4609Biucpft50yln7edMfsmn4BAIYDdhlC83Q5x+1Lx+mf5H7yqIhG8GWzMEamtXvYUzDmnYmXi0bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9Ul91F2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-327fa3cece6so18772931fa.3
        for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747385089; x=1747989889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+92OwXwvCVxG6tIPaLFe+iTabRc+1yfWf72m8uioNDA=;
        b=m9Ul91F2trHl4W7+RDINrphwYCNYPTiu7/xa8wQosR7Bo1jjeLZUyd+UIT19lKpsyN
         ZOrawx1ztIPNnFR6IF2UiyEkDbHXl+4EjHaGTihEdQwN1kUAsgJ8Xsfer/ahLnZ2rRIY
         9NLESuBOLLucV1JQVZ7GlahND5B1GSuutvljHKMjGbPmC32x2HIjII0gDHQi/bxBmrII
         IPjJ04RXtRHiAdOhEejkhyW1Av1utANZit7oZFTfZpp7PYlImPXy9LjQIb1BE5GCPNvD
         sRoi2WZ+cVek28nodzIjopAbXwgGHKhvnM05TNdo8oG5J36jjXpvFJi93UnLzldfQGE3
         Vd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385089; x=1747989889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+92OwXwvCVxG6tIPaLFe+iTabRc+1yfWf72m8uioNDA=;
        b=IVG5CMevFwCzvVkHAp54c2yNiH3tdAesmIzVp1GmSRW+yMssOFBC0WatG+zok4alTu
         /KLfvUlFrLX6uQ+jsK57+gpBufuDG6TONW297L4y1fj0QsDiiyO2VcszxtyyrQGgRuTv
         J0abGcKg1FU3+8txfgNQ3WJKNxTDd/vztc9c0yLSoqnUZ4ISi3UD3vwlMKvITuNmyhOQ
         bfrFhHIg7NZHSprY1cujXemKPvOGW6OvufBKBaUaHVePgVhP84RLKHtb7VQRQXrd3BDF
         6lCk6cSPN2IvTPW3z6mxT/DV2X92a6bLr47tGZ6vxCaBg1JCxfASZdFMQstMbzCCXer/
         gbKg==
X-Forwarded-Encrypted: i=1; AJvYcCX0VdRzygQKDnVqHr+yN/M9yp7m67BsMqDjVI48WX/NJfcdQV+br0UjCdi+/yqz83/rNoyFwkLnLKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtK/RvbmiOsNFX2dspBtYG7+M9uwOg8O8zSia6gzcOvYinCq7
	xqQHGQDbBzdVpwS0ZpY0I4S6t7tn7UGdcfZqW7kurRrH4PdoqQAyCRGs
X-Gm-Gg: ASbGncs//r92YFhE2aRTk6nuzdMdni/JnIg+pfTd8Rr61BtSniJTmdQGvQIxAeqp0Tf
	wt6+AVCk4OPbGGlZEHt9btiK6RmgO/e/w3EgS65U0X7BHZkJ0rukIlHLjJ73yaXyiiOg6V3rhs0
	G1aIkinfaacPYG9rJhMN2ScefqqZnppmctmq4O3uLKGlPUD7NkhfWUaPsC17j+SA4TzXDyTzDcX
	16NE1lo08p75s/Gvhg9y99nUEl5Tx3T4t13ghVHN1+43+kq8C/d4skG9E81y7Z4c4sIxPwh3YVB
	PAC6AC1M4puX/0NYK5/8xVT519TsOfTAnXcTEwrtjFlwlSjNDnQl4M7pQHaPHXC4isAc
X-Google-Smtp-Source: AGHT+IGwwXB4AsASydMYwYtzOZmbXrFWy1QihZRylu4OKFs+fd+rgivTK5QxR32/f7dYJ7v3OWRZ7w==
X-Received: by 2002:a05:651c:111b:b0:30d:dd65:233f with SMTP id 38308e7fff4ca-328076e6d02mr7194581fa.4.1747385088437;
        Fri, 16 May 2025 01:44:48 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084de8bbsm3137241fa.60.2025.05.16.01.44.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 16 May 2025 01:44:48 -0700 (PDT)
Date: Fri, 16 May 2025 10:44:44 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Guan Wang <guan.wang.jy@gmail.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, guan.wang.jy@renesas.com
Subject: Re: [ISSUE REPORT] xHCI infinite endpoint reset loop on full-speed
 after transfer error
Message-ID: <20250516104444.7d7d95d7@foxbook>
In-Reply-To: <20250512101913.69562fd3@foxbook>
References: <20250512063912.3331082-1-guan.wang.jy@renesas.com>
	<20250512101913.69562fd3@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 May 2025 10:19:13 +0200, Micha=C5=82 Pecio wrote:
> On Mon, 12 May 2025 14:39:13 +0800, Guan Wang wrote:
> > Using Linux version 6.15.0-rc5-00032, I encountered an issue where
> > the xHCI controller enters an infinite loop while attempting to
> > recover a USB endpoint. This causes the xHCI driver to get stuck,
> > and no USB transfers can proceed.
> >=20
> > This issue appears to only occur with full-speed bulk devices such
> > as USB serial adapters(e.g., USB-Serial or CDC-ACM class). I've
> > reproduced it using CH340 and CP2102 USB serial devices.
> >=20
> > **Steps to reproduce:**
> > 1. Attach the device.
> > 2. Start continuous data transfer (e.g., `cat /dev/ttyUSB0`).
> > 3. Induce transfer errors via:
> >    - EMI interference
> >    - Sudden temperature changes
> >    - Long USB cables
> >    - Briefly shorting DP/DM lines to simulate a transaction error
> >=20
> > After this, the xHCI controller enters an infinite reset loop on the
> > affected endpoint. "Transfer error" messages continuously appear in
> > the logs, creating a log storm. The issue seems to improve or
> > disappear when an external high-speed USB hub is inserted between
> > the host and device. =20
>=20
> Greg may be asking the right question.
>=20
> I tried this on 3ce9925823c7, which is linus/master from a few days
> ago, with uPD720202 and PL2303HX or CH341A in TX-RX loopback. I
> temporarily disconnect D- to get transaction errors without detaching
> the device.
>=20
> All characters sent during disconnection are lost, and sometimes one
> or two after reconnection too (bug?), but things are back to normal
> then.

This has all the signs of toggle mismatch: the OUT transfer succeeds,
but no corresponding IN transfer occurs, even though URBs are clearly
pending because the next character sent does generate an IN transfer
without new IN URB submission in between.

I wonder if your issue may simply be a matter of overly pedantic host
controller refusing to accept DATA1 PID right after Reset Endpoint, on
the grounds that it must be a software bug (which it is).

> OTOH, it stops working if I insert a high-speed hub upstream of the D-
> switch (tried with two hubs). But still no transaction error storm.

This appears to be usb-serial not resubmitting URBs failed with -EPIPE.
Simply reopening the port restores operation.

