Return-Path: <linux-usb+bounces-29763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6909C136F3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 09:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC8E1A23CF1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 08:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D498129E0E5;
	Tue, 28 Oct 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNi/sKMc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24A212566
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761638762; cv=none; b=g3KpuYtnXBthI09no09bPU1uYv2eALAEUYtjXoLq4AW2pQYWNoZGUCbGuC3Wy6CQHMD34mCHEG2F/Kvyj14vKx4Rf0Ant6vPvJ9NmwfD4vKhzvOf8B1dmS+mQ/Po+pDnuFO4stoyOdZJsCP/dIt5nrMWhyIt+Gde5Vjso2+baOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761638762; c=relaxed/simple;
	bh=fIifTYsbWvDsiqNQGKj5ON/It7paC8FULuvuC9z03KI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EKdCpzQVSIoi7P8WU3rx0YFA/TvVw4/SeQLe2i0GxTg8FqKyQUovrIegAlYBo84PuPFSCLdk4c9egG2/Noticmsa7YSEqtJ3yuzcOAzJTcVTl7OaplgF4JtncH5XyyKvbDbwRe5+xyevJZdFkV2PVE2mqYYUTCnjkWoWACKWGzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNi/sKMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4AAcU552777
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0Zcd4XmD56ly1pDfsv+tuvgigmj+KBlI2Du
	kiBWU+eI=; b=CNi/sKMcEJkTHBsoG+Yi8DOo8mhKHIJ9Daba557facX8I4fsp95
	smydFb3SA/nx+drVUwYnJVClsnhJUTgEIASiJ7LSD3JghmrOU0RaWYYv7wSwAYCx
	GulnO/3A5w/jP2K4hCXXiywIHAV0iEnuPdx9YhzwIIfMjpkRyJPiV5rhLrOb4raR
	oJL5d3Zt6itnJnCxWcPHZRGLIjY7htfW2gUhRA2jxrYgz8UtUMOlo95aSaKdVBs4
	yDoZM/PswUcLUp/KTVcTt3gLz56e1K6dVvX8U22vGQYIFMoXad9HMLYGuRAAtGvA
	yzxgDiCS+/4DmO7QNERsmKxeXhCKeL0n85Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf8k27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:05:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294880e7ca4so98606495ad.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 01:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638759; x=1762243559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Zcd4XmD56ly1pDfsv+tuvgigmj+KBlI2DukiBWU+eI=;
        b=ZCk+dzvjoyVmiUglh87jWwzNYRVoAWeDS2xOLw/DsXDFTQ9UoLVurfd0Or6FgzmwqA
         38zc3D9V2CaDDiJXO9RE1UiQeXOrc1v+Qzik/uJ2vODJftqs70hmYo6q1ZhSdj5Eh4hK
         BhM/ASno3q6n2Z8xet4yxIcz+fcA7xA5tS0tNd7+rLZ6PnROt4+KFp9EapZZosSdSsyV
         28aEYk7bnb03y2OCGNBfGOs88ykHTfTY6YX/p8uUaTHcVjm18c88t4Ru3cIDv5QKfTQ3
         qM8nSoBth0ArK/fO94rKWGzSrDrWVuVBaT3cQUfpLKPcuE5P0zMf6Fy3TK1T1miQB6LP
         8Dwg==
X-Gm-Message-State: AOJu0YwOlw2QadJVyh6DGbuJ9zuUhcAaN5fD/RahH/ahR7fpOBAPJX3w
	K4zIC9Wn6Sryb+Tnp0O1rrcnMszntMtyzUsn0u/Lv1v/9DPGrPIpK94UEzG1SuVohoGnucJke7f
	BvGlfeJpXYrXF8vUHsRWjjBH8wGf+1BD8zAOW1onN1wwrG/kvOR8qg4kaf+BYsj4=
X-Gm-Gg: ASbGncupQxSMTIltGI7rS3XQGQSU2iAATp9q7ujbt7+0izWqqbl0b2PQ7RamCPbkmYU
	CwpXz+AX40nJTjCWbsc3cU9kH5Dh2042HzBJRq1FbTjHYzFrhCGJTQ8l9CfdQHOIHPThw8uioNA
	Xln1gFQBpt/RwL4mAMEMy4f1UyNeVjrigfRQ+CLcp89qR/+rcCXM3w16ax+LNbd3gpydUxBIcUQ
	Qgvv9H7Vyhxq/m/p7mxv8LOcnOFZ83YNWGf+rufKAycvHr9dTx+8TA1pKRqtwz39z5LYXYHdOxT
	jJQNNCloqUvCJWgkndOcpFhl9aCWnY1JikXCu1Xy+eR94xkO296KTd4AbTW4APCvX+C12RUJJGv
	9OoMwOHr3pRVnhNG1z+NZk/0WSJk5
X-Received: by 2002:a17:902:fc4b:b0:294:9476:494a with SMTP id d9443c01a7336-294cb691788mr33813035ad.56.1761638758773;
        Tue, 28 Oct 2025 01:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn8amVy2Rs8jr7wffWwUGuAfVwT1CViA13sLhLqmmBpPEoJo3lE8pIsPENsSWakIKWyMn0Mw==
X-Received: by 2002:a17:902:fc4b:b0:294:9476:494a with SMTP id d9443c01a7336-294cb691788mr33812645ad.56.1761638758152;
        Tue, 28 Oct 2025 01:05:58 -0700 (PDT)
