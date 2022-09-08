Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1875B1468
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 08:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiIHGLH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 02:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiIHGLE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 02:11:04 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC04AB41A
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 23:11:02 -0700 (PDT)
X-UUID: cac2b31c330c46de886a8369cf80a009-20220908
X-CPASD-INFO: 910a53312bca4eda99fb55a0f56c13f4@goFqgWJlYWFegqWtg6ivm1lqlpJlYYF
        _qG9Wk19jklSVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3iHNqgWdhYw==
X-CLOUD-ID: 910a53312bca4eda99fb55a0f56c13f4
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:185.
        0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:140.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
        .0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:2.0,SPC:0,SIG:-
        5,AUF:11,DUF:4343,ACD:74,DCD:74,SL:0,EISP:0,AG:0,CFC:0.436,CFSR:0.038,UAT:0,R
        AF:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,
        EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: cac2b31c330c46de886a8369cf80a009-20220908
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: cac2b31c330c46de886a8369cf80a009-20220908
X-User: chenzhang@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <chenzhang@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 85301; Thu, 08 Sep 2022 14:11:26 +0800
From:   chen zhang <chenzhang@kylinos.cn>
To:     chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org
Cc:     chenzhang_0901@163.com, linux-usb@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3] usb: mtu3: Fix spelling typo in comments
Date:   Thu,  8 Sep 2022 14:10:57 +0800
Message-Id: <20220908061057.16990-1-chenzhang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        RDNS_DYNAMIC,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix spelling typo in comments.

K2ci (Kylin Continuous Integration) is a code pre-verification tool
independently developed by KylinSoft, which is used for ensuring the
code quality of code submission. K2ci includes the comment check tool
notes_check.

This spelling typo was found using notes_check tool, which reported the
following warning when check the v5.19 kernel release:

python3 notes_check.py
drivers/usb/mtu3/mtu3_qmu.c emtpy

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: chen zhang <chenzhang@kylinos.cn>
---
change for v3: move k2ci tool explain to changelog text 
change for v2: add k2ci tool explain
---
 drivers/usb/mtu3/mtu3_qmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 2ea3157ddb6e..5c3fbfcf6483 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -220,7 +220,7 @@ static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
 	return ring->dequeue;
 }
 
-/* check if a ring is emtpy */
+/* check if a ring is empty */
 static int gpd_ring_empty(struct mtu3_gpd_ring *ring)
 {
 	struct qmu_gpd *enq = ring->enqueue;
-- 
2.25.1

