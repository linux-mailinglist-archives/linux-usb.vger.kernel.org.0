Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAF33AC6C0
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 11:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhFRJG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 05:06:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48288 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFRJG5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Jun 2021 05:06:57 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1luAQh-0001j9-Ds; Fri, 18 Jun 2021 09:04:47 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH] xhci: remove redundant continue statement
Date:   Fri, 18 Jun 2021 10:04:47 +0100
Message-Id: <20210618090447.99114-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement at the end of a for-loop has no effect,
remove it.

Addresses-Coverity: ("Continue has no effect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/xhci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 27283654ca08..38b8f9f7c68d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4840,7 +4840,6 @@ static int xhci_update_timeout_for_interface(struct xhci_hcd *xhci,
 		if (xhci_update_timeout_for_endpoint(xhci, udev,
 					&alt->endpoint[j].desc, state, timeout))
 			return -E2BIG;
-		continue;
 	}
 	return 0;
 }
-- 
2.31.1

