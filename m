Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7117951F379
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 06:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiEIE27 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 00:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiEIESx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 00:18:53 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9BA92333
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 21:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652069701; x=1683605701;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jTfufmF6i5+qo6t8l5nRFq79CoUEn3vDLDzGJqccZms=;
  b=DAsSHOB+PHkpKdLjy0S2JHuAruVGAYovCdMywh7rb2EMLMjXRi6nBaEL
   bW9DBzt84bfmztNqlPEzHaWPm2ZsvMZvKv6GEDz3DXRlVvUP+2SKmlpCH
   Wxq0diRh5utnIsHYycBQy5aBPNjmnMzTQeAShkc7CXv91mi2WS4E5YHGF
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 May 2022 21:14:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 21:14:22 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 8 May 2022 21:14:20 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 8 May 2022 21:14:18 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Date:   Mon, 9 May 2022 12:14:13 +0800
Message-ID: <1652069653-6961-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Take DECLARE_USB_FUNCTION_INIT(ffs, ffs_alloc_inst, ffs_alloc) as example,
it will generate function ffsmod_init/ffsmod_exit()
and variable ffsusb_func.

Add possible character '_' in the macro which will generate
function/variable name in common format, ffs_mod_init/ffs_mod_exit()
and ffs_usb_func.

It will apply to all gadget functions which use this macro.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 include/linux/usb/composite.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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

