Return-Path: <linux-usb+bounces-22938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB4A8523A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 05:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B6644A6D77
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 03:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33B927E1AF;
	Fri, 11 Apr 2025 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgqcpvLZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922F27CCE1
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343432; cv=none; b=ZJ3T6iHq+9jJcI5E3fNW0JKr9P8OisLkmtVx9XE5f5d0pe/w3CQWpXHP/Yz1Vh6TaNEemI4V9OGM3+X7AmdBvak2xidEGzHFlAjfU4fPIjhFNsLLVk5EuGR9QC5RcYTXXm9E4l3RFQfXew/+DIYm2xMuvAVT/MY5wk21WoWpjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343432; c=relaxed/simple;
	bh=RSuxk/dHzfMuHqU3U1cL04m7MqJ/Ml8N36LwtwzR9Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpcWcpTKIDdnZDdsBXnjqaDB2bQSes9G0wg7We22tK5aOFLP1Q72vTpM7rj5+JdoHQuF+6Rakjpu73Ys24rdlPOlHLYvsrlIU7UxX7LK+OzIBL2rVzGYRbt6RKOrK+X72NL6RKudzTLi/RFUqXpYrONtsjFiOktWOIGDyyiEYsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgqcpvLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFwKme000667
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JckVC7d5iC7VbTaEcWk7JXOw9O2E+TUPpabbS6XiWDk=; b=CgqcpvLZVJbpDU1+
	+Bhgqu/15PuwojDTusH3MJle/XMyPvIBMnIHh8tZRT/Eb1lgslizxYxsZAgiXjVv
	DqApkrlysv24jpzcAdwM+450aDqTPfBtTpkTZOedjE3fMLkThq8cBnP5soMMvoGP
	dKV9qeNOoiQrOeWo6p2Bdx8ONiv15XoA7Gs8bLF3RfschVM46XV9pVBFzYVxqCgE
	7tp11kg8nc8whCaMgu1J0EWcCiD4taDS5u8gBo6BLpquX2rJz5OR6IMqvTAxyyxO
	Got5gCvk4rHRVxzRiURggZGsHQZpwPD3S/qtSnr47ksDNWBUh500NDWGuvsqgXFz
	dCv/Qw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd3121d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:29 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2c83a8ab786so1326468fac.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 20:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343428; x=1744948228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JckVC7d5iC7VbTaEcWk7JXOw9O2E+TUPpabbS6XiWDk=;
        b=LNjhsLc5Ab8XGOyKtEMaRbnOV6jUbW5U6oTFBdIrqX+vO184BKejatBA3OlwrAJ+Oc
         Ni4rk8WQrK2TGVLpMraw7Wi2OfVGZCxulL7JmOvu8cBInw+8J/YCQlp1x6/xMGTGJMZc
         1716ijcDj8JRJeDV7yRdtyt9L9DKyZs2DWXlNPDK9YFO9VogV/oS6g19Kc44ldNWmOjb
         LjLme+VisXFaTMauuP9YQFwDOOGUMd5T5hXbhVIKABCTzfwbs8Uq4e1yqYrTQ1ew9OcB
         fgONaxBWUsGanyDjXp+X9jau7DWSegdVQKA2N4WWjZiQLA/xYoCR2Y4r8qpPWgN5OdZN
         Pj5w==
X-Forwarded-Encrypted: i=1; AJvYcCVHM+92h1wQlpi395kuUIb01xCTjBkIoZyZcqV2Sj1s4jK82z+1gAukN1Ks149ATgVcDLxnkEyHNso=@vger.kernel.org
X-Gm-Message-State: AOJu0YworRZWVqKUMr7vcRVwaTSnZG3vdULfEKJZF7rx6RPXMWnIe1o1
	e257PfTkBMCXAZaDmkcuQMmH1uSAyiOvr/n7A7qwIgGGRKn42w6J3JIsFtaorIhrsmam4J9q2vv
	6avEasyCQG7zAq+vaN26FAtYrTIbM/bflu+ofxSnAtr+cFzMLVfsTr8hRKy0=
X-Gm-Gg: ASbGnctqF9tyASQjSpXsC9d5ee/Z5fjAMrx4RwlBHbezemzuhQ4BZc2J+4fqZ95rceE
	1a6iyja+xbqkWG3FhL5ehkkXahSxzMyIR5fbrJ+TmQOVRw7uw6fSARodBgEkVg5HgTbOAlA5mQg
	i3aZYvyuXepx8AiAOIvqsMzPzXKgPlTxN06QL9CSdSzpJ/MtzKQau/Qaz3+8q+wtvBtjN6JTGBz
	/kdqpzmwh0zZym5nbvnXn1jhfIo4HoIQ0xF/e6zMCF8QlaWSuxxy/VwkPUpmIk7mCOK7FPYS2NX
	GzRwX5eN+6z9J8nk2j91wmC5TcHojrKQb76cpdBTyCe7zqbnLSBEK+n30LdU0uNl/OHdcX4QFze
	bhbFCgYZAoSw=
