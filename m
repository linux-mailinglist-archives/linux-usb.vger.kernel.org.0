Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394CB51FBCB
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 13:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233472AbiEIL7F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 07:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbiEIL7A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 07:59:00 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D36212719A
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 04:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652097307; x=1683633307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdzJN7QVSt9EeRIIN1Oq0vjQ4HOpUGctRXR05rWYM1g=;
  b=XMFA4PK7zfrXmLdAeceK4klybNmlPMupTSe9FCk3F9osR7UZSez3aodv
   69EC7K6D8iVVwYbQul6FgdL0Dl6GJiLhaXhHAS24k66HEyVoyy/Ps5bZE
   +mAWoSX6xdj/WGDOKHK2XXGHxF2YPOr5n/QfteRryESHe5gwJVc2e2WZD
   I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 May 2022 04:55:07 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 04:55:06 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:06 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:05 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 4/4] usb: gadget: add '_' in DECLARE_USB_FUNCTION(_INIT) macros
Date:   Mon, 9 May 2022 19:54:48 +0800
Message-ID: <1652097288-19909-5-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
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

DECLARE_USB_FUNCTION_INIT(ffs, ffs_alloc_inst, ffs_alloc)
will generate function ffsmod_init/ffsmod_exit()
and variable ffsusb_func.

Add possible character '_' in the macros which will generate
function/variable name in common format, ffs_mod_init/ffs_mod_exit()
and ffs_usb_func.

f_tcm.c doing more thing in module init/exit, it will not use
DECLARE_USB_FUNCTION_INIT() macro, but we change DECLARE_USB_FUNCTION()
macro, it will change static struct usb_function_driver variable from
tcmusb_func to tcm_usb_func,
so update tcm_init()/tcm_exit() to use tcm_usb_func.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix build issue from kernel test robot <lkp@intel.com>
v3: change commit description and add f_tcm.c change

 drivers/usb/gadget/function/f_tcm.c |  6 +++---
 include/linux/usb/composite.h       | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 8e17ac8..4873587 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2310,13 +2310,13 @@ static int tcm_init(void)
 {
 	int ret;
 
-	ret = usb_function_register(&tcmusb_func);
+	ret = usb_function_register(&tcm_usb_func);
 	if (ret)
 		return ret;
 
 	ret = target_register_template(&usbg_ops);
 	if (ret)
-		usb_function_unregister(&tcmusb_func);
+		usb_function_unregister(&tcm_usb_func);
 
 	return ret;
 }
@@ -2325,7 +2325,7 @@ module_init(tcm_init);
 static void tcm_exit(void)
 {
 	target_unregister_template(&usbg_ops);
-	usb_function_unregister(&tcmusb_func);
+	usb_function_unregister(&tcm_usb_func);
 }
 module_exit(tcm_exit);
 
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 9d27622..0eac583 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -611,7 +611,7 @@ int usb_add_config_only(struct usb_composite_dev *cdev,
 void usb_remove_function(struct usb_configuration *c, struct usb_function *f);
 
 #define DECLARE_USB_FUNCTION(_name, _inst_alloc, _func_alloc)		\
-	static struct usb_function_driver _name ## usb_func = {		\
+	static struct usb_function_driver _name ## _usb_func = {	\
 		.name = __stringify(_name),				\
 		.mod  = THIS_MODULE,					\
 		.alloc_inst = _inst_alloc,				\
@@ -621,16 +621,16 @@ void usb_remove_function(struct usb_configuration *c, struct usb_function *f);
 
 #define DECLARE_USB_FUNCTION_INIT(_name, _inst_alloc, _func_alloc)	\
 	DECLARE_USB_FUNCTION(_name, _inst_alloc, _func_alloc)		\
-	static int __init _name ## mod_init(void)			\
+	static int __init _name ## _mod_init(void)			\
 	{								\
-		return usb_function_register(&_name ## usb_func);	\
+		return usb_function_register(&_name ## _usb_func);	\
 	}								\
-	static void __exit _name ## mod_exit(void)			\
+	static void __exit _name ## _mod_exit(void)			\
 	{								\
-		usb_function_unregister(&_name ## usb_func);		\
+		usb_function_unregister(&_name ## _usb_func);		\
 	}								\
-	module_init(_name ## mod_init);					\
-	module_exit(_name ## mod_exit)
+	module_init(_name ## _mod_init);				\
+	module_exit(_name ## _mod_exit)
 
 /* messaging utils */
 #define DBG(d, fmt, args...) \
-- 
2.7.4

