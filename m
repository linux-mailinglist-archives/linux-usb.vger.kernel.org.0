Return-Path: <linux-usb+bounces-25742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A903B0354D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 06:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901B81739D4
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 04:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1911F4C8E;
	Mon, 14 Jul 2025 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/Kjhy3A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A61F3B8A
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 04:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752468436; cv=none; b=KMkU1tGptWK45rS0rLWJx/QINN0CAbsXnxqQx6Tba3rwxQUuctXmoyG6bkQ8nnLJtgc26fBPLJzdk+31tI0rozP7t1B3MN3Sz05EDGBEKIB2HFCaeAbAUmUNUadyQVLoPfQktUuRkob59HTQk29wO3F3B9ZAWpyQNlW1JOfBPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752468436; c=relaxed/simple;
	bh=MIpQ5Q0VIvo+JU7aGA6BR/cFkK3jmGi9K39tdTwVBLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WpgSPrf4xTeG27kVPmhK3gpoNjr9BYqV3Cxa3S8DBNBbi8QTds+PIQmAeQufAb7uQrjFgwElG3QtKfbQ/yD4qdeCkRJ6skHc78t21WLQ8tWAdt7uH74BBUYe+QVnxPJGOjVn8y2fPoawgGU+P0qI8jVXXsjo178DKn74jfV5qGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/Kjhy3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMSPbG028415
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 04:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SMotp43FosdZ2W0txBdCz1GbIq+fsqM3Dsb
	xm8sifnc=; b=X/Kjhy3AVPBxVQ+MENVKG3xIYwt4yuQe38mZOgwRYcni+DeDjOq
	7XgGu0REyv9IDc4IqtaUQSjoGtSElunY+QLhm3liVyOJrS9cu4Jp35nF2h67MAi1
	cgeMe9Yv/t2a2VV832pCT81ybjvAa7G+X+o8ETmYU+j8O5gZZ8owZ1q90OneMbEP
	ayUD2B6gzZfNmRmoJF9no5Hxik9mrNggyp9swJg6fjzFdDuBWlZSwwQsLFPyAWr+
	2j6g4OTz9atxg0En9Zs2GeTz3xDQoDFqSYTy324HVkalfpJlyJJB0N1yVV1YAsYD
	zpIdhce3RHGlBwNiOLm8WubeAVO2I1uvM+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut36n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 04:47:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235c897d378so38145895ad.1
        for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 21:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752468432; x=1753073232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMotp43FosdZ2W0txBdCz1GbIq+fsqM3Dsbxm8sifnc=;
        b=i8ll2lGSP27KnVqD31TLRvCdzKl2Dq0zRwbw8ehuGproeTxsNbyKUiQLskX1xt8ly+
         vwZXLgJmMczxSCiwWqXXogn6ZqfC+rz7F/Gbsk2hqoRPqzAmyMQ5yx19LAkfU0wPYhU/
         ZKXmXx+oa1RN5yFsssn+V3pzPGm1UbfrQVIsmuU8IlXBJwf8Ov9HrXOCRPFAy3B3JuuP
         PqQReIrZ3/sX5vj3ZGp0BW5qWhgi85P4+x0FqJAbZfkNzjDNhgnBXJXp0tzgssYxwFNH
         rTfhcu7qa5MzNnymezw1y13PjajE3ZRCfMLzgOGlb+oRJOS3v9j9oEUnet+53KTmqMTW
         gHmg==
X-Forwarded-Encrypted: i=1; AJvYcCXquTEG0aTX0isCc+Z6pRdIz7SXgrc8t/YWi18J6juJW6M8aqvkxP9+DVIzZWuqDOSMgRtycRG6bik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxScZyJn4kZggfsfJAeLOH5NbFpDGczmUbSNYawCNvIvwaLwO0Z
	zgqWbp0GD+lGqKE1nn4IOXXU/DQvbnfMkNGfVfKt0TskItQ4taIsFhNZBUVen8rOm2HpQTSCbDr
	APlnFwbveBEn/Oxod1l5zRe6EsJHsjL0g0eOoi4+dx3XdVA5ZRsYYaGHxwwEXFY/Lig3zO74=
X-Gm-Gg: ASbGncsAjUh0zvZKpka+uHE8C3J4RynCqi6AMDzNFPP3KJa1LNLSDC7gvce9Z0pf0a0
	J909FRr+JN+0o7tAi1OXzgmE8KrLgV3XTHutj2dskK6cro8wLzo5kxaF7k041x8CeQCGmxF/YiV
	URDAZlMJaD0KQBGjwcWfv9eOWVgGHsk35oRJNFGtgrH8XofDG/+l/941SS9tOQOteLJ9/pYjXbz
	tJ7TyIy3FVCoSNmBPPtMM9uWpnshni3V7+xkEHJiQDECCHN6poKXDuTehiMwz3zjqiWChLW2MaU
	FsiP0eoD7aqyn/9FQ0dB80PVWXeZU3tbxUVB8PIBU8Y0U9YGcsRSXz8q0H4dXj8o3GvchW5txl+
	OLw==
X-Received: by 2002:a17:902:c407:b0:235:f298:cbbe with SMTP id d9443c01a7336-23dede387d6mr180694505ad.12.1752468432259;
        Sun, 13 Jul 2025 21:47:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/chjcZA9pDzqtEq6QhkNj4Ah8vf7hGn9SFCFAv1D5BS5L27T8vry5begaHNsu51w5tceLag==
X-Received: by 2002:a17:902:c407:b0:235:f298:cbbe with SMTP id d9443c01a7336-23dede387d6mr180694075ad.12.1752468431808;
        Sun, 13 Jul 2025 21:47:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4323df7sm84017235ad.134.2025.07.13.21.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 21:47:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
