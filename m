Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C2C401A79
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 13:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241342AbhIFLSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 07:18:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:9736 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241325AbhIFLSk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Sep 2021 07:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630927056; x=1662463056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QZYsq6b5s+pywVMveDm9kB+jyF/j0Ne5daEpjp3QOGM=;
  b=VpA3Q354cl9Y4zWxcr3nIfZn3ObW0k+pkIlXsHlEhCynLwbaTHGPsKo4
   enAo9AK3wTVKxOeHZtzIF1a5vPlzRtDDWuexPgkP2oq4SRhnDiOM90oqC
   M7GlLe8o9QnBf1wUKNUGK6qzTcpws4aRwyC78bBj0Y0h19zBcpWzLpShj
   c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 04:17:36 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 04:17:35 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 6 Sep 2021 04:17:33 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 3/3] usb: gadget: configfs: add some trace event
Date:   Mon, 6 Sep 2021 19:17:21 +0800
Message-ID: <1630927041-10175-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630927041-10175-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630927041-10175-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add UDC, cfg link/unlink and some attributes trace
to better trace gadget issues.

Suggested-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: build trace inside configfs.c

 drivers/usb/gadget/configfs.c | 54 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index f766756..509daf5 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -103,6 +103,42 @@ struct gadget_config_name {
 	struct list_head list;
 };
 
+#define MAX_CONFIGURAITON_STR_LEN	512
+
+static char *config_trace_string(struct gadget_info *gi)
+{
+	struct usb_configuration *uc;
+	struct config_usb_cfg *cfg;
+	struct config_usb_function *cf;
+	static char trs[MAX_CONFIGURAITON_STR_LEN];
+	size_t len = MAX_CONFIGURAITON_STR_LEN;
+	int n = 0;
+
+	trs[0] = '\0';
+
+	list_for_each_entry(uc, &gi->cdev.configs, list) {
+		cfg = container_of(uc, struct config_usb_cfg, c);
+
+		n += scnprintf(trs + n, len - n,
+			"group:%s,bConfigurationValue:%d,bmAttributes:%d,"
+			"MaxPower:%d,",
+			config_item_name(&cfg->group.cg_item),
+			uc->bConfigurationValue,
+			uc->bmAttributes,
+			uc->MaxPower);
+
+		n += scnprintf(trs + n, len - n, "function:[");
+		list_for_each_entry(cf, &cfg->func_list, list)
+			n += scnprintf(trs + n, len - n, "%s", cf->f->name);
+		n += scnprintf(trs + n, len - n, "},");
+	}
+
+	return trs;
+}
+
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
+
 #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
 
 static int usb_string_copy(const char *s, char **s_copy)
@@ -210,6 +246,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 	if (ret)
 		return ret;
 
+	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
 	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
 	return len;
 }
@@ -228,6 +265,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		return ret;
 
 	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
 	return len;
 }
 
@@ -240,6 +278,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
 	mutex_lock(&gi->lock);
 	udc_name = gi->composite.gadget_driver.udc_name;
 	ret = sprintf(page, "%s\n", udc_name ?: "");
+	trace_gadget_dev_desc_UDC_show(gi);
 	mutex_unlock(&gi->lock);
 
 	return ret;
@@ -249,6 +288,7 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
+	trace_unregister_gadget(gi);
 	if (!gi->composite.gadget_driver.udc_name)
 		return -ENODEV;
 
@@ -276,6 +316,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	if (name[len - 1] == '\n')
 		name[len - 1] = '\0';
 
+	trace_gadget_dev_desc_UDC_store(gi);
+
 	mutex_lock(&gi->lock);
 
 	if (!strlen(name)) {
@@ -296,6 +338,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 		}
 	}
 	mutex_unlock(&gi->lock);
+
+	trace_gadget_dev_desc_UDC_store(gi);
 	return len;
 err:
 	kfree(name);
@@ -308,6 +352,7 @@ static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
 {
 	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
 	return sprintf(page, "%s\n", usb_speed_string(speed));
 }
 
@@ -337,6 +382,8 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 
 	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_store(gi);
+
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -468,6 +515,7 @@ static int config_usb_cfg_link(
 	list_add_tail(&cf->list, &cfg->func_list);
 	ret = 0;
 out:
+	trace_config_usb_cfg_link(gi);
 	mutex_unlock(&gi->lock);
 	return ret;
 }
@@ -500,10 +548,12 @@ static void config_usb_cfg_unlink(
 			list_del(&cf->list);
 			usb_put_function(cf->f);
 			kfree(cf);
+			trace_config_usb_cfg_unlink(gi);
 			mutex_unlock(&gi->lock);
 			return;
 		}
 	}
+	trace_config_usb_cfg_unlink(gi);
 	mutex_unlock(&gi->lock);
 	WARN(1, "Unable to locate function to unbind\n");
 }
@@ -518,6 +568,7 @@ static struct configfs_item_operations gadget_config_item_ops = {
 static ssize_t gadget_config_desc_MaxPower_show(struct config_item *item,
 		char *page)
 {
+	trace_gadget_config_desc_MaxPower_show(to_config_usb_cfg(item)->gi);
 	return sprintf(page, "%u\n", to_config_usb_cfg(item)->c.MaxPower);
 }
 
@@ -532,12 +583,14 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
 	to_config_usb_cfg(item)->c.MaxPower = val;
+	trace_gadget_config_desc_MaxPower_store(to_config_usb_cfg(item)->gi);
 	return len;
 }
 
 static ssize_t gadget_config_desc_bmAttributes_show(struct config_item *item,
 		char *page)
 {
+	trace_gadget_config_desc_bmAttributes_show(to_config_usb_cfg(item)->gi);
 	return sprintf(page, "0x%02x\n",
 		to_config_usb_cfg(item)->c.bmAttributes);
 }
@@ -556,6 +609,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
 	to_config_usb_cfg(item)->c.bmAttributes = val;
+	trace_gadget_config_desc_bmAttributes_store(to_config_usb_cfg(item)->gi);
 	return len;
 }
 
-- 
2.7.4

