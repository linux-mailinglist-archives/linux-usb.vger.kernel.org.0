Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF504AAA43
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 17:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380501AbiBEQp6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Feb 2022 11:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53005 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380502AbiBEQpz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Feb 2022 11:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644079555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ExCn8bXEYj3Fheat2o3eV3w8opytI1zAavJnEA3goSo=;
        b=e3U06VeyLKrW/7aR3dlS1kodNDu24rdiQ9AVpac1U+TqN8e3nOhKTuQh6ttxNXxPSIDQNT
        Nc0wCNQe2IHqUrD+c6jUzs5Cpd5pLwq7yWaNNUzREpn261cywDIYeXmucWg2fEmbbmv2vG
        Wphu5Wb5F57OH+2Fe/Rgs0xYmZEQkkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-arbqB6UaNX2mz4lTDqkMTQ-1; Sat, 05 Feb 2022 11:45:52 -0500
X-MC-Unique: arbqB6UaNX2mz4lTDqkMTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D774C8519E0;
        Sat,  5 Feb 2022 16:45:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2436D2B4D2;
        Sat,  5 Feb 2022 16:45:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: [PATCH 5/9] usb: dwc3: pci: Also apply Bay Trail GPIO mappings to ulpi-device
Date:   Sat,  5 Feb 2022 17:45:31 +0100
Message-Id: <20220205164535.179231-6-hdegoede@redhat.com>
In-Reply-To: <20220205164535.179231-1-hdegoede@redhat.com>
References: <20220205164535.179231-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