X-Received: by 2002:a05:6871:50c7:b0:29e:5297:a2a7 with SMTP id 586e51a60fabf-2d0d5ef2c0cmr675831fac.30.1744343428217;
        Thu, 10 Apr 2025 20:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTEJqA//s2MSMQfQAqTLDtmK7DVSU2dp4MjfLg6qT58X3b36bH8Wo7QjGpbBgWsGTxZGlmLQ==
X-Received: by 2002:a05:6871:50c7:b0:29e:5297:a2a7 with SMTP id 586e51a60fabf-2d0d5ef2c0cmr675811fac.30.1744343427808;
        Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm958677fac.19.2025.04.10.20.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:50:16 -0500
Subject: [PATCH v6 5/6] usb: dwc3: qcom: Don't rely on drvdata during probe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dwc3-refactor-v6-5-dc0d1b336135@oss.qualcomm.com>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSuxk/dHzfMuHqU3U1cL04m7MqJ/Ml8N36LwtwzR9Og=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn+JF9qiL5G7nhdRn0u6cP1Jl7oF5pjHpLTc1Ut
 b2tAJuY2GuJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/iRfRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV3FQ/+PsV3vdTXi8T+b41VDzzOy0p8rFRKUvPN8x480LO
 tjt/YfilpIndvUZagukl92ZMdTlH9Kil18eJGuyK9uwsjG9kZ7SOsvd9eMg7qSlKekj3kDkMA9J
 236qsQIWH9YqOT0DXaswHJiVqNl96TyfZw6l1EtZYQl8CSCOyqiZtXLEI49rYwocaOwjCEjmGgt
 LX3HLOpuWhlwu1l2bPhg1G0JRTxlJzGc+gelHYuT1DdGMJDOROz2i+yDYjU1X7q70Vi7xgxSIrw
 gpUd77j28R4eB2agSO7id2ewsMhwB+6NhN9STZ9U+5rfXrFG+MkGbaqsztdqH850lXRrmh2sjj2
 cce3/RWdT+x3/dizxxk8QQr824dF9sYa2jiwjtf9Ct6k6QKgbG1ew6a2tf4xWXIdnJdaASK8h+x
 3TIoFgMuJVlrp+6LrjSbn+x0WruBO5ZJRbpVEiwD9IygAj14UHyIg9mwojCeWO7J2XlYrPt4+/W
 a0zDeHNz1FKRqQXUHzvzUef8MjxvELWYxAs3MdTOLah+Camprkc/uCPVEMAEvipdTZXMcl4qbce
 s55datCM/lYZDPUII3EDpA1CYIierVskd+8vhr7tTyLptjEbJUCqGOicqWRLM7bJzbT/L/u73Bu
 zWpE9yod4VOu7okl9xigZmH4smAQQBjp72u+PZQY4vxY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: kLsH5-MhtTkD-aU_H0t1KRWSfvblXvSV
X-Proofpoint-GUID: kLsH5-MhtTkD-aU_H0t1KRWSfvblXvSV
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f89185 cx=c_pps a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=0UB9HjPGtwcCTtCM8zIA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110026

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 79f3600f25c41a5ed770f164a03c7dc424b01440..9d04c2457433bd6bcd96c445f59d7f2a3c6fdf24 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -547,9 +547,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 	return ret;
 }
 
-static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
+				    struct platform_device *pdev,
+				    int port_index, bool is_multiport)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const char *irq_name;
 	int irq;
 	int ret;
@@ -634,9 +635,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
-static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	bool is_multiport;
 	int ret;
 	int i;
@@ -645,7 +645,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	is_multiport = (qcom->num_ports > 1);
 
 	for (i = 0; i < qcom->num_ports; i++) {
-		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
 		if (ret)
 			return ret;
 	}
@@ -700,9 +700,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	int			ret;
@@ -778,7 +777,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_setup_irq(pdev);
+	ret = dwc3_qcom_setup_irq(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
@@ -793,7 +792,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(pdev);
+	ret = dwc3_qcom_of_register_core(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto clk_disable;

-- 
2.49.0


