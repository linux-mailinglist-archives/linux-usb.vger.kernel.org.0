Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6FA1E3DC0
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgE0JlN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:41:13 -0400
Received: from gofer.mess.org ([88.97.38.141]:47063 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728837AbgE0JlM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 05:41:12 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A0A1DC6377; Wed, 27 May 2020 10:41:07 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 1/3] media: rc: add support for Infrared Toy and IR Droid devices
Date:   Wed, 27 May 2020 10:41:05 +0100
Message-Id: <20200527094107.11936-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527094107.11936-1-sean@mess.org>
References: <20200527094107.11936-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

http://dangerousprototypes.com/docs/USB_Infrared_Toy
https://www.irdroid.com/irdroid-usb-ir-transceiver/

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/Kconfig  |  11 +
 drivers/media/rc/Makefile |   1 +
 drivers/media/rc/ir_toy.c | 525 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 537 insertions(+)
 create mode 100644 drivers/media/rc/ir_toy.c

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index c18dee648253..2c0ee2e5b446 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -530,6 +530,17 @@ config IR_ZX
 	   To compile this driver as a module, choose M here: the
 	   module will be called zx-irdec.
 
+config IR_TOY
+	tristate "Infrared Toy and IR Droid"
+	depends on RC_CORE
+	depends on USB_ARCH_HAS_HCD
+	help
+	   Say Y here if you want to use the Infrared Toy or IR Droid, USB
+	   versions.
+
+	   To compile this driver as a module, choose M here: the module will be
+	   called ir_toy.
+
 endif #RC_DEVICES
 
 endif #RC_CORE
diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index 48d23433b3c0..5bb2932ab119 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -50,3 +50,4 @@ obj-$(CONFIG_IR_MTK) += mtk-cir.o
 obj-$(CONFIG_IR_ZX) += zx-irdec.o
 obj-$(CONFIG_IR_TANGO) += tango-ir.o
 obj-$(CONFIG_RC_XBOX_DVD) += xbox_remote.o
