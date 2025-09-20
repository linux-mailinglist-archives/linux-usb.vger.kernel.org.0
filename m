Return-Path: <linux-usb+bounces-28350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B70B8BDE6
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 05:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686655A4527
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 03:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8F0221F17;
	Sat, 20 Sep 2025 03:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3YmAHs1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B17155C87
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338477; cv=none; b=nzGygIRt163UEYQ1Mtg/vNrlIghEYubDC1ndDVCK1qN5dg1VE3DWibL9mXYe9rhy8o5wGCjBl1qmOhAdnCcd2XpIwptlHQ8D4ANlY2+gMfThhsaABEWJ6rV0vZOpp4HIV36o/Gh4a5clxaX9vMpGgGgf3bL741t3UUU2CUgtNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338477; c=relaxed/simple;
	bh=PqUjMQNf8YZ2okXi7HcjlR0ay9cNBzPa0lh9m/FAw9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iqYbKXtLpi2xJU2p0c6WcFADFILX5ks9PovgzIWoitZaYP/IoRp+W1ednPSZcPhsEIESAnbsR/kRC7LHjnKfm39872hmqpJQPRv3H2DtiBBLzT32sKh9P3TD5lMZDsT/RnZBHleeAKkOo3TYvpg2IQvQnwhMKWVIIS2PZ7fJJYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3YmAHs1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FVgZ019823
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mN8wYVl6ESU9lxZvT+z+knTGjWTBarbi95s
	9t96uFCY=; b=D3YmAHs1L6zuwjw06urITN4y7EtDHdeq56luBVMG7I27Lr5atif
	GfJ3PrmQJH4Ag9rXbyWWQMvdgTAjLTeNJBnvG0KACRgZDiw9ranfQnZSXXXjhqaJ
	3YBn7FIVA2kkzTJGsHvLwXDLWmeMfYfEREJh2a++BH56KdStgU0rSbjRmK9/rrgc
	t1RYZaqPsjg+W313FWDVs4pzCON6CuxQhTDwximWmb7d6peYOsIqva9+aRGk4swA
	rGPQkCXBvrXgPrfKYucxbTPJYpMqFtkrozrEYxuSlo9L8D9B72W0Y2VEibD8ciEl
	OiQ4Oglhg7jTf6g/xGvjMIu6jmOmO18zjVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy14fg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457f59889so31245215ad.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 20:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338474; x=1758943274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mN8wYVl6ESU9lxZvT+z+knTGjWTBarbi95s9t96uFCY=;
        b=GvivpJzqLvxhSljwmqi5F5irTbac+ERKZha/4CxhqQ7kOT+v9Lex2i2VQX2GbdNs8T
         aVID1/P+gxbqFeQr5qklRtMEmnEoTEOoV/FiMeb1wpyN92YxMcDqLrANpyEitHH6dx88
         pvjBNQ00g1v0r/JhgHwrG5WnIiMpef26uwqoAVTVhyODtB2c8yh7xPIzuEF3xj2gnE0n
         xf8mncbf7Yp9c8ySX7xoocwBXVsNUFqe9BmLCF41JZ3FR5c+99XKvtuUAYHui7fhcyNA
         bzx6SWg3XMslhHkXSDJkzV4936rGUcSodVZYMm17vaiDLqvqQ3Nml8E0Qdq3PPzTj8Ls
         86zw==
X-Forwarded-Encrypted: i=1; AJvYcCVYvi1w5Q0cG9VuagvCHaPGsAxQS/QP24IEIzydVTenNuSZAX6vYizH3UGjPewe+GPq4f6qBeFqzv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDYg5It1UuiGORLRV7iEG8qFG/vGj2i5GScgGZDEJ67+4cmgC
	A/aV0Hoix6gITI5EaUJL6OqE2ICHnDLAZ0vEsKfkMVtfp9c7GAsIYHZ9/uIhsiWU5wLXFFXmbVZ
	sJyon5cMKIDlWg9HhkHvM8/AtX50dJ8S7YsYHjEruFLajmBY1IC1lyU7ti3nJqbo=
X-Gm-Gg: ASbGncuwYVVFKPOxAjxHMs/AwgOSaJKuOnoJmwD9vMe8H3kIdowpLYVMxBP0aGWDWaK
	E9SdtfCYaGZ3Ywl7CH9Khi0eP0U31LFl5/Tdhx2iojPs1SvghLmGCLdiZiPk8W3ouW6WQwc3E5m
	MC33yiQ4q22oWu3jp1UyQ08sDH+/UawTun4IMpD7o+OD+z4tB30q2khIm3Z1UXXmokiWERt5mvB
	x/Luh4roxd7xBFf5u5DfpJnG2OTWQCw48QGDvNrnA+afqIZZr1MjDNDtvA19WnlBxfIK+nuljWo
	aem3qEBhMW4USgbyxaihJjVcxZRaSzYfbWEjrg4jLw2MI2NhSrDZZtnLNFAXtRBi9512yLCxObD
	UqfFbZj7S19fVbAjD
X-Received: by 2002:a17:902:f645:b0:269:a4c5:f442 with SMTP id d9443c01a7336-269ba527e9emr74545455ad.47.1758338473689;
        Fri, 19 Sep 2025 20:21:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeReC8gmZ5NxVSWhUvUGV0oy+A6Sr9TpiqHXGqgd1xFA4p7XvnSQnBO/UwfTe45cPbjeV1ew==
X-Received: by 2002:a17:902:f645:b0:269:a4c5:f442 with SMTP id d9443c01a7336-269ba527e9emr74545085ad.47.1758338473178;
        Fri, 19 Sep 2025 20:21:13 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:12 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 0/9] Introduce Glymur USB support
Date: Fri, 19 Sep 2025 20:20:59 -0700
Message-Id: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HuP_WkYbEEwH12XHVqh5-7dsZKWKze6I
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68ce1daa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=KpXeH89YwCTRUSzem1gA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: HuP_WkYbEEwH12XHVqh5-7dsZKWKze6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3L9iXfVN6snu
 VUvGci9soM+oiBVp7Kzjg73ZvanifM9fx69AwtAY0/DG2JyfZapbqHGisl5tt3+ZtRDBOijoIVa
 H/hs84dyuSN0BTuuRNVMALBKUgNnj1NF0TY6M2UVhmp9BrgmgTlieuQznE6lYQaHxpJxCFg7wW9
 fJsVQqwr2+ZCRYe/wZp3IcOOOOu7U770kjGxroT7HKbJdO8XaMpXcHe1ITj4Ipl1XnDyd7G02AP
 byED+TGILodraDyeu06uSdZc96hKXHymT1tHIHl8+9t/KEKCAUsUm3P90e9l8SgL9zaVE/4zwSV
 XaISkzczA6T3dYbi9wFOI0q6SDKfrrxZK41sHH41kfJUde5fZHzUrn0fh0jurCgxt7hWzcCPIqi
 Qk2Vl5RI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

Elson Roy Serrao (1):
  phy: qualcomm: Update the QMP clamp register for V6

Wesley Cheng (8):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
  dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
  dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
  dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
  phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
  phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
  phy: qualcomm: m31-eusb2: Make clkref an optional resource
  phy: qualcomm: m31-eusb2: Make USB repeater optional

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |  11 +-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |   7 +-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  45 +-
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 347 +++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 +++++
 .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
 .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 14 files changed, 1513 insertions(+), 31 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h


