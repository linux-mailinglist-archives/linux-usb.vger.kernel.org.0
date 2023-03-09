Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 621BF6B21CA
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 11:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjCIKp7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 05:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCIKpd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 05:45:33 -0500
X-Greylist: delayed 7821 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Mar 2023 02:45:31 PST
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com [148.163.137.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348BB8A387
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 02:45:30 -0800 (PST)
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3297e1I6004199
        for <linux-usb@vger.kernel.org>; Thu, 9 Mar 2023 03:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=iVXe6uHn6Q7FWzZXO6SngExNdXQ6SHP3Nu7NCeMzCno=;
 b=Jbu6+2VLATYh1qp8kZlvf8f6TgS82Bh72lfCyLfH6JskO6zFeYYLly7bjeHtcwQTjgOD
 38f4JgqhrNViZWR8wg+/Ni39bBOkuUrJ8kxrhzYSEceU4ld/KxsNs6uLfLwki+MXx3cK
 xg6tlvruc6A0S9I4QH/2W35U7WUS+h1COed733Gl+ea+OW1NOIzj9KnRx9ufv2kZEadK
 Kgr3EiDjDa5SeLDCF8Q3I1W0LxR5ZucwnXQm9nZPwxVu6QfS/HbXAvkeSxmFvlaaU4xU
 kTmWYFxZkKWbOdHeTDgLKcllqG1hsZ3wbjxUYRq1TGjhOyDxcQFFzm3000KfZzFVs/1b yA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 3p6fgbf2ux-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 03:34:58 -0500
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3298L9Wj005366
        for <linux-usb@vger.kernel.org>; Thu, 9 Mar 2023 03:34:54 -0500
Received: from esaplrlyps302.us.dell.com ([143.166.145.26])
        by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 3p7bpb055g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 03:34:53 -0500
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="52077595"
Received: from unknown (HELO dell-Virtual-Machine.mshome.net) ([10.107.228.2])
  by esaplrlyps302.us.dell.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 02:34:52 -0600
From:   Kangzhen Lou <kangzhen.lou@dell.com>
To:     oliver@neukum.org
Cc:     linux-usb@vger.kernel.org, Kangzhen Lou <kangzhen.lou@dell.com>
Subject: [PATCH] net: cdc_ncm: support ACPI MAC address pass through functionality
Date:   Thu,  9 Mar 2023 16:34:36 +0800
Message-Id: <20230309083436.6729-1-kangzhen.lou@dell.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_04,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=656 malwarescore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090067
X-Proofpoint-GUID: smbbUn0oZrVqqa-yl5MJ-d5CUZBQ0AER
X-Proofpoint-ORIG-GUID: smbbUn0oZrVqqa-yl5MJ-d5CUZBQ0AER
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=780 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090066
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make cdc_ncm to support ACPI MAC address pass through functionality that
also exists in the Realtek r8152 driver.

RTL8153DD will load cdc_ncm driver by default with mainline 6.2 kernel.
This is to support Realtek RTL8153DD Ethernet Interface Controller's MAC
pass through function which used in dock, dongle or monitor.

Although there is patch “ec51fbd1b8a2bca2948dede99c14ec63dc57ff6b” will
make RTL8153DD load r8152-cfgselector instead cdc_ncm driver, would also
submit this patch in case anyone need this feature in cdc_ncm in the
future.

Signed-off-by: Kangzhen Lou <kangzhen.lou@dell.com>
---
 drivers/net/usb/cdc_ncm.c | 199 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 197 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 6ce8f4f0c70e..8179516b819c 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -53,6 +53,7 @@
 #include <linux/usb/usbnet.h>
 #include <linux/usb/cdc.h>
 #include <linux/usb/cdc_ncm.h>
+#include <linux/acpi.h>
 
 #if IS_ENABLED(CONFIG_USB_NET_CDC_MBIM)
 static bool prefer_mbim = true;
@@ -814,6 +815,177 @@ static const struct net_device_ops cdc_ncm_netdev_ops = {
 	.ndo_validate_addr   = eth_validate_addr,
 };
 
+int acpi_mac_passthru_invalid(void)
+{
+	acpi_status status;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	int ret = -EINVAL;
+
+	/* returns _AUXMAC_#AABBCCDDEEFF# */
+	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
+	obj = (union acpi_object *)buffer.pointer;
+
+	if (!ACPI_SUCCESS(status))
+		return -ENODEV;
+	if (obj->type != ACPI_TYPE_BUFFER || obj->string.length != 0x17) {
+		acpi_info("Invalid buffer for pass-thru MAC addr: (%d, %d)\n",
+			  obj->type, obj->string.length);
+		goto amacout;
+	}
+	if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
+	    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
+		acpi_info("Invalid header when reading pass-thru MAC addr\n");
+		goto amacout;
+	}
+	/* return success, otherwise return non-zero if invalid buffer read or
+	 * MAC pass through is disabled in BIOS
+	 */
+	ret = 0;
+
+amacout:
+	kfree(obj);
+	return ret;
+}
+
+int get_acpi_mac_passthru(char *MACAddress)
+{
+	acpi_status status;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	int ret = -EINVAL;
+	unsigned char buf[6];
+
+	/* returns _AUXMAC_#AABBCCDDEEFF# */
+	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
+	obj = (union acpi_object *)buffer.pointer;
+
+	if (!ACPI_SUCCESS(status))
+		return -ENODEV;
+
+	ret = hex2bin(buf, obj->string.pointer + 9, 6);
+	if (!(ret == 0 && is_valid_ether_addr(buf))) {
+		acpi_info("Invalid MAC for pass-thru MAC addr: %d, %pM\n",
+			  ret, buf);
+		ret = -EINVAL;
+		goto amacout;
+	}
+	memcpy(MACAddress, buf, 6);
+	acpi_info("Pass-thru MAC addr %pM\n", MACAddress);
+
+amacout:
+	kfree(obj);
+	return ret;
+}
+
+/* Provide method to get MAC address from the USB device's ethernet controller.
+ * If the device supports CDC_GET_ADDRESS, we should receive just six bytes.
+ * Otherwise, use the prior method by asking for the descriptor.
+ */
+static int cdc_ncm_get_ethernet_address(struct usbnet *dev,
+					struct cdc_ncm_ctx *ctx)
+{
+	int ret;
+	u8 iface_no = ctx->control->cur_altsetting->desc.bInterfaceNumber;
+
+	ret = usbnet_read_cmd(dev, USB_CDC_GET_NET_ADDRESS,
+			      USB_DIR_IN | USB_TYPE_CLASS
+			      | USB_RECIP_INTERFACE, 0,
+			      iface_no, dev->net->dev_addr, ETH_ALEN);
+
+	if (ret == ETH_ALEN) {
+		ret = 0;	/* success */
+	} else {
+		ret = usbnet_get_ethernet_addr(dev,
+				ctx->ether_desc->iMACAddress);
+	}
+
+	return ret;
+}
+
+/* Provide method to push MAC address to the USB device's ethernet controller.
+ * If the device does not support CDC_SET_ADDRESS, there is no harm and we
+ * proceed as before.
+ */
+static int cdc_ncm_set_ethernet_address(struct usbnet *dev,
+					struct sockaddr *addr)
+{
+	int ret;
+	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
+	u8 iface_no_data = ctx->data->cur_altsetting->desc.bInterfaceNumber;
+	u8 iface_no_control = ctx->control->cur_altsetting->desc.bInterfaceNumber;
+	int temp;
+
+	/* The host shall only send SET_NET_ADDRESS command while
+	 * the NCM Data Interface is in alternate setting 0.
+	 */
+	temp = usb_set_interface(dev->udev, iface_no_data, 0);
+	if (temp) {
+		dev_dbg(&dev->udev->dev, "set interface failed\n");
+		return -ENODEV;
+		}
+
+	ret = usbnet_write_cmd(dev, USB_CDC_SET_NET_ADDRESS,
+			       USB_DIR_OUT | USB_TYPE_CLASS
+			       | USB_RECIP_INTERFACE, 0,
+			       iface_no_control, addr->sa_data, ETH_ALEN);
+
+	if (ret == ETH_ALEN)
+		ret = 0;	// success
+	else if (ret < 0)
+		dev_dbg(&dev->udev->dev, "bad MAC address put, %d\n", ret);
+
+	/* restore alternate setting.
+	 * The NCM data altsetting is fixed, so we hard-coded it.
+	 */
+	temp = usb_set_interface(dev->udev, iface_no_data,
+			CDC_NCM_DATA_ALTSETTING_NCM);
+	if (temp) {
+		dev_dbg(&dev->udev->dev, "set interface failed\n");
+		return -ENODEV;
+		}
+
+	return ret;
+}
+
+static int cdc_ncm_determine_ethernet_addr(struct usb_interface *intf)
+{
+	struct sockaddr sa;
+	struct usbnet *dev = usb_get_intfdata(intf);
+	struct cdc_ncm_ctx *ctx;
+	int ret = 0;
+
+	if (!dev)
+		return 0;
+
+	/* MAC pass through function only apply to Realtek RTL8153-DD chip */
+	if (!(dev->udev->descriptor.idVendor == 0x0bda
+		&& dev->udev->descriptor.idProduct == 0x8153
+		&& (dev->udev->descriptor.bcdDevice & 0xff00) == 0x3300))
+		return 0;
+
+	ctx = (struct cdc_ncm_ctx *)dev->data[0];
+	if (!ctx->ether_desc)
+		return 0;
+
+	ret = cdc_ncm_get_ethernet_address(dev, ctx);
+	if (ret) {
+		dev_dbg(&intf->dev, "failed to get mac address\n");
+		return ret;
+	}
+
+	if (!get_acpi_mac_passthru(sa.sa_data)) {
+		if (memcmp(dev->net->dev_addr, sa.sa_data, ETH_ALEN) != 0) {
+			if (!cdc_ncm_set_ethernet_address(dev, &sa))
+				memcpy(dev->net->dev_addr, sa.sa_data, ETH_ALEN);
+		}
+	}
+
+	dev_info(&intf->dev, "MAC-Address: %pM\n", dev->net->dev_addr);
+
+	return 0;
+}
+
 int cdc_ncm_bind_common(struct usbnet *dev, struct usb_interface *intf, u8 data_altsetting, int drvflags)
 {
 	struct cdc_ncm_ctx *ctx;
@@ -945,6 +1117,9 @@ int cdc_ncm_bind_common(struct usbnet *dev, struct usb_interface *intf, u8 data_
 		}
 		dev_info(&intf->dev, "MAC-Address: %pM\n", dev->net->dev_addr);
 	}
