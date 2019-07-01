Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD9A92BA28
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2019 20:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfE0SdB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 May 2019 14:33:01 -0400
Received: from gateway36.websitewelcome.com ([192.185.179.26]:26072 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726839AbfE0SdB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 May 2019 14:33:01 -0400
X-Greylist: delayed 1328 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 14:33:00 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 0EFD6400CA320
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2019 12:31:13 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id VK5Eh2DsbiQerVK5Ehd2ye; Mon, 27 May 2019 13:10:52 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=37322 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hVK5D-002uvT-9J; Mon, 27 May 2019 13:10:51 -0500
Date:   Mon, 27 May 2019 13:10:50 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] usb: typec: ucsi: ccg: fix memory leak in do_flash
Message-ID: <20190527181050.GA31496@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hVK5D-002uvT-9J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:37322
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case memory resources for *fw* were successfully allocated,
release them before return.

Addresses-Coverity-ID: 1445499 ("Resource leak")
Fixes: 5c9ae5a87573 ("usb: typec: ucsi: ccg: add firmware flashing support")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 9d46aa9e4e35..bf63074675fc 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -862,8 +862,10 @@ static int do_flash(struct ucsi_ccg *uc, enum enum_flash_mode mode)
 
 not_signed_fw:
 	wr_buf = kzalloc(CCG4_ROW_SIZE + 4, GFP_KERNEL);
-	if (!wr_buf)
-		return -ENOMEM;
+	if (!wr_buf) {
+		err = -ENOMEM;
+		goto release_fw;
+	}
 
 	err = ccg_cmd_enter_flashing(uc);
 	if (err)
-- 
2.21.0

