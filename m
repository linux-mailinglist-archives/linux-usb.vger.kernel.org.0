Return-Path: <linux-usb+bounces-33469-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEnHGoNzlmlqfQIAu9opvQ
	(envelope-from <linux-usb+bounces-33469-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:20:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE4515BB00
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 608AE3056B72
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867E825C6EE;
	Thu, 19 Feb 2026 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjZ04iOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E1022D9E9
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771467505; cv=none; b=iJzO3fAj+EsXKHmZWOGgcm+2nOFBx+Nw+4niC0MasH4hK+ffBjphZ7uMRtXKblWmlYXHrwrOKcZan/fs7oQy6lI0axWp9Cw5LE3V48f+0fbFNI6fRrdBHJJ4iLTZglWKjBmoPL4Ll0/RykumYrzB5gKnLuQvWTwtj1OMgoBe704=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771467505; c=relaxed/simple;
	bh=zBPh7pVBs/+aelEAMVoNdaIJSE5g+dOBuOUGOKVr63k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S6Inwcr8Pql2q17hz5vEwSEeALjmA0xZiPm74zSX32UEbVx5AgAmnE74WYhJKcQ8f52u6PFKSnkEzqhaGiDPOeZwM6JSM0wQ98/HQpOxRNM0UYrRKwVBlUpB68PYW5/vQuLYVd8q9AaxSJJZsbssM4WHcS4/MlMnswQy42/3z+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjZ04iOM; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4638fe85a7eso154538b6e.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 18:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771467503; x=1772072303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtXxCEC+7SXjdXl/ryO2zULVRaIn8cU2u3ECa1xYY94=;
        b=AjZ04iOMQHwW9axbB0PcC1qPIvX08sQxBumu6DpsR3Gg+4DvdR/pafsObHuDAEbWQt
         FUVH3GVy2VhzRxA3Nd+F/jRqptuNMapkcrA1MIX6b8Cp+Ryv2tixR5wZsYR6pRKci77F
         HoJulB46FUI/yIbmdeJFZoSGrGLGbeYZmJDxUrnrwZff9WXdmCCc7j+rogxFyY0qIPin
         w3gOl5nG9fVDmSsy68lbJOHad6dg5I3Hip5KDBoyhmjG98PXjOlaoVf3zen0pI5EnjAt
         bBsSEiKaRY6h7wVCgQm0Ta2CZSMzQn176oGfVh1u9UgpC1JLEZtq2colj+HgrbRVZWQy
         9bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771467503; x=1772072303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NtXxCEC+7SXjdXl/ryO2zULVRaIn8cU2u3ECa1xYY94=;
        b=karTrsdxujvWTQah2Kj3bM6OOHRgcfIoA5NDqeqqKIxiTXnFPF8ANjYjj3QuoRW00M
         4uogoISzOU2J/zMvg/IIWz6QLFyKqYGd4kwGbjb0Z+9bYTTySz6oPIl9bFFUiT2U4JfW
         OKg0FdSI6sYM/eFAK7gQL/AU65r+TrG7b9DS6cSmuscJGYSCFCpliIAUhn5WCvh9qN+E
         XJFsw1sxpv9+KRkp/NRqyGWppfCf0kY95MKKyp8bqyknHcXhsHi9lNEKrsSYBtdq3awC
         nYwUGi6v5ERj1z0kHgePdiOMdSagZ9AlBTdzgIKVAznjaYLLiLOiRlIIWMkj4BLG6J+L
         WBsA==
X-Forwarded-Encrypted: i=1; AJvYcCUhkGpkX+qwV9rALJGknGnjyoCTdZvK0zZZpDzInzmKk9vTb895oO2UtRERDvbKijfF27TQeHOh4Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OsGHNoY3gVJNx5bh3f/HkwEqcIixFONULTuyV44S6RezWy32
	chghf40o2PeBv5hKObGB3f9LbAChMWaMQgRUCCGYt0wWWll6H7F94Jvh4jyXHg==
X-Gm-Gg: AZuq6aIvd/Jf7r6kUUXTJ4PweR0C3vMijHzvJ/tX47lL8UR17AkB8sThoVqEqTmw6W/
	keco9VngP2rYXP+qUBJLWUjo7NQNBnFc3sAGhrwsP4m/IDmCIpn+r84zyi6TTaZaiF/EVLLSHpG
	HmNwUpui0Y/whWmdtQF2zkJEVv2Gz+TLNUk5GjJQt3gB40q0rl4fLmMIyOhk4S7Yu2VITsslVbK
	05HhXTPwrXezboKogBjMLfmvtCzHnZNhi76Ax3AH1C7svSaY8a59fkbeuin4OWxXSbDJUaOOLG4
	ETxaAmWvda+akEvhxCTjFyZLSdoK7fDr6y2Gkurl5Zz63Ku0+hUXrLnM3+yfXsjZI+0TLYDzOWi
	o0+llmSAXfH9ICpGW3MdPjwjSxxdBxZKYvPJ5+v7JUQEu7jalTG4eEVxjMGhBO8cx/YRwUJbB22
	hWvKM1J7q6ILpBXYEyt9B0Fb1mODSAGFFbpdUQDh6Way7y
X-Received: by 2002:a4a:e842:0:b0:676:f8f6:3f67 with SMTP id 006d021491bc7-677696920famr8891781eaf.59.1771467502640;
        Wed, 18 Feb 2026 18:18:22 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6782ac0f181sm10799639eaf.3.2026.02.18.18.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:18:22 -0800 (PST)
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
Subject: [PATCH v2] usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
Date: Thu, 19 Feb 2026 02:18:18 +0000
Message-Id: <20260219021818.15196-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219021310.e5aycj3h5rijq45w@synopsys.com>
References: <20260219021310.e5aycj3h5rijq45w@synopsys.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33469-lists,linux-usb=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	FREEMAIL_CC(0.00)[samsung.com,linutronix.de,iie.ac.cn,linuxfoundation.org,gmail.com,vger.kernel.org,linux-iscsi.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiashengjiangcool@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDE4515BB00
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

v1 -> v2:

1. Update Fixes tag.
2. Add Cc: stable@vger.kernel.org.
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