+	/* Execute MAC pass thru only if enabled in BIOS */
+	if (acpi_mac_passthru_invalid() == 0)
+		cdc_ncm_determine_ethernet_addr(intf);
 
 	/* finish setting up the device specific data */
 	cdc_ncm_setup(dev);
@@ -1892,6 +2067,25 @@ static void cdc_ncm_status(struct usbnet *dev, struct urb *urb)
 	}
 }
 
+static int cdc_ncm_resume(struct usb_interface *intf)
+{
+	int ret;
+
+	ret = usbnet_resume(intf);
+	if (ret == 0)
+		cdc_ncm_determine_ethernet_addr(intf);
+
+	return ret;
+}
+
+static int cdc_ncm_post_reset(struct usb_interface *intf)
+{
+	/* reset the MAC address in case of policy change */
+	cdc_ncm_determine_ethernet_addr(intf);
+
+	return 0;
+}
+
 static const struct driver_info cdc_ncm_info = {
 	.description = "CDC NCM (NO ZLP)",
 	.flags = FLAG_POINTTOPOINT | FLAG_NO_SETINT | FLAG_MULTI_PACKET
@@ -2051,8 +2245,9 @@ static struct usb_driver cdc_ncm_driver = {
 	.probe = usbnet_probe,
 	.disconnect = usbnet_disconnect,
 	.suspend = usbnet_suspend,
-	.resume = usbnet_resume,
-	.reset_resume =	usbnet_resume,
+	.resume = cdc_ncm_resume,
+	.reset_resume =	cdc_ncm_resume,
+	.post_reset = cdc_ncm_post_reset,
 	.supports_autosuspend = 1,
 	.disable_hub_initiated_lpm = 1,
 };
-- 
2.34.1

