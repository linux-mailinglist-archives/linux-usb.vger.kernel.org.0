Return-Path: <linux-usb+bounces-23298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F2A965FE
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 12:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4303A483A
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FC81E51FA;
	Tue, 22 Apr 2025 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xpz0ZxSC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74133062
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317963; cv=none; b=pC7SNHUKDjhTX7f8zpHg8q0mS64Acrcgq43GMTkwEAZFr5LByZgRvDjcgAh3/b/xERjnXTnXQRn+xXrnQjI5i3FsClLmFuE/JV81H0577S1OrHbW7VlKbXqoz1w0Q0XEUNArJSFZkBPr9sLvZ1EmpE3G3469Cmp+QgSljoIQ2rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317963; c=relaxed/simple;
	bh=ct3r27WKExA3RragoMwVxde+BgN7SmAf+JreZCMhMw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bCmhfAb1BhXVzrL6QFBludY1pb/vvTvGZKK4bgW2Cw6cK9Tacez7Tjcj6XVhxVR2s+nw3tBsYVYIFrd4I33hPNkCH+J97QxRZCS94wrFjHlLLlY+DtdUeMJXnr+UVjYyiFluiuRaxcbTrxtLpCZZWI7efRwHu8sS8dTltUHVvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xpz0ZxSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OaiU003135
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CxFps4LffuSVCO4/4iCry8/kFGmgd++JRFd
	KtRTHMQM=; b=Xpz0ZxSCq5f7/Y9MzX0XYqh8UTuK+Eap6jRafGJhd+MX7kzAhlc
	okdZ9q4xfFEkC0S0AZoN7VzmEgfSn0Po0dtY2LdFcvg8e3lEMtwZPV1IhKtLiVyz
	4wHrpjkxq39Vd7TcNCZm0GTs3wBdUayYorphckdfwD/0j2a1BnBY0WFE5hXEqlFB
	C+ofWT+fTbrLty7vpRYuLeKttLlAp9qb+K5XpDoa0TtHhSsflIjkYHFSpF+cVdqC
	gh+c33Zgx4Mmh67NjNWZEtPKCfN2XPYq1RpR8F21Em4XBWd24dAJ5mnnky5mP77w
	KgNlzLRPtb2m/i1bykA5A+k0YdsfSWn4B9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9f6pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7369c5ed395so5252061b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 03:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317958; x=1745922758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxFps4LffuSVCO4/4iCry8/kFGmgd++JRFdKtRTHMQM=;
        b=jeQ68i3nx8o9vyVABFa/tpG/mRpfKK3fhtFJJZox1hvrEJiv5+M80n0hTyLcvsfPF6
         qtCYhm9nM7+KRBD3xAcxoCy/B9H0nFTGHziuQq58M7Qwyn4zcCAwPk29AId4wGs5I1Mf
         8QjW4rhoPsce5exItS3RWbTkJLwJMDUJT804O2l7+qNsttpWyK5+/tonu2woeNN/5H0u
         8cc5tivFgeiEzouADBfhsD5Pwq9D6csvytimkIx/VPoOm122to2VDf3BRtxArT47BvlM
         fodk0F+UGEoR8SNAlZcl59XAwi0dPVSdS58WHp0fNX7XG4skmWlXF+sC4Z0pDb6OPyrV
         vaDQ==
X-Gm-Message-State: AOJu0YzkE+68V/93UDSh7YRLih7c6qL/VnlF/GtTQf+NY5Kl068+GWr3
	pothBKPGOE1c1baZEYAHsJ/KB4JXw/71qh0k8s0scJulNvI1Qw7JZ/vfYG1O8oOloiGP+dydiRD
	JyNHCEoDZhKIDz17E+fTlvSv5+0MH9qQ4OfAgT9Nyb6Xl0XK4rN+3FjNz8icyu3HTf4c=
X-Gm-Gg: ASbGnctq06/6/DoRtFcPPwTdC7eqWieuj5w9chPIGUvMtU1kkJnxWpBKXoTSMrblWj6
	wgr64nW7AeIOw37jbBaNcBV2LBAq+Sp07hrUBh9W33W4gnJjD9hAndgs2NGe0MGCRiPYMnuN3zr
	8PTPIPDY42YsY1ASHJzFHltE2YBAefBJDc/+GiplEBRE6eEhrzCxMU8cWm/kWdu5x7NFKmN3QZv
	x60NVPIS7uC2jrQc3XlYH/O146/xC+iMFjTHH02KHeeK9u56DH2YkqyWq6K/8vW+M3VR0XBFc76
	mDe5QOwbPJQmF+QKZRLhPIT2EVC1d2PL6RSBG+L7
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr19548108b3a.11.1745317958319;
        Tue, 22 Apr 2025 03:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp4x+JclG632dPPp/WKYRumL039CP5QAamazM9ilK0XseYnOwC9rcYsIDles3T+LGZtSUk/Q==
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr19548078b3a.11.1745317957860;
        Tue, 22 Apr 2025 03:32:37 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:37 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Fixes for USB3 CV Chapter 9.15 tests
Date: Tue, 22 Apr 2025 16:02:28 +0530
Message-Id: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=68077047 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=tNeQOB5SuVKVR0OQkLMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9qnPTc6EO-3UVVNG29OedjbVkms2xWyM
X-Proofpoint-GUID: 9qnPTc6EO-3UVVNG29OedjbVkms2xWyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=886 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079

While performing USB3 Command Verifier Chapter 9 tests, failures
were observed during 9.15 ("Function Remote Wakeup Enabled Test").
This is due to the following reasons,

1. Interfaces were incorrectly reporting as remote wakeup capable
   when host requested GET_STATUS.
2. Remote wakeup failures from DWC3 driver due to timeouts.

Address them through this series.

Changes in v2:
- Don't advertise func wakeup capability if USB_CONFIG_ATT_WAKEUP
  is not set in bmAttributes.
- Refactored func wakeup logic in linksts_change_interrupt().

Prashanth K (3):
  usb: gadget: f_ecm: Add get_status callback
  usb: gadget: Use get_status callback to set remote wakeup capability
  usb: dwc3: gadget: Make gadget_wakeup asynchronous

 drivers/usb/dwc3/core.h             |  4 ++
 drivers/usb/dwc3/gadget.c           | 60 +++++++++++------------------
 drivers/usb/gadget/composite.c      | 12 +++---
 drivers/usb/gadget/function/f_ecm.c |  7 ++++
 4 files changed, 39 insertions(+), 44 deletions(-)

-- 
2.25.1


