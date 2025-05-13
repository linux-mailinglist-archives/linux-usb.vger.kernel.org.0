Return-Path: <linux-usb+bounces-23929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA88AB5D9D
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 22:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A0F1B482A1
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 20:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5221F3BA4;
	Tue, 13 May 2025 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNqMtHLP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794201F1538
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167549; cv=none; b=NVl9z5rqUSULOZO88aIYjYOj6G/XbFqWGWe5QhK+6zt2tEt7QXevoUgBGiHSpbfWESsIBrURdegGKl4g+6hblBtIdIBTfHJ8cMZUrsTYZ3YmJABEbXebvgUgi3fVLcvPVWwOvYWKfYRYDFPcqXFQBvR01W8NikNI8JA71ijCo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167549; c=relaxed/simple;
	bh=HxKII0uQjussHoNkyaFNQGoWhh50MS9weUsiIGIqyR0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kcRV11w7IbNKyubti22fcO1RTklOLa7Pm2Ri0nZ9rmNV6g9ZpPkXXvXDNHdo6mIOCbL4vC8k+/JYZRhQTYmMV5wcQajY/93aHeAxqSDGlhxKoRl2sSOUP0VYNwl7t6pLqEpryMKJA6mUmsLwgifARwsYFJIe5ufyeEDTvUcXJNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNqMtHLP; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54998f865b8so6767346e87.3
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747167545; x=1747772345; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HxKII0uQjussHoNkyaFNQGoWhh50MS9weUsiIGIqyR0=;
        b=VNqMtHLPTyXCj+AvEi1EI5z7l1qvoDXDWLp0FrslEGPIRNNnMxGPq8DMyUaG0vG2r+
         Lti+Mjeq+p6ZXjYRaF0Xh8wkinjeq0zEQUbPrzXnTQCO7KDayB73dRwO1SCvNKw1Mdfs
         cC092iGPcJIx+XuuX2ljrwvFMLZjAAeA1k5J6Ha34REGPetb1GRKW7iHiw9vRBl4vT3R
         aGxXPTQgbUcFOL9R59hE2+jw8YMMuQJVJTRt3LIjc0LNBxSDGc5P+axkJlVZXR7+fmWJ
         3KyYfX61UOoS6a2W5wHiHeZ1jX3N7cBNQNmgki3B0qUbJyvvRpsHWdEuOEt8hXEQCW5G
         Ha7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747167545; x=1747772345;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HxKII0uQjussHoNkyaFNQGoWhh50MS9weUsiIGIqyR0=;
        b=GjcShzoH2HHJNMgpQy1SgPExnv39krKC56AeUihQJxyb1c0Jr58sdD7UV8Qsn5hdXW
         sLceHv9mvY5PFufdvsZtJEOO7l2Z68ybIEeP+vcnLyuSm9wJ7dunj4WfsmB6DShuKj5s
         lEAXglCp0oiTnCtWMa3S5/WZocWkrO4M2Ao6kX7Y4T3+cXXwdgTOGj1274tv1XqFrZgi
         mIUR6dzBJubb2N4SFfvoVDthjTm7rtSwZ+d/4uenvBhgUU4ZUD1yqIC7vLBck3rMypLu
         6w7eG0oLHIFeh0IKT5E35FFKAnTgsZaDvl60BsFEAFFlUpyhmxAQ2s/YoWCHaYwi0Tvq
         qo2Q==
X-Gm-Message-State: AOJu0Yz1qRe1qCmB7MYyolIW5gHyWYldi27HffwcD6yVj8MjvHj43/xM
	RDrWXvXvUilVU1ezJ8dqaGJptJ0aCTFRTFpQMWJ/BRYx3d+E5zUokOW9umMVb3e3LEPwPDIPQgm
	QFbt943dpzrd3bx7HETlrjuS+bILxRA==
X-Gm-Gg: ASbGncvvpl3uVRklleTXuUcl+yBK5i4qE3A9jHMgMgXAvkcUeVFPPL/yyIuGtTVPKCO
	e32OTgmS18b0lXrWpGCWemSM62CjbDs+Md9RGie9PGf6zqXmTKotkoUmZ5V7bRgSu/EdotJJtsu
	moLd49/LxXLWkzpu6PzPNt6s36ON3Ao39WDgw=
X-Google-Smtp-Source: AGHT+IEBaqx41aAqLBPfLdQYdamSsoylugsfdAaKI6DQ4kBMBOyGzCzqmc5+luCjOddzBPTLNdzpjXxu2jJGOar1lTE=
X-Received: by 2002:a05:6512:2588:b0:54f:c450:3121 with SMTP id
 2adb3069b0e04-550d5fbebebmr215979e87.21.1747167544965; Tue, 13 May 2025
 13:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Wed, 14 May 2025 04:18:53 +0800
X-Gm-Features: AX0GCFsNAUxif11GO0OruuUk5-mI-4AaQm-bofzZeEHWveAuHRXbJDKmb8u_qbw
Message-ID: <CAGnHSEnc3NUQgUbybq6RXQ__1SOx7wBDwtJJY0Y_K33epbu3LA@mail.gmail.com>
Subject: Problem with only SuperSpeedPlus on different sets of hosts and devices
To: linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

So I have been bumping into problems when using my
SuperSpeedPlus-capable UAS drives/enclosures (with bridge chips from
different vendors, namely ASMedia and Realtek).

I don't exactly remember when I first noticed the problem because at
that time I only had one cheap (Intel Alder Lake) laptop from a
Chinese vendor (Chuwi) with Gen 2 ports (one A + one C) and I thought
maybe they were fake or something, but it has probably been a year or
longer. And now I am also experiencing it on a desktop with an XHCI
card with two C ports (The controller is ASMedia ASM3142, I think).

Basically the problem is that the device would seem to hang and/or
reset, often (if not always) for just *either* reading or writing.
Occasionally the same device (on the same host/port) will work
perfectly fine. By that I mean it *feels like* whether the problem
will show up is determined at the time the device is connected /
"initialized" -- if things happen to have "gone right" at that stage,
it will keep on working fine (until e.g. physical reconnection /
driver reinitialization). (But it's not entirely conclusive whether
that is really the case.)

I don't think it is because any of the devices / ports / cables are
broken or bad in any sense, because the problem occurs literally on
*entirely different sets* of them (including host controller / ports).
I remember it was first noticed on a few UAS-SATA enclosures that had
an ASMedia ASM225CM (which is USB 3.x Gen 2) bridge, and the issue
could be observed when the drive is connected to either the A port or
the C port of my Intel laptop. And now I can observe similar problems
on a few UAS-NVMe enclosures (which have either an ASMedia or a
Realtek bridge). (And because of the SATA case, in which a WD Green
SSD was inside, I don't think it has anything to do with insufficient
/ unstable port power or so either.)

The only way I can workaround this problem is to use a Gen 1 /
SuperSpeed cable. So far I haven't had any problems with any of my
devices whenever they are working at SuperSpeed. I also have an AMD
laptop with only Gen 1 ports, and they work perfectly fine on that
host as well.

I've also tried to disable UAS by using the "u quirk", but the problem
remains, so it doesn't seem to have anything to do with that.

So has anyone ever experienced / heard of similar issues? Anything I
could try / test further in order to isolate the cause? Is there any
existing XHCI driver quirk or so that could be relevant?

P.S. Both machines have Arch Linux (not any derivative) on them, so I
have been rolling through the year(s) with pretty-recent (and
pretty-upstream, AFAIK) kernels. No LTS or anything.

Regards,
Tom

