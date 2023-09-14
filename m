Return-Path: <linux-usb+bounces-11-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BB79F5E4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 02:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FAE328180C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 00:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE64D37C;
	Thu, 14 Sep 2023 00:31:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF2363
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 00:31:53 +0000 (UTC)
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6695F1727;
	Wed, 13 Sep 2023 17:31:52 -0700 (PDT)
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3083717|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00366759-0.000116842-0.996216;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=michael@allwinnertech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.UeY3CYB_1694651508;
Received: from SunxiBot.allwinnertech.com(mailfrom:michael@allwinnertech.com fp:SMTPD_---.UeY3CYB_1694651508)
          by smtp.aliyun-inc.com;
          Thu, 14 Sep 2023 08:31:49 +0800
From: Michael Wu <michael@allwinnertech.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb:typec:tcpm:support double Rp to Vbus cable as sink
Date: Thu, 14 Sep 2023 08:31:54 +0800
Message-Id: <20230914003154.27977-1-michael@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB Type-C Cable and Connector Specification defines the wire
connections for the USB Type-C to USB 2.0 Standard-A cable assembly
(Release 2.2, Chapter 3.5.2).
The Notes says that Pin A5 (CC) of the USB Type-C plug shall be connected
to Vbus through a resister Rp.
However, there is a large amount of such double Rp connected to Vbus
non-standard cables which produced by UGREEN circulating on the market, and
it can affects the normal operations of the state machine easily,
especially to CC1 and CC2 be pulled up at the same time.
In fact, we can regard those cables as sink to avoid abnormal state.

Message as follow:
[   58.900212] VBUS on
[   59.265433] CC1: 0 -> 3, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
[   62.623308] CC1: 3 -> 0, CC2: 3 -> 0 [state TOGGLING, polarity 0, disconnected]
[   62.625006] VBUS off
[   62.625012] VBUS VSAFE0V

Signed-off-by: Michael Wu <michael@allwinnertech.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d962f67c95ae6..beb7143128667 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -519,7 +519,8 @@ static const char * const pd_rev[] = {
 
 #define tcpm_port_is_sink(port) \
 	((tcpm_cc_is_sink((port)->cc1) && !tcpm_cc_is_sink((port)->cc2)) || \
-	 (tcpm_cc_is_sink((port)->cc2) && !tcpm_cc_is_sink((port)->cc1)))
+	 (tcpm_cc_is_sink((port)->cc2) && !tcpm_cc_is_sink((port)->cc1)) || \
+	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
 
 #define tcpm_cc_is_source(cc) ((cc) == TYPEC_CC_RD)
 #define tcpm_cc_is_audio(cc) ((cc) == TYPEC_CC_RA)
-- 
2.29.0


