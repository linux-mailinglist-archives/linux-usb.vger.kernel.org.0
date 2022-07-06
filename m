Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD22569096
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 19:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbiGFRXw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 13:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbiGFRXj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 13:23:39 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676492A71D
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 10:23:38 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f11so1632566plr.4
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yav60sk4t1jSHI9y7JwNTzYMHxVBsDg0h4MxYyUTEPE=;
        b=j2Jn45au290gtTFCTf5ikH5yAqAHf0I7w5DZ6J2ln2fTcaKI1HD+BMjDKiRf1fWhsh
         XfiCuSZJyaHD/8ghRqM5EcDDKHtC+IzPaP0SpwDeXP4r9gVE5NuBWd/QOd2qKPIqblc9
         h/DGkYqxjMj00Jr6530xkwT3Gme6bs4dSOdfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yav60sk4t1jSHI9y7JwNTzYMHxVBsDg0h4MxYyUTEPE=;
        b=LnvhDel+6MQE1NS42FOP25IeqpCwwfGvy+oU1Os+t9QOK016mMNXRYhqKW7qBEuFXe
         7TRkKHsqac0TKeW6/VDHuCHB40G+SJZsytsiyGYrBmSv0v/nJYnUWh/smY3tkWquo6+Q
         Z/8xALcJ9L9ySJaHeJ52aTqK3fXXgPyz2yLGPKSBg7h1eOG+EILxuWOjsiUBUvEO4Kmi
         Sxc88Qk4beMNXzryHCFCczcHP7pC5c4UtWl8SlXuSCQ4Y/9VfyBqSXNveneiKYOkRIcX
         2IOt/cLqSWCxG4voBnrGs9fYe1+nQZTO17DB8ZRo8GEITXbCKMKADV6gIwzvynt4E6DT
         b/GA==
X-Gm-Message-State: AJIora8lUnXq4y17GUrb8US+G5GuWn8a2Na68ddx/mvYzPW/9/alEebh
        aTYF1cdQs9Y+YyC+EQzJnULkDg==
X-Google-Smtp-Source: AGRyM1tnnh3jgtm7cCp9Qgeg1uF8C64jY6TXiUAsXTO+1wpBfTZrDmt44SkdsuY2bjLKYP5D1k01mw==
X-Received: by 2002:a17:902:d50b:b0:16c:474:ce67 with SMTP id b11-20020a170902d50b00b0016c0474ce67mr3487691plg.112.1657128217975;
        Wed, 06 Jul 2022 10:23:37 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:23:37 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 8/9] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
Date:   Wed,  6 Jul 2022 17:15:12 +0000
Message-Id: <20220706171601.807042-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706171601.807042-1-pmalani@chromium.org>
References: <20220706171601.807042-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some of the return paths for the cros_typec_get_switch_handles()
aren't necessary. Clean up the return paths to only undo the handle
get's which succeeded.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7cb2e35c4ded..39e6fd4491a9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -157,12 +157,10 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 	return 0;
 
 role_sw_err:
-	usb_role_switch_put(port->role_sw);
-ori_sw_err:
 	typec_switch_put(port->ori_sw);
-mux_err:
+ori_sw_err:
 	typec_mux_put(port->mux);
-
+mux_err:
 	return -ENODEV;
 }
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

