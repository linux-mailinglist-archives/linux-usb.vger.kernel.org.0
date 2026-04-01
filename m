Return-Path: <linux-usb+bounces-35784-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG2yBzQTzWmMZwYAu9opvQ
	(envelope-from <linux-usb+bounces-35784-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 14:44:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3FA37AA78
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 14:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B37BE316CC4B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 12:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7329E405ADB;
	Wed,  1 Apr 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CZBSaX3P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C967C3F87E4
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046765; cv=none; b=oD5Ku/0zHLaOXJcfPUOJWDYbSfVjDTNS0eldt0aplvNMalJQPJ8tFqQOqD+SL1TkHOpCzCO88X0X5l1ufpOkL/NOedzUv0HYzXQPTlYxk7m7P68AFIFAZP4II/PZCGKotKqhD18OOqTGBgurvUTiD+J/KgJ7QYkYltE41qeWPhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046765; c=relaxed/simple;
	bh=ibk0bQN/ByI0CUeuRlmijZM5DofIEEeYHnmPB3e9Ibg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=E+fFGfx8A7EGAGV7zgNx2JoMa5RbQFVtBrvE/jO71JqbcEvFQaj7PunE+uduKOPbveQLGO7LG+nKqjvWgAuBE1fm0DXTITEUFAkLDxmbEjfD2Vq9QhPcO4awzwKRZf4w1VzpySUDmSWwqdJOVsD39hlH8YF/X7Rh7ohltvGbDc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CZBSaX3P; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso10875574a91.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775046763; x=1775651563; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YcXBQG8D+snwNvD2Om+UYpFzj7Dd8z4o0RuXSY5rICk=;
        b=CZBSaX3PT36VTPB6kgC+pPm+oWU/RFF4T5gRxKfofCPkmPeHd2H68I0LGrwdV2LXqu
         Mj+wR7nLB287KoTgrYc/xl8ER/YTj1MjLbArubPJeBvs13fSamF4kUDUiEqJHTbxy/S2
         D5lPbiYxtZO8HRr2LWwBeSzJroaN2PXcK5u9AY1N9ovrWpgNHLiY7ecKtyuPiPzJmCQI
         fwcrj3XZjFbX7EtYQeBhazKGe200w5/OJKM3GY5hZofXYn4ZB8FVJtWFi9Lz+3usURNV
         V4px+yNmfN4EnWhjvF3W+9ZVMtWBsJVtZ/LTJUiT+HzeQdoAx25JAuOjqabEoCKRLiFY
         bUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046763; x=1775651563;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcXBQG8D+snwNvD2Om+UYpFzj7Dd8z4o0RuXSY5rICk=;
        b=WE+NZpaIwaoIsrYGGx74Am0ypK3KWrC3di6I8SoGXbzDS986on+/dTino6g6xfW8wg
         HAospV4l0V87vz6F68YFoMfPbM/K40d1oSD/9V14sBXpl5YX+RgNU40td9e7RsK8zpvO
         mwAR2umLo8rhP0egPGR3Cfxz1S5li3QF/G3kTrL+DSultrNvgojJ24Z9B5Kq1Y6GmVny
         cVRLzpsjKqcoVLvQEgCe9Uem32djYBCtzVxmJSECyLke4MLtiXTnCe/Pc1pdjWN5OAz3
         oNHP0h6bVZHTzf/015DmBGZdT8XU5NWNaUIOknx+etR8KV76kNFCKIWDwWcbwyXbvz8W
         VEyQ==
X-Gm-Message-State: AOJu0Yzki9tGUUKUqYNxa1J2gFotBKFg0SpXx2UALZnD+V6Lm7UxZPZH
	w2QzEL1bxDfO3hdnxe52Nd52gnwua1ueGejDOs+xTxgSRIwyEFLhgeHb34Cj+avDKSAA96tUAV5
	SZCt0+q0oBFCddno2XQ==
X-Received: from pgax36.prod.google.com ([2002:a05:6a02:2e64:b0:c73:cc95:c0e4])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d89:b0:39b:e6af:2d8 with SMTP id adf61e73a8af0-39ef71fe1c9mr3888925637.4.1775046762634;
 Wed, 01 Apr 2026 05:32:42 -0700 (PDT)
Date: Wed,  1 Apr 2026 12:32:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260401123238.3790062-1-guanyulin@google.com>
Subject: [PATCH v4 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	dominique.martinet@atmark-techno.com, eadavis@qq.com, hannelotta@gmail.com, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	xiaopei01@kylinos.cn, wesley.cheng@oss.qualcomm.com, 
	sakari.ailus@linux.intel.com, stern@rowland.harvard.edu, 
	amardeep.rai@intel.com, xu.yang_2@nxp.com, andriy.shevchenko@linux.intel.com, 
	nkapron@google.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,intel.com,perex.cz,atmark-techno.com,qq.com,gmail.com,suse.com,quicinc.com,kernel.org,arndb.de,kylinos.cn,oss.qualcomm.com,linux.intel.com,rowland.harvard.edu,nxp.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-35784-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F3FA37AA78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current USB offload implementation couples the allocation of xHCI
sideband interrupters with the device's offload usage counter. This
coupling is conceptually incorrect, as hardware resource availability
and power management state serve distinct purposes.

Furthermore, the reliance on the coarse USB device lock for offload
state updates has led to potential recursive locking issues,
especially during device disconnect when the lock is already held
by the USB core.

This series refactors the offload synchronization by introducing a
dedicated spinlock for offload state, allowing for more granular
concurrency control and avoiding deadlocks. It also optimizes power
management by ensuring that offload state is only modified when the
device is already active, avoiding unnecessary auto-resumes.

Patch 1 introduces the `offload_lock` spinlock and `offload_pm_locked`
synchronization, replacing the coarse `udev->lock` and the legacy
`offload_at_suspend` flag. It also updates `usb_offload_get/put` to use
`pm_runtime_get_if_active()`.

Patch 2 removes the implicit usage tracking from the xHCI sideband layer
and delegates the responsibility to class drivers, who have the
correct context for managing offload data stream activity.

---
Changes in v4:
- remove spinlock in `usb_offload_check`.
- Collect the <Tested-by> tag from the OPPO team.
- Link to v3: https://lore.kernel.org/all/20260324203851.4091193-1-guanyulin@google.com/

Changes in v3:
- Replace the coarse USB device lock with a dedicated `offload_lock`
  spinlock to reduce contention and prevent recursive locking.
- Introduce `offload_pm_locked` to synchronize with PM transitions and
  replace the legacy `offload_at_suspend` flag.
- Optimize `usb_offload_get/put` by switching from auto-resume/suspend
  to `pm_runtime_get_if_active()`, avoiding unnecessary power transitions.
- Explicitly delegate `offload_usage` tracking to USB class drivers
  (e.g., the Qualcomm USB audio offload driver).
- Link to v2: https://lore.kernel.org/all/20260309022205.28136-1-guanyulin@google.com/

Changes in v2:
- Collect the <Tested-by> tag from the OPPO team.
- Link to v1: https://lore.kernel.org/all/20260225064601.270301-1-guanyulin@google.com/

Changes in v1:
- Fix build error when building sound/usb/qcom/qc_audio_offload.o.
- Link to RFC v2: https://lore.kernel.org/all/20260213100736.2914690-1-guanyulin@google.com/

Changes in RFC v2:
- Move device locking to callers.
- Decouple sideband from offload counting.
- Link to RFC v1: https://lore.kernel.org/all/20260130074746.287750-1-guanyulin@google.com/
---
Guan-Yu Lin (2):
  usb: core: use dedicated spinlock for offload state
  usb: host: xhci-sideband: delegate offload_usage tracking to class
    drivers

 drivers/usb/core/driver.c         |  23 ++++---
 drivers/usb/core/offload.c        | 102 +++++++++++++++++-------------
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/xhci-sideband.c  |  18 +-----
 include/linux/usb.h               |  10 ++-
 sound/usb/qcom/qc_audio_offload.c |  10 ++-
 6 files changed, 94 insertions(+), 70 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


