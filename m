Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B674896CA
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 11:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244305AbiAJKzg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 05:55:36 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:22566 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244285AbiAJKzd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 05:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641812133; x=1673348133;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=joPka2jkPOragxL9EoMCs294rCu3CbGhE6MslWWAuVE=;
  b=ZLkvvbIbfY17AWTIulAOKzag0vGZxEFDN9hZ3QMN2ueN94+9gvLGxwMM
   oy4vbEhhJf8WXM7aotVdKPnWnmxBezOmt9Y3A5EMZ6M+ZEqeqpirCDxUY
   wkxa4RFCouiEuag1jpJQkMneX3JqSkNHi/ZBmMwKfBuEl/5PK2IoVtLmw
   k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Jan 2022 02:55:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 02:55:32 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 02:55:32 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 02:55:30 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH] usb: roles: fix include/linux/usb/role.h compile issue
Date:   Mon, 10 Jan 2022 18:55:26 +0800
Message-ID: <1641812126-8284-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when CONFIG_USB_ROLE_SWITCH is not defined,
add usb_role_switch_find_by_fwnode() definition which return NULL.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 include/linux/usb/role.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index 031f148..b5deafd 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -92,6 +92,12 @@ fwnode_usb_role_switch_get(struct fwnode_handle *node)
 static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
 
 static inline struct usb_role_switch *
+usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
+static inline struct usb_role_switch *
 usb_role_switch_register(struct device *parent,
 			 const struct usb_role_switch_desc *desc)
 {
-- 
2.7.4

