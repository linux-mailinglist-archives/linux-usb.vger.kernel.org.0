Return-Path: <linux-usb+bounces-36051-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IHGKN0E1WmczgcAu9opvQ
	(envelope-from <linux-usb+bounces-36051-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 15:21:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F13AEF29
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 15:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2773301D4CC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 13:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A9B3B7759;
	Tue,  7 Apr 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qa3w6dda"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5663B27C3
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568089; cv=none; b=D0hTcZDIfSlMNKUILxn/QotMJPmZBcPznh6nq6qs2Meb8TeR/csGqKx1iWY0NM7+TxC9zHynUyoFbKfo7txMhZIFsi44btAT7iVQsZFARKVUu6Zlrc8II6pJx9Aiia573SZELvP8X3ey/XiAfLcrYUjvDZjXjWWnYPriCPjJAsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568089; c=relaxed/simple;
	bh=DE20BAvooNV2BoQtlA4alkzkoMNw6fW4b357FYaDINI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TZWhreI9G5BVURvgvOaDhh1kUlmT7cEatoSxPyFzBOM9BzcTuLkpKMVnHAwSotwK5AFo0HeTTC7qXM2f/e1kY9UN9wHI9mWoARTSECjcG5x8vCeOp8W/Dqt8XwcHf8k6vi2xi+2EQrKGaolssjqsCsVfLxwJpRDa7eSYTS/QgFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qa3w6dda; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b299b3c739so9768075ad.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775568087; x=1776172887; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulKHK2DHCFTreNncJ1d2wXVh7FLflE80zhsJakoLcR4=;
        b=qa3w6dda+7o2yrcCsfoh2+PBATod4Ok7b4NOEcPQIcTZgZS34DzGNSSpiMwyzmf6TY
         MpH3RHSwNyd3JzmGu/5TMdeAOlrNJOb9HVlEzcAsqzWyqV6CB36G/Z36O/eJkF03JG/L
         uki6mFjhsAd7ri6Deojztg/s0s9buyPTpzbuxGxgXk3cfRD1ZTVusrVPITFQs3zkhw6P
         qAWC1qD55yQqNg0kH5h+ZbxEtD0IZWTMqSge0FrEc4FYM2hFeUGgh7IRNqHypsocLNLj
         gi45mpZV1r64e1k/u9f3hGEU1dbfdzuZUk/YNIK9mJE6TIk9S6y3QJKQiArBOvAmIyLm
         UVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568087; x=1776172887;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulKHK2DHCFTreNncJ1d2wXVh7FLflE80zhsJakoLcR4=;
        b=FXeOYeE9EhD2tMYSEV06+WS1VP26wdy+yHW7vStnX9YrDxTMF33Wud45usy6THVdYy
         LxeC7GWbFBmo2vzkh9C7lWd0fplLdwsllEtgmYCb7swiYQDpgAycHwQ72B94AtbcnveD
         a1VwOVbsWxwCk83gvYo1sErBoiYQSuG0zooE1eIWDFx6Z491yJzQJLBXLPc/th2gk0CO
         I/FwUcm6Va5YLLblBs6+JN860M0TsIaPSMNIipxLPFfGbJPT3uL6OJCvSW09dBmuMSuG
         YjKTuWWwLIViXSMZMj8egEfoF7Am7zyGW98Z6lZ9Fcw4SWJhUQiePr/iTsZghRK/TXsw
         CZMQ==
X-Gm-Message-State: AOJu0YxGo7PGro89Vjaxa0whbuRnneF108UkQA658OKgIy3GIbEbZeJW
	43P+7f3j8Xk9MVw3Pzhb03WbfzmVQtmw+6YVrHb2Py6tGbjKPd8M8MKg
X-Gm-Gg: AeBDietnyVn2iciGJupc26G2tx2VOa3Ci803hQRiMawGeQzNphkLSl2tJrip0fbEwWU
	9K7YL3zmSodYvOV3diokO0ktAZiV4flIRq1ismpZ8YGVyFsek8A3KS7HLEJcFOBkTFgeb0Eb3t+
	se32sW97FDHNdnLuF2Aa+O4umPLCTGe49I0f2lCHF/m8lkH3eQY4gUpNR114eyJet1ay51/Zpk8
	HwUYuulyL67JCj2B6cd7e0AzoEyNBBgW3OoXhhIwkQMRIAX+D1IDvtH0j5G3vBdr9IO4xOjQ0B7
	n+a+3UJAbQHLLPYN0pVqYiQGCDa//jtlwdU7yiV484vXj0YIP/woqZyyW28PVTDlxdEEoOOG65P
	5IoFo5T4r4lAFr7J7JqXwaWaaJ+PfYNGF4Qed1mhT4GoLa+Ok3onTmaT63OmkDUA61uxZNF9Std
	Gy8kOfmUVKsqtPZFDtywGKqldcRnCHsUbep503P9HP62I8YTR4tyeAc4xBFtYoonTbW+x+5FjjZ
	+4WsmjSn3ccm3wlgVzzIgNdCaK/7VI=
X-Received: by 2002:a17:903:22c5:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b2a6a2ca50mr60971165ad.13.1775568086773;
        Tue, 07 Apr 2026 06:21:26 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d098sm164630485ad.13.2026.04.07.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:21:26 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 07 Apr 2026 21:21:22 +0800
Subject: [PATCH] usb: ulpi: fix memory leak on ulpi_register() error paths
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ulpi-v1-1-f3fafe53f7b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIANEE1WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNz3dKcgkxdI9MUEwtTy2QDS1MTJaDSgqLUtMwKsDHRsbW1ADrB+Nd
 WAAAA
X-Change-ID: 20260407-ulpi-25d4859c0954
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775568084; l=1322;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=DE20BAvooNV2BoQtlA4alkzkoMNw6fW4b357FYaDINI=;
 b=8mdk+ZMn8/jx+cjC2+Zdhm2C5o+kLruNKyU8pYuN3LT3T821i9glx3h0F/L9czj/60cY7Cdyy
 qlb4HGVecpnBexc8icBCDBWdAIlENkzXKfs/+nxQrmdVPPeD78BYpQL
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36051-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 338F13AEF29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 01af542392b5 ("usb: ulpi: fix double free in
ulpi_register_interface() error path") removed kfree(ulpi) from
ulpi_register_interface() to fix a double-free when device_register()
fails.

But when ulpi_of_register() or ulpi_read_id() fail before
device_register() is called, the ulpi allocation is leaked.

Add kfree(ulpi) on both error paths to properly clean up the allocation.

Fixes: 01af542392b5 ("usb: ulpi: fix double free in ulpi_register_interface() error path")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/common/ulpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index b34fb65813c4..9b69148128e5 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -286,12 +286,15 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
 	ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));
 
 	ret = ulpi_of_register(ulpi);
-	if (ret)
+	if (ret) {
+		kfree(ulpi);
 		return ret;
+	}
 
 	ret = ulpi_read_id(ulpi);
 	if (ret) {
 		of_node_put(ulpi->dev.of_node);
+		kfree(ulpi);
 		return ret;
 	}
 

---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260407-ulpi-25d4859c0954

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


