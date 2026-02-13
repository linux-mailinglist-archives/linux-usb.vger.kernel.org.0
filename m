Return-Path: <linux-usb+bounces-33335-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI1uElj4jmnbGAEAu9opvQ
	(envelope-from <linux-usb+bounces-33335-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 11:09:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E6134E17
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 11:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4196300B44C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DCB34F492;
	Fri, 13 Feb 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CxZjYZgb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E60349B06
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770977360; cv=none; b=CSiUCnDm2ETdD7YR/qIKwGidMYG796xx4Q2D2Trp3S0nS0vWgR/MDLOAeUkcD8v4ZtdMcUcemAq6h0bOwG+9DKjTuq92PI+Mlt57y/625+HhbsT7OS90b2bnpzyvzMrsmO2DYbeuRnaD5W1lrJtHdP+ihti3H781BQY3pXRLruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770977360; c=relaxed/simple;
	bh=mNiqJWiiuf4qjeh9FL8FnIeCmlWo4rOAoNCWhUe4854=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=q6Zl3+MYz0gKn7fX8f4tyGr1b9uBBgN5eoxfpi5KPJsY7asAB9c8gHmhcnLHGkbZbxEFhgOL/TZ9204XxufkDdwOKSzY0K7ep2T/xBwforVl1YmklElgNUGjFFAB67FME/9onvKWx7p7hc2Dj03AZFmVYk5r9vEbBvYSvNT04Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CxZjYZgb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2aad5fec175so21407605ad.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 02:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770977358; x=1771582158; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+3luSD5LpgzelIQotxW7JLGJfxcioAB1HiWlg97wEX0=;
        b=CxZjYZgb2N1u724K9udLUlQOMtvEhkQ7oBS2hN5WT8bdGwa6cDJbLWut7itlV+I0yH
         GznE3kSSMVGF2tTkNM2+85gKWFmaXRhZStXberylPkfkKrhkl7btTh3s5LH3332Ekxr3
         jdgE0ppfrrBDJS9Ms7XTKyDaEeiNRVYy8zUqzKTlSx14y/T2ePTRWlBsApIeB6x33tUR
         I7XXEfcNXFO77KwWTXXBPa6ikwqlwyuW6ea5BcTEnUZIgK0kYwdKdcOm5x92jCmagYR8
         ag2aQ7OBzzkNW4Mdqpq+HlOzHIIx2XUQc65ffDnucHZqZjxNazG9gsOBpKx4folISapR
         /mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770977358; x=1771582158;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3luSD5LpgzelIQotxW7JLGJfxcioAB1HiWlg97wEX0=;
        b=sNtqX4/y2nTUyxm/hDnj3Rm9UvOcAcwwxC6U6/JMJREJKW8LdD+N/otQmDX8eO4Fb0
         tbl0SHa6PF3HQUMYIKmVfPr8APkhY45BkOo3NRg6WtqGcm9fggP9jPvmUd/cr+fB6sUM
         umaigqC7xyQ9t6zg3IVCWZ4HOu/vPQ5aaZToaFbx7OAbLRhlR5x5NX3kU5jwtZLPAHLH
         t5VanGJn9neCOEkpjCS3+3uRu/QkHAa+Nn+D5LQatFQN3lPkw+8sSpTcswmfOv74vgQt
         FMznZUo/4ZpghK8xY9S8kOcRqbIQbBBOs8GmMQIZHrenzZ63/dZgVzkRbfHpS0P9C6Lw
         ECoA==
X-Gm-Message-State: AOJu0YxpQz6dP5slLDSichVTTDUTjG07dHGs1OpAt4JkpkDsryTXYL6Z
	4l+BGDxYkmZ53QePkoc/ve/Hyt1iRifhGbAsN2XfO7KJ++USybFtRbgOzZCTcYAK1+hIqC55auy
	bk1t4FmiaoJNC2cwQ9g==
X-Received: from plei5.prod.google.com ([2002:a17:902:e485:b0:298:33c9:da0c])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e852:b0:2aa:e7f3:faf3 with SMTP id d9443c01a7336-2ab505229e3mr15965125ad.23.1770977358272;
 Fri, 13 Feb 2026 02:09:18 -0800 (PST)
Date: Fri, 13 Feb 2026 10:07:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213100736.2914690-1-guanyulin@google.com>
Subject: [RFC PATCH v2 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	harshit.m.mogalapalli@oracle.com, wesley.cheng@oss.qualcomm.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33335-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Queue-Id: 730E6134E17
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
Changes in v2:
- Move device locking to callers 
- Decouple sideband from offload counting.
Link to v1: https://lore.kernel.org/all/20260130074746.287750-1-guanyulin@google.com/
---
Guan-Yu Lin (2):
  usb: offload: move device locking to callers in offload.c
  ALSA: usb: qcom: manage offload device usage

 drivers/usb/core/offload.c        | 34 +++++++++++--------------------
 drivers/usb/host/xhci-sideband.c  | 14 +------------
 sound/usb/qcom/qc_audio_offload.c | 23 ++++++++++++++++++---
 3 files changed, 33 insertions(+), 38 deletions(-)

-- 
2.53.0.273.g2a3d683680-goog


