Return-Path: <linux-usb+bounces-24238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB5AC148E
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 21:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288B61721E0
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 19:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAD028A1E5;
	Thu, 22 May 2025 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQT87wyx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29C29A332
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 19:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940958; cv=none; b=Y8nYBBMVl1z7J9JHhIPE10ptoEF0KANT34R2W9eD1B/ml9E8fuPqVFPAEXlvKhml98JZmiSI/imygCntBKRg3uNGAoSVjdoYFHPonw7fnljkP5byJOVYTjNzFwtp8MBj6XnxrglkT4z0v6bbBlnfUb1yxn/9+ElIyccSLDkfVLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940958; c=relaxed/simple;
	bh=rd2TKWkpjNygAIzO3J8bWjHQCANcSDcjgOTEjNNUvTY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=MD929oPZTrEmuYFuiYpYcAXm5dZIjokP9jBrXobMiGkmGCOGWRnp4U6fQrjGPgLRxhKs+3FxqsebkGGPhEWFUWyypyToX8t15gBU6rlVoXtNydia0flmJjZyjEBhU1pbTlchXTnU0n4/44dH42ZB6+0gsnaSRp4+UxLf7KOj52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZQT87wyx; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-875ba574183so116487241.1
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747940955; x=1748545755; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+rcwnMFYARkjpSO5lxv4nnGGy5qtWxEQl19fHNd1GiU=;
        b=ZQT87wyxazGEE2qqJXWorhTYty+e9YB28LzeB1f7s1t2wbrK6kuTpgvFwZBs2+paaA
         mD/fy0vsiaEdQSpdq0BHHF87/1p9wneoyq/V++eyhmIBXIsJfH68LjqA2JOrd1Gmlb/9
         oo1Cu64PrVXnIHz0/xMUMpaWEJ8x8ZOegisolncTFCcy2F512fYykMt5JbDeW63Ug8Ul
         XnF+uOUhONFhmvOsVX3Kl8yOT54iI6tlqHBB2V3PZUJZHnWyUJ0Hr4BszPnf3gaL4ySe
         FmpPFQz08g0JiMHKrL93HXuXrjzbp4Pupuj199gmHtNsMNIaq6BUl9/cqcZ4odyUsF4X
         Roaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940955; x=1748545755;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rcwnMFYARkjpSO5lxv4nnGGy5qtWxEQl19fHNd1GiU=;
        b=owMbsv8EHDWyxL19+H54w7uOj6Qpjj/uS25MCacea7k/nITWTDPXENVHpFHNbmN4NO
         w9woHFdqL1WKbgzr6Fbzqfe4WXRh2E1AcAadlAGuvxVyi9VoJ945apfNkMftdrKF+PLd
         Fu9hGwSf+D16AlgtviySBgE7x/W6ck8m4sGVY3zsMiluBtwiIwPW7aayI4d6hsf+nZqr
         PXJjlemt/VD8wk5cyMkmf/Dep1SDXWEPXszOKM0G6YTnqG5/6BfClVjAk3cImuVT4/la
         9mRFXAf9ssXuvlwESpfT8dytqFEkUT07tEkgqOB9JQDUTt9VKkN4FWx8oeVeVBZKx40C
         tP0g==
X-Forwarded-Encrypted: i=1; AJvYcCVjmdRKVkdXLXhkyzWg4a1AG0UfbaK0WX5rMNvYXydMsVzivVyikaYVRAYsC58NM5ontwBMBdyRCNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKlhV03fIwGY7TLeAzcj9JrX2EOSuJsx2jlpUfFUcg38QMCBx4
	wwxN2yvnG6ph80AhpCthD6lXxpLlvW24RtsMUvFGmbgPhjBYmTf3yc8J6F6u5B/KGqiG4+aQgB2
	FdsL+RA==
X-Google-Smtp-Source: AGHT+IFm0IXIKDX36/Vm6Fn59iLE+XZ7oZkGFNh0Ftsp0H2grUjVc9yINSe6gprwqD3+1SSCiKn5S4qLV98=
X-Received: from vkbi11.prod.google.com ([2002:a05:6122:8b8b:b0:52a:65f4:937e])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6122:2007:b0:52d:bcd1:ab55
 with SMTP id 71dfb90a1353d-52f1ed6fa19mr967326e0c.2.1747940955164; Thu, 22
 May 2025 12:09:15 -0700 (PDT)
Date: Thu, 22 May 2025 19:09:10 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250522190912.457583-1-royluo@google.com>
Subject: [PATCH v1 0/2] Revert commit 6ccb83d6c497 to fix DWC3 dual-role regression
From: Roy Luo <royluo@google.com>
To: royluo@google.com, mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, michal.pecio@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
helper") was introduced to workaround watchdog timeout issues on some
platforms, allowing xhci_reset() to bail out early without waiting
for the reset to complete.

This behavior causes a regression on SNPS DWC3 USB controller with
dual-role capability. When the DWC3 controller exits host mode and
removes xhci while a reset is still in progress, and then tries to
configure its hardware for device mode, the ongoing reset leads to
register access issues; specifically, all register reads returns 0.
These issues extend beyond the xhci register space (which is expected
during a reset) and affect the entire DWC3 IP block, causing the DWC3
device mode to malfunction.

To fix this regression without reintroducing the watchdog timeout issue,
the first patchset "usb: xhci: Skip xhci_reset in xhci_resume if
xhci is being removed" skips xhci_reset() in xhci_resume() reinit
path when xhci is being removed, which should address the watchdog
timeout issue. Then we can safely revert commit 6ccb83d6c497 ("usb:
xhci: Implement xhci_handshake_check_state() helper").

---
Changes in v1:
- Link to previous discussion: https://lore.kernel.org/r/20250517043942.372315-1-royluo@google.com/
---

Roy Luo (2):
  usb: xhci: Skip xhci_reset in xhci_resume if xhci is being removed
  Revert "usb: xhci: Implement xhci_handshake_check_state() helper"

 drivers/usb/host/xhci-ring.c |  5 ++---
 drivers/usb/host/xhci.c      | 31 +++++--------------------------
 drivers/usb/host/xhci.h      |  2 --
 3 files changed, 7 insertions(+), 31 deletions(-)


base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
-- 
2.49.0.1204.g71687c7c1d-goog


