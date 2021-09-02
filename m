Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44F13FEE7B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 15:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345126AbhIBNOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 09:14:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4554 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345286AbhIBNOC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 09:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630588384; x=1662124384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=12POH/nXGg5POaffvdq17WhnPe3zBt3w7nx6M42BOmE=;
  b=M5eMdHNZio4s54qTJn8ty2ZaRE57fUfrWIn+UDS687+SR18CYNkpXpLg
   6pPSz1wkhwnBgGDX6L1NLr2Ay0SPAMpflCEQdjzaTSQEGUfRfiA3XBle2
   e3NUDSow8inLFDL//8R+MHwmTBhj1uwvf80jcxxoaaG47wH7FvvS3mhKU
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 06:13:03 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 06:13:03 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 06:13:01 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 1/5] usb: gadget: configfs: expose some struct from configfs.c
Date:   Thu, 2 Sep 2021 21:12:50 +0800
Message-ID: <1630588374-5169-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

some private struct in configfs.c maybe used by outside file
when we add ftrace for gadget configfs.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 66 -----------------------------------------
 drivers/usb/gadget/configfs.h | 68 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 66 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 477e72a..0f3a01f 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -28,75 +28,9 @@ int check_user_usb_string(const char *name,
 }
 
 #define MAX_NAME_LEN	40
-#define MAX_USB_STRING_LANGS 2
 
 static const struct usb_descriptor_header *otg_desc[2];
 
-struct gadget_info {
-	struct config_group group;
-	struct config_group functions_group;
-	struct config_group configs_group;
-	struct config_group strings_group;
-	struct config_group os_desc_group;
-
-	struct mutex lock;
-	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
-	struct list_head string_list;
-	struct list_head available_func;
-
-	struct usb_composite_driver composite;
-	struct usb_composite_dev cdev;
-	bool use_os_desc;
-	char b_vendor_code;
-	char qw_sign[OS_STRING_QW_SIGN_LEN];
-	spinlock_t spinlock;
-	bool unbind;
-};
-
-static inline struct gadget_info *to_gadget_info(struct config_item *item)
-{
-	return container_of(to_config_group(item), struct gadget_info, group);
-}
-
-struct config_usb_cfg {
-	struct config_group group;
-	struct config_group strings_group;
-	struct list_head string_list;
-	struct usb_configuration c;
-	struct list_head func_list;
-	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
-};
-
-static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
-{
-	return container_of(to_config_group(item), struct config_usb_cfg,
-			group);
-}
-
-struct gadget_strings {
-	struct usb_gadget_strings stringtab_dev;
-	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
-	char *manufacturer;
-	char *product;
-	char *serialnumber;
-
-	struct config_group group;
-	struct list_head list;
-};
-
-struct os_desc {
-	struct config_group group;
-};
-
-struct gadget_config_name {
-	struct usb_gadget_strings stringtab_dev;
-	struct usb_string strings;
-	char *configuration;
-
-	struct config_group group;
-	struct list_head list;
-};
-
 #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
 
 static int usb_string_copy(const char *s, char **s_copy)
diff --git a/drivers/usb/gadget/configfs.h b/drivers/usb/gadget/configfs.h
index 3b6f529..bae403f 100644
--- a/drivers/usb/gadget/configfs.h
+++ b/drivers/usb/gadget/configfs.h
@@ -4,6 +4,74 @@
 
 #include <linux/configfs.h>
 
+#define MAX_USB_STRING_LANGS 2
+
+struct gadget_info {
+	struct config_group group;
+	struct config_group functions_group;
+	struct config_group configs_group;
+	struct config_group strings_group;
+	struct config_group os_desc_group;
+
+	struct mutex lock;
+	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
+	struct list_head string_list;
+	struct list_head available_func;
+
+	struct usb_composite_driver composite;
+	struct usb_composite_dev cdev;
+	bool use_os_desc;
+	char b_vendor_code;
+	char qw_sign[OS_STRING_QW_SIGN_LEN];
+	spinlock_t spinlock;
+	bool unbind;
+};
+
+static inline struct gadget_info *to_gadget_info(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct gadget_info, group);
+}
+
+struct config_usb_cfg {
+	struct config_group group;
+	struct config_group strings_group;
+	struct list_head string_list;
+	struct usb_configuration c;
+	struct list_head func_list;
+	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
+};
+
+static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct config_usb_cfg,
+			group);
+}
+
+struct gadget_strings {
+	struct usb_gadget_strings stringtab_dev;
+	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
+	char *manufacturer;
+	char *product;
+	char *serialnumber;
+
+	struct config_group group;
+	struct list_head list;
+};
+
+struct os_desc {
+	struct config_group group;
+};
+
+struct gadget_config_name {
+	struct usb_gadget_strings stringtab_dev;
+	struct usb_string strings;
+	char *configuration;
+
+	struct config_group group;
+	struct list_head list;
+};
+
+
 void unregister_gadget_item(struct config_item *item);
 
 struct config_group *usb_os_desc_prepare_interf_dir(
-- 
2.7.4

