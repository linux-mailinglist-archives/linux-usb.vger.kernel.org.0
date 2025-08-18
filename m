Return-Path: <linux-usb+bounces-26998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59072B2B33A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 23:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 629A37A4718
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A581265632;
	Mon, 18 Aug 2025 21:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbKxeTRS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438B146585
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755551472; cv=none; b=s6iahbqjuYsC+RYb07Na6DT90WTPy2FK2m/O+fpaB7ceS4ZwI2oocDBpzBLALRtcCOKQJ2UqSReJgkrX7y+9QfZ1t/Rd+qs5aFreaC2OBDzKYmmvtZOK9TkqZXJ7BGGPn5nt4BO75tV61oOHVotzqcLSNc3cbP4PCz9nmfR+wqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755551472; c=relaxed/simple;
	bh=UJIyNxUgKpmKm2iPEBk8lYWBVJ6uUVk8tfvKgZYRrW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f2XBht2Miv5k9gSnv448GZNl1YkFLeKcPsSfAVOtF5HbdkVuZJIwEBcfhEH+40Ti/VId5yEk/ruI6FDw/Xh9sFfYQD3XPnNHBK7Vh/4NPqDdbPYQFRsD5C58bU9I0xnqquA0FwuMFcZGfcn7oUqVh0Algs9XOPKdiwzj2k924YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbKxeTRS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce510f4f6so4893789e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 14:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755551468; x=1756156268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UJIyNxUgKpmKm2iPEBk8lYWBVJ6uUVk8tfvKgZYRrW4=;
        b=GbKxeTRSvh+bXDZwSB/578ux4Y2t4/CgLYD1ppk1W6Qj9Eq4S8vIKhOeIBsBPMW5q+
         X4OeoDhS33pdx+BwlHhgYtMX6O/eiiTpPv7s6yq4Np1UeIwA+jTm8mv/snar2b6BnW8T
         RwwHJaqrT8ubXr9LLu4VsTRDRE8rNdarRH74n9bkqMtUvQ842CR71lHmeevkZ+QcVCwb
         c7vhRoI3YQQzEPKTiHyFHnm9uhbljpDBbUsKdDdclm8H4eAl/t0LM8bSiS+qBLCOYE5q
         qgxexZV00YQgCnTxF6+cJkkKocKA707heWTj+QaV5rRI6+hiItvlmziexDROJaJRq3Bw
         sKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755551468; x=1756156268;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJIyNxUgKpmKm2iPEBk8lYWBVJ6uUVk8tfvKgZYRrW4=;
        b=f/H/YyhgXMr9CMd8BxnYHlbVVVGqq125gDRnGb87qCru69cpUX76yI0JU0B9yiRnkj
         V2hMVl0R8WM5mH2R7xEpkBqAmgyDJ+O6rf1V7wL/QIngQkFsw7FDJWxEeDtZ4SqlvTVC
         Hx28o+wMCdD/l4pjbP+MU8tNGOS3qAHtRRi6USajURJ4c0P9GnstzJF2KpGfL6lJIEaS
         nUYRUpiwyshjEt3Hm8FLTsaJv1/uxGQrudDtlfAuisern0D5dTXilOOd89Bu/I0ycOjh
         DRJBkzAd1v3oo9tNHaWDu+9xOrK/GhEqhT/Nd8RRetmjJ+pFaLX4gj/spKRrS+Rbi2Wg
         RGUA==
X-Forwarded-Encrypted: i=1; AJvYcCWOtFNMTwNkBvznPjsqa70zX8iUR3FO+dYibjdU740JVvIbEcaNCP2PVyivOR8Tb14q8moeiIz7TgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLZrUiLpnV/qTU9TQSdS3TdjZDLmN8O5fMe4HPo5iInQRXGrK
	r4tCuOhQai7MO0vQVl1qjX4MR0XNLQFF4SpjnSsok1VEUpB902CkKuIYq8eSOg==
X-Gm-Gg: ASbGncsMe20nAe0Qli/ibhRYdn3gu0wAPsn0aMEPm1pfAMQevojDcfmzIVW/fNiaJq2
	ZcHmHoNuFba/fi1usAmUQCAV0xnYgRcGdy/ZM7FTwxq+5/CK/1EgKJJ+UxdpTtiMn+VsLIjXe8l
	8aKCA3pGQ0fcZ+sbJSLla+DE29iu/JHL+wdHb6LXgg4bLaokCwxE3GMZ3E8YnC5Rz6RLUEwc8WX
	7syiizJ6s6PEZFigBZJFYzrcT5k2NyJDEn0bXe9xuyRB0fg+yI5oPHrezahbnxXBYRI/5amHNFo
	KwOk8ezeSg1m3Mzx5oLsxp5Chp0gBVkoPZyVN4/XFKCvWlJHUqLzgMBU/YQqYbUwfNUfLq8YlXB
	aWxt4N+qs9eockUqLsWrEq/HyTCP+T6CcvSc=
X-Google-Smtp-Source: AGHT+IHyb1FrQPxz3w4i0plT2sVm/OSdfFLcWlAkcbyUv9AoYYMZUyrDcNr5CaZKgQX06WcX0WerHw==
X-Received: by 2002:a05:6512:3411:b0:55c:e5c3:1a44 with SMTP id 2adb3069b0e04-55e007db76bmr79328e87.48.1755551467880;
        Mon, 18 Aug 2025 14:11:07 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41d30csm21776721fa.7.2025.08.18.14.11.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 Aug 2025 14:11:07 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:11:03 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
Subject: [REGRESSION 6.16] xHCI host not responding to stop endpoint command
 after suspend and resume
Message-ID: <20250818231103.672ec7ed@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Two Arch Linux users reported that a suspend cycle makes their xHCI
controllers die since the 6.16 release.

Link:
https://bbs.archlinux.org/viewtopic.php?id=307641

Posted log snippet:
Aug 16 12:12:53 talc kernel: xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint command
Aug 16 12:12:53 talc kernel: xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
Aug 16 12:12:53 talc kernel: xhci_hcd 0000:00:14.0: HC died; cleaning up
Aug 16 12:12:53 talc kernel: usb 1-8: PM: dpm_run_callback(): usb_dev_resume returns -22
Aug 16 12:12:53 talc kernel: usb 1-5: PM: dpm_run_callback(): usb_dev_resume returns -5
Aug 16 12:12:53 talc kernel: usb 1-5: PM: failed to resume async: error -5
Aug 16 12:12:53 talc kernel: usb 1-8: PM: failed to resume async: error -22
Aug 16 12:12:53 talc kernel: OOM killer enabled.
Aug 16 12:12:53 talc kernel: Restarting tasks: Starting
Aug 16 12:12:53 talc kernel: mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
Aug 16 12:12:53 talc kernel: usb 1-5: USB disconnect, device number 3
Aug 16 12:12:53 talc kernel: Restarting tasks: Done
Aug 16 12:12:53 talc kernel: random: crng reseeded on system resumption
Aug 16 12:12:53 talc kernel: usb 1-8: USB disconnect, device number 4
Aug 16 12:12:53 talc kernel: PM: suspend exit

I tried suspending my PC packed with several xHCs and none of them died,
so it may be hardware specific. The log shows this Intel PCI ID:

Aug 16 12:07:31 talc kernel: pci 0000:00:14.0: [8086:4ded] type 00 class 0x0c0330 conventional PCI endpoint


A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
so that's where the bug likely came from.

Any ideas what it could be? I have none, looks like it may be another
utterly unobvious issue from a trivial cleanup patch.

Christian (Cc) is the Arch package maintainer helping track this down.

Regards,
Michal

