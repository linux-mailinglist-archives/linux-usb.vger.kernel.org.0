Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3532B52FB7B
	for <lists+linux-usb@lfdr.de>; Sat, 21 May 2022 13:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347652AbiEULPZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 May 2022 07:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355020AbiEULOF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 May 2022 07:14:05 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870731312B0;
        Sat, 21 May 2022 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k0xGUi45Pmhckpj1HUc6z8Jrm9BIzWJyP6t9OROWXAU=;
  b=HFbqzgnxC9KLOvz/wGXvdMbu0Wiw6fJHSQ9vBxZMZ4FALLcn0U645L1U
   lDkVW3yvDkgUPpYykoMk4w/pAN00Blb47vHAKZOW0XOjjF5z86dmNg3OY
   oIsCj/eL5jNK+yur/uQ2D4nFhq7BUh4lYWFy/P0U1LuojTB6fNLo1P59k
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; 
   d="scan'208";a="14727993"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:07 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] USB: chipidea: fix typo in comment
Date:   Sat, 21 May 2022 13:11:35 +0200
Message-Id: <20220521111145.81697-85-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/usb/chipidea/ci_hdrc_imx.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 999c65390b7f..7daccb9c5006 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -21,7 +21,7 @@ struct imx_usbmisc_data {
 	unsigned int pwr_pol:1; /* power polarity */
 	unsigned int evdo:1; /* set external vbus divider option */
 	unsigned int ulpi:1; /* connected to an ULPI phy */
-	unsigned int hsic:1; /* HSIC controlller */
+	unsigned int hsic:1; /* HSIC controller */
 	unsigned int ext_id:1; /* ID from exteranl event */
 	unsigned int ext_vbus:1; /* Vbus from exteranl event */
 	struct usb_phy *usb_phy;

