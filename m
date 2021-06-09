Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706633A1EFD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 23:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhFIVaS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 17:30:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42312 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFIVaR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 17:30:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623274103; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MB15MJVdGrj+fADaOU1Z2j6lOy0jG4z+OU5OpNteFuo=; b=HJkqXLuNZHj84H9JsH9QJFxBezlpswBrSMvt1FRA83GoU/WsJoFCe+2/XvWgjDWhBYLhRf6Y
 bdaD6A7WNlx+9ZyhutN+yhcg8gMuX824nbkmKNoXcgw+1Gt/eGecbSmIB/aR/F3SZr21A4fG
 569YNQ45Y2Qpa4StCR+vbB0OIZ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c1326cabfd22a3dc72a383 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 21:28:12
 GMT
Sender: subbaram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58BD3C43460; Wed,  9 Jun 2021 21:28:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from subbaram-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: subbaram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55B90C433F1;
        Wed,  9 Jun 2021 21:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 55B90C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=subbaram@codeaurora.org
From:   Subbaraman Narayanamurthy <subbaram@codeaurora.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Mayank Rana <mrana@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH] usb: typec: ucsi: Fix a comment in ucsi_init()
Date:   Wed,  9 Jun 2021 14:27:56 -0700
Message-Id: <1623274076-6287-1-git-send-email-subbaram@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ucsi_unregister_ppm() got replaced with ucsi_unregister(). Fix
the comment in ucsi_init() as well.

Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b433169..96cf541 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1219,7 +1219,7 @@ static int ucsi_init(struct ucsi *ucsi)
 		goto err_reset;
 	}
 
-	/* Allocate the connectors. Released in ucsi_unregister_ppm() */
+	/* Allocate the connectors. Released in ucsi_unregister() */
 	ucsi->connector = kcalloc(ucsi->cap.num_connectors + 1,
 				  sizeof(*ucsi->connector), GFP_KERNEL);
 	if (!ucsi->connector) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

