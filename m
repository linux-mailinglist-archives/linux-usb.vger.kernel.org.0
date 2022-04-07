Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E66E54F7205
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 04:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238765AbiDGCXW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 22:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237953AbiDGCXU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 22:23:20 -0400
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 302CF12A8D2
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 19:21:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [222.205.11.114])
        by mail-app2 (Coremail) with SMTP id by_KCgC3LxeaSk5i9aRCAQ--.13077S4;
        Thu, 07 Apr 2022 10:21:14 +0800 (CST)
From:   Lin Ma <linma@zju.edu.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        mdharm-usb@one-eyed-alien.net
Cc:     Lin Ma <linma@zju.edu.cn>
Subject: [PATCH v0 2/3] usb-storage: isd200: fix initFunction error return
Date:   Thu,  7 Apr 2022 10:21:10 +0800
Message-Id: <20220407022110.3757-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: by_KCgC3LxeaSk5i9aRCAQ--.13077S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1kZFyfJr4xtr1kZw18Krg_yoW8Ww1Upa
        n7G3yjkF4UJr1UGr1DJrZYvF1Syas7Gry7Kry7t34Fqr1rJ3yjvFW5CryF9rWUtryfKr1f
        tF4Dtry3uF1xJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv01xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWU
        XwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l
        42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1
        sYFtUUUUU==
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The initFunction is called when probing a new device, its call relation
is like:

USB core: probe() -> usb_stor_probe2() -> usb_stor_acquire_resources()
-> isd200_init_info()

That is, the error return of the initFunction should tell USB core what
happened instead of using custom error code like ISD200_ERROR.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 drivers/usb/storage/isd200.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
index 05429f1f69f9..4e0eef1440b7 100644
--- a/drivers/usb/storage/isd200.c
+++ b/drivers/usb/storage/isd200.c
@@ -1449,7 +1449,7 @@ static void isd200_free_info_ptrs(void *info_)
  * Allocates (if necessary) and initializes the driver structure.
  *
  * RETURNS:
- *    ISD status code
+ *    error status code
  */
 static int isd200_init_info(struct us_data *us)
 {
@@ -1457,7 +1457,7 @@ static int isd200_init_info(struct us_data *us)
 
 	info = kzalloc(sizeof(struct isd200_info), GFP_KERNEL);
 	if (!info)
-		return ISD200_ERROR;
+		return -ENOMEM;
 
 	info->id = kzalloc(ATA_ID_WORDS * 2, GFP_KERNEL);
 	info->RegsBuf = kmalloc(sizeof(info->ATARegs), GFP_KERNEL);
@@ -1466,13 +1466,13 @@ static int isd200_init_info(struct us_data *us)
 	if (!info->id || !info->RegsBuf || !info->srb.sense_buffer) {
 		isd200_free_info_ptrs(info);
 		kfree(info);
-		return ISD200_ERROR;
+		return -ENOMEM;
 	}
 
 	us->extra = info;
 	us->extra_destructor = isd200_free_info_ptrs;
 
-	return ISD200_GOOD;
+	return 0;
 }
 
 /**************************************************************************
-- 
2.35.1

