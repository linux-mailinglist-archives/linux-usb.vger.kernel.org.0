Return-Path: <linux-usb+bounces-21859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F01A67C9E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 20:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7D2420F97
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 19:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3A4213E91;
	Tue, 18 Mar 2025 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2ikomXY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828742135D8
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324720; cv=none; b=TXZlpmSiZHBq4HgnL9yz0HPdBlGyBfPndEHuyxMNgbs79pnv9N+9WOaFOARis7L+p8Vqd13dNAdS7Vr35avAHmtSAV3uPGnaPPtdqo5N3yorAb+k9H9ZgByNgjBV0oxXpNU32BZ4m8i7o4ViIE1Q49AWaMT2CtHyvL+qW70LC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324720; c=relaxed/simple;
	bh=C7/OS6osdKHSFkc8a+YcL3aIa2c/oHCwbopL6FvqfZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxZ+cfktAEaXZ+nEDkanfLxGH+0O459g1fgbWLPLIX/Tl/eE2aIDiVigm6TI2lHYs25ZUWBaZUouyxgqaqXeCts8lP0yXHbiJW3x7jtsHS024nivMmOMBkKXP98KTwg2sr1ocJxRRq/j+B6TWNTQWu+Nc6Rnk/o5+5/2Mi/xufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2ikomXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAqeev010237
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3TjjGGTDArTwlM7Kmpdb37ATpOcExf983jNw07NaDo=; b=g2ikomXYwjrohZXF
	S79ZBCIphQ3xV3KQ6o37vcfe+QCP+7Qj8POYqhEcHn0GvuuMR4bi/rkL7cFAkKEN
	TY8azW4fNQP8KA+Ji1hV1cVQA3mpbCeeop9Iz4f8ftxb7xlVXS6+U/drL2FTUvmp
	MXlgljtUrPzT+LtYVsQSa+iGOOZvGWhhhctdXHQa4szxtM/ugq7wXFNMpeb840aS
	t16QVLqiqS7kqlGrnHPm5+rdEZUyDLCyaBZE6ijxBL07CSVeCkwwKcC+S+v1mhDj
	HGkwYrVGhvx1e1YPXNbir9h1n7VUuHiKDnnR+XVw82R9R5i49bvs9W25/dKcO9oj
	eudHXw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx32yfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:17 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3fe82b87df8so3545526b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 12:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324716; x=1742929516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3TjjGGTDArTwlM7Kmpdb37ATpOcExf983jNw07NaDo=;
        b=kvFcTmQjIMiTNjZxhPd9giHr+v/+z9xpdmLc6OzfZFCqFAafk9Yt5KEdkAvga/EwcF
         29Wdm7xBDTAjNlPw7B3rICbWExbngxwuK6kQcl6xx1jiacuvyYEVBC/pa0amyrAYyWYq
         WV572q0uHAsUMRLr/F/1uRmFH+vh2Fpflps326UQ0r0DTwhFCtD9pwGAu0OIS1iYYN0I
         1rYYus6m5cSox2VYYbg+6JjVLKUyqzm7y5EhivR1D7WqCLp9QjrN681ZSrjMb9y0Lybw
         8YJLO1fU15Fvc9B5VlvjdF/1GIVkDhyn3ZskykcqG6c8yS9d+TdCpRo6/Ql2JNRCapK+
         Q1jA==
X-Forwarded-Encrypted: i=1; AJvYcCXFyDfOGb4RAJe9F+KwrUN2kA2NFiK+he6ZKa8DMNIjhe1bybvSKeD/HTcht48iXB3OYgg5Btl7hzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcKADaXyWzLvCxXGu6AJ0ggrfHT5Grc1AhhG/YWhQ+kH85AUV
	jc09VP+EExOG8BJ0oONCbwezRF5/9uqPsblQ9e7C+CT4+IuAPVOON/wO87xkllZsY7kwWEXIDVf
	xrE4nEsJxrBiOjHHPy75F9IgVZENmWom2zuskOQS/aqWyoA82//66g+Qsrmc=
