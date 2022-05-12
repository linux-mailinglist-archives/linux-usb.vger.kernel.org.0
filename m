Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B8B5242B0
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 04:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244099AbiELCXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 22:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241340AbiELCWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 22:22:54 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD98160BB3
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652322103; x=1683858103;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=20L31Nlazx6nhkiuM3q4ezm9X5iwHJCR665uiml9yVI=;
  b=Nhm29djl/8ilAhubm6Ci+HpLrmkhfHpIahOdj3CeiXdsfRSlv4IYs3Zt
   jS33pJjtZh5M+RQWOY9mWKAAq5hlE2XVJ3PZIeNkFBeXrdbeGqAEoGFJs
   ntUM1WQ421qjROT9owjbPpkv3f1Yh4CpKdCp4E6lkB/tyuaQl+oZR6fFy
   Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 11 May 2022 19:21:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 19:21:40 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 19:21:40 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 19:21:38 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Date:   Thu, 12 May 2022 10:21:34 +0800
Message-ID: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

First remove lb_modinit() and lb_modexit() call from f_sourcesink as both
function belong to f_loopback.c, also there is no need to export
disable_endpoints() from f_sourcesink, change it to static type.

After first step, we can use DECLARE_USB_FUNCTION_INIT() macro in
f_sourcesink to create module init/exit function implicit as it only
register/unregister one usb function driver.

In f_loopback disable_loopback() function, just add two usb_ep_disable()
call, it will safe to remove original disable_endpoints() call
which belong to f_sourcesink, and it also safe to use macro
DECLARE_USB_FUNCTION_INIT() for module init/exit purpose.

Now it is safe to remove function prototype of lb_modinit(),
lb_modexit() and disable_endpoints() from g_zero.h.

Change Makefile to build f_loopback/f_sourcesink as standalone module.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/function/Makefile       |  4 ++--
 drivers/usb/gadget/function/f_loopback.c   | 23 +++++++++++------------
 drivers/usb/gadget/function/f_sourcesink.c | 24 ++----------------------
 drivers/usb/gadget/function/g_zero.h       |  8 --------
 4 files changed, 15 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index 5d3a6cf..6d01495 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -9,8 +9,8 @@ ccflags-y			+= -I$(srctree)/drivers/usb/gadget/udc/
 # USB Functions
 usb_f_acm-y			:= f_acm.o
 obj-$(CONFIG_USB_F_ACM)		+= usb_f_acm.o
-usb_f_ss_lb-y			:= f_loopback.o f_sourcesink.o
-obj-$(CONFIG_USB_F_SS_LB)	+= usb_f_ss_lb.o
+obj-$(CONFIG_USB_F_SS_LB)	+= f_loopback.o
+obj-$(CONFIG_USB_F_SS_LB)	+= f_sourcesink.o
 obj-$(CONFIG_USB_U_SERIAL)	+= u_serial.o
 usb_f_serial-y			:= f_serial.o
 obj-$(CONFIG_USB_F_SERIAL)	+= usb_f_serial.o
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index ae41f55..77fbed0 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -296,9 +296,18 @@ static void loopback_complete(struct usb_ep *ep, struct usb_request *req)
 static void disable_loopback(struct f_loopback *loop)
 {
 	struct usb_composite_dev	*cdev;
+	int			value;
 
 	cdev = loop->function.config->cdev;
-	disable_endpoints(cdev, loop->in_ep, loop->out_ep, NULL, NULL);
+
+	value = usb_ep_disable(loop->in_ep);
+	if (value < 0)
+		DBG(cdev, "disable %s --> %d\n", loop->in_ep->name, value);
+
+	value = usb_ep_disable(loop->out_ep);
+	if (value < 0)
+		DBG(cdev, "disable %s --> %d\n", loop->out_ep->name, value);
+
 	VDBG(cdev, "%s disabled\n", loop->function.name);
 }
 
@@ -583,16 +592,6 @@ static struct usb_function_instance *loopback_alloc_instance(void)
 
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
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index 6803cd6..9441285 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -301,7 +301,7 @@ static void disable_ep(struct usb_composite_dev *cdev, struct usb_ep *ep)
 		DBG(cdev, "disable %s --> %d\n", ep->name, value);
 }
 
-void disable_endpoints(struct usb_composite_dev *cdev,
+static void disable_endpoints(struct usb_composite_dev *cdev,
 		struct usb_ep *in, struct usb_ep *out,
 		struct usb_ep *iso_in, struct usb_ep *iso_out)
 {
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
index 98b8462..23f55e7 100644
--- a/drivers/usb/gadget/function/g_zero.h
+++ b/drivers/usb/gadget/function/g_zero.h
@@ -62,12 +62,4 @@ struct f_lb_opts {
 	int				refcnt;
 };
 
-void lb_modexit(void);
-int lb_modinit(void);
-
-/* common utilities */
-void disable_endpoints(struct usb_composite_dev *cdev,
-		struct usb_ep *in, struct usb_ep *out,
-		struct usb_ep *iso_in, struct usb_ep *iso_out);
-
 #endif /* __G_ZERO_H */
-- 
2.7.4

