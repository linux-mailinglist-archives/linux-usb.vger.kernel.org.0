Return-Path: <linux-usb+bounces-31902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E1CF2831
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 09:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5827B3002D17
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 08:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A11322A2E;
	Mon,  5 Jan 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjsXP3Mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSjq1ltf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C132694F
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767602902; cv=none; b=nNRLI6q0xh8kRZ9XAPgfbLXPi11XGppNM7K6nAUN2zm0XlGQ8bjgPRCKN436AjO+/dhRqIy701L8RGklwRJyrnM/iktwLquYhY3Z8/qZdZhdD4lQzMA7LBaaw8BdqJ2UgZ02Hw5MrP1NS+bLg7EdEomFnmlpg1R6g7GsWnFoiis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767602902; c=relaxed/simple;
	bh=zSTwg8qA91/I1Dq2HwiHZvJEu2KQuog15x4W3HyOd1E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r/wqKA/VKDKbsO0b/3McpON1LcpC4C8nkVnuPrjnQDSbjJof8ejSwOMw/+AUE3ngC6bBhWE2Yqpyf7wL6LdsTTTtMQeUBEDnJPzHZKoPySY8cbm1qqWb2C/xIQHX6Proa5R3o70R5D7lnef9VbbYd0+VqShRizomPOomQLCJ95o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZjsXP3Mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSjq1ltf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6053Es3q3541656
	for <linux-usb@vger.kernel.org>; Mon, 5 Jan 2026 08:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yO7BgBaXQEF6PSstmQOsG5C9hyOl6q9hlWY
	COPYPjoE=; b=ZjsXP3MhwgqFt/lGEsor/IZ3j9o/jx75Ey9ZX0ArQa3Uh0dGF7P
	EJxItw+CmITowemeKHqDq57KM3gAtXAg2EhjMFZDdO+jUNwBnfoY7v1l1TFWikWq
	Glw+iW2R0GJFWO3QdVWEJSBZLMaBkjYLrIRYRfFTSd+vMqWmpDuNXxCagmXv+tHM
	G7EUeLUQwYuUR9nsbWFJlUUQNpeCJPO3SpCI1mti7VV7BJJAgICr3gYVLGhw/rkH
	sm1kBQFtRm9Hyv2UlvI3oq4uWtaFd2zAqSNEtpq/KNIGtUkvwPN1J0W5GprbySl3
	JnG1R62B5Ilge14lgWRT1K/kvTdU5EWUSyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sgvex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 08:48:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc240cdb249so12427809a12.3
        for <linux-usb@vger.kernel.org>; Mon, 05 Jan 2026 00:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767602893; x=1768207693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yO7BgBaXQEF6PSstmQOsG5C9hyOl6q9hlWYCOPYPjoE=;
        b=RSjq1ltfzmd9XC4tiZBwrqwcz7WABNhOj6cc4adhyvdGRzSBGxe0saAJW3cG8Av5TK
         jwoj+mVxD5J8/+a2o8kDRtGVi5OoSTJl6rC1sq8JjHTtmbQ2Dux4tLEaFKhXZThYmgg3
         B9sdQK2TyT55E0Q71KFAv7LhEbtrSyqWuNmQJwRRVVEYsnbFIQySHREEfuhh6grHoBag
         vlf7kWYGO7gHUXT//jh8kjJz4+Y4GmPnNOYlUyDo0vrCeTQGWHQ67ZYnBbXFup3GEcQm
         p005kaC0zXEaprnOO1+ZPAeukQFwOvEHAFl7pSQjz+GghcjPXl9sSWFXdFjQi3WBen8M
         tyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767602893; x=1768207693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO7BgBaXQEF6PSstmQOsG5C9hyOl6q9hlWYCOPYPjoE=;
        b=RpAvkW5uA+YJAjfKpAC5ms2IC8gDDvnjf7IZlIFXsgD7rdMu6E0LrytDWyW959sgoX
         60jYJT8qsmfAekyTTAUk4kZL7BqShVPk+lunJo5Wd0nj3Yx0rORo19pi7nIGLHNUtm0+
         irNjCsHhBhnrYed0x5tuQYCXaLoskZYFHXmk7WtRHvtPH/Kylw39dMa88g3GKwale0uk
         mfD11xnq0rUj8b4+ByV0a8NSgLWKX/xt++kDaHUwijgGTQ2l3bHEabutFSmi8imc3H4X
         5ILvSTUeP2P2tOB1XtrEcRMAe7Kr4td8Fr6+M0APQqo6E+0MhAWmG7ecBq+NOYSvtkYd
         EtIQ==
