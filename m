Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2A338288E
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 11:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236114AbhEQJlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 05:41:46 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2950 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236101AbhEQJlq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 05:41:46 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FkDZH421GzCsvB;
        Mon, 17 May 2021 17:37:43 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 17:40:28 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 17:40:27 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] usb: fix spelling mistakes in header files
Date:   Mon, 17 May 2021 17:40:20 +0800
Message-ID: <20210517094020.7310-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix some spelling mistakes in comments:
trasfer ==> transfer
consumtion ==> consumption
endoint ==> endpoint
sharable ==> shareable
contraints ==> constraints
Auxilary ==> Auxiliary
correspondig ==> corresponding
interupt ==> interrupt
inifinite ==> infinite
assignement ==> assignment

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 include/linux/usb.h           | 2 +-
 include/linux/usb/composite.h | 2 +-
 include/linux/usb/gadget.h    | 2 +-
 include/linux/usb/hcd.h       | 4 ++--
 include/linux/usb/otg-fsm.h   | 6 +++---
 include/linux/usb/otg.h       | 2 +-
 include/linux/usb/quirks.h    | 2 +-
 include/linux/usb/serial.h    | 2 +-
 include/linux/usb/typec_dp.h  | 2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index eaae24217e8a..4db6b824af5c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1485,7 +1485,7 @@ typedef void (*usb_complete_t)(struct urb *);
  *
  * Note that transfer_buffer must still be set if the controller
  * does not support DMA (as indicated by hcd_uses_dma()) and when talking
- * to root hub. If you have to trasfer between highmem zone and the device
+ * to root hub. If you have to transfer between highmem zone and the device
  * on such controller, create a bounce buffer or bail out with an error.
  * If transfer_buffer cannot be set (is in highmem) and the controller is DMA
  * capable, assign NULL to it, so that usbmon knows not to use the value.
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index c71150f2c639..9d2762279286 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -271,7 +271,7 @@ int config_ep_by_speed(struct usb_gadget *g, struct usb_function *f,
  * @bConfigurationValue: Copied into configuration descriptor.
  * @iConfiguration: Copied into configuration descriptor.
  * @bmAttributes: Copied into configuration descriptor.
- * @MaxPower: Power consumtion in mA. Used to compute bMaxPower in the
+ * @MaxPower: Power consumption in mA. Used to compute bMaxPower in the
  *	configuration descriptor after considering the bus speed.
  * @cdev: assigned by @usb_add_config() before calling @bind(); this is
  *	the device associated with this configuration.
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index ee04ef214ce8..8811eb96e5cc 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -197,7 +197,7 @@ struct usb_ep_caps {
  * @name:identifier for the endpoint, such as "ep-a" or "ep9in-bulk"
  * @ops: Function pointers used to access hardware-specific operations.
  * @ep_list:the gadget's ep_list holds all of its endpoints
- * @caps:The structure describing types and directions supported by endoint.
+ * @caps:The structure describing types and directions supported by endpoint.
  * @enabled: The current endpoint enabled/disabled state.
  * @claimed: True if this endpoint is claimed by a function.
  * @maxpacket:The maximum packet size used on this endpoint.  The initial
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 96281cd50ff6..e07a51597778 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -59,7 +59,7 @@
  * USB Host Controller Driver (usb_hcd) framework
  *
  * Since "struct usb_bus" is so thin, you can't share much code in it.
- * This framework is a layer over that, and should be more sharable.
+ * This framework is a layer over that, and should be more shareable.
  */
 
 /*-------------------------------------------------------------------------*/
@@ -299,7 +299,7 @@ struct hc_driver {
 	 * (optional) these hooks allow an HCD to override the default DMA
 	 * mapping and unmapping routines.  In general, they shouldn't be
 	 * necessary unless the host controller has special DMA requirements,
-	 * such as alignment contraints.  If these are not specified, the
+	 * such as alignment constraints.  If these are not specified, the
 	 * general usb_hcd_(un)?map_urb_for_dma functions will be used instead
 	 * (and it may be a good idea to call these functions in your HCD
 	 * implementation)
diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
index e78eb577d0fa..3aee78dda16d 100644
--- a/include/linux/usb/otg-fsm.h
+++ b/include/linux/usb/otg-fsm.h
@@ -98,7 +98,7 @@ enum otg_fsm_timer {
  * @b_bus_req:	TRUE during the time that the Application running on the
  *		B-device wants to use the bus
  *
- *	Auxilary inputs (OTG v1.3 only. Obsolete now.)
+ *	Auxiliary inputs (OTG v1.3 only. Obsolete now.)
  * @a_sess_vld:	TRUE if the A-device detects that VBUS is above VA_SESS_VLD
  * @b_bus_suspend: TRUE when the A-device detects that the B-device has put
  *		the bus into suspend
@@ -153,7 +153,7 @@ struct otg_fsm {
 	int a_bus_req;
 	int b_bus_req;
 
-	/* Auxilary inputs */
+	/* Auxiliary inputs */
 	int a_sess_vld;
 	int b_bus_resume;
 	int b_bus_suspend;
@@ -177,7 +177,7 @@ struct otg_fsm {
 	int a_bus_req_inf;
 	int a_clr_err_inf;
 	int b_bus_req_inf;
-	/* Auxilary informative variables */
+	/* Auxiliary informative variables */
 	int a_suspend_req_inf;
 
 	/* Timeout indicator for timers */
diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
index 69f1b6328532..7ceeecbb9e02 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -125,7 +125,7 @@ enum usb_dr_mode {
  * @dev: Pointer to the given device
  *
  * The function gets phy interface string from property 'dr_mode',
- * and returns the correspondig enum usb_dr_mode
+ * and returns the corresponding enum usb_dr_mode
  */
 extern enum usb_dr_mode usb_get_dr_mode(struct device *dev);
 
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index 5e4c497f54d6..eeb7c2157c72 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -32,7 +32,7 @@
 #define USB_QUIRK_DELAY_INIT			BIT(6)
 
 /*
- * For high speed and super speed interupt endpoints, the USB 2.0 and
+ * For high speed and super speed interrupt endpoints, the USB 2.0 and
  * USB 3.0 spec require the interval in microframes
  * (1 microframe = 125 microseconds) to be calculated as
  * interval = 2 ^ (bInterval-1).
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 8c63fa9bfc74..b81eb604e092 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -395,7 +395,7 @@ static inline void usb_serial_debug_data(struct device *dev,
 }
 
 /*
- * Macro for reporting errors in write path to avoid inifinite loop
+ * Macro for reporting errors in write path to avoid infinite loop
  * when port is used as a console.
  */
 #define dev_err_console(usport, fmt, ...)				\
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index fc4c7edb2e8a..cfb916cccd31 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -97,7 +97,7 @@ enum {
 #define DP_CONF_PIN_ASSIGNEMENT_SHIFT	8
 #define DP_CONF_PIN_ASSIGNEMENT_MASK	GENMASK(15, 8)
 
-/* Helper for setting/getting the pin assignement value to the configuration */
+/* Helper for setting/getting the pin assignment value to the configuration */
 #define DP_CONF_SET_PIN_ASSIGN(_a_)	((_a_) << 8)
 #define DP_CONF_GET_PIN_ASSIGN(_conf_)	(((_conf_) & GENMASK(15, 8)) >> 8)
 
-- 
2.25.1


