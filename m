Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A654AAA45
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380506AbiBEQqC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Feb 2022 11:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60154 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380510AbiBEQqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Feb 2022 11:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644079560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nyxGUa1m1eMnb06QI5BCHdATsTFJoIUizeBAHNCds5E=;
        b=QMDpvCKUl6Th+YABTWt3GSVvpBdKZREkAh3jt/ptld5XnnR02X5tc4j/UqKG6/DHvxSx5Y
        0pvxr+d0dhGSZG+EdeFo4Ki06A8NVJtPYy9Nzphbfn7ml8EvJIx1UHoyoNkpB3xKWZ2Gw7
        OKK7t1RtnGGsPz7JK90c2VVauqof0So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-5nKhJvyeMZGQLKrLCbhM-g-1; Sat, 05 Feb 2022 11:45:55 -0500
X-MC-Unique: 5nKhJvyeMZGQLKrLCbhM-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9400B1091DA3;
        Sat,  5 Feb 2022 16:45:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 075072B4D2;
        Sat,  5 Feb 2022 16:45:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: [PATCH 7/9] phy: ti: tusb1210: Drop tusb->vendor_specific2 != 0 check from tusb1210_power_on()
Date:   Sat,  5 Feb 2022 17:45:33 +0100
Message-Id: <20220205164535.179231-8-hdegoede@redhat.com>
In-Reply-To: <20220205164535.179231-1-hdegoede@redhat.com>
References: <20220205164535.179231-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

