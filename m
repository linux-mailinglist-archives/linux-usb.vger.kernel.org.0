Return-Path: <linux-usb+bounces-11339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6CE90942B
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 00:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41244B226B8
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 22:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304BA1862AE;
	Fri, 14 Jun 2024 22:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqWE9DnU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116A137905
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718404286; cv=none; b=i/yDKQg5STXEX5vOJzyAz9yquf2NV+/NyVNgwSghFhhccTk+ZWRP2ZttKeG8nXc+fReIU1Fqjq+qtqQqS5dERUrKAIscmoObt2StghYhEuFty52s1uZp1OE6uDFuw18IkdKwIspP6tW51G86f8d8qP9oyEAkLsaKXnCCEFSuJaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718404286; c=relaxed/simple;
	bh=St0Fboy5DSc+X5KVuPN6racQL9+WHKgVS4RaaeNbdqI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fZHIWmtHPITuWa1fTFje8uK7XBH/IcCshmPN0L4eRYvEUSV/TPIPeHmHi1obRUuyzsXsB88IrbAMXwOJ0+kPZ0/TGd+zIBzO3M8J8k3KiJh0Pnz2qETtbTQCHrl1wSPtKcduF7cm4fplwAELPvixquZoSMzW6d8QRc1b1rVSss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqWE9DnU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4217926991fso25631075e9.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718404283; x=1719009083; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=St0Fboy5DSc+X5KVuPN6racQL9+WHKgVS4RaaeNbdqI=;
        b=iqWE9DnUJ6N5HgvG5O0zzBiL6+HyvXotMoawG4dtjOzESvbndZAauD7hGSa1ynyA/R
         k0/vp8F3m4Tj0ol+1bca8LSzaLzp6Fd7LokUIwFmniHXogJmcNGt9gw8sTBvGHjxoogn
         r/9F57BHjKjERQbnGMGOJRered7x0jL/oeZKsENbU7BlH2nAKZrM60vI294yqJupStE0
         rbrqEanYpeDzCU3QV7hePefPw2yoVI/xltYtdr53sNtpDDx/0AAqmT42TobK+vRZF5uL
         +mYeWRoq4oXQ79LXNpcWCU4DHThpDQ10TbCW+QvLi2V/TlMibWv6QZgJYtQAW64rdCDP
         t3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718404283; x=1719009083;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=St0Fboy5DSc+X5KVuPN6racQL9+WHKgVS4RaaeNbdqI=;
        b=hjqaig4mdOMXykY32AMGG/c6gtcTTlQXVthbF65U/uVP8WbbZLiixoN8FpFifSJ8gQ
         vyQFCNL06wKl1snowPWiy0DUN3wOOdXaLCQ5dJ9q4E/7lFshT+0dFxR/glV1pRjOojO/
         iALbQsEJSjN2TJiTyzx5zPP3NBbDmg+bCASnI2INETEYNIyY/9rejWtd0AYAXsKpf90L
         lNfC5HRk6auBtvr77DqKlbHDAy6Cf6PORZJIzPVYKbdGxWsJ7zRmcrCn3MfapS2Ht3l3
         mHle9yEIEEapCTTeYObDSH9r8crHMKviMRZIQclwQV8E7i0/y1X2ohNvVKOKpvUn3l3z
         gXhg==
X-Gm-Message-State: AOJu0YwawjzCFXFVpzHjPxt0zt/KQJzR6ur4XtTjVLydMuwM3YDmnYbW
	zKIeU1eCzIs705q9YcT5ppKJk9pU5tkudIKxMru+S8smkW32XkXiRrHcIOQovRav9S4flGCDB28
	IYn14bKYvFAN3Du6sOmbUo8IkFJg=
X-Google-Smtp-Source: AGHT+IFs2XyD0v75i1MwOu9Ic07JPEn4Ckyv6cQzWYrjphQehJ6ar87BJzweGuoJtfwZH3LIqSBDlFYWzoGJEMxhk1c=
X-Received: by 2002:a7b:cc84:0:b0:422:5953:343b with SMTP id
 5b1f17b1804b1-42304858452mr33138385e9.34.1718404283134; Fri, 14 Jun 2024
 15:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 15 Jun 2024 00:31:12 +0200
Message-ID: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
Subject: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alan,

I'm working on implementing a USB proxy that uses libusb on one side
and Raw Gadget on the other. The idea is to pass all requests received
from the host via Raw Gadget to the proxied device via libusb and
report back the responses.

However, I've stumbled upon an issue with non-0-length control
requests that get stalled by the proxied device.

To pass an OUT control request to the device via libusb I need to
first retrieve the data for the request from the host. And with Raw
Gadget I can do that via USB_RAW_IOCTL_EP0_READ, which internally
calls usb_ep_queue, waits for its completion, and copies the data to
userspace.

But the problem is that once I retrieve the data, the request is
automatically acked. Thus, if the proxied device stalls the request,
it's already too late to stall it via Raw Gadget.

AFAIU, GadgetFS works the same way.

Is there a way to work around this? If this requires a change is Raw
Gadget, that is fine. But I'm wondering if this is possible to do at
all with the USB Gadget API: AFAIU, we have to either stall or
retrieve the data; we cannot do both.

If this is indeed impossible, perhaps you know if there's a way to
directly use usbfs to separately submit the control request header to
the proxied device to figure out if it wants to stall? And only then
retrieve the data from the host via Raw Gadget if the device doesn't
stall.

Thank you!

