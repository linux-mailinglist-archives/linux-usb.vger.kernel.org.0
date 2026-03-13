Return-Path: <linux-usb+bounces-34716-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKI1KvVbs2nfVQAAu9opvQ
	(envelope-from <linux-usb+bounces-34716-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 01:36:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3177127BA75
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 01:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E24583070FDC
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 00:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE33B2459EA;
	Fri, 13 Mar 2026 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9gW4T/8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE11C8634
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 00:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362115; cv=none; b=DDUnh29OrIlb4o7f/5XUpMTiU5EBRyN2mID5qFG7i9fc1CdHlU9aOzFhBVIv3gBSoFZmBkYl9niCrhfXc6Atzptb9chYC9n3F21BYBNRmdlI8WYusQufxQvJrGf4PBJ3C1bge3q2CXUwjWUdv1WdgJCM0h4hFqQkl8ebUT2IqPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362115; c=relaxed/simple;
	bh=w+4eBmfvEhip5bCDa4fv8QpZ35nYLDz1KYW1f0RZbes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCvcQBAwD0gaSHKWSTMLLDWQ7+m/fGMwIXywZNnnG1ufbElMNV7+t46cmI0zx7+OfCN0dJrWGVq4+aLRQ9BztxjxFLFy9KWh/f/snRTzxJTtq3gLYgy1FdO9cNH25jOOO8U/U+ZLD7dtnCgNz8VOn/0yMaOf/lphqphJGo94igU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9gW4T/8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so1036379b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773362113; x=1773966913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5g1oxOZuD0TjRJopzLlGiiDsTi7txtKncHU5UC9/URc=;
        b=G9gW4T/8oz0UAiw+37C6LcNiL8J9cEKvHyQUdWaG+ZzMoz9UozGsRI76SPcmhQwDuO
         ahxiJcsMQsieo2UoD8lyRMZxLpl1nuYEDEKDwdUWK0kTp/1nypP/qQ1D+aRQReLii60x
         skc663FGHYdDnpff/VMUDN6oSEePAhkg0yMFe78g2rNCGlIKb9X82hok3WXS1j0tVAom
         P8VDPbW+t6fGk0wbaEHvTo0CCq8FA9FhLei5I/bRpGS1qKqAB53wr7+Xo90rh9MaKKvt
         OCngVtBmhP7u5l5K7FOa5nOhIv11ipPZrUtMBInXfTc0Sb/qGN9CRr9crbQxc7uu4+EP
         5YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773362113; x=1773966913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g1oxOZuD0TjRJopzLlGiiDsTi7txtKncHU5UC9/URc=;
        b=aATOeu2dw+zggAMsa30po1ewjR4CCL/oWmc0jQki6fALiPYT9XnGNbjNtPHzdx751R
         tT2y4V4E3pFpKPvLjaAdW+zcJpOoeJs2TfraZkpItXE2MC4lytYJsreenWIihXp/1reh
         K/PTGj/nfKbi/2qVituDOLZmC5XRwQ312MMs6Vjux98HJRaBANa9kfp3w+y7mjedrYVn
         O9U/w0mREw7aKCC3nEusJsko6Kdb2RO3YQQLTbbaY3LW5VhLWp3GHUm+VT50eED0t5n8
         59JJyxMxTmKCFkBUQBsynMNmwWcuPEXrqzidnpnCkikXCEYyf3DkcW27aNjBlJULYFDM
         NEig==
X-Gm-Message-State: AOJu0YxPo6mS3LEq3LFJfeIgJ4J+cRAM96f1cU6bHaIUB/QnNqyreH91
	15FvisdxIJNmIcH3ttZQU3EM6xWhZ8jEtEQgLFnNoSNY16IMq/X5GiXlFpy347fH
X-Gm-Gg: ATEYQzzZ8uGUqlq88KpsbCACdCgmxpgj+7p+uN3hVVK/QhcKjzG4tQrsOatEF2BTn5I
	H7Rbpw9oEk2XzWC4/XVUP25FLNbGm7fw5i4skO53YtrJgJ8uquCZKkfsOgoS+TzVBd7jQfQvQTH
	gsa5w2nAKvNCFHmiywnAJs2XdCxE1IHFFBA21zCA94/R40pyP68HUqovQzPmGPHjrA1/1K0Jdmj
	N1R83Qih0oQSJajDdEYulnA2sr917FhcJSgo07v6YqE8bvsEeHK87Z4lYVQesn/WiA4prEG+x6q
	MaZyuQ/07aXTuYBeA3vGBq45kVLB2JDSRWe7fvH+NFcVhRSatB6E2DyiP03/UNHNt7IC5hu0mpD
	w1k/YrRTkm5dG5laZUnzYtK4hfrrA8E2v73irriQssX7iDSPchkVIa4OJ/lwue1NVgvVbsr2pkN
	5/XijDrsC1kpTLy9labCJBLKsPUnwTC3+GrHeW9GVhq2uPDQOY6zk7ztR3UxIfab9i
X-Received: by 2002:a05:6a00:2e90:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82a198fcf29mr1117576b3a.52.1773362113369;
        Thu, 12 Mar 2026 17:35:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0727f2fcsm4032305b3a.28.2026.03.12.17.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:35:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: fhci: use kzalloc_flex for priv struct
Date: Thu, 12 Mar 2026 17:34:55 -0700
Message-ID: <20260313003456.124270-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34716-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3177127BA75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert kzalloc_obj(s) to kzalloc_flex to save an allocation.

Add __counted_by to get extra runtime analysis. Move counting variable
assignment immediately after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/fhci-hcd.c | 15 +++------------
 drivers/usb/host/fhci.h     |  3 ++-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 271bcbe9b326..71e785f445a3 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -426,16 +426,11 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 	}
 
 	/* allocate the private part of the URB */
-	urb_priv = kzalloc_obj(*urb_priv, mem_flags);
+	urb_priv = kzalloc_flex(*urb_priv, tds, size, mem_flags);
 	if (!urb_priv)
 		return -ENOMEM;
 
-	/* allocate the private part of the URB */
-	urb_priv->tds = kzalloc_objs(*urb_priv->tds, size, mem_flags);
-	if (!urb_priv->tds) {
-		kfree(urb_priv);
-		return -ENOMEM;
-	}
+	urb_priv->num_of_tds = size;
 
 	spin_lock_irqsave(&fhci->lock, flags);
 
@@ -444,8 +439,6 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 		goto err;
 
 	/* fill the private part of the URB */
-	urb_priv->num_of_tds = size;
-
 	urb->status = -EINPROGRESS;
 	urb->actual_length = 0;
 	urb->error_count = 0;
@@ -453,10 +446,8 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 
 	fhci_queue_urb(fhci, urb);
 err:
-	if (ret) {
-		kfree(urb_priv->tds);
+	if (ret)
 		kfree(urb_priv);
-	}
 	spin_unlock_irqrestore(&fhci->lock, flags);
 	return ret;
 }
diff --git a/drivers/usb/host/fhci.h b/drivers/usb/host/fhci.h
index 1f57b0989485..e221b28e8608 100644
--- a/drivers/usb/host/fhci.h
+++ b/drivers/usb/host/fhci.h
@@ -387,9 +387,10 @@ struct urb_priv {
 	int tds_cnt;
 	int state;
 
-	struct td **tds;
 	struct ed *ed;
 	struct timer_list time_out;
+
+	struct td *tds[] __counted_by(num_of_tds);
 };
 
 struct endpoint {
-- 
2.53.0


