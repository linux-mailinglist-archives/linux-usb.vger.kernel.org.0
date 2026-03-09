Return-Path: <linux-usb+bounces-34286-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DBuOmuormkFHQIAu9opvQ
	(envelope-from <linux-usb+bounces-34286-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:00:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8BF2377B4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63D47304C109
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174DC393DEE;
	Mon,  9 Mar 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mu1i2n/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gl9EICug"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B3393DEB
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053826; cv=none; b=AL/vSVqgeMAGGiyOka61ATKLlJXKoC1nABRb7Ll8zKYk9jVT0sq6ojs/OYvqZHB1UWLRsqVKuoasbQYJCqXXrfbZ/kYNGQKW38ky4RGaZpwKuB9J+uPfRh5SILM9em17FZqQl6Tdp0W8cBY/6slQe1WVsQr2+70rZQQykRwO8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053826; c=relaxed/simple;
	bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUwc8dcyZRr8ZA84wUKVvsbz3QZA5v80i2bQD4IK33FIsVzmGbuL0XEwxHggQ2Lux25cvASEHgPXZFVFzMhXd+dQXLgVxDMXW8nsEK+/hmn4Nib4O6okUmx78uNy1kNTZr9IKsM/4R4Gh4TSlACrEXAtc8MMJBWiOReC/Qyeeas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mu1i2n/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gl9EICug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295jke12986038
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 10:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=; b=mu1i2n/XLzVAkAvC
	lQZ00jDPlSV2TZxUILbgEbZuP9RgEaP17+7yNbd+jB3Ny93CaOUQc4cntmanfjmc
	NMAFPeI5Cq5sa9C3gLIs6Ztk3RCkjJnvjfVVYn4UFkKA5QKCjbrN4uDbsq5bS08G
	FBbfyHi6Uag34/wrxVS0HycO40NiYYncn9IBOtEobImMg8BGdfk4kRgAFBNtEYCc
	YkndZOgif0JvOJw/TF/82rL20yj3ccSWZYIHn5Sij1QHEXkmTCoFX+nIa/LVKw4u
	DoetLbQapV/dpq9OTIGhLY3OeHLGLUF0dP/KppcUtCwwJKCRjoFKypX+jRm7X2GI
	6kDU+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd2ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 10:57:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so85614385a.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053821; x=1773658621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=gl9EICugrxIBz2MBHdJGcddXR6xaPzr5dYHmsSTrLSRa+FDgx5hAzYQml8Icl8+KJO
         z8OlibI6PuadMrz3gKvId9v9OCGYuGW0xQ88K5oxp7AFfW0tyyeqCBxl9JMZtomYhiSw
         /k4imDPAFVm2DtxWN+veIbgNbeNdFQCViR+Rn0kO2poFvMdyjG456S2MtiiHftU8PJoc
         xMhUQVmTrUSfVKObDWPT6bnKQLJey/pqe7+5gft+c20Nh/W6oG1f1+uWHY4WGsdVfU4x
         te7SQUD/ZQgi3FL+2BjEbMpzIZeCk3JItqDHkB9/X4TPMPPOjp9+FJvZCs+JqfgtRKNs
         qydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053821; x=1773658621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=Bbiz6RH3Q/0o7XPnrJfub/A5mdDwj84GH5GBhhej0+AsYrG1CvD5f/4sSdkyuHUPcd
         1S/swBSvrjiBJMuVI1YJHdPnSWZdy6skfhoMbyWc2soWYFTHpqzMw13VdZpEWFEjc8l/
         wUBUg3DVcyLgLANDLVfB1mOadS5qAtOk3RWcV6fpUWmoOEcqwoN1doRTmsVw+ee0rwq+
         3ZwgPgA8bAe/stsXrgZBGWzbjkoKmCYubyVhjBqhO85VSqWzs0YQzmKwu8VjH7b56zPr
         UNTlAOiZSzXTWCgztPJNEv4ANDYdQaWxDkrLOUX+A8dSVW/PwuAfg8f8wqZ56AbtO8c1
         Xsgw==
X-Forwarded-Encrypted: i=1; AJvYcCUeQJIIh9OaPevI/BTNU4Md9jaeKHX4DWHuvwAEgUTnfQbwUcZgEZLp23KQEu69qYKgnPQQHH/Cd0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsSQFXD87x7dkMiJaI2n3zWPWBKcOoWa4Zngp3wJszzK/ySary
	CVeKJXhzi1cOeNJDleZ48NmI95k+Ejici8XZqzv9yKzR2rAaYu7qcCR0oYsreqtWuaj2s+fZBD2
	EM+s9nU5KpNN0GhISGchW0JkCnHpkzjybGh7hfdFHIPoEpvujCkMxnk9fGmsnXmc=
X-Gm-Gg: ATEYQzwaKAxd8eTtdY17fkih1NOGvrrFiAIIxIYI89XIwj7r8bjh47MTls4ZpoQpHn4
	PBgvnVaJV9o6gT+iyS4LOBQJ2Q1+7mYfjjDrK7tS47v3jkzdWabWWG9dY7XH8jlefSzu1VjsYWZ
	8mtGRz3D6Pp8oWPx6nIVSxMRxFD8IBQm1DyKvRVAOcnFLxZXSemzqrmISh0N5vA62ygNiWWY79L
	dTBa35Sv4xt7P/11wzfGSsY4k38cONoO9P+KIGNAxOP2sUX3UBf9qcSYZ/dB1QYY4sX6EKno1gg
	CrfzSYV/JNR4sdX54TvsN8F2JlDX/unIMK8/FRut1nqbL9eW06b0lQpYAWJ2uKni3BGrq6cJ6OX
	CunvjBHwQ4XJPVkbivLK9YM1eePs/aw==
X-Received: by 2002:a05:620a:190e:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cd8ce4c8cdmr199055085a.22.1773053821394;
        Mon, 09 Mar 2026 03:57:01 -0700 (PDT)
X-Received: by 2002:a05:620a:190e:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cd8ce4c8cdmr199052285a.22.1773053820893;
        Mon, 09 Mar 2026 03:57:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm26169971f8f.13.2026.03.09.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:56:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:56:51 +0200
Subject: [PATCH v4 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dts-qcom-glymur-add-usb-support-v4-1-6bdc41f58d18@oss.qualcomm.com>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprqd1aqqJKIRh+N2sgZHRqrHQi3HjJu70xF6WF
 GHqiz8d1zKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6ndQAKCRAbX0TJAJUV
 ViwOD/0VWHfA76EiN5qNwYEuDyT1o+xqk/dAWpq4qBIfJzmkQZIaLxgZ8bRb7x0pyr+1zG19m4u
 2INmhHoN/Xk4zin8UklIVhZjcOYYuAJkKwDkv8syVV8TAcfD4AcFDT91B/Nht+MScO8Knwgrrvp
 PCcuGAdI9nTpYzzJzLgjMSkI0K/Iw/I9HCeoqwWyoG9Ficw597aV+IOe6xNlCu1p0zVR57CxHfD
 867y4uHG1N/L+AW3wFprCUm8sw+/DexlgHC/vWgcVTmJvikZrkWryXHVp+mnHlkYlw+ikPhVX0q
 tl20eVuPjFHpSR8imd8sT090or0FjOdZ/bqsp/MgyG/WBCxsJ7OjyssduM5SpDjXK4R3lvmpdFv
 FJFqj/DysU9LhBhjCTpAKii072zYxZa2QPRzOO345Ct0SWipmKSEbs3kO2rAPjvEV/aiXUg4GBo
 aiePWPS2PHkM/lVpp2IyEGs3D+VjuQVIsNYH67gWU61EoM01ldyY1mt6jmxNqLiaM8zunOLjf8/
 M3Nr09otXH+DLLxhzu13rpWME7oEcm8W65Gc/lfI2cU6eX68g/Qo3pSKaCwvaYguz9hnL5g6g9d
 sypbuoM/UXZaeJHgtvke1jigXbeE/1t7sflYe1CktzkmJvleeaV4COOHvK8d4pP+H8/usYs9Dpg
 Ig++UWLbMp/3sxQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: BqeVWBzZVi9bN9Zv0VVhPNkQXL6kwg43
X-Proofpoint-GUID: BqeVWBzZVi9bN9Zv0VVhPNkQXL6kwg43
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aea77e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vx3hbeaYKRubAM7LXykA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMCBTYWx0ZWRfX1jSOsJ+pBZoR
 V1IYblfL4dpbIklkno7rdXMBlWF0VeJr5YsZZHPbrUFLcRwDNxOE0uA56pIgTljbD0BJOEQTlJc
 +vU2R2BDqz4iZ/LTC/HXqALxlSKh7J3/P7G/zSiOeCb7PKkWH18OpmU4sv3DnrVOp61f+dMKmb2
 GZd7EssP/FRiRDAPHopDOWpXes0Q0f3PexvrkaJvHyLp02IO9vojwtVe167Qf9o2T6o6HkR3gAu
 /C4DyrTN9i4xW5i4wy0l11U1efp3dQoV+/gEipyQuHf2ytnUXPBQaNXrMl91mBeJXGmEspws87q
 fBEWp378kxK5QTXH1aPoGb3t+Cp17Nz6wOcGiBTM6FPxOpg8nYa84IpDmAjMNqFLSgEUTKtP7L8
 zI+ZOahr21Zj/9VWr5SUveIf6qxzcsnoaXMU7HQDDSF6EBWokq0t+9otRJi76hDz+X9P7SCkzR4
 S83GivKLx5GplBwvo0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090100
X-Rspamd-Queue-Id: 8F8BF2377B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34286-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some of the controllers found of these platforms can be tied up to a
single high-speed PHY, basically rendering them as USB 2.0 controllers.
So in this case, the interrupt to the Synopsys DesignWare Core is coming
from the high-speed PHY, so allow the interrupt to reflect that.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 7d784a648b7d..f879e2e104c4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -500,7 +500,7 @@ allOf:
             - const: pwr_event
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - enum: [hs_phy_irq, ss_phy_irq]
 
   - if:
       properties:

-- 
2.48.1


