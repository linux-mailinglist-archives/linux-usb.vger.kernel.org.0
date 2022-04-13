Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6501C4FF44B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 11:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiDMKAs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 06:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbiDMKAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 06:00:46 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2E956438
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649843906; x=1681379906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8TAInZ+uPcAyAixNcHUsNoJmVxZYBfOb2TtzivSgmrw=;
  b=i7WNbL3UAFWbr+h24zczBwEZqfJonXS2RY7YKT4P+uHUFpEiEnWTF1Eg
   zs9EJ9wQG5YcR60vwn1HE4JIToDD+zFVHc1G6Qob25qpAOGJprDP2kvgj
   V+hwbiQObw8zVHKiiyaGcj5GQWUSUpLpKjZk7nqdNkc5HB+ymT0frKENE
   I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Apr 2022 02:58:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 02:58:26 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 02:58:25 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 02:58:24 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 3/4] usb: typec: ucsi: do not allocate one extra unused connector
Date:   Wed, 13 Apr 2022 17:58:10 +0800
Message-ID: <1649843891-15554-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
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

ucsi_connector_clean() will use actual connector number in the loop,
there is no need to allocate one extral as the ending.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: new change
v3: no change

 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index af9a2a1..ce9192e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1251,7 +1251,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Allocate the connectors. Released in ucsi_unregister() */
-	ucsi->connector = kcalloc(ucsi->cap.num_connectors + 1,
+	ucsi->connector = kcalloc(ucsi->cap.num_connectors,
 				  sizeof(*ucsi->connector), GFP_KERNEL);
 	if (!ucsi->connector) {
 		ret = -ENOMEM;
-- 
2.7.4

