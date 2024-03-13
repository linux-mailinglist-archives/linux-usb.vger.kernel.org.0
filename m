Return-Path: <linux-usb+bounces-7940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EA787B461
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 23:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79FA1B23544
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 22:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444A554725;
	Wed, 13 Mar 2024 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRmjRg4X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037E1A38F3
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 22:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710369041; cv=none; b=n6Ni+WfCjJxalu0wlgKMhbHEEw5RSXKlG5ep86OjaYDR4387P/rdF0ItysLSI0zdos91rqVQ6VPk73vPtYU30FLeBE6FBMiHPN19uV/Pqac4e//L5M2kEsRazLiTir3CgedcS0TeYUnoTHhaGsnSLWJW3zbnoeObq8xtCWo8JqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710369041; c=relaxed/simple;
	bh=K2vItKUSPwjVNWTaNx+deqah7GibR40npGAyO5smBOk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d5N0hGZVKIMeMe7PNqpkO0E/YDV1+lZo13D1mGdBk3ptJrQ7gC78SxKGHYWzQbIuT37iLNU7BalUwCB2B5UMhDcGMOqRpQLdZgQoLkmVp6hF+/7U2npyHEaWN9Xmd3s961Ztfvx0k3EpVppJr5KGpTCanmko7beVqPUZLEeAshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRmjRg4X; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so255626276.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710369039; x=1710973839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K2vItKUSPwjVNWTaNx+deqah7GibR40npGAyO5smBOk=;
        b=FRmjRg4XwJqmqypzbG4/aj0ibBbb83OOufBipXlLTxOg7F66sx11ayAkx8Pm9x2P6z
         9WYHXKQXNxr9OrbWxqpku+BbEfcE8AtlMuKTzLKI2I+uIvRjoeuEKbMeZQlZRpSon9JQ
         1txNPtHaRcF5KU0MREizdIwyKyhxKQIegIiWKbV8sYeTLjlS/z9YffPXThitsLG2P86T
         gAuToIieZnNmJeJg/rAvSokyNwugJUKhARyQ74AoxmDbekYgBx1racLCHFwwOUZY7GIj
         xsmxcAy3jAl8bKiBH+zPe11FxW9ibSoaJTA6su3OrHc/8Erw16YiObqkA6MTItDvP9BQ
         zPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710369039; x=1710973839;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2vItKUSPwjVNWTaNx+deqah7GibR40npGAyO5smBOk=;
        b=EWoha+6kbX+GcNvn+d1KOt/jcAv/WM/cQfw/IXjzw8D4jLJUtnx2DM8btctvkoySk/
         7u+GYrYNeAhcwij1FzzlLzxDYn8VZHY/D+snpN6p2yzePREKxNzii1dN2Kw4jYnNo2Yj
         Zx3cNdFpLbU3glUq6vAAlf9jy3iFvXHRgbwnDpH+HP48SRkqrKaJhf6dCfCP8izcr8tn
         hwP/h+N47cdM/PrlVuGarGiu+jGNocdMfbmof5Hu4NnkpNH+vl2NzRa9Gg7uO1vC2icq
         zy0lLdvW+rBy+ULt1hEMvFlgdDk2htXHuIjpM0ttiiS0FFBZfTM4HMduCvnoyredPbri
         MGLQ==
X-Gm-Message-State: AOJu0YwmZVfLhjkiQ1+I00lAaTnnqagVeH8Q6jHZwI4WjemeL6y8+hyL
	zp+XZlaM6hWV4Q6CDhMutilqpf+SjkqSkxQbqfP5E+1MmGMf1Qnb1MiLNlXA0nVfcausVcsmqd8
	1rrOUX12xisUkcNx9ojCEA1iekP8=
X-Google-Smtp-Source: AGHT+IGDrvviJxHI8LumXawQmYZe+I38zK3eNbzHVaUbz3l3Arg+5U+STj8YiGQX5zgJ/bkjqgqBHVKfxm/kQcWb/Uw=
X-Received: by 2002:a05:6902:304:b0:dd1:4908:7a91 with SMTP id
 b4-20020a056902030400b00dd149087a91mr44964ybs.49.1710369039297; Wed, 13 Mar
 2024 15:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Wed, 13 Mar 2024 22:30:28 +0000
Message-ID: <CAP-bSRazabvM26Z2JnQw0yxKU6Sh1dOgdNaQV7_fi=O5noqc2g@mail.gmail.com>
Subject: BUG: new USB3 devices not detected after unplugging dock
To: mathias.nyman@intel.com
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hardware: Razer Blade 15 2018 Base, HP G5 USB-C dock
Kernel: all tested including 6.8.0-rc7

The HP G5 dock uses Alt Mode for external monitors. Booting the kernel
with dock connected and then unplugging and replugging the dock
results in the monitors and USB3 devices no longer being detected
(some USB2 devices are still detected). By not detected, I mean that
the kernel log does not show anything at all when the device is
plugged into the USB-C port. This is not a problem with the dock - a
USB-C NVME drive was plugged in and also not detected, and neither was
the dock after being power cycled. I have narrowed this problem down
to the usb3 and usb4 bus devices being automatically suspended after
the dock is unplugged:

/sys/bus/usb/devices# cat usb[34]/power/runtime_status
suspended
suspended
/sys/bus/usb/devices# cat usb[34]/power/control
auto
auto

If I plug the dock (or NVME drive) in and then force either of these
bus devices on (echo on > usb3/power/control), then the port wakes up,
and the dock and displays plugged into it are detected.

This problem seems to be related to the external monitors connected to
the dock - with a single display connected, it happens rarely, but
with two displays it happens every time the dock is unplugged. If the
kernel is booted with "usbcore.autosuspend=-1" then the problem never
occurs.

