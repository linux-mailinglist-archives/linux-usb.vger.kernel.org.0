Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95431DDF78
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 07:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgEVFmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 01:42:54 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:25312 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbgEVFmy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 01:42:54 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app3 (Coremail) with SMTP id cC_KCgCXn4tNZsdelIDvAA--.30245S4;
        Fri, 22 May 2020 13:42:41 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v3] usb: musb: Fix runtime PM imbalance on error
Date:   Fri, 22 May 2020 13:42:35 +0800
Message-Id: <20200522054235.7944-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCXn4tNZsdelIDvAA--.30245S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ur47ur4rtr4xAF48tF4fKrg_yoW8GF47p3
        W09FW3KrW8tayfAF1qva1kXF95X39aqFyUtrW29anxZFnrW3W2qFy5Ga4rtF10qFWxAFW7
        t3W5KFy5urW7XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
        JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48J
        MxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JU6mhwUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoIBlZdtOQLzwAEsd
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When copy_from_user() returns an error code, there
is a runtime PM usage counter imbalance.

Fix this by moving copy_from_user() to the beginning
of this function.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Move copy_from_user() to the beginning rather
      than adding pm_runtime_put_autosuspend().

v3: - Add missing changelog information.
---
 drivers/usb/musb/musb_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_debugfs.c b/drivers/usb/musb/musb_debugfs.c
index 7b6281ab62ed..30a89aa8a3e7 100644
--- a/drivers/usb/musb/musb_debugfs.c
+++ b/drivers/usb/musb/musb_debugfs.c
@@ -168,6 +168,11 @@ static ssize_t musb_test_mode_write(struct file *file,
 	u8			test;
 	char			buf[24];
 
+	memset(buf, 0x00, sizeof(buf));
+
+	if (copy_from_user(buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
 	pm_runtime_get_sync(musb->controller);
 	test = musb_readb(musb->mregs, MUSB_TESTMODE);
 	if (test) {
@@ -176,11 +181,6 @@ static ssize_t musb_test_mode_write(struct file *file,
 		goto ret;
 	}
 
-	memset(buf, 0x00, sizeof(buf));
-
-	if (copy_from_user(buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
-		return -EFAULT;
-
 	if (strstarts(buf, "force host full-speed"))
 		test = MUSB_TEST_FORCE_HOST | MUSB_TEST_FORCE_FS;
 
-- 
2.17.1

