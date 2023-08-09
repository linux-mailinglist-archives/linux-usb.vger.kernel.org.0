Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72C5E776B00
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 23:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbjHIVdh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 17:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjHIVdh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 17:33:37 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FA41724
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 14:33:35 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe8c3b5ca0so233457e87.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Aug 2023 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691616814; x=1692221614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHhxE/dJDA6clbO9u01O1/s/eHxwxfI5ttey2qrEI7Y=;
        b=lOEq3UiLppEvzFQ+XytrfD/OLqlj+o2lGGJ2iLdVlf9NZ4HjVkiVf87RBQMqy//Xdj
         VOtjEkVw6I5hTl8fjCTdzz4Zr2W9AlHkxzp0OyYs5pukC1ePGvWhlT3An1SQhg63uie4
         p23kTFFbUEzmr5al2aWfVctMdFlN9iqmJmyz8Ej2RJWxnjVhK8p9+fZiFOszWmKwFMXQ
         zuaDyExqGHbzAD87dN9VYVazNOfM53tOex/XTc9VJJ6FpWSmzsR+y2l+cOq0helpBptI
         FtIpytHR9FuhE1fCxdEXJ4i0lyJjhrTrnYs3qjOBTisR++lA3QbB9VOhT6/6S0A2j+XN
         IjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616814; x=1692221614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHhxE/dJDA6clbO9u01O1/s/eHxwxfI5ttey2qrEI7Y=;
        b=iS9wo0baVJrQXPYV4gecuDRAlY4271AvA9tWQ9EBEQgvaM7bcMFb4n3D31MwJiFL7t
         RjsWnunFB0uRy5+OLKnI8Ko418N09aZPi4QCSExcuKlcsygac4/X7247+AWUEJ/vNbuo
         j9KdWQGLyuGl0A9DlAULnoalKVp+swb6WCW6Ycdy7b8z0JtSNODGe+bMqdmB3SLZgXKa
         WkKrmfqoaSH2Ck4LXH4odcKYOk4UhHi8x2D7v9GrBYdAXmFV78MNZhSeieUN5WB+SFeO
         R137LkNntFPjTCYNfRnPoeCvtksQmM+GaV24e0n01rj1/gzEs5eIUvp9rduuk49phD3z
         zhVA==
X-Gm-Message-State: AOJu0YzGTsbd3XuQrIV2v2yr5QylNAjuDSlatxL7Gf3c+6E2XN2+LM/F
        dQHxl32XjSbBb09NmQeluMcq1IE1P6v+nBdo3b6ZFbdJ8T4=
X-Google-Smtp-Source: AGHT+IFF1nfi6ptRW3iihGsy7dhGfDFYH+hxDzqxsKBwEmZmm7zQoFcXeraSGoiglsNibHtSGD+FVw==
X-Received: by 2002:a05:6512:3baa:b0:4fb:8f81:4fe8 with SMTP id g42-20020a0565123baa00b004fb8f814fe8mr258735lfv.46.1691616813958;
        Wed, 09 Aug 2023 14:33:33 -0700 (PDT)
Received: from bear.local ([69.165.74.129])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25282000000b004f864690901sm2450645lfm.244.2023.08.09.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 14:33:33 -0700 (PDT)
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
        Luke Lu <luke.lu@libre.computer>, stable@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
Date:   Wed,  9 Aug 2023 21:29:11 +0000
Message-Id: <20230809212911.18903-1-luke.lu@libre.computer>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
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

Cc: stable@vger.kernel.org # v5.8+
Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Signed-off-by: Luke Lu <luke.lu@libre.computer>

---
Note here, the commmit of Fixes tag is the first patch which bring
suspend/resume function, so let's use it as the fix tag.

As commit 5b0ba0caaf3a: (usb: dwc3: meson-g12a: refactor usb init)"
introduced the use_post_init() function, and this patch will explicitly
depend on it, so let's set kernel version higher or equal to v5.8.

Changes since v1:
 - add Fixes tag and Cc stable tree
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

