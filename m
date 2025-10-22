Return-Path: <linux-usb+bounces-29513-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0BBFB465
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 12:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F0D4050A8
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 10:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0007312820;
	Wed, 22 Oct 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiwqGmaR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7A350A0F
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127241; cv=none; b=mz87b/mQg4Y0qN4Uzz1B1MC1dqJuGN+G6cqhC4kPYYLxnGqssNUrCK/v1KP0f90C8uxN2oVRIlJ63QZS2UcQgHoH9tV7hiGdSv3nIPstITeQ06ZwCPr6I5kLiojudGnC26CG6BM0zS0LDQbtJcrYf3cXYxFdWslM6l5qPTXU3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127241; c=relaxed/simple;
	bh=D/RdzgerUXxdXIxLj3ueFDUpefwcXH+Z33lWnyzuBUU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=KXEF8Y942BW29z3XuwEefxFRWjRqApH/D2JCwwi7hQsBPSh1tw0Y6G/wF/pT3PUUC231ZWvgMWjK/80rwdCBoQR1xVGQFJezYipIhj540DkQl1PZ2nCxYg2cjth4P5yoeFTDjgt/OiO6lSeCqYh77E1WWRImhxDEyV7FyJdfhxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiwqGmaR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3N9OE030075
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 10:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=djuXN475bvh4
	H2/HkJC0UnX8Fj8yGhy4ORyfJcb7uws=; b=BiwqGmaRgdJksXydFdsWBqdvG3EB
	hCIEKOmFOpVqU9RnvQlhaL3yjBLvd+8HbtxYPwZ0DuPo/uq4kFJ+RVIVhQivhvX3
	a6sVrjsqoRPVjTVdBso857okpC1QFjHTV4bBTbUHwIFZhGhDw1cM8d+JJP2mu7OX
	2stPItmWg7TrtlXzEhLpas0OEK9Wbht/1IG4GUtcP5eRM6AATNQfdHMVSy54ezOD
	0P9HH0f9Q3jv+lQ2SKVbxNXrWpVM91iTM61lFmrAeZk3zp9kTUZkQ1oEQ4lQOTNn
	aqlo5Zn3ZQxjMlesUXo0Aa3aSKAPXujb3RvDGt3pP7TxySAuPjvFFVkAQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge45py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 10:00:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290b13e3ac0so65110235ad.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 03:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127237; x=1761732037;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djuXN475bvh4H2/HkJC0UnX8Fj8yGhy4ORyfJcb7uws=;
        b=wi1TxNuoNe/b9VW9OqNH5hwMkbV+lFuyF3QIcIrlimffODEvwSHNMzFQfW/I4O9ktz
         o8nwpeKW8jcc5O72MjSOVHlZJhqq0wGsg7/8TfxKnNKQrHhyVWI91ujvO3ieIUexd0UX
         jhCAL5GL4UHp591WYayTC+agTMqfM4pSX2QABd4PxUyfaqC3V83dpcJPnbcEuRbsRGld
         nl06E8eEW7RlJ1vsNPuDxR9jW9PRU6KRMv6AKrR12C3gz3GRT3lFc2i4yfy/GaBmpbWY
         7cWZQiKTshDSwUyVW7OVNB2440tVQB2K62aD7kLQFSEKjBdr+uznQliMb/kknDzOrIWC
         qSvA==
X-Gm-Message-State: AOJu0YwC7GL5Y4PbHs/2h6qD2sGYln12FCWmoM1slyIOy2m3FI7uaEkh
	HIUh7Hsww7p4b6n0V12uW/i33F0CpMhvorRzdKQTj7r4BYTn//likGpnTpnHt4P+uNYLhkRBQvK
	wsxb41EhxbVz/U7LXBehroX6YzerQCaFDnD8wy09a1AGmzRXasZEt31zXVhx+Wmo=
