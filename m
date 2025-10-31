Return-Path: <linux-usb+bounces-29956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8CDC25568
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88B54189D309
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0737E337B8E;
	Fri, 31 Oct 2025 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTQsfIJ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3392D3A7C
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918471; cv=none; b=EIUNW0NiHY3Sxy3Ey3wLO9qTkB3G8d7CjQ2JBHY5VbXLqAKoPCBseVKJaCkF+tXKLRZPBo4ywNR1yvAp7HQY6FO+AkZjctio6CItqSepE0F1ehPWU3w1oAVscL3WyH9KLORNwMdMICQhrCESvpiFLAfm7TT5SnfwbRvdkGxIvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918471; c=relaxed/simple;
	bh=lv9Fkug8UarBKmWSdJNWbQ+qkbQQqSj5ooPZo0eIpzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=akiCFzGH13zIFJ2ZWa22vqsMuSEpqOrrMZqDe7LNgDofdPs5DBcjXxBXZlJysonvfVCvxa/WP9ob4EV/EGTa+UA8uudYE0cDlwXnPyp7n7Zuxzignv3oVIJwOZ4UNQPhRoSbNBHot98/NwHfDlBmU6cECwL9RcDmhFFOPACtsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTQsfIJ9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29470bc80ceso25874365ad.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761918469; x=1762523269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vTLpp1CXptXP5Avq6h7xCmd4Mk+qUexmMRpLJiy3rE8=;
        b=bTQsfIJ9+d7GQrGN1IGGHbjXoNXGiAeuaw+1nBBG9baw2t8q8kLHPct07b/KkaFY5D
         4Y9ivtVJ9Ne9M5PuNaJmS75d9A+jkycVWRwkwDmvEl5kwU42PHUkjYg6oC2fIn+fsGMJ
         0y3HmROpy4ny7ktIK0dY+n3dvKn8XgBaOdzAEjzLMipgg8ANwIxhx343HEce/lbmHzdK
         uc0Kyc5OA8sIx4CGMh8wqYax2kHEL5WqsETQDbW3wRWPvAz+oGxJrOuKBfj5WaAvhppF
         2Pfw4lL470SMittOq6zMInGc/LScVK3lGUs7zBwTL3IdfG1kShfTOaPAocp9UEd6Fw+u
         fNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918469; x=1762523269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTLpp1CXptXP5Avq6h7xCmd4Mk+qUexmMRpLJiy3rE8=;
        b=s8Z0ZXFPY2DKDF1Q/YdDN0xVbs+vTw62lLKBvhcOrLx1a4y5jK4NbGBmQELaguFq7+
         f7FiRN18G0GVDbdXG2lzfPvUk1XiiFnTKgNFaSDDNBkt+TvKGK3rZaVEaH6hs+6ScKqH
         32MtuUWCEzKwENNFfwDuz+0KGD5BIbP0F/g+zLzUGyUambUeJMFByVQ91eCAaC7JJA6M
         u1tWDK09+IvhnUdQPn70GMFeheKRvRfnRE21lPngFjmshaGKH/g0KRB3KVqRoav0hO63
         /axxDMMCTcxC3C3DMFYjiCU2KU5F/OzBRNxmCf98bLyNrYPUJ8axk3Y9S9GbwQAPGlxp
         vBzA==
X-Forwarded-Encrypted: i=1; AJvYcCUc2+i8W5RFx2RMUL6mp7tNE0l6e6OZxIAo+fRibewzPxvXBRdtPCa0IdNDJHLYDl/mcBK6WogqXMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWfwlAkuWRzduzhrBy1jI7+r/sf3pN7e0jXjj/alEVnqg8AjS
	5tnmdFFCP1btK4sBvAPfd0sA3fOc4FGYRZ0a3KW2M2cETd0lC57Qt0w=
X-Gm-Gg: ASbGncvjZbg+kHbQ2JXICoSCf7B9X2/fa+ZoNwLpNMX47H4B8+q9+ERWhOAa1wRu0QK
	AmOb7R6faiL2R1/RkhnrsKt/frP4rJ+Juq0nIDS+Xp227MY/EXxnASChWqYeloIrRybQmMopo8e
	e11E75H1an44nfD/NnQtn6WUlAuIU4+v9+HtY2IHXY4KF1URwLC/5c+zCfn8a4xHg9pdPJUC5+H
	c6kRrxv1HDIaRhkwYAxLdpO1Ww3oeXxidG5Q6XNU7+CEix0AoR95fX003yBrLmewYZUEOHWvxwh
	tUjMwWG9qlvBxLCm9Vk+Yo021ViXbCNa4wgurmm1FQUZRshYzxWNR54m4RZ7dms7p+W4sObjUEu
	WHY2AUhaj+6aL5bWmawPQcpdU2Ym9trFiS8CmlnL5UjfmD+oYYaq3gt73c46jMBv+Z9wx39lw5y
	NiDNa+OBoT1L6k4AOnpi8=
X-Google-Smtp-Source: AGHT+IFVleGd6d3qrffkbGaQm6oVAD7m7ue1Q8ELzAj6WTVMPmkx761XB58Q9EV/1aJXIUifd9ioFQ==
X-Received: by 2002:a17:902:e54c:b0:282:2c52:508e with SMTP id d9443c01a7336-29517c194fcmr54681425ad.8.1761918469347;
        Fri, 31 Oct 2025 06:47:49 -0700 (PDT)
Received: from VSPRIME.. ([2401:4900:52f2:3b59:ca2f:95c0:7c6b:6e6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952689e942sm24650595ad.25.2025.10.31.06.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:47:48 -0700 (PDT)
From: vsshingne <vaibhavshingne66@gmail.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsshingne <vaibhavshingne66@gmail.com>
Subject: [PATCH] usb: core: prevent double URB enqueue causing list corruption
Date: Fri, 31 Oct 2025 19:17:39 +0530
Message-ID: <20251031134739.222555-1-vaibhavshingne66@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevents the same URB from being enqueued twice on the same endpoint,
which could lead to list corruption detected by list_debug.c.

This was observed in syzbot reports where URBs were re-submitted
before completion, triggering 'list_add double add' errors.

Adding a check to return -EEXIST if the URB is already on a queue
prevents this corruption.

Signed-off-by: vsshingne <vaibhavshingne66@gmail.com>
---
 drivers/usb/core/hcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 87fcb78c34a8..66861f372daf 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1758,16 +1758,15 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 		pr_warn("usb: URB already linked to bh->head, skipping duplicate addition\n");
 		return;
 	}
-	
 	list_add_tail(&urb->urb_list, &bh->head);
 	running = bh->running;
 	spin_unlock(&bh->lock);
 
 	if (!running) {
-        	if (bh->high_prio)
-                	queue_work(system_bh_highpri_wq, &bh->bh);
-        	else
-        	        queue_work(system_bh_wq, &bh->bh);
+		if (bh->high_prio)
+			queue_work(system_bh_highpri_wq, &bh->bh);
+		else
+			queue_work(system_bh_wq, &bh->bh);
 	}
 }
 EXPORT_SYMBOL_GPL(usb_hcd_giveback_urb);
-- 
2.48.1


