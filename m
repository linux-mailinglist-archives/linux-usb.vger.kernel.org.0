Return-Path: <linux-usb+bounces-32604-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP9SO6M6cWnKfQAAu9opvQ
	(envelope-from <linux-usb+bounces-32604-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 21:44:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A745D828
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 21:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C3F1B806CE7
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC4A33F37D;
	Wed, 21 Jan 2026 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ae3twYxP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459AB3A9011
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 19:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025252; cv=pass; b=gToXHhQusx/NpKD4HLAg6vwLy3zw52XA5T/7lEqartYuCCSLxoKFYHR8W5bK6qroilxwn3cKW3rrn5SyraIbx2F4B4ypQoYiKzZ0ZmMN/wJvwdpsnbSfdud/ZTevUStQLOPzYLB6BVnv/7Pn2S0bx4iMBOY20C5gu/37EDyowuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025252; c=relaxed/simple;
	bh=fwaoGaYNv7q6kkxcJ6i5EnD7eY3CrFD9mB1Zzbsvhq4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ib28rECj38BA6AxCT53G8Jo0Tzee8oVPPocKsc712MxqWI0ifApBUxjdRrqPQZT2W70vW5XoMyfi7K3mnW5hWjlMImmkhP3GB12nS3pDKgiig6sJv6k4Gl5XOHqKvq9QwrCoBW2Br7ukwVx1g1aILGJfgd+HdIxI7YP+nFjZkXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ae3twYxP; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso1788011e87.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 11:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769025248; cv=none;
        d=google.com; s=arc-20240605;
        b=fsUDjWkTh29D+OautbqQYaHh6RJ++aszWVPSJPD+OxxCUbpbi+RSpScDFBBTFR09bE
         Im1ZsWnarIY0eC3o0NaduZOQLiA7byYAMG/Ck7iwhPJDaxRjqrGYMTzDUu31oy/hD64I
         yhwhOxqohNGp0gXCjLlYridZTSe97KhFVhutu6TMPIuaQrzB+Kjq3GdSgCHRz30GKhwP
         xkhMHtSw9Evc3AJ2CkFrdY9/RhQmz/B9ch8Pi/oE4oROhcEzhT4htP4BuLvKBlIMwGOP
         LRhM0VhNKdHEB1QGrk08bNDUESfottcgQDOdv5awfcq7FPUuYk+YRpEjDMGmJaGqEm0L
         OGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+45qrx169EP2kxh0woTxNJt735t7Y5FNHe211qz+4xE=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=WbaNRYn218UyvKLzY2KPVhVcvk/LPd9Wv90tHBsa4HETca33wL0G+riEcIIa9UWRvV
         Mf5Mmd2kxu44EQ7gmFWfH4ISxBVvTB5rR6AclTHyKW0yxJ84dhK9E7fGBmrBl0NVGbiM
         KCdC1l54QixvzR2joYVR+XBF2lTxYOGEKaQ/YfA6faB3DNiShi2bUT+X0BMnbWh/l4RR
         xBECU7kGRKrfSZQ4LApWZ84VL/VzLiiF4kB/xAeeJdZu2A88fNB1oO0Cw0bCM76zurCG
         BvHr4huT5utI3XPEW8uOoDy0/PlKuDVhJe1T7naZ4RnDmw6qaG75LsE1qMzNVGMxPATE
         hSLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769025248; x=1769630048; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+45qrx169EP2kxh0woTxNJt735t7Y5FNHe211qz+4xE=;
        b=ae3twYxPZVglyPpN8HnDrq1KiM+3AhrlH7ajbzWsZ0CnmnDyI8qhz0nP1yFxyBMmSl
         KCH85dJMt10x+ndCLwa7pDepfBB0g0ZDDQUpL45nfkyfqKRqLhcGVR94Ulmh7BFDBjxY
         uALspkiD2PRa7obgtytLR8+aWqNUGycQqgbbbXRGUM97hRNDvwkyVlP0KEpEeE02zmqw
         qc2tuegMvKYfgOItiiBR167Qo5Fmxjg2tOouS/NWCn2KabO4ewZ1IBjnhvJ8RvtDWcrx
         d5+PVj6u7eUpOmZaliwXRljYhfIlpUGdyuGdRYG92c5ZrCFUVRRRVyxG5JekNbBisHkp
         VqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769025248; x=1769630048;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+45qrx169EP2kxh0woTxNJt735t7Y5FNHe211qz+4xE=;
        b=HJy/Jv9ol45htrD7uc+A20rMWmb8rSSHEXTKikWTWL5qwTSuXBjL/O/ia/MVgoVBvW
         oHxVbtQkqL7pmV0ruCKsDmDOIp2WqyOm5SKB7nVozlna2h0ih6yqsp9FZr21Yj0BSJE9
         uDKbny5VxAUgIFUdVomMjmdkrdNZY+XoDj54DsOfrhE5FQbkg9ZaYy/+Yz30+TZUkb10
         WXCa6dZvKSBtarzpued85/cZdMF16uIE6LvVTE5uAEX05PRIGZmdyXX5m2ldXhFzwTfB
         IkyicCvUX0S/7c3teTynzhXmoJc4busTvbbW6h+6JdmEJMPZuqmRFI6QRD/bCugCVSpR
         TrlQ==
X-Gm-Message-State: AOJu0YxHdWkAQdVqGnCd16vFZXc+RIdRf0zbZojOUW22aXZDURsbj3t/
	feFQfxplY8KYLg1Fvzf3/QwHdtZyFxV8+rJqgfmh8Z2jMvG243+Rg3CJNzSs1t9jZAImJwjAlcJ
	HBhKRbnAjoIzPOCTwScA2MiK1SUh7A3gyQSeC
X-Gm-Gg: AZuq6aKQUWDxGYDPVcG7IgKWMwe8a0pdbU+WFdVU7NLFR89dcLpaCCCA/FO7vUdlj/X
	Qev/U2Ua98zgkLGvrIL3U94DEJoNQrmEMLm/6eYTeXixgqOI2WwbS8moc/NXZhA2oi9Bz7gzVvy
	V7pu8hWmQjYj9PSLvUNAF/3K7jk2nSeAc2P/H/TMFgG/oPTigMHPiuFVcXqMLQGh1V5FxR0axF/
	aLWXbMFDVmJkBP6Jzi/Oi693qgBuE44dy601pl24ahXQGK3ystOpJ0JsFhP4NxV9Gj7xjjCKm3R
	LJVEZB43zAairJiEtilFEb2/DM46Wobt0KprFWQV87E27KtOEs+uUHHKdc2MDpyN/4A=
X-Received: by 2002:a05:6512:224b:b0:59d:db30:8848 with SMTP id
 2adb3069b0e04-59ddb3088c1mr69506e87.16.1769025247970; Wed, 21 Jan 2026
 11:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ronak Mehta <ronakrm@gmail.com>
Date: Wed, 21 Jan 2026 11:53:31 -0800
X-Gm-Features: AZwV_QjR5kcWepzDFndoCVD3-vh022pQ6Fu-UL06_fQoz8yaknVFmSjvNi4yMJA
Message-ID: <CAFFO4Hs+TCa1Cdr9V6sqvBRz8Edx3P5wYQaeuN8b1Z53ieS0Gg@mail.gmail.com>
Subject: [BUG] usb: typec: ucsi: PM race on s2idle resume - "parent port
 should not be sleeping"
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32604-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronakrm@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 99A745D828
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On resume from s2idle, the typec_ucsi driver triggers a PM hierarchy violation
by accessing a port partner device while the parent port is still suspended.
This causes systemd services to block until their watchdog timers expire.
This is not a regression, I've had issues for 8+ months
w.r.t. wake from sleep, only diagnosed now.

Hardware:
  - ThinkPad X1 Carbon Gen 13 (21NS0014US)
  - Intel Lunar Lake-M
  - BIOS N4BET70W (1.40)
  - Thunderbolt 4: Intel Lunar Lake-M [8086:a831]
  - Sleep mode: s2idle (S3 not available)

Kernel: 6.18.3-arch1-1
Modules: typec_ucsi, ucsi_acpi, typec, thunderbolt

The kernel emits:

    typec port1-partner: PM: parent port1 should not be sleeping

This blocks udev and causes cascading watchdog timeouts:

    systemd-journald.service: Watchdog timeout (limit 3min)!
    systemd-logind.service: Watchdog timeout (limit 3min)!
    systemd-udevd.service: Watchdog timeout (limit 3min)!
    systemd-networkd.service: Watchdog timeout (limit 3min)!

Services are killed with SIGABRT, generating coredumps. Journal files are
corrupted on every affected resume. User-visible symptoms include trackpad
failure, network drops, and session instability.

The issue is intermittent, occurring on roughly 50% of resumes after 30+
minutes of sleep. This is consistent with a race condition in the PM resume
ordering - the driver sometimes accesses port1-partner before port1 has
completed its resume.

Reproduction:
  1. ThinkPad X1 Carbon Gen 13 with Lunar Lake
  2. Suspend to s2idle
  3. Wait 30+ minutes
  4. Resume

Observed 28 times over the last 4 days (Jan 18-21, 2025).
General use of suspend/resume throughout the day.

I have not tested blacklisting ucsi_acpi as a workaround because it would
disable USB-C Power Delivery, breaking charger negotiation and display
output on a laptop where USB-C is the primary interface.

Thanks!
Reported-by: Ronak Mehta <ronakrm@gmail.com>

