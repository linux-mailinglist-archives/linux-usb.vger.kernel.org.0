Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5AF51FBCE
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 13:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbiEIL7D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 07:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbiEIL67 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 07:58:59 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6343D205275
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652097304; x=1683633304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ewKZ9R7MKLDgAsvHvAp1Pbm3tIjjaybJf6Fz8EqsUTE=;
  b=E+bfyx/ZO9H/3FqSgaj/xmUV5ZnOiTXdODHvxPwBVboUipry+WNprDoR
   6hpr2f14rOGg/JRql+vDS5/UXm6id+QHfBOE30glYEOs7n8//MSndIldj
   IZ/OhKnJHjNfxdzR4ZJC+zaHoHvWrHC4dtkQECGS4AUKmUWPTBb1TrNEH
   U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 May 2022 04:55:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 04:55:03 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:03 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:01 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 2/4] usb: gadget: f_sourcesink: use DECLARE_USB_FUNCTION_INIT()
Date:   Mon, 9 May 2022 19:54:46 +0800
Message-ID: <1652097288-19909-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

First there is no reason call lb_modinit() and lb_modexit()
which belong to f_loopback.c,
let's remove them here and remove two function prototype from g_zero.h.

After first step, we can use DECLARE_USB_FUNCTION_INIT() macro
to create module init/exit function implicit as it only
register/unregister one usb function driver.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: new add

 drivers/usb/gadget/function/f_sourcesink.c | 22 +---------------------
 drivers/usb/gadget/function/g_zero.h       |  3 ---
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 6803cd6..f4a0793 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -1263,27 +1263,7 @@ static struct usb_function_instance *source_sink_alloc_inst(void)
 
 	return &ss_opts->func_inst;
 }
-DECLARE_USB_FUNCTION(SourceSink, source_sink_alloc_inst,
+DECLARE_USB_FUNCTION_INIT(SourceSink, source_sink_alloc_inst,
 		source_sink_alloc_func);
 
-static int __init sslb_modinit(void)
-{
-	int ret;
-
-	ret = usb_function_register(&SourceSinkusb_func);
-	if (ret)
-		return ret;
-	ret = lb_modinit();
-	if (ret)
-		usb_function_unregister(&SourceSinkusb_func);
-	return ret;
-}
-static void __exit sslb_modexit(void)
-{
-	usb_function_unregister(&SourceSinkusb_func);
-	lb_modexit();
-}
-module_init(sslb_modinit);
-module_exit(sslb_modexit);
-
 MODULE_LICENSE("GPL");
diff --git a/drivers/usb/gadget/function/g_zero.h b/drivers/usb/gadget/function/g_zero.h
index 98b8462..c1ea285 100644
--- a/drivers/usb/gadget/function/g_zero.h
+++ b/drivers/usb/gadget/function/g_zero.h
@@ -62,9 +62,6 @@ struct f_lb_opts {
 	int				refcnt;
 };
 
-void lb_modexit(void);
-int lb_modinit(void);
-
 /* common utilities */
 void disable_endpoints(struct usb_composite_dev *cdev,
 		struct usb_ep *in, struct usb_ep *out,
-- 
2.7.4

