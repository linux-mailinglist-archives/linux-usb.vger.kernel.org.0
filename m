Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E003A8796
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 19:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhFOReU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 13:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhFOReT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 13:34:19 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D628C06175F
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 10:32:15 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id a4-20020a25f5040000b029054df41d5cceso5206698ybe.18
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 10:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=O2Nrrj9xXoMKaRCg57APzWi66P/7IsIGYrlkbQqeHys=;
        b=HCTQA3LhOBFMcnebLh802AH4yyFsQaSM6PDKeEem2QGWGHzV0VVbTuWKuA+bIqpFys
         50QmLl73EcryXb+Zcm75cxq4um/MtQl/6GxvecG/HfZnD+hlG9OUbXRQnmenNAca9tVy
         whycFOdCuC2mBl4szs+YanuV3hYvjRc0hBFbb0WbVVaH054Vwvj8X5BAcIeMub6dihFo
         8I6PrsZQZzWzmP20NA5dYNtt2BbXFZ/jYJvodJNHe+BVDysVJTkTzlpRELKRUkB7KyZm
         9iWbQPEieEJWHnTjutDFqkqpqqMkv8QAK5l7Qjxcd7wfYpX4ZwYXnlJQskBNYRAI9fuI
         J+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=O2Nrrj9xXoMKaRCg57APzWi66P/7IsIGYrlkbQqeHys=;
        b=mXBKfGb1GxEeRsYccBYP5E41OLv5O+uei68J9IeM81E2Ww6j8pupucE9VL3AZjkS0C
         Rtz1oZDgx8BzyN4rx9mHhk/r77l26l0m0NTo+q02EqjFw11Jvvl2Ii7vbi2bduGtjbnH
         Lfk6lkGEV8OiV1Dvg1OGbZeucw8NN05be/AziiPUIv2T0lFEQAq97DfQCmLLD4t8MSqq
         +HHmFgO9jS0ohyEp/9o0klAZONZfj2hASvMhrFbpGMrSZT+i0nv1EZnMinVaSzO7DGl/
         pRIo48M5Ws1ESIQPZoVz48KGAXvudTkxfUrvKVSwpTXueQOTuOHjMCvc2DSEHGRhvoIi
         7VGQ==
X-Gm-Message-State: AOAM533moI2IDcskC+sDCgXJmk5eyPIWVCtILWTdFtHiT45s7UFx9vHP
        9NyaNfc4HQ1EyUvfHqTWW4lg725fVbff
X-Google-Smtp-Source: ABdhPJzHlTT2KEs466gBdtcdD0cKscO5Xry/sQ03CBnORmzZbcRFCJGCP2BmRfKTLuuXIYMZ5fmWBDG0NLMv
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:8824:3d53:8367:ada5])
 (user=kyletso job=sendgmr) by 2002:a5b:ac9:: with SMTP id a9mr329288ybr.475.1623778334010;
 Tue, 15 Jun 2021 10:32:14 -0700 (PDT)
Date:   Wed, 16 Jun 2021 01:32:06 +0800
Message-Id: <20210615173206.1646477-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH] usb: typec: tcpm: Ignore Vsafe0v in PR_SWAP_SNK_SRC_SOURCE_ON state
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In PR_SWAP_SNK_SRC_SOURCE_ON state, Vsafe0v is expected as well so do
nothing here to avoid state machine going into SNK_UNATTACHED.

Fixes: 28b43d3d746b ("usb: typec: tcpm: Introduce vsafe0v for vbus")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 197556038ba4..e11e9227107d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5212,6 +5212,7 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
 		}
 		break;
 	case PR_SWAP_SNK_SRC_SINK_OFF:
+	case PR_SWAP_SNK_SRC_SOURCE_ON:
 		/* Do nothing, vsafe0v is expected during transition */
 		break;
 	default:
-- 
2.32.0.272.g935e593368-goog

