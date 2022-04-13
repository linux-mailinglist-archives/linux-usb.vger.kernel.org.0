Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9592F4FF449
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 11:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiDMKAo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 06:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiDMKAn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 06:00:43 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D7056C11
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649843903; x=1681379903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i3yFDNlfQXDk1VVC2DRYh8H4cghmhSpH8j9MWcrcRDE=;
  b=QuWnKUZa7JTxpT2oW+IHF84BZnX7sI9vXEpPRV6phEP6AP6HKilgAVcv
   PGhRX7f08TGA/rRFA8+tVs6vs0jfT4GIjwTtqnHFCICbTo9Pz+z1jHJZF
   wbYLV4rmLChYdabhwtHa6GIb1FMptNdcUURPjv6tMDSMeOGH5wcWkxp7P
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Apr 2022 02:58:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 02:58:22 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 02:58:22 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 02:58:20 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 1/4] usb: typec: ucsi: set con->port to NULL when register port fail
Date:   Wed, 13 Apr 2022 17:58:08 +0800
Message-ID: <1649843891-15554-2-git-send-email-quic_linyyuan@quicinc.com>
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

As con->port will be used in error path of ucsi_init(),
it should be NULL or valid.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: no change

 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f0c2fa1..77ac0b7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1100,6 +1100,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	con->port = typec_register_port(ucsi->dev, cap);
 	if (IS_ERR(con->port)) {
 		ret = PTR_ERR(con->port);
+		con->port = NULL;
 		goto out;
 	}
 
-- 
2.7.4

