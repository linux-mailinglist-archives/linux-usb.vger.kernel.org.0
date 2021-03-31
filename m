Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09A83449D8
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 16:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhCVPx0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 11:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:49074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230460AbhCVPxQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Mar 2021 11:53:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C250F619B1;
        Mon, 22 Mar 2021 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616428394;
        bh=QzFnCyWYsPFGWW84RHeLi1FJ/mRqnIThg/6zCYz66Ls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q8OzWDEFFirAQnnssmRs8JrJRbBuatA+YIX0DR/uOsEWuTkTKkDTk0cv2Dxt68qhF
         9RAQUmT+9b9kKf592F6I4yKijW31NUUxf/zHJb7yQ1gvBuDgMFMm2VjryA9mkqYIQ5
         HbsTd3ISlxDlfc1MPYlc8gOPQ5xsxhjODBgYcP1eeGLMzkbbvHV2NMRHFpR//ZWsEq
         oKMK+HozKzhL8xDng1bNVGfqW826tTNTxhHr3tOU6UILZ2ifAoAJDUroW3P90R4uxs
         yUUz5TMkl/DanMnSYeE9DbwzA+r+egANeXkKaT7uQAf0qL/coLoiu5OfHRaDcuy3by
         VHEO4u8ULEYCg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lOMs0-0002Zk-VA; Mon, 22 Mar 2021 16:53:32 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 5/8] USB: cdc-acm: clean up probe error labels
Date:   Mon, 22 Mar 2021 16:53:15 +0100
Message-Id: <20210322155318.9837-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210322155318.9837-1-johan@kernel.org>
References: <20210322155318.9837-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Name the probe error labels after what they do rather than using
sequence numbers which is harder to review and maintain (e.g. may
require renaming unrelated labels when a label is added or removed).

Acked-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 682772b8a4f7..e3c45f5880fc 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1324,7 +1324,7 @@ static int acm_probe(struct usb_interface *intf,
 
 	acm = kzalloc(sizeof(struct acm), GFP_KERNEL);
 	if (acm == NULL)
-		goto alloc_fail;
+		return -ENOMEM;
 
 	tty_port_init(&acm->port);
 	acm->port.ops = &acm_port_ops;
@@ -1341,7 +1341,7 @@ static int acm_probe(struct usb_interface *intf,
 
 	minor = acm_alloc_minor(acm);
 	if (minor < 0)
-		goto alloc_fail1;
+		goto err_put_port;
 
 	acm->minor = minor;
 	acm->dev = usb_dev;
@@ -1372,15 +1372,15 @@ static int acm_probe(struct usb_interface *intf,
 
 	buf = usb_alloc_coherent(usb_dev, ctrlsize, GFP_KERNEL, &acm->ctrl_dma);
 	if (!buf)
-		goto alloc_fail1;
+		goto err_put_port;
 	acm->ctrl_buffer = buf;
 
 	if (acm_write_buffers_alloc(acm) < 0)
-		goto alloc_fail2;
+		goto err_free_ctrl_buffer;
 
 	acm->ctrlurb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!acm->ctrlurb)
-		goto alloc_fail3;
+		goto err_free_write_buffers;
 
 	for (i = 0; i < num_rx_buf; i++) {
 		struct acm_rb *rb = &(acm->read_buffers[i]);
@@ -1389,13 +1389,13 @@ static int acm_probe(struct usb_interface *intf,
 		rb->base = usb_alloc_coherent(acm->dev, readsize, GFP_KERNEL,
 								&rb->dma);
 		if (!rb->base)
-			goto alloc_fail4;
+			goto err_free_read_urbs;
 		rb->index = i;
 		rb->instance = acm;
 
 		urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!urb)
-			goto alloc_fail4;
+			goto err_free_read_urbs;
 
 		urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = rb->dma;
@@ -1417,7 +1417,7 @@ static int acm_probe(struct usb_interface *intf,
 
 		snd->urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (snd->urb == NULL)
-			goto alloc_fail5;
+			goto err_free_write_urbs;
 
 		if (usb_endpoint_xfer_int(epwrite))
 			usb_fill_int_urb(snd->urb, usb_dev, acm->out,
@@ -1435,7 +1435,7 @@ static int acm_probe(struct usb_interface *intf,
 
 	i = device_create_file(&intf->dev, &dev_attr_bmCapabilities);
 	if (i < 0)
-		goto alloc_fail5;
+		goto err_free_write_urbs;
 
 	if (h.usb_cdc_country_functional_desc) { /* export the country data */
 		struct usb_cdc_country_functional_desc * cfd =
@@ -1492,7 +1492,7 @@ static int acm_probe(struct usb_interface *intf,
 			&control_interface->dev);
 	if (IS_ERR(tty_dev)) {
 		rv = PTR_ERR(tty_dev);
-		goto alloc_fail6;
+		goto err_release_data_interface;
 	}
 
 	if (quirks & CLEAR_HALT_CONDITIONS) {
@@ -1501,7 +1501,8 @@ static int acm_probe(struct usb_interface *intf,
 	}
 
 	return 0;
-alloc_fail6:
+
+err_release_data_interface:
 	if (!acm->combined_interfaces) {
 		/* Clear driver data so that disconnect() returns early. */
 		usb_set_intfdata(data_interface, NULL);
@@ -1514,21 +1515,21 @@ static int acm_probe(struct usb_interface *intf,
 				&dev_attr_iCountryCodeRelDate);
 	}
 	device_remove_file(&acm->control->dev, &dev_attr_bmCapabilities);
-alloc_fail5:
+err_free_write_urbs:
 	for (i = 0; i < ACM_NW; i++)
 		usb_free_urb(acm->wb[i].urb);
-alloc_fail4:
+err_free_read_urbs:
 	for (i = 0; i < num_rx_buf; i++)
 		usb_free_urb(acm->read_urbs[i]);
 	acm_read_buffers_free(acm);
 	usb_free_urb(acm->ctrlurb);
-alloc_fail3:
+err_free_write_buffers:
 	acm_write_buffers_free(acm);
-alloc_fail2:
+err_free_ctrl_buffer:
 	usb_free_coherent(usb_dev, ctrlsize, acm->ctrl_buffer, acm->ctrl_dma);
-alloc_fail1:
+err_put_port:
 	tty_port_put(&acm->port);
-alloc_fail:
+
 	return rv;
 }
 
-- 
2.26.3

