Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B5256D6BC
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jul 2022 09:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiGKHZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jul 2022 03:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiGKHZp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jul 2022 03:25:45 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BA013F6D
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 00:25:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id cp18-20020a17090afb9200b001ef79e8484aso5111652pjb.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4zksFMUl75dVs5Pjq0iM/EMwPszh5Co7nc8XI1GOhs=;
        b=IEN1LCM5zf9fZ7Qk08bWt9IDa0Crk6nzfQCotGqrc0uJNhcNPoquj3E9BllvyZaGh9
         eGFiEHy+PzH6iCO9M44fm5sNX6UmCWxQQ4uCvLyUWV7qbecXW9sf87487Os8xk/Oj10M
         D3WxilsHS1OOU934G5LFezt+V0ON6llaZh3sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4zksFMUl75dVs5Pjq0iM/EMwPszh5Co7nc8XI1GOhs=;
        b=3aQ11zGeR/hFYiz2XA4NdvBVMwOZxlVSvMu6yBQeots7Cg+YWIIFv6WA+e0UtO11Xy
         d+JbHEz4QX6miW+Fe/+/hS8KsxS5ns5k3rXRT7i/tA4DT17cJH063VQq8fb6Zsh2F273
         h8AMK3yd+//gDH7RZyfm/UDJ5TQ9smS6WK7JFP7GKFi3uvgEdlZamsPsQxktrQTRLRxG
         F2dePeVdjXpfay1Ti8BdvH5IIO+e0TCqrkBTksdWqBe/UF8FgBLAXdMSdJVfhvk+EWSN
         hcnSa+pF1kecC2T71yzmS2KVaTZ5dLR6rP4GuprppHGJpfA6Sy/2JQJif4fVkF4d27aJ
         gL+A==
X-Gm-Message-State: AJIora/DbJHXonQrRk5mf8VHxdb9L/mHkvTl25eYQjNO3Df8p1JBQrhZ
        1jMD1ORn1bgeIDoUvvf4lIRiig==
X-Google-Smtp-Source: AGRyM1uU1hJ8LwZ7cO9JNfbmNoCYrstU4XPCCUFD4FYNuUV581UTkznx+Y27/SCWZUdDqxYRZs7b2A==
X-Received: by 2002:a17:903:28e:b0:16a:3bea:11eb with SMTP id j14-20020a170903028e00b0016a3bea11ebmr16914760plr.154.1657524344434;
        Mon, 11 Jul 2022 00:25:44 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b0051bc5f4df1csm4012839pfq.154.2022.07.11.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:25:44 -0700 (PDT)
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
Subject: [PATCH v4 3/9] platform/chrome: Add Type-C mux set command definitions
Date:   Mon, 11 Jul 2022 07:22:57 +0000
Message-Id: <20220711072333.2064341-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220711072333.2064341-1-pmalani@chromium.org>
References: <20220711072333.2064341-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

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
2.37.0.144.g8ac04bfd2-goog

