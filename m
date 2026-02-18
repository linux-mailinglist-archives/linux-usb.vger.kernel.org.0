Return-Path: <linux-usb+bounces-33452-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD2wHLgzlmktcAIAu9opvQ
	(envelope-from <linux-usb+bounces-33452-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:48:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E317C15A65B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1B513055105
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E717E3161AE;
	Wed, 18 Feb 2026 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZGuO+rp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6D2BD01B
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451202; cv=none; b=W8rDurq1SPIvYrzj4eTQYhqTcla2Eu9GBVv0mMzLxPkrm6M8BB76Hwnukp4w1KweygizQpR0M8d8Vs42rKFuBdAIDl/r75rTDhsqfbBHImFv+9gxcErfK6O4jtx6AVz11C7AyF36xHJJyZpns4PlImIiaNsvNpaff116yPwbEh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451202; c=relaxed/simple;
	bh=PXBdVbN41MShNidxvFBziUc2dR7KAi0w2vzpjdT0D4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DiGBMd5+Ct/a0pSHzmfFZPbNEhRQ/uziQjQZTmr+l5uFMfz8TNKrILRyHe1r9xuDA6bdtxlGmDmB5ao+esnFHbL3z9rC9bRitKYpmjN1BFO7OAO+0cCZu/BSlK7jB8dORdIVgu3ZnKqN8jHljoPc+hnh34tEUP/oZ931pVXRL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZGuO+rp; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-793fdbb8d3aso2430287b3.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 13:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771451200; x=1772056000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTi8/gZFcbbN4HKkCmQok1Zxz6f/OdLOw5fiqjVka8U=;
        b=bZGuO+rpkaHIipTZPhsC9ou0jCyfeZh8qF0FdV6arHg454VSC+Mas1ObSVJt58+tKU
         fdSh40vt9tAkZZQ2T5Fi+U/0FBvOsFQbusTbttKj4y/SeiXF3AdxnzWPIDn04HNTa05B
         MOCdZV1SVWTamOlMLiKEGlVIlB6eFvOQgDbErYde61d4S5JneyUJvbuEq9BuV14i5OMG
         CJLK2r1xcKHQWHH/AAQW+iML9hs+PiQMCNYciOZOmJGo1+T01Au57kNHcnCSoaeJdKi3
         xn/VC6D4YgcrZ+XLGHsGD5K7oJn34GlHDFVCG4qwViM022cjPk4CG23k+tzb7sTFs3XN
         I9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771451200; x=1772056000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTi8/gZFcbbN4HKkCmQok1Zxz6f/OdLOw5fiqjVka8U=;
        b=fHP+4x2L7ITCqn0eVtb/KB9XCpdqNAVnSwU5jmujjr0JtX1SyGmkbEuQhbHI7zVQpb
         Zu3X05lxh2rjb0xe4Xcgg0iZBUK/2WYSTa19fRYfzrcuEZQQAW5RFswBRZ5VomCPgMye
         3h58fq7OnyAPUl7JSg8AAiQGG3T8gf4FLKOKHZeIfHCK7Gnrbn0pesh8FdjrLsbkQpZY
         jiS83wkCbOm5pJjGzBi6F31R+f08dcPWZpPf7OoSR0k9x8+jFp6+6qxUYwH3q3qyQe3J
         m9b13OGkoLsVOFr9/yXpmHM/9qu8PIhRRugPqJ2yedvbWuNlLL8nBIWzQcdBrCkgSN5S
         8/YA==
X-Forwarded-Encrypted: i=1; AJvYcCUoH6kQrbg0xmuREK8IMS3xuuUEp00yfoY0mILCrbYep1kIvXmKLdBlyIghaEWsMMx+ZMbD0qGFgfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+0OTm60qWYLv//QqPpKvCrPkHmmy/zPyB4nPh5sNMcCKwI46
	mfRXMCR5oU4WU2ddCO0fUABj4qjyatU62t4O40yLroKxyKkbYeDF+AZbTctdvmeiaVg=
X-Gm-Gg: AZuq6aKku9byvssoq2obThAuZyW9CbBbiyozT2aMxjWhGakmGtxYLB1fVzyy86PQ8bi
	yfqRDJvoN3Z44FXaiIZngBXzGunuSODDjPkcPYnBMesGoreFkJgqNLII4Ogw2RFYRFALY08S5Ux
	fSpEmjVeRDy5NKiNTzTq2LMTNKMa+/de4VnJfVmsQ1RFWhMd5yS1lSRlEu9uugU//IaVNKRowZU
	UI++mwhVUdm1oGcuiOolEkipgtiOsqoMpXgErYhfvd8+oRvmk5OBsh9wkQdWtl/YWJBReTlKw5l
	VATVE/D/g29OLi8Ls+FFHMfsO1Gp/efm8FGzZNkSa/TefXKwQvMViPAyZePUpQ5bvT18tPYctk3
	VP2rqFAWFn840OeQYO+nLQ/1Ljl6z/0ihgVdp5B2aIu8Y94nSNmjGz+jqMv8X36r+tda4YG4caU
	YuAI1BsXeic2pcZ/ZgPxsQXH1/Qnl4WVXqvE0enx4/vHr/JDk8wLdGsDSAgLPP0HK4OUtjRrKPa
	APVLpfR0nH2E7BVNCdMxRgn5zgzOqDMxX5UUGLNb6A=
X-Received: by 2002:a05:690c:660c:b0:797:d006:404 with SMTP id 00721157ae682-797d0060a30mr102058627b3.43.1771451200361;
        Wed, 18 Feb 2026 13:46:40 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16e7b0sm126745157b3.4.2026.02.18.13.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:46:40 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: sven@kernel.org,
	neal@gompa.dev,
	marcan@marcan.st,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] usb: typec: Fix error pointer dereference
Date: Wed, 18 Feb 2026 15:46:21 -0600
Message-ID: <20260218214621.38154-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gompa.dev,marcan.st,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33452-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E317C15A65B
X-Rspamd-Action: no action

The variable tps->partner is checked for an error pointer and then if it
is, it sends an error message but does not return and then immediately
dereferenced a few lines below:

tps->partner = typec_register_partner(tps->port, &desc);
if (IS_ERR(tps->partner))
	dev_warn(tps->dev, "%s: failed to register partnet\n", __func__);

if (desc.identity) {
	typec_partner_set_identity(tps->partner);
	cd321x->cur_partner_identity = st.partner_identity;
}

Add early return and fix spelling mistake in error message.

Detected by Smatch:
drivers/usb/typec/tipd/core.c:827 cd321x_update_work() error:
'tps->partner' dereferencing possible ERR_PTR()

Fixes: 82432bbfb9e83 ("usb: typec: tipd: Handle mode transitions for CD321x")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/usb/typec/tipd/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index e2b26af2b84a..43faec794b95 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -820,8 +820,10 @@ static void cd321x_update_work(struct work_struct *work)
 			desc.identity = &st.partner_identity;
 
 		tps->partner = typec_register_partner(tps->port, &desc);
-		if (IS_ERR(tps->partner))
-			dev_warn(tps->dev, "%s: failed to register partnet\n", __func__);
+		if (IS_ERR(tps->partner)) {
+			dev_warn(tps->dev, "%s: failed to register partner\n", __func__);
+			return;
+		}
 
 		if (desc.identity) {
 			typec_partner_set_identity(tps->partner);
-- 
2.53.0


