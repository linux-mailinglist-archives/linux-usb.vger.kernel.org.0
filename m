Return-Path: <linux-usb+bounces-23406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4891A9ACFA
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 14:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693525A1FE3
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BFF221FAE;
	Thu, 24 Apr 2025 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcsva0cc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773A22A1FA
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496714; cv=none; b=IMhxINtl+fdxghc/HJUCcPPr+ArZalKkSXqQOKl71/19Gxuzalt3GfyfLh/00V7gdnzTw6Oew2SXUjUcT5dbfMxBQUOb3KDuXNp/QuG88RnDbrEBReyC3e8qWuuo3ImbAIKd4nLW54o0i038ACd3vO2bA7H3hvWZ/tcYKDVOM8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496714; c=relaxed/simple;
	bh=K/aNIRvzEVig/olSE8zUcxcdUeVADyIxUVY144kzk7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=huHsFC6gdpFhmQ53l9PAhoGI/1b59tXihWSiF4h00uG1JxLEJyi+/yJJKkSWeKzLTgRMr8VSUayjkJJnrVk14Dz7wAJlpcgLGnHnbEFR/Z8MYzMLDjwWQKFfJLYcAso+s2rDP2IomPF+xOrGGSB7WvdBWKRc6I22rOHbXZYxEGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcsva0cc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3YlE004831
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 12:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ysPHr0oxErNRxpL2VqwsL629gPUNXWu017Q
	QhNrJas4=; b=lcsva0ccwmsI2kGh00uo1KpvRIxUV7pjP2/h0CqO375BO9MOW6A
	iK/8uGaDZRKpr+xgN89e6xJBafev+fECm9h7CY5bak7qtvYS/Qo09YjKoA4Dua9q
	lRNUiD7jFbKmm0VIreoDkBnB4UfbV7Q3NwQ6Ubq2TdZcNe/rvvNtWpi1w6IaYIAn
	w1CIU/AL7uOCeCM0jpcFK+SO0ZLq6IMDhs4oDahnjdPOH+iiR6onzkSELtl8pJ9Y
	FfcLg9bMlybUOdVLQlgofJefYZbslBov+EGlo7SX0maPr1w47jcjsWu4lpsn5dLf
	MKP2Dlf2ZfhbeMOFZdgKPzGXbbwxuEIFvAQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy5gmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 12:11:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0e6b7ea77dso955877a12.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 05:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496709; x=1746101509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysPHr0oxErNRxpL2VqwsL629gPUNXWu017QQhNrJas4=;
        b=YA5uXsqoEiKi2U2c1Zb/2wery0zl9MAJd4D2FZkh5RUocrJYErQh8FgVsHAEG9nwZS
         0nVt41ROsDAetUxaXDQxrTjwUJxe+GtlCpuveTKAEadI3t1DFTQcvkztTyZs2XXaZEqB
         3PateiDjlc0PazLKkDTg/qpbN2ZKCaRnNroAHhXVRHI6E0F52mDdjpsYFTScze3QKJkm
         P6Np7ATTvgPjHDPxpI4Omg1FOBsNQ4BnqrGRB6ZjXRPf3FQMtRZNIN6rHHR/ow2xQTBK
         wKTITW3tUY+T/mZwrLCTSTley4oVAldgv03HnFusTyQfBD8Mcbscud8wnPCnmwokRGbP
         sRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWQrrei3Oxy4ZCNyRghNNCNMXCYtI0JJyT2SJsFvFy8Z5Q3OoIM70frg6V8yksRK6ytM9ojLN+uzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Z9bop1wtdqSTy8/eHMZwUxQAl/8fhxBsLd3ojI+/niXk2c//
	SZebbNxeQyXWHxScCyqRRZLx5Wh2j1oyD41JB9r5/a/XD01FBnjMGSCY7Y00GUAb2+wYlTPoAC7
	EPxh3qY5DtY37LStyt/TKwM/8kPZXOS5Ui0kXQBDZp/oWOJ7+9nIINTL+JxQ=
X-Gm-Gg: ASbGnct2m7Gx5DpUqYktn/lQTb2ggmmg2i3+5zb4RCOHTML59LjoX/kTmC6slUB16fR
	AGXBEJUCN5e0v+kvvP95bLRgR+NkZ9NQz16cadXDkE9vhGW+l+C5AqTrfW0+zVyUVgR1rHgHwWS
	DpwAuO3nGZMdTmd7sKqYWkK1wGBQDF3qG5HK7Tq3wU8JGJUQ9s5gic3s6vaOFj38coE151zM6D2
	gZbC6VYiiy/eA0GXpP70GnhK3rOv4wMYBkcDnK/fVJSXKqaEYmsjmkwRi3hPnantC5xBVwlo2ia
	5EqyfZMfjzpxumTu3PHCmqJ5sTd/LWmzUZrhw2ev
X-Received: by 2002:a05:6a20:431e:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-20444f0e2c8mr3750351637.25.1745496709347;
        Thu, 24 Apr 2025 05:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0Jc5QAJOW0a8314p+AABfN5ecVt6FL9OxrqvMvwq7E3oY3+jyOyXnww3hGQO3KFo9b80TSA==
X-Received: by 2002:a05:6a20:431e:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-20444f0e2c8mr3750321637.25.1745496709009;
        Thu, 24 Apr 2025 05:11:49 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c5asm1226788b3a.6.2025.04.24.05.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:11:48 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: gadget: u_serial: Implement remote wakeup capability
