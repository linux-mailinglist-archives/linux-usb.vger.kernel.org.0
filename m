Return-Path: <linux-usb+bounces-36221-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKO1AQyS3WkLfwkAu9opvQ
	(envelope-from <linux-usb+bounces-36221-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:02:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0B3F4B8B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44236303EC26
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 01:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63788247DE1;
	Tue, 14 Apr 2026 01:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianwowk.com header.i=@adrianwowk.com header.b="e2YUwQxV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E702777F3
	for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2026 01:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128458; cv=none; b=n4fkcOOOJAjY+A1+KkAxKzGemyhdPVCZpymCXNqStJRQ6P2JqSUAISqsYIq2Tj3CQgOWQ+1JkiP2mp/aWKWHR8wCivyqsgNbNYOx/I78Z7ifxc+bGsgWehCQeOfQCyxwKt1sXeuG2cnKqyw1C/lp8x0BZZQtiefOArwBf7utuM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128458; c=relaxed/simple;
	bh=ApZcTILpNJF5dAfUkEoDylJFNWDnFzkVHuaISa4kGJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YuhtJDuUrfV0vJS01L6kBsSEJAQEn3WmB5v4Yl8YdHA47yu25scv8r+nC2e6EThMJCO0d6VpsDEx5w/5U8U+o49fxu4Om/ordXIyJ16cdjqYta51hbNzaHT+xUuSu2CiadImGP/FXEOys/fIQ41Imu2bN9UsiuyMcIMWx6AI7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianwowk.com; spf=pass smtp.mailfrom=adrianwowk.com; dkim=pass (2048-bit key) header.d=adrianwowk.com header.i=@adrianwowk.com header.b=e2YUwQxV; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianwowk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adrianwowk.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-47952228f05so1004412b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 18:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianwowk.com; s=google; t=1776128454; x=1776733254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYzXa+htgRag7ZVpuOXHWhBtQy4YL7FzWs2tQv0w8Eg=;
        b=e2YUwQxVzfSyrwAPF9DzRN65AsV1GawSNtFEQBfV5jJjMj+MUOSVFUYfNVU38oZ2nr
         xpSPSmggb+f9zLjcL+5d4qgpogYJXSwoFQBdBuHMAzEoEpMo8Xw6NBupYORkw5iXql3l
         tpjVtsDSqMLUnSaWD3283nQLbOb5xtuRPZcHOL/hapmtH48Pxne+MPZefJjIfNDIT4iO
         kuTAYgFnYrQjwC7Cie4r/genUTAFqwKp6YChv/s7faY+MWToncbissUPrT2Asc0q4wb0
         R1M3xqTmKTXTfVAlPZ+vExw+ymWLujX2j5M38lm6+RB3rsuUGYYl+MsxRIgBoQeKQYrt
         57jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776128454; x=1776733254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYzXa+htgRag7ZVpuOXHWhBtQy4YL7FzWs2tQv0w8Eg=;
        b=ZY5B3Alo6fs2CA+rn6Xi3meGj7YzSFliAGtNsgQF5hlVYRUrauBB+Q6I+BVja1mVhi
         wyOotcXElxyV1GAOc6n5hzlpZcqVZFtQYz9SBSCHftyL1Fgbc3sn67thZKbtDQCkB3UP
         1teq44sIzA7rwlBt9n8HZ/Z3H+g5Jzjrdq8U81f0K0wf+LhIWW283sxeikPQEWe7bnmQ
         bYSghqZ+rr9JaOZLqL2zDNOo9n7E8bVt8UwyDf+IyikrqUEZ9dvQhju/M9LUIGQkjd+8
         b4kfgqxPQj2iAD7PkflAZ+6ZKu0rTG1zaqUkZbymIJ3q9YxacAViDI9mmvr4FQv2I0cC
         JVFw==
X-Forwarded-Encrypted: i=1; AFNElJ9zYeiaz4IUqRo9lb/427g/inICB/5u5pB9if9PdVawE+UVedSVqF1t4q1X3WeIgiEBhKqjfau0UCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweTvDF+JTLSg0/7ban41HJw1rFlwduFspQ/L9RLLWA02iMCr/d
	3EEmzDRoRDiurTA75I6dBi+NiTxkBMs1B7m/f//BubPc0Qy8rQoQ9uf5xAf2N2Dciuo=
X-Gm-Gg: AeBDieujJXjUR6rMfm33XKGtIPDPh86+u7k0Vy3hHiDUpB2fKp4wYrfK5utpzdQdc8W
	c3NC/va3SGVUIztAllYiI0SnL0NHirGpfZZgHDyYNphYl8DEyte+9ISRpM+7ypyE9pM/0Nz3CCv
	Lmu6wLMGeJaXH7Av6eyh3hffPrjhbrod5ASRftnB+fEoYCcC1sCGJUSpcrObW27Tq8PKnBM1a6d
	QJ4ig4VUTGw1Q4m5NYtpHHS2NKzyJCgysXF1CfZ5Jp3tCkxlQv618n2W/iLz7zh5RqQDJAbo9IY
	g11IIpdVu5cW8GLAoYH28H1HY06iZ/hsobsIOh76n4u4pDYYJLTRiTcgByq2Zj2fv+oA3IxGI+A
	H3u872ACeSavawCES4fiW0MwKY9seCwCgLyRIaXugUsv8I+J8QNTmZyWB0sbBEdfY9X7A+/q0NR
	oqwJUoGaXWLj4fOSCU5DLSbCxI4SSq1gXrobmQDPBmI9MVjWirtYa6
X-Received: by 2002:a05:6808:d4e:b0:473:6344:de66 with SMTP id 5614622812f47-4772c385780mr9325323b6e.18.1776128454332;
        Mon, 13 Apr 2026 18:00:54 -0700 (PDT)
Received: from linux-dev ([12.26.11.218])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc269d3255sm9964556a34.25.2026.04.13.18.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:00:53 -0700 (PDT)
From: Adrian Wowk <dev@adrianwowk.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org
Cc: i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Wowk <dev@adrianwowk.com>
Subject: [PATCH 0/2] usbip: vhci_hcd: fix NULL deref and NR_HCS upper bound
Date: Mon, 13 Apr 2026 20:00:48 -0500
Message-ID: <20260414010050.158064-1-dev@adrianwowk.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[adrianwowk.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-36221-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[adrianwowk.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dev@adrianwowk.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[adrianwowk.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,adrianwowk.com:dkim,adrianwowk.com:mid]
X-Rspamd-Queue-Id: 79E0B3F4B8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These two patches fix a NULL pointer dereference in vhci_sysfs.c
triggered when a VHCI host controller fails to probe, and tighten
the Kconfig upper bound for USBIP_VHCI_NR_HCS to reflect the real
maximum imposed by USB_MAXBUS.

Tested on Ubuntu 6.8.0-110-generic (6.8.12) on a Dell PowerEdge R640,
issue is reproducible with CONFIG_USBIP_VHCI_NR_HCS > 32 or potentially
lower if there is already other USB hardware connected.

Adrian Wowk (2):
  usbip: vhci_hcd: fix NULL deref in status_show_vhci
  usbip: vhci_hcd: reduce CONFIG_USBIP_VHCI_NR_HCS upper bound to 32

 drivers/usb/usbip/Kconfig      |  2 +-
 drivers/usb/usbip/vhci_sysfs.c | 52 +++++++++++++++++++---------------
 2 files changed, 30 insertions(+), 24 deletions(-)

-- 
2.53.0


