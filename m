Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8666F4B84F2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbiBPJvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:51:20 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbiBPJvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:51:19 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D862B4058
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645005059; x=1676541059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V+9dCm9T0wjt9iMjw7yZlCUH+2thn4xfYDYfF7VO+oY=;
  b=KU5uKaA+kVJzgd7MqJkhoIxi48Cv9XYH387aUAde+lpJN7lOoj94oG5x
   mwG6w4QyPwlK326n51DbvSmJETt3M5PeztYJCo01+zAoX5HC+FoFzPWNp
   Fys9568PSwrIvR/puCk0OODazcId6xsvK78aRO3XBYssWeudoiep9IfBq
   NmfVfPi3Xc0yvhH7ARcpl6uA1O7Ptg75TKBMCCWE1V4vGRLohC3moCS7h
   rCwwsgYO+irfEg4Ru2zHH68lWI+ofhE6X+ow0Zro8TRwSwnCLsBI6PV3j
   vuwJbxf/en0hzwCGWuNkPU8rEX+EKjXhAdRkwYSciZHkcePkNKdIZ2t/r
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249396968"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="249396968"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="636410361"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 01:50:30 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 7/9] usb: remove Link Powermanagement (LPM) disable before port reset.
Date:   Wed, 16 Feb 2022 11:51:51 +0200
Message-Id: <20220216095153.1303105-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,TVD_SUBJ_WIPE_DEBT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Trying to disable Link Powermanagement (LPM) before port reset is
unnecessary and can cause additional delay if host can't communicate
with the device, which is often the reason why device is reset in the
first place.

usb_disable_lpm() will
- zero usb U1/U2 timeouts for the hub downstream port
- send ENABLE U1/U2 clear feature requests to the connected device.
- increase internal reference count for udev->lpm_disable_count

There is no need to zero U1/U2 hub port timeouts, or clearing the
U1/U2 enable for the connected device before reset. These are set
to default by the reset.

USB 3.1 section 10.2.2 "HUB Downstream port U1/U2 timers" states that:
"the U1 and U2 timeout values for a downstream port reset to the default
values when the port receives a SetPortFeature request for a port reset"

Set the udev->lpm_disable_count to "1" after port reset, which is the
default lpm_disable_count value when allocating udev, representing
disabled LPM.

Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 47a1c8bddf86..b8853219833a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5005,6 +5005,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 		retval = usb_get_bos_descriptor(udev);
 		if (!retval) {
 			udev->lpm_capable = usb_device_supports_lpm(udev);
+			udev->lpm_disable_count = 1;
 			usb_set_lpm_parameters(udev);
 		}
 	}
@@ -5928,16 +5929,6 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 	 */
 	usb_disable_usb2_hardware_lpm(udev);
 
-	/* Disable LPM while we reset the device and reinstall the alt settings.
-	 * Device-initiated LPM, and system exit latency settings are cleared
-	 * when the device is reset, so we have to set them up again.
-	 */
-	ret = usb_unlocked_disable_lpm(udev);
-	if (ret) {
-		dev_err(&udev->dev, "%s Failed to disable LPM\n", __func__);
-		goto re_enumerate_no_bos;
-	}
-
 	bos = udev->bos;
 	udev->bos = NULL;
 
@@ -6042,8 +6033,6 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 re_enumerate:
 	usb_release_bos_descriptor(udev);
 	udev->bos = bos;
-re_enumerate_no_bos:
-	/* LPM state doesn't matter when we're about to destroy the device. */
 	hub_port_logical_disconnect(parent_hub, port1);
 	return -ENODEV;
 }
-- 
2.25.1

