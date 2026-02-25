Return-Path: <linux-usb+bounces-33685-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM08HZWbnmkZWgQAu9opvQ
	(envelope-from <linux-usb+bounces-33685-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:49:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A1119285C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4DC730935DC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 06:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF492C17A0;
	Wed, 25 Feb 2026 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZGloXmg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E32BF3CC
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001970; cv=none; b=qowUJnWc0+i9b2RNHVXVGRnOcBXHxs2VoniiOuISNX5Zx34MvVwkXOfVj7q/JYZE03f/5cZRiyX/HGsVNtfbIr/v6G3Y8wo+Kdt9TG6TxcrbgPKyrpNsy6xVyyyay+NvH/X/To99yf4XVpeeOzl0DJRau2tX5QNooGUJ2eaRC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001970; c=relaxed/simple;
	bh=FcYnhA40wSm/6OIMnGZ+9dkPjQW2cki8snS/gC9NApM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QKG4IxJK5fz69SAEzLGG/IuUzRw5RgSxkImeBaLyhcktEkH0rIclI+d6PJvRXyNjLkivqoBQxlLNuYoVQAm26k8TYswpw7nhjQHcEoHEikXpXWbqM61mSHQ1xxIuiE+hPBcS7q3v3Ew1CwcCzou9I7mmUScCICb+1iNOF/54g9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZGloXmg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso39813097a91.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 22:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772001968; x=1772606768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5csDQ2S42k5WJW49iQ3pOEtVJoAgPTcMFYf2ie1hhyA=;
        b=LZGloXmgiuYUf41tkaofOLdwMV7tYHGZzn+/DsrT34NcueoczBVfKbb6WzSK/B12cs
         X9HdWdvQRv758FCFYuCPa2CKJTrcfehLLpqQC5iF5YO2n/66imTK/lJSXLcWufsDMEUA
         5qBBPLnhPDN92eDCXbFGT6h/rjC/fUOPxQFp5P0nSZL3Lj5kaqXV7hLTZ2X3n9DjM5sa
         DDlN+K7e4eHoSSsT+XvXXjE0AQzMfZnyfRTIH5AGXceDux5c1X6dPvQr562laO0+XnVP
         b4WHG3Lhrkd4xQltHDvD6NtzIktYQRpzy7uoSWszixuHFJUZzETYlus949t9+KY5dbc5
         SsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001968; x=1772606768;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5csDQ2S42k5WJW49iQ3pOEtVJoAgPTcMFYf2ie1hhyA=;
        b=ofnZ91LIuqkYh5+GOot6AXrThTPQggSyx3iRDX6yDZxrz9AS+x4HGE9OxLSbzFTM2h
         LOO64WQngXAlB7airNXn/aTkSiynbZfUep50LLSC3rN1Pa7aUB5JsLBC1f9zIyCIBwKV
         2SN8axZy3MqV56apEZaC2F1srm8jkiH3fqB3xyGnzB5KFTnYA/Abd/QAQ2Dc/4Kf/5Oh
         U0YAADqWLpdtGnRty6SJ/VbZ87E3oLKaQ5Q4jr2aFQHOnECRKtkEOe2+9b/YehEfKvON
         ojNywc9wz0ok0tHIo5aL1B2fykMaFybsMP885YVLj/D6UDpFTT8sZH9ti2FkyAYgSucZ
         tJgw==
X-Gm-Message-State: AOJu0Yy6QH8Z8aGPQkWSxsJZ3Tq3b92YxO5QZ7Xovd4idM4dMpsEu+7M
	VcSnxGrrMGOnCFu8lg/KCJ5coIFCZHA8UVgclKx7tItoTivknJYV4gUrvKXYM/z7B8t+CefoqsR
	BB8mLppUnC0pAFJ61cg==
X-Received: from pjbbv16.prod.google.com ([2002:a17:90a:f190:b0:352:de4e:4038])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b43:b0:34a:a65e:e6ad with SMTP id 98e67ed59e1d1-358ae7e9f7fmr11623755a91.1.1772001968119;
 Tue, 24 Feb 2026 22:46:08 -0800 (PST)
Date: Wed, 25 Feb 2026 06:45:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225064601.270301-1-guanyulin@google.com>
Subject: [PATCH v1 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	harshit.m.mogalapalli@oracle.com, wesley.cheng@oss.qualcomm.com, 
	dan.carpenter@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33685-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D5A1119285C
X-Rspamd-Action: no action

The current USB offload implementation couples the allocation of xHCI
sideband interrupters with the device's offload usage counter. This
coupling is conceptually incorrect, as hardware resource availability
and power management state serve distinct purposes.

This series decouples these mechanisms by removing the usage counting
logic from the xHCI sideband layer and shifting the responsibility
to the consumer drivers. This allows interrupters to be managed
independently of the device's active offload status.

Furthermore, this refactoring addresses a recursive locking issue.
When a USB device is disconnected, the USB core invokes the driver's
disconnect callback while holding the udev device lock. Previously,
the xHCI sideband layer would call usb_offload_put(), which
attempted to re-acquire the same udev lock, resulting in a deadlock.

By shifting lock acquisition responsibility to the upper-level USB
driver, we ensure that offload usage updates can be safely performed
from contexts where the lock is already held. This standardizes the
lock hierarchy and prevents potential deadlocks during teardown.

Patch 1 performs the core refactoring by updating the offload APIs
to require caller-held device locks and removing implicit usage
counting from the interrupter paths.

Patch 2 updates the Qualcomm USB audio offload driver to explicitly
manage the usage counter during its stream lifecycle, serving as a
derivative consumer of the new API contract. This also ensures the
device remains active during playback, preventing premature
autosuspend.

---
Changes in v1:
- Fix build error when building sound/usb/qcom/qc_audio_offload.o
- Link to RFC v2: https://lore.kernel.org/all/20260213100736.2914690-1-guanyulin@google.com/

Changes in RFC v2:
- Move device locking to callers 
- Decouple sideband from offload counting.
- Link to RFC v1: https://lore.kernel.org/all/20260130074746.287750-1-guanyulin@google.com/
---
Guan-Yu Lin (2):
  usb: offload: move device locking to callers in offload.c
  ALSA: usb: qcom: manage offload device usage

 drivers/usb/core/offload.c        |  34 ++++------
 drivers/usb/host/xhci-sideband.c  |  14 +---
 sound/usb/qcom/qc_audio_offload.c | 102 ++++++++++++++++++------------
 3 files changed, 73 insertions(+), 77 deletions(-)

-- 
2.53.0.414.gf7e9f6c205-goog


