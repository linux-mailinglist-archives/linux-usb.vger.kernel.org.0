Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7635251FBCF
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 13:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbiEIL7E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 07:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbiEIL67 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 07:58:59 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D70205276
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652097305; x=1683633305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h2M7C/AGk65xLxLhvlePjPuwCBpbhAIwijTEo9i36N0=;
  b=jO8LTnNJIApsvzTBJ1vb8bQO2N05XjOBvEL2AXkifpEuD99k67QCh/I/
   olFNskYgkjlCXLCta17imelPm7QnnUn7K4L03ZpqRGunREMCfzk7QtTJ/
   jr0X1/QjTTWA2JYgi9gICzfWHdPO1vfKoFFYPk16x1z7+CNVxjGe3ScpI
   M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 May 2022 04:55:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 04:55:05 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:05 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:03 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 3/4] usb: gadget: f_loopback: use DECLARE_USB_FUNCTION_INIT() macro
Date:   Mon, 9 May 2022 19:54:47 +0800
Message-ID: <1652097288-19909-4-git-send-email-quic_linyyuan@quicinc.com>
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

As lb_modexit()/lb_modinit() just register/unregister
the loopback usb function driver,
DECLARE_USB_FUNCTION_INIT() macro do same thing,
let's use this macro instead and remove lb_modexit()//lb_modinit().

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: new add according review comment

 drivers/usb/gadget/function/f_loopback.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index ae41f55..b0eda4f 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -583,16 +583,6 @@ static struct usb_function_instance *loopback_alloc_instance(void)
 
 	return  &lb_opts->func_inst;
 }
-DECLARE_USB_FUNCTION(Loopback, loopback_alloc_instance, loopback_alloc);
-
-int __init lb_modinit(void)
-{
-	return usb_function_register(&Loopbackusb_func);
-}
-
-void __exit lb_modexit(void)
-{
-	usb_function_unregister(&Loopbackusb_func);
-}
+DECLARE_USB_FUNCTION_INIT(Loopback, loopback_alloc_instance, loopback_alloc);
 
 MODULE_LICENSE("GPL");
-- 
2.7.4

