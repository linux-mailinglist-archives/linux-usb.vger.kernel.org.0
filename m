Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED73578CB7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 23:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiGRV2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jul 2022 17:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbiGRV2f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 17:28:35 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71F531DDB
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 14:28:32 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id s18-20020a17090aa11200b001f1e9e2438cso1043472pjp.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 14:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PVcgZzjdK9fjloy6/Y+huhUu52yh6ctU8017XyeNTLM=;
        b=Sa/S6jwMcJ6vjrfJHhWknnUYuPM+pYaLLPuHmCGsdMeJChAHIeOO5asROW8eyJpcIK
         ZVPoVHm7j1hKHIePlke4jGYo7O7x8uwE/3WaJKMTh36xmHe8nbBADJz6zFb2Ta/zswfl
         3tOPxbJzDaNmEuC9x6q48jG3Yo4WXSple2DMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PVcgZzjdK9fjloy6/Y+huhUu52yh6ctU8017XyeNTLM=;
        b=YBOt1FnI5MfaDDKu3bgOUHoCR9Ke48LBzWu/yyOnxN3YukS5zuP/LzSbCo4q+TcKq8
         3xdQI/YEfbX7i7P8RdCqnbmM8S9zseqy2ADDO+wPC3QPH6GagHEVs6SV/8fWHrrg+ghM
         wTJ+9gHm7FaIsAMpKahBGsnswDaEW0w+07mLoij+UCZJ0KC/s6ZpbuyZk4jPaKlOVsp6
         NMRtjjEr9nXm2QSu7mQ5U7a4ms08wCj5hRezh7zHjEhm2Ty5SuvhD63RhqaY+ALVh917
         LvFGXEnkI8+htLYOOp4v+wiMeT/ND953IJ/bvryJMhOwlTt18W8TgvCIcHifMuKc0IAD
         zlng==
X-Gm-Message-State: AJIora/nCuojVk8z+fWNq4oi5SbnDMlgRLq1QD8w5LKU91F8ayWom3DK
        qxoGJC4IJt6toouR/LAJ3wRpbQ==
X-Google-Smtp-Source: AGRyM1tKSCH41BB852jsIS5RXGkAx+Hvett+tlV5FCfr3isJIr5ePfcCMhOC36ySIh28Iy2UYPICjA==
X-Received: by 2002:a17:903:18c:b0:16c:51c6:675d with SMTP id z12-20020a170903018c00b0016c51c6675dmr29737274plg.153.1658179712184;
        Mon, 18 Jul 2022 14:28:32 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z9-20020a631909000000b0041992864d69sm8536830pgl.77.2022.07.18.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 14:28:31 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     bleung@chromium.org, gregkh@linuxfoundation.org,
        Prashant Malani <pmalani@chromium.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] platform/chrome: cros_typec_switch: Add ACPI Kconfig dep
Date:   Mon, 18 Jul 2022 21:27:55 +0000
Message-Id: <20220718212754.1129257-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the ACPI Kconfig dependency that was missed during the initial
driver submission. Fixes the following compiler errors:

drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to
undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not
support implicit function declarations
 [-Wimplicit-function-declaration]
   ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);

drivers/platform/chrome/cros_typec_switch.c:93:35: error: incomplete
definition of type 'struct acpi_device'
   ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);

Fixes: e54369058f3d ("platform/chrome: cros_typec_switch: Add switch driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Correct the malformed Reported-by tag. No functional changes.
(Apologies for the quick respin.)

 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index c62a514a087f..9d4fc505fa25 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -267,7 +267,7 @@ config CHROMEOS_PRIVACY_SCREEN
 
 config CROS_TYPEC_SWITCH
 	tristate "ChromeOS EC Type-C Switch Control"
-	depends on MFD_CROS_EC_DEV && TYPEC
+	depends on MFD_CROS_EC_DEV && TYPEC && ACPI
 	default MFD_CROS_EC_DEV
 	help
 	  If you say Y here, you get support for configuring the Chrome OS EC Type C
-- 
2.37.0.170.g444d1eabd0-goog

