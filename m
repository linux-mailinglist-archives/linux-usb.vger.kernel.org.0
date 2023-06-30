Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82335743A46
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 13:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbjF3LFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 07:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbjF3LFC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 07:05:02 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9497A3C23
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 04:04:30 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76243a787a7so169677585a.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688123069; x=1690715069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNa2jhHKlTe8HWrkGdDm3aUlIAQe4cmAyfQyFrrhTfc=;
        b=kGYQRxBov2CyhQNstEIg5lLvZbNwsSf1gnQYnGQmK2nccjDLe8tf7oVi3OXESw9lL9
         K9v81fuu4rNIyiob2dbi0vKY6Fy4wmGgad22z6HAP4lA0PrCiy4Wr8Nf3fx9yxkuQhj4
         vJXKLQ96u9OMwfHofK4RqhLrXcc3iHBU3s0utbeW3mYDl34D2Oumw0ipBCm3pDw43VA5
         /FAa7q1cqNjKyu04TNNDfnJ96Y7GKHrC61c3ydzQP94AUeMkzDmftAJTCqdOIC2c/kab
         jc1wGQkx1uy26d2oHmU6MGEacCUD5Pf9b7VcUPMnFCNojmoynM6NfIeTw+gUfPVZpqS0
         6gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123069; x=1690715069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNa2jhHKlTe8HWrkGdDm3aUlIAQe4cmAyfQyFrrhTfc=;
        b=QAW8ADAbQIDDuNHeORnfMyQ/kTLkGA+RvHx7G4ZV0a/vsm84URQAhNm50c7coYfttF
         uIx9/o18lCUYYzChRByn6ghfmkP13lmAsucHEcq9ug+mEGxKqVIqLBuAQdsoxFWnxAIL
         ilLfSHE2+LXXhN2o4fFkG6V+BG/5xS74x4fjRbMAdkghMdJp5XBCF9VXLlP6UwZ0GBJ8
         VniofJXhLZM7BDm3T5D6jTr0vCK6fj8b3Trk18QkczGJ5IM184NUNzqmPR2ZWeV+MuCK
         GldPgnFFjkPis08xB7X93C/EbC2N0k4g8o3m/D7jD7dnYKT0n7uE9Og/fMpkh0zoAAdX
         XBhA==
X-Gm-Message-State: ABy/qLZrwhX7U62qwoShlmLV//wC7T/4Dj9G7BJhBN3CwQUjzV8ts4JN
        Ll9sQ9gr+94fTr9KbOO4nrI=
X-Google-Smtp-Source: APBJJlEUd/C+Gqe5xbab+Mp8OTZKfGeZ/gmXam2lRfmhAN8dHCH2+9aRPVqihHCbCEis/ZWYaaCMCg==
X-Received: by 2002:a05:6214:29ee:b0:630:6926:d00e with SMTP id jv14-20020a05621429ee00b006306926d00emr2789055qvb.39.1688123069637;
        Fri, 30 Jun 2023 04:04:29 -0700 (PDT)
Received: from chcpu17.cse.ust.hk (fc3kcs10.cse.ust.hk. [143.89.191.124])
        by smtp.googlemail.com with ESMTPSA id m6-20020a0c9d06000000b0063659410b04sm435711qvf.107.2023.06.30.04.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:04:29 -0700 (PDT)
From:   Yiyuan Guo <yguoaz@gmail.com>
To:     gregkh@linuxfoundation.org, dan.scally@ideasonboard.com,
        andriy.shevchenko@linux.intel.com
Cc:     frank.li@nxp.com, christophe.jaillet@wanadoo.fr, jgilab@gmail.com,
        chanh@os.amperecomputing.com, linux-usb@vger.kernel.org,
        yguoaz@gmail.com
Subject: [PATCH] usb: gadget: configfs: Prevent buffer overrun in usb_string_copy
Date:   Fri, 30 Jun 2023 19:04:01 +0800
Message-Id: <20230630110401.2360746-1-yguoaz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In usb_string_copy(), when `strlen(s) == 0`, `str[ret - 1]` accesses at
index -1. Add a check to prevent buffer overrun when `s` is empty.

Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
---
 drivers/usb/gadget/configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 4c639e9ddedc..457dbc267964 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -127,7 +127,7 @@ static int usb_string_copy(const char *s, char **s_copy)
 			return -ENOMEM;
 	}
 	strcpy(str, s);
-	if (str[ret - 1] == '\n')
+	if (ret && str[ret - 1] == '\n')
 		str[ret - 1] = '\0';
 	*s_copy = str;
 	return 0;
-- 
2.25.1

