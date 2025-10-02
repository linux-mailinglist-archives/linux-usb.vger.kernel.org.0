Return-Path: <linux-usb+bounces-28872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8296BB4B00
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 19:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5773ADAE0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 17:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690CB26FA57;
	Thu,  2 Oct 2025 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtNHngYH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9826E6E3
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425952; cv=none; b=Uqy3W4D/tD023pHMFGSJRcJfL64oCUiGza2Pjju1awxT3hZF/vMLj4c2Z9aL2WzVNS5eeg7ks9HXOdcHcQBcoSIK466xwfIc+SsuMUdczsYVjUHaQ9qSuQrX6YhxJDu4bDYL+yj8rpfrPiboslUAZyDO6+aQ0zjUxrBYVErA4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425952; c=relaxed/simple;
	bh=Vnx7FEyrTZzrEyMks2ISdGuYBznHpzV4bClxPPmMiao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nozfsuVb0tYHIuFOkG+7bdapMD1ORany6vk2MxWvskbQtiE+cFWVs4kRcl2ttW2WFLHXwZdfU+p3dfQVGp+fOKNThly5Z5zhmlysRRV10gIPsepp4T6/3dAq95hz5bQTTWJrpJ+9BLrPaHE+4MoARp+gXQFHksvroclRBTd1I6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtNHngYH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59291euh032297
	for <linux-usb@vger.kernel.org>; Thu, 2 Oct 2025 17:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1rqna/rBH+iajzg+XAXDikkpeuWocVd+bF8
	bPM3no/o=; b=TtNHngYH93K+UoMcr5MaISKFeS0Ob4suJHOfijazkWAsn3rOXxS
	ZJhsW7eUyvbkBsG7Mpbxmy4945kyMB/3rE7dqCY+3pcYc0yrXNBJlxd89TvCflJ8
	bHf8QETvv+yM8MsxMzjg4AXQWI7cDNUrgCG6EAO2NOSv9XujYDgrO6gMWvJ2F4NT
	4rlOF6/cEd0UDXHYg2fsuTnR9d1iYZ65iVtD602UnKLeIUkBTJbZOdexGuXHFj2O
	LpdR5hAhf5G95Msh+zbNuUzCSe0Zznmqvkjp+k8DUN5PuBTRfwLbjzSo8JDIvDU2
	/UWcvpuW6/sETxgIOnG0XgUCJ3wOUnT7t+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x60n94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 17:25:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117c85670so1616911b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 10:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425949; x=1760030749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rqna/rBH+iajzg+XAXDikkpeuWocVd+bF8bPM3no/o=;
        b=Xww39/sHY4Tlj9dQVqqc4ya9n5pgEoCWjNIX8qU8LHbd3SwWJqHxn3z5cEU3lvn5tX
         somY3Z62yHR46MrLzGDAnrTYMcQaY4ZcuGzDqcdDEk/LoHXzqi/U+yzWb2f8+2Upi0is
         fbMe69JS092+RyymkxgWiFtR7t1zDykvBVI3SGax9PaMvon/55XElOw5ubZz4+5kG78x
         +Cx1Obp3Zyhd8qRSKnvnNQjmPpuoq3r0vdkByfcy72uXMVoxD2tpz9AeDUo51NeZIw8w
         qjIqfSIGkloNXMrs80+gyqrMk84yTvpv9ws+mWKsWkcIaIsXQ2MZ1b8KJPFKxbjKkRjp
         BuYA==
X-Gm-Message-State: AOJu0YwxnhvJgH1OkDsjnuKLlf6yqrSHiSh6poM22NMt4Y0vAPGFIg2T
	3nZGSdCfCgMn2P4Nw5H8xr0IC8yUTYl/+Aew2I+ZHpxrpfqaYJBDNEB0JVhbGbd2nQMhj0kFwst
	vCkwknbs1WmJTOVLrNIDjTtt3II9EKkS6fEYbofjvSJYa41Xq5p3XEDReGp3O/Y4=
