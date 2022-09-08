Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE745B1467
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 08:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIHGKx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 02:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiIHGKw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 02:10:52 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E854A0609
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 23:10:45 -0700 (PDT)
X-UUID: 9c559e37686944d3bbe2f03e6186413d-20220908
X-CPASD-INFO: 482cb6fa76104cf0bab05ea42f588b83@fYhsg49olJFjVnN8g6axaoKSkmBlkYG
        DdKBVaGaSZFOVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3g3psg5Jklg==
X-CLOUD-ID: 482cb6fa76104cf0bab05ea42f588b83
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:185.
        0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:221.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
        .0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-
        5,AUF:10,DUF:4342,ACD:74,DCD:74,SL:0,EISP:0,AG:0,CFC:0.511,CFSR:0.032,UAT:0,R
        AF:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,
        EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 9c559e37686944d3bbe2f03e6186413d-20220908
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 9c559e37686944d3bbe2f03e6186413d-20220908
X-User: chenzhang@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <chenzhang@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 704618729; Thu, 08 Sep 2022 14:11:09 +0800
From:   chen zhang <chenzhang@kylinos.cn>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     chenzhang_0901@163.com, linux-usb@vger.kernel.org
Subject: [PATCH v3] usb: gadget: Fix spelling typo in comments
Date:   Thu,  8 Sep 2022 14:10:41 +0800
Message-Id: <20220908061041.16926-1-chenzhang@kylinos.cn>
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
drivers/usb/gadget/function/f_uac1_legacy.c selecotor
python3 notes_check.py
drivers/usb/gadget/udc/bdc/bdc_ core.c dyanmic

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: chen zhang <chenzhang@kylinos.cn>
---
change for v3: move k2ci tool explain to changelog text 
change for v2: add k2ci tool explain
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index e2d7f69128a0..e23aed620c4d 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -780,7 +780,7 @@ static int generic_get_cmd(struct usb_audio_control *con, u8 cmd)
 	return con->data[cmd];
 }
 
-/* Todo: add more control selecotor dynamically */
+/* Todo: add more control selector dynamically */
 static int control_selector_init(struct f_audio *audio)
 {
 	INIT_LIST_HEAD(&audio->cs);
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 9849e0c86e23..f9bf3b192cc8 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -361,7 +361,7 @@ int bdc_reinit(struct bdc *bdc)
 	return ret;
 }
 
-/* Allocate all the dyanmic memory */
+/* Allocate all the dynamic memory */
 static int bdc_mem_alloc(struct bdc *bdc)
 {
 	u32 page_size;
-- 
2.25.1

