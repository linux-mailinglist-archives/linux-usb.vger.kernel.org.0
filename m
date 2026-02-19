Return-Path: <linux-usb+bounces-33461-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMkdEn9rlmkqfAIAu9opvQ
	(envelope-from <linux-usb+bounces-33461-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:46:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915715B6CA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 863B0303BB2A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 01:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884C525524C;
	Thu, 19 Feb 2026 01:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3yAfx/o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A013B58A
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 01:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771465501; cv=none; b=k7IEMUGhiO3QZHLKWVk0JuzFhKQFlkX7XbUqUbVkiOq7yEFyu3T+XjfgXKKSAG7EMRyowllrqWLo0F7P0515mySMqcJRQ/1PJ3LibrKavGcRgT0BbgvpR567gx88P7o/xQtvjwG2sGq5hBNNRK7dMu1gIzmASLMeogAl3mARyO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771465501; c=relaxed/simple;
	bh=LazXte4Q3n3HwsA/+3rA7QkdyYAivG4VCyKhOfy/PJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nc+t3hrjLPzPyznLBsxxjSdj4JCVij8UKTQ1XTsDcRIGA3zCF8ZXZSFaz8tTd4SyMBsI2dzBZarhK4czHRBlxYWCIPR7CxMBcnbITb7lIsKYSKc3iP74gAl0+lHfgU1/aLaMGsqrhW7VXMtG28op49pgAyB9n7b+K2TPkwoKHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3yAfx/o; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40974bf7781so1117032fac.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 17:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771465499; x=1772070299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtky+PkRb/nUBU1TXDE4w2kW45/R3mhufFmOjUKb6g4=;
        b=N3yAfx/oUcETneBBg0pobSZBg1ZuQTTBI5ZvpTq8gjS8aWCSuZd/CD2pfQpq1TYJvH
         E77OY5dQFN78NeIsK0uOdFCNKEyix3WsL8t9KvrY3JMvW6TMnTbClpf/QJcVqpwK6Arg
         qrREi/5LpSw2xOd4Oe41NHtMSw3IkdAqpA1gmHpIjruesttf+hH4zKbKGr7uI9hAlpwT
         u1ERzeI8Yu0xtHOvPPHo2kUSpFl39FqrPYl4qMNw/PlyYo9kbR0n81PkgGALq8lDvX1v
         43V9hwk0mW8CCdZY4gOTwxZfYiQat91Y3NraXSxlA0SymaEBuGQt6MV66bRgpGecDk+Y
         RJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771465499; x=1772070299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mtky+PkRb/nUBU1TXDE4w2kW45/R3mhufFmOjUKb6g4=;
        b=swvhnqyJrlZoWtG7NqFBcRMNLFgcIp116E7hMJ+DsriCFOSiayKVXtwdxRFXZl3dXk
         hrLeMk4lUpi8JdxyW1njIwws8vB2mV92YiOo1x0Y7gZb8vjbjXf1fgxv/4kLyO4VWUvq
         VCsVkkWW/JS3UGubJF7aPTBaJDFOY+DMDq9BlTU0WDDuuVoQWTuO9PXhpqFvwZ4U9ioW
         olURX3wtdpYMgvkcpI7RZenBaUATr981Miz8zJPMmMY3cLY/wcZVqC/X796vwielXqua
         r6kbEnXIzl+2ym3S9CXuomHKpqszqPKKo+MT8zqzruKsc0edLsPHrczyNJ8Bav4yBmPW
         QsEg==
X-Forwarded-Encrypted: i=1; AJvYcCU105mW5G0OCRGsq9sRBzFQMFlZq4+WVh711uk7eKNJksEKiWxHVo4Xx3eVbt1iGhQ5ReGgxDsIopo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9rkrIZhj3JNbfnCG7LPllDckA8l2rLVJ+9er3WE+f2Wz3pRq
	8Z26W4WFKAMZY/TFC+r0jQIP1SjjOy0mUtc4JJ8NhLhTbz5ZleCGPga8
X-Gm-Gg: AZuq6aKJX3BgpycMhGl4LKdxh8gdTvn+y/YM2d/KS0QE1hOeouFp697xN1b4RpvmrZF
	uA0egrahiCQbyppP0EjoeuXaMh+kILH7OBpFE/MRaSOjIPtfyi/9mUWx0PqB4Jt4DJQa/loCSgK
	GCHy7AQVpKIbyM+TctHno9kQOQOmYZGEywZ/AzkjIrFXeUmWdNDb+aqgv4OQleK/5sBRQ1yjONC
	/LGOUqXPfy0GjmYS5/8PsndP6laTyi8Sr9xKqieuDpV+Avm0vkTQhoyBPj3sLNd0KI52FpdSXhS
	lVHXEpYsrDp/V5O28mRoKPvG/9fS/S90FH6Y4EbJc2Q8OOAiIusOHKqKwtWGm6wm35V0eZ1KEKo
	N6vQ7hhreY2Esv21JxqktKY2H4//Gid+96T7HRuMowIUqYkaF3GOrbpXVFHdPkNZKeZ+MqCvCUw
	ZRlFUqjiypz5SjqysOq6AuWIPmnyH0EWaiN3b7/JqqUivTOZ9AQshILgI=
X-Received: by 2002:a05:6820:1988:b0:677:f82a:6258 with SMTP id 006d021491bc7-679b0e0af3emr162038eaf.14.1771465498906;
        Wed, 18 Feb 2026 17:44:58 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67985df6ffcsm8851958eaf.4.2026.02.18.17.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 17:44:58 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: thinh.nguyen@synopsys.com
Cc: andrzej.p@samsung.com,
	bigeasy@linutronix.de,
	chenyufeng@iie.ac.cn,
	gregkh@linuxfoundation.org,
	jiashengjiangcool@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	nab@linux-iscsi.org
Subject: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
Date: Thu, 19 Feb 2026 01:44:55 +0000
Message-Id: <20260219014455.14351-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
References: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33461-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,linutronix.de,iie.ac.cn,linuxfoundation.org,gmail.com,vger.kernel.org,linux-iscsi.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiashengjiangcool@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8915715B6CA
X-Rspamd-Action: no action

The `tpg->tpg_nexus` pointer in the USB Target driver is dynamically
managed and tied to userspace configuration via ConfigFS. It can be
NULL if the USB host sends requests before the nexus is fully
established or immediately after it is dropped.

Currently, functions like `bot_submit_command()` and the data
transfer paths retrieve `tv_nexus = tpg->tpg_nexus` and immediately
dereference `tv_nexus->tvn_se_sess` without any validation. If a
malicious or misconfigured USB host sends a BOT (Bulk-Only Transport)
command during this race window, it triggers a NULL pointer
dereference, leading to a kernel panic (local DoS).

This exposes an inconsistent API usage within the module, as peer
functions like `usbg_submit_command()` and `bot_send_bad_response()`
correctly implement a NULL check for `tv_nexus` before proceeding.

Fix this by bringing consistency to the nexus handling. Add the
missing `if (!tv_nexus)` checks to the vulnerable BOT command and
request processing paths, aborting the command gracefully with an
error instead of crashing the system.

Fixes: 08a1cb0f65fd ("usb: gadget: tcm: factor out f_tcm")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/usb/gadget/function/f_tcm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 6e8804f04baa..9554ddd9b4b8 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1222,6 +1222,11 @@ static void usbg_submit_cmd(struct usbg_cmd *cmd)
 	se_cmd = &cmd->se_cmd;
 	tpg = cmd->fu->tpg;
 	tv_nexus = tpg->tpg_nexus;
+	if (!tv_nexus) {
+		pr_err("Missing nexus, ignoring command\n");
+		return;
+	}
+
 	dir = get_cmd_dir(cmd->cmd_buf);
 	if (dir < 0)
 		goto out;
@@ -1482,6 +1487,11 @@ static void bot_cmd_work(struct work_struct *work)
 	se_cmd = &cmd->se_cmd;
 	tpg = cmd->fu->tpg;
 	tv_nexus = tpg->tpg_nexus;
+	if (!tv_nexus) {
+		pr_err("Missing nexus, ignoring command\n");
+		return;
+	}
+
 	dir = get_cmd_dir(cmd->cmd_buf);
 	if (dir < 0)
 		goto out;
-- 
2.25.1


