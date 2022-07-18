Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58D505789E3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 20:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbiGRS4R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jul 2022 14:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGRS4Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 14:56:16 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D245B2C64F
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 11:56:15 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so19089711pjo.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Jul 2022 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImWpl/KKv4UFu4MEO4wU0UdHvw3c0qhUubcZMjHwl1c=;
        b=ZoiVOL41A6vCsGH0b1L/NLRLJ58R67hAbMBl6a3ujrVpjQ4uRQDZ+b6sOUeVZChAv1
         Db+5EalLfTpv9YtPjcUskcoveKHKgPRjT7MSTzmSENZn0PUr4iiWciunSBvNuGMSCB8i
         mS/7dQdFnfsxyyVcx128s5nawZVpZOpiVwKlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImWpl/KKv4UFu4MEO4wU0UdHvw3c0qhUubcZMjHwl1c=;
        b=ymN2zaMPHY6DifBg/phSt9zZ86Jrqg2FiSqk8m7WlMsd/cxC3SBmI+LqImabWIp/d8
         ImlHxIqJ8TVvel20eqAj32buGlcLbNS5Q7zzJI743/DQKL8pDavD3ojj02Rb5j3iks1h
         8aZ2ZNjzBblRtoDdghD2Gv1xtRFAbOesfa/GOFHJEsi7O+ZWPwF6PbfGtDlvf1pAhcHo
         o1nhHmcs0jc610tJ9yDv9WMQTXgJb8EAHd5UOR7ArQfkbF+wl6yk4HLWeiaIvfx3fCI9
         XiP3XJGdiU5hxelkzt8i4lqqJqxefKoe/ObrrsepARsAz31MCe6p/RNEVifxe4nBDFnn
         JViQ==
X-Gm-Message-State: AJIora8XotofsBPTkWNtJQXe/lQ8BGR9r51OXMnpnUwS8F94mIeMjEwO
        gMRYFufzairblHhxW/UPhYMcnw==
X-Google-Smtp-Source: AGRyM1t8c/cRBGwxbDh8wtrP3JCV2aD79MUsWaVgg+FuCPJnIe4Rl3qht860tDVjt0ZtJy8teE9r9g==
X-Received: by 2002:a17:902:f092:b0:16c:abb9:f984 with SMTP id p18-20020a170902f09200b0016cabb9f984mr25023585pla.41.1658170575345;
        Mon, 18 Jul 2022 11:56:15 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d66-20020a621d45000000b00528669a770esm9791323pfd.90.2022.07.18.11.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:56:14 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     bleung@chromium.org, gregkh@linuxfoundation.org,
        Prashant Malani <pmalani@chromium.org>,
        "Reported-by : kernel test robot" <lkp@intel.com>
Subject: [PATCH] platform/chrome: cros_typec_switch: Add ACPI Kconfig dep
Date:   Mon, 18 Jul 2022 18:55:51 +0000
Message-Id: <20220718185551.1025288-1-pmalani@chromium.org>
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
Reported-by: Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
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

