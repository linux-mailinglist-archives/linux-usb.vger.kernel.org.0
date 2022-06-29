Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A22560D97
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 01:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbiF2XgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 19:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiF2Xfw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 19:35:52 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0028640913
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 16:35:08 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id e132so1211797pgc.5
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 16:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YMJyOFpuSDoGv1YpLtkWmVNF37oTmbwYurQktsTP8u8=;
        b=N19qnA4wxxxCQd4ccwVZYpIGH0QFjoFxC/j1DObEFW5Gh9dlbOlnuI9wu538pez5Eu
         zNiWQuDTQGLAv2GcaQWOq3kDR451SXydepZQMkh7yXKHaWABZbFuy66zlUi7eOBNxleY
         crR/V2vToV9Tw/+s+5elK9lSSKQ+HXkN3k0Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YMJyOFpuSDoGv1YpLtkWmVNF37oTmbwYurQktsTP8u8=;
        b=IW1oUYlMAHTad/NjB+KvrjQj5esatxrXE+nSBvOlhqlstLLTwX6f3a103i+dO5EyTv
         TukKoaMwrjWAYr3du7qkGLKjsfFL7cqxJ7a93cQlztHHsIja6CkQpVqUHSzGQrj3hfrW
         saXHg4ePfFiKmjsho4hxuOKf2d4TKtwc/pK1Ho0lIfvHnrf+eE7LKwCKDeqgh5K7jKit
         mzzk+RjzT6jL/KmiMMTo6PJVMo+ffnz8APpzI8q2uVZFya914hZs/k/ZjqW00FaG3Fm2
         S8KMwKF6S6L8mv/34CzmhK7uJrxsvHUuflRntSPXKQ9/isGsJDy83rYEyAcDCCWiqKxr
         KYXA==
X-Gm-Message-State: AJIora9mQyr1666vS1KxXmSiBcy3UrJ9DXlbScUb6+Quud9hLJ6xrV6a
        PsZ13D2sWPtprTBZK4HOGHAB2g==
X-Google-Smtp-Source: AGRyM1s4mJkebVd1BUZ1G8+AyXL8Jw90XIt1uIm9DE2IvLP/GMGJYRLwLIGkffkSxGl2PWU8CPLPxw==
X-Received: by 2002:a63:d1e:0:b0:40d:379e:bff8 with SMTP id c30-20020a630d1e000000b0040d379ebff8mr5195266pgl.215.1656545708240;
        Wed, 29 Jun 2022 16:35:08 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm127305pjb.2.2022.06.29.16.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 16:35:07 -0700 (PDT)
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
Subject: [PATCH 3/9] platform/chrome: Add Type-C mux set command definitions
Date:   Wed, 29 Jun 2022 23:32:21 +0000
Message-Id: <20220629233314.3540377-4-pmalani@chromium.org>
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

Copy EC header definitions for the USB Type-C Mux control command from
the EC code base. Also pull in "TBT_UFP_REPLY" definitions, since that
is the prior entry in the enum.

These headers are already present in the EC code base. [1]

[1] https://chromium.googlesource.com/chromiumos/platform/ec/+/b80f85a94a423273c1638ef7b662c56931a138dd/include/ec_commands.h

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 include/linux/platform_data/cros_ec_commands.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8cfa8cfca77e..a3945c5e7f50 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5722,8 +5722,21 @@ enum typec_control_command {
 	TYPEC_CONTROL_COMMAND_EXIT_MODES,
 	TYPEC_CONTROL_COMMAND_CLEAR_EVENTS,
 	TYPEC_CONTROL_COMMAND_ENTER_MODE,
+	TYPEC_CONTROL_COMMAND_TBT_UFP_REPLY,
+	TYPEC_CONTROL_COMMAND_USB_MUX_SET,
 };
 
+/* Replies the AP may specify to the TBT EnterMode command as a UFP */
+enum typec_tbt_ufp_reply {
+	TYPEC_TBT_UFP_REPLY_NAK,
+	TYPEC_TBT_UFP_REPLY_ACK,
+};
+
+struct typec_usb_mux_set {
+	uint8_t mux_index;	/* Index of the mux to set in the chain */
+	uint8_t mux_flags;	/* USB_PD_MUX_*-encoded USB mux state to set */
+} __ec_align1;
+
 struct ec_params_typec_control {
 	uint8_t port;
 	uint8_t command;	/* enum typec_control_command */
@@ -5737,6 +5750,8 @@ struct ec_params_typec_control {
 	union {
 		uint32_t clear_events_mask;
 		uint8_t mode_to_enter;      /* enum typec_mode */
+		uint8_t tbt_ufp_reply;      /* enum typec_tbt_ufp_reply */
+		struct typec_usb_mux_set mux_params;
 		uint8_t placeholder[128];
 	};
 } __ec_align1;
@@ -5815,6 +5830,9 @@ enum tcpc_cc_polarity {
 #define PD_STATUS_EVENT_SOP_DISC_DONE		BIT(0)
 #define PD_STATUS_EVENT_SOP_PRIME_DISC_DONE	BIT(1)
 #define PD_STATUS_EVENT_HARD_RESET		BIT(2)
+#define PD_STATUS_EVENT_DISCONNECTED		BIT(3)
+#define PD_STATUS_EVENT_MUX_0_SET_DONE		BIT(4)
+#define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
 
 struct ec_params_typec_status {
 	uint8_t port;
-- 
2.37.0.rc0.161.g10f37bed90-goog

