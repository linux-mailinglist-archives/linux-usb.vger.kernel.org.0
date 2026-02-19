Return-Path: <linux-usb+bounces-33470-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NNvGLV3lmnMfwIAu9opvQ
	(envelope-from <linux-usb+bounces-33470-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:38:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B466B15BC07
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4DC030089AE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C6D275B03;
	Thu, 19 Feb 2026 02:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/FhfKsp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A125393E
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771468721; cv=none; b=YBSsQfOq/eDzopZj3lm73rM6U2qsynCN8JuzIFNYEFovRjoNHxWkaB5+fAXLdU6sVJVtprHFxiuTAJM10PHMcBOvTihcWIkgbzflte/5rxi0OUJ4ETLZ+5qc9+N3jO2kJppnvKNX33u0d5yBBGt1vpuKAvqpGpjoOilS4l1M3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771468721; c=relaxed/simple;
	bh=UsuudlMVw9TdWP0KxRZPMcXmh6yiz2Nuu2hTtp6LbDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tKO/olyYxKh9M9QVKkeypbr/uamqagl4gN3xx7aCG1QT2L1ltHqf+N/rlvrIIQ2rQ6L+Uw5euCCfKJVruQofyTxdAhYXqH5DCfpm7AS8vxxVkDBbf9ZFCexvHWbZ9WE+6tk9XvHqpFIlfVHp839f3zNyboFyqGoNO2DuoJMFOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/FhfKsp; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-463b3697846so973045b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 18:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771468718; x=1772073518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOasyN1a2WZJAy9nJuEJoljjWUcMt5PcJQs4Ux5sSOs=;
        b=l/FhfKspInbF0xeisIYLB8z6efVYl/Q9QV3jVNeouGq1yXzGq0lxBAP+dSE6HBymHg
         i7iTqYLZ9ES6Opl8F5KST0FBP7A5lfQY9cL1XCV94S4g8TrBiN9PHtC7Gi7vVForSVQ3
         RW47MA5gTvRo9aOxhwRNgIFAyixHl2l0ngwrlQ5fLMRX7XnQJwoGJ3VA4iBTEfz1Fox3
         KjAB+qPPiN4ZxrA3u2n+RLu8AEKWdFRgGSz0Xvm/p/af2v7jAavvCKVEZDhxfeSzR91U
         /TxytrILKI5OXgi+4dEqJCnUinfTVEgzKa/xhng952o7nzn6UOqemWltEM9RVQWL1nUZ
         NTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771468718; x=1772073518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOasyN1a2WZJAy9nJuEJoljjWUcMt5PcJQs4Ux5sSOs=;
        b=F7MyUUrPrNxZI5yVSbP7rA0gJ5xqUZLXAvmEwI8WbKaPAPa/Lm/Rqehiz2F9ZBwRS7
         mt/8D0H9u+Yq51CH1TmYQSdOqCA0CPlg6FUJB+JGC1lyoGnjOsnPUJisf1Py07y4+9od
         Zl6ZlmHydSUvP1MO/PIKNcnjyKOgWUR+N/fKwXInhkytkOL/Od+WMW0RfLgQrmW+5VaM
         EabiWu9oqsJ3/TUn1sDGPod6J3nfIF6qP8bqW3PtPqaSATex5kHwMkDIhxLTIcKvxQGp
         HSG6o9QIA++79tSHfMRZ+hbLdn1jFK3N/yq3ezckwenSHzl8D7QwSFAYXxK3wJKoHqSu
         OH3w==
X-Forwarded-Encrypted: i=1; AJvYcCUQsXcTYKWO2jIpNBEdQzmehK/Hywra55tesx+Gwk4l+mBXkiES+9nH4Xq7a3gXoWHNx/ZyJc3per8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZUdxb2+glNDno7jke8pVZvf5mj/nb5mpgo63gRjF4SWlJHB9w
	1i/832fvVW00rWK68IyS0M7cUhlGBAJKDViDyBXOOyXP2MnRVCZRcxlY
X-Gm-Gg: AZuq6aJX9opnptxw4AR3IWm4XfsGEy0yhxxXh4AUut46ecVx3E/SBwlagCHa4TNoJPU
	iJKnwuVBXeHbIOwfjnnNxxStqwdUAOENDTWktlIkPnugyPY0scc1uVqrGm6ZmGb/q5KX7N7vkO8
	lBJR9Et6mHkdF62S6BLqbbFeo9yNKE41Suf/7v1nUlq6Jahmgp0UNveMYV+7rj/l5JHBS2jxGtD
	D1Zf9mHI6kzSWqllyodt0UsnXY3AbnDrJZhVCrMzOMR2rMvzDnFhtoraNsJezpSkwsxqWvZr8Nu
	9ewyPSeS7PBzU36qZMes+xz0NGSwZ+cwTvI1QewkAsdP0SkQnfBcObiYHiuu5bei/4nnEgIeske
	HNlygzCjVTKHZ7nJNQSd0vIt6WMx8Wk+2U57qf7wKxIGdMe0/IC1w4KymHSvK4k4CvBQpkDiGuu
	ClQGXCwC7EnRAUKpGlWlGKcXwMKj9PqmAP8ZCrxnU23bvT
X-Received: by 2002:a05:6808:1a24:b0:45f:1f4:f522 with SMTP id 5614622812f47-46427b55320mr154127b6e.25.1771468718356;
        Wed, 18 Feb 2026 18:38:38 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-463ee1f67f7sm5985918b6e.12.2026.02.18.18.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:38:37 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: thinh.nguyen@synopsys.com
Cc: andrzej.p@samsung.com,
	bigeasy@linutronix.de,
	chenyufeng@iie.ac.cn,
	gregkh@linuxfoundation.org,
	jiashengjiangcool@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	nab@linux-iscsi.org,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
Date: Thu, 19 Feb 2026 02:38:34 +0000
Message-Id: <20260219023834.17976-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219021757.eeq35yd7jumpk42n@synopsys.com>
References: <20260219021757.eeq35yd7jumpk42n@synopsys.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33470-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,linutronix.de,iie.ac.cn,linuxfoundation.org,gmail.com,vger.kernel.org,linux-iscsi.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiashengjiangcool@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B466B15BC07
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

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Use dev_err.

v1 -> v2:

1. Update Fixes tag.
2. Add Cc: stable@vger.kernel.org.
---
 drivers/usb/gadget/function/f_tcm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 6e8804f04baa..7b27f8082ace 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1222,6 +1222,13 @@ static void usbg_submit_cmd(struct usbg_cmd *cmd)
 	se_cmd = &cmd->se_cmd;
 	tpg = cmd->fu->tpg;
 	tv_nexus = tpg->tpg_nexus;
+	if (!tv_nexus) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		dev_err(&gadget->dev, "Missing nexus, ignoring command\n");
+		return;
+	}
+
 	dir = get_cmd_dir(cmd->cmd_buf);
 	if (dir < 0)
 		goto out;
@@ -1482,6 +1489,13 @@ static void bot_cmd_work(struct work_struct *work)
 	se_cmd = &cmd->se_cmd;
 	tpg = cmd->fu->tpg;
 	tv_nexus = tpg->tpg_nexus;
+	if (!tv_nexus) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		dev_err(&gadget->dev, "Missing nexus, ignoring command\n");
+		return;
+	}
+
 	dir = get_cmd_dir(cmd->cmd_buf);
 	if (dir < 0)
 		goto out;
-- 
2.25.1


