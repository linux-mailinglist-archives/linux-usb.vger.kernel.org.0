Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7504173BB46
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jun 2023 17:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjFWPMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jun 2023 11:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbjFWPL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jun 2023 11:11:26 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E785630CA
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 08:11:00 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c005a8ca4d9so1191253276.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687533051; x=1690125051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWOe4G+wpmnb5gd06s9NrCHMZgll/w3qfqnd7bhy3bc=;
        b=Jj/yxG+yIyl39+9PshdtRNnQl83V3MTYlDVNl2fs3iI/PzAP7RW+vmUWf0Jq5kskqI
         MAqHQHyV+XcyIU9ROSTPZNbAKeZgucUc5lJA+Ow7aq/A3kQADTei3VqyDa2QfhEXO7Fb
         Vxzr+Hk82hDzH1ANycuG1Xy1obuPKlPXDgzYTLk9o3FL51Vxv2xG8PC/KVsmp9iXTCei
         7vaUP0erVNLILVods2i8ukaat4uzp0cG1UyEq2usWryDXM9FjjY/i/XIX85UAKX+lVIL
         BxRL/43kV2S06krC83sjJwXjNCJcIH6hGMkQznNvpQGS8xagGSm86mf6Hcy91QxwV64z
         lmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533051; x=1690125051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWOe4G+wpmnb5gd06s9NrCHMZgll/w3qfqnd7bhy3bc=;
        b=Sl4pUObaJluL+0ljvczIx16ywa6Zpw8/C4NiwbCmX61q+n22jxH+Nx/ygRDh8Ofs7w
         wGVLgGXC27PhsVkQezRku2rdIXWVoAtYOAO4kbpdhBtlbcd3Ectj2gERS9IcpMqJBMcE
         n17zhDJCktfuDLDLXG63hmOgu3PTVC3U0fd8IiJPWw0vyBUCDCPrmVpPPIgZSoU2rw3F
         FnzHNhwnDbODsClgkfjTeFFQ2x6see7T9sXeLdFenRuAJCkL2UDb7V5rNUizy8p2+uL2
         PEhtIQqU29fS/pESL+YmTtlxEgktYBWnALY+vCwq6SNWzMmYFDQXNAndDI4sxDF2vwwD
         75bg==
X-Gm-Message-State: AC+VfDwRXDwHVCJRv0+tCwVrUIhTXmMemCeH9ETH8MJYGvSzUWUtFEy9
        7l+SZDBTcfFo3at75sgq5uX/WhBgi5Jy
X-Google-Smtp-Source: ACHHUZ4gPafdv3C+UoOxNcOU9t72cQxJhDlpjLvIlSWm84SE09aIWG7IELM5dB5Eknx0Q3cgRbrtrnpXFHvV
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:5d47:84a:2819:bba4])
 (user=kyletso job=sendgmr) by 2002:a25:6989:0:b0:ba8:9096:df50 with SMTP id
 e131-20020a256989000000b00ba89096df50mr3687174ybc.9.1687533051741; Fri, 23
 Jun 2023 08:10:51 -0700 (PDT)
Date:   Fri, 23 Jun 2023 23:10:35 +0800
In-Reply-To: <20230623151036.3955013-1-kyletso@google.com>
Mime-Version: 1.0
References: <20230623151036.3955013-1-kyletso@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623151036.3955013-3-kyletso@google.com>
Subject: [PATCH v2 2/3] usb: typec: Iterate pds array when showing the pd list
From:   Kyle Tso <kyletso@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pointers of each usb_power_delivery handles are stored in "pds"
array returned from the pd_get ops but not in the adjacent memory
calculated from "pd". Get the handles from "pds" array directly instead
of deriving them from "pd".

Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
Update v2:
- Add "Cc: stable@vger.kernel.org"

drivers/usb/typec/class.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 3b30948bf4b0..e7312295f8c9 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1277,8 +1277,7 @@ static ssize_t select_usb_power_delivery_show(struct device *dev,
 {
 	struct typec_port *port = to_typec_port(dev);
 	struct usb_power_delivery **pds;
-	struct usb_power_delivery *pd;
-	int ret = 0;
+	int i, ret = 0;
 
 	if (!port->ops || !port->ops->pd_get)
 		return -EOPNOTSUPP;
@@ -1287,11 +1286,11 @@ static ssize_t select_usb_power_delivery_show(struct device *dev,
 	if (!pds)
 		return 0;
 
-	for (pd = pds[0]; pd; pd++) {
-		if (pd == port->pd)
-			ret += sysfs_emit(buf + ret, "[%s] ", dev_name(&pd->dev));
+	for (i = 0; pds[i]; i++) {
+		if (pds[i] == port->pd)
+			ret += sysfs_emit(buf + ret, "[%s] ", dev_name(&pds[i]->dev));
 		else
-			ret += sysfs_emit(buf + ret, "%s ", dev_name(&pd->dev));
+			ret += sysfs_emit(buf + ret, "%s ", dev_name(&pds[i]->dev));
 	}
 
 	buf[ret - 1] = '\n';
-- 
2.41.0.162.gfafddb0af9-goog

