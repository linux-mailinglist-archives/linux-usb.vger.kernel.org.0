Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14B05AFB73
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 06:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiIGE6u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 00:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiIGE6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 00:58:49 -0400
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39608FD7B
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 21:58:45 -0700 (PDT)
X-UUID: 4849a66c1e6041bc9daf2e6b242ff908-20220907
X-CPASD-INFO: 44328765c2744e5e98d027ad06fc1a64@fYRtUmVpZGWPUnmAg6iAn1lplGBiY4G
        zcnCGk1-RYlSVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3g3ZtUmhlZg==
X-CLOUD-ID: 44328765c2744e5e98d027ad06fc1a64
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:196.
        0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:153.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
        .0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-
        5,AUF:3,DUF:4239,ACD:73,DCD:73,SL:0,EISP:0,AG:0,CFC:0.516,CFSR:0.055,UAT:0,RA
        F:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,E
        AF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 4849a66c1e6041bc9daf2e6b242ff908-20220907
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 4849a66c1e6041bc9daf2e6b242ff908-20220907
X-User: chenzhang@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
        (envelope-from <chenzhang@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 1413423918; Wed, 07 Sep 2022 12:59:08 +0800
From:   chen zhang <chenzhang@kylinos.cn>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     chenzhang_0901@163.com, linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: Fix spelling typo in comments
Date:   Wed,  7 Sep 2022 12:58:40 +0800
Message-Id: <20220907045840.50540-1-chenzhang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        MAY_BE_FORGED,RDNS_DYNAMIC,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: chen zhang <chenzhang@kylinos.cn>
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

