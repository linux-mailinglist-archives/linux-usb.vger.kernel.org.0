Return-Path: <linux-usb+bounces-6408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C036854B7F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 15:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C3D31C21B24
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 14:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFDB5A4ED;
	Wed, 14 Feb 2024 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="demHyXtC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A55914A
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921300; cv=none; b=fTGjtPbjNGvx+VdCAi2JwedhHGsU2NZ1rG93JmFXGQuDvrwrYSZXOkXoPRHi8Rpal2yzeYKtug8kVDWJsW76/eq+CFOuoOaFGWm4jVOYQGjqqtzxpudfCJKFd1O1TsWJ3BPM92XVkYJOb7B/HW0/XRbnJFy99J2lsYip3jIpTwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921300; c=relaxed/simple;
	bh=1whvm6SwoMVO0hP8q2dpi9WSsRQKQSxxaxsFoEZfL7E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SOoJ3vgLa0cjb5vjbMB8YfW8eFAOsVSCFqVsjr/XjlaahExnbgUYOR0vijYrjkb9rCL0v07nuXMicj/jzlqHd/426tzLVssL9jD1Wl1GbzB9XwwFWr92KOfjjD42mUMp1yYRaFOvt/ErfILrh3OIsLk3jZm5KDXzBQPo+rRU7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=demHyXtC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6077a1d441eso24117997b3.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 06:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707921298; x=1708526098; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o53oChH2dA8Tqp7G6yMRsPjZnp5bLyU1vAtA0LCu1CM=;
        b=demHyXtCBPKp7Z89fpLyTCBiQWvenb0CMSlaw7rWlTm4aG4JVC/U5X30rbwF+exD39
         BbKhzuAGmAommVecCBBWvaRMCrPhp8n5I2jFdtL1+9c3MbUMi5WMqUNdZ+CihzqmzYiB
         TQ06xVBVrzVdcfWdy5K7lezAWGA9fPDHuTrJ3QjwOgJKcHEYjrSUldv7etdMu0gjCvZv
         Gg1oZR/eVQCK5GBY9FGNakUUVVz6wdoeupWasUSpG4jOgGoaMJTwvawZh80JymS6xKrC
         ENtdf4bGEi1Q+2xEIkSuf/Hm7IqUZ56FiHyTaZ6UQlydqB51Jdf1fJyC+00sM2NSO1i8
         kc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921298; x=1708526098;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o53oChH2dA8Tqp7G6yMRsPjZnp5bLyU1vAtA0LCu1CM=;
        b=BCPW5nwm1btblxHk/84hMQKjDk44ojpWQ5QRXM9M7HDgSS8ZvPihT6bAn7zRMJnaON
         FEhVQv1gkzaJbhuyjrJH4lGrAkWIdmrdVBWKLQOeMgodwvsGje2UfksnGmP4+hXzLadV
         mCJE69stti8khEgk3q5ppltzP83WwBQqCGRv7xhfs4qfiSqrHxYwmzpD9nBWcABRo9ha
         xlvm7weXVEaCCq+KbxLYKbjE2WN4nBY3AHcOSS5Pd62nqLhjF8tWdsJDH8qU25erL1uT
         xg7mXhNTNj8RSE3wF4iw5yafTfp4jEZU+0JpNJWZxsUYZT3M2a40dKG7GjzKBa57fYWV
         h9YQ==
X-Gm-Message-State: AOJu0YzN2KWwbgLF4mTdR3dLIEtup5wirytTZH3bpF+qry5iragxql9G
	V5viEdDRBvsF8F5OE2xL7NlcbDpNOkFRBin8XpGnFUfs2UsRqtz8/KXWmL1ITodUQaxiPAiDraa
	cdnie5WZwh7HYR6agLgiLfI2Bko8LcH1EvHM=
X-Google-Smtp-Source: AGHT+IFpDohuZcirFKGNX6IjgUbjsYMWEWhbFoq0G68/hMWPDDBawyDqf5j0LWnZ+909Dv5A3hxL3nlymdCO6gPnOxo=
X-Received: by 2002:a81:9c42:0:b0:607:7e50:1a11 with SMTP id
 n2-20020a819c42000000b006077e501a11mr2394698ywa.19.1707921297844; Wed, 14 Feb
 2024 06:34:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 14 Feb 2024 20:04:46 +0530
Message-ID: <CAHhAz+isQ5gUDBAPv3WkK6QQL6d4d0Zk4U9VCrKwKaS1RrQX+g@mail.gmail.com>
Subject: usb: read interface string descriptor(iInterface) from linux service
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI all,

USB devices can have multiple interfaces (functional units) that serve
different purposes (e.g., data transfer, control, audio, etc.).

Each interface can have an associated string descriptor (referred to
as iInterface). The string descriptor provides a human-readable name
or description for the interface.

From user space service utility, How to scan all the USB devices
connected to the system and read each interface string
descriptor(iInterface)  and check whether it matches "Particular
String" or not.

The service program should trigger scanning all the USB devices on any
USB device detection or removal. Can libusb be used for it?

Any input would be appreciated.


-- 
Thanks,
Sekhar

