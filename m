Return-Path: <linux-usb+bounces-30159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F8C3BEBD
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94EC81B27420
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8607346760;
	Thu,  6 Nov 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="efnvtBPj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD642BE7BA
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440879; cv=none; b=VNCazUqKXKZWlquOmCAXoQtC3gOy8shELvOwNXGCJ086ySFl5rXx6cHpb7/QHzoHSySGRYo7JdX/+PIjMMOLg5NkxwBF8vaAmZ7I3AslSFb/cI75czsbm3tVxlMzWq+s+AQoPTGtUo71bAah0I6odvNlANR7iTUfsglFoemDofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440879; c=relaxed/simple;
	bh=yqPyRRy9rOzhon+Sl71PVmdBT+h+QTdgvgit+6Cq+38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6mQoofoBb0H8fRAbIP78sp6StOeYmrgG+PN+/pvuiWgR84DurZ9zeMKzMydKI7B24DY0afTr7h1pVnRNco08ZMH9RnN6CWp74ngcds2aqtnyqf0RNqtNwZBRKvY2jHRl4vlDl9nbhLLmSyNAxGwbHoGw1PBnwQluvTl619FvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=efnvtBPj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4774f41628bso11222795e9.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762440875; x=1763045675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/iJ8+grc2Rl2/IHfufh9TPIQreS9jjFa0ImljQu6yc=;
        b=efnvtBPjexY0aa7PbbJtZrYSZGrZ6vuz4I78aNp85IWNohP2iDl3zBx4g+ALamECcU
         GOAlcsL4Y8YElR/AnseZqSMS0wFmxPWmBdNKU8bXkZXQnciGv2LGJb5h8QrpDCx90SLZ
         gkQvTu6rmDZBxQaI2BTc7fYvtem8bAEnc0n7qIL8MZMkx9gbYYLBcbX3XRd32sF7kblF
         3ckR3eLdlhz+k+XO6NVHzap3wEN/70nHbpztWZleDpdOcQfcLG2MmyVKu+4rWSHTJ7mK
         ZCGnoiGx5WutBgbxTQc6EdX5aX30yWnztFQ6OGtvHHClyUq+Wcum5qx3r410nZuxF12Q
         gs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440875; x=1763045675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/iJ8+grc2Rl2/IHfufh9TPIQreS9jjFa0ImljQu6yc=;
        b=WlRQZvCZc0O2Zue+qDuD9xJahGASenMTcwLpI1B1lBaoWi0Ley3GxtbehFWkC3Pw24
         NEAzSJZBjdqmLJDQ4B1c8Xpuq2GNiC4LI9wo5/CAnL9rqvsei4Vjz6bUjrad1uPAHF2Z
         i4sh+zjJcxuVhpOocWJN4FRgD0AfguRECJd/o9HwE557gJ+wlGcXdNR6XL8D5X96cjsr
         sqLjs64FEsB9THcDhGWReb5aGYBewEwImgMIpn5WGXo4XSa067MCcoJi2kHQKQG+g3Z5
         QMUwCZQCprhM4gGLJtaSAPl0tz0Ij57/d6+5SBrzcAD39xgZDlhStTNAcxC7xiA52S/P
         2mGw==
X-Forwarded-Encrypted: i=1; AJvYcCWCVJOq4DYsc7SN4oUwb0deVrbGMoUt5iIZBmK0/h70SVAYYEcK0RodLZsCK9aE9C48N5PtYB9bVUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+wLK3Z46NpCfwqIcLRjyGrApRyHfz/JQfWf/+dCdRsjurVwI
	r2dcdnCAlfH2wv5I2TVS0gMJUQ60g5jLQ4pbBgz/TOpHvIPdq3r0Uq75Xe+IC47nAYdmJ0oGNPJ
	tuxf2
X-Gm-Gg: ASbGncvrGt9RK8Ix56c2dvsIV6HA8IrzFsrm6YwLjfgWyE7Jkw90vnqhNsmhoR5pt/5
	5OJXV7DcvVQ4spZwvLj+yNXw5NshsuxR4sPbgeJQPANisrbk7FMtSZRXN6StnR8FUq0wQJb/sqo
	9i8APzjkooOijH7kNWdKSKgh7rdh4dx8aoyj5kLgYhz9qjjkLDgkn2jLbRqj2YMcJAmjf/UK8wp
	CE76nZg+kWh6lBd2wgQnCroGde0zcfhAEczWf5dYnZZhqF1EyznDGo9CWEwgOwaasXu4Rt0/OO7
	SXNDxPSOUcuWgzEGduj5KQItM9vpXntulUtJwLpTrbw1O4p8zoOfTXlGwYAO23dawgU8pEMW7x3
	WSjkQiJtKPE4Fe/oAJXaIsmMRZJkOonJsYOY823n8VxMKWYJMhKsq1M5OME/THPFVqPcTO+QNP3
	3o9FKIvNUIovKDDYF/sbyTZkE/vQHjKPh9mQ==
X-Google-Smtp-Source: AGHT+IE3rCRx8PbAKMPkM4/+bTHmQJ+mzXIyyeZ009J6re9yllhWkKvYevjnVHoRfNl7KwpcN4nWTg==
X-Received: by 2002:a05:600c:a39a:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4776728d457mr16306635e9.1.1762440875526;
        Thu, 06 Nov 2025 06:54:35 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce20ff3sm108037155e9.10.2025.11.06.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:54:35 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: xhci: replace use of system_wq with system_percpu_wq
Date: Thu,  6 Nov 2025 15:54:28 +0100
Message-ID: <20251106145428.250251-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Switch to using system_percpu_wq because system_wq is going away as part of
a workqueue restructuring.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/usb/host/xhci-dbgcap.c | 8 ++++----
 drivers/usb/host/xhci-ring.c   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index ecda964e018a..9da4f3b452cb 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -374,7 +374,7 @@ int dbc_ep_queue(struct dbc_request *req)
 		ret = dbc_ep_do_queue(req);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
-	mod_delayed_work(system_wq, &dbc->event_work, 0);
+	mod_delayed_work(system_percpu_wq, &dbc->event_work, 0);
 
 	trace_xhci_dbc_queue_request(req);
 
@@ -677,7 +677,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
 		return ret;
 	}
 
-	return mod_delayed_work(system_wq, &dbc->event_work,
+	return mod_delayed_work(system_percpu_wq, &dbc->event_work,
 				msecs_to_jiffies(dbc->poll_interval));
 }
 
@@ -1023,7 +1023,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 		return;
 	}
 
-	mod_delayed_work(system_wq, &dbc->event_work,
+	mod_delayed_work(system_percpu_wq, &dbc->event_work,
 			 msecs_to_jiffies(poll_interval));
 }
 
@@ -1274,7 +1274,7 @@ static ssize_t dbc_poll_interval_ms_store(struct device *dev,
 
 	dbc->poll_interval = value;
 
-	mod_delayed_work(system_wq, &dbc->event_work, 0);
+	mod_delayed_work(system_percpu_wq, &dbc->event_work, 0);
 
 	return size;
 }
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8e209aa33ea7..3d05734c8377 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -434,7 +434,7 @@ void xhci_ring_cmd_db(struct xhci_hcd *xhci)
 
 static bool xhci_mod_cmd_timer(struct xhci_hcd *xhci)
 {
-	return mod_delayed_work(system_wq, &xhci->cmd_timer,
+	return mod_delayed_work(system_percpu_wq, &xhci->cmd_timer,
 			msecs_to_jiffies(xhci->current_cmd->timeout_ms));
 }
 
-- 
2.51.1


