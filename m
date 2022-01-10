Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D4E4898CA
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 13:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245630AbiAJMng (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 07:43:36 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:9683 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231326AbiAJMnf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 07:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641818615; x=1673354615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H1uc7UVO1VqS4V5EDCF5PoomVe1NwUCgAEMpMDAMZ1U=;
  b=CgTgY8CdmbcJ4AoaOJpO4iaQVgPmMZKd1OvXxfpeonhwNMhsozMicBvd
   fv/jcts42sz2NY1XDO6F/RYO9lB3rG7g/YbGDApkUjIDeYWKyOAEl7X9g
   RimYREdmCNWhF/Sb7jT9QYzQnmWM4RWJnLGS752cKNQuJn/G5kcOMcl/U
   U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Jan 2022 04:43:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 04:43:34 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 04:43:34 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 04:43:32 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2] usb: roles: fix include/linux/usb/role.h compile issue
Date:   Mon, 10 Jan 2022 20:43:28 +0800
Message-ID: <1641818608-25039-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when CONFIG_USB_ROLE_SWITCH is not defined,
add usb_role_switch_find_by_fwnode() definition which return NULL.

Fixes: c6919d5e0cd1 ("usb: roles: Add usb_role_switch_find_by_fwnode()")
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: add Fixes tag

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