Date: Mon, 14 Jul 2025 10:17:02 +0530
Message-Id: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68748bd1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsaRtseu1FE5unmruSMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VyJxZZiDf3qBibfQfDnSVe-uK0Lqi5s2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAyNSBTYWx0ZWRfXx1aKcxEedrX3
 5b5hnoIj1yGE15oywO5fSIFErh4VC8mJs1GCuvX6jkN9OcgR/tJO0sof+5Hwi96XrNDQDXlRZZ8
 XwvjI5vjLxVgb5+h8YYNoArpjYFQ8536As9NAoGXHwh04maiBHWqtaFzv16yaY5oghBzWJ5FhTg
 MHKFrL7sAZcpmZ4rn7t5PKPZtvSjw+AyqZQCs1WxztHnrKPPnKUcNE0rc+qvyufF4i7uDvDVG2h
 RYZHWJBmv9BptjK2xaYQOvDXBMQtm6UIKcrDjR7h3JLduSPq9ekvj4Pq4d6ttuuuQkz4KYMzac7
 7Csv9eWkL2I51FYSyFQcuyF7NtSr09AF7Mh+Y9UVMfuxkmOvQ2Y7x1fiGPr66eCpNKKx3bgy6YW
 xlW5fkLFpLlQbOI4SWO0NAE8RV50kyUpRBlUrIztQblQqHmsiNrrAp3M3sSgVOw/W2Rfk1oW
X-Proofpoint-ORIG-GUID: VyJxZZiDf3qBibfQfDnSVe-uK0Lqi5s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140025

Deprecate usage of extcon functionality from the glue driver. Now
that the glue driver is a flattened implementation, all existing
DTs would eventually move to new bindings. While doing so let them
make use of role-switch/ typec frameworks to provide role data
rather than using extcon.

On upstream, summary of targets/platforms using extcon is as follows:

1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
effect on them.

2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
driver which relies on id/vbus gpios to inform role changes. This can be
transitioned to role switch based driver (usb-conn-gpio) while flattening
those platforms to move away from extcon and rely on role
switching.

3. The one target that uses dwc3 controller and extcon and is not based
on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
This platform uses TI chip to provide extcon. If usb on this platform is
being flattneed, then effort should be put in to define a usb-c-connector
device in DT and make use of role switch functionality in TUSB320L driver.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v3:
This change was 4rth patch in [1]. It was suggested to make this as the
first patch of the series. Since this is independent of role switch
patches, sending this out separately. Removed RB Tag of Dmitry since the
patch has been changed.

[1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

 drivers/usb/dwc3/dwc3-qcom.c | 90 +-----------------------------------
 1 file changed, 1 insertion(+), 89 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ca7e1c02773a..a7eaefaeec4d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -11,7 +11,6 @@
 #include <linux/of_clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/extcon.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -79,11 +78,6 @@ struct dwc3_qcom {
 	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
 	u8			num_ports;
 
-	struct extcon_dev	*edev;
-	struct extcon_dev	*host_edev;
-	struct notifier_block	vbus_nb;
-	struct notifier_block	host_nb;
-
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
@@ -119,8 +113,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /*
  * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
- * validate that the in-core extcon support is functional, and drop extcon
- * handling from the glue
+ * validate that the in-core extcon support is functional
  */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
@@ -137,80 +130,6 @@ static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 	}
 }
 
-static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
-
-	/* enable vbus override for device mode */
-	dwc3_qcom_vbus_override_enable(qcom, event);
-	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_host_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
-
-	/* disable vbus override in host mode */
-	dwc3_qcom_vbus_override_enable(qcom, !event);
-	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
-{
-	struct device		*dev = qcom->dev;
-	struct extcon_dev	*host_edev;
-	int			ret;
-
-	if (!of_property_present(dev->of_node, "extcon"))
-		return 0;
-
-	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
-	if (IS_ERR(qcom->edev))
-		return dev_err_probe(dev, PTR_ERR(qcom->edev),
-				     "Failed to get extcon\n");
-
-	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
-
-	qcom->host_edev = extcon_get_edev_by_phandle(dev, 1);
-	if (IS_ERR(qcom->host_edev))
-		qcom->host_edev = NULL;
-
-	ret = devm_extcon_register_notifier(dev, qcom->edev, EXTCON_USB,
-					    &qcom->vbus_nb);
-	if (ret < 0) {
-		dev_err(dev, "VBUS notifier register failed\n");
-		return ret;
-	}
-
-	if (qcom->host_edev)
-		host_edev = qcom->host_edev;
-	else
-		host_edev = qcom->edev;
-
-	qcom->host_nb.notifier_call = dwc3_qcom_host_notifier;
-	ret = devm_extcon_register_notifier(dev, host_edev, EXTCON_USB_HOST,
-					    &qcom->host_nb);
-	if (ret < 0) {
-		dev_err(dev, "Host notifier register failed\n");
-		return ret;
-	}
-
-	/* Update initial VBUS override based on extcon state */
-	if (extcon_get_state(qcom->edev, EXTCON_USB) ||
-	    !extcon_get_state(host_edev, EXTCON_USB_HOST))
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, true, qcom->edev);
-	else
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, false, qcom->edev);
-
-	return 0;
-}
-
 static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
 {
 	int ret;
@@ -737,11 +656,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (qcom->mode != USB_DR_MODE_HOST)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
-	if (ret)
-		goto interconnect_exit;
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -749,8 +663,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
-interconnect_exit:
-	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
-- 
2.34.1


