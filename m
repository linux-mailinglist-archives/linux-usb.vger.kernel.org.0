Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D89A3F56DE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 05:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbhHXD4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 23:56:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:65129 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbhHXD4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 23:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629777318; x=1661313318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ql9IFwzvmcGkbx7Q4DxwFRBpOLSH4M13mtKUGEsC2Go=;
  b=HzydB3ltH+DZ9VK//D7D7xW8CWi/9CnT2ESUyqDlspF67cw7AOa0BzCN
   VZiCQISMofoG65amP/V3uHYUe80IcKkmWzlpScBMoKnYe7X1k9TGzgolz
   CnMb50+GY7m84LS9XCstfXODQeW2RaKb8GpDE5qyGhaISDaq5jCDZ+HbU
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 23 Aug 2021 20:55:17 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 20:55:17 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7;
 Mon, 23 Aug 2021 20:55:15 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH V4 3/3] usb: gadget: configfs: add function unlink trace entry
Date:   Tue, 24 Aug 2021 11:54:41 +0800
Message-ID: <1629777281-30188-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add trace in function config_usb_cfg_unlink()
whill show which function was removed from gadget configuraion.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c       |  4 ++++
 drivers/usb/gadget/configfs_trace.h | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 8c64640..4024f9b 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -479,6 +479,10 @@ static void config_usb_cfg_unlink(
 			struct usb_function_instance, group);
 	struct usb_function *f;
 
+	trace_config_usb_cfg_unlink(config_item_name(&gi->group.cg_item),
+				config_item_name(usb_cfg_ci),
+				config_item_name(usb_func_ci));
+
 	/*
 	 * ideally I would like to forbid to unlink functions while a gadget is
 	 * bound to an UDC. Since this isn't possible at the moment, we simply
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
index 5c666f1..82e0121 100644
--- a/drivers/usb/gadget/configfs_trace.h
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -43,6 +43,23 @@ TRACE_EVENT(config_usb_cfg_link,
 		__get_str(cfg_name), __get_str(func_name))
 );
 
+TRACE_EVENT(config_usb_cfg_unlink,
+	TP_PROTO(char *name, char *cfg, char *func),
+	TP_ARGS(name, cfg, func),
+	TP_STRUCT__entry(
+		__string(group_name, name)
+		__string(cfg_name, cfg)
+		__string(func_name, func)
+	),
+	TP_fast_assign(
+		__assign_str(group_name, name);
+		__assign_str(cfg_name, cfg);
+		__assign_str(func_name, func)
+	),
+	TP_printk("gadget:%s cfg:%s unlink func:%s", __get_str(group_name),
+		__get_str(cfg_name), __get_str(func_name))
+);
+
 #endif /* __GADGET_TRACE_H */
 
 /* this part has to be here */
-- 
2.7.4

