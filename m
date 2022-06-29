Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DE6560D95
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 01:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbiF2Xfz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 19:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbiF2Xfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 19:35:31 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9587366B0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 16:34:34 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 128so16459928pfv.12
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtIqL1f5IjnnZ0IhAnz04BNlW4zdz4jdXXNoGJ3W7Ro=;
        b=S68LdvYFW6ZcrUojtgtl/KObRBRIzIvcSoJ1fY/bqwiFZcWukxyLmF5rFpak2nx3R5
         ABT7HwWkurNBHbsUuTWI0kQmXGVNnBA/3A7xFZe7DGgGr7NEGhz1bqV7leIlaHF4dU4C
         cgT4KO94Zk6NBTR6sJR0uYjEoOBtJbdDADuu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtIqL1f5IjnnZ0IhAnz04BNlW4zdz4jdXXNoGJ3W7Ro=;
        b=aH4pBU4jAbkCKwGKqwkmr9TruIsYvDw6iQ8m0iVPAmuhGA1uEbSK2mZjVD6phlq9Bx
         X1oZdu7LGq3YxeHytr30gnMb9R3XukvgN9mwBoNCzOGwsPivPxg9XWh54EKmlH6jDm7+
         xDM1/fpbbOekMmpRSYGEXSX1himoE/2j0L6CuPhKd4G8kG5hxWkM8g4AnYj3mUCLRD4x
         HY+muCYg0UyzaulizIroa7GeVPBkj9/RfHr3l5nbAdkV6ORctmCCVAsJbApXl2QraZh6
         jTt0/PX24/rYZC5eys30HNyNK4vuYZGWr40IheI2GxQHp8anH4AhpLTefIB9+yc2uB8Y
         OiSg==
X-Gm-Message-State: AJIora80PjQZ/QqHmYjKt4GVqFshyMUD0uLEqwPwhci970ww7WVbADWy
        ZITm578qmNJtYJIcSzKkrtNjMg==
X-Google-Smtp-Source: AGRyM1udNCFmh3uhxGbwxMrkQ6H/rZ4kNvvOFcTcc41572KqRPc4APp6w6O0HWl//AGEpchkxzfcfg==
X-Received: by 2002:a63:8943:0:b0:411:8cff:8b5d with SMTP id v64-20020a638943000000b004118cff8b5dmr3645496pgd.257.1656545674380;
        Wed, 29 Jun 2022 16:34:34 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm127305pjb.2.2022.06.29.16.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 16:34:33 -0700 (PDT)
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
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 2/9] usb: typec: Add retimer handle to port
Date:   Wed, 29 Jun 2022 23:32:20 +0000
Message-Id: <20220629233314.3540377-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220629233314.3540377-1-pmalani@chromium.org>
References: <20220629233314.3540377-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Similar to mux and orientation switch, add a handle for registered
retimer to the port, so that it has handles to the various switches
connected to it.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/class.c | 8 ++++++++
 drivers/usb/typec/class.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 2fa0b3718d23..2bc5fbdb25dd 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
 
 #include "bus.h"
 #include "class.h"
@@ -2249,6 +2250,13 @@ struct typec_port *typec_register_port(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	port->retimer = typec_retimer_get(&port->dev);
+	if (IS_ERR(port->retimer)) {
+		ret = PTR_ERR(port->retimer);
+		put_device(&port->dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = device_add(&port->dev);
 	if (ret) {
 		dev_err(parent, "failed to register port (%d)\n", ret);
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 1bb1da124109..97520406929e 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -55,6 +55,7 @@ struct typec_port {
 	enum typec_orientation		orientation;
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
+	struct typec_retimer		*retimer;
 
 	const struct typec_capability	*cap;
 	const struct typec_operations   *ops;
-- 
2.37.0.rc0.161.g10f37bed90-goog

