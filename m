Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAB073A439
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 17:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbjFVPFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 11:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbjFVPFC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 11:05:02 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1602AE7E
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:04:55 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-565a33c35b1so88477287b3.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687446294; x=1690038294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HP4+YvUJVAPeSikWLLN9lmrDsE6bkUx0eYDaGV1KtY=;
        b=KVoocYmnlhWTcw1lpk8n+2IXXtKbUtQpLc1W6m42G16fgk/46hQ24ls0r0EQJLHur8
         yi/2LxA0+duj7u/xyHLD2V+A9au+OpYQ5X5LOBaK7Eus9D3VJSr++d3qxu5VPTKcnYLd
         KsVUSfEZTrtYiWxSoHnHUbjM+rBdnkc/8HdJ7hYuGnau5poq/Xk/4LUpIXMeDp/4/5f4
         P3lmmusCUD0TDns0/jFuTafZF1gDDAsvnosK9q/2mMD4M0M11llif0owUxVojq9vx+kX
         5kmYk5e+yeRWtOKTvav3QYIHC3ZzjYLPL7f+yvmDTFP621TuKCGjiYHqAqskSEgoK9D7
         4KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446294; x=1690038294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HP4+YvUJVAPeSikWLLN9lmrDsE6bkUx0eYDaGV1KtY=;
        b=DN7Km4yBBHPd2Hcgidty8em1eSdUU68RE38uhEcwjMtm8JAJq61H3VH7aBsZVhpOKV
         2idlKG8GfFIlVk96nkmQT+TExIdAiHbhcCwJNcxY87+P1C3svuKpQgZfQfa4UQGd9Y2a
         xdgpX9LAiI5qeg2NX00zH5beOtqIxS/fEdl92UTiVl8ZtX084wpTc0Q9Cv7LJ55zj8FW
         cIR6BBoxyXfKYuVSgCB/T/28x1LcCj28RBsKS+rizO+rDBpwVQ/6z5rNcbIAyo5CypyE
         u/VWlx0ZFqfoP9SZWYmtLM3VSjsi7TfKnGu3l6dv+/RHIvgnCqYxjROjwzpE7lpF5K1P
         beYA==
X-Gm-Message-State: AC+VfDy9wCJwO5KXgqqmxFovnlxktIJlE8DvxyNhqOLqUZ/DdmywGVfF
        0+c5wewdDfi4e5PrIVSKOuw6crYguEL3
X-Google-Smtp-Source: ACHHUZ496dL12nzIYLBFIu7BX5QCmCLSyZn7xI5fg8prNXpCnYIZvjhBPUphoZKuZ//HYYoKQleHSuToMCWm
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:b1ba:4098:b043:5e54])
 (user=kyletso job=sendgmr) by 2002:a81:4318:0:b0:565:9bee:22e0 with SMTP id
 q24-20020a814318000000b005659bee22e0mr7091813ywa.0.1687446294377; Thu, 22 Jun
 2023 08:04:54 -0700 (PDT)
Date:   Thu, 22 Jun 2023 23:04:23 +0800
In-Reply-To: <20230622150423.3726894-1-kyletso@google.com>
Mime-Version: 1.0
References: <20230622150423.3726894-1-kyletso@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230622150423.3726894-4-kyletso@google.com>
Subject: [PATCH 3/3] usb: typec: Use sysfs_emit_at when concatenating the string
From:   Kyle Tso <kyletso@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
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

The buffer address used in sysfs_emit should be aligned to PAGE_SIZE.
Use sysfs_emit_at instead to offset the buffer.

Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index e7312295f8c9..9c1dbf3c00e0 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1288,9 +1288,9 @@ static ssize_t select_usb_power_delivery_show(struct device *dev,
 
 	for (i = 0; pds[i]; i++) {
 		if (pds[i] == port->pd)
-			ret += sysfs_emit(buf + ret, "[%s] ", dev_name(&pds[i]->dev));
+			ret += sysfs_emit_at(buf, ret, "[%s] ", dev_name(&pds[i]->dev));
 		else
-			ret += sysfs_emit(buf + ret, "%s ", dev_name(&pds[i]->dev));
+			ret += sysfs_emit_at(buf, ret, "%s ", dev_name(&pds[i]->dev));
 	}
 
 	buf[ret - 1] = '\n';
-- 
2.41.0.162.gfafddb0af9-goog

