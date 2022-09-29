Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E605EEFA5
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 09:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbiI2HtP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 03:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbiI2HtK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 03:49:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CE513A96B
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 00:49:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E64861FA9
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 07:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14941C433D6;
        Thu, 29 Sep 2022 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664437743;
        bh=ceUFbXftao2QjWl3JLQng8G811gghnGwmbdZ5muzfBw=;
        h=From:To:Cc:Subject:Date:From;
        b=rj4lF+YlkHSm5TwevCpWMdhsVamHqCLsQRTakUoJySpxA5q2IazgZtg6ZC706ew44
         Cmv5nnENXBQ7xJDIXLZy+9R3pf3OMrJ4eEWp+6Cy7YmKDLl3UUlZObjaeqWEizg263
         WqLub4IMUzFRi+pr2npTfw0+a/F7+lthEZ3cDqaJTAPE0J6A8g79zcHu5ghHzk1JeS
         t9Yc8ZVd22GQvTwzLED+F/AuoiDq6p1HHP9IiS+k2zLya9vfDdYYD8Ds3K098MGxgO
         gsprmwOGcIZSEcYm+ws/G1Efzlha1tS4RQ8xekxOybq1TqWlZAOHXaGVJcqGuFDkmc
         0YXmfWmvSZR9A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] MAINTAINERS: switch dwc3 to Thinh
Date:   Thu, 29 Sep 2022 10:48:44 +0300
Message-Id: <20220929074844.351938-1-balbi@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thinh Nguyen has agreed to become the new dwc3 maintainer seeing that
I haven't had time to dedicate to the mailing list.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5ca4aefd184..2cd29b4add81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5898,10 +5898,9 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
 F:	drivers/usb/dwc2/
 
 DESIGNWARE USB3 DRD IP DRIVER
-M:	Felipe Balbi <balbi@kernel.org>
+M:	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
 F:	drivers/usb/dwc3/
 
 DEVANTECH SRF ULTRASONIC RANGER IIO DRIVER
-- 
2.37.3