X-Gm-Gg: ASbGncsLGux0LXWkYKz97Xyk25qZDzj43ITGcIkneJtPIrfDc6XFfQ/Jyz869lB9x3d
	4iU0WauG9pZuaGQGBNz6vB256o7qj5YxDZKGhvE5PHhrIXIGeijjppyKVWDWV3ls5/fPw+d0ftr
	LpARQ6mZtR36sz4KNWB7d12mtisJxTfltW8Th19aZwJZmGTykBRthi2YziWAZe91Qq7J1JirL2i
	x/sdLFxSErjxO2deFKgevtYj+6+QiAeAxac111L3jVXbJwVCMKB3NCO55H5nFgzjX4wAlHlBPSN
	xNmUSlRCKoHXVtw/ZoepGKHYFVYFd+swGzrVsxNg/5epHVBoj+vGHEpgpZtaa6jiARqV1IZNpK0
	48tqbeAa2h4A07Q0=
X-Received: by 2002:a05:6808:181d:b0:3fc:1f7b:c39f with SMTP id 5614622812f47-3fdeed0c005mr8346461b6e.18.1742324716439;
        Tue, 18 Mar 2025 12:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDKcrqzxsWqZyfMlqmaPYgvgfmRiV0mXVpRKK2gF0RfMncjxe5foyCCN6Czrz3Vxnzjgd1SQ==
X-Received: by 2002:a05:6808:181d:b0:3fc:1f7b:c39f with SMTP id 5614622812f47-3fdeed0c005mr8346430b6e.18.1742324716119;
        Tue, 18 Mar 2025 12:05:16 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b065sm2264273b6e.4.2025.03.18.12.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:05:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 14:05:05 -0500
Subject: [PATCH v5 5/7] usb: dwc3: qcom: Don't rely on drvdata during probe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-dwc3-refactor-v5-5-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=C7/OS6osdKHSFkc8a+YcL3aIa2c/oHCwbopL6FvqfZo=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn2cPkHO1u1G8AAmQ8Wl+qZss/NSUc5zFZdp0u7
 JVCAd1NyqWJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9nD5BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcU+sw//cDfDHeHag4E0a8c1iHP8GpXz++vmq8bfXx+x2R0
 85DxVmGxoJTHooDur4a71jf+lglfmwkUOoieDdgVws55peIADou6y1zM0EFwFkEDE6OAZX2aU8i
 pQxRuopEuM/rNTzTTqoT6whXLjFadTmLhVmyTjUITSYwNAh5aXwlX2yWmzvLI2lPbsd9eBMhSYr
 OlBJUMIQ5E5s5qKC6jdE3YXp9T6WYs6EwqUZb9ES2e5zQ5NlTrK+G3zeae+f0CyHaJdre6HAFB0
 PwWOmG+KQXXDH+zLJy5oB77J04FOGJn8rHZxbofOhhY7BTQsODtRjiAjSjhxKtkjrENyhMsaL0N
 vF57VhzJE0Vhrjblbsozou+qC6bRD4TjOB/R2NJnqAbAQ/nxc1e9cb9lpJdEreIBdUjpm7Skio5
 oAlentwmBi8AuhJiANR1GGt5ugWohzNxqPU9avf15DpYec+tycUqdsVYHALmTvBb/5UAgEdyv10
 aAmQY0W9wb3YFwvIsb8aPZFqUgDveN3JZ4/fKFo8TLEuRvLFSxKUbpPjIpAPJE8bLBFBjLOK/F2
 YBf19Nd0IJoITzv7EUQRAYGYLK7cHEXMGlKtPH5iOL9MeKQxB+uoDRj0Lv/gJYt8v88ttS8u2i2
 jV14Z2XcJNAyF/9n+El5SRoUQD/SxXkfnBf4TGg1jtmA=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d9c3ed cx=c_pps a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=GyvgUmJUPzGH1-PnIscA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: HAz-GoKl_l9FQtx3KVpjNONWa0RCdyz4
X-Proofpoint-GUID: HAz-GoKl_l9FQtx3KVpjNONWa0RCdyz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180137

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

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
2.48.1


