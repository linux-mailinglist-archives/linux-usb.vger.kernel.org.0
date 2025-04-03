Return-Path: <linux-usb+bounces-22502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EDAA7A1A3
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 13:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBFEF3B7E00
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 11:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA23124C07A;
	Thu,  3 Apr 2025 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDt7TI6y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59A24BD00
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678496; cv=none; b=Uaa2Lx4TV4lb9SJsc0y9Mmyh3hYWTUwpWFmFGtZJQ/cWxRx6LJ2FMj/owZxbfvGEATvILp+S25HHiylyQwMnyzeirz1MV1vQ/RX7VHNPY162mlNt1AQeeBZrQxZ5bQAmFFTmYAhv+V0I7Z/FJrt/eENavufMB0efnLPvq8vAi0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678496; c=relaxed/simple;
	bh=+INaQNpJ3+McLmQ2WaEXeW+09PVVAxkscQ51hTKfPaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dE9GH0722DPfCZ3kHtwvY9yE5S/zJGfTzQxp1jo/yPAoUGTJVeWlWiqJJEkQLTlDj4diBy4c5Lt8gAjvgphy5BIIkpzgSgTnw/zRAtunoqst6SzfmJZeeaoQo1zXVbeWMXug4o/9tMqN5g4tS4fc/yc+/YfaUo6XSMriwCjkTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDt7TI6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rvF9012853
	for <linux-usb@vger.kernel.org>; Thu, 3 Apr 2025 11:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/5UjTdO9fQkm/+gRvN0hBPemroKS9w9Zn/s
	PI47gMYM=; b=QDt7TI6yRLQBzZRK01NIWc49GFgRsc1WP712ZM6eXq54BseGlVS
	mYszHzE4fUeaHdleaK/tui8xq0EoLXwaF03i1Sin+Oh3ZAeuF0rjybl0cu1lbuKh
	M6Q6QnDIFN5PPkxNxwNEshU5OEr9a6MMsWCbBOWMc0cN/AzhEJIH0txR/mrlkd+j
	uBrRS25HP3efjZdHkD69NgYAirKQfcnq1OnrlvmurTA9fA+b4BUTe4wUSnOnJhIw
	2j/X9VxoEbwsqaSUsIrmyBWcDmFSgOnMTw5hcBnsPLkbuU2KIlyQ0ddLg9k1N7NB
	tEpxw7wIyKb0amMsmEb2VR0GD4sRKLlc2MQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45spnp0ga0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 11:08:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso1159695a91.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 04:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678492; x=1744283292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5UjTdO9fQkm/+gRvN0hBPemroKS9w9Zn/sPI47gMYM=;
        b=QH1m6umGO7unYU+308/NZ0Yj1q/2k0/7JABncSK5HifUuDJzGEyObDWR9Ls8KIMOYS
         KlzG7xMRuXhzvWuW14pGSGb4PRlaIBJLbNddVdUg7iyoGdEIwA3962QVK9u/rvdvzsZT
         GaDLlsTj45On/amQHJn1+WUqW627l7620LFg93Q63/drRcPSDeufihDbt3tPEU5GsS+Y
         yEeEiZGsXGDFb+3J7JnuRSHdDv7PDpz5EHV/WeKkpbj4eCdKqdbUSPXPRsF94Tn82aKJ
         5XYeoKSvtrwJPgJhNzgcrMYRpy7bv1MLmzoUdxm3U/wLVoKRx8oOX9pLascuNTziwGDq
         xfXQ==
X-Gm-Message-State: AOJu0YwkMIPAISKI86n69HR0GJrQ2j4FFYfZ3nj9J2hwvL7z9i5txuEq
	tR1l6N4ogP+L+ZOtMnrKuS/+ppr9+vl+E48mhAiitRKNhgL0qjlGrGd2sIwaNnr6IK/rUZ9+Br4
	ABD+okgKqLJsaMTe5fV8s7HZxE46wNVau6XHCH5NuJeLvmnNzRVTUKj9KIn8=
X-Gm-Gg: ASbGncs7pKhCqs45dAsv2phsMkAv13+wliimnbHEwRoHuzrWDZg7sSmMvfNNdSU7n4E
	zv34vb2JuHTtCfaH+vPHhyWxCFzlzxaxHTE6LaLyHoq9gAfRk/Z3n+OsoEtFE/DPP7CePL9ELnE
	9lFjRkB8xCYqdyuL6vveV7kaFyWTYLqOx/5zbagDK9p70YBG+d9DTptR0PI0FljQSzZog8GzFCB
	//DYYr2NBEdCRlLBDkNYv/zHtcS5giKQOxOp5e1O2ZviMkaMCc4m4HBBE7K1Dnxv2kEvliwbQlq
	b0yLDgebBH/1PEZjeXD+aQ9CiTmO5EG1DjhgvX+/12He
X-Received: by 2002:a17:90b:5408:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-3056ee232b3mr8035843a91.3.1743678492074;
        Thu, 03 Apr 2025 04:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkhAXnYOwjvj+ZraBFfoXaC3tWp9r16uIiKUeutTaKxnDtMCGTZqKvlqYWH/h1XArkbkcsDA==
X-Received: by 2002:a17:90b:5408:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-3056ee232b3mr8035814a91.3.1743678491686;
        Thu, 03 Apr 2025 04:08:11 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3c3a8sm1185414a91.28.2025.04.03.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:08:11 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 0/3] Fixes for USB3 CV Chapter 9.15 tests
Date: Thu,  3 Apr 2025 16:38:02 +0530
Message-Id: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kgOla1Cm7G3r-6BUj5lvXKufm85Z-WEX
X-Authority-Analysis: v=2.4 cv=N/gpF39B c=1 sm=1 tr=0 ts=67ee6c1d cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=PWc0uLnFobKSz-olugQA:9 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kgOla1Cm7G3r-6BUj5lvXKufm85Z-WEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=808
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030043

While performing USB3 Command Verifier Chapter 9 tests, failures
were observed during 9.15 ("Function Remote Wakeup Enabled Test").
This is due to the following reasons,

1. Interfaces were incorrectly reporting as remote wakeup capable
   when host requested GET_STATUS.
2. Remote wakeup failures from DWC3 driver due to timeouts.

Address them through this series.

Prashanth K (3):
  usb: gadget: f_ecm: Add get_status callback
  usb: gadget: Use get_status callback to set remote wakeup capability
  usb: dwc3: gadget: Make gadget_wakeup asynchronous

 drivers/usb/dwc3/core.h             |  4 ++
 drivers/usb/dwc3/gadget.c           | 60 ++++++++++++-----------------
 drivers/usb/gadget/composite.c      | 12 ++----
 drivers/usb/gadget/function/f_ecm.c |  7 ++++
 4 files changed, 39 insertions(+), 44 deletions(-)

-- 
2.25.1


