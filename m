Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA396711A4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 04:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjARDQY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 22:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjARDQM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 22:16:12 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB46953B0B
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 19:15:48 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id s3so22618793pfd.12
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 19:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6Nmv+LYCwyKz7IxuP+UAbM+JDcTFua08ajpNyDUaBs=;
        b=d5bcTVMutUWb/54X1gzoBRjTBH9fqf/rarYLU5qSC1kL31qNLUE1fl+vKYvsJIg5z8
         EwbSfVq+iIBaapvCmGN/s4o7U0vmorda3VPmuyDzadd6QiTl5a1BwhQ380X932Tg/xkw
         Br7ZEQZ520SFd8diIpzngQaaoI3LT5r55ah8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6Nmv+LYCwyKz7IxuP+UAbM+JDcTFua08ajpNyDUaBs=;
        b=rxPkOSZG28ajVIBpZNXgIG1UZl9fIF/BRDm2fLhOk8t4zJSRCrqKgs2fjld1Gm2PQs
         e/AXDjG/Wz0MoBlTJcSt+AbZKwaWj96aIr6vECyVT+YRsN3JAQooWZBL/tsXSLh4AFuG
         BYpzeTOZdbL455bJxFmcg0FWrypqlZXVY0X3g0ogBrfA3tjrN31RHrfAj3u3nQ0rrely
         Ulb8B52e4PZ05Kg6GqfjNmMGY8yTsAP4XzkRzzmXuhRA545kPTLtxdGpwKH3aFWWXgc3
         alRSEDA/6/qmcVqnzEq/vrH7/Jxy9C5NlpuEIfa0viasmAdNKdIRUyNijkhjlZQ7/2Be
         Pc/A==
X-Gm-Message-State: AFqh2krZiKsSFdowD9o3mKqZofOyvw0u3F8uSKUYXMwpQ+njCRgHC7l1
        ATj/HWFHc4gi8xYFtJDqFUP/CdOiz9dat6i7
X-Google-Smtp-Source: AMrXdXsOQeS3t4ErMoE9xwak7urM3SDhQEm2uLXFotJ0LP0sODvEdRLlprVhmv63yLjfx6z7xaX/lA==
X-Received: by 2002:a05:6a00:10:b0:576:a74a:13c3 with SMTP id h16-20020a056a00001000b00576a74a13c3mr7030686pfk.1.1674011747037;
        Tue, 17 Jan 2023 19:15:47 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id f11-20020aa79d8b000000b0058dd9c32fcasm1204409pfq.180.2023.01.17.19.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:15:46 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        stable@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: altmodes/displayport: Update active state
Date:   Wed, 18 Jan 2023 03:15:15 +0000
Message-Id: <20230118031514.1278139-1-pmalani@chromium.org>
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

Update the altmode "active" state when we receive Acks for Enter and
Exit Mode commands. Having the right state is necessary to change Pin
Assignments using the 'pin_assignment" sysfs file.

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Cc: stable@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 06fb4732f8cd..bc1c556944d6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -277,9 +277,11 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 	case CMDT_RSP_ACK:
 		switch (cmd) {
 		case CMD_ENTER_MODE:
+			typec_altmode_update_active(alt, true);
 			dp->state = DP_STATE_UPDATE;
 			break;
 		case CMD_EXIT_MODE:
+			typec_altmode_update_active(alt, false);
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			break;
-- 
2.39.0.314.g84b9a713c41-goog

