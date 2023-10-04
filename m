Return-Path: <linux-usb+bounces-1062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9557B780B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 08:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C85EF28143F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 06:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4F86130;
	Wed,  4 Oct 2023 06:41:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC5617F8
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 06:41:31 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EEC9E
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 23:41:29 -0700 (PDT)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231004064127epoutp03017f523af8f13c631b898df49764e993~K1FjJe1GZ0738307383epoutp038
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 06:41:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231004064127epoutp03017f523af8f13c631b898df49764e993~K1FjJe1GZ0738307383epoutp038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1696401687;
	bh=TF3JAYXwwdlRan+p3gCse0dQqiBOZBaFSyS6KqndTws=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DZyzGDISxXswJbOG+mFmKDVjt67XoDRiO/cDmQcKw8Si4Ff6oHVhTsucAKRyUDpHU
	 7yrPG9S6jr7hzANe7M3KZ8iymYpyC/PzXEHWkehHO15ffn6IojIRwxRKm4Y/hNfEOu
	 eWkMeJ06LQ+zd6yPcmkuH1pCsa1sPauSKZjW9YwM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20231004064127epcas1p49c12326c5b88beb34c1950e34a1b1ab0~K1Fi3SEfq0700607006epcas1p4g;
	Wed,  4 Oct 2023 06:41:27 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.226]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4S0lTL5N6pz4x9QJ; Wed,  4 Oct
	2023 06:41:26 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.47.18968.6190D156; Wed,  4 Oct 2023 15:41:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231004064125epcas1p2627219771c9af0e39e60bb77cb0288a8~K1Fhm4-HV2548425484epcas1p26;
	Wed,  4 Oct 2023 06:41:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231004064125epsmtrp2c11a905df8164d34ecc6905ff6d16bbc~K1FhmOlwp0200702007epsmtrp2p;
	Wed,  4 Oct 2023 06:41:25 +0000 (GMT)
