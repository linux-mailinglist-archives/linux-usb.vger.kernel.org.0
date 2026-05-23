Return-Path: <linux-usb+bounces-37966-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M/CJP1lEWoelgYAu9opvQ
	(envelope-from <linux-usb+bounces-37966-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:31:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E105BDE98
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9932A302FE92
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6900236404B;
	Sat, 23 May 2026 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYjquy+s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C373644BE
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525046; cv=none; b=HA3WPaM58jF2Yc2o+3mtpCDUOcvQjrgtaqWPf6E6eyyc9yiu71tM8H7zEPI6Ee2/fhmuUttM3tRgbNz3vx+ywWj4c4KT1P3OZ9rBzzXa+Z9UiTA8bmB1+VxWJRjsEIRk/h4vRgo7Jvbx53p6v6GBhPVeFib7EIko7aaTqyspOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525046; c=relaxed/simple;
	bh=L3pd9O9+k7HD97LBKiHjkt7CjVY/MTLZ0/1GPuvhFoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTcvqYhtxFxZkb968DHQyqAnd6DJNz9yHcTsF8A8j4a0WLrw18yV28oZljJDSmIC8L6irKs11RxzT+KoXevgK1vL/Mwgtl95NjfYw4z3BQzgpsIshN4TlgImZjOUgSwj+Nof04upPs39DdsBtrZ4oo2h6FmT+j+GsNBikSxkhTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYjquy+s; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so15699869a12.3
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525043; x=1780129843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoLIFVfCtco7LvImKkYkivcovHQB6EbUjyp4kpuJb6I=;
        b=MYjquy+sfTodYeCUKJo0VvRo2/+kuyqW+Qq+xpgerwms4qG5y5xtSM4OWNRZIp8fjS
         tCXWh6gR3UzJ2uamcT8hkivvWZ6pP+9LwACxA3jg6dkLXmf7iSlc6zWyYsU/egrfdFBf
         vo7iXPe+bUfxv8FiwM4bTfZkzocgR0JKRe6dxRSO+CAl4Lnr1cGIl+g9evzFaaPsu6h/
         ontf2nLe4SI2OqhdVJDd1NfQf4Wvq0DVoY+MwYTMMgipltHgJvgncjerFjbDNgnJCFtF
         ohXHCNKlsdBF6xN0Kx8sBBsc4gUJ86E9Y4xwlFGDwsD9lj319RRmktVPtZyPZGYHFrTC
         wlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525043; x=1780129843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoLIFVfCtco7LvImKkYkivcovHQB6EbUjyp4kpuJb6I=;
        b=GGF6r0tfSyFtsLcm0FNDbhyoNOmUa/t2iFnjSkP3csKtk5ubvE778xkU3onrqWiVVg
         BZqeTI7VyEgDJqlGurQHGz6fT6bbWlxsJO0azFZMyv+G2tPvY3wl5Ru76jBQfEdqGAO8
         EuDudx0/1sZe2eSl/6PPvLHxQsjDhispcNWQOxKyIdEXX7doWPw/8gwVa1q5EGUWD0qG
         XzFJ6I1ZRnA77DvU87DUld+S9WuuzntI0I4nu96XuPLbHKU8Zrtvuk46752ES9sGD+E2
         2jwgFUKYLt84ODgtnARhaTejd+tXxy150rPflnaowKGm9oQW7DmpWvnPVpteav3h7Zto
         aOdg==
X-Gm-Message-State: AOJu0YwHz4DPfCYbYaFMRTl8fGcSJf0VKKS3inRqWG2NmNdE0cJHYggH
	5VKT1KSTmf2b5Ij6Wkc+h7tbBPeTSC5LGS9xUfP4/U1cT5nR1Jn4iZaF
X-Gm-Gg: Acq92OHNhsB3t8oDWuZoN5g8ND0SoSdHJuUhmNS4nAYAlyeBdRQrDt8z7NQ7H6XPj9f
	nHynTdzSJKrvFldtMoBrZNSWCczzUdou57A4ZUcLoF1DU5yUMDfhkXF3aMlApzoGlX+swYr/1YP
	8zLFFEI1TF/aCEaghmo0FHYEKJfExLa88XgJ1/lv76Rp5tshIO6qaT+dNYCEaQo+PL+FsX+8hN4
	Vjr+RSiJiICuuW2HA4gnfV+7X2S59xTvARXg+KREs5c1sNeE3+UbsMsd7sGTLKicWFzRLKmTIFS
	LDjl5po7V8B+q0ztZo1QSCEeXl77o+oiaQFkz0flo2apmQYj0EAyAOZiY/5p7C3GL/BwpfzUFiV
	aHR5vHgOX0xEPu0I5WFqH6w6LOimiYURF47GRylHCa8y/LoiJ5PaFS0BvQmDhajL3fXORfBSiGU
	z07nxX70Ai2iGb
X-Received: by 2002:a05:6402:42cc:b0:688:1d5:44b9 with SMTP id 4fb4d7f45d1cf-6889c43c704mr4015594a12.7.1779525042509;
        Sat, 23 May 2026 01:30:42 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if bus is externally controlled
Date: Sat, 23 May 2026 11:30:11 +0300
Message-ID: <20260523083013.46372-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37966-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.964];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 47E105BDE98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the USB controller and PHY are externally controlled, then the
registration of the controller and the PHY initialization should be
skipped, since these configurations must be done by the device that
controls the bus to work correctly.

Since USB PHY in Tegra controls clock gates required by the controller
itself, Chipidea core PHY management is not suitable for Tegra.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 372788f0f970..a19cb3b33bf3 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -32,6 +32,7 @@ struct tegra_usb {
 	struct clk *clk;
 
 	bool needs_double_reset;
+	bool externally_controlled;
 };
 
 struct tegra_usb_soc_info {
@@ -312,6 +313,9 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
 
+	if (device_property_present(&pdev->dev, "nvidia,external-control"))
+		usb->externally_controlled = true;
+
 	err = tegra_usb_reset_controller(&pdev->dev);
 	if (err) {
 		dev_err_probe(&pdev->dev, err, "failed to reset controller");
@@ -323,9 +327,11 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	 * initialized, otherwise CPU will hang because clocks are gated.
 	 * PHY driver controls gating of internal USB clocks on Tegra.
 	 */
-	err = usb_phy_init(usb->phy);
-	if (err)
-		goto fail_power_off;
+	if (!usb->externally_controlled) {
+		err = usb_phy_init(usb->phy);
+		if (err)
+			goto fail_power_off;
+	}
 
 	/* setup and register ChipIdea HDRC device */
 	usb->soc = soc;
@@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
 		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
 
-	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
-				      pdev->num_resources, &usb->data);
-	if (IS_ERR(usb->dev)) {
-		err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
-				    "failed to add HDRC device");
-		goto phy_shutdown;
+	if (!usb->externally_controlled) {
+		usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
+					      pdev->num_resources, &usb->data);
+		if (IS_ERR(usb->dev)) {
+			err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
+					    "failed to add HDRC device");
+			goto phy_shutdown;
+		}
 	}
 
 	return 0;
@@ -365,8 +373,10 @@ static void tegra_usb_remove(struct platform_device *pdev)
 {
 	struct tegra_usb *usb = platform_get_drvdata(pdev);
 
-	ci_hdrc_remove_device(usb->dev);
-	usb_phy_shutdown(usb->phy);
+	if (!usb->externally_controlled) {
+		ci_hdrc_remove_device(usb->dev);
+		usb_phy_shutdown(usb->phy);
+	}
 
 	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
-- 
2.51.0