+obj-$(CONFIG_IR_TOY) += ir_toy.o
diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
new file mode 100644
index 000000000000..64b75597beed
--- /dev/null
+++ b/drivers/media/rc/ir_toy.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Infrared Toy and IR Droid RC core driver
+ *
+ * Copyright (C) 2020 Sean Young <sean@mess.org>
+
+ * This driver is based on the lirc driver which can be found here:
+ * https://sourceforge.net/p/lirc/git/ci/master/tree/plugins/irtoy.c
+ * Copyright (C) 2011 Peter Kooiman <pkooiman@gmail.com>
+ */
+
+#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/usb/input.h>
+
+#include <media/rc-core.h>
+
+static const u8 COMMAND_VERSION[] = { 'v' };
+// End transmit and repeat reset command so we exit sump mode
+static const u8 COMMAND_RESET[] = { 0xff, 0xff, 0, 0, 0, 0, 0 };
+static const u8 COMMAND_SMODE_ENTER[] = { 's' };
+static const u8 COMMAND_TXSTART[] = { 0x26, 0x24, 0x25, 0x03 };
+
+#define REPLY_XMITCOUNT 't'
+#define REPLY_XMITSUCCESS 'C'
+#define REPLY_VERSION 'V'
+#define REPLY_SAMPLEMODEPROTO 'S'
+
+#define TIMEOUT 500
+
+#define LEN_XMITRES 3
+#define LEN_VERSION 4
+#define LEN_SAMPLEMODEPROTO 3
+
+#define MIN_FW_VERSION 20
+#define UNIT_NS 21333
+#define MAX_TIMEOUT_NS (UNIT_NS * U16_MAX)
+
+#define MAX_PACKET 64
+
+enum state {
+	STATE_IRDATA,
+	STATE_RESET,
+	STATE_COMMAND,
+	STATE_TX,
+};
+
+struct irtoy {
+	struct device *dev;
+	struct usb_device *usbdev;
+
+	struct rc_dev *rc;
+	struct urb *urb_in, *urb_out;
+
+	u8 in[MAX_PACKET];
+	u8 out[MAX_PACKET];
+	struct completion rx_done;
+
+	bool pulse;
+	enum state state;
+
+	void *tx_buf;
+	uint tx_len;
+
+	uint emitted;
+	uint hw_version;
+	uint sw_version;
+	uint proto_version;
+
+	char phys[64];
+};
+
+static void irtoy_response(struct irtoy *irtoy, u32 len)
+{
+	switch (irtoy->state) {
+	case STATE_COMMAND:
+		if (len == LEN_VERSION && irtoy->in[0] == REPLY_VERSION) {
+			uint version;
+
+			irtoy->in[LEN_VERSION] = 0;
+
+			if (kstrtouint(irtoy->in + 1, 10, &version)) {
+				dev_err(irtoy->dev, "invalid version %*phN. Please make sure you are using firmware v20 or higher",
+					LEN_VERSION, irtoy->in);
+				break;
+			}
+
+			dev_dbg(irtoy->dev, "version %s\n", irtoy->in);
+
+			irtoy->hw_version = version / 100;
+			irtoy->sw_version = version % 100;
+
+			irtoy->state = STATE_IRDATA;
+			complete(&irtoy->rx_done);
+		} else if (len == LEN_SAMPLEMODEPROTO &&
+			   irtoy->in[0] == REPLY_SAMPLEMODEPROTO) {
+			uint version;
+
+			irtoy->in[LEN_SAMPLEMODEPROTO] = 0;
+
+			if (kstrtouint(irtoy->in + 1, 10, &version)) {
+				dev_err(irtoy->dev, "invalid sample mode response %*phN",
+					LEN_SAMPLEMODEPROTO, irtoy->in);
+				return;
+			}
+
+			dev_dbg(irtoy->dev, "protocol %s\n", irtoy->in);
+
+			irtoy->proto_version = version;
+
+			irtoy->state = STATE_IRDATA;
+			complete(&irtoy->rx_done);
+		} else {
+			dev_err(irtoy->dev, "unexpected response to command: %*phN\n",
+				len, irtoy->in);
+		}
+		break;
+	case STATE_IRDATA: {
+		struct ir_raw_event rawir = { .pulse = irtoy->pulse };
+		__be16 *in = (__be16 *)irtoy->in;
+		int i;
+
+		for (i = 0; i < len / sizeof(__be16); i++) {
+			u32 v = be16_to_cpup(in + i);
+
+			if (v == 0xffff) {
+				rawir.pulse = false;
+			} else {
+				rawir.duration = v * UNIT_NS;
+				ir_raw_event_store_with_timeout(irtoy->rc,
+								&rawir);
+			}
+
+			rawir.pulse = !rawir.pulse;
+		}
+
+		irtoy->pulse = rawir.pulse;
+
+		ir_raw_event_handle(irtoy->rc);
+		break;
+	}
+	case STATE_TX:
+		if (irtoy->tx_len == 0) {
+			if (len == LEN_XMITRES &&
+			    irtoy->in[0] == REPLY_XMITCOUNT) {
+				__be16 *emitted = (__be16 *)(irtoy->in + 1);
+
+				irtoy->emitted = be16_to_cpup(emitted);
+			} else if (len == 1 &&
+				   irtoy->in[0] == REPLY_XMITSUCCESS) {
+				complete(&irtoy->rx_done);
+				irtoy->state = STATE_IRDATA;
+			}
+		} else {
+			// send next part of tx buffer
+			uint max_send = irtoy->in[0];
+			uint buf_len = min(max_send, irtoy->tx_len);
+			int err;
+
+			dev_dbg(irtoy->dev, "ready to receive: 0x%02x\n",
+				max_send);
+
+			memcpy(irtoy->out, irtoy->tx_buf, buf_len);
+			irtoy->urb_out->transfer_buffer_length = buf_len;
+			err = usb_submit_urb(irtoy->urb_out, GFP_ATOMIC);
+			if (err != 0) {
+				dev_err(irtoy->dev, "fail to submit tx buf urb: %d\n",
+					err);
+				complete(&irtoy->rx_done);
+				irtoy->state = STATE_IRDATA;
+			}
+
+			irtoy->tx_buf += buf_len;
+			irtoy->tx_len -= buf_len;
+			break;
+		}
+		break;
+	case STATE_RESET:
+		dev_err(irtoy->dev, "unexpected response to reset: %*phN\n",
+			len, irtoy->in);
+	}
+}
+
+static void irtoy_out_callback(struct urb *urb)
+{
+	struct irtoy *irtoy = urb->context;
+
+	switch (urb->status) {
+	case 0:
+		if (irtoy->state == STATE_RESET)
+			complete(&irtoy->rx_done);
+		break;
+
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+	case -EPROTO:
+		usb_unlink_urb(urb);
+		return;
+
+	default:
+		dev_warn(irtoy->dev, "out urb status: %d\n", urb->status);
+	}
+}
+
+static void irtoy_in_callback(struct urb *urb)
+{
+	struct irtoy *irtoy = urb->context;
+	int ret;
+
+	switch (urb->status) {
+	case 0:
+		irtoy_response(irtoy, urb->actual_length);
+		break;
+
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+	case -EPROTO:
+		usb_unlink_urb(urb);
+		return;
+
+	default:
+		dev_warn(irtoy->dev, "in urb status: %d\n", urb->status);
+	}
+
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret && ret != -ENODEV)
+		dev_warn(irtoy->dev, "failed to resubmit urb: %d\n", ret);
+}
+
+static int irtoy_command(struct irtoy *irtoy, const u8 *cmd, int cmd_len)
+{
+	int err;
+
+	init_completion(&irtoy->rx_done);
+
+	memcpy(irtoy->out, cmd, cmd_len);
+	irtoy->urb_out->transfer_buffer_length = cmd_len;
+
+	err = usb_submit_urb(irtoy->urb_out, GFP_KERNEL);
+	if (err != 0)
+		return err;
+
+	if (!wait_for_completion_timeout(&irtoy->rx_done,
+					 msecs_to_jiffies(TIMEOUT)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+/*
+ * When sending IR, it is imperative that we send the IR data as quickly
+ * as possible to the device, so it does not run out of IR data and
+ * introduce gaps. So, we feed the data from the urb callback handler
+ */
+static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
+{
+	struct irtoy *irtoy = rc->priv;
+	unsigned int i, size;
+	__be16 *buf;
+	int err;
+
+	size = sizeof(u16) * (count + 1);
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		u16 v = DIV_ROUND_CLOSEST(US_TO_NS(txbuf[i]), UNIT_NS);
+
+		if (!v)
+			v = 1;
+		buf[i] = cpu_to_be16(v);
+	}
+
+	buf[count] = cpu_to_be16(0xffff);
+
+	irtoy->state = STATE_TX;
+	irtoy->tx_buf = buf;
+	irtoy->tx_len = size;
+
+	err = irtoy_command(irtoy, COMMAND_TXSTART, sizeof(COMMAND_TXSTART));
+	kfree(buf);
+
+	if (err) {
+		dev_err(irtoy->dev, "failed to send tx start command: %d\n",
+			err);
+		return err;
+	}
+
+	if (size != irtoy->emitted) {
+		dev_err(irtoy->dev, "expected %u emitted, got %u\n", size,
+			irtoy->emitted);
+		return -EINVAL;
+	}
+
+	return err == 0 ? count : err;
+}
+
+static int irtoy_setup(struct irtoy *irtoy)
+{
+	int err;
+
+	err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);
+	if (err != 0) {
+		dev_err(irtoy->dev, "fail to submit in urb: %d\n", err);
+		return err;
+	}
+
+	irtoy->state = STATE_RESET;
+	err = irtoy_command(irtoy, COMMAND_RESET, sizeof(COMMAND_RESET));
+	if (err != 0) {
+		dev_err(irtoy->dev, "could not write reset command: %d\n",
+			err);
+		return err;
+	}
+
+	usleep_range(50, 50);
+
+	// get version
+	irtoy->state = STATE_COMMAND;
+	err = irtoy_command(irtoy, COMMAND_VERSION, sizeof(COMMAND_VERSION));
+	if (err) {
+		dev_err(irtoy->dev, "could not write version command: %d\n",
+			err);
+		return err;
+	}
+
+	// enter sample mode
+	irtoy->state = STATE_COMMAND;
+	err = irtoy_command(irtoy, COMMAND_SMODE_ENTER,
+			    sizeof(COMMAND_SMODE_ENTER));
+	if (err)
+		dev_err(irtoy->dev, "could not write sample command: %d\n",
+			err);
+
+	return err;
+}
+
+static int irtoy_probe(struct usb_interface *intf,
+		       const struct usb_device_id *id)
+{
+	struct usb_host_interface *idesc = intf->cur_altsetting;
+	struct usb_device *usbdev = interface_to_usbdev(intf);
+	struct usb_endpoint_descriptor *ep_in = NULL;
+	struct usb_endpoint_descriptor *ep_out = NULL;
+	struct usb_endpoint_descriptor *ep = NULL;
+	struct irtoy *irtoy;
+	struct rc_dev *rc;
+	struct urb *urb;
+	int i, pipe, err;
+
+	for (i = 0; i < idesc->desc.bNumEndpoints; i++) {
+		ep = &idesc->endpoint[i].desc;
+
+		if (!ep_in && usb_endpoint_is_bulk_in(ep) &&
+		    usb_endpoint_maxp(ep) == MAX_PACKET)
+			ep_in = ep;
+
+		if (!ep_out && usb_endpoint_is_bulk_out(ep) &&
+		    usb_endpoint_maxp(ep) == MAX_PACKET)
+			ep_out = ep;
+	}
+
+	if (!ep_in || !ep_out) {
+		dev_err(&intf->dev, "required endpoints not found\n");
+		return -ENODEV;
+	}
+
+	irtoy = kzalloc(sizeof(*irtoy), GFP_KERNEL);
+	if (!irtoy)
+		return -ENOMEM;
+
+	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
+	if (!rc) {
+		err = -ENOMEM;
+		goto free_irtoy;
+	}
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb) {
+		err = -ENOMEM;
+		goto free_rcdev;
+	}
+
+	pipe = usb_rcvbulkpipe(usbdev, ep_in->bEndpointAddress);
+	usb_fill_bulk_urb(urb, usbdev, pipe, irtoy->in, MAX_PACKET,
+			  irtoy_in_callback, irtoy);
+	irtoy->urb_in = urb;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb) {
+		err = -ENOMEM;
+		goto free_rcdev;
+	}
+
+	pipe = usb_sndbulkpipe(usbdev, ep_out->bEndpointAddress);
+	usb_fill_bulk_urb(urb, usbdev, pipe, irtoy->out, MAX_PACKET,
+			  irtoy_out_callback, irtoy);
+
+	irtoy->dev = &intf->dev;
+	irtoy->usbdev = usbdev;
+	irtoy->rc = rc;
+	irtoy->urb_out = urb;
+	irtoy->pulse = true;
+
+	err = irtoy_setup(irtoy);
+	if (err)
+		goto free_rcdev;
+
+	dev_info(irtoy->dev, "version hardware %u, firmware %u, protocol %u",
+		 irtoy->hw_version, irtoy->sw_version, irtoy->proto_version);
+
+	if (irtoy->sw_version < MIN_FW_VERSION) {
+		dev_err(irtoy->dev, "need firmware V%02u or higher",
+			MIN_FW_VERSION);
+		err = -ENODEV;
+		goto free_rcdev;
+	}
+
+	usb_make_path(usbdev, irtoy->phys, sizeof(irtoy->phys));
+
+	rc->device_name = "Infrared Toy";
+	rc->driver_name = KBUILD_MODNAME;
+	rc->input_phys = irtoy->phys;
+	usb_to_input_id(usbdev, &rc->input_id);
+	rc->dev.parent = &intf->dev;
+	rc->priv = irtoy;
+	rc->tx_ir = irtoy_tx;
+	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
+	rc->map_name = RC_MAP_RC6_MCE;
+	rc->rx_resolution = UNIT_NS;
+	rc->timeout = IR_DEFAULT_TIMEOUT;
+
+	/*
+	 * end of transmission is detected by absence of a usb packet
+	 * with more pulse/spaces. However, each usb packet sent can
+	 * contain 32 pulse/spaces, which can be quite lengthy, so there
+	 * can be a delay between usb packets. For example with nec there is a
+	 * 17ms gap between packets.
+	 *
+	 * So, make timeout a largish minimum which works with most protocols.
+	 */
+	rc->min_timeout = MS_TO_NS(40);
+	rc->max_timeout = MAX_TIMEOUT_NS;
+
+	err = rc_register_device(rc);
+	if (err)
+		goto free_rcdev;
+
+	usb_set_intfdata(intf, irtoy);
+
+	return 0;
+
+free_rcdev:
+	usb_kill_urb(irtoy->urb_out);
+	usb_free_urb(irtoy->urb_out);
+	usb_kill_urb(irtoy->urb_in);
+	usb_free_urb(irtoy->urb_in);
+	rc_free_device(rc);
+free_irtoy:
+	kfree(irtoy);
+	return err;
+}
+
+static int irtoy_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct irtoy *irtoy = usb_get_intfdata(intf);
+
+	usb_kill_urb(irtoy->urb_in);
+	usb_kill_urb(irtoy->urb_out);
+
+	return 0;
+}
+
+static int irtoy_resume(struct usb_interface *intf)
+{
+	struct irtoy *irtoy = usb_get_intfdata(intf);
+	int err;
+
+	err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);
+	if (err)
+		dev_warn(&intf->dev, "failed to submit urb: %d\n", err);
+
+	return err;
+}
+
+static void irtoy_disconnect(struct usb_interface *intf)
+{
+	struct irtoy *ir = usb_get_intfdata(intf);
+
+	rc_unregister_device(ir->rc);
+	usb_set_intfdata(intf, NULL);
+	usb_kill_urb(ir->urb_out);
+	usb_free_urb(ir->urb_out);
+	usb_kill_urb(ir->urb_in);
+	usb_free_urb(ir->urb_in);
+	kfree(ir);
+}
+
+static const struct usb_device_id irtoy_table[] = {
+	{ USB_DEVICE_INTERFACE_CLASS(0x04d8, 0xfd08, USB_CLASS_CDC_DATA) },
+	{ }
+};
+
+static struct usb_driver irtoy_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = irtoy_probe,
+	.disconnect = irtoy_disconnect,
+	.suspend = irtoy_suspend,
+	.resume = irtoy_resume,
+	.id_table = irtoy_table,
+};
+
+module_usb_driver(irtoy_driver);
+
+MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("Infrared Toy and IR Droid driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(usb, irtoy_table);
-- 
2.26.2

