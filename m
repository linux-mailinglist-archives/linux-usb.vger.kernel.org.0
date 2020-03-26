Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D465194027
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgCZNqC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:46:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52655 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCZNpS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id z18so6531276wmk.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rgm3f5ndT4SRxsUOGSFj42TYFBt6uTox34hQIqIPD3M=;
        b=vGsB2hyfU43rwlef6flGgMOkxhQmUE9TjoLs/7igSqI2YagDre8H9juTWABuxvaXwg
         Y8ezn8Xfq12EC8M3aAeIFAcutFpWbw3h8UDC//DESdqYnkigvkmP4sJpH7hMtnKjBUmU
         xoEmFqNdltbGsLrjVWYBNP8MNTC92SwU9Ek0eqfcyOt/OGS4xvc4akTavDrV2MJNed2s
         rzX7xY8ADUkUMvbP6vU3WW8hyeknd4hZ44DkDkLzb07HGPVxDhPabgK7mC8ApFnvz0Ff
         zpAqIla+twnHkGeYdG0K/9e5vELTWkWbyoeb7SUzEAhkkckNd2gJ+cW3vV79pOVuNb6h
         reSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rgm3f5ndT4SRxsUOGSFj42TYFBt6uTox34hQIqIPD3M=;
        b=AcVOix2ItpmgE37c+/MsksuI/oGQ3xKUyaOsCxk52FtmBN3PHwrxhgafosjOqbO2mC
         D87pflBKPAY5es/b8YfCqlbqvK7YVZIPjw/wKwLtajMm9bPKwmcG/mZBrKpC3Lb04VC2
         +grL9Qlx8+VX7Ct9QRzFZE8/VpoZhhqe9b7RjcD+UdFY0N/f8ZWay5kGAEubbCw5FzXl
         VKemg11qzcTUvItgtvNGLkHmyLnjKBinW4wo+I16/vYhrZSBQfx1QY25XOr8CjmZTXsA
         110XkhGLAQ2zgns07d+gTzgWOyrC4UEyxzMg4XZ+ZUDqgWo6c6X6f3KlOFZB2Nx9bziO
         vyqA==
X-Gm-Message-State: ANhLgQ3vP17JP60mKzcuFqYsi2zpfa2VmWr2EKip5tutm1cWC4hImfsI
        WAJwMsPzPFV22NuhWeP3WSJI+Q==
X-Google-Smtp-Source: ADFU+vtuhNxkkXsqiMUzpNuOC+DDKVN6iwl4HMpoiDzFb7EFa0attish9ohgWqYq8mDlRojsNCxpwg==
X-Received: by 2002:a1c:96cf:: with SMTP id y198mr40738wmd.186.1585230315865;
        Thu, 26 Mar 2020 06:45:15 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:15 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/14] usb: dwc3: meson-g12a: get the reset as shared
Date:   Thu, 26 Mar 2020 14:44:56 +0100
Message-Id: <20200326134507.4808-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to support the Amlogic GXL/GXM SoCs, the reset line must
be handled as shared since also used by the PHYs.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 37ef08493e37..41bcbd31fe4e 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -564,7 +564,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	priv->reset = devm_reset_control_get(dev, NULL);
+	priv->reset = devm_reset_control_get_shared(dev, NULL);
 	if (IS_ERR(priv->reset)) {
 		ret = PTR_ERR(priv->reset);
 		dev_err(dev, "failed to get device reset, err=%d\n", ret);
-- 
2.22.0

