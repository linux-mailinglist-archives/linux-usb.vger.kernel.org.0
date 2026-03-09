Return-Path: <linux-usb+bounces-34253-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNMECEcwrmlrAQIAu9opvQ
	(envelope-from <linux-usb+bounces-34253-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 03:28:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475F233432
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 03:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21728307E260
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 02:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584B8285072;
	Mon,  9 Mar 2026 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q9M4McOW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF9E274652
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773022932; cv=none; b=VUlaXI6sMyXj782flisHsfdBNcpcM+U15KrYGwk58CGc82PzQCEcjWhUH8/lC7nQwpjaZwfErkeYbx4AvwiMEoIlZcba+ovnh/y5Lpk0aiUnHA43VKgxG98dlvrF8BrykprZm4hs9bkBAGaOeRRV9vMZsWAKKcZPTNE9FZMdWY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773022932; c=relaxed/simple;
	bh=Sd/a1tIrlW5D639vCZPgs3bP/bIsPojyJrmCK2WuUNs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bk/fRmmST9YyhvTNDGBZQB5k6h61gG/ZuNbn/85KqvqGQ2PEeSAO51MkzLEKSJ/IZ9TdkiJ1jmkoC487RcdbdEqnMPYix0/H8tie9vNZrwyo+Ksmt6zZSgcgd7ICeFnixxTG6weJbVYGMp6NJ0n4OlWzkVx+bH53jrkesMKWTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q9M4McOW; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3598d3e3bc7so7167610a91.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 19:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773022930; x=1773627730; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9r4lEyM4jHyROCAg8WVXHBssWIr19tUvRwLbPd6TH8=;
        b=q9M4McOWFE1NqiAcJd5eFKHH0sKHMF0Mq7NkvBaImGhSs8nhthpo0J49TEHtP71HKa
         heJ7DWsDHRIjSeHVHQO43Wb48ycj/6l2x21XLGygAapm/LSNWPZbzA9eWF7TKvcvcC/M
         B1PABk+duo8BAAGTfpkrSX8VMI1QiXeabux9zYM7G9u7ngXzeMzSe2JqWe3rmUG0lUPy
         ga7ufXPWu257DUSQCSaIbYFqN0O5WkVrxxDImNt5wGN9/AEJdJ2u/ShoG6cHTBAgI2Cu
         +y0eNG6Wcd0aIrTCz610cwGpV4kDWALSi7NA/NBDaTu00xXj6Xq029aYhu/4Ri0nQQR4
         c9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773022930; x=1773627730;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9r4lEyM4jHyROCAg8WVXHBssWIr19tUvRwLbPd6TH8=;
        b=agWpISyl8/WaXaEgvL0JAo2RThMB4FJBIEUj8MlgccAq8sAf5GpzA+nQzvGI7FAnUb
         rB/IlSOhVyqORYiSUg3aMiZuL+/lOJPQ3oAgEB7FtOreexzA5IDG02LLZUemdGwV32f6
         F6Q106Qn/Ji25G9LoAQAN45syrc+PewCkFHXMmaaVM8k3l+DEQ1CjWY9KJwlEt+Vp6bs
         SQXsYG4ULtGpBVWKEXIC3ByMSHxfWguCqqWecsFtD5HovlFu8KS1bi/WwLdYDm3qAcWv
         qDJjo1xJRwEAvDl4G7bu/GxNgpk3aIagLOoayUyQK9i+QdyCs0v+Tcga+Ep29MURHESa
         kr3A==
X-Gm-Message-State: AOJu0YyA3lauMJfu7TgqCGNfymZjO2O+TDuqG2m9jhTAuCU40Wu7bj/q
	B4pPL6Cta1NxdQRFWmfUv3bhg7Ssc0vBf0kXhwWPMvHHUEjWBcSrnyhUyNYMbiVZTcgtuPai7tx
	EFjVhWL9zB8ALShKa4w==
X-Received: from plbkb15.prod.google.com ([2002:a17:903:338f:b0:2aa:ed18:fbb1])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e549:b0:2ae:6d9e:ed5a with SMTP id d9443c01a7336-2ae82439431mr88558145ad.13.1773022929572;
 Sun, 08 Mar 2026 19:22:09 -0700 (PDT)
Date: Mon,  9 Mar 2026 02:22:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309022205.28136-1-guanyulin@google.com>
Subject: [PATCH v2 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9475F233432
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34253-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,wanadoo.fr,kylinos.cn,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.916];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
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
  usb: offload: move device locking to callers in offload.c
  ALSA: usb: qcom: manage offload device usage

 drivers/usb/core/offload.c        |  34 ++++------
 drivers/usb/host/xhci-sideband.c  |  14 +---
 sound/usb/qcom/qc_audio_offload.c | 102 ++++++++++++++++++------------
 3 files changed, 73 insertions(+), 77 deletions(-)

-- 
2.53.0.473.g4a7958ca14-goog


