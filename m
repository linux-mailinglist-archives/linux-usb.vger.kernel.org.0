Return-Path: <linux-usb+bounces-37648-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHwfNZCbC2oWKAUAu9opvQ
	(envelope-from <linux-usb+bounces-37648-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:06:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA6574E1D
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 133253021E90
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79732F9985;
	Mon, 18 May 2026 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKifQGEz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1178B19E819
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145600; cv=none; b=fjGYm+vzWW3V3xXy/gwo2G3TMuezAu9G1y3/gJ6dCQ2vffyWBarxC2xoa18KQoQDdmGit71js5F9h/2qsIet+f+mOqFXk/fkC3oF+fwx5gt+r5jSBl9viBOLDbrWwkQ176NEdfM/z8jNaoM1kSGtys1AALz1nvPeoApU2SFd1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145600; c=relaxed/simple;
	bh=tdQX6z5Ow34bb/pGtk3dNyrAbcLCh7UCBhe9r1uuApA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbA1XwveObtAIGF3UUtRbsxv4/eikj+CIFzDo3RLT62VqgIP50NyY5wNZO1wRsVWkZn9Cn9tfREhCUAuw/vEbBByG/bzpMVjAnMQbJAumwToFkZzqmO8DfU8cWGVdRMQV5nxrnltLV2xLHsmrXQsT8r9gUfVvBAhO6NnfzFzClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKifQGEz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bc763e2ba8so12521775ad.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145598; x=1779750398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6fRPsUXaMKX0qPKfz3OqQyhzwCYHmD71RB3fhnMJPw=;
        b=iKifQGEzAh3nSIZfpJZ9YmMOaA3tTspIJSBXVF+njJnVFVRWhMr60osRzOcmOzsKRX
         YrGDT1oBgngfvbxZW/hzH6hciFB9fdnt4qrI18QoiRjMG7ybEfkCnD+4hvYqTZzhgQyc
         HY1KpuxlP1Ql7R7Jm+eHeVN9Rj4CHp7JTNTqapF1TLxPuF/vokhvpCnrCujUlIHNNUK0
         FO6byZ4mQg+RBG8hEiFzs5o5LAnIiBvAgVoWjtCusn2O0n/OX+RGKGvJh6uznc45IezW
         3vI3xm5nYYRaDpNWpariflH0kh6b4/zXJNo7FWWFvPY6IL27dfbkncRf+YIwT2VgCx5F
         mHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145598; x=1779750398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6fRPsUXaMKX0qPKfz3OqQyhzwCYHmD71RB3fhnMJPw=;
        b=Qh+LoMdRWc+/fo279hFznwCm0UYx5RBAklXSM2hMbVyLE2lzZeYnw7pJzXW8Ox8PwX
         nK4thB3uvS0zcGgAXp2SuCHB8CaNYtNJ7pNlX+m9ofHTJhpGIOxsnBABulIZZ7AyZXdt
         Hbj3f7FVJOAzlM/n+aJaUotZ5B42UtTKmmHypzLUVlORPEh3WqifHVZGpayAZDq0z3f/
         lUDXs1QV+9QAUIuz41vOQZmWsICPMjpVoIHYUMZUtL6Gdzfn/xIuhOFWKbkd+BWJOaFa
         CQ/QApJ/7G4hcdfaRSdfn98T1kmB4ZXCm5d2lV+jPmfnPX0hKlCHCmMS1+gFEESDOEQY
         D4tg==
X-Forwarded-Encrypted: i=1; AFNElJ9PXi1di2ivud0YuntdKq/KACS8cFw9Pil7CnOzjtu6kEhzY+8ic9BgsWzLRhz/fyhlI+LDGHFvXaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyriVGRygsE+UoLvhRo5VIqhsTCD2n1xKVZscptGtnLUsn68tzM
	KoA2QVdwyq7drJWDPOrivr4ieM/QZpgJKCtG4jcleX90GI0JGwDk3ivA
X-Gm-Gg: Acq92OHcF609iTV+0UZV7eqvnx3VjwQD67gGgBFoaiRHYOnP3CTsHzsdT52I8S8OycJ
	hS76MAE6IgGreeeBhAqyfepzIHPtLXcWVKSbDqo/kdFLY7QPKXAQGjuSNR+klFpyz1C+PMfWlDx
	9cKEaOAZpEntuBL9hdP/VIuPwCCrp4TelnLmPhEJ6cBWA2r3unij2iigeNzNk30FWw8joKene6/
	R5vw+1JIs12PAWIEzbHg70Qh+6nFV3IO70uowcaopqOeNo3K61IFRZ7B/9sx/0EuVljmaUkCkyS
	LbNdBP4zqXXAgTicluma43PrnFa2FfpdUYzm0fNeazA74NNUCWYRUOw7QLOznq1dad3sWnhxraw
	7CoVWo2GkSeViilrck8bWrAXI5D1w4SaX88L7oRmsgctHltfzOAjzXHPKP8V9jXfuGrHd4L3V1w
	VIbgrgf/NtF6ln8dfTDKOMTmyxAnVDAus=
X-Received: by 2002:a17:903:3c43:b0:2bd:e43c:12d0 with SMTP id d9443c01a7336-2bde43c14b7mr63463745ad.28.1779145598364;
        Mon, 18 May 2026 16:06:38 -0700 (PDT)
Received: from [192.168.89.2] ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb35sm159558035ad.12.2026.05.18.16.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:06:37 -0700 (PDT)
Message-ID: <7ff352be-05d2-4c21-931e-18238172e4d7@gmail.com>
Date: Tue, 19 May 2026 08:06:34 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Yaroslav Isakov <yaroslav.isakov@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
 <20260517130407.795157-2-hurryman2212@gmail.com>
 <20260517232147.34931718.michal.pecio@gmail.com>
 <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
 <20260518233711.4c99cc72.michal.pecio@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260518233711.4c99cc72.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37648-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,roeck-us.net,lwn.net,amd.com,vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3CCA6574E1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 06:37, Michal Pecio wrote:
> That's true.
> Making this possible is the whole purpose of "if IS_ENABLED" here:

I re-checked the Kconfig cases, and I think you are right here.

The two cases I was trying to avoid are:

  1. the sensor driver is built as a module, or loads only after the
     initramfs stage, but the PROM21 controller has already been bound by
     the generic xhci-pci driver, so no auxiliary device exists for the
     sensor driver to bind to;

  2. the built-in generic xhci-pci driver rejects the PROM21 controller, but
     xhci-pci-prom21 is only available as a module and is not present during
     initramfs, leaving USB behind that controller unavailable at that
stage.

Looking at your proposed Kconfig shape again, it handles both cases.

If SENSORS_PROM21_XHCI=n, then no sensor support is requested and
USB_XHCI_PCI_PROM21 can stay disabled. In that case generic xhci-pci binds
the controller, which is fine because there is no sensor driver that
needs an
auxiliary device.

If SENSORS_PROM21_XHCI=m or y and USB_XHCI_PCI=y, then
USB_XHCI_PCI_PROM21 follows USB_XHCI_PCI and becomes y. That means the
PROM21
glue is available during early boot, creates the auxiliary device, and the
hwmon driver can still bind later if it is built as a module.

If USB_XHCI_PCI=m, then xhci-pci itself is modular. In that case needing the
PROM21 glue module in initramfs is not a PROM21-specific built-in/module
split
problem; it is the normal requirement for a modular xHCI PCI setup.

So I agree that tying the hidden glue option to whether
SENSORS_PROM21_XHCI is enabled is reasonable.

> Currently, you have a weird situation where xhci-pci-prom21 always
> binds on x86 and xhci-pci on other platforms (with the unofficial PCIe
> card you mentioned), plus the sensor cannot work on other platforms.

Agreed. I also agree that the X86 dependency is only a heuristic and is
not a
good restriction for a PCI ID based driver. PROM21 is mainly used on AMD x86
desktop platforms today, but the unofficial PCIe card example shows that the
device can exist outside the normal AMD x86 chipset topology.

I do not know whether other PROM21-related functionality is supported on
non-x86 platforms, but this driver does not need to prevent the xHCI
temperature sensor path from being built there.

> One could further argue that neither should it care whether some hwmon
> driver exists at all, or which kernel releases it exists in :)

Right. I think the cleanest result is:

  - generic xhci-pci handles PROM21 when no sensor support is requested;
  - xhci-pci-prom21 handles PROM21 only when the sensor path is enabled;
  - the hwmon driver remains the user-visible option.

Unless Guenter or the USB maintainers object, I plan to change the next
revision in that direction and test the Kconfig combinations locally.


Sincerely,
Jihong Min

