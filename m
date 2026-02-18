Return-Path: <linux-usb+bounces-33436-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCydHj6clWmsSgIAu9opvQ
	(envelope-from <linux-usb+bounces-33436-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 12:02:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A74155C4D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 12:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A7433041165
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8507A308F26;
	Wed, 18 Feb 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWRPPPEW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149773054EF
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412514; cv=none; b=aF7uogZf3ni79fn5qVWzLJ+ghPYuntJ2i641sCHvlsbrkW37JLPRQsIwJLq44rS5A7wyIvQaH7DkRQm49VoOwuKIvWDYnm/zPQWEq3FSQDtHicBAqk+TXyc9NK8ld4ejwhC0MkSL72/c95cKQ8bgluxKNn3JrWjki0SfRtv2rHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412514; c=relaxed/simple;
	bh=mtJ7tmHpf4O0rAYDjo0ur8EJ65nUAAHFMbS0duMHe3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ujzvi1Kafb80Ef3QhsiWgd8Q9sw/CTpkdYhcyvXNV0kriWOI1N7v/eaZCVy0kh2/DSnZAH/h9SH8EbMWGguTCXhOc7Co+18uiFq1TJvSjf42qdXY7bNcX1Qyg8MNHftLrevDyn/2xjcwY2+F0qHt5q/SjUlBwEfbzTcjGPc2kig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWRPPPEW; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8230c33f477so2464973b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771412512; x=1772017312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEh2x9C41ySCmS9IgH4my6kPFolL4MAILeh/ncPke2I=;
        b=DWRPPPEWOb6paBL3I2g9Z6WqYHMdoyehrfoFzYajLBSEHerwYRxi11ImGpCv9Of98c
         uqpruC9BMTf7DAEkAqZu5VwgdYNcXxbyvcqRWaPqOav805BfROlqs6bgUfHYX73ZytX0
         +jnSeT6mtxHAhXgb4MYVj30tV2ZcTfyt200n1mCk2NpGHsUq/yXWsonksw7jSn4jnfU2
         SwnMixsbyzHoRBKnvI1o1h1QcqnMbeZKLihGbkg5Y7OD/VlEz05br30yJjYOI2agDjxs
         NcTK6uK4JmUmt8QQsfpV3Yu1xV+29SoTzlyAtlzXFTV+zR7U7DrTmasxDQaDOlJU7V12
         hWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771412512; x=1772017312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEh2x9C41ySCmS9IgH4my6kPFolL4MAILeh/ncPke2I=;
        b=dRZ+nEXNyuYxAsjdVkwnA3KXscK5Df0KNm104lLj2wmbBlONqOpRYZU9VE1aUPwhfE
         QX5hsRL5aNJF+Zl9DE5RTdfvL7RKkcJQMcQn50QESnKRXT6kX+LcIE1CtLFpPKiN6/w6
         UPHTFCrpatIUkE0y0tAhjDEu7HL71us7XUZKbzv80uLv45bqLrK1oHHPgnVtCV07LvNo
         uQvZ2AQWwE0OF1vDMiMtlRJZlzAUOpbHCrqju8FpHFDkJ4MN6lPx3Xd67Wc8PdNFdTUS
         TbcpVjdsqU5iL0XIvr0aziqXX9AF+68xfVF5bYQJzpkuF7NowPGkLzAqn08vJvW7y0P/
         lMPA==
X-Gm-Message-State: AOJu0Yy2brVTl5SnhR2gidMedjmB0JRmxbaS299QvdzvZo5NkFtk2Qoz
	1ctHYintTs4z7JftB8KoewNY6U0i80dPs9mtAXt9gcQmNcJFP+eCM3bf
X-Gm-Gg: AZuq6aJoRtKSifc0CqYpdD3FeSwDZtNC1QrLoNtH764tp9NcBWcJ3rZOprsPI4uclrz
	4xGdX8JKrOydH/sUjbBdPy5Lxy390kcRZQIeEuay01EeoJFio7gDs6K8cdcCe1ViPbRByd2NGZM
	4r8KtQ1uAWBfMvwHd2vZLvKBrMv+4hHteKgb46E7uDehn629kQ83dmcAC6ByLoA7HqhD7q9Ln22
	MP4VgOjnr4A4xy6WmeAwqdJ+usKbHPqErC5EZauzU0MsCQJjRWATUFBHBVZZGwYXfkEEgM4+/Xs
	Qy4qTwHsTZySGLt6R2b76mIoRkdOItAZM0SyDyTsn9VuMCrKBnYcuZ+6x1S45oqUAkhLqCcpxRv
	WxSKvBgJDMa76zS0XJKo/Q+hxTwb6qZhxb48nW0iJF246uGnueTNZn+v1vPNhFqoV9kE/fV+j3t
	RWtux6vJMFROQrSel0oxactNFVEiSGiQCAT3eTeDCe8Sr6YQv936TZNSPqbi6dUgsx4oM8
X-Received: by 2002:a05:6a00:1590:b0:7fb:cf05:93cb with SMTP id d2e1a72fcca58-82527460066mr1139313b3a.1.1771412511875;
        Wed, 18 Feb 2026 03:01:51 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2c4e5sm16582293b3a.4.2026.02.18.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:01:51 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Wed, 18 Feb 2026 16:01:21 +0500
Message-ID: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33436-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5A74155C4D
X-Rspamd-Action: no action

The platform_get_irq_byname_optional() function returns a non-zero
IRQ number on success and a negative error code on failure. It
never returns zero.

The current implementation checks for a return value less than or
equal to zero. Since zero is not a valid return value, simplify
the check to only look for negative error codes.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom-legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
index d3fad0fcfdac..34c578309802 100644
--- a/drivers/usb/dwc3/dwc3-qcom-legacy.c
+++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
@@ -620,14 +620,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	int irq;
 
 	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
-	if (irq <= 0)
+	if (irq < 0)
 		return 1;
 
 	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
 		sprintf(irq_name, "dp_hs_phy_%d", port_num);
 
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq <= 0)
+		if (irq < 0)
 			return port_num - 1;
 	}
 
-- 
2.43.0