X-AuditID: b6c32a4c-d19fe70000004a18-f6-651d0916c9af
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1E.CE.08742.5190D156; Wed,  4 Oct 2023 15:41:25 +0900 (KST)
Received: from U18PB1-1707.tn.corp.samsungelectronics.net (unknown
	[10.253.239.63]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231004064125epsmtip12c45cb027d9e9ad20309ad68ea312d7f~K1FhYhFGq1845618456epsmtip1P;
	Wed,  4 Oct 2023 06:41:25 +0000 (GMT)
From: Woo-kwang Lee <wookwang.lee@samsung.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, wookwang.lee@samsung.com, sj1557.seo@samsung.com
Subject: [PATCH v2] usb: core: add bos NULL pointer checking condition
Date: Wed,  4 Oct 2023 15:41:22 +0900
Message-Id: <20231004064122.18074-1-wookwang.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmrq4Yp2yqweuLbBbNi9ezWVzeNYfN
	YtGyVmaLLf+OsFos2PiI0eL3rjUsDmwe++euYffo27KK0ePzJrkA5qgGRpvEouSMzLJUhdS8
	5PyUzLx0W6XQEDddCyWFjPziElulaENDIz1DA3M9IyMjPVOjWCsjUyWFvMTcVFulCl2oXiWF
	ouQCoNrcymKgATmpelBxveLUvBSHrPxSkGP1ihNzi0vz0vWS83OVFMoSc0qBRijpJ3xjzNh7
	5RlzwUW+ikcbHjI3MM7h6WLk5JAQMJG4/u0caxcjF4eQwB5GiTctO9ggnE+MEts7pzFCON8Y
	JX7+7GWBafnXcQyqai+jxOLjP1kgnA4miad/HrCCVLEJ6El0HtvADmKLCMhJPLn9hxmkiFmg
	nVFid98hNpCEsICbxJkTv8FsFgFVibnXFjKD2LwCthJ/2j6wQ6yTl1i94QBYs4TAdHaJFa+2
	QiVcJL5t+gR1k7DEq+NboOJSEp/f7WWDaGhmlHh58xMLhNPDKHH84SYmiCpjiU+fPwO9xwF0
	k6bE+l36EGFFiZ2/5zKC2MwCfBLvvvawQsQFJU5f62YGKZcQ4JXoaBOCCKtJrD67iA3ClpH4
	9PgSlO0h0X67Dew2IYFYiTOvlrFOYJSbhbBsASPjKkap1ILi3PTUZMMCQ9281HLkuNvECE51
	Wj47GL+v/6t3iJGJg/EQowQHs5IIb3qDTKoQb0piZVVqUX58UWlOavEhxmRgCE5klhJNzgcm
	27ySeEMzM0sLSyMTQ2MzQ0PCwiaWBiZmRiYWxpbGZkrivDGf2lOEBNITS1KzU1MLUotgtjBx
	cEo1MG35ErmlnXXpVAvxzhptT5Mpt+dLVXzmE6vy8KhvSXqmdMXIRe/Nik1VnIsldUJKTZU2
	6nzfkXh21Vyly4tq5S93v5zjUOq5O0r7Z6X8dcVrNz4n/J1RtbA4aun5ryeLtrp5Xv7BZnVM
	NCG5c1HAkhe/41c1PWGcwH2j1cXDKXSNmEvF+bS/H69oTV5gfeRUx83tm1TC2FYuWbRTY/IH
	53Mf1wt6b5R60PdL8fTeQ3NNjnF23eNrXCbcvNs29fEXkVmCGw978x9nmlX2Z0JVbXrixW8c
	QQcOOF38qjDbt9hbuvJj4uPDYvLvI3+cTM5dWP1XuvH7qegdyx60pWY15V3bftVkgt7usp/F
	5T9bu9qVWIozEg21mIuKEwGbeXyTLAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPJMWRmVeSWpSXmKPExsWy7bCSnK4op2yqQdM/dYvmxevZLC7vmsNm
	sWhZK7PFln9HWC0WbHzEaPF71xoWBzaP/XPXsHv0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJX
	xt4rz5gLLvJVPNrwkLmBcQ5PFyMnh4SAicS/jmNsILaQwG5GiRerIiDiMhK7l/8BinMA2cIS
	hw8XdzFyAZW0MUlMW3SaGaSGTUBPovPYBnYQW0RATuLJ7T/MIEXMAr2MElOad4INFRZwkzhz
	4jeYzSKgKjH32kKwZl4BW4k/bR/YIZbJS6zecIB5AiPPAkaGVYySqQXFuem5xYYFhnmp5XrF
	ibnFpXnpesn5uZsYwWGipbmDcfuqD3qHGJk4GA8xSnAwK4nwpjfIpArxpiRWVqUW5ccXleak
	Fh9ilOZgURLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpg8uPZYxn4x9l6e6RKhuvUyTW2+gvn
	x/fMmzSzzGDx1/QGcRvZkwYnD+7UWRt85EWOqEnB6SecGY983Q4qVu9SvLRNrkjjyuMvx7qe
	LVA/IJYnZ62y/r98xefssPNM97ODp7UaT34W9fN21rHvhw12cMg6uJ9ee3TH2ocz3HdMvbTu
	WcjjuV8KQ0489pm485x6YZV9Z1P8v+W1nHHnej/vWCUx9eeaElVRi5uFHfn/fSovX3sxWSI8
	PWbpPOa4Sze01x+cum7+botX5wRV73le+qSv2H6laSGj0fWUU+unPnOZ2Kkmejjy2PF5syuK
	mxvCp4Rs4LSbtpaXeSNHYkFXGcemJG+pNqETctZNEqmsS5VYijMSDbWYi4oTAb0i+UmCAgAA
X-CMS-MailID: 20231004064125epcas1p2627219771c9af0e39e60bb77cb0288a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-ArchiveUser: EV
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231004064125epcas1p2627219771c9af0e39e60bb77cb0288a8
References: <CGME20231004064125epcas1p2627219771c9af0e39e60bb77cb0288a8@epcas1p2.samsung.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
Cc: stable@vger.kernel.org
Signed-off-by: Woo-kwang Lee <wookwang.lee@samsung.com>
---
v2:
 - Add Cc list.
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


