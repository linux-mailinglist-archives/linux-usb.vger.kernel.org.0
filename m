Return-Path: <linux-usb+bounces-32322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6BD1DDDD
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 11:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53C1B3023B68
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 10:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6463F392C4B;
	Wed, 14 Jan 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abl3HQ6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="So/rHx8c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D738FEFB
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385279; cv=none; b=I/RpaWIq3ZBhr5ptLAOs9Mo1TOycT+B2HUSoAOwoe4ignLOO57ijqG0qfwskSboHLqelspgo0L9f3LA22yesfP+Bd2bl4ahPVI/a11gyabotmvxbLJajnbRuU5e82ZqZaeKCD7YhY0quBXybaBnOALx3cfYHjGzDg4mimIuxlic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385279; c=relaxed/simple;
	bh=z+k42BJzKoSoEevMLxaTkyJ0BN5Z6mJcIVfeFaJMMG4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EfSwN0QkYuzaDwYAy8eOERM+4QYBOWhnzNkx7i4kPAbMXfWeOu1/S+PHS/Dvsknjb0hyixh/V42CTWmr+ith8Fqg6h3JSfH0UAksuT+Ntly+6OXDri1+91xGdN1ka5tLep+/qBZUtvzy+Ieneqltvv9ehUReKDRmAOLg01Qplg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abl3HQ6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=So/rHx8c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E9jpM73296284
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q5cjILvZRRTImGPxGANuLtLeouCjMoEEYp3
	VTF8lT78=; b=abl3HQ6+agebSW/d+RDbWRo9LUtUiPydibuhCmVZQ6mKUMvLSNu
	9NbyzYHrtyH2sJEHk7ZXfE3udcZcrpDo5c4HosRL/zhd/o7ipMv4U03pDYzleyTf
	AdK4MyNIb5wQ8QwC5E3SONLwkb8F8WgrovyxWm5wr+pFPjZbb4Fu+xPWLnt8yaAh
	CJbesXcgtDFCrUk1+lbwamURcm0XVW/lGaXh2b5DYrySf1GH1DvmB08yCfFU0PDG
	zEfgrDQbqxKD4Q7l35fvUF7vVzMVxY09cybMsxWDpPtXotvGnlph+MYInKfZVESA
	W8cBUFwo9+xv4Efj285jiPz/z4jxYCqY+2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2r3h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:07:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a58c1c74a3so16256555ad.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768385275; x=1768990075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5cjILvZRRTImGPxGANuLtLeouCjMoEEYp3VTF8lT78=;
        b=So/rHx8cJxVwVU1s8zmXpUOICImNp45gWWz7qERZVCmum2qYAYcPOAo+UVd+9Rfvxc
         e1fZe0311htUDKvfR9Qg1f4HJ+PTlgQh4xuxPRqkf2Uqu3Tk3lR0GBI0CygAvEc9yg7r
         yRQ2Q6sN1sbix6v1C4v80ys3oxPItu34q62BJz62bsfR7QK7Azj3dp6Ye/D9X7wPbi6S
         wBw/bwNlEyJeGwDgPGQOdL5m1BIyCJdGqaWSoJ2X5XJeCHSV4bsUqnsfYp19GLuqyQ1l
         oEyZYVvdfncO40kuIn8+9LCMcO3gTYjnvy4AJbZCCV5r7qA+ldEg0C1syjpzuemcTn6i
         ++Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385275; x=1768990075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5cjILvZRRTImGPxGANuLtLeouCjMoEEYp3VTF8lT78=;
        b=b4o6QaK0efGIGa9xxqFqtaiu6FVz4clu9M2t57lWEbLuNYtQFuKqwenVe99JD7m0Qt
         QYhoSgJ+btjgw8v8TtIQoqa+0URUaTieD2NDIi+jmv59jez15ceLf0/HZ69+hbnLtD+W
         CkpaeQm587GRyDbp+TAGCY+Qg+L/KBte57PLADLua9wyVJr1mwTr4FpTXCZOLhIjlrJT
         M+iYuUXBfGhkKeDusABRiSI3fYznoVHPObuYfifuhYhsdX6GJj2V21b3FFgh6YoDw4wg
         LUoO07doR0VfsgxkGrXwTEctuZ3DWc8sMCsN/JLTqgyYJPvpazcuYBlkYd+wXtPnsO1/
         C6eQ==
X-Gm-Message-State: AOJu0Yxoj3DFWcFbkEask6u/yVRKTz7GGFouMG6c33DiXneaHwZm0Pnf
	NiA377/cmM91lCv+D3XZTCp0wLtKBd+wX5P8X/kJ9QpR/c0QUGaJQkbh51qOZCOjbhwYYCCRTk5
	nTEWFji1Emy9Y7xEktTc1FRHKejoQ//6aHgbbAhBa8ZJ1tU3t/MG3Bg5Rvpz1ez4tVT3LcX4=
