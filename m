Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76AF84AAA3C
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 17:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349566AbiBEQpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Feb 2022 11:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40049 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233494AbiBEQpp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Feb 2022 11:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644079545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yTKNPFxCLWu/P0NqWlEg8Yc0F6R+0YlP+lJRenLNn2Q=;
        b=XZTF/srvxw6Ki4sNSffgIe7EATtNKiqqQJ6OGGc6EjfN2i5XhFLjs+V/UAO2F3e0VIcKRP
        mlsV4+zEhg4hlpGmaqBHotuUx9lEPHaf5tXYCR4vvMG99KA35bzTWKJVbTxVzftt/AF1YY
        l/89oLkIHYA6bQ9akWW90q3/qLkBOKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-rQLYZYKPOUi_vRMzbQ3leQ-1; Sat, 05 Feb 2022 11:45:41 -0500
X-MC-Unique: rQLYZYKPOUi_vRMzbQ3leQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712CC100C661;
        Sat,  5 Feb 2022 16:45:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9FEC22B4D2;
        Sat,  5 Feb 2022 16:45:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: [PATCH 0/9] usb/dwc3 / phy/tusb1210: Add TUSB1211 charger detection
Date:   Sat,  5 Feb 2022 17:45:26 +0100
Message-Id: <20220205164535.179231-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some Android x86 tablets with a Bay Trail (BYT) SoC (with DWC3 UDC)
and a Crystal Cove PMIC, which does not support charger-detection,
rely on a TUSB1211 phy for charger-detection.

This series adds support for this, it starts with some dwc3 bug-fixes
for issues hit while developing this, as well as adding support to
the dwc3 code to set a special property checked by the tusb1210 driver
to signal that it needs to enable charger-detection.

The 2nd half of the series does some refactoring / fixes to the
tusb1210 driver and adds the charger-detection support.

Regards,

Hans


Hans de Goede (8):
  usb: dwc3: pci: Add "snps,dis_u2_susphy_quirk" for Intel Bay Trail
  usb: dwc3: pci: Fix Bay Trail phy GPIO mappings
  usb: dwc3: pci: Set the swnode from inside dwc3_pci_quirks()
  usb: dwc3: pci: Set "linux,phy_charger_detect" property on some Bay
    Trail boards
  usb: dwc3: pci: Also apply Bay Trail GPIO mappings to ulpi-device
  phy: ti: tusb1210: Improve ulpi_read()/_write() error checking
  phy: ti: tusb1210: Drop tusb->vendor_specific2 != 0 check from
    tusb1210_power_on()
  phy: ti: tusb1210: Add a delay between power-on and restoring the
    phy-parameters

Stephan Gerhold (1):
  phy: ti: tusb1210: Add charger detection

 drivers/phy/ti/phy-tusb1210.c | 387 ++++++++++++++++++++++++++++++++--
 drivers/usb/dwc3/dwc3-pci.c   |  60 +++++-
 2 files changed, 415 insertions(+), 32 deletions(-)

-- 
2.33.1

