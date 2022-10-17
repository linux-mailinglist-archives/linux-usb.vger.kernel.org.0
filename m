Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5484601867
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 22:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiJQUAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 16:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiJQT7t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 15:59:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4965413F2F
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 12:59:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1okWGb-0006Qs-8o; Mon, 17 Oct 2022 21:59:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1okWGZ-0028Wk-UF; Mon, 17 Oct 2022 21:59:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1okWGY-008daZ-UC; Mon, 17 Oct 2022 21:59:14 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: dwc2: platform: Improve error reporting for problems during .remove()
Date:   Mon, 17 Oct 2022 21:59:14 +0200
Message-Id: <20221017195914.1426297-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PAIH/QDmtrYY0rlY4KdBzSENG+WSJsGUuYIbadlafwg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjTbQPdVZTqhizX2wsRwfH3DLm3bJOdEt0oliBsSZ/ rlZHPY+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY020DwAKCRDB/BR4rcrsCXWyB/ oCvlpBYdQBvWyYxnl9fUGlUpSAMmWd7ZgYwdDQma9pjwD7M7FHuNxnLWJIqlFSYwOKoJcf9JMJ3iFE Eu2HQsmlahVXGHUPGrTciUeIBe7D5UTHBUmM5GCWyBLwWcxNSMW/OWDO1nnh4fWs951TpK3KRHkT2J ZJRh5sq7udNb/gjtTLlQ6nQtwegYmQQ5Ci48d3a3G7PXybwzWpfZCemNjbNPVxUcv5uHRDWk7fCQnv Oz73N6V8rRzGJdP0quisgl1GExpa17Y4CoaM8Nm/Wv1TfJWLhsgilDqJdsycTYXcXl6WiyKsbdnuPo 3WnJ5qViIScsV3fwGfAGLnODOVI07e
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Returning an error value in a platform driver's remove callback results in
a generic error message being emitted by the driver core, but otherwise it
doesn't make a difference. The device goes away anyhow.

For each case where ret is non-zero the driver already emits an error
message, so suppress the generic error message by returning zero
unconditionally. (Side note: The return value handling was unreliable
anyhow as the value returned by dwc2_exit_hibernation() was overwritten
anyhow if hsotg->in_ppd was non-zero.)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/dwc2/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ec4ace0107f5..262c13b6362a 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -321,7 +321,7 @@ static int dwc2_driver_remove(struct platform_device *dev)
 	reset_control_assert(hsotg->reset);
 	reset_control_assert(hsotg->reset_ecc);
 
-	return ret;
+	return 0;
 }
 
 /**

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

