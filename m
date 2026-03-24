Return-Path: <linux-usb+bounces-35410-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MISrLGb2wmkEngQAu9opvQ
	(envelope-from <linux-usb+bounces-35410-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 21:39:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CED31C68A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 21:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9555A3043175
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 20:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A3B353EC0;
	Tue, 24 Mar 2026 20:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9lcD/a/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80634A3D0
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 20:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384739; cv=none; b=OnYXABE4tT1Ea5hmkZ6ADkbPsaT3A3dKYvXEovq0w+vrsNOQoG/xDsV/PWADvh5GpRq+BR5qbVKwXl4XfV90PDG4Yst54zm8OEDnqszU+K+1hh60NKm9vDKk6M6dAYHh2bvuznsKJkIz1CKX/BZeMWYiTMFLAjTXNZ/9AgmNLcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384739; c=relaxed/simple;
	bh=MQbazrkmdRYT99sVdqIvGG5jY4ZqY7LLsRLiPijFSDs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=n59auuS2kTE+VTnOjOYh4mm8/Gt/URdPN8RaYk5iSROE2yWwYSdLuBph7EVDfi+p+LZdOy4dsJ0ZawH+6f5KdDEK4l1bpsXA/j4/yqc74tPuF27NpSYVJJryeP2XxAVazUctewu6ebk3OhWkNsjWVEykWgdCtXH4e3C4fEjxCWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9lcD/a/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b0560c1320so123916135ad.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 13:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774384738; x=1774989538; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kzhp1Qk8a0PdlJT7jxayKm1GkrTY1c3ya2dGHroCMvU=;
        b=s9lcD/a/Wp/g8AeorwaDfgehvbAJL8esc4tJuUUF3Glgy8+zytcGUVhb/oEvdgN2mK
         dv8SFGMW516pI75f+IkLEm3gTXnsTMdJpaCzc7jSR1hgVwK9Ce0gB8k/6OnzArFQvjph
         uOz0sera4KjjOUxsCyfl5PjNXlK0W9LvYc8LLlWeHzJtX9w9puiKNeOItpPAi6G1o0s4
         /y6MABxqTzOsu2ZHymBFE81+SWrODwaxBE6bZe/4vsuh5V/rGk9G+1UfGKG5O62MTkdX
         8wTA0CUWc8pAP3stYq+8SbnVU1o16x3yBg5bjnLZgVMkDfnnf+uzdhHuH6NSj4FmwUuS
         gWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774384738; x=1774989538;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kzhp1Qk8a0PdlJT7jxayKm1GkrTY1c3ya2dGHroCMvU=;
        b=HRdQAVUKIe2uCdKx33njBtpwbRDuQiuZcSBFhjpJvDLTMy07sm0gfQOVuSlFGF9lB0
         JuGJVMbAfxc4CNNhfATzybac3tK/qD/6H9A5o6zj2HjPJeFWyedNtw8vyrsbBbQE+uLv
         2QXHnGX6Zr3vPaui+GTl/83vnraDjz1vwN32e9srVoSY+v9HUcc7b44rtvFsUd3M9Qeh
         6hmTaRYrMx/GlnuJg+FzGldK2c7zVQ4c3fA7Cm//npsMS8zhiBm/YUsEB9hEr7yTUW5W
         p6byrum5r2DOmu/1k/gZnwpjMF6ef5PB47tArY6fcpVRKNZrPBGrtIv6tQiOwY7ayhjC
         ks7A==
X-Gm-Message-State: AOJu0Yy47C0XRyDmZAXxjOzd6RDg+i3F20whLJ3qLgYyh8XtO7y9zW7i
	GwnBDmDyYS1AphQJHmxU5uLb7k3ckpovY2PIlS/cDjoiD5W6NJGT3sfN9yF/USKL5rRs5MQjdVs
	TGw4AuzoGKGcYYNYD9w==
X-Received: from plaq20.prod.google.com ([2002:a17:903:2054:b0:2b0:52e8:578])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e951:b0:2b0:665b:c7de with SMTP id d9443c01a7336-2b0b0aef15cmr10314125ad.40.1774384737642;
 Tue, 24 Mar 2026 13:38:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:38:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260324203851.4091193-1-guanyulin@google.com>
Subject: [PATCH v3 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	xiaopei01@kylinos.cn, wesley.cheng@oss.qualcomm.com, hannelotta@gmail.com, 
	sakari.ailus@linux.intel.com, eadavis@qq.com, stern@rowland.harvard.edu, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35410-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,kylinos.cn,oss.qualcomm.com,gmail.com,linux.intel.com,qq.com,rowland.harvard.edu,nxp.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 56CED31C68A
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
- Collect the <Tested-by> tag from the OPPO team
- Link to v1: https://lore.kernel.org/all/20260225064601.270301-1-guanyulin@google.com/

Changes in v1:
- Fix build error when building sound/usb/qcom/qc_audio_offload.o
- Link to RFC v2: https://lore.kernel.org/all/20260213100736.2914690-1-guanyulin@google.com/

Changes in RFC v2:
- Move device locking to callers 
- Decouple sideband from offload counting.
- Link to RFC v1: https://lore.kernel.org/all/20260130074746.287750-1-guanyulin@google.com/
---
Guan-Yu Lin (2):
  usb: core: use dedicated spinlock for offload state
  usb: host: xhci-sideband: delegate offload_usage tracking to class
    drivers

 drivers/usb/core/driver.c         |  23 ++++---
 drivers/usb/core/offload.c        | 107 ++++++++++++++++++------------
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/xhci-sideband.c  |  18 +----
 include/linux/usb.h               |  10 ++-
 sound/usb/qcom/qc_audio_offload.c |  10 ++-
 6 files changed, 99 insertions(+), 70 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


