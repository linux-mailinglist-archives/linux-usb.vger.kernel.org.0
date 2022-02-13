Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F384B3B77
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236150AbiBMNFw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbiBMNFv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6EDD25B88E
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0lIKP4e+Cty+i9AK+PrpEMunk31JuGZR+3dEheWS9AA=;
        b=Clr4w3XRtOlLCoii5eC22EQIGREwT2tDG5sm4QaFApyzn9XBP9i/Qr6o9hpV3n/1T0A8QQ
        a7z2d6uo1SHRJQkM7w5UrXTb/e4tzHPupv+hwBgC92AooZhgn8GQrRkQbBCXUBVw0ZCJY7
        2c/3YsFxaBjFlTZWrkgLiootcWAAznI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-nEOT2FljMY2o53ufDLoSnQ-1; Sun, 13 Feb 2022 08:05:40 -0500
X-MC-Unique: nEOT2FljMY2o53ufDLoSnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1025F814245;
        Sun, 13 Feb 2022 13:05:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7965E7B9DD;
        Sun, 13 Feb 2022 13:05:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 3/9] usb: dwc3: pci: Set the swnode from inside dwc3_pci_quirks()
Date:   Sun, 13 Feb 2022 14:05:18 +0100
Message-Id: <20220213130524.18748-4-hdegoede@redhat.com>
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

The quirk handling may need to set some different properties
which means using a different swnode, move the setting of the swnode
to inside dwc3_pci_quirks() so that the quirk handling can choose
a different swnode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 1ecedbb1684c..40a3a1b114e9 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -184,7 +184,8 @@ static const struct software_node dwc3_pci_amd_mr_swnode = {
 	.properties = dwc3_pci_mr_properties,
 };
 
-static int dwc3_pci_quirks(struct dwc3_pci *dwc)
+static int dwc3_pci_quirks(struct dwc3_pci *dwc,
+			   const struct software_node *swnode)
 {
 	struct pci_dev			*pdev = dwc->pci;
 
@@ -241,7 +242,7 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc)
 		}
 	}
 
-	return 0;
+	return device_add_software_node(&dwc->dwc3->dev, swnode);
 }
 
 #ifdef CONFIG_PM
@@ -306,11 +307,7 @@ static int dwc3_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	dwc->dwc3->dev.parent = dev;
 	ACPI_COMPANION_SET(&dwc->dwc3->dev, ACPI_COMPANION(dev));
 
-	ret = device_add_software_node(&dwc->dwc3->dev, (void *)id->driver_data);
-	if (ret < 0)
-		goto err;
-
-	ret = dwc3_pci_quirks(dwc);
+	ret = dwc3_pci_quirks(dwc, (void *)id->driver_data);
 	if (ret)
 		goto err;
 
-- 
2.33.1

