Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC99D76FC75
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 10:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjHDIt7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 04:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjHDItg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 04:49:36 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B39449FC
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 01:49:34 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d27ac992539so1923308276.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Aug 2023 01:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691138973; x=1691743773;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gVdby9fmLEkjJnkZzSNTGr6ljGbqKt84vW1JgbQNcjk=;
        b=S+6Q8/L0x65Y2p1fWi+U0baqtQXkFAKPoqTJpBmC1V9/bMyOfVBCjqu+wC72cLPs3P
         Zdr6lcvQ+01L/Xv+xTqL/O64ZSDbiVoWt0wnHU0ALucGt1pBYDtwumgfzPaZ4oSIcpS6
         klvxBMI+Cm7nw/kpDf3mDcd9o3kJZRVsWjCBn70mJFv5xv590tCM6/A4UD9oA/hGtJ26
         ptagvhH4cSHXNmZvnVcR++dIw/mmUTnZRXoGDW/3CToGkTz5vafVHbY6x4HE8MEDuQ1w
         Uioo+dCxZAUFlq60/bg/g+scdsTHuKZiU3t4dpVp/0EkrwtlxSyOt2w5Or/3LT3Dd6Re
         Jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691138973; x=1691743773;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVdby9fmLEkjJnkZzSNTGr6ljGbqKt84vW1JgbQNcjk=;
        b=DItH4C/9qpx6fmCsGvEeS/xS5F0klMpmBD0ofcOZGlT0fQw/FHX+QNsFe/2MNe/MWd
         OSyFf3N059amhjQUV5p/0hC60CNNUZr1lzcK7HTTdrIBc8Zq6/yp1q5Z6Ubv1/0ryUI1
         AatTDGU5wf7vkBbZfUQqUN6xm6bvlIHkIShDy7mKwciSDWF+NhMfqQ3C4tRjOELLAPY8
         edHDzGpgtd+1QADV4TBjZESmctVj/FR/6ZjqFv+hr8ZkY4t9MXC9IPclHnXANEfFYeH2
         0PEQhkcXA4MqBsMG3nMHlLJIBuh5HYUe/74Sfa0CpzZ3JjbnCHu9W7cwwKAHD84RGNw/
         P6WQ==
X-Gm-Message-State: AOJu0Ywg85l7Q7cE9+049YXGoCkl3baKfk4rSCsqCEq8+d3nmJxFlBc6
        BbqJzlxpyJe3uHaMxHlI4/JbS2yAGzU=
X-Google-Smtp-Source: AGHT+IF1vKvv6JSxcEWnimybXppg+eoe3zGd/l8LH8Ur4fREiz8+FhnlY8Znc8hLrTDTkj3P1dEFTa4ZkR0=
X-Received: from hhhuuu.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:c80])
 (user=hhhuuu job=sendgmr) by 2002:a05:6902:1363:b0:d0d:cce3:d32d with SMTP id
 bt3-20020a056902136300b00d0dcce3d32dmr4670ybb.6.1691138973340; Fri, 04 Aug
 2023 01:49:33 -0700 (PDT)
Date:   Fri,  4 Aug 2023 08:49:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230804084928.1153600-1-hhhuuu@google.com>
Subject: [PATCH v2] usb: typec: tcpm: IS_ERR_OR_NULL check for port->partner
From:   Jimmy Hu <hhhuuu@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     kyletso@google.com, badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jimmy Hu <hhhuuu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

port->partner may be an error or NULL, so we must check it with
IS_ERR_OR_NULL() before dereferencing it.

Move the check to the beginning of the tcpm_handle_vdm_request function.

Fixes: 5e1d4c49fbc8 ("usb: typec: tcpm: Determine common SVDM Version")
Signed-off-by: Jimmy Hu <hhhuuu@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 829d75ebab42..2c6a0af155ab 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1683,10 +1683,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			      (VDO_SVDM_VERS(typec_get_negotiated_svdm_version(typec)));
 		break;
 	case CMDT_RSP_ACK:
-		/* silently drop message if we are not connected */
-		if (IS_ERR_OR_NULL(port->partner))
-			break;
-
 		tcpm_ams_finish(port);
 
 		switch (cmd) {
@@ -1792,6 +1788,12 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	u32 response[8] = { };
 	int i, rlen = 0;
 
+	/* silently drop message if we are not connected */
+	if (IS_ERR_OR_NULL(port->partner)) {
+		dev_warn(port->dev, "port partner is an error or NULL\n");
+		return;
+	}
+
 	for (i = 0; i < cnt; i++)
 		p[i] = le32_to_cpu(payload[i]);
 
-- 
2.41.0.585.gd2178a4bd4-goog