X-Gm-Gg: ASbGnctpnbkteJn+/NUjL+CNgZIbhYE2LDmAbGsB/X6q5FwvWZVW5SwQ4FMVHq3MaOB
	FQdE0fjxJbtDHoMW3iQSAnTSa2UonAYzs2OkDJi5CA5F4gu8EkvI1zqxEQp35eiVJQz29wld1Ix
	tNPjWKVsMHbco86mBfv22BgD3IgVfR1PsFkj+qI/e7+3ih6KXotJT6RDtrbg43KLuFx0Mwh1+G0
	ocmFftOsBHlfQEBSv+FqVRqaPVIHkqk+SCNMz7zYvTuf+AHU+5qkW3BSCAXzJsC0ZEQScKvWaQ4
	Z6WCg5HIiFILKvcwKZr8RJmXWfVOISMQMYqY5DrWSrJAl40iJNTHsksoU/LMGJolTJVz/alme8q
	M1LK/Dr4=
X-Received: by 2002:a05:6a20:6a21:b0:2c2:f61b:5ffd with SMTP id adf61e73a8af0-32b61b4edcbmr310296637.10.1759425948706;
        Thu, 02 Oct 2025 10:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+enE8wuWieJoBAKDjUG3eBXUdkVEiwqNMSZ/0wvGfEYKsHkPg68VO8xF8jBbQP1OGtks3RA==
X-Received: by 2002:a05:6a20:6a21:b0:2c2:f61b:5ffd with SMTP id adf61e73a8af0-32b61b4edcbmr310239637.10.1759425947791;
        Thu, 02 Oct 2025 10:25:47 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f5b6e9sm2387423a12.40.2025.10.02.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:25:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Implement vbus support for HD3SS3220 port controller
Date: Thu,  2 Oct 2025 22:55:37 +0530
Message-Id: <20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JrQISZ6u-j9gDR_UBNVo2umXBUZOAsAT
X-Proofpoint-ORIG-GUID: JrQISZ6u-j9gDR_UBNVo2umXBUZOAsAT
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68deb59e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=0ZYI1qUNTW_HKTauMVIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXxCpej0zGSPs3
 19QRdpxMNqAmGodN8V/tm9vRknXFw6frs7b3IR2NwnkFNm4mR7HLgIKqen4N0/f0KRDFVy/e0oC
 D4LFof1WZhnQ3SHMmnp241hYrRqrM8pCIxWVWelpIMdN/18JOwxb3xKt5+EbafsAbqdVjbFDu7c
 1AsQ149A2Z4+9YKp1iI51ybY8JyqPrJ86/0Tm5F9lca4Xrsu5PTAJKmjvqDea4fhvZ1xuNc7ntI
 l3/Q9Uie3wk6gRCmoBu84oUOBHttj/rZz1hPv/XHm3caEJ41CIOGtljID/wt5Lp3nNtMS0MmbYH
 /AtMMwBgJz0cm6gSTbAidt1bnOZAnfTvgzwt/q1q3uc195Uit7Nyh8dnp+bmVcAYevmZZ+TfdQ9
 9kJElE/aDYQvQeheMuLrrBk2S4sHbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

As per the data sheet of HD3SS3220:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

This series implements support to read ID pin state and accordingly enable
VBUS.

Krishna Kurapati (3):
  dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
  usb: typec: hd3ss3220: Enable VBUS based on ID pin state
  arm64: dts: qcom: lemans-evk: Add OTG support for primary USB
    controller

Krishna Kurapati (2):
  dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
  usb: typec: hd3ss3220: Enable VBUS based on ID pin state

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 13 +++++
 drivers/usb/typec/hd3ss3220.c                 | 58 +++++++++++++++++++
 2 files changed, 71 insertions(+)

-- 
2.34.1