Date: Thu, 24 Apr 2025 17:41:42 +0530
Message-Id: <20250424121142.4180241-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MiBTYWx0ZWRfX2tPy+/LoB8yn YJpOuWif6bqqDdlLHhDaMEYMZofrrhf54TtF3in57VaQqYgQKLIHGjZaaXH8/16FbXBCe9AVyAn zYErm59TQu8eZxBm4xdZxBdtFHyw9FHX6iLuR4EpyihLf37Z0ILHiy4JUE8kOKtgeZDGoBoGWFo
 JjaoeOVHEG807NkVRBSvr1j97eb9vVlnjoRcLv3PpUpHDp92CLRGugE+9rRB1aWSP2QBOtmxe40 aXh+LadzgR6LipG+Mwgce8EV29ZfopnOCBp2a4BTOIVbQ+BWIjO3KpErKOJcCgtAxQFpQZYyfBi Rm8aKed4f3peSC/7nGNA8PZ0fXmLW/UeeEg0FNR7WMwrEDUEGGqWoOu08EbG9dALstAmmnE1NIi
 2s9oKf/41ZogIOWB2rEg/qSouTboHDE+9DSbI5+fyRzh07jnyUjvMBq+l7cUdeaaojDRkTvU
X-Proofpoint-GUID: t9g12jqdsr3MbilvZkWCd1r3d4uyYRJU
X-Proofpoint-ORIG-GUID: t9g12jqdsr3MbilvZkWCd1r3d4uyYRJU
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a2a86 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9gX2OuH4G143YozJX2wA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=953 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240082

Implement the remote wakeup capability for u_serial. The newly added
function gserial_wakeup_host() wakes up the host when there is some
data to be sent while the device is suspended. Add gser_get_status()
callbacks to advertise f_serial interface as function wakeup capable.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/function/f_serial.c |  7 +++++
 drivers/usb/gadget/function/u_serial.c | 43 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index 8f7e7a2b2ff2..0f266bc067f5 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -364,6 +364,12 @@ static void gser_suspend(struct usb_function *f)
 	gserial_suspend(&gser->port);
 }
 
+static int gser_get_status(struct usb_function *f)
+{
+	return (f->func_wakeup_armed ? USB_INTRF_STAT_FUNC_RW : 0) |
+		USB_INTRF_STAT_FUNC_RW_CAP;
+}
+
 static struct usb_function *gser_alloc(struct usb_function_instance *fi)
 {
 	struct f_gser	*gser;
@@ -387,6 +393,7 @@ static struct usb_function *gser_alloc(struct usb_function_instance *fi)
 	gser->port.func.free_func = gser_free;
 	gser->port.func.resume = gser_resume;
 	gser->port.func.suspend = gser_suspend;
+	gser->port.func.get_status = gser_get_status;
 
 	return &gser->port.func;
 }
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 36fff45e8c9b..41dee7c8cc7c 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -592,6 +592,17 @@ static int gs_start_io(struct gs_port *port)
 	return status;
 }
 
+static int gserial_wakeup_host(struct gserial *gser)
+{
+	struct usb_function	*func = &gser->func;
+	struct usb_gadget	*gadget = func->config->cdev->gadget;
+
+	if (func->func_suspended)
+		return usb_func_wakeup(func);
+	else
+		return usb_gadget_wakeup(gadget);
+}
+
 /*-------------------------------------------------------------------------*/
 
 /* TTY Driver */
@@ -746,6 +757,8 @@ static ssize_t gs_write(struct tty_struct *tty, const u8 *buf, size_t count)
 {
 	struct gs_port	*port = tty->driver_data;
 	unsigned long	flags;
+	int ret = 0;
+	struct gserial  *gser = port->port_usb;
 
 	pr_vdebug("gs_write: ttyGS%d (%p) writing %zu bytes\n",
 			port->port_num, tty, count);
@@ -753,6 +766,17 @@ static ssize_t gs_write(struct tty_struct *tty, const u8 *buf, size_t count)
 	spin_lock_irqsave(&port->port_lock, flags);
 	if (count)
 		count = kfifo_in(&port->port_write_buf, buf, count);
+
+	if (port->suspended) {
+		spin_unlock_irqrestore(&port->port_lock, flags);
+		ret = gserial_wakeup_host(gser);
+		if (ret) {
+			pr_debug("ttyGS%d: Remote wakeup failed:%d\n", port->port_num, ret);
+			return count;
+		}
+		spin_lock_irqsave(&port->port_lock, flags);
+	}
+
 	/* treat count == 0 as flush_chars() */
 	if (port->port_usb)
 		gs_start_tx(port);
@@ -781,10 +805,22 @@ static void gs_flush_chars(struct tty_struct *tty)
 {
 	struct gs_port	*port = tty->driver_data;
 	unsigned long	flags;
+	int ret = 0;
+	struct gserial  *gser = port->port_usb;
 
 	pr_vdebug("gs_flush_chars: (%d,%p)\n", port->port_num, tty);
 
 	spin_lock_irqsave(&port->port_lock, flags);
+	if (port->suspended) {
+		spin_unlock_irqrestore(&port->port_lock, flags);
+		ret = gserial_wakeup_host(gser);
+		if (ret) {
+			pr_debug("ttyGS%d: Remote wakeup failed:%d\n", port->port_num, ret);
+			return;
+		}
+		spin_lock_irqsave(&port->port_lock, flags);
+	}
+
 	if (port->port_usb)
 		gs_start_tx(port);
 	spin_unlock_irqrestore(&port->port_lock, flags);
@@ -1464,6 +1500,13 @@ void gserial_suspend(struct gserial *gser)
 		return;
 	}
 
+	if (port->write_busy || port->write_started) {
+		/* Wakeup to host if there are ongoing transfers */
+		spin_unlock_irqrestore(&serial_port_lock, flags);
+		if (!gserial_wakeup_host(gser))
+			return;
+	}
+
 	spin_lock(&port->port_lock);
 	spin_unlock(&serial_port_lock);
 	port->suspended = true;
-- 
2.25.1