X-Gm-Message-State: AOJu0YypQ6hWjRBB+ixw9JwT+EaRU57ELAVNBfSQP7CM7PEx3HkG83U8
	nfxI6rWRUn42lTt9MG1Js21ibtr13uro4CO6VacTVkdhlifQkqoRgNA9ukKTV60cf7b7x4x6MFL
	OFAoHycg7oa+r8CxOanPNbD/fMTEPqFAfwavcgQ+QDCPzWrs4upswFodFTysO6EI=
X-Gm-Gg: AY/fxX7dV9GKbx5XLOKdRj4H8OfHDiaXKJPq2hcIkc0XyWhTFPAoLSTsW7pJQjx02Ba
	5G/MQj6+z5oFioXC5H542lAm+rwAtogWVITPZI2AJHDtJR7OEoxs8e8D6HdNJ5azUgYi9rAIlsv
	PncDbR2bPpYAJH+QX0MYHHmLU5+QQLR2Wq3sMPjnSvtzgQmw1rrAWSFf/srYw+so98YPOG4KkT4
	H8iIJLpaJOa9uXyZ3E9ep4gqb9w+xm5NHmkDPN4sQuSRdjpIQI5pOhaKLdv0cHSwHBjj43p2ciG
	+rupEVnPquKLuMLkZvYdK2FbMTbudlXeVMxDrEQhwClMO7gE7nmstLdP8qQjPQvLkEbimOIo9Em
	a1bCsKOBP2DboIFeB+W0MA+Al+H6JSZraS4uxmGSwIxBQ
X-Received: by 2002:a05:6a21:3290:b0:35e:3d4b:4cfe with SMTP id adf61e73a8af0-376a94c773bmr40219129637.39.1767602893297;
        Mon, 05 Jan 2026 00:48:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0NhfaQgKrz3M/gb7XsmHegNMy8uvUWE/KObeykAa3rW1Vt9SzjPRq4FvPXRSv3Wxtl83GDQ==
X-Received: by 2002:a05:6a21:3290:b0:35e:3d4b:4cfe with SMTP id adf61e73a8af0-376a94c773bmr40219108637.39.1767602892757;
        Mon, 05 Jan 2026 00:48:12 -0800 (PST)
Received: from hu-ugoswami-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f47520505sm5518163a91.0.2026.01.05.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:48:12 -0800 (PST)
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Subject: [RFC PATCH] usb: xhci: Skip configure EP for disabled slots during teardown
Date: Mon,  5 Jan 2026 14:18:05 +0530
Message-Id: <20260105084805.2155251-1-udipto.goswami@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695b7ace cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zaS1wXQRRR3QRWluEX4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3OCBTYWx0ZWRfX43OX81+c7PSL
 +VCMkS9XvuakU+tO/hFhB2mLn4Ev4T2SmYMGyWdt6U8m2OpfvC1DI7M6NCEjy+VnzztMdpX1YTF
 zDNoxbx8i8CAiuzRaJao5QzeWY0Mk1nOKIkNnxlK7HdaabSQtmdBIwaQ7At2KvkH6fTubuSUYzG
 Ap862mXZ4NQD50qiJgSixNXQq/gBfrvJ2hl1+NR6KgRSL8xlwu55qcsOdDwnf8SpHctabdin9ts
 W6F2JhF0jqEPj5FaG6qnVq5oJfhUDOma7M1V0l0tJeih02rhefZMXdUDomtMWzma9UiKohuKLfe
 +gussGgUO7S2X81AbOdX25X4Sk4yYFiBoE13cwUUJ7K288QkrygK1cUGRdTNxMVXynQrncBjSZ7
 sz4HiUWYUZHd7emrEPU2fwRXxYBqKdQCF2KAnXblEOQ+3ovaHweSu8M1OmfLSZ0VhejAmxBiTTU
 cjG7WxHyGsedcGu8mxw==
