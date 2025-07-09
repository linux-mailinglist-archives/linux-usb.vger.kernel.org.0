Return-Path: <linux-usb+bounces-25617-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09FAFE3F5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 11:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D095E16BF85
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 09:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D93B287271;
	Wed,  9 Jul 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Nh/Y3RCP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBAA272808
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052730; cv=none; b=EpQeTB3c6tF5k+2f3X9A6+vgYPnycYUmGEeJQyIxRV7hJzwtT+o1RH70/bSm9OmR8hF6i1Az/PwYzoVr9t+N2Gf2uQmb4zbPRJVpj/rUIJYMRWXRqAZGy9wWnQSmSSuKk5BctKdBsY3DZMVNEvkjRDqduVL87uVXPxo+jiDmoFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052730; c=relaxed/simple;
	bh=YZmEw3jGDd+2qgbm25oUb6kfM16R2p862EV52VAwfqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhKyaGlcADsv5Jhre4E/ilr1WbAKOd9UuyY2XObcvb3hbGU1DNXZgmdmA5uuWpfNfS+jG+g6a3NkN4zExvhpvkYUPtn+lv6sFAl5bjcYgs5ZQj2KoGX1VQxrit2+kvT+3Sic7yos7/SBDt6+8JJuxQtPEez1x4gQl/9dRtx+nyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Nh/Y3RCP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso1050703266b.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052726; x=1752657526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAQIOUI3dQN/BAWWa5L7E496C+B20N9+qpU1jibn7CE=;
        b=Nh/Y3RCPN8O1hs40jnAcKShZ4I86K3FPiBxiteV36jDlKBWjE1pFWF/ovlzc9RjHQx
         4qk559FPKK4+vd/UxO7AbYNx3Osnd3tJ4qlQ1NWoqW60WhJXf9zUcVhyVjnAYchzYDMu
         ntSh+Gxkg0H9cdd5u+xJEaA8zqfwjAXetmGKT4/FkF5ynwQ0DwPUTIcM+gzdyU7khgpD
         RMBiOy0EPouGpqy0uG9OgFZ3grdLTOT5Hs1UJTg7XFY96yluLnL9ocs1gMiNGpMz/m8q
         rDpa6kl9jBx7svNvfwFWOAedjxWy3nCJ6CO8F2sRY7W09139ylkt1c7EAeyl76k1yY0w
         N61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052726; x=1752657526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAQIOUI3dQN/BAWWa5L7E496C+B20N9+qpU1jibn7CE=;
        b=V0/6WU5MWppKTX+AieD4WcO38PiAUf2OePvueSO9+DO2aF2C5kdDhcvo+sDKWIhSox
         9QbM3gj/sEuEG0oHGgycGzxlNYuXGkSPDMkiddDHRIbHZroLvahpqvThfzXpfp507ocT
         sPPRtO5Y5hssHXhlPD1WVbvlL3PtlHWI90O8t5QxJKzpM+L7zgPe5gHC2PgR4rcg8+E4
         6qk1LDigY7lX5boEdEyBq20tHLppAnZ+Q4Cmnq/UkF5C0LvcV3MgvbAKLoRkd0SUEFuB
         CCbJixhF1QDClWLIOURED8Ry1kBwK4MX4gHy8PzsRhSQr/4lPkJmQrDF2rXzT6xAyZJ5
         Y2YA==
X-Forwarded-Encrypted: i=1; AJvYcCWxN7r+5/8UpGIwDCXCnCXSNUtv3fK6/aVxiqx6mRaGhUcXCOsbVkAxp801aCx8JOhn6BMIMG00s6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHrHGg8uqa7fzY28el6QMAt7UunA6aGbFP06auX5vEIHLkjFY
	LhBqekfDaIcsP2H4Pu+0jp6NcnZyDpeR4NZXxhG1J4xJraie8ePabpyaqSmZduRQN8u03tfVFFH
	QNqq1
X-Gm-Gg: ASbGnctcCR8A10XFGkdDlUBIjcvVIolDE8AktA+2WVDCC8h/jJtvtVkTnIVLxZeRkeO
	Am7wLw29TuuystmIovELSC/1wvJOIX30vfe4ubcqK4zBeRaNiqmLIiN38A3r9UePO+Otv9nWmoa
	FyVT/TZYZ8vVwuj0YVb2lbIfjPfxrNUqGhUObhFSi4xCHp2fzWcq4WLleJke3nmcDFeVi+lKnId
	sf0dD2GbqC3S/E5utku2B8KELCurN6nDYDsrzz4QbDktInLLUTScM4kzErDQPsozB4YDWclt1Pq
	etFGrJDnpIQlkjLOgSm5iMOyWOSN1VLn3CjPHhlRVVBQLG3ArY0zcPOmGkSihjwwsXloPZAFLOt
	usdRSUYBCtDlVxDbRDeSkOXDwZip0Dh5YtmYC2yasY04=
X-Google-Smtp-Source: AGHT+IGx/vzlfyTviick6hyyNUlcbGsI+JPz+PSX0OW7+e4XECNcxPqd0I6M02c/e4D8+rgbMwjMcQ==
X-Received: by 2002:a17:907:9281:b0:ae3:a8dd:418a with SMTP id a640c23a62f3a-ae6cfc748eamr190274466b.56.1752052725491;
        Wed, 09 Jul 2025 02:18:45 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:18 +0200
Subject: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for Milos
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1428;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YZmEw3jGDd+2qgbm25oUb6kfM16R2p862EV52VAwfqs=;
 b=zN8r6w9eZkpsfJvCdS/uEyRLTfMfcMPeQkNPEXxwm1zg2mzNgMq6//5XUqXcPzpMEX576tiX8
 v8sIG6hQ6VlD7xQf/Q2ZKTCgES3vUcgQxUzwebHmbVyiNZdDrA4X384
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per the downstream devicetree for Milos, add a register write for
QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
The downstream driver supports an arbitrary extra init sequence via
qcom,param-override-seq.

volcano-usb.dtsi has the following which is implemented in this patch:

    /* eUSB2 HPG version 1.0.2 update */
    qcom,param-override-seq =
            <0x00 0x58>;
---
 drivers/phy/phy-snps-eusb2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870aa7f7971a51d4a567 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	/* set default parameters */
 	qcom_eusb2_default_parameters(phy);
 
+	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy")) {
+		/* eUSB2 HPG version 1.0.2 update */
+		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
+		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
+	}
+
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
 				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);

-- 
2.50.0


