Return-Path: <linux-usb+bounces-1722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D457CBA70
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 07:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292F21C20AA0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 05:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD70BC2CD;
	Tue, 17 Oct 2023 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ijVvXQbg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25329C153
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 05:57:35 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321F9A1
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697522254; x=1729058254;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Bxz/ySsohKc+8wpM7djyVGMmeaqP1RU2uFLJLcmP40=;
  b=ijVvXQbgNmDg747MLTO3GbTg7GckGHpt5UFSwPkDZar40pVlEnN2qAOO
   rBBWHBMFX1I8vW7eyWPAUf02gieTtZqMjIaXE15qxZOWj652rbobIO1hz
   Mrval3nMmKZwoyEoKscT4u90OGkkKBqCMZVxqCh6yK4MtfcCkeZndBeMk
   RFbkR1cadaH5VBRU+KTAnXCpSXqmTfUozqGMiPXc63QFeYgiwPPofZzwI
   L8NpCcTjM9ByJaCeHoZuBCrF3sdlz7/GvZPfYBLh10d/4Ruhq7SOkclH9
   DjuwXH5M66S9SIX8WqU1+z1hFggp3x0NYO08RMruhn9Ce9THje7xwyLLb
   w==;
X-IronPort-AV: E=Sophos;i="6.03,231,1694728800"; 
   d="scan'208";a="33493798"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Oct 2023 07:57:26 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F0877280082;
	Tue, 17 Oct 2023 07:57:25 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux-usb@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] usb: dwc3: let role switch handle initial state
Date: Tue, 17 Oct 2023 07:57:26 +0200
Message-Id: <20231017055726.904133-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

When we have a role switch device attached, we should not configure our
initial role. Leave this up to the role switch device, that should
detect and signal the initial role.

This fixes situations where a Type-A plug is connected already when the
driver is loaded but the default role is set to none or device. In this
case only an disconnect / reconnect gets the correct mode.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I couldn't find any information whether USB role switch drivers are
supposed to call usb_role_switch_set_role() during their probe.
But this seems sensible, otherwise the actual/initial state is unknown.

 drivers/usb/dwc3/drd.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 039bf241769af..1c2e504a5d8ba 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -496,15 +496,8 @@ static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 static int dwc3_setup_role_switch(struct dwc3 *dwc)
 {
 	struct usb_role_switch_desc dwc3_role_switch = {NULL};
-	u32 mode;
 
 	dwc->role_switch_default_mode = usb_get_role_switch_default_mode(dwc->dev);
-	if (dwc->role_switch_default_mode == USB_DR_MODE_HOST) {
-		mode = DWC3_GCTL_PRTCAP_HOST;
-	} else {
-		dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
-		mode = DWC3_GCTL_PRTCAP_DEVICE;
-	}
 
 	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
 	dwc3_role_switch.set = dwc3_usb_role_switch_set;
@@ -526,7 +519,11 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 		}
 	}
 
-	dwc3_set_mode(dwc, mode);
+	/*
+	 * usb_role_switch should implement initial detection and call
+	 * dwc3_usb_role_switch_set to get the state machine running
+	 */
+
 	return 0;
 }
 #else
-- 
2.34.1


