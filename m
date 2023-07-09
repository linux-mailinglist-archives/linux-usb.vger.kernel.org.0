Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EA974C80A
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jul 2023 22:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjGIUNP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 16:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjGIUNO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 16:13:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF6912E
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 13:13:12 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso59119801fa.0
        for <linux-usb@vger.kernel.org>; Sun, 09 Jul 2023 13:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688933591; x=1691525591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7lSjPQNhr0BWjor5LdaN815hU/chfe4hoYUxqnTCAI=;
        b=T5GzhtTyJjxGyLP24p+UvR8XLrB4NVRE7/XTXnHdYuT77xZjInL1SKJoXJXffjIa3e
         hUxY+aw8lZWYqavxNLsCk072IIDUzC27HS4WGJjZhXR6GsfqE10BM1LBkwHterRl5vYD
         ZZpRxt9ZEOzVu8OD6ELJrTwnL7hAce86y6Zu3nEHY41nQRqGO4d2lL6oczaA5sMUXdGZ
         tTI72OzMVuaNd9VhQlcEkzCJSz3O24Yxw8ShDUL5aJ40jVI19BKcsNB816PUuO2Xrh+A
         p5v5DPBxmn7jF+kjqdLcVz+cBYXAEdUdI6eg8XjNXCEM+dl+kHMyU/d/B8Rk+6zwPitS
         WvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688933591; x=1691525591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7lSjPQNhr0BWjor5LdaN815hU/chfe4hoYUxqnTCAI=;
        b=LSM2pq+jwDrqK6GRRD3oDE4HB1ntwaAlFo0B9+SCPJlHUrbgzXiV3wS/t0L6JkFHPx
         aoRYpMXn8l2klCngh58kOV09+ItamNaB/85qca8G7P+2w0VmhT7VQa8Oe/tHshFJGs9z
         rVreUnVhb6jzPBgALgFRN+Uuyw8Vnrq0ZGXdNo5l9OEWoOrW3bBxZ1PGKOFkslvT3McJ
         sAcfErgfM5Zszc6cu+Re8Lz0E4SDiXO7qrfSqy87NebGjE+aKVAyTxu5uSO4ToBcOmNH
         bYhhl/gCmfA6nUkPT56uh//umA58KMrQjOMtMXdB27+E6vt5VxHtnl7gphjM4JzTLqXI
         FJVA==
X-Gm-Message-State: ABy/qLbVdGj11uWaBELi5qNAUXJwr8hi0F8UmpazUuOLmk4hSCw9g/5Q
        a26VzwkTWUZyV3KvZijO0jB60g==
X-Google-Smtp-Source: APBJJlFZuEiOyJs+Wxo5yotGxmFY/kIczdsa1ko9Q5u26MRMkHnsWnGRIo9a62sNAbznJh5fjeHpqw==
X-Received: by 2002:a05:6512:3295:b0:4f8:770f:1b0b with SMTP id p21-20020a056512329500b004f8770f1b0bmr7078397lfe.33.1688933591071;
        Sun, 09 Jul 2023 13:13:11 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id c12-20020ac2530c000000b004fb77d6cab3sm1420378lfh.261.2023.07.09.13.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 13:13:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] usb: typec: altmodes/displayport: add support for embedded DP cases
Date:   Sun,  9 Jul 2023 23:13:08 +0300
Message-Id: <20230709201309.274306-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709201309.274306-1-dmitry.baryshkov@linaro.org>
References: <20230709201309.274306-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the embedded cases, the DisplayPort connector is handled by the TCPM
itself. Fallback to the controller fwnode for HPD notifications to
support such usecases without requiring additional DT properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/altmodes/displayport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 4e5aa17ce4c8..699438c7755e 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -578,7 +578,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	alt->ops = &dp_altmode_ops;
 
 	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
-	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	if (fwnode_property_present(fwnode, "displayport"))
+		dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	else
+		dp->connector_fwnode = fwnode_handle_get(fwnode); /* embedded DP */
 	if (IS_ERR(dp->connector_fwnode))
 		dp->connector_fwnode = NULL;
 
-- 
2.39.2

