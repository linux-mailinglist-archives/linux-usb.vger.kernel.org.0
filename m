Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF46D6CF5AC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 23:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjC2Vws (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 17:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjC2Vwi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 17:52:38 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6AC6A78
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 14:52:27 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5411f21f849so169235387b3.16
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680126746;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CsFO/UcDyqF5hzYyaOpux0kSInGSNXB7fWOr/Mojtdc=;
        b=RHxHrD0riHQdNklAwbOyOVwMytX1Zqo4yL4S28/sbh6YsGl3q09hPtWIUDRbdZr9ge
         rgU4I6Ln1QlZaq7jeYhT3hOzGtJwdorkfUBHDkIXV2DJ0tzCFN/N4umhnogf4N+OcQL4
         TfjA3qSdao6/K6doCajwtW7tly3qsDVnoh8E14Ga3rEveQXWEBcQIyd/W46QOcOVdWTY
         pCthXDCjjmoI3+xsjKACJfQWXu4fLyBQDLQIVaK/CoS+6mj3NZM37nUrhMu3ad8JFeZm
         wZNlQDVTLRDobPBGxfA2OAZ0N/IbVDrNFcI217dNNH2JYWvcdvwN/JS+GalbnM9rvp3r
         oUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680126746;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CsFO/UcDyqF5hzYyaOpux0kSInGSNXB7fWOr/Mojtdc=;
        b=FRRL1DE9TbLY/W3TCJuQPUYEcL7BMudmUo2gYFsflhno+E5y0Qe0/oJhOWMhLt2qKA
         1k4P/Bb7qrs/KPewBgpwxnxnm18DWtxfEA2F4z+i3P3JBjrhOr7BOeGbUTu1YfdV2Vf4
         oodBEud1EaA9lB7VQ16lkFchlGJ/+jsqEUysJXEMYchAmJPE7rlTo3/zefF+HC33guke
         e1Jfq4DW7bV2lpJJE8zbRYpqhsvBFxpNjTYpCWEVbxlTXXfibH3Xz6jAjzdRl+zmebhb
         HdxyqQNFiBGwYyZWh7LZCa1lUZezUlLWWP7JarnF7edbUIe9x8XS3BsVwBrmW63J1qRS
         iStw==
X-Gm-Message-State: AAQBX9cIBOmmzEqsqXg1/aoLlePmcKirsVYnjzw+PFxUzXrWaA8ReNcG
        5J4zcNVbXndGMu6IIcjxPNxburs56uNH5Yg=
X-Google-Smtp-Source: AKy350YKLD0cYnhPAs3bUyHqq7zxakvTmmcso2sSBuLkCH7jFi1VvPjsAnG4V9XxwVaWzeCZqxDyYEFYB8svaNg=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a05:6902:168d:b0:b26:47f3:6cb with SMTP
 id bx13-20020a056902168d00b00b2647f306cbmr10969166ybb.4.1680126746160; Wed,
 29 Mar 2023 14:52:26 -0700 (PDT)
Date:   Wed, 29 Mar 2023 21:51:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230329215159.2046932-1-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: altmodes/displayport: Fix configure initial
 pin assignment
From:   RD Babiera <rdbabiera@google.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While determining the initial pin assignment to be sent in the configure
message, using the DP_PIN_ASSIGN_DP_ONLY_MASK mask causes the DFP_U to
send both Pin Assignment C and E when both are supported by the DFP_U and
UFP_U. The spec (Table 5-7 DFP_U Pin Assignment Selection Mandates,
VESA DisplayPort Alt Mode Standard v2.0) indicates that the DFP_U never
selects Pin Assignment E when Pin Assignment C is offered.

Update the DP_PIN_ASSIGN_DP_ONLY_MASK conditional to intially select only
Pin Assignment C if it is available.

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 662cd043b50e..8f3e884222ad 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -112,8 +112,12 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
 		if (dp->data.status & DP_STATUS_PREFER_MULTI_FUNC &&
 		    pin_assign & DP_PIN_ASSIGN_MULTI_FUNC_MASK)
 			pin_assign &= DP_PIN_ASSIGN_MULTI_FUNC_MASK;
-		else if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
+		else if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK) {
 			pin_assign &= DP_PIN_ASSIGN_DP_ONLY_MASK;
+			/* Default to pin assign C if available */
+			if (pin_assign & BIT(DP_PIN_ASSIGN_C))
+				pin_assign = BIT(DP_PIN_ASSIGN_C);
+		}
 
 		if (!pin_assign)
 			return -EINVAL;

base-commit: 97318d6427f62b723c89f4150f8f48126ef74961
-- 
2.40.0.348.gf938b09366-goog

