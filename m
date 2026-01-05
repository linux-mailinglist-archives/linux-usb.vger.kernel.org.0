Return-Path: <linux-usb+bounces-31909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FACF372A
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 13:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75278302E33C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B59033A9DC;
	Mon,  5 Jan 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFiQbPuv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8csIhQp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46133A9C2
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614049; cv=none; b=aPK2bTuVRCPDowZwkgUAq6tkh2+aAY9Sj40G1dU9CPB2w395AwFymePzYHhwfv5ML3C6/bM7XH53mp7O8idAOvtuRW2Htv737cobwCpYNwuMZovH+mhlvfL8A7u8khJfTDIkiw6G5JElrdkSR1m2BMW7IwYrUiB28hyCWyZudfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614049; c=relaxed/simple;
	bh=Oqn4//lAZHRJr0JLqni+cYb2EJroVpCtMdGYQINskLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kp6OYKyfbkpzXzegqGZrdRy3dWng3czsyxG4W9jK/9Xhu6gmfiNAO+FHzsBcrSXQc4hxSCxHaduEb9RxBzFt+kcrPoqjYc97Xbazr0yOpHdYKC1H6wNvXNGlwF8WhFqhN2wpKhL7U+9lT+TpvDUhWAIDDPJjzHHJaHWvylrJa+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFiQbPuv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8csIhQp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605Bm1eH4032703
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 11:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ldVmVf8o0SX/OLf0pJbq51T9KA5InuJdY0+
	7DY4o/0w=; b=lFiQbPuvqgZxmFhnVz7Qt9qhlFgavP9XkDq98KPg3eWa5MJwbKg
	LRfCX+q0R3IHEjIU2GM/zTrLKQVbUK8tulzM1CuuVU4S4RKZH7j4jdQTgUtXk0Gh
	4ErLwbo8eJCk2TlNPBWQDdYWGsYrzo1jv3psE5VbuytCQJlWVQOU7J7torzRwwpK
	284EEeEAZsnAKPw562cUVQ7VJRajuaoB9x+HVbulSxG2HHmay5VcwAsdrfJVpTbY
	cZZhj1z36pdgbmp48ZNYO85CGJHh6VpyeLXWtMs9rSm+CdQF4Ahyu+BCncg3t+/U
	tU8vmz+C6fVD1W/pM+4AWx05g6NY46zLmdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nh2yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 11:54:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bae9acd4so127196745ad.3
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 03:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767614044; x=1768218844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ldVmVf8o0SX/OLf0pJbq51T9KA5InuJdY0+7DY4o/0w=;
        b=a8csIhQpicI6rRs5VQllvTGutsM0LQCZgNpaxOwOlbzVG0qNPJFBE3fuxrtYsUnPjM
         AxFPsPyL1ThJ1dRrcYB/fzGDJ919INRLHGhlMxwnXvK+yNvv582DABbZGNiWTujEAyK+
         G+BzV14lLVg4HRRTLRk2PMSsd5Zt/M/AQAwZ9DwlA26YAnvKsi6QTum+RGYq96xtQXoE
         TWfA8meHQ9CXI/r04JBnVvtQi+mHv4mMXU/45KN/wRGV32mh9cLreIxTTLIuvPEnX3dE
         tG3oSRrku2G72257wjqhEGQFvxKdh2mdwwb1qrYnlQLnkqVoorcdaWQhgFVSYSO3i5lT
         018w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614044; x=1768218844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldVmVf8o0SX/OLf0pJbq51T9KA5InuJdY0+7DY4o/0w=;
        b=rodk5Lbdt2F0hD1dFO3pK7E98gg0LAi6knLhDFZgws/9HmkYZoG8kHk7WiB9GVFN33
         cfVn2F1FN3OfgLDpqXhVQCqkCuK8Eqo+UyT5KgFPGTNiP3Xc8m8a1vcDgMeC2CCgASXR
         /4ni2uiJypcAXmsezgObr/fRAC6QZz/BCqI0FvG60TTqNnX7h016vQHW4HbfPcpPjCZH
         0xkTzrS96bDtngM0ttSlzWaPFHtRsd9TmxUcwbT9OsMJr0GgY2za0OBJo9tYZjZYXcnY
         YUwH6fNXOw3i4G1IBOOmpx2GNS23ofLqmt8rCKA/OTKzy6YXt7LslrO6vMi+3BNtBWci
         vCLQ==
X-Gm-Message-State: AOJu0Yz2eE88LZj4P9TyXCd9+KVYr3ApFauHsFJhr2+poMvAbgQh8E5c
	5OdCiGuCFEBehbHxajVATs2sMtcDY1YAFy0Xc9HtllsEIir7AAj/nN9Vm3fXcK2jgUSNiiIwZHO
	xcKucNZnWvNEwzcchkQ0JKnIO2nKPV6J3WxzwlJYGb5uJdTvA1P6wpShwgRTC9A81fVvm2jI=
