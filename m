Return-Path: <linux-usb+bounces-1060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8E7B77CD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 08:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 460CF281592
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 06:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EC15697;
	Wed,  4 Oct 2023 06:27:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013423C8
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 06:27:10 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3CBD8
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 23:27:05 -0700 (PDT)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231004062702epoutp012088394d1c8733442702ed8eb583d21b~K049XBKPK0722907229epoutp01X
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 06:27:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231004062702epoutp012088394d1c8733442702ed8eb583d21b~K049XBKPK0722907229epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1696400822;
	bh=s7oyeX/NDBMYZhgmHGE2LLyxIRmlD9XMyJ+CymvFogw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=TAV88mGyszkJj26RspJDPxkBJdELXmoGct9gYTsl+/I4D6VdxrT4+plxdaTgKbnwG
	 tKdVKBeEo2HgOf7ES5U8dC5hSphX2t99M3fn+7Bs1C/cn6WJl0sILp0+QQTJ+ootD/
	 6hGr/mMVGRvBwfxW5esjV2w6xHnA6bsd99uoWOq4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20231004062701epcas1p3342dd9e2b6f6d79ee2bb74d7876a1085~K048sGCeR2668626686epcas1p3j;
	Wed,  4 Oct 2023 06:27:01 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.242]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4S0l8j0h4bz4x9Q0; Wed,  4 Oct
	2023 06:27:01 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	7A.0E.08657.4B50D156; Wed,  4 Oct 2023 15:27:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20231004062700epcas1p16fe36bf6b6a6e5d9d4adeaef32937480~K047_nG-B3078430784epcas1p15;
	Wed,  4 Oct 2023 06:27:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231004062700epsmtrp29aeecab0f185e12b41c3bed880e86a75~K047986IA2550625506epsmtrp2u;
	Wed,  4 Oct 2023 06:27:00 +0000 (GMT)
