Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC49183433
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733095AbfHFOp0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:45994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F983214C6;
        Tue,  6 Aug 2019 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102725;
        bh=y5sjjHF0mPrzkYSRuSdN76gCl6+KIgsGIjtdiuyGZn8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=txZUQvP21hkt67FnCY0FPO6SpWMgarv3o/t7h2Ax2SHkgsLeiVya5NQv4vJ0jqFlX
         RAE0sQ8PpI5HhFgjsEq1yUn3DIzTWQbMDGE9/kXgXqmu1tIqLPjYEDCDDAlL0zSlhi
         SJfx6Xv9z5SP5GsDFwNeksdXXEHkN43VDXBjuMqY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/12] USB: atm: cxacru: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:53 +0200
Message-Id: <20190806144502.17792-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806144502.17792-1-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB drivers now support the ability for the driver core to handle the
creation and removal of device-specific sysfs files in a race-free
manner.  Take advantage of that by converting the driver to use this by
moving the sysfs attributes into a group and assigning the dev_groups
pointer to it.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/atm/cxacru.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index e57a2be8754a..5d41f85a7445 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -539,6 +539,37 @@ CXACRU_SET_##_action(                                        adsl_config);
 
 CXACRU_ALL_FILES(INIT);
 
+static struct attribute *cxacru_attrs[] = {
+	&dev_attr_adsl_config.attr,
+	&dev_attr_adsl_state.attr,
+	&dev_attr_adsl_controller_version.attr,
+	&dev_attr_adsl_headend_environment.attr,
+	&dev_attr_adsl_headend.attr,
+	&dev_attr_modulation.attr,
+	&dev_attr_line_startable.attr,
+	&dev_attr_downstream_hec_errors.attr,
+	&dev_attr_upstream_hec_errors.attr,
+	&dev_attr_downstream_fec_errors.attr,
+	&dev_attr_upstream_fec_errors.attr,
+	&dev_attr_downstream_crc_errors.attr,
+	&dev_attr_upstream_crc_errors.attr,
+	&dev_attr_startup_attempts.attr,
+	&dev_attr_downstream_bits_per_frame.attr,
+	&dev_attr_upstream_bits_per_frame.attr,
+	&dev_attr_transmitter_power.attr,
+	&dev_attr_downstream_attenuation.attr,
+	&dev_attr_upstream_attenuation.attr,
+	&dev_attr_downstream_snr_margin.attr,
+	&dev_attr_upstream_snr_margin.attr,
+	&dev_attr_mac_address.attr,
+	&dev_attr_line_status.attr,
+	&dev_attr_link_status.attr,
+	&dev_attr_upstream_rate.attr,
+	&dev_attr_downstream_rate.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(cxacru);
+
 /* the following three functions are stolen from drivers/usb/core/message.c */
 static void cxacru_blocking_completion(struct urb *urb)
 {
@@ -736,17 +767,6 @@ static int cxacru_card_status(struct cxacru_data *instance)
 	return 0;
 }
 
-static void cxacru_remove_device_files(struct usbatm_data *usbatm_instance,
-		struct atm_dev *atm_dev)
-{
-	struct usb_interface *intf = usbatm_instance->usb_intf;
-
-	#define CXACRU_DEVICE_REMOVE_FILE(_name) \
-		device_remove_file(&intf->dev, &dev_attr_##_name);
-	CXACRU_ALL_FILES(REMOVE);
-	#undef CXACRU_DEVICE_REMOVE_FILE
-}
-
 static int cxacru_atm_start(struct usbatm_data *usbatm_instance,
 		struct atm_dev *atm_dev)
 {
@@ -765,13 +785,6 @@ static int cxacru_atm_start(struct usbatm_data *usbatm_instance,
 		return ret;
 	}
 
-	#define CXACRU_DEVICE_CREATE_FILE(_name) \
-		ret = device_create_file(&intf->dev, &dev_attr_##_name); \
-		if (unlikely(ret)) \
-			goto fail_sysfs;
-	CXACRU_ALL_FILES(CREATE);
-	#undef CXACRU_DEVICE_CREATE_FILE
-
 	/* start ADSL */
 	mutex_lock(&instance->adsl_state_serialize);
 	ret = cxacru_cm(instance, CM_REQUEST_CHIP_ADSL_LINE_START, NULL, 0, NULL, 0);
@@ -804,11 +817,6 @@ static int cxacru_atm_start(struct usbatm_data *usbatm_instance,
 	if (start_polling)
 		cxacru_poll_status(&instance->poll_work.work);
 	return 0;
-
-fail_sysfs:
-	usb_err(usbatm_instance, "cxacru_atm_start: device_create_file failed (%d)\n", ret);
-	cxacru_remove_device_files(usbatm_instance, atm_dev);
-	return ret;
 }
 
 static void cxacru_poll_status(struct work_struct *work)
@@ -1332,7 +1340,6 @@ static struct usbatm_driver cxacru_driver = {
 	.heavy_init	= cxacru_heavy_init,
 	.unbind		= cxacru_unbind,
 	.atm_start	= cxacru_atm_start,
-	.atm_stop	= cxacru_remove_device_files,
 	.bulk_in	= CXACRU_EP_DATA,
 	.bulk_out	= CXACRU_EP_DATA,
 	.rx_padding	= 3,
@@ -1364,7 +1371,8 @@ static struct usb_driver cxacru_usb_driver = {
 	.name		= cxacru_driver_name,
 	.probe		= cxacru_usb_probe,
 	.disconnect	= usbatm_usb_disconnect,
-	.id_table	= cxacru_usb_ids
+	.id_table	= cxacru_usb_ids,
+	.dev_groups	= cxacru_groups,
 };
 
 module_usb_driver(cxacru_usb_driver);
-- 
2.22.0

