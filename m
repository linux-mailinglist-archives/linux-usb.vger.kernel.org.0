Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03226743567
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 08:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjF3G5W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 02:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjF3G5U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 02:57:20 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A1910F8
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 23:57:19 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c118efd0c3cso1418242276.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 23:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688108238; x=1690700238;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hZ3wBkz2pxdTUS9/OQCSJauqcYuxtthvA5zABIfqeJs=;
        b=IHjNBLE8spNRlxeSzalRRO2ui4YRHwmxXkc+ASamvdb9CHOxn8qwnSEiqN1+mF7C1I
         65kVXy93Ko1Y/lEMFdRR+ZIxNX1TFNkeG34Xnis5jg9d0hoEGdOt9w0AQpFne6mShjAt
         P9FoTr3D5bkGN6Uhsybdnl/wjbGlbKxkniTkommrQ3mcVrTVSFMiHagDwxm/jHimrFva
         ckJ8+CSVgcLaA4zwAlsciWEVoIriv+4cFbHcrbQq93D0DOSMm103Hzoifcvl27VqzRiD
         Be0R5gQEKHBb7geFzHl2ZWZAYHckPDF6oBtMfIumcSlc3pBItBFY2E7ChuQVw7A1CaTs
         Puqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688108238; x=1690700238;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZ3wBkz2pxdTUS9/OQCSJauqcYuxtthvA5zABIfqeJs=;
        b=QfRm6DjEvKnB5gvH6dmYa1QebkLyY6KNc2osBkh1ABgMeJXse6b6Jya8poc0L4Yx3p
         WBTUgv3prBfcNTLIq4kuqWX7aCc2VcG6B8F7zbDwGpoO2rPEnHOeM8U7zVEVrYSla0sZ
         yu5T3Mfc1VgupdqURgeaIYxrxwRAixRssoNdJu7aO75K96wKqvFD//RbYNQsJrlV1VOH
         IKdIRAm4csjuFWw6ymIc1nPBHlrEQecpU/K6hJLyCO3LtLmTxLRVGT2QqVrw+heTEJrT
         modHJCw7YrCcy7SIpaB3e9VD1N9iknBu9pnCaGTvpQUQlumoZ0MrWMIASPTufTgNPXAA
         LL7Q==
X-Gm-Message-State: ABy/qLaa39kkfdOpu0IevDGOx6VPBZzm3JSadsfDfkd+S5H2ytZ6mXax
        C/bgVotBMcKKM/N2FnaWtp8PQDuaVfQ=
X-Google-Smtp-Source: APBJJlGQnXr8LdhGOtoxxO7nzmA+qzRWdfpj/MZ43yNUGq1KD/gmpUbEbaXsQjjANjBBl6atuvTUd8xkVKg=
X-Received: from hhhuuu.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:c80])
 (user=hhhuuu job=sendgmr) by 2002:a25:d158:0:b0:c42:6459:c45a with SMTP id
 i85-20020a25d158000000b00c426459c45amr2389ybg.12.1688108238655; Thu, 29 Jun
 2023 23:57:18 -0700 (PDT)
Date:   Fri, 30 Jun 2023 06:57:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230630065711.801569-1-hhhuuu@google.com>
Subject: [PATCH] usb: typec: tcpm: Add IS_ERR_OR_NULL check for port->partner
From:   Jimmy Hu <hhhuuu@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     kyletso@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jimmy Hu <hhhuuu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

port->partner may be an error or NULL, so we must check it with
IS_ERR_OR_NULL() before dereferencing it.

Fixes: 5e1d4c49fbc8 ("usb: typec: tcpm: Determine common SVDM Version")
Signed-off-by: Jimmy Hu <hhhuuu@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 829d75ebab42..cd2590eead04 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1626,6 +1626,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				break;
 
 			if (PD_VDO_SVDM_VER(p[0]) < svdm_version) {
+				if (IS_ERR_OR_NULL(port->partner))
+					break;
 				typec_partner_set_svdm_version(port->partner,
 							       PD_VDO_SVDM_VER(p[0]));
 				svdm_version = PD_VDO_SVDM_VER(p[0]);
-- 
2.41.0.255.g8b1d071c50-goog

