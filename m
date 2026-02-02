Return-Path: <linux-usb+bounces-32988-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INV6HBJcgGlj7AIAu9opvQ
	(envelope-from <linux-usb+bounces-32988-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:10:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97AC988C
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C52C30574B5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 08:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25C73148C2;
	Mon,  2 Feb 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU+Ybqpl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008BE27EFEE
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019556; cv=none; b=DYWbgN+FSOE49oWD0s/25OcNa92CK9c5FsV9G0QNE9n61tFCIuUekKyD+vuU7YK0bvhucdG7iVeWdWKxaDPiAXrU3sbuQuegxlloZ0x/jYoMeHbdAxCU9kfFLzD6XBPiSBdJOSJLz5YFqD1dE9UgsXsPd6yM7znXWjRFIG22VIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019556; c=relaxed/simple;
	bh=V3jvzW11PyDhK8lR9wu29ch6YrkIS1se+hxEZ5/pSOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHSAzdOAPl9j91ewynN6r/SXiJFkWapOhxEPnTL5IhqKdvGrS79XwKxumsbzUs8CAK/4lIh1zsEN96uCzzfmasPEAPrANoGLWzX2XnAWoFB9BdNXDa24XY6o/QDJeqNL7ZOaE/1mmXfodPNR6DYdkkOiRzBwgTYVMJnGu9MQuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU+Ybqpl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-481188b7760so26152245e9.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 00:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019553; x=1770624353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/sUdOuzlxCbV7DR0QBRghRBYHyuYh6kbLEBCenrgxA=;
        b=cU+YbqplKThuL0yFRunbnjXJqyHIKGc571XT99y8S3yHkpLx766BO4Bt7G8kK2hLOh
         VmrkCZvQNSai6sm/fiUFNIGDR/BVjbOITztPF98B60ZibsfY/jX0hBzxvG5ZTQucUAyA
         sw2N8oNy5PjkPJFpNHGhJju2cOCnYHQ3tbJ2249umQrVU3u6XyqO8cfLax9+Cl+5owao
         Vyr0Q3KrxqtkfH2tX9TVhtc0mdAdo09Nxjl7811STXVPXzIIGxkXMAcqX5kkvBeYGxaT
         1EkZAAxS2f5Sel53Ttf6+8OcOVjg9tKBTTB8YzBLEHO/4McVO11tLa4ZcGA4EiLINwUT
         zTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019553; x=1770624353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/sUdOuzlxCbV7DR0QBRghRBYHyuYh6kbLEBCenrgxA=;
        b=kN+m8Pcz70lrNM96lHPA161GXK8iNOadsHWm8fq4l8ZUsiwg5EinUU54HLdtIHfyvT
         1vuNdsnOnqj1C3bUWYsuc+hSNdFr8WQq3Z49FSiBqkRmdYU/QlGVtPnxGU/D58Vez5fC
         zleNiHDtnrGBlOReGGePwKOr1Tf57d0L6WtAKfW8dDeK0pIjxlkNAWIOdJ3FV5kJZ+v9
         DMRANz9Efuh6aZvGpGJHWclJz5zVBjAafZEtfApa2aP8roJ07uRtcK4ms7uPVW6Y+TxV
         iTAnf6vF/XIvrIBbFR3GtY8lor8zUh1PQK4bLz3jZEmQofs7dmQQke45NMHALbvnpLzp
         GDlg==
X-Gm-Message-State: AOJu0YxUDxJQXGl6HUAHdfcKyjYpQwAT+Cv/QiDycg+b2wrAfns32C/B
	nUlUfuY1p4g3bYYYCDgkW1wSiFkHX5mxUQYta3AxFdJjga1XkYa9mvSTj3BQjA==
X-Gm-Gg: AZuq6aIXmGZp5iu3X5k9fc3+N7VSF0O3MvN6vut1blevLbB9mERDw749bxubReOMiHA
	ZNZ24dr3kdVU90EXozVEC7z2VwQypITrebJXfurcKqfSJT2RbDqW2nHpZVkTPVMUWXQatiNlco+
	uFhVZKcG9hU+HSjkHqi2L1Epb1Oo3oZBuRym0pyMwxIqrMrAIwz3xbYCoQ1lsT9F0ObYmgzhVU4
	/iTgm4+8Ks4Ne0po5otlWi1rl4BMAZC2I5LwbhckeR7XjoTU3vIbh08NkbRvjSA8AVR2MMj7cZr
	USlPV8KFUh2e6CzdpefaIpf5oXIMEvVMbrgunWh4/K45I4G0FIJnXpsQLajJj67ZtLVMLwlK3In
	0cjqEvnXrhFDp3p39Lon4YXRFA23ov7JHosOVG1N6Z/PDzXOSzusQO5+XHA4fjo84dhocsesEBF
	3N
X-Received: by 2002:a05:600c:8116:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-482db460140mr119083985e9.13.1770019553184;
        Mon, 02 Feb 2026 00:05:53 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] usb: phy: tegra: parametrize PORTSC1 register offset
Date: Mon,  2 Feb 2026 10:05:26 +0200
Message-ID: <20260202080526.23487-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202080526.23487-1-clamor95@gmail.com>
References: <20260202080526.23487-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-32988-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA97AC988C
X-Rspamd-Action: no action

The PORTSC1 register has a different offset in Tegra20 compared to
Tegra30+, yet they share a crucial set of registers required for HSIC
functionality. Reflect this register offset change in the SoC config.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 17 ++++++-----------
 include/linux/usb/tegra_usb_phy.h |  2 ++
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 812d99443180..00443a7beaeb 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -965,17 +965,10 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + USB_TXFILLTUNING);
 	}
 
-	if (phy->soc_config->has_hostpc) {
-		val = readl_relaxed(base + TEGRA30_USB_PORTSC1);
-		val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
-			 TEGRA_USB_PORTSC1_WKCN);
-		writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
-	} else {
-		val = readl_relaxed(base + TEGRA_USB_PORTSC1);
-		val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
-			 TEGRA_USB_PORTSC1_WKCN);
-		writel_relaxed(val, base + TEGRA_USB_PORTSC1);
-	}
+	val = readl_relaxed(base + phy->soc_config->portsc1_offset);
+	val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
+		 TEGRA_USB_PORTSC1_WKCN);
+	writel_relaxed(val, base + phy->soc_config->portsc1_offset);
 
 	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
 	val &= ~UHSIC_TX_RTUNEN;
@@ -1472,6 +1465,7 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.uhsic_registers_offset = 0,
 	.uhsic_tx_rtune = 0, /* 40 ohm */
 	.uhsic_pts_value = 0, /* UTMI */
+	.portsc1_offset = TEGRA_USB_PORTSC1,
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1483,6 +1477,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.uhsic_registers_offset = 0x400,
 	.uhsic_tx_rtune = 8,  /* 50 ohm */
 	.uhsic_pts_value = TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC,
+	.portsc1_offset = TEGRA30_USB_PORTSC1,
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 81d9f22e58b5..57e22aae6247 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -28,6 +28,7 @@ struct gpio_desc;
  *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
  * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
  * uhsic_pts_value: parallel transceiver select enumeration value
+ * portsc1_offset: register offset of PORTSC1
  */
 
 struct tegra_phy_soc_config {
@@ -39,6 +40,7 @@ struct tegra_phy_soc_config {
 	u32 uhsic_registers_offset;
 	u32 uhsic_tx_rtune;
 	u32 uhsic_pts_value;
+	u32 portsc1_offset;
 };
 
 struct tegra_utmip_config {
-- 
2.51.0


