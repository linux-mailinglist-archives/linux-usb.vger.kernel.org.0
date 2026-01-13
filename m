Return-Path: <linux-usb+bounces-32253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66907D18C01
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 612B230477CD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 12:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EEC38FF03;
	Tue, 13 Jan 2026 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fheMmXcu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0SIhxeD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9838F25A
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307611; cv=none; b=Z7JH3MXqu6raf0Kl5Yv4XN+gss4Fn3CgAijOi8BQQXeNQmSraaeWnSecf99YMovCtkeT/JSttx6JpVTynmTEriKtL8TnbgG10jfiEeJ4UR4jTebU4aV/FK+inEv50QGbUtpnqh7tjIhYwZbeeKt0W2oUJAhjnnatOrb6kwT2Otg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307611; c=relaxed/simple;
	bh=p+Z5YhJTvjwskfN+mRUfX8mkgArxrCgucyMvCfVflZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQBKG450WrZAPHK+blqozXx/4tIFQ9KzjAvf721txQhsiWnv0hqfg1p8ZAaawPq/esStYhQzS1pAapq7WgBs5f1qI3xtXgMY5LaRFZhaXbJXN0ucIOKA35myPVAFPKJlfpztYKZ3T6OVzptH9efwbvpize5/1he93d5eBDqp2c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fheMmXcu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0SIhxeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7ZFlf3301643
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUuNeyrL4XzjK3BWb7sWjvSrSk5sQ1bWzB69LFur0vs=; b=fheMmXcu7lAW70wr
	Outoo0SNSuooV0qgMpdsuTxZOVxVlyOnBLSeSgwFOmSKsSlztsCf3cgx7VU+N0Fv
	FrwI+OptKs+g/Zgi6TdaGE6hKgIT+T6pET7Q5lQN0OQ76/9WgUKTabBh4tWzOqtb
	9BYSNgFZm8vvfgQ5592ZThAWTY0PoOcjrO+UprPkz6nr6YeMPiaqVKMfl+38qkYD
	rARsMgnXkxfI9JSl4xIY5wQXMjD2IiZPy4mCPejVSr9RXmb/SP3BHNoPtrRaDK0n
	6TrFbAfWL3J5H2myShsA4ZIEJdtKxrgkHqkssxLqstfuLns5WUTZMAUm4Wt5UqYe
	sH40+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmarvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 12:33:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea3d12fcso520486785a.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768307607; x=1768912407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUuNeyrL4XzjK3BWb7sWjvSrSk5sQ1bWzB69LFur0vs=;
        b=d0SIhxeDNjwetxVXaVBqKsiI8uBhgsU9rgERPAT8rqUaB3S9TxjprXtxjL8XCPcrra
         LpHbhHDd+PSjo4LX3e8q97bxLhdaCQwlNRQPrMjtkfQYePbAA/ugucXm6ignKvcDkL9T
         IJfzLmljJiHILt+GO9d8XbagQiojnuTYy4WGf94f+yLdJBqU5BGJXGFoQB4JAfOBlaXR
         /w3xtauel2qNR8jWmxvpa6GYpWwAMR5eZuss3ik+dYY26xBDkIVgESqYqkvUWay4lPtH
         4pfCeLmR1/AX938COclBS8ooqGjY1DVgzchl+pHGbazT2ShKTyxVrHFrQ6WYkyjRZiPh
         05GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EUuNeyrL4XzjK3BWb7sWjvSrSk5sQ1bWzB69LFur0vs=;
        b=sIWG5rqICWhAn3OqtOkS/11Y2VdUqVotuRDGmSG2e04utF87yCk/4NGwM0E9XlJAzO
         bmnPGl1QGX6Vxdjp1h12T0Hi/5B2rlYDGKgkcqhvAQL1M7Gkp/YJF8ST4ZwmItdPiFDl
         oMBPdbtOvGINEFeqW4XmkWS8vmJtJzYcI1tN4AqsvL6EYOrA/Yi2wtUzD+cMBnKaJthp
         mivNznxWoob2S5ckPoRcpbcHhwJkZSL+N9bJblAX5vk5vRz4xx6jI7LODuUpoJLF4nS4
         RuUnXnq7UT8JGgrCqcfDDWamPOZnBL5ntIT5SY5I0zgCEApZMyf4altMakTMw2iLDGyL
         CpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpSRoKUApg1AGZdcSJgLwvUED8ka9Gss5DuW9sTRYZkwFVvZPt4Svv78v3nUGGPiBxwM9yfMByxzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JrGr0AQLYEKhv+SNLu5LkgPap7NGWOQ3csn4U5UOoAlvn3VJ
	cQMQppZIsG1lrLViwPrKvz6SK3w4ce698W3UTQYyvUvlRvBpm55hDmVhDwduESwv/kMyOimZSgz
	Bwpf9I2WBHh1tIN4B2g1fwapE1vEHj3Ak8FfzebyigxNlvROOqkY3CJhHLGERMK8=