X-Gm-Gg: AY/fxX5BJ/n8F3CvKkX2MMCcF8sUOooAgNcVj7mjoqUUw0xCGRY0df/0bF+KFMIC6v7
	6Uv3JJod/EMGUlz+7jePcqu3RQc8+jFxeL15ygXmlLPif8JRT1vKT3UJ8CeoEQXEWBxDOF4J8nI
	YsSRsWfo1OiALjnM0gvWbytfe2h+4R0fipCgX4oaz+SgqoDv5Sivx9gDUT3M4Z3I+tfgO1XI/gb
	rnp6da1okp0aFIFz/7BgnKDhnAEJOQ1Y1IuhkBjYH9dg135/tutpTwEiAiTl3jEBMZNpB7+JvJm
	XDAe1jmOSvRAoZeqd6F6VbyNCni3SWJfNXQ/K3/AOCNu7Df0whrgViUw+ObLAY/Je7/dhLqRYls
	EnkuqqZ+VpCG+yQ2ZnWaw+0j+hnb4cmOiBgpzwg==
X-Received: by 2002:a05:6a20:7d9f:b0:366:14b2:31a with SMTP id adf61e73a8af0-376aa6eadcbmr45123015637.77.1767614044051;
        Mon, 05 Jan 2026 03:54:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9QCBX4URFJFDbDW3Dswz4JgleGtSZpShBpmf8ZXdv6MgVdCX2+spuJmBZXU10UojMVuGyCg==
X-Received: by 2002:a05:6a20:7d9f:b0:366:14b2:31a with SMTP id adf61e73a8af0-376aa6eadcbmr45122999637.77.1767614043552;
        Mon, 05 Jan 2026 03:54:03 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm48125744b3a.46.2026.01.05.03.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:54:03 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add the DWC3 instance name in traces
Date: Mon,  5 Jan 2026 17:23:22 +0530
Message-Id: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j0UxdKtvOvAINUTxTum6q-cHNoLTDDvW
X-Proofpoint-ORIG-GUID: j0UxdKtvOvAINUTxTum6q-cHNoLTDDvW
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695ba65d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WwGGzFOkyck6md8MPd4A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwNCBTYWx0ZWRfX7IZtQpd8K/Cy
 QsFQcUwTzx/rsZUNhVYGskh+YINp5GrxdcsCA7X2FqPfd0M07atenDX1X287XeIH/ISaSfDUHSl
 ZuY30ZgnarcBZKC/PWoCjsNtxTvIQMHxvKXYLFFKkW4nvw8+nAcH1OA74byd5/lP+sK/qiiyL+9
 PYNIv5v+lYFZZWpCGBunwOOl0+2zhgH0LfCg/hqn4JtimEZ+McizDdix7uT7bNhKAdYnX9YXogI
 4chhSg8dTuDppwVxP/eefsWPapWS+Iz3Kh161lE8TMP3kmgTvcOvlaVivcont8tv65ofJC1V2Tj
 mqYymqYAQ60NaqcdXI8HVW3TBgP+WisLJbmhrJDURH9wnG4KhGJbOZOZ8yrHcFtcc/J2Bn08ASL
 Kv8D8BZiC5UTvb1XcEEBAWKkJ2xOOD8HBZp6doy1qc3k8S1XykpwQdZdoQs20UYpM/ZxDLYzqdQ
 aO1BuUuEqgXdk0UJohA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050104

When multiple DWC3 controllers are being used, trace events from
different instances get mixed up making debugging difficult as
there's no way to distinguish which instance generated the trace.

Hence append the controller base address into ftrace. This needs
the following reworks which is addressed using this patch series.

  1. Removal of dep->regs and use dwc->regs everywhere
  2. Use dwc pointer in all dwc3_readl/writel()
  3. Adding the base addr in traces.

Changes in v2:
- Avoid using macros for dwc3_readl/writel()
- Use base address intraces instead of dev name.
- Split the patch into a series.
- Link to v1: https://lore.kernel.org/all/20250825114433.3170867-1-prashanth.k@oss.qualcomm.com/

Prashanth K (3):
  usb: dwc3: Remove of dep->regs
  usb: dwc3: Add dwc pointer to dwc3_readl/writel
  usb: dwc3: Log dwc3 instance name in traces

 drivers/usb/dwc3/core.c    | 200 +++++++++++++++++++------------------
 drivers/usb/dwc3/core.h    |  12 +--
 drivers/usb/dwc3/debugfs.c |  44 ++++----
 drivers/usb/dwc3/drd.c     |  76 +++++++-------
 drivers/usb/dwc3/ep0.c     |  22 ++--
 drivers/usb/dwc3/gadget.c  | 164 +++++++++++++++---------------
 drivers/usb/dwc3/gadget.h  |   4 +-
 drivers/usb/dwc3/io.h      |  11 +-
 drivers/usb/dwc3/trace.h   |  88 ++++++++++------
 drivers/usb/dwc3/ulpi.c    |  10 +-
 10 files changed, 328 insertions(+), 303 deletions(-)

-- 
2.34.1


