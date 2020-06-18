Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B96B1FF4FD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 16:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730842AbgFROmS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 10:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbgFROmR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 10:42:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C3E720773;
        Thu, 18 Jun 2020 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592491335;
        bh=oBt8/U6kHv9j3UuQGoxk/K5wLv3bsWNnjxmDL3miXI8=;
        h=From:To:Cc:Subject:Date:From;
        b=IQv2BfW6/Su1ZWqEXDgjGPYWCioI8hlgamdDxDLh/e37n+UrVeLU86OgifuC7Jprk
         0zZrkrrrh3SsPW+R1OXdG8i17zFEJDSGECjPP6xX285XmmNGPMIlCCR8oJMFhBeb0q
         JaOKRFc2BPPZ6kqP8TaTcZGUkIr4lxFi0MbjoOrI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Bin Liu <b-liu@ti.com>, Pawel Laszczak <pawell@cadence.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jason Yan <yanaijie@huawei.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Arnd Bergmann <arnd@arndb.de>,
        Jules Irenge <jbi.octave@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH] USB: ch9: add "USB_" prefix in front of TEST defines
Date:   Thu, 18 Jun 2020 16:42:06 +0200
Message-Id: <20200618144206.2655890-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some reason, the TEST_ defines in the usb/ch9.h files did not have
the USB_ prefix on it, making it a bit confusing when reading the file,
as well as not the nicest thing to do in a uapi file.

So fix that up and add the USB_ prefix on to them, and fix up all
in-kernel usages.  This included deleting the duplicate copy in the
net2272.h file.

