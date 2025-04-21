Return-Path: <linux-usb+bounces-23275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA798A958D0
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 00:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20255170055
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 22:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24AB22577D;
	Mon, 21 Apr 2025 22:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nq1x+XVi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467352236E4
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272849; cv=none; b=ZfTC6N7hISk5tEKolwFXTTn4YO9iesB3Lbt61dlNkWB/oD9j/U566BTz9G+S4nbjSedFk6LyiM9zNO1nj11MFJ5lNNmKQ+E9Df90ZFgqiI+Q123+pQpkrNvev2NWxOy9/J8PTZ9P3Vow5V1Ky+P/4KW0xOSgs2frJ2Ein6Dr5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272849; c=relaxed/simple;
	bh=5FExpQUZ/FHZEchRY6UIA2qfjFJXzxNKpcsVYOWNwso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUkjBLOqst2le8KAzoMhXMmBuaRh9DP0D/PhdmkzFhMSi9aePtsEFHhCaguFcu4vwO5YI11Fx6z/ZB7GtatyVMAZqLs43Y6J90z2w1MC012JlaJjQPu5Sihi4ZliudCtscmy4ayRafbBm6fyextys4MD11p00aD/BeUF/Tc2s7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nq1x+XVi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK4IOC006385
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=nq1x+XVipYtvqB3h
	gZ27ZxD3jPt40Swy7B2SBpIwfKJTLNJh4YSg8dUCt63Hv+BkWpq+9FGVqxB+uvvI
	HC4H6B/vNKDOazTkgko0uXWTKiXfALHq19cEhhhVss8FlJKcxCxoH1LB77zf/l48
	7YUD34nf9uQyupf5k5HjfP0+B4UbtFONYLvasdl8Bd2rxzbbNL936+nTUZp2leeK
	jX2MwH0PEj+Y/AtUy0UQMMMjTh5s75UB6ZqSWccgsBHQprnTZD2daAIteVqQ1d6L
	5UjUlFfezrpUnHvlRA8eozGrYUw/ZvORaDSsMmjt3NVhWSSvTU5a7ygeC2Bw9GhS
	HIe98Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9der7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73917303082so3041707b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 15:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272828; x=1745877628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=xUM7sj++/nw74+1io12EVadtKkt80FuwwoYJwiwcRhsZnkn6LxgYWc7c10+zZhbMlJ
         Ld8DxHW/mZB7gjzlxyrjTAAWXWPNb39LVPUA200SEeu2GMzx5Ncs2Euw2zaNsAjerVw0
         kCh3Eiwvb+42Ax4Yous9fnQmU48SvqThUc1XffrliQ4OBAyUMKDxNiInqfHdHfvoEuFY
         z5tmP7nbpO1vhcvvDX5zVjRGtv2jlxLzw2uHVWcvr3G/bAsiGUacmVk63KXkbkb/yx0J
         ak/9vlwOSTIJDqgeoppzWxC6/Icy0TduKpo6CrKuNbE8KAsIgqxtgCPklDY/lQKn8qpR
         bM4g==
X-Forwarded-Encrypted: i=1; AJvYcCUWSd6UqqvBQf3s1+vMIzt6e1GL7JSKT11xQz63Hiug/PQc5FLyfMbPiJ9oLfArUFpsZyZsw5nsgpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAFvv5jXGtIsSdod8Kjy3FiRJsOvV2AnEDAQ7S3jhuIuqAO3L
	9uwSt23U0str3yjNjJ6IMopNArznfYyl36DVYLilNy1ywdaFm+UoayC94PULY0Sl9O/qFI6QK33
	FgyWvj8r/0T4cQpAeYoHsO/koeUQ8Pbbf44JVMA6pPXILh2ws2V2ETGn2edw=
X-Gm-Gg: ASbGncvw74DofpW8rmXuNDCokoanJgqivc6eo83nWERsczmSNLWBBe9PaYjaSqD2TUq
	C5zy5UobUx6c1FIkj87JWresh+0FXJsgiQNKOfjeueylvmjDtpQ/NhUMAM8Rs18T7uHQfT5ut9b
	xltv6BZE8pm9602AjIzEqngNu0q+/H6v0u6zEXrmtHANpgbsPIGnUE54QNrZlqxSRGDRy+On+hb
	RT+uBJFnN064fwkUgQDjvgr6euEYdKojdCrjdPNGCRHINRqrG7gkqfHdEmzgBboAPhfktQLbEHf
	pXVfT2Vw4G10whvMwzzZCj5tI5VI6FAeEl3vqUHsSDjO+3n78htBjRg/2fdvYW5D5VQ=
X-Received: by 2002:a05:6a00:130e:b0:736:b402:533a with SMTP id d2e1a72fcca58-73dc14453bcmr16346753b3a.1.1745272828415;
        Mon, 21 Apr 2025 15:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG+M2qcme5yQCukoxMyaSAlmWYa2RdZuaZWi1bkdOq29qfFC4FEiaqTX/rJnAHa5HEtbsGtw==
X-Received: by 2002:a05:6a00:130e:b0:736:b402:533a with SMTP id d2e1a72fcca58-73dc14453bcmr16346700b3a.1.1745272827980;
        Mon, 21 Apr 2025 15:00:27 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:27 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:08 -0700
Subject: [PATCH v5 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-1-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=iztD2zVXDUPlkb2VzvABWkpEGUouCg6l0hBj4efv6tvZx/fXQq/d3jg4tWzRkC+RxycYWKOM6
 WUgksta4vSgD83ZiGs3JU+XpGlgYcvc1K97If3KS7uVnVzanamXocRx
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=6806c00d cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l4e42PwClupcXQ49RU-A44AJJldAXoHq
X-Proofpoint-GUID: l4e42PwClupcXQ49RU-A44AJJldAXoHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=823 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1


