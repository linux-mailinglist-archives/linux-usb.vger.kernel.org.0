Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05DAF6E1BF2
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 07:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjDNFxb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 01:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjDNFxb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 01:53:31 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 742734200
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 22:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nMS4G
        4/8zAGi99JlLgUBt1+Fk4PUbERNJWnjO3hEuSo=; b=QOK/HIk7o+LLrW1+3DPEO
        5Kgto+ngqoWmG7UHppCrE0QnLRQo79QhNMnqqIjdneQTQMqIWVIhNPBOOvTp0OGi
        NP5VbWKqWMl6jvt1GK0QQxolFxtkfWIMpUgHXiOMdYzSrFXsht2KsBp26+QCv3eN
        EtFFwyhstu5WPLizs4vK0w=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
        by zwqz-smtp-mta-g4-3 (Coremail) with SMTP id _____wCXHfZE6jhkh12KBQ--.53470S2;
        Fri, 14 Apr 2023 13:53:08 +0800 (CST)
From:   qianfanguijin@163.com
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1] drivers: usb: wwan: treat any error as a fatal error
Date:   Fri, 14 Apr 2023 13:53:06 +0800
Message-Id: <20230414055306.8805-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXHfZE6jhkh12KBQ--.53470S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw17uFWUur4UKr1DXF1kZrb_yoWkJFcE9w
        17WF4xWw1xCF13AFyUJrWSvrWYk34kXFnruF1SgFW3AFyYyFZ5Ww4vg395Xwn8tr1UKr9r
        Gw1jgr18tr4vqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRN7KsJUUUUU==
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGh9R7VaEE5TfBwAAs0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: qianfan Zhao <qianfanguijin@163.com>

Kernel print such flood message when the modem dead (the device is not
disconnected but it doesn't response anything):

option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
...

So treat any error that doesn't recognized as a fatal error and do not
resubmit again.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 drivers/usb/serial/usb_wwan.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index cb01283d4d15..daa3e2beff0f 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -227,8 +227,7 @@ static void usb_wwan_indat_callback(struct urb *urb)
 			__func__, status, endpoint);
 
 		/* don't resubmit on fatal errors */
-		if (status == -ESHUTDOWN || status == -ENOENT)
-			return;
+		return;
 	} else {
 		if (urb->actual_length) {
 			tty_insert_flip_string(&port->port, data,
-- 
2.25.1

