Return-Path: <linux-usb+bounces-2167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C60267D6781
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 11:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8048D281C8A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 09:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456AB2376B;
	Wed, 25 Oct 2023 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OG8gZfG+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC31614ABC
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 09:51:16 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B95DDC
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698227474; x=1729763474;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=emAhjz/xRID/Q4sR/oU7X6DTNgmemdhnoIWxWZUXd3g=;
  b=OG8gZfG+WgXfd5pioecFdd5qUPwHJEuyG8p/sjVybUeQMRZZnDIaIxKt
   53Jh95vCboYr9jwH5ym4y0Ow8LhatkOhG3VPy7jlp+37jx4fBt3sv49EV
   Yeo1cmJsSff21hKzLXVL74u/l8ptUdH3gyUZ5DoO64/HzzcH49vJIbT4U
   ugcWAPGSlJyFFJY820pEpuxZEJth+QQ9AEULUcP+rpPjxbvRuU6UHHah8
   05GgIYMqTUm5qe/8RLUQZhXyQeRjsJy/dg0riWpvWs8o26uCGO8mmWZ6z
   76YCt+NFJQWOYmzVqmaV+SC/xtpi6hQVsrsfq5Xbb492QbUSkhQsW0+ka
   g==;
X-IronPort-AV: E=Sophos;i="6.03,250,1694728800"; 
   d="scan'208";a="33645384"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Oct 2023 11:51:11 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D4EBF28007F;
	Wed, 25 Oct 2023 11:51:11 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/1] usb: dwc3: Fix default mode initialization
Date: Wed, 25 Oct 2023 11:51:10 +0200
Message-Id: <20231025095110.2405281-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default mode, configurable by DT, shall be set before usb role switch
driver is registered. Otherwise there is a race between default mode
and mode set by usb role switch driver.

Fixes: 98ed256a4dbad ("usb: dwc3: Add support for role-switch-default-mode binding")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is a different approach to [1] to fix the race upon dwc3 role
initialization. dwc3_set_mode() needs to be called in dwc3_setup_role_switch()
to ensure the mode is initialized.
The usb role switch driver probe might be delayed or defered for some unrelated
reason, leaving the dwc3 mode unitialized if dwc3_set_mode() is not called here.

[1] https://lore.kernel.org/linux-usb/2176034.Icojqenx9y@steina-w/T/

 drivers/usb/dwc3/drd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 039bf241769af..57ddd2e43022e 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -505,6 +505,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
 		mode = DWC3_GCTL_PRTCAP_DEVICE;
 	}
+	dwc3_set_mode(dwc, mode);
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
 	dwc3_role_switch.set = dwc3_usb_role_switch_set;
@@ -526,7 +527,6 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 		}
 	}
 
-	dwc3_set_mode(dwc, mode);
 	return 0;
 }
 #else
-- 
2.34.1