X-Gm-Gg: AY/fxX7uA7PAQf1saqnrsBmps/cztzWKVu/euWLIR1fTtTN6AbYun/3OU3qX57sNdGs
	1n5s7sRETVnjTdzcmIDxPvhdsLdn8Fuddlnppb3QnyHZCfqX63+ebsg+5Vp0qJ1cukt9BFLuoAa
	XUSh36RmJ93stevFhQ77X38rnWWqpf9iPaFZgySQVCMgs+oTWSZLkLYgeS7otscV02Rk4nrqn3T
	r8DxXC5j5dqms3Scdwqy80LH0OTFAbc8nOaLuEksuZpI95D0VR6/GQtfRz/5g9cax2VV+eeIcLT
	6HzCpaVu2bUfwgkp8ZovijlzaabfrRuh76vk4JjfjxUZmQJ/kbu3cy3htS4/dobVtdowacBCGEu
	w+5fyoWvQfHVVifZBig==
X-Received: by 2002:a05:620a:127b:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8c52dbc6554mr23788085a.50.1768307606984;
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtIIeyq5hPCTTeP8m7mlB+ydYrTjSYdxzAl6l+p940XQA8Nhmc+8giqdXwR8p18pJq+gCXaA==
X-Received: by 2002:a05:620a:127b:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8c52dbc6554mr23784685a.50.1768307606445;
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715952fc3sm635303166b.50.2026.01.13.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:25 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:33:04 +0200
Subject: [PATCH RFT 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p+Z5YhJTvjwskfN+mRUfX8mkgArxrCgucyMvCfVflZ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZjuPAXSVZt2fmUiaulM9SCMuY9LYjQINATPZd
 z47knfdzoSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWY7jwAKCRAbX0TJAJUV
 VpapD/9P0ZzyL7cbfmcLUtWC3yrF7pOr8rJ93jwJSjpkUB9LQvXIvnhUc4dyMVoorv4pTarcWYJ
 cFVqQDY1AtpeNsBCzghvmCvNthXHEKdiH57EPGnmSALgg2tSWmcEYtyAvHvalxpKbMgXIuxoJu1
 uRFjojpQtRFgivYYyDxZTcpVQW2u71TqPRtNSUNDPhwVUcdz+DfkS7sH7/u7dW2V3cxHqzdko+c
 AOJkfj5xnu4g72Q82SR1jznP4YKyFJS7ND38JHx4EH3RKEVC1KlauVr1qsMCFfXNEodnNq8dChK
 2ZT/K8QuOuiN6UCtpoAbSibY596iq7tJpPVPcDOlpjNUw+IJo2t1ff4rmHIhC520u/5butrxBEX
 iGdzmQKND9wCqeTDOj176E5AdlGVj6gy8PfYra6IpQ2Y0+shZbKDEt9TEO/wWF32t09tYpks6nG
 ZUBtspG/GlJSz41+24iL8a/lQSXJuSnVYBvXEb9U5KMzxtMEoldDHhdrwof4kz6nNY0SrQbaZNF
 DkE1LXky8Eeg0390fQyhwjWXB1mrdGKc/cXNv0L8OQaY8cliDbZnpclS0CgacByZ8mkiUaqFPEN
 D0NpcmeqBZPkbEOqQnSA+Fn6Jljvusy4q2+aI94epl1Hy+RR/Ua+O6TyZvADCjsOqnmbJTpelO3
 dGQyXNny30yfkZg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ut7YnEqVxewRzBoH23ge6HOSI2QoC6D4
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69663b97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vx3hbeaYKRubAM7LXykA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ut7YnEqVxewRzBoH23ge6HOSI2QoC6D4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwNiBTYWx0ZWRfXygfVDlT+p8zm
 nTB40msg4TjOP6SBMRIjSNxPSMeBIiweggDXcWkXO4t/bYd4ZFaW99Gfke2I6eKM1t0TgCP/SIk
 g2yhxcNVbjbdlWDNzNpPz3WWWiKyPguSbma/0LLcgocXdOYa9UjdJoJVtdJD2OKeDrU20fD59Tn
 84sWs+7lBdsnuISPUagab9wHkAtj5hcKYU6d75M7SobbITuCj5j6/ddRrRQJBgM7WPQwo5HHsCB
 o3XmLhcCibxykBTUq1ZwkP2hEdCq6qW1Fh7LMyUxSeACcYh4SJp+2gIrGJg9+NetNf/OVHMGW9Q
 sYnFqrA3EP713QzxqCvYfsrCq4mQgas/XK7u1nDabOUXpmJE0m5K7bTLnJ7BjCpe+155yeOF5du
 WxJMf5Ey3ZaH8AqdWHqa1Lpo74yVU6UVt/SRXyoA4QuJYpJg5Gug8rYqKUfjJivSjOauTAMUiMh
 iOMkrFMmFCkrtovhw5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1011 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130106

Some of the controllers found of these platforms can be tied up to a
single high-speed PHY, basically rendering them as USB 2.0 controllers.
So in this case, the interrupt to the Synopsys DesignWare Core is coming
from the high-speed PHY, so allow the interrupt to reflect that.

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


