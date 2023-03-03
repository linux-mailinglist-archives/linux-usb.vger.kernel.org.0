Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CAD6A941B
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 10:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCCJ3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 04:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCCJ3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 04:29:34 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF3F5C11D
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 01:29:11 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3238XQ4L026496;
        Fri, 3 Mar 2023 09:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=yJpsuiucFxPCFPTJGUOYd/iDil2t/T/2s7Gp/PygFO4=;
 b=hEYytJXHDtCz4AX3DvpFTC6VzkR83YktqN9WKy8eVoOM+3fXnfxKq0rbHbS/n6Dg3/7d
 XVQw2+3bUZsu0Lmmu8JrQb+TM2/1P7g4xUXFmIHoUAf6UhmKWuu4IYc2tv8QbqXy5QEr
 OzhJJPl8eHkOyMqOh4HJUcoqbuKADvNR40exXS3sRC3XAMkx0hhVMvbYT94KZEFAmg3z
 azeIPCmE+3f961NFdiKAHxtF6v4IVpA2H07t5G7cdFmiyJUIaw9O2mJc3CUdY64Gw26p
 JyzEmZyPa+ttIc4Wc5MzJbRCrgdtyqtOsZ2yanmuyqJMWunMZisdKSTTLNKhxtk2fPdc KA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p3dfrg4hg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Mar 2023 09:28:49 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3239SmfW002579
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Mar 2023 09:28:48 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 3 Mar 2023 01:28:46 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [RFC PATCH 2/2] usb: core: hub: avoid reset hub during probe
Date:   Fri, 3 Mar 2023 17:28:38 +0800
Message-ID: <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SMIAxjeXF1JDvcYNjer2DOjw1sDKLxZU
X-Proofpoint-ORIG-GUID: SMIAxjeXF1JDvcYNjer2DOjw1sDKLxZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_01,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=863 clxscore=1015
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030083
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When start probe hub, during INIT, INTT2, INIT3 stage, when link state
change to inactive, currently it will reset the device, maybe it will
trigger warning in usb_submit_urb() due to urb->hcpriv is still active.

Add a flag name init_stage to avoid reset the device.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/core/hub.c | 20 +++++++++++++++++++-
 drivers/usb/core/hub.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 97a0f8f..3cb1137 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1290,6 +1290,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 	if (type == HUB_INIT2 || type == HUB_INIT3) {
 		/* Allow autosuspend if it was suppressed */
  disconnected:
+		hub->init_stage = 0;
 		usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
 		device_unlock(&hdev->dev);
 	}
@@ -1872,6 +1873,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	kref_init(&hub->kref);
 	hub->intfdev = &intf->dev;
 	hub->hdev = hdev;
+	hub->init_stage = 1;
 	INIT_DELAYED_WORK(&hub->leds, led_work);
 	INIT_DELAYED_WORK(&hub->init_work, NULL);
 	INIT_WORK(&hub->events, hub_event);
@@ -5587,6 +5589,21 @@ static void port_over_current_notify(struct usb_port *port_dev)
 	kfree(port_dev_path);
 }
 
+static bool port_child_avoid_reset(struct usb_device *udev)
+{
+	struct usb_hub *hub;
+
+	if (udev->descriptor.bDeviceClass == USB_CLASS_HUB &&
+	    udev->state == USB_STATE_CONFIGURED) {
+		hub = usb_get_intfdata(udev->actconfig->interface[0]);
+
+		if (hub && hub->init_stage)
+			return true;
+	}
+
+	return false;
+}
+
 static void port_event(struct usb_hub *hub, int port1)
 		__must_hold(&port_dev->status_lock)
 {
@@ -5699,7 +5716,8 @@ static void port_event(struct usb_hub *hub, int port1)
 			dev_dbg(&port_dev->dev, "do warm reset, full device\n");
 			usb_unlock_port(port_dev);
 			usb_lock_device(udev);
-			usb_reset_device(udev);
+			if (!port_child_avoid_reset(udev))
+				usb_reset_device(udev);
 			usb_unlock_device(udev);
 			usb_lock_port(port_dev);
 			connect_change = 0;
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index e238335..040524f 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -66,6 +66,7 @@ struct usb_hub {
 	unsigned		quirk_check_port_auto_suspend:1;
 
 	unsigned		has_indicators:1;
+	unsigned		init_stage:1;
 	u8			indicator[USB_MAXCHILDREN];
 	struct delayed_work	leds;
 	struct delayed_work	init_work;
-- 
2.7.4

