Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 536EF773C3B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjHHQCi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjHHQAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:00:55 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5929D2109
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 20:29:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9338e4695so83651541fa.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Aug 2023 20:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691465374; x=1692070174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2a2fi6fo8O2qphEYAkmBRgnh3Id5Qk5HANh3JTmLrk=;
        b=Hv0EkMFwuoyzbj7wybAw2sah1r5PcEsI9FNN9nLIlvkNEpHSFHw4jcZKq/NkXGTw6z
         H42R1MPcMSc8IIbKlAyXG1c0yacNizA221RfmnShj84TS/hy3iWPjxmdPyQv7ZxU8TG7
         hpT6Z4tY0EZoJoyg6WfiTFEaPLh6C+jhz6GHGqJVIafQ68XNayOBx0xe/m5BsTf3D1HI
         j/rN/NYIuWU98uIvWBgGI0u17/cRIekusBpWhj45eIhdqLWoop2D5lE7uBdJ1OaeFKnx
         SQMjWMbfBsMbDrTnG5IAIcQnZd+a+ujSMOvp0lA9QUDdDk24tLRY/H73PpTXxQW61bd9
         Xujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465374; x=1692070174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2a2fi6fo8O2qphEYAkmBRgnh3Id5Qk5HANh3JTmLrk=;
        b=gszJvTU04xI5Er/T84QqsAznczYUuXx0F6WrolflL0rwpu9CTS+VMaE0LfzbMEnd7Y
         yf5kDFmglxL9fh3DXx/lIWd7dFXPMxxieUXJGFMhZ+s2A8Y65eMoOF/jMyv5Cve/ZX7/
         gL+635Q9Rwwkzcxb7/r+JKbixg811sZIhgIBYDn6+A5bkF8mtCz7QXi8evl6kk8mH8fX
         iVOuP5FONLCB57AVP6+Q7s7iqFP84zbx/SgKrlf8vLqDZ39e3XsXILQS7cIuWvHFSKO/
         MUhfD1XIYC5hX28b2iXL8BEAzx18S7A/oo4sonhloLFKxFQyWVtuH0BjGZzyjgl4dA0O
         Qnew==
X-Gm-Message-State: AOJu0YziWvCXmyymI0yFbCJtkE6sqcITnBUE7GDlpYBUJtbwmApuTziR
        sdddWw1lROjOPevXa6xzNz42GEXhIV7aFoQc7xw9+pLj5VOxQw==
X-Google-Smtp-Source: AGHT+IHUJlcYJA5OEaih3/uCPH2RSh8acayw3bMZ9xFGDbb2rx6os6/zhDaz9FaWTAYH/lOAbrlTdA==
X-Received: by 2002:a05:6512:34c2:b0:4fd:fe8f:4108 with SMTP id w2-20020a05651234c200b004fdfe8f4108mr6732753lfr.62.1691465374338;
        Mon, 07 Aug 2023 20:29:34 -0700 (PDT)
Received: from bear.local ([69.165.74.129])
        by smtp.gmail.com with ESMTPSA id a3-20020a056512020300b004fcdd81355csm1715321lfo.269.2023.08.07.20.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:29:34 -0700 (PDT)
From:   Luke Lu <luke.lu@libre.computer>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Da Xue <da@libre.computer>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Luke Lu <luke.lu@libre.computer>
Subject: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
Date:   Tue,  8 Aug 2023 03:25:10 +0000
Message-Id: <20230808032510.31754-1-luke.lu@libre.computer>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Device connected to usb otg port of GXL-based boards can not be
recognised after resumption, doesn't recover even if disconnect and
reconnect the device. dmesg shows it disconnects during resumption.

[   41.492911] usb 1-2: USB disconnect, device number 3
[   41.499346] usb 1-2: unregistering device
[   41.511939] usb 1-2: unregistering interface 1-2:1.0

Calling usb_post_init() will fix this issue, and it's tested and
verified on libretech's aml-s905x-cc board.

Signed-off-by: Luke Lu <luke.lu@libre.computer>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index e99c7489dba0..2c07c038b584 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -926,6 +926,12 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 			return ret;
 	}
 
+	if (priv->drvdata->usb_post_init) {
+		ret = priv->drvdata->usb_post_init(priv);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.40.1

