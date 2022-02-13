Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03A64B3B7A
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbiBMNFq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbiBMNFl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 845E95B88E
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Ohq2A62q6iZea97Y7Wsr23In+WCCgPO+rrzdK8oCfDg=;
        b=ZnTBSIa3jGjYRcK9ecHuaRix4LHWw68NbL6GJ95YYbT0kJ0kxeFFnF72UgBPGewy5iLR4y
        d0Rmb0/dJh2QHOLbGzieohmqptqdbOXX057dE1PpakO2YlForBS2hX6K39133AIaYGNbuQ
        bd+yASEkHZ87UfMyQutdC3D9NSjH1i8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-Hl9fi6KeM6qFduMqyds0Ww-1; Sun, 13 Feb 2022 08:05:32 -0500
X-MC-Unique: Hl9fi6KeM6qFduMqyds0Ww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18CC21091DA0;
        Sun, 13 Feb 2022 13:05:31 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD90C7B9DD;
        Sun, 13 Feb 2022 13:05:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 0/9] usb/dwc3 / phy/tusb1210: Add TUSB1211 charger detection
Date:   Sun, 13 Feb 2022 14:05:15 +0100
Message-Id: <20220213130524.18748-1-hdegoede@redhat.com>
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

Hi All,

Here is v2 of the patchs-series to add support for USB charger-type
(SDP/DCP) detection using a tusb1210 phy connected to a dwc3 controller.

Changes in v2:
[PATCH v2 9/9] phy: ti: tusb1210: Add charger detection:
- Add an online attribute to the registered power_supply class device,
  otherwise upower thinks it is an extra system battery
- Add tusb1210_remove_charger_detect() function to properly unregister
  the tusb->psy_nb notifier and to cancel tusb->chg_det_work

v1 cover-letter:

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

 drivers/phy/ti/phy-tusb1210.c | 439 ++++++++++++++++++++++++++++++++--
 drivers/usb/dwc3/dwc3-pci.c   |  60 ++++-
 2 files changed, 467 insertions(+), 32 deletions(-)

-- 
2.33.1