X-Proofpoint-ORIG-GUID: ZWOeoN_h6Gms86E1LufTmyv5dcs-J2ts
X-Proofpoint-GUID: ZWOeoN_h6Gms86E1LufTmyv5dcs-J2ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050078

Consider a scenario when a HS headset fails resume and the hub performs
a logical disconnect, the USB core tears down endpoints and calls
hcd->check_bandwidth() on the way out, which with xHCI translates to a
drop-only Configure Endpoint command (add_flags == SLOT_FLAG, drop_flags
!= 0). If the slot is already disabled (slot_id == 0) or the virtual
device has been freed, issuing this Configure Endpoint command is
pointless and may appear stuck until event handling catches up,
causing unnecessary delays during disconnect teardown.

Fix this by adding a check in xhci_check_bandwidth(), return success
immediately if slot_id == 0 or vdev is missing, preventing the
Configure Endpoint command from being queued at all. Additionally,
in xhci_configure_endpoint() for drop-only Configure Endpoint operations,
return success early if slot_id == 0 or vdev is already freed,
avoiding spurious command waits.

Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
---
 drivers/usb/host/xhci.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 02c9bfe21ae2..bc92edbad468 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2958,6 +2958,7 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
 	struct xhci_input_control_ctx *ctrl_ctx;
 	struct xhci_virt_device *virt_dev;
 	struct xhci_slot_ctx *slot_ctx;
+	u32 add_flags, drop_flags;
 
 	if (!command)
 		return -EINVAL;
@@ -2979,6 +2980,19 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
 		return -ENOMEM;
 	}
 
+	/*
+	 * For drop-only Configure Endpoint (add_flags == SLOT_FLAG
+	 * and drop_flags != 0), if vdev is already gone, there is no hardware
+	 * to configure. Return success early to avoid issuing pointless commands.
+	 */
+	add_flags = le32_to_cpu(ctrl_ctx->add_flags);
+	drop_flags = le32_to_cpu(ctrl_ctx->drop_flags);
+	if (!ctx_change && add_flags == SLOT_FLAG && drop_flags != 0 && !virt_dev) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		xhci_dbg(xhci, "skip drop-only Configure EP; vdev already freed\n");
+		return 0;
+	}
+
 	if ((xhci->quirks & XHCI_EP_LIMIT_QUIRK) &&
 			xhci_reserve_host_resources(xhci, ctrl_ctx)) {
 		spin_unlock_irqrestore(&xhci->lock, flags);
@@ -3082,12 +3096,27 @@ int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 	if (ret <= 0)
 		return ret;
 	xhci = hcd_to_xhci(hcd);
+
+	/*
+	 * If the slot is already disabled (slot_id == 0) or the vdev is gone,
+	 * we're in teardown. There's nothing to update in HW. Treat as success
+	 * and skip issuing Configure Endpoint command.
+	 */
+	if (!udev->slot_id) {
+		xhci_dbg(xhci, "Slot already disabled for udev %p\n", udev);
+		return 0;
+	}
+
+	virt_dev = xhci->devs[udev->slot_id];
+	if (!virt_dev) {
+		xhci_dbg(xhci, "virt_dev already freed for slot %d\n", udev->slot_id);
+		return 0;
+	}
 	if ((xhci->xhc_state & XHCI_STATE_DYING) ||
 		(xhci->xhc_state & XHCI_STATE_REMOVING))
 		return -ENODEV;
 
 	xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
-	virt_dev = xhci->devs[udev->slot_id];
 
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
-- 
2.34.1


