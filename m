Return-Path: <linux-usb+bounces-34820-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K3dM7GVtmkUDwEAu9opvQ
	(envelope-from <linux-usb+bounces-34820-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 12:19:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F3290795
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 12:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D48FA3018681
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C4633985A;
	Sun, 15 Mar 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5uNXxZg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E175219A7A
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773573550; cv=none; b=bMKjdi3cJErsoJW2Au9UlVok2NvIZe+hHnrpsUHd5H4jYXUukiH9Az5PXxMfN+tuVNBqjyEN7kXqeVqFsMPQPw2SXs2m+SJXh7OM77QGX+y3H9b2hky0bIOvKOeI4Bi9wG44kBYLzQlvKJOhTXZ26FolUvvdanRCfA9Wr9nwZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773573550; c=relaxed/simple;
	bh=0UefnO4eaW8lHsTXEvSrUC5/KAXSGKCM63koqRLi84w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MvTCitJH+Vlg1g9xXeHjJquRC2Y1+2j50+B+Tmfqwm+eLxbacU+Hi5wnwGIGE01HTTPBIY6uTxvJlYWzNwCoULBWiJCO6/4x8fmB+HcuCGhpkgr3GOjOnzn/wpXlCiNBmgMnPmI/4kOwaAtJfpU/1L72X9mw37tHOPV4TROSdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5uNXxZg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12c19affeso4522626e87.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773573547; x=1774178347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHh6cG7abCLnOdDMslHtYEIsgp0ugQWOPOXOQy5UzL0=;
        b=M5uNXxZgwsKms9BggJLFW9CCl9EjQAZFvgs1mfheOj9Nt6qYPy7ujm0hw67c5VkHVS
         GjomieBb/dMN0UPgrPRIRkfgNUjK6MUMADRLDg1xSM/Wl2rcFax/OGit8qngz1AHe+r2
         g/Uydk7OVuw/AqoP8EZmo1vpltNW4r02pZXmvEi8+clM4lEZVTx4LLe1/MQfRPuS6Btn
         5nqtzRyyiKRizikCk1kaeelXiHlQbndR2b/j+LlpEblldwfr2jz4VsgBDvuFtAycXVc7
         6Tbl79eqC/EFNj0FEhL+PGWiQqli9M4bvSB6cM0APkwiZU3ueugzCtyDhe/joRSFdVsZ
         Eipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773573547; x=1774178347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHh6cG7abCLnOdDMslHtYEIsgp0ugQWOPOXOQy5UzL0=;
        b=o9sCdegVCDueoK7xfXRKqG95x/NCIWTLrIQCXjCd+VFS3GEv4AL1eUNhZ4HKSdX5j0
         bl5+M6CiiCYtxfHi0whaA2M3evQ1jJtQGMUuESpo3ZmDbGcWZeqo3h+PlSxlwee9WL2D
         JK0pvpDuhtDzKvuAeAE9mJYId8S4Cw3//vvJQH68EwrDj6NcgEqN3y9Wyu3C3Z+8pjZg
         fr11NSjjbtnB0QEsnUZr75PeHssx9zLYQppFlX8fJ0FI1CssR/NMuWSC8bnNFaSLRrgc
         zTAxAMcO0N8EibosWyJh45pdLbSyhkslEjm3V+eCSBpCf+mMUdI4zLuiSv69JwnKBQm9
         aQkQ==
X-Gm-Message-State: AOJu0Yxi+HMXgAR/63ARmZq3/fU/pFPKXGVv/c17FgUU5G9URjS83ST6
	2tvbAMXLN7euCFai8waPwW+RrVLdTgwm7xVOCNifoAvKhZAzDOxc2rbOz9SQbkca
X-Gm-Gg: ATEYQzyrUPtbry+Ll8B5/GkaGrS1ypjn8fpvKFzE/PVumrdXNkILIfLGZaBgIWoaUn0
	oioqMrmCfcjI05J70YK+SEzjvQI6SpaGnjK875UOFbvh8VCy5AKOa8WpXgYjTvxAvI0SV7DcGkb
	X4KHyfpvZDTI4jpHMRS1v9dJWCFBe0DPWgmBGvg3J+Y/JX/ayzoWY2cWFa/CKw/13wc8teJtFrC
	I4NTpajwe4FLb6MSutjbAbZd3MWdEy2H0vzGFll8748jbGhYGIhIilUHGqnX/YZ8pIPpMwhD6RV
	VWt18mLJ2MW1+F8uTzKy2EghwZLqi4O0NI4hbJtLR3Vc4xvesvUIrE3CxXBuQZ0b2rC/QSId1CW
	UceBHbJOoydv8Hyqa+VQuSHMdSmnqCpEi/ZfjWddb7wBnl/gLQ8TuwL7kdEdFLopjS9pZAZy1DI
	3v/gkSC4jGBw1JkZm0uH4wmZB7s768EutEF8ENMOFONoYYwX4NwRV4/yggygLZ98a+TMjrcano6
	4kqZ+pBT3aYMl+xuA==
X-Received: by 2002:ac2:43d8:0:b0:5a1:4246:4168 with SMTP id 2adb3069b0e04-5a15a4b6c3dmr2815742e87.15.1773573547031;
        Sun, 15 Mar 2026 04:19:07 -0700 (PDT)
Received: from lawki (h-155-4-172-88.A1139.priv.bahnhof.se. [155.4.172.88])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7c014sm26470451fa.44.2026.03.15.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 04:19:05 -0700 (PDT)
From: Loke Forsberg <loke.forsberg@gmail.com>
X-Google-Original-From: Loke Forsberg <Loke.Forsberg@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	khtsai@google.com,
	raubcameo@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Loke Forsberg <Loke.Forsberg@gmail.com>
Subject: [PATCH] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Date: Sun, 15 Mar 2026 12:18:27 +0100
Message-ID: <20260315111827.20205-1-Loke.Forsberg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34820-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,google.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lokeforsberg@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D1F3290795
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace kzalloc(sizeof(*ptr)) with kzalloc_obj(), to improve type safety.

Signed-off-by: Loke Forsberg <Loke.Forsberg@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 14fc7dce6f39..e1e6763293ef 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1456,7 +1456,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 		return -EINVAL;
 
 	if (cdev->use_os_string) {
-		os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
+		os_desc_table = kzalloc_obj(os_desc_table, GFP_KERNEL);
 		if (!os_desc_table)
 			return -ENOMEM;
 	}
@@ -1753,7 +1753,7 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 	struct f_ncm_opts	*opts;
 
 	/* allocate and initialize one new instance */
-	ncm = kzalloc(sizeof(*ncm), GFP_KERNEL);
+	ncm = kzalloc_obj(ncm, GFP_KERNEL);
 	if (!ncm)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.53.0


