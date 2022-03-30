Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361754EBAAE
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 08:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243219AbiC3GUS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 02:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241532AbiC3GUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 02:20:17 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD393A1
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648621111; x=1680157111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5i4WrbHZ3B89Gh8SFh9sI/F3XEquS0UxluBNuWjZxwM=;
  b=kT0p4UKGDz/lUXGjKnyFaKLoZc8rhhCbur6Y1MNVAI8vQCNUasfacqjR
   ogG6GJe8xkHGRdkxg33scWQZl+SgxDgSERvmSP6unzi7Y3FcnB+FIrGQj
   cRt9+iNaPCwIky/zqfXCGCpW7RrPNLC4Bb0zEvum9Fm/lelhXDHHH2aXL
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Mar 2022 23:18:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 23:18:27 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 23:18:27 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 23:18:25 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v4 1/5] usb: gadget: remove gadgets_type storage type 'static'
Date:   Wed, 30 Mar 2022 14:18:03 +0800
Message-ID: <1648621087-14948-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648621087-14948-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1648621087-14948-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Prepare for new trace event function which will use gadgets_type variable.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: first add this change
v4: no change

 drivers/usb/gadget/configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 1fb837d..b2beeda 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1642,7 +1642,7 @@ static struct configfs_group_operations gadgets_ops = {
 	.drop_item      = &gadgets_drop,
 };
 
-static const struct config_item_type gadgets_type = {
+const struct config_item_type gadgets_type = {
 	.ct_group_ops   = &gadgets_ops,
 	.ct_owner       = THIS_MODULE,
 };
-- 
2.7.4

