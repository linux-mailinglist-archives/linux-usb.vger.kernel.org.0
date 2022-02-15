Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E204B7AB6
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 23:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243497AbiBOWuD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 17:50:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbiBOWuC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 17:50:02 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26855D5F4D
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 14:49:52 -0800 (PST)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFE3042165;
        Tue, 15 Feb 2022 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1644965392; bh=qNVtGEGsNSUZgmZS0YARhqrD6TkH8GNPHnxVaBqLtK4=;
        h=Date:From:Subject:To:Cc:From;
        b=FgcBZ/aOaHBBqNR+hcpdOsZxg96+pWP6Yuy9AaFFcuCTFW0Wl27iVYFvG0CxnP0xq
         JQhjQr1MlaO9JPnRHKt1bbFSB0wiOzFy8xWXCNrhJSEf+n/w8nGXIkkR1OjuyufClR
         WWRRjXA2jnjN+sRv+JX3Z9uGegr+koXc5hpJZ52aEX38lMkcrYyMQ5fYmOuTV1rTu6
         yZeCjgj0FnnAR+8slfQc1Krr9Kl1eVRFLx8k4cByVqWRu5eXg6n871iiObUN3KCAqY
         aCfhxAJICWX2k6/4nWq2gVIbIVjsG3lS5PihXXH8jsGxBREcxO73QIwkj8fqQjGVP5
         RSPxQ1xtxIrTQ==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 22AF0A0062;
        Tue, 15 Feb 2022 22:49:48 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Tue, 15 Feb 2022 14:49:48 -0800
Date:   Tue, 15 Feb 2022 14:49:48 -0800
Message-Id: <9f15580ad5810b1e5f31c241b35ebedfbfc30a3f.1644964864.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: drd: Don't check against CONFIG_OF
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CONFIG_OF maybe set, but it may not be applicable to a device. In
such case, checking against that can cause the device fail to
initialize. Check against the device node (device->of_node) instead.

Fixes: a102f07e4edf ("usb: dwc3: drd: Add support for usb-conn-gpio based usb-role-switch")
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Note: This patch should go on Greg's "usb-testing" branch as the commit it
fixes is not in mainline yet.

 drivers/usb/dwc3/drd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 25f322e62d3f..b60b5f7b6dff 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -560,7 +560,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
-	if (IS_ENABLED(CONFIG_OF)) {
+	if (dwc->dev->of_node) {
 		/* populate connector entry */
 		int ret = devm_of_platform_populate(dwc->dev);
 

base-commit: 9902951f536c00b7f20c26fd98baa5432bb3c731
-- 
2.28.0