X-Gm-Gg: AY/fxX7otvRYJJWCFD3BEHK7dGWTEV/pOviEij8/FwPoZVE5jIpjFzBRIMS6e2SVCd1
	sksKyjJpcNzHmOr8z8THaiADk5iZEdSWb/xoAe8vwwWzhMs4m5O4jJPLOPwnM0SyN1Lt+jVl5Bw
	+Jcn7j5BkLF5qNvZNPtu1cdG6ss+V75CiFrA92xFNbR8f1110ShCQlseYjfPc/7mj5hAVTBoTZB
	gVbDYWx16wDHU9Ryg4g7B2hA8ZTa7MoybkL9oPH6/B6olwNf54fVgipiBUr45qJQPh6/RQpw+Ov
	zCfFclCU8AXF1+541C/oKa2UKcfR9FbATNDS+0ZQFU13H55NUux/6RcBAhv3wrh0U3pPmfAey2V
	URNhXBNgXZG5KKfHp8P050Xcq6VtuV5JmAkOfvQ==
X-Received: by 2002:a17:902:ec8b:b0:2a0:be7d:6501 with SMTP id d9443c01a7336-2a599ddcec4mr21217105ad.27.1768385275350;
        Wed, 14 Jan 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a17:902:ec8b:b0:2a0:be7d:6501 with SMTP id d9443c01a7336-2a599ddcec4mr21216775ad.27.1768385274831;
        Wed, 14 Jan 2026 02:07:54 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3632sm226379975ad.95.2026.01.14.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:07:54 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add the address in traces
Date: Wed, 14 Jan 2026 15:37:45 +0530
Message-Id: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=69676afc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WwGGzFOkyck6md8MPd4A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4MiBTYWx0ZWRfX8wxLXKnESSQZ
 de/Q3viQee8jAMqFdwY7P7zTI6V5OzpqY4eXnhiQNQNmwfgYnNzKXj6zspA0fSdrRBfo61JT3XN
 /2TNQHQtN2kduL8wBjBEzPQFxojV/hLxLzAsZx0qHsl+FSk+f0Ss16epfH3pjL8MVIpxIwkpvGT
 0hXxN/nCf/sh7oElJf/1pKAsbMyks1ff5WpjW37jedy2aGUIIzoRXB6xoOiKWglh9HuDhyYcHQr
 dCo+WZPGeZ12O79rfM4Cex4Z0yN6F8irJ+3nCNBU3ytyyQztFMWfGK5NWOTTO+lzPke/nuYSJ4L
 9hhChjHBHaC0UeGPquFvGuB9jROSFivnSs49XbivQtnLJX1URltTp09jOstM66PMy6JqwZerKyU
 jQCcMuTMCEQCbkWCHOnpG1TuEuxU0qYPLH4othQgLWjlKJZwK1zNFq0+uuE3qhRAdgVs18qs2cI
 N+7B4LSGu6EjzFnCXJg==
X-Proofpoint-GUID: RhsxnlA1IHn379qHuZ2wuB-zN2J3kdjx
X-Proofpoint-ORIG-GUID: RhsxnlA1IHn379qHuZ2wuB-zN2J3kdjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140082

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Hence append the controller register base address into ftrace.
This needs the following reworks which is addressed using this
patch series.

  1. Removal of dep->regs and use dwc->regs everywhere
  2. Use dwc pointer in all dwc3_readl/writel()
  3. Adding the base addr in traces.

Changes in v4:
- Updated the documentation and commit message.
- Link to v3: https://lore.kernel.org/all/20260113103400.2347763-1-prashanth.k@oss.qualcomm.com/

Changes in v3:
- Renamed the variable to 'address'.
- Used u32 instead of string/char[].
- Link to v2: https://lore.kernel.org/all/20260105115325.1765176-1-prashanth.k@oss.qualcomm.com/

Changes in v2:
- Avoid using macros for dwc3_readl/writel()
- Use base address intraces instead of dev name.
- Split the patch into a series.
- Link to v1: https://lore.kernel.org/all/20250825114433.3170867-1-prashanth.k@oss.qualcomm.com/

Prashanth K (3):
  usb: dwc3: Remove of dep->regs
  usb: dwc3: Add dwc pointer to dwc3_readl/writel
  usb: dwc3: Log dwc3 address in traces

 drivers/usb/dwc3/core.c    | 199 +++++++++++++++++++------------------
 drivers/usb/dwc3/core.h    |  12 +--
 drivers/usb/dwc3/debugfs.c |  44 ++++----
 drivers/usb/dwc3/drd.c     |  76 +++++++-------
 drivers/usb/dwc3/ep0.c     |  22 ++--
 drivers/usb/dwc3/gadget.c  | 164 +++++++++++++++---------------
 drivers/usb/dwc3/gadget.h  |   4 +-
 drivers/usb/dwc3/io.h      |  11 +-
 drivers/usb/dwc3/trace.h   |  88 ++++++++++------
 drivers/usb/dwc3/ulpi.c    |  10 +-
 10 files changed, 327 insertions(+), 303 deletions(-)

-- 
2.34.1


