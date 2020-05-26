Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933761AAB94
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 17:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393309AbgDOPOF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 11:14:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:37980 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgDOPOD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 11:14:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D15FEABCF;
        Wed, 15 Apr 2020 15:14:00 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jonas.karlsson@actia.se
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] cdc-acm: introduce a cool down
Date:   Wed, 15 Apr 2020 17:13:58 +0200
Message-Id: <20200415151358.32664-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200415151358.32664-1-oneukum@suse.com>
References: <20200415151358.32664-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Immediate submission in case of a babbling device can lead
to a busy loop. Introducing a delayed work.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
R=Tested-by: Jonas Karlsson <jonas.karlsson@actia.se>
---
 drivers/usb/class/cdc-acm.c | 30 ++++++++++++++++++++++++++++--
 drivers/usb/class/cdc-acm.h |  5 ++++-
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 4ef68e6671aa..ded8d93834ca 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -412,9 +412,12 @@ static void acm_ctrl_irq(struct urb *urb)
 
 exit:
 	retval = usb_submit_urb(urb, GFP_ATOMIC);
-	if (retval && retval != -EPERM)
+	if (retval && retval != -EPERM && retval != -ENODEV)
 		dev_err(&acm->control->dev,
 			"%s - usb_submit_urb failed: %d\n", __func__, retval);
+	else
+		dev_vdbg(&acm->control->dev,
+			"control resubmission terminated %d\n", retval);
 }
 
 static int acm_submit_read_urb(struct acm *acm, int index, gfp_t mem_flags)
@@ -430,6 +433,8 @@ static int acm_submit_read_urb(struct acm *acm, int index, gfp_t mem_flags)
 			dev_err(&acm->data->dev,
 				"urb %d failed submission with %d\n",
 				index, res);
+		} else {
+			dev_vdbg(&acm->data->dev, "intended failure %d\n", res);
 		}
 		set_bit(index, &acm->read_urbs_free);
 		return res;
@@ -471,6 +476,7 @@ static void acm_read_bulk_callback(struct urb *urb)
 	int status = urb->status;
 	bool stopped = false;
 	bool stalled = false;
+	bool cooldown = false;
 
 	dev_vdbg(&acm->data->dev, "got urb %d, len %d, status %d\n",
 		rb->index, urb->actual_length, status);
@@ -497,6 +503,14 @@ static void acm_read_bulk_callback(struct urb *urb)
 			__func__, status);
 		stopped = true;
 		break;
+	case -EOVERFLOW:
+	case -EPROTO:
+		dev_dbg(&acm->data->dev,
+			"%s - cooling babbling device\n", __func__);
+		usb_mark_last_busy(acm->dev);
+		set_bit(rb->index, &acm->urbs_in_error_delay);
+		cooldown = true;
+		break;
 	default:
 		dev_dbg(&acm->data->dev,
 			"%s - nonzero urb status received: %d\n",
@@ -518,9 +532,11 @@ static void acm_read_bulk_callback(struct urb *urb)
 	 */
 	smp_mb__after_atomic();
 
-	if (stopped || stalled) {
+	if (stopped || stalled || cooldown) {
 		if (stalled)
 			schedule_work(&acm->work);
+		else if (cooldown)
+			schedule_delayed_work(&acm->dwork, HZ / 2);
 		return;
 	}
 
@@ -567,6 +583,12 @@ static void acm_softint(struct work_struct *work)
 		}
 	}
 
+	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
+		for (i = 0; i < ACM_NR; i++) 
+			if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
+					acm_submit_read_urb(acm, i, GFP_NOIO);
+	}
+
 	if (test_and_clear_bit(EVENT_TTY_WAKEUP, &acm->flags))
 		tty_port_tty_wakeup(&acm->port);
 }
@@ -1333,6 +1355,7 @@ static int acm_probe(struct usb_interface *intf,
 	acm->readsize = readsize;
 	acm->rx_buflimit = num_rx_buf;
 	INIT_WORK(&acm->work, acm_softint);
+	INIT_DELAYED_WORK(&acm->dwork, acm_softint);
 	init_waitqueue_head(&acm->wioctl);
 	spin_lock_init(&acm->write_lock);
 	spin_lock_init(&acm->read_lock);
@@ -1542,6 +1565,7 @@ static void acm_disconnect(struct usb_interface *intf)
 
 	acm_kill_urbs(acm);
 	cancel_work_sync(&acm->work);
+	cancel_delayed_work_sync(&acm->dwork);
 
 	tty_unregister_device(acm_tty_driver, acm->minor);
 
@@ -1584,6 +1608,8 @@ static int acm_suspend(struct usb_interface *intf, pm_message_t message)
 
 	acm_kill_urbs(acm);
 	cancel_work_sync(&acm->work);
+	cancel_delayed_work_sync(&acm->dwork);
+	acm->urbs_in_error_delay = 0;
 
 	return 0;
 }
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index ca1c026382c2..cd5e9d8ab237 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -109,8 +109,11 @@ struct acm {
 #		define EVENT_TTY_WAKEUP	0
 #		define EVENT_RX_STALL	1
 #		define ACM_THROTTLED	2
+#		define ACM_ERROR_DELAY	3
+	unsigned long urbs_in_error_delay;		/* these need to be restarted after a delay */
 	struct usb_cdc_line_coding line;		/* bits, stop, parity */
-	struct work_struct work;			/* work queue entry for line discipline waking up */
+	struct work_struct work;			/* work queue entry for various purposes*/
+	struct delayed_work dwork;			/* for cool downs needed in error recovery */
 	unsigned int ctrlin;				/* input control lines (DCD, DSR, RI, break, overruns) */
 	unsigned int ctrlout;				/* output control lines (DTR, RTS) */
 	struct async_icount iocount;			/* counters for control line changes */
-- 
2.16.4

