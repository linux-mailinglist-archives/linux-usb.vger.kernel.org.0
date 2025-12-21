Return-Path: <linux-usb+bounces-31661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C18CD45E7
	for <lists+linux-usb@lfdr.de>; Sun, 21 Dec 2025 22:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45D8E30076A0
	for <lists+linux-usb@lfdr.de>; Sun, 21 Dec 2025 21:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C012222B2;
	Sun, 21 Dec 2025 21:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/FyYU5O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB6186A
	for <linux-usb@vger.kernel.org>; Sun, 21 Dec 2025 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766352961; cv=none; b=HAq2z6cM4vDn7iSOm2n5No+w/wNxQSArqyH94IM6SRH5V9zasmew04VpBPJFIkmECafaI+eKNoSKpN0R1GEX/rX5hmcW8E5AZJ14mxTja/V6rAj1h5/WV6DVQ492mbI6nbnv5MYyIvYBELVL6LxE0pd4l/hWpqkU3yuUaOZS9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766352961; c=relaxed/simple;
	bh=B14wI8QVS1YbTKm7Mp+pkArlyY72cmqt0sf4fSSt/RU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IyX4xUW9BSOtiX2Dbupc68e5Sq5R/B8Nf/Yq7cM+ZcMB6fiBaIhbj31zl+IRFRVEMfMTutlsivkTNj8cT5MGeTLCwSh5dNsUpLNcBjT8fXk0NqmitVVrmsT5AhNG2qol4as6ed8Sp1AQJk7yM27MXPLsovAWVJpV+DoUJmQZxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/FyYU5O; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a3b9ddd40so18187436d6.1
        for <linux-usb@vger.kernel.org>; Sun, 21 Dec 2025 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766352958; x=1766957758; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lSp/J1pHvXv5+rE0RMX4gnZmHm+WJfaHuHekfIZgQ34=;
        b=L/FyYU5ObbHAJ8JgF54EY4wbSgDsuo90tKrZ4sARNUP5/dpjMDtYQcW9bxLX++8Wxu
         tdr+JgP8SOhsI7wR0rzcXBURsGn8M75VrtnqTf9oSZfAxJgV7cUBH+sVb9ssU0Eoo0vl
         0rLGBM6pq16fWk70F1+Kakg+W5vuWpAFG0WaIS5EN0ryI7kZZBkmPM96TamGAtlVaPhr
         4xsKFjdG8yVfjJC5YS7Ut39kA6pZyu8TZeBA3J6/gv053+ZwjdeyljqRfapK67y3NJRa
         CGatF1mXn5135XpRVFX/YNAfpFUcv/kuGz+aynsetCRKjEVpCdTtfiJ0jckZdTbs9D4i
         Hyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766352958; x=1766957758;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSp/J1pHvXv5+rE0RMX4gnZmHm+WJfaHuHekfIZgQ34=;
        b=R1MfomlccmohR+PCch81AN7oC2R1gVMTwCis8Zz2oZrBuyjpV8KtNuvedFzVH82/r+
         LzQQ+wD7Ab1i+niVepc8u19zewZMeP/aUkXShE09CBxQHvpVnVNdUiuyZv03nz1eSEsl
         T/qXjzDRu8pitvN0I0ZlB60GSHL8Epjov7VIY8a0TZlENz8iBK4e3NS8bnHVdutBqHM6
         MwOQKmchl5vOIyifeVOgEhqfSgwTg3ev139uRwwRvHCw8UOVsT/Q87auB6Bj7yE3WVeC
         6BmvLjbta8v9aNqTNVy6LsJWr5f0jGoUETscJE2yxMzZ8X0SWTYtNrDNFL8se1NJV4wS
         ++Qg==
X-Gm-Message-State: AOJu0Yz4cLGu/u8oTCnU5OhhLGNMXNiNBYlDxgxD1B1EmyBZVysh2lYd
	PClv9konNGGBhLz/qp9UEM/DyXWPJMLMvRcaXetOqHeHclgtZRGVZrQELge0rEDdW6MHPAW0RfW
	1NSeoHmKFf3j65bd9plln1OUQZDkAmganw9nu
X-Gm-Gg: AY/fxX7RJMKRIRG8OI3W38OReKP8WI+zf9ieiAiwyD/li3iY7yarIJwE6VkqsGooIwk
	uSZVaRtwGgefXuIZMgLYEfIfjuNa/S5n8jgcLvuox9AxL8hzxmkAC5MhaErswaEn8+6nC4CF2Tq
	ZrgUYTMs0KHxBGdehxREmZonlxSNamk3tG2NUrfXKI/O4X14RZYW/q0m3Ga1XHSWyfwQuyNwEkC
	EDSnavwSBr4DvcF9VopqDrV0q7lCcFDVMIuE3W/sgbWdHZDMBkLyS9md2FgXG3TjCNntlHhXhDq
	Jfo=