Received: from hu-mnagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f3fsm106668195ad.103.2025.10.28.01.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 01:05:57 -0700 (PDT)
From: Manish Nagar <manish.nagar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
Date: Tue, 28 Oct 2025 13:35:53 +0530
Message-Id: <20251028080553.618304-1-manish.nagar@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=69007967 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ohm9b1kf839YKAti0RMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA2NyBTYWx0ZWRfXyeWrzhKTnsOE
 pBE5cJxvizziCSPLwY+9QkD64+/Ca5wUTnFrb1f9guZiS7smkNkCm/NevqNa4qsxuC1kr4VgZKh
 XzS9wADyL19gyX8rPAjwgA1KQC3+Sv8eru4FuFzmHs6LNdUhNrP3fhs1H15ZvesxEVYHpvRHMRM
 hCMHmXzORImYDHSUFr+ZEQAKn+35iMPG0YexNjAY+47ET4GjlPK811OC2R9EmDMU7Qb+ncpZk1a
 10naIISUAgOBITFxa6/5712v4UA/dTRVLxzoWd/ncniOc4k3nUPG7Yq18qlpfxY4TXg5h50yqko
 ylZG3LyqHmJGaY7v/35woEEE5/KQJEwY8MlN0AGv0lrokQgm4lgGRsjSPo9n2m8gXbMm5IFW1nx
 cbuTI/ZyV5axgC52G9dyHu/W+tgXvg==
X-Proofpoint-GUID: m80eLCFPS3QJaoP8SoRpaEuOPmjvwQWD
X-Proofpoint-ORIG-GUID: m80eLCFPS3QJaoP8SoRpaEuOPmjvwQWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280067

This patch addresses a race condition caused by unsynchronized
execution of multiple call paths invoking `dwc3_remove_requests()`,
leading to premature freeing of USB requests and subsequent crashes.

Three distinct execution paths interact with `dwc3_remove_requests()`:
Path 1:
Triggered via `dwc3_gadget_reset_interrupt()` during USB reset
handling. The call stack includes:
- `dwc3_ep0_reset_state()`
- `dwc3_ep0_stall_and_restart()`
- `dwc3_ep0_out_start()`
- `dwc3_remove_requests()`
- `dwc3_gadget_del_and_unmap_request()`

Path 2:
Also initiated from `dwc3_gadget_reset_interrupt()`, but through
`dwc3_stop_active_transfers()`. The call stack includes:
- `dwc3_stop_active_transfers()`
- `dwc3_remove_requests()`
- `dwc3_gadget_del_and_unmap_request()`

Path 3:
Occurs independently during `adb root` execution, which triggers
USB function unbind and bind operations. The sequence includes:
- `gserial_disconnect()`
- `usb_ep_disable()`
- `dwc3_gadget_ep_disable()`
- `dwc3_remove_requests()` with `-ESHUTDOWN` status

Path 3 operates asynchronously and lacks synchronization with Paths
1 and 2. When Path 3 completes, it disables endpoints and frees 'out'
requests. If Paths 1 or 2 are still processing these requests,
accessing freed memory leads to a crash due to use-after-free conditions.

To prevent this race condition, `usb_ep_disable()` should be made
synchronous. Specifically:
- Issue an `ENDXFER` command to stop the endpoint.
- Ensure all pending USB requests are returned to the function driver
  via `dwc3_gadget_giveback()` before freeing.

Since `gserial_disconnect` calls `usb_ep_disable()` first, modifying
`ep_disable()` to invoke the `complete()` callback for gser USB
requests ensures safe deallocation.

Additionally, the driver already includes the `dwc->ep0_in_setup`
completion mechanism, which is triggered upon returning to the
SETUP stage. This can be leveraged to coordinate and synchronize
the cleanup process effectively.

Signed-off-by: Manish Nagar <manish.nagar@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6f18b4840a25..93c20d5edea1 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1064,7 +1064,7 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep *dep)
 {
 	struct dwc3		*dwc = dep->dwc;
 	u32			reg;
-	u32			mask;
+	int			ret;
 
 	trace_dwc3_gadget_ep_disable(dep);
 
@@ -1077,18 +1077,23 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep *dep)
 	dwc3_writel(dwc->regs, DWC3_DALEPENA, reg);
 
 	dwc3_remove_requests(dwc, dep, -ESHUTDOWN);
+	/*
+	 * Stop the endpoint by issuing ENDXFER and synchronously complete
+	 * all pending USB requests before returning from ep disable.
+	 */
+	if (dep->flags & DWC3_EP_DELAY_STOP) {
+		spin_unlock(&dwc->lock);
+		reinit_completion(&dwc->ep0_in_setup);
+		ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
+						  msecs_to_jiffies(DWC3_PULL_UP_TIMEOUT));
+		spin_lock(&dwc->lock);
+		if (ret == 0)
+			dwc3_ep0_reset_state(dwc);
+	}
 
 	dep->stream_capable = false;
 	dep->type = 0;
-	mask = DWC3_EP_TXFIFO_RESIZED | DWC3_EP_RESOURCE_ALLOCATED;
-	/*
-	 * dwc3_remove_requests() can exit early if DWC3 EP delayed stop is
-	 * set.  Do not clear DEP flags, so that the end transfer command will
-	 * be reattempted during the next SETUP stage.
-	 */
-	if (dep->flags & DWC3_EP_DELAY_STOP)
-		mask |= (DWC3_EP_DELAY_STOP | DWC3_EP_TRANSFER_STARTED);
-	dep->flags &= mask;
+	dep->flags &= DWC3_EP_TXFIFO_RESIZED;
 
 	/* Clear out the ep descriptors for non-ep0 */
 	if (dep->number > 1) {
-- 
2.25.1


