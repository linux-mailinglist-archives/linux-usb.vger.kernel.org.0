Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6797F651734
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 01:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiLTApJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 19:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiLTApI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 19:45:08 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A007ACF1
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 16:45:06 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id o8so4287955ilq.6
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 16:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kW9afR+WJfD78PYEA9902jKuxZ9bWlkIHqcxq3mYrY=;
        b=gaucniKopVtZLNUzEBZkqkKHLOv9U85lRvjbCRadwBozy11RFwpAw+P//ndaM+nLWz
         tNX5dyYos/5QC5CJQgbKkjgFcVp4ic7jd/1rdfT39yI9ZrW6ufAnN0jWkM8X06w8QeWN
         o/WUP1eItbin+c5NKzhhNh2fVbhpKPXK46Jf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kW9afR+WJfD78PYEA9902jKuxZ9bWlkIHqcxq3mYrY=;
        b=Ya1uNvMWh/+5VU/w6H46xlKapC1yY/MX/f4dAx57gLbzuYR4/lXI5wxt2G46/eNdjJ
         fFLECZEzVDDUUjYr+ZsOugQNZ69I15Blsemuvh/QKtElwLbOuzY7A3fSt7zQu3Z9bY0w
         LnFLocFQf9LEGQ1/Sobt5jEh39PUtidXBMbVd9gmagENh/Lo9fa6J6uwOEmRhoduyexd
         BAni76C5cKLyc6LCcQ0Bap33c+d/x40BnOjZAav7yUMFS6cVrXr9ggGcMp2J8OVnmO2w
         YUplXls7qk7GGTL0dlG3AgHpFcFVkAZAmo6rlJC6sR+tvZG4dSbgGrvTb1/ufWA1uPFN
         ZzbA==
X-Gm-Message-State: ANoB5pnryB1fS44JU8KC/+eYPKlxQ5d5FhZo2H7HGvtr0okWF+L2VjOK
        95D/t1P3hr9hfMpQYt9gMvscRA==
X-Google-Smtp-Source: AA0mqf5oAs+MbTqAsFKIcw9IMF/ZhIX7DsW4c3sm5f9TgC5ie/xXqrvZBiDmkY/CFbRK5qPcKDmbcA==
X-Received: by 2002:a92:d5d1:0:b0:304:bd9f:1aed with SMTP id d17-20020a92d5d1000000b00304bd9f1aedmr18106323ilq.6.1671497106047;
        Mon, 19 Dec 2022 16:45:06 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id z6-20020a92cec6000000b0030380d1e24bsm3788833ilq.30.2022.12.19.16.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 16:45:05 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>
Subject: [PATCH] usb: misc: onboard_usb_hub: Don't defer probing for 'incomplete' DT nodes
Date:   Tue, 20 Dec 2022 00:45:01 +0000
Message-Id: <20221220004427.1.If5e7ec83b1782e4dffa6ea759416a27326c8231d@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some boards have device tree nodes for USB hubs supported by the
onboard_usb_hub driver, but the nodes don't have all properties
needed for the driver to work properly (which is not necessarily
an error in the DT). Currently _find_onboard_hub() returns
-EPROBE_DEFER in such cases, which results in an unusable USB hub,
since successive probes fail in the same way. Use the absence of
the "vdd" supply as an indicator of such 'incomplete' DT nodes
and return -ENODEV.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/usb/misc/onboard_usb_hub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index d63c63942af1..2968da515016 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -363,6 +363,15 @@ static struct onboard_hub *_find_onboard_hub(struct device *dev)
 	hub = dev_get_drvdata(&pdev->dev);
 	put_device(&pdev->dev);
 
+	/*
+	 * Some boards have device tree nodes for USB hubs supported by this
+	 * driver, but the nodes don't have all properties needed for the driver
+	 * to work properly. Use the absence of the "vdd" supply as an indicator
+	 * of such nodes.
+	 */
+	if (!of_get_property(pdev->dev.of_node, "vdd", NULL))
+		return ERR_PTR(-ENODEV);
+
 	/*
 	 * The presence of drvdata ('hub') indicates that the platform driver
 	 * finished probing. This handles the case where (conceivably) we could
-- 
2.39.0.314.g84b9a713c41-goog