X-AuditID: b6c32a33-d6281a80000021d1-64-651d05b40d80
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	12.BD.08788.4B50D156; Wed,  4 Oct 2023 15:27:00 +0900 (KST)
Received: from U18PB1-1707.tn.corp.samsungelectronics.net (unknown
	[10.253.239.63]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231004062700epsmtip1ba02c13ffb7b5373c5fa5f49766b8985~K0471D2nb3150231502epsmtip1b;
	Wed,  4 Oct 2023 06:27:00 +0000 (GMT)
From: Woo-kwang Lee <wookwang.lee@samsung.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, wookwang.lee@samsung.com, sj1557.seo@samsung.com
Subject: [PATCH] usb: core: add bos NULL pointer checking condition
Date: Wed,  4 Oct 2023 15:26:42 +0900
Message-Id: <20231004062642.16431-1-wookwang.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmnu5WVtlUg12nmCyaF69ns7i8aw6b
	xaJlrcwWW/4dYbVYsPERo8XvXWtYHNg89s9dw+7Rt2UVo8fnTXIBzFENjDaJRckZmWWpCql5
	yfkpmXnptkqhIW66FkoKGfnFJbZK0YaGRnqGBuZ6RkZGeqZGsVZGpkoKeYm5qbZKFbpQvUoK
	RckFQLW5lcVAA3JS9aDiesWpeSkOWfmlIMfqFSfmFpfmpesl5+cqKZQl5pQCjVDST/jGmDH/
	9Gfmgll8FXveTmRuYPzE3cXIySEhYCJxq2k/cxcjF4eQwA5GidXH5kE5nxglJrztZgepEhL4
	xiix/aY8TMf/e4tYIYr2Mkp8bzgN1dHBJNF9cwojSBWbgJ5E57ENYN0iAnIST27/AStiFmhn
	lNjdd4gNJCEs4Cyx4Np1JhCbRUBVYsO8yWBxXgFbib61/9kh1slLrN5wAKxZQmA6u0TDvQNs
	EAkXiZfLXrNC2MISr45vgWqQkvj8bi8bREMzo8TLm59YIJweRonjDzcxQVQZS3z6/BnoVg6g
	mzQl1u/ShwgrSuz8PRfsBWYBPol3X3ugFghKnL7WzQxSLiHAK9HRJgQRVpNYfXYR1D0yEp8e
	X4KyPSSWHbgLDbtYieM9m9gmMMrNQli2gJFxFaNYakFxbnpqsmGBIXK0bWIEJzgt4x2Ml+f/
	0zvEyMTBeIhRgoNZSYQ3vUEmVYg3JbGyKrUoP76oNCe1+BBjMjD0JjJLiSbnA1NsXkm8oZmZ
	pYWlkYmhsZmhIWFhE0sDEzMjEwtjS2MzJXFexQmzU4QE0hNLUrNTUwtSi2C2MHFwSjUwBcyd
	t34Xc2plx/7I2T7CvJLHjwRf2PemfNLFwA6/5J4nHTHXmvMW8ip/Ohr2Kqno+eONAltn7lPq
	eHxz9j/n3fyTzdbLM4aUyXmcVFLekCjxctsrl/cLDI16Lx+43sAq07zhQuKBJ15vpvz42d29
	ftXU+fInRVR/2SUEsOzf6bxtf93qtty4HqkZ8r0b9a/EFQf8uOa2f3rL+ukW3ImmQQZGmS6P
	/ZyWnTf1fM8d+2pzoXulmVjTq92HMn8kON5Sko3TXiLA0qX4qLn/tsr/G/aPJ3da8Zgmur3Y
	EDHn0Zar9zSO7WYsPrrz97+v3ncWFDJoOltZzhUy/+s99cuS1ZJTrgR82+U0z77nteCi20os
	xRmJhlrMRcWJALPjACQnBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAJMWRmVeSWpSXmKPExsWy7bCSnO4WVtlUg5uPtSyaF69ns7i8aw6b
	xaJlrcwWW/4dYbVYsPERo8XvXWtYHNg89s9dw+7Rt2UVo8fnTXIBzFFcNimpOZllqUX6dglc
	GfNPf2YumMVXseftROYGxk/cXYycHBICJhL/7y1i7WLk4hAS2M0o8XdTAztEQkZi9/I/bF2M
	HEC2sMThw8UQNW1MEtN3bWUEqWET0JPoPLYBrF5EQE7iye0/zCBFzAK9jBJTmneygSSEBZwl
	Fly7zgRiswioSmyYNxkszitgK9G39j/UMnmJ1RsOME9g5FnAyLCKUTK1oDg3PbfYsMAoL7Vc
	rzgxt7g0L10vOT93EyM4ULS0djDuWfVB7xAjEwfjIUYJDmYlEd70BplUId6UxMqq1KL8+KLS
	nNTiQ4zSHCxK4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpiyZJwKPk9W4VX2fqq6ZpuJkaA4
	n23OftFP310OPmW6Ml3+ZO0mvitdXpLusl6yhyNeWXGczzzTrqS7Ma82nsP9yq0txtKhzXa8
	pzj3vFs+iz/SoJPvVHyL9koXi0cuL+Z63lht5qTfuGrfBfVEzaPM152uKn9dopzSqh/Cvjqg
	WbjzmprgZrsfom9WbOfW/hu9xfHdecWYLeXcIS6a/XIWt4Nvxyz2b3l0QPvKO8Peh/MWZmYt
	OHDeMf7k1JzmJ/dfVEhbip6ZwmRhp/jn0hPmTW6FrCva+C6e+pzI4Cqz+L/e1tNrUq9zOSwJ
	PWu8qi5oblNgu/2jiZP/N09XtmnfxGmu12lR4Gn3mvnUTSWW4oxEQy3mouJEAP+mIN2DAgAA
X-CMS-MailID: 20231004062700epcas1p16fe36bf6b6a6e5d9d4adeaef32937480
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-ArchiveUser: EV
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231004062700epcas1p16fe36bf6b6a6e5d9d4adeaef32937480
References: <CGME20231004062700epcas1p16fe36bf6b6a6e5d9d4adeaef32937480@epcas1p1.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

This issue occurs when connecting Galaxy S22 and abnormal SEC Dex Adapter.
When the abnormal adapter is connected, kernel panic always occurs after a
few seconds.
This occurs due to unable to get BOS descriptor, usb_release_bos_descriptor
set dev->bos = NULL.

- usb_reset_and_verify_device
  - hub_port_init
  - usb_release_bos_descriptor
    - dev->bos = NULL;

hub_port_connect_change() calls portspeed(), and portspeed() calls hub_is_s
uperspeedplus().
Finally, hub_is_superspeedplus() calls hdev->bos->ssp_cap.
It needs to check hdev->bos is NULL to prevent a kernel panic.

usb 3-1: new SuperSpeed Gen 1 USB device number 16 using xhci-hcd-exynos
usb 3-1: unable to get BOS descriptor set
usb 3-1: Product: USB3.0 Hub
Unable to handle kernel NULL pointer dereference at virtual address 0000018

Call trace:
 hub_port_connect_change+0x8c/0x538
 port_event+0x244/0x764
 hub_event+0x158/0x474
 process_one_work+0x204/0x550
 worker_thread+0x28c/0x580
 kthread+0x13c/0x178
 ret_from_fork+0x10/0x30

- hub_port_connect_change
  - portspeed
    - hub_is_superspeedplus

Fixes: 0cdd49a1d1a4 ("usb: Support USB 3.1 extended port status request")
Signed-off-by: Woo-kwang Lee <wookwang.lee@samsung.com>
---
 drivers/usb/core/hub.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 73f4482d833a..cc0c994e19e5 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -139,6 +139,8 @@ static inline int hub_is_superspeed(struct usb_device *hdev)
 
 static inline int hub_is_superspeedplus(struct usb_device *hdev)
 {
+	if (!hdev->bos)
+		return 0;
 	return (hdev->descriptor.bDeviceProtocol == USB_HUB_PR_SS &&
 		le16_to_cpu(hdev->descriptor.bcdUSB) >= 0x0310 &&
 		hdev->bos->ssp_cap);
-- 
2.17.1


