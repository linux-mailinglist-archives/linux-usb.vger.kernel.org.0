Return-Path: <linux-usb+bounces-32986-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGvSLqNcgGlj7AIAu9opvQ
	(envelope-from <linux-usb+bounces-32986-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:13:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A563C991A
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6413081E19
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 08:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21476318EF8;
	Mon,  2 Feb 2026 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKr1MLn7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39323311952
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019554; cv=none; b=Tj4PVu/aiAit4KvTeBdqIjcFcVIyejG+NC1qPMLERdJmS1T1Tn+3WFptwE4cZ5Cc8JAwb7WrhNq++CoRGLldw8ine9NEM4VMLkkgPY7i5DVuHC/GJJ1TFrwKXvK6i70FiJQ+QPfRit/ZBK2ZLr4yKyFCcEPAi8XRFRYY3AG9qLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019554; c=relaxed/simple;
	bh=n/CThmgES7RXr4ZajWKrN9/m0RRv4RJTJL21HVrLWFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ke9DZYKcsMzK2E3jR7ImzW0yQgh1hxsPDUIdKsXCDsPoyi+qY440HyPJXii4kWLfA/UsdJNGRHMZ/bNVyjpHuycNXfkQH4YEB3Qj6v+NtviRHrk70d23XQKfFd/FbxEvEz5cxPnMX9H7Rx1vhNGA1D6r6Wfu4tQGsW5pLfNRWus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKr1MLn7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee0291921so38032735e9.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019551; x=1770624351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD7rckHxzS8N+mHFS5nFPnTWeJ4w+M+x7cKu/hU4Kac=;
        b=gKr1MLn7mOmDPKywWPIC+YnQ29h/Wzl3I4CM1CbcupQHIj4CACHdDLcpZLZxmdtxBB
         0fmIXwWUjifOT0QlqEtxBL6qLxqtowQ5tb3PNX5PWyj2+GrYc66Yv/Myjiz6I73Ed1lt
         BMbd65TiNQTjmgmNvFyvU9ZedY0G/ToNTXus/6jzQNrT4a57Tf8Hyhli0SNEIwjuoB6c
         QPM8yyY+8LQtIg7lS8+yOpYj7beUpc2BGuyzbOCUCHfrJgtWbGDV4Bpm7tKWGEANWTkR
         +adfHNh0tdPmy3y4M14UPb35ZzOnhV76Zu+c4eQz8jniBFr9LlELhNzyWnbAhcz7igwI
         A3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019552; x=1770624352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kD7rckHxzS8N+mHFS5nFPnTWeJ4w+M+x7cKu/hU4Kac=;
        b=CZFb+0FrdZTDNV8NreGJcaXAmHO24Gw34VRCVRYDN35ZMM9I92qEfjKWh45WH3CYnv
         u1X5FWNAzu7HpRqCt9mNZMQCUHcLsbIhMA6JFuGm0WH0W5r0KXx28WBlAAzpy9J2yX96
         rpY4rE2GB92dy5EzG1T5XYstutdmmnHX5pq0ZGDOfHfFgI1DCSIXRqOSImSDTt/y0Mf3
         fX/04RhMFbAOzB9Te1MU7qVXdUhpAWE8xfQP2fetg3bCdTDCMjqRGo+ElXnMfQmVX2bG
         l7ULSMA9/vaepFRktG00EiK48KaFF41CQKYbTfAuRacGG6jcQdfBEcpj1a6loVKXAohE
         wazg==
X-Gm-Message-State: AOJu0Yz8ZoXu7XAYWHAgNelxOhLDZHZMCcgleXTxw80RFZUKjFtxbbGM
	xeQlZVv717QZmRcfcwXwfYKjVJHL6BVjjgRFByCX7j5kulZoasGzdMT0
X-Gm-Gg: AZuq6aJoCE0+FwaVWmwSml+qQ7C3OB9IqG1RDGbryT6/ia9K8EM73RpflY4SRcXWt4R
	ale4KTZHrWqxYR3RAPQ4XitQ12Mdz8eW+pq5hnJqouMJ1X84s+qR1Jo4t7/pJuOFPG0b/HIX81g
	gDhEoTAG7OzvsHJtOaM71I9UjeyqwZb9mc7X4Y9B/6PRpJmhmaqY/PYDAI0d6jwDtfbf7FCcTjn
	YCb2iPV01SPYuUjZL8faWS1FMwD5KO1jxKE8GJ+nqtsF/BWvuvMm5yEy9IuEVt4D8N+O+JE2bBb
	i+W7Op1zqrEd9f0ohxND2msiuuM4arJEsitNlZkxkg2048I4eRPHqhmLrrl2x4mvgDE1VETwe3M
	jKNKf1S0In6q9V861isc64C8+YwXztF+a24R1GFJbrvR5oBD4hKAsA9AsUc/bHh17S4AUBXi5gD
	uH
X-Received: by 2002:a05:600c:1e0d:b0:471:1765:839c with SMTP id 5b1f17b1804b1-482db4d8565mr135084615e9.20.1770019551448;
        Mon, 02 Feb 2026 00:05:51 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] usb: phy: tegra: return error value from utmi_wait_register
Date: Mon,  2 Feb 2026 10:05:24 +0200
Message-ID: <20260202080526.23487-3-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-32986-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A563C991A
X-Rspamd-Action: no action

Return exact error value from utmi_wait_register during HSIC power on.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 3a7a74f01d1c..6173b240c3ea 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 	struct tegra_utmip_config *config = phy->config;
 	void __iomem *base = phy->regs;
 	u32 val;
+	int err = 0;
 
 	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
 	val &= ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX |
@@ -984,12 +985,14 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 	val |= UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
 	tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
 
-	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
-			       USB_PHY_CLK_VALID))
+	err = utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
+				 USB_PHY_CLK_VALID);
+
+	if (err)
 		dev_err(phy->u_phy.dev,
 			"Timeout waiting for PHY to stabilize on enable (HSIC)\n");
 
-	return 0;
+	return err;
 }
 
 static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
-- 
2.51.0


