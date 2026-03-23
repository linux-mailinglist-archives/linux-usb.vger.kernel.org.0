Return-Path: <linux-usb+bounces-35337-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCvDNXVMwWlbSAQAu9opvQ
	(envelope-from <linux-usb+bounces-35337-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 15:21:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE62F447D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 15:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5829630E8528
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 14:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FAE3B7B69;
	Mon, 23 Mar 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1xGzdxl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96943B27FF
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274585; cv=none; b=EC6zuPouAE/oaxsU0QnUtY3Kd272w9CoVv+Dj4U8uwtf0KB1smlkDwrny7ZQs1ySf/jOVTSi/93EuGzXiDsUJfisAQC+AuRXp65n4gOx7z+fzHVfSWMaTzaGpkrzT9XFNAL4lBTc9GFByvC92/VKxb6zENAaZGURu4vbZzDtbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274585; c=relaxed/simple;
	bh=74nU+p4AvwjOMMyaJKS8cH28y3pbGWscg6d7b4xTKtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3UkWfl5uB6hiMoMRF8lHQvqfmV8giREDe5vpLURT/C8/XpqNVLaC2EuZJWHWRIwbJNE0a7dv7FqcAoZg4z3I4oneNE1t3Bifnd5mF2jZL8qDOVHrffSC3yEMqVCfONhul9sGfiTgtOFIBXhYGGSWmDXeGGPE4YKokm4VQiO9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1xGzdxl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2943763f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774274582; x=1774879382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP2z4EeTIErAA0SCjA9USYIYpOzE49JnT+Yi7rCFLbY=;
        b=k1xGzdxluxr1LoG8GVK1bTURerq8V+XXte5dhkp8eZ5eoIJlI1zbNfeKeveSKTuS39
         5nWgwrj5gtvtdP6W9TKk9NyA/Sc/3ytTD0VmRWWgDmqE1A0sJl/KfeJV6RTwypepH0Wn
         4jnwLzJS8b9SwT8gYEXTnslmrXakYNOBen9LHI4TgrB4VSyknXty6jFshpQC3TFWSiMk
         Q+P6o1c+3XZsi0PXRzqOoxZKaahyZl+FEPI1jleuehk8xVH11Z5sJEpnmWaMdeG8spDA
         UTRAuhpQWd0B3QwlVlJwylmDZkqjNhI2JPZkF5ud64cBzcboVvUXMWinQO4aTMjhGS6m
         ZG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274582; x=1774879382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XP2z4EeTIErAA0SCjA9USYIYpOzE49JnT+Yi7rCFLbY=;
        b=FeqaTDsoBFRNHA5zH0G7MQapoRDSlGanWyTdqjnHC6te480pAs03X5MUVno32OuTJ7
         ZLZobyFSqjtCeWCWR87Q3XGMGZbM5V4Or2nA7EWCh74Ddv2hbuZOHWLYXbH90sVHxm6b
         3kGi/89xxWa/WLsKMdqw/rZkAKcIsGHCmfRqKpsyTDrFwj7DMhgDIRB9/rdI2doSn/ei
         UDSivB/LCkgleMW+fzA8OVJEbJIQVNKI+uohmQj495FH+jRrFyh/oN8LXZoG9bZmxHwR
         DoPBJmDWR48DluuacptqtJ7UnoQh0is/Wkb61RYBe2xxod2KXGk99xvWaRYvPkqYmL1Q
         uTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTz9wLGJviTqLJza3ftVd3mCbu7v20Y34OABiiNiVmoUKCvdGXsS00jcjSmGVVXMJNDuVnjfnXnQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhHM1pc5o2MQdw+NeIfB0QZpanzPTlPx2oJQRiDN4rp/7FdwA
	mivJLakVHhsAF7UwUyM7aHzbnVlOG6G2eze1kkWweCTLWpVEbcrfrlBP
X-Gm-Gg: ATEYQzyDZAbGTI0X6EGoXYhO6vBf8YIXJRCANwTw4Hkq2aRL/SuCWjsnkJaR7f3+m6m
	qUNb8HFQnEiKq1u9pdEO5q7WOp7DYveP3jDaGkDplSbQm950R2VUgf90zzcB92vgZKvCMyUn2fa
	sfE/634H2BOsXEDuhkFQon1PPsV2W/hgjo4EcUAEcoXBX3rFejeBFkk2oIyXd+bpcKgPmwTBuXb
	OzMXiXO2M+mGpOJxh7vMtz+yMYO9tgUcspsr30PO2L9pzKGqgqCMK2Zovid3gyZKLz9QciZ8CgA
	YKxb5LiS0u+72m0TLpfKoW8kRDHr3xdPE7DmbtKoH/a4LbAmVPO8ES1Qkd4A9UgiSdoZJ5Z4xKY
	abScTtT1PORrGZ2HHvjUveznsi70fLEA+AgV0lnTM3DaUaqAH5IDihXxz7Wg9Hx2tPInYxe7Ja1
	+nPcdV5Xc8iuNwGiuYEJy4xO9MuMeZ+dtm/21ON4MV3dYOa2eiG5pw1qDCYgMLFJswLw==
X-Received: by 2002:a05:6000:270e:b0:43b:3c32:d901 with SMTP id ffacd0b85a97d-43b576fc6bfmr18592076f8f.11.1774274582040;
        Mon, 23 Mar 2026 07:03:02 -0700 (PDT)
Received: from arrakis.kwizart.net (82-65-38-83.subs.proxad.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm30440010f8f.20.2026.03.23.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:03:01 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] usb: tegra: use MODULE_FIRMWARE if SOC is ENABLED
Date: Mon, 23 Mar 2026 15:02:49 +0100
Message-ID: <20260323140249.173603-2-kwizart@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323140249.173603-1-kwizart@gmail.com>
References: <20260323140249.173603-1-kwizart@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,intel.com,linuxfoundation.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35337-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kwizart@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80FE62F447D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This allows to reduce the size of the initramfs by only selecting
the related firmware when a given SOC is enabled.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 3f6aa2440b05..5587302a69dd 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2566,7 +2566,9 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) || IS_ENABLED(CONFIG_ARCH_TEGRA_132_SOC)
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
+#endif
 
 static const char * const tegra210_supply_names[] = {
 	"dvddio-pex",
@@ -2604,11 +2606,15 @@ static const struct tegra_xusb_soc tegra210_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
+#endif
 
 static const char * const tegra186_supply_names[] = {
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
+#endif
 
 static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
 	{ .name = "usb3", .num = 3, },
@@ -2681,7 +2687,9 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	},
 	.lpm_support = true,
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
+#endif
 
 static const struct tegra_xusb_soc_ops tegra234_ops = {
 	.mbox_reg_readl = &bar2_readl,
-- 
2.53.0


