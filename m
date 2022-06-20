Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FDB551593
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 12:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbiFTKRa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 06:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239361AbiFTKR3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 06:17:29 -0400
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59B813DEC;
        Mon, 20 Jun 2022 03:17:24 -0700 (PDT)
X-QQ-mid: bizesmtp62t1655720174tv43877p
Received: from localhost.localdomain ( [106.117.82.33])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 20 Jun 2022 18:16:00 +0800 (CST)
X-QQ-SSF: 01000000004000D0I000B00A0000000
X-QQ-FEAT: l2baldexF9nZoqlU6/S0CNKLWXb7r/rN55hX7h8Tu27mCbOk+KikIRgJNMjyM
        cUPcr3kl6ss85cE0PY2QZLfAskRBAvPIh62uckkAGV3xw8Pu4S3ODRuWmK+pjpwpx0WtwBf
        V/JArAUiNMD2Gl9be/1O4oH3aesljvoP2OKlzIi/5ZcV4qRrOdZbHR4FfODb7Nt+XhT+9v1
        zig9TwnF2YThnfUJKi5RYWUkc5NY9feTv4x78t8mLVgddnQ+kec6/8wfnFSyAyO0c6veavi
        +EbSGmUvmuHJwPrZD2K/7Aq/D5m3FPdrZ2vOy5/OisHnRu3Dgn0PP6sqU=
X-QQ-GoodBg: 0
From:   Xiang wangx <wangxiang@cdjrlc.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] USB: ohci-sm501: Fix typo in comment
Date:   Mon, 20 Jun 2022 18:15:56 +0800
Message-Id: <20220620101556.2290-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Delete the redundant word 'the'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/usb/host/ohci-sm501.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
index b91d50da6127..f5de586454e3 100644
--- a/drivers/usb/host/ohci-sm501.c
+++ b/drivers/usb/host/ohci-sm501.c
@@ -153,7 +153,7 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 	 * fine. This is however not always the case - buffers may be allocated
 	 * using kmalloc() - so the usb core needs to be told that it must copy
 	 * data into our local memory if the buffers happen to be placed in
-	 * regular memory. A non-null hcd->localmem_pool initialized by the
+	 * regular memory. A non-null hcd->localmem_pool initialized by
 	 * the call to usb_hcd_setup_local_mem() below does just that.
 	 */
 
-- 
2.36.1