Cc: Peter Chen <Peter.Chen@nxp.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Bin Liu <b-liu@ti.com>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: YueHaibing <yuehaibing@huawei.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jules Irenge <jbi.octave@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Gill <rrobgill@protonmail.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/cdns3/ep0.c              |  8 ++++----
 drivers/usb/chipidea/udc.c           | 10 +++++-----
 drivers/usb/common/debug.c           | 10 +++++-----
 drivers/usb/dwc2/debugfs.c           | 20 ++++++++++----------
 drivers/usb/dwc2/gadget.c            | 10 +++++-----
 drivers/usb/dwc3/debugfs.c           | 20 ++++++++++----------
 drivers/usb/dwc3/ep0.c               | 10 +++++-----
 drivers/usb/dwc3/gadget.c            | 10 +++++-----
 drivers/usb/gadget/udc/bdc/bdc_ep.c  | 10 +++++-----
 drivers/usb/gadget/udc/gr_udc.c      |  4 ++--
 drivers/usb/gadget/udc/mv_udc_core.c |  2 +-
 drivers/usb/gadget/udc/net2272.c     |  2 +-
 drivers/usb/gadget/udc/net2272.h     |  5 -----
 drivers/usb/gadget/udc/udc-xilinx.c  |  4 ++--
 drivers/usb/host/xhci-hub.c          |  7 ++++---
 drivers/usb/misc/ehset.c             |  8 ++++----
 drivers/usb/mtu3/mtu3_gadget_ep0.c   | 16 ++++++++--------
 drivers/usb/musb/musb_gadget_ep0.c   | 20 ++++++++------------
 drivers/usb/musb/musb_virthub.c      | 20 ++++++++++----------
 include/uapi/linux/usb/ch9.h         | 10 +++++-----
 20 files changed, 99 insertions(+), 107 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 82645a2a0f52..04a522f5ae58 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -328,10 +328,10 @@ static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev,
 			return -EINVAL;
 
 		switch (tmode >> 8) {
-		case TEST_J:
-		case TEST_K:
-		case TEST_SE0_NAK:
-		case TEST_PACKET:
+		case USB_TEST_J:
+		case USB_TEST_K:
+		case USB_TEST_SE0_NAK:
+		case USB_TEST_PACKET:
 			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
 					       USB_CMD_STMODE |
 					       USB_STS_TMODE_SEL(tmode - 1));
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index db0cfde0cc3c..4beb25888917 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1215,11 +1215,11 @@ __acquires(ci->lock)
 			case USB_DEVICE_TEST_MODE:
 				tmode = le16_to_cpu(req.wIndex) >> 8;
 				switch (tmode) {
-				case TEST_J:
-				case TEST_K:
-				case TEST_SE0_NAK:
-				case TEST_PACKET:
-				case TEST_FORCE_EN:
+				case USB_TEST_J:
+				case USB_TEST_K:
+				case USB_TEST_SE0_NAK:
+				case USB_TEST_PACKET:
+				case USB_TEST_FORCE_ENABLE:
 					ci->test_mode = tmode;
 					err = isr_setup_status_phase(
 							ci);
diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index 92a986aeaa5d..410acd670ca7 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -53,15 +53,15 @@ static const char *usb_decode_device_feature(u16 wValue)
 static const char *usb_decode_test_mode(u16 wIndex)
 {
 	switch (wIndex) {
-	case TEST_J:
+	case USB_TEST_J:
 		return ": TEST_J";
-	case TEST_K:
+	case USB_TEST_K:
 		return ": TEST_K";
-	case TEST_SE0_NAK:
+	case USB_TEST_SE0_NAK:
 		return ": TEST_SE0_NAK";
-	case TEST_PACKET:
+	case USB_TEST_PACKET:
 		return ": TEST_PACKET";
-	case TEST_FORCE_EN:
+	case USB_TEST_FORCE_ENABLE:
 		return ": TEST_FORCE_EN";
 	default:
 		return ": UNKNOWN";
diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 3a0dcbfbc827..aaafd463d72a 100644
--- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -37,15 +37,15 @@ static ssize_t testmode_write(struct file *file, const char __user *ubuf, size_t
 		return -EFAULT;
 
 	if (!strncmp(buf, "test_j", 6))
-		testmode = TEST_J;
+		testmode = USB_TEST_J;
 	else if (!strncmp(buf, "test_k", 6))
-		testmode = TEST_K;
+		testmode = USB_TEST_K;
 	else if (!strncmp(buf, "test_se0_nak", 12))
-		testmode = TEST_SE0_NAK;
+		testmode = USB_TEST_SE0_NAK;
 	else if (!strncmp(buf, "test_packet", 11))
-		testmode = TEST_PACKET;
+		testmode = USB_TEST_PACKET;
 	else if (!strncmp(buf, "test_force_enable", 17))
-		testmode = TEST_FORCE_EN;
+		testmode = USB_TEST_FORCE_ENABLE;
 	else
 		testmode = 0;
 
@@ -78,19 +78,19 @@ static int testmode_show(struct seq_file *s, void *unused)
 	case 0:
 		seq_puts(s, "no test\n");
 		break;
-	case TEST_J:
+	case USB_TEST_J:
 		seq_puts(s, "test_j\n");
 		break;
-	case TEST_K:
+	case USB_TEST_K:
 		seq_puts(s, "test_k\n");
 		break;
-	case TEST_SE0_NAK:
+	case USB_TEST_SE0_NAK:
 		seq_puts(s, "test_se0_nak\n");
 		break;
-	case TEST_PACKET:
+	case USB_TEST_PACKET:
 		seq_puts(s, "test_packet\n");
 		break;
-	case TEST_FORCE_EN:
+	case USB_TEST_FORCE_ENABLE:
 		seq_puts(s, "test_force_enable\n");
 		break;
 	default:
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 12b98b466287..38fc46b0c026 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1561,11 +1561,11 @@ int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg, int testmode)
 
 	dctl &= ~DCTL_TSTCTL_MASK;
 	switch (testmode) {
-	case TEST_J:
-	case TEST_K:
-	case TEST_SE0_NAK:
-	case TEST_PACKET:
-	case TEST_FORCE_EN:
+	case USB_TEST_J:
+	case USB_TEST_K:
+	case USB_TEST_SE0_NAK:
+	case USB_TEST_PACKET:
+	case USB_TEST_FORCE_ENABLE:
 		dctl |= testmode << DCTL_TSTCTL_SHIFT;
 		break;
 	default:
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 6d9de334e46a..14dc6a37305d 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -466,19 +466,19 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
 	case 0:
 		seq_printf(s, "no test\n");
 		break;
-	case TEST_J:
+	case USB_TEST_J:
 		seq_printf(s, "test_j\n");
 		break;
-	case TEST_K:
+	case USB_TEST_K:
 		seq_printf(s, "test_k\n");
 		break;
-	case TEST_SE0_NAK:
+	case USB_TEST_SE0_NAK:
 		seq_printf(s, "test_se0_nak\n");
 		break;
-	case TEST_PACKET:
+	case USB_TEST_PACKET:
 		seq_printf(s, "test_packet\n");
 		break;
-	case TEST_FORCE_EN:
+	case USB_TEST_FORCE_ENABLE:
 		seq_printf(s, "test_force_enable\n");
 		break;
 	default:
@@ -506,15 +506,15 @@ static ssize_t dwc3_testmode_write(struct file *file,
 		return -EFAULT;
 
 	if (!strncmp(buf, "test_j", 6))
-		testmode = TEST_J;
+		testmode = USB_TEST_J;
 	else if (!strncmp(buf, "test_k", 6))
-		testmode = TEST_K;
+		testmode = USB_TEST_K;
 	else if (!strncmp(buf, "test_se0_nak", 12))
-		testmode = TEST_SE0_NAK;
+		testmode = USB_TEST_SE0_NAK;
 	else if (!strncmp(buf, "test_packet", 11))
-		testmode = TEST_PACKET;
+		testmode = USB_TEST_PACKET;
 	else if (!strncmp(buf, "test_force_enable", 17))
-		testmode = TEST_FORCE_EN;
+		testmode = USB_TEST_FORCE_ENABLE;
 	else
 		testmode = 0;
 
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 6dee4dabc0a4..8dd69728add3 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -425,11 +425,11 @@ static int dwc3_ep0_handle_test(struct dwc3 *dwc, enum usb_device_state state,
 		return -EINVAL;
 
 	switch (wIndex >> 8) {
-	case TEST_J:
-	case TEST_K:
-	case TEST_SE0_NAK:
-	case TEST_PACKET:
-	case TEST_FORCE_EN:
+	case USB_TEST_J:
+	case USB_TEST_K:
+	case USB_TEST_SE0_NAK:
+	case USB_TEST_PACKET:
+	case USB_TEST_FORCE_ENABLE:
 		dwc->test_mode_nr = wIndex >> 8;
 		dwc->test_mode = true;
 		break;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 80c3ef134e41..0b59b2f1cf26 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -46,11 +46,11 @@ int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int mode)
 	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
 
 	switch (mode) {
-	case TEST_J:
-	case TEST_K:
-	case TEST_SE0_NAK:
-	case TEST_PACKET:
-	case TEST_FORCE_EN:
+	case USB_TEST_J:
+	case USB_TEST_K:
+	case USB_TEST_SE0_NAK:
+	case USB_TEST_PACKET:
+	case USB_TEST_FORCE_ENABLE:
 		reg |= mode << 1;
 		break;
 	default:
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index d49c6dc1082d..ba250cf75bef 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -927,11 +927,11 @@ static int bdc_set_test_mode(struct bdc *bdc)
 	usb2_pm &= ~BDC_PTC_MASK;
 	dev_dbg(bdc->dev, "%s\n", __func__);
 	switch (bdc->test_mode) {
-	case TEST_J:
-	case TEST_K:
-	case TEST_SE0_NAK:
-	case TEST_PACKET:
-	case TEST_FORCE_EN:
+	case USB_TEST_J:
+	case USB_TEST_K:
+	case USB_TEST_SE0_NAK:
+	case USB_TEST_PACKET:
+	case USB_TEST_FORCE_ENABLE:
 		usb2_pm |= bdc->test_mode << 28;
 		break;
 	default:
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 7164ad9800f1..345e28d76709 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -912,9 +912,9 @@ static int gr_device_request(struct gr_udc *dev, u8 type, u8 request,
 			return gr_ep0_respond_empty(dev);
 
 		case USB_DEVICE_TEST_MODE:
-			/* The hardware does not support TEST_FORCE_EN */
+			/* The hardware does not support USB_TEST_FORCE_ENABLE */
 			test = index >> 8;
-			if (test >= TEST_J && test <= TEST_PACKET) {
+			if (test >= USB_TEST_J && test <= USB_TEST_PACKET) {
 				dev->test_mode = test;
 				return gr_ep0_respond(dev, NULL, 0,
 						      gr_ep0_testmode_complete);
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index cafde053788b..69289717d856 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -1502,7 +1502,7 @@ udc_prime_status(struct mv_udc *udc, u8 direction, u16 status, bool empty)
 
 static void mv_udc_testmode(struct mv_udc *udc, u16 index)
 {
-	if (index <= TEST_FORCE_EN) {
+	if (index <= USB_TEST_FORCE_ENABLE) {
 		udc->test_mode = index;
 		if (udc_prime_status(udc, EP_DIR_IN, 0, true))
 			ep0_stall(udc);
diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 928057b206f1..fbbe62513545 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -1688,7 +1688,7 @@ net2272_set_test_mode(struct net2272 *dev, int mode)
 	net2272_write(dev, USBTEST, mode);
 
 	/* load test packet */
-	if (mode == TEST_PACKET) {
+	if (mode == USB_TEST_PACKET) {
 		/* switch to 8 bit mode */
 		net2272_write(dev, LOCCTL, net2272_read(dev, LOCCTL) &
 				~(1 << DATA_WIDTH));
diff --git a/drivers/usb/gadget/udc/net2272.h b/drivers/usb/gadget/udc/net2272.h
index 8e644627992d..87d0ab9ffeeb 100644
--- a/drivers/usb/gadget/udc/net2272.h
+++ b/drivers/usb/gadget/udc/net2272.h
@@ -105,11 +105,6 @@
 #define USBTEST				0x32
 #define 	TEST_MODE_SELECT			0
 #define 		NORMAL_OPERATION			0
-#define 		TEST_J					1
-#define 		TEST_K					2
-#define 		TEST_SE0_NAK				3
-#define 		TEST_PACKET				4
-#define 		TEST_FORCE_ENABLE			5
 #define XCVRDIAG			0x33
 #define 	FORCE_FULL_SPEED			2
 #define 	FORCE_HIGH_SPEED			3
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 709553bdb233..d5e9d20c097d 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2097,9 +2097,9 @@ static int xudc_probe(struct platform_device *pdev)
 	/* Check for IP endianness */
 	udc->write_fn = xudc_write32_be;
 	udc->read_fn = xudc_read32_be;
-	udc->write_fn(udc->addr, XUSB_TESTMODE_OFFSET, TEST_J);
+	udc->write_fn(udc->addr, XUSB_TESTMODE_OFFSET, USB_TEST_J);
 	if ((udc->read_fn(udc->addr + XUSB_TESTMODE_OFFSET))
-			!= TEST_J) {
+			!= USB_TEST_J) {
 		udc->write_fn = xudc_write32;
 		udc->read_fn = xudc_read32;
 	}
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index f37316d2c8fa..073c54e42223 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -612,7 +612,7 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
 	temp |= test_mode << PORT_TEST_MODE_SHIFT;
 	writel(temp, port->addr + PORTPMSC);
 	xhci->test_mode = test_mode;
-	if (test_mode == TEST_FORCE_EN)
+	if (test_mode == USB_TEST_FORCE_ENABLE)
 		xhci_start(xhci);
 }
 
@@ -666,7 +666,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 		xhci_err(xhci, "Not in test mode, do nothing.\n");
 		return 0;
 	}
-	if (xhci->test_mode == TEST_FORCE_EN &&
+	if (xhci->test_mode == USB_TEST_FORCE_ENABLE &&
 		!(xhci->xhc_state & XHCI_STATE_HALTED)) {
 		retval = xhci_halt(xhci);
 		if (retval)
@@ -1421,7 +1421,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
 			if (hcd->speed != HCD_USB2)
 				goto error;
-			if (test_mode > TEST_FORCE_EN || test_mode < TEST_J)
+			if (test_mode > USB_TEST_FORCE_ENABLE ||
+			    test_mode < USB_TEST_J)
 				goto error;
 			retval = xhci_enter_test_mode(xhci, test_mode, wIndex,
 						      &flags);
diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
index 7895d61e733b..2752e1f4f4d0 100644
--- a/drivers/usb/misc/ehset.c
+++ b/drivers/usb/misc/ehset.c
@@ -33,28 +33,28 @@ static int ehset_probe(struct usb_interface *intf,
 		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
 					USB_REQ_SET_FEATURE, USB_RT_PORT,
 					USB_PORT_FEAT_TEST,
-					(TEST_SE0_NAK << 8) | portnum,
+					(USB_TEST_SE0_NAK << 8) | portnum,
 					NULL, 0, 1000);
 		break;
 	case TEST_J_PID:
 		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
 					USB_REQ_SET_FEATURE, USB_RT_PORT,
 					USB_PORT_FEAT_TEST,
-					(TEST_J << 8) | portnum,
+					(USB_TEST_J << 8) | portnum,
 					NULL, 0, 1000);
 		break;
 	case TEST_K_PID:
 		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
 					USB_REQ_SET_FEATURE, USB_RT_PORT,
 					USB_PORT_FEAT_TEST,
-					(TEST_K << 8) | portnum,
+					(USB_TEST_K << 8) | portnum,
 					NULL, 0, 1000);
 		break;
 	case TEST_PACKET_PID:
 		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
 					USB_REQ_SET_FEATURE, USB_RT_PORT,
 					USB_PORT_FEAT_TEST,
-					(TEST_PACKET << 8) | portnum,
+					(USB_TEST_PACKET << 8) | portnum,
 					NULL, 0, 1000);
 		break;
 	case TEST_HS_HOST_PORT_SUSPEND_RESUME:
diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index 2be182bd793a..563a0a2e970d 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -278,20 +278,20 @@ static int handle_test_mode(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
 	u32 value;
 
 	switch (le16_to_cpu(setup->wIndex) >> 8) {
-	case TEST_J:
-		dev_dbg(mtu->dev, "TEST_J\n");
+	case USB_TEST_J:
+		dev_dbg(mtu->dev, "USB_TEST_J\n");
 		mtu->test_mode_nr = TEST_J_MODE;
 		break;
-	case TEST_K:
-		dev_dbg(mtu->dev, "TEST_K\n");
+	case USB_TEST_K:
+		dev_dbg(mtu->dev, "USB_TEST_K\n");
 		mtu->test_mode_nr = TEST_K_MODE;
 		break;
-	case TEST_SE0_NAK:
-		dev_dbg(mtu->dev, "TEST_SE0_NAK\n");
+	case USB_TEST_SE0_NAK:
+		dev_dbg(mtu->dev, "USB_TEST_SE0_NAK\n");
 		mtu->test_mode_nr = TEST_SE0_NAK_MODE;
 		break;
-	case TEST_PACKET:
-		dev_dbg(mtu->dev, "TEST_PACKET\n");
+	case USB_TEST_PACKET:
+		dev_dbg(mtu->dev, "USB_TEST_PACKET\n");
 		mtu->test_mode_nr = TEST_PACKET_MODE;
 		break;
 	default:
diff --git a/drivers/usb/musb/musb_gadget_ep0.c b/drivers/usb/musb/musb_gadget_ep0.c
index 91a5027b5c1f..0ae3e0be043e 100644
--- a/drivers/usb/musb/musb_gadget_ep0.c
+++ b/drivers/usb/musb/musb_gadget_ep0.c
@@ -311,27 +311,23 @@ __acquires(musb->lock)
 						goto stall;
 
 					switch (ctrlrequest->wIndex >> 8) {
-					case 1:
-						pr_debug("TEST_J\n");
-						/* TEST_J */
+					case USB_TEST_J:
+						pr_debug("USB_TEST_J\n");
 						musb->test_mode_nr =
 							MUSB_TEST_J;
 						break;
-					case 2:
-						/* TEST_K */
-						pr_debug("TEST_K\n");
+					case USB_TEST_K:
+						pr_debug("USB_TEST_K\n");
 						musb->test_mode_nr =
 							MUSB_TEST_K;
 						break;
-					case 3:
-						/* TEST_SE0_NAK */
-						pr_debug("TEST_SE0_NAK\n");
+					case USB_TEST_SE0_NAK:
+						pr_debug("USB_TEST_SE0_NAK\n");
 						musb->test_mode_nr =
 							MUSB_TEST_SE0_NAK;
 						break;
-					case 4:
-						/* TEST_PACKET */
-						pr_debug("TEST_PACKET\n");
+					case USB_TEST_PACKET:
+						pr_debug("USB_TEST_PACKET\n");
 						musb->test_mode_nr =
 							MUSB_TEST_PACKET;
 						break;
diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virthub.c
index a84ec27c4c12..cb7ae297a3af 100644
--- a/drivers/usb/musb/musb_virthub.c
+++ b/drivers/usb/musb/musb_virthub.c
@@ -385,25 +385,25 @@ int musb_hub_control(
 
 			wIndex >>= 8;
 			switch (wIndex) {
-			case 1:
-				pr_debug("TEST_J\n");
+			case USB_TEST_J:
+				pr_debug("USB_TEST_J\n");
 				temp = MUSB_TEST_J;
 				break;
-			case 2:
-				pr_debug("TEST_K\n");
+			case USB_TEST_K:
+				pr_debug("USB_TEST_K\n");
 				temp = MUSB_TEST_K;
 				break;
-			case 3:
-				pr_debug("TEST_SE0_NAK\n");
+			case USB_TEST_SE0_NAK:
+				pr_debug("USB_TEST_SE0_NAK\n");
 				temp = MUSB_TEST_SE0_NAK;
 				break;
-			case 4:
-				pr_debug("TEST_PACKET\n");
+			case USB_TEST_PACKET:
+				pr_debug("USB_TEST_PACKET\n");
 				temp = MUSB_TEST_PACKET;
 				musb_load_testpacket(musb);
 				break;
-			case 5:
-				pr_debug("TEST_FORCE_ENABLE\n");
+			case USB_TEST_FORCE_ENABLE:
+				pr_debug("USB_TEST_FORCE_ENABLE\n");
 				temp = MUSB_TEST_FORCE_HOST
 					| MUSB_TEST_FORCE_HS;
 
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index b1ed2ccfe9cf..48766fdf6580 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -138,11 +138,11 @@
  * Test Mode Selectors
  * See USB 2.0 spec Table 9-7
  */
-#define	TEST_J		1
-#define	TEST_K		2
-#define	TEST_SE0_NAK	3
-#define	TEST_PACKET	4
-#define	TEST_FORCE_EN	5
+#define	USB_TEST_J		1
+#define	USB_TEST_K		2
+#define	USB_TEST_SE0_NAK	3
+#define	USB_TEST_PACKET		4
+#define	USB_TEST_FORCE_ENABLE	5
 
 /* Status Type */
 #define USB_STATUS_TYPE_STANDARD	0
-- 
2.27.0