X-Gm-Gg: ASbGncvQGeT34lJr4cuzUyrJyzEboVb2DVDwG49R7LvGYxyCvOaUiH/p7IeUXTTOzyH
	cwc5lHR4QNSAB9vn9yx93rdZMfIsXOnHnwfkZr2dis5g/3uts6CMfaO0E47OfDC1e4kYj/i1HuF
	uwF/DePmiQ2iBdgnDM1SLJCb3KV30Eqzv2oeJawN9lpmrVJU2TKR+sx2r7xcAj5YEVzDXpLlJso
	dR+1yyyNkxxu93H99vWrU/7EAE04CCJ4YJaAPJArXDDhksiJcjXfM5fWDdxsQSpp64VNqRWeIl0
	fjJQAdhXbpVMX/h6TJK7jIRzyuNlIYYmkH6M+ZC0VvGVypJGwUCLrIWxzmVu/A1XzfopJiN3ss2
	a5BRfbuYogLoy0t+jhcTUIsxPzTL/W4zuuLW1gw==
X-Received: by 2002:a17:902:eccb:b0:290:b53b:745b with SMTP id d9443c01a7336-290cb07cfe3mr316250595ad.39.1761127237085;
        Wed, 22 Oct 2025 03:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDROATh3RnjU12HIGSqCJPoOyvjjLYGo0+tf1o+/B9ssy41BPcCGsaC62K96HQ8/uSNiOU/w==
X-Received: by 2002:a17:902:eccb:b0:290:b53b:745b with SMTP id d9443c01a7336-290cb07cfe3mr316250005ad.39.1761127236434;
        Wed, 22 Oct 2025 03:00:36 -0700 (PDT)
Received: from hu-uaggarwa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcce8sm134729785ad.18.2025.10.22.03.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:00:36 -0700 (PDT)
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        wesley.cheng@oss.qualcomm.com,
        Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Subject: [RFC PATCH] usb: host: xhci: Release spinlock before xhci_handshake in command ring abort
Date: Wed, 22 Oct 2025 15:30:29 +0530
Message-Id: <20251022100029.14189-1-uttkarsh.aggarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX/W0GFMUs6xV/
 R6LJpKHtYlmqKhA8N0N/pA5rMhkbZSpv6Ur+4Nba1wR1WQTe6Gue4vLohS5Fb+IM9o3ISm28606
 5+vChBf/pyvD7TBPqWKr8sn03/W/DUBlwOWIx9XP6TbtCjzxYbsqWAK2Ynt1LSgSVTIzvOmKQC5
 zXyqerikcOttOCphufJ0+2WTq91efQEkTIsdnwTfNVfqd+KBd5+/CuJcYRMfW5QQd9g4I4v05xL
 i11EAQCBjphb6Xj5tOvT6/elMWGfilhlw9E7hUSZLr08KhMINf8miXL1eCpLd7IHdkE6SP8P5MM
 qTa7XWUSBnbrgJXk/gC50nJK43ckqDv/rSeRp0DNotn3NJ/wziFEcia6kjzzigkDuTp5yDVjT4j
 M0zXkxwAfOfdYgS3JlOe4Cczldd7mg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f8ab46 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=bdA4XEzNU97oe6VxBpoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: epwrUZ341g7BL_VKlEsAv31KDEUyosgb
X-Proofpoint-ORIG-GUID: epwrUZ341g7BL_VKlEsAv31KDEUyosgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Currently xhci_handshake is a polling loop that waits for change of state.
If this loop is executed while holding a spinlock with IRQs disabled, it
can block interrupts for up to 5 seconds.

To prevent prolonged IRQ disable durations that may lead to watchdog
timeouts, release the spinlock before invoking xhci_handshake() in
xhci_abort_cmd_ring().

The spinlock is reacquired after the handshake to continue with controller
halt and recovery if needed.

Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
---
 drivers/usb/host/xhci-ring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8e209aa33ea7..fca4df6a4699 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -518,10 +518,12 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
+	spin_unlock_irqrestore(&xhci->lock, flags);
 	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
 			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
+		spin_lock_irqsave(&xhci->lock, flags);
 		xhci_halt(xhci);
 		xhci_hc_died(xhci);
 		return ret;
@@ -532,7 +534,6 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * but the completion event in never sent. Wait 2 secs (arbitrary
 	 * number) to handle those cases after negation of CMD_RING_RUNNING.
 	 */
-	spin_unlock_irqrestore(&xhci->lock, flags);
 	ret = wait_for_completion_timeout(&xhci->cmd_ring_stop_completion,
 					  msecs_to_jiffies(2000));
 	spin_lock_irqsave(&xhci->lock, flags);
-- 
2.17.1


