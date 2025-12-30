Return-Path: <linux-usb+bounces-31838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B64CE951A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 11:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85D0D3003B02
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76842DCBEC;
	Tue, 30 Dec 2025 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KUZn6Z/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290932DC769
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089617; cv=none; b=IdcxLKEkdlpSfTlYhbvirLsmFRhWkShHLyZccI8/MSK8IsFRGwYfVLB7pAMRaXXdIAn+c4Zy9YTlhbCLN3h2AEWSJ7Nde4mgv8esGFAYFkhOXHSrwWMzvH/5m/YsQNHmUEzH+Qhk/JsnA8Qh9/HPVP/HEvskBugGKgbuu+GB1bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089617; c=relaxed/simple;
	bh=bFTNHGlATa0Hla5Mbg6BP8YN6e6iG4/i1alM7w8QGgs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G+ksDpegWVtDwqaxXmeMhv7uiHbzquAJQtCXj2ro3W/P9rbL5mb2xF2EQVho2xIUjds7JR5ChRrWYvc0SGWQEEUDuQwu3aWDaH1Vy9MHKoJfiVZA/uq3YNrqXM9dSTqm1yTEAo65zZu53y/b2VLV75D/7C1KqpcOT09ITIb1pOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KUZn6Z/6; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7d5564057d0so23475298b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767089615; x=1767694415; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jOZKIuCkqJHkqWCHRB+SikfdpIuZqSJJtfkMgy1p+g=;
        b=KUZn6Z/6n/DMDAGbpRLV7O70rf2a8eseHThGmhD2Xh9YFTnM2qBRmmyXPXMrDCIwwC
         L1qH/k/HJ2jTVjt1ZBKcu3xd3PB7uhg2PmIMbTBMSSE1sZbyD1Tan0pN3klKkJGaPykq
         b/Mj9xv9SYbKMx2cnFS3BQ5wDMC7Cwkj3KVus67VINbKAWyVGqk9F9jiOvY7r1k7RxYq
         i+gsW33rhxX6lZdlEN0PuPbPv4/aPU0W6+5CIK8I27XsSC1GNJ615AwVfFObgmFGUKSw
         9jyk9zJcQHshNvTE5xlPHtAMSTRirNo+rrg/Qc7H3nOjvtZZ8VCG6q9/4pDys/NBtqvx
         ntbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089615; x=1767694415;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jOZKIuCkqJHkqWCHRB+SikfdpIuZqSJJtfkMgy1p+g=;
        b=lCYnP1Z81Odojuh3cYLX5NcloeJ1O+pP2uFSAGlu6dsEwa5dsw9NhFg2yreL1JuaSD
         /ciYTQGcwNQ/gsp8Ip8xsalFd45cDUlughHiKDjvAOc3mnhVAbzRduDS6Qgd8Rxkke0Z
         kV5dB8GQBFXAMfDd68LtYtA/ZbwbL3opfsG3+ghb7DRFp2xsR9DS0zbVBo2Pu938jFmf
         +O3ImmOdGKN6CXRyDB8R3jVtiwVSMDwC4XbiPLn+X1OmTLfel/A4RAvMXw2e18A+JOve
         ULfifGuxesFPZ3sf+Ej1qHd37dtacRgv1rKCKRBMwzqMCqfUN+w6JqTujhYfBJZScyWF
         j0/w==
X-Gm-Message-State: AOJu0Yzy+mZPmIYlBMQIWB+Zf/lowxfEbIfB+1/ApBsxju7b3vB/0srZ
	GuWVYJ+GxCrYMEUx1fu7d9XFmxP3Jjvn99HQQW+q5z8V/OUydP/tm0VvEgsE1FJulZbPtJqRMQ+
	W/UGjzA==
X-Google-Smtp-Source: AGHT+IEImhiwIBtyB9uwTQWMXDP5sO/acuizF4Z0INFLRG+6D1/NhX/w6UmGzfdzHf2E2R2GylIIrUw5nbs=
X-Received: from pgag25.prod.google.com ([2002:a05:6a02:2f19:b0:c06:531d:e55b])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32aa:b0:366:14b0:1a2f
 with SMTP id adf61e73a8af0-376aabfca96mr31871828637.61.1767089615374; Tue, 30
 Dec 2025 02:13:35 -0800 (PST)
Date: Tue, 30 Dec 2025 18:13:15 +0800
In-Reply-To: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767089609; l=2399;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=bFTNHGlATa0Hla5Mbg6BP8YN6e6iG4/i1alM7w8QGgs=; b=sTNA+otnvqWmULvk2FmT51uy43fDZXUjva8mkEZNFZkqmy436EtKiNFWRjGUn9TJzMP5b6+SA
 5Tehw6IpdSqBKlQrErEJEr9ykXOyCjMVq28RKFpz0DRHa2j76+vR9vo
X-Mailer: b4 0.14.2
Message-ID: <20251230-ncm-refactor-v1-2-793e347bc7a7@google.com>
Subject: [PATCH 2/3] usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Prashanth K <prashanth.k@oss.qualcomm.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"

The net_device in the u_ether framework currently requires explicit
calls to unregister and free the device.

Introduce gether_unregister_free_netdev() and the corresponding
auto-cleanup macro. This ensures that if a net_device is registered, it
is properly unregistered and the associated work queue is flushed before
the memory is freed.

This is a preparatory patch to simplify error handling paths in gadget
drivers by removing the need for explicit goto labels for net_device
cleanup.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 15 +++++++++++++++
 drivers/usb/gadget/function/u_ether.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 745ed2c212e3a706b0e6725731b42d34428f8b22..6c32665538cc0dcbce8e73ec8ea573b04c720386 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1125,6 +1125,21 @@ void gether_cleanup(struct eth_dev *dev)
 }
 EXPORT_SYMBOL_GPL(gether_cleanup);
 
+void gether_unregister_free_netdev(struct net_device *net)
+{
+	if (!net)
+		return;
+
+	struct eth_dev *dev = netdev_priv(net);
+
+	if (net->reg_state == NETREG_REGISTERED) {
+		unregister_netdev(net);
+		flush_work(&dev->work);
+	}
+	free_netdev(net);
+}
+EXPORT_SYMBOL_GPL(gether_unregister_free_netdev);
+
 /**
  * gether_connect - notify network layer that USB link is active
  * @link: the USB link, set up with endpoints, descriptors matching
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 63a0240df4d749bd91c9dd6743406075093a3168..a212a8ec5eb1b920d53fadc7a0e0e80e18db8ba9 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -283,6 +283,8 @@ int gether_get_ifname(struct net_device *net, char *name, int len);
 int gether_set_ifname(struct net_device *net, const char *name, int len);
 
 void gether_cleanup(struct eth_dev *dev);
+void gether_unregister_free_netdev(struct net_device *net);
+DEFINE_FREE(free_gether_netdev, struct net_device *, gether_unregister_free_netdev(_T));
 
 void gether_setup_opts_default(struct gether_opts *opts, const char *name);
 void gether_apply_opts(struct net_device *net, struct gether_opts *opts);

-- 
2.52.0.351.gbe84eed79e-goog


