Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E3A18A01A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2020 17:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgCRQBL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Mar 2020 12:01:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45736 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgCRQBL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Mar 2020 12:01:11 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jEb80-0007pL-EG; Wed, 18 Mar 2020 16:01:08 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: cdns3: fix spelling mistake "wrapperr" -> "wrapper"
Date:   Wed, 18 Mar 2020 16:01:08 +0000
Message-Id: <20200318160108.267403-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/cdns3-pci-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index b0a29efe7d31..deeea618ba33 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -201,4 +201,4 @@ MODULE_DEVICE_TABLE(pci, cdns3_pci_ids);
 
 MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Cadence USBSS PCI wrapperr");
+MODULE_DESCRIPTION("Cadence USBSS PCI wrapper");
-- 
2.25.1