X-Google-Smtp-Source: AGHT+IF4sRJwNcjBe8OvRlQqQbkUtn4l+1ergLa0QZ40/JvGjZNQcoAtmR/1I0yfkKGM+3Pts1YvlCcJDfB5eKyrhkw=
X-Received: by 2002:a05:6214:4e85:b0:888:87ea:c7db with SMTP id
 6a1803df08f44-88d83793297mr132674246d6.39.1766352958595; Sun, 21 Dec 2025
 13:35:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Slackwa Slack <slackwa@gmail.com>
Date: Sun, 21 Dec 2025 23:35:47 +0100
X-Gm-Features: AQt7F2oZRkfYHQeKSPTKlvUAdSQ49b95L16HCXGuc-amho0lp7n3zyisAAqL37U
Message-ID: <CACw+751Y=f4ARfdiPYAMaXrE0jCBGkrL-k3+XDoCHEo-6kZxzw@mail.gmail.com>
Subject: [BUG] RTL8157 (0bda:8157): firmware lockup with TX SG/GSO using
 Realtek r8152 out-of-tree; in-tree r8152 on 6.17.9-zen1 does not bind
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report a reproducible firmware lockup issue affecting
Realtek RTL8157 (USB 10GbE) devices using the r8152 driver.

The issue is triggered by TX scatter-gather / GSO traffic, typically
during sustained upload workloads.

Hardware
USB Ethernet adapter: Realtek RTL8157
USB ID: 0bda:8157

Host: AMD X399 platform

USB controller: xHCI (USB 3.1 Gen2, 10 Gbps)

Cable / link: USB 10Gbps negotiated correctly

Software
Kernel: 6.17.9-zen1 (also observed on other 6.x kernels)

Driver: r8152 (Realtek version v2.21.4/v2.19.2)

Distribution: Slackware-based (no vendor driver)

Problem description
Under sustained TX load (e.g. iperf3 upload, large TCP streams), when
scatter-gather / GSO is enabled, the RTL8157 firmware eventually
becomes unresponsive.

Once triggered:

TX stalls and NETDEV WATCHDOG fires

USB control transfers start timing out (-ETIMEDOUT)

The kernel attempts to reset the USB device

During reset, OCP register accesses fail, triggering WARNs

At that point the device is unrecoverable without a full USB reset.

Kernel trace (excerpt)
WARNING: CPU: 7 PID: 5220 at r8152.c:1393 ocp_word_w0w1+0xe6/0x100 [r8152]

Call Trace:
  rtl_disable
  rtl8153_disable
  rtl8152_pre_reset
  usb_reset_device
Followed by repeated USB control failures:

r8152 ... read type=0x0100, index=0xe84c fail -110
This indicates the firmware is already wedged when ocp_word_w0w1() is
called during reset handling.

Analysis
All PHY/MAC management on RTL8157 goes through OCP (On-Chip
Peripheral) access, implemented via USB control transfers.

When SG/GSO TX is enabled, the firmware appears to enter a deadlock state:

TX descriptors stop progressing

OCP engine stops responding

All further control accesses time out

The WARN in ocp_word_w0w1() is therefore a symptom, not the root cause.

The issue does not appear to be related to:

xHCI

USB bus negotiation

host memory constraints

It is reproducible only when TX segmentation / scatter-gather is enabled.

Workaround / mitigation
The issue is fully mitigated by:

Disabling SG / FRAGLIST for RTL8157

Keeping TSO enabled but with linear buffers only

In practice:

NETIF_F_SG and NETIF_F_FRAGLIST disabled

tp->sg_use = false forced for RTL8157

TSO size limited (RTL_LIMITED_TSO_SIZE)

With this configuration:

No firmware lockups observed

No OCP timeouts

Device remains stable under sustained upload

Slight TX performance reduction is acceptable

Conclusion
This appears to be a firmware bug specific to RTL8157, triggered by
scatter-gather TX paths.

A driver-side quirk disabling SG for RTL8157 would prevent firmware
lockups and avoid repeated USB resets and WARNs.

I am happy to provide:

additional logs

a minimal patch implementing the quirk

further testing if needed

Thank you for your time.

Best regards,

