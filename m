Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66F84553FB
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 05:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243071AbhKRE4u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 23:56:50 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41330 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243066AbhKRE4t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 23:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637211230; x=1668747230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZFP5MoPFcjZDqUfIjfPVkKKqptAWVupotSolFT4/6bE=;
  b=pubHmQlTHzZfCUJHB2P3tBExto2Wy3UXr4NcbUbEQKv7dcQRLeAhx2ZG
   UNDe1DFztlOCJ6lZRNLJcvsvwrTEOevSf0JQETJvXWV/eikJLI3PUqGqv
   MJdcfzIS92dris+429ijM6bNFyY6hx/k80uuvvlDIlxY77wFyhV39OuuH
   w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2021 20:53:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 20:53:50 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:48 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:47 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 3/4] usb: gadget: configfs: use to_config_usb_cfg() in os_desc_link()
Date:   Thu, 18 Nov 2021 12:53:32 +0800
Message-ID: <1637211213-16400-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

replace open-coded container_of() with to_config_usb_cfg() helper.

Reviewed-by: Jack Pham <quic_jackp@quicinc.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ae0890a..ff0fb33 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -883,9 +883,7 @@ static int os_desc_link(struct config_item *os_desc_ci,
 {
 	struct gadget_info *gi = os_desc_item_to_gadget_info(os_desc_ci);
 	struct usb_composite_dev *cdev = &gi->cdev;
-	struct config_usb_cfg *c_target =
-		container_of(to_config_group(usb_cfg_ci),
-			     struct config_usb_cfg, group);
+	struct config_usb_cfg *c_target = to_config_usb_cfg(usb_cfg_ci);
 	struct usb_configuration *c;
 	int ret;
 
-- 
2.7.4

