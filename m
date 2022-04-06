Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952E04F6179
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 16:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234482AbiDFOLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 10:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbiDFOLF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 10:11:05 -0400
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CA021E4619
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 03:06:01 -0700 (PDT)
Received: from localhost.localdomain (unknown [222.205.4.190])
        by mail-app3 (Coremail) with SMTP id cC_KCgDHGcpfZU1iUTt7AQ--.13459S4;
        Wed, 06 Apr 2022 18:03:11 +0800 (CST)
From:   Lin Ma <linma@zju.edu.cn>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        mdharm-usb@one-eyed-alien.net
Cc:     Lin Ma <linma@zju.edu.cn>
Subject: [PATCH v0] USB: storage: karma: fix rio_karma_init return
Date:   Wed,  6 Apr 2022 18:02:59 +0800
Message-Id: <20220406100259.6483-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cC_KCgDHGcpfZU1iUTt7AQ--.13459S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr47urW7ur1rAF1UAw47Jwb_yoWkJrcE9w
        4UW34xZF1UCFy7Xw1Utr1fZryIkw48ZrnYvF95t3yfGF1DAw4xAFn8ZrZ2yF98JFWxArs8
        Aws3uF93J348ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbxxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l
        42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUon
        mRUUUUU
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function rio_karam_init() should return USB_STOR_TRANSPORT_ERROR
instead of 0 (USB_STOR_TRANSPORT_GOOD) when allocation fails.

Fixes: dfe0d3ba20e8 ("USB Storage: add rio karma eject support")

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 drivers/usb/storage/karma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/karma.c b/drivers/usb/storage/karma.c
index 05cec81dcd3f..b8a4ae1aa22a 100644
--- a/drivers/usb/storage/karma.c
+++ b/drivers/usb/storage/karma.c
@@ -178,19 +178,19 @@ static int rio_karma_init(struct us_data *us)
 	struct karma_data *data = kzalloc(sizeof(struct karma_data), GFP_NOIO);
 
 	if (!data)
-		goto out;
+		return USB_STOR_TRANSPORT_ERROR;
 
 	data->recv = kmalloc(RIO_RECV_LEN, GFP_NOIO);
 	if (!data->recv) {
 		kfree(data);
-		goto out;
+		return USB_STOR_TRANSPORT_ERROR;
 	}
 
 	us->extra = data;
 	us->extra_destructor = rio_karma_destructor;
 	ret = rio_karma_send_command(RIO_ENTER_STORAGE, us);
 	data->in_storage = (ret == 0);
-out:
+
 	return ret;
 }
 
-- 
2.35.1

