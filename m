Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E384B3B7B
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236165AbiBMNF5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236154AbiBMNF5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFD665B88F
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nyxGUa1m1eMnb06QI5BCHdATsTFJoIUizeBAHNCds5E=;
        b=EpSFf4TCiEphDM7fYxcBCR8LmIkXsAxvv6n+KvLPRkJLfpYLfs8BTjKi7Va1ZxG58OQkQw
        HYoqX4U+qVmOZ1gAm70Eke6eoJvxazLh/yEg0lmdmBGBVf3d+WBPnN5t1v9s9oZb016KCX
        Sb88NgJDDD75sv3pZpYxgJaFaDZLbL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-mXCl9Se7NH--KKeDbFlwxQ-1; Sun, 13 Feb 2022 08:05:48 -0500
X-MC-Unique: mXCl9Se7NH--KKeDbFlwxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A313F1091DA0;
        Sun, 13 Feb 2022 13:05:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB85A7B9DD;
        Sun, 13 Feb 2022 13:05:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 7/9] phy: ti: tusb1210: Drop tusb->vendor_specific2 != 0 check from tusb1210_power_on()
Date:   Sun, 13 Feb 2022 14:05:22 +0100
Message-Id: <20220213130524.18748-8-hdegoede@redhat.com>
In-Reply-To: <20220213130524.18748-1-hdegoede@redhat.com>
References: <20220213130524.18748-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit eb445a15fa69 ("phy: tusb1210: use bitmasks to set
VENDOR_SPECIFIC2") tusb->vendor_specific2 always contains a valid value
so there no need to check that it is set.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/phy/ti/phy-tusb1210.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index bf7793afdc84..04baed24469f 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -61,11 +61,8 @@ static int tusb1210_power_on(struct phy *phy)
 	gpiod_set_value_cansleep(tusb->gpio_cs, 1);
 
 	/* Restore the optional eye diagram optimization value */
-	if (tusb->vendor_specific2)
-		return tusb1210_ulpi_write(tusb, TUSB1210_VENDOR_SPECIFIC2,
-					   tusb->vendor_specific2);
-
-	return 0;
+	return tusb1210_ulpi_write(tusb, TUSB1210_VENDOR_SPECIFIC2,
+				   tusb->vendor_specific2);
 }
 
 static int tusb1210_power_off(struct phy *phy)
-- 
2.33.1

