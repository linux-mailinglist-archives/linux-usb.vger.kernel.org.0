Return-Path: <linux-usb+bounces-33398-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILVuEZqDk2k46AEAu9opvQ
	(envelope-from <linux-usb+bounces-33398-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 21:52:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3F1478EB
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 21:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F23BA304C965
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 20:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FA3329C5E;
	Mon, 16 Feb 2026 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEn5fVvj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3072DC767
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 20:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274934; cv=none; b=gzvTvscgdrbLvNFW58RHlTIsdQtdpXyamocbpmNSkB7lk7Y79QQs4AUcX3StyxUCaEdH9KyE5fZPhQ+WDAkQui22i9QDVAObUzw0A7ExmLkVDIUzh7bvIIFlAAzeBtWgdc2+HWvxSFv7UX2StX8XVRgC4b7SB+TpW9VB9F6s91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274934; c=relaxed/simple;
	bh=LazXte4Q3n3HwsA/+3rA7QkdyYAivG4VCyKhOfy/PJ0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=HhDmIlxJRS2oXOhA3JvN29/mDO6ukg983ZMu+TKvJDP/7R1DrATB9Dg2ZSf0YSdQVTgH3Gu59rYN5bZDKegcgAp4GKamknz5+5bOD5TvIocYbm/zX35Fsj5aCYMmZmsxnLj1jFid7oHbfyTfMgnQP1LzGYl5Ou1oh2chyv82qns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEn5fVvj; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d195166b2cso2360318a34.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 12:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771274932; x=1771879732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mtky+PkRb/nUBU1TXDE4w2kW45/R3mhufFmOjUKb6g4=;
        b=JEn5fVvjbbD+9WIXGvvCukjVDEwBz4YfV/le9PbzPbVSN1sFY8tCQeRq3Ebl6DcIez
         GR7H3tJjgVmkLn511j+4SkxmdT027qcwazSU30af1UOsDq/PU3JFtnQSGOdF7MtXlKs1
         18LVRdoizeWQJCqMg8yt3B6GhOgNFJCTlvMzungHEIPfNBEIkW9VVV4obwQO3GJglrr7
         MvTmgPTTmL2TIId960oa7XDl1S4D+hOZcvh6VSQ/+W0lTipd+EOobELFb3jHQHrlF6lD
         ONLokS6tWzCtcTNhNZnG8tLnsqYhlqhj9q9nrhflD0JYAoBCArOeIgNS58we9MWq3cjQ
         UIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771274932; x=1771879732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtky+PkRb/nUBU1TXDE4w2kW45/R3mhufFmOjUKb6g4=;
        b=rJPaakKc5rL1y/HjX2sUfZZpTD3NXpq/z1evJdqlOLL2OrXunK+LQo8JcXcldoEQx2
         Y3cogW0qn15BPGPz4jLfyhESZ2ZiyDgSDF3YBQzH/zfnx+oLkyb4gmwnDmWNKiWwUhpO
         EHOY19J/siB1EJNMgzJMiySkuKxsll/m8u+pnFAOYJoIweVp2oJn3JMNiXrIyW92t/C4
         OMGtRX43+3lbuk/VWi27tCuf9Qeh0YK2twP5MTyDj4dcZfZXCASkVJGjLv0rYaQ9bYl/
         jt8hT/ssADrrGBtrzY+eKBXu3CChCnJHMBWJWgmxaqd7xTFOBxNvjZIcr4uL/1x12Cyg
         EwYg==
X-Forwarded-Encrypted: i=1; AJvYcCU9iLfQKgpEiMDoL19Rs667qYOJ0KACZen2vbxm26mRsNeIwDg4rInaMUow9KtvCIorC5AZFbd1DKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydz+8sdB6KvSPN4ttdfu55tnSWTArAlifgo3QAvMh/yfkXGSP3
	i84pZdRFKxe2HFXsRxQoVAsZYUhlZsTWHe8fDesSlJHiX6QSPhJGX/ckofPGKQ==
X-Gm-Gg: AZuq6aL1BD6MuwqlJn1bZC2EGgpQI+6Fldy0MuZB2kmTQWEArgTYLbzlqgTM2CHcSAd
	znsXd6gVOJoLkZD9sEGOpyLxqvkC6t+KoN5bmKDY26CzZ+ZZ07xB0u2ufsJTWJm93U3k5zc2kV8
	a+au3LnTFJQSqUO+dnMzf5cCke4agK1unbIDtKNB4gl+EWpLU4XQ2twmO6UcYdIv3VS/AADB1DV
	+e7/ocrLatrkhxok62f6CfSfLw6OJ0KvPIZx1bRmKj853zIG6lCRxisSd/rCCpLOwRD7Sp/V0Np
	vhxbZ6KjRqjs94VSsi8JaAaYtQJLTrhHZVGkYOEsRaLca/vy/L8RSM2GtZHuQUHQ1unp+Slv/DP
	ItpPkZapWxEwXCHNHD812psObVWB6Z9eo6owCddbOCprClzkUVsSHtZJ18drwrF8fsVT1cYrbLg
	8crQdRpiB14SHoJLoivVrP3rYQeJiM62AaVVsVqEiZmIJV
X-Received: by 2002:a05:6830:2a8c:b0:7ca:c7b0:17eb with SMTP id 46e09a7af769-7d4c300277amr7000372a34.10.1771274931522;
        Mon, 16 Feb 2026 12:48:51 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a754b162sm13348859a34.12.2026.02.16.12.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:48:51 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Chen Yufeng <chenyufeng@iie.ac.cn>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
Date: Mon, 16 Feb 2026 20:48:48 +0000
Message-Id: <20260216204848.10748-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33398-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,iie.ac.cn,linux-iscsi.org,samsung.com,linutronix.de,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiashengjiangcool@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C6A3F1478EB
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


