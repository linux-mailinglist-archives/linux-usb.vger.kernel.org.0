Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722434B3B79
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbiBMNFx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbiBMNFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1100D5B88E
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ExCn8bXEYj3Fheat2o3eV3w8opytI1zAavJnEA3goSo=;
        b=T8eAbNCvCZMo9vEEgC6woNy55GY3V2gJzYWEXbwLjDoPDzXHaiAISTaDdJ4VzxF7LRRFyS
        UuQ7/gn6SyawuvVjNl9SL6efrRY6THShZDfHOibhsy4v2pLjAJxyojc7UBXqgkNJx3dkCr
        sa+TnetFfZWCsDk0VmtinpeCY1ecoFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-tyvfqWU1NcitPoG9rrM_9g-1; Sun, 13 Feb 2022 08:05:44 -0500
X-MC-Unique: tyvfqWU1NcitPoG9rrM_9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF1A7184608A;
        Sun, 13 Feb 2022 13:05:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 37E2D7B9DD;
        Sun, 13 Feb 2022 13:05:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 5/9] usb: dwc3: pci: Also apply Bay Trail GPIO mappings to ulpi-device
Date:   Sun, 13 Feb 2022 14:05:20 +0100
Message-Id: <20220213130524.18748-6-hdegoede@redhat.com>
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

In order for the phy driver to be able to actually get and control
the cs and reset GPIOs the dev_id member of the gpiod_lookup table must
be set to point to the dev_name() of the ulpi-device instantiated by
dwc3_ulpi_init().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 8deccf0aa5e7..fdcf552a6365 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -252,6 +252,14 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc,
 				usleep_range(10000, 11000);
 			}
 
+			/*
+			 * Make the pdev name predictable (only 1 DWC3 on BYT)
+			 * and patch the phy dev-name into the lookup table so
+			 * that the phy-driver can get the GPIOs.
+			 */
+			dwc->dwc3->id = PLATFORM_DEVID_NONE;
+			platform_bytcr_gpios.dev_id = "dwc3.ulpi";
+
 			/*
 			 * Some Android tablets with a Crystal Cove PMIC
 			 * (INT33FD), rely on the TUSB1211 phy for charger
-- 
2.33.1

