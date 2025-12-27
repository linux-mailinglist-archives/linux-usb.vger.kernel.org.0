Return-Path: <linux-usb+bounces-31782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46CCDFE06
	for <lists+linux-usb@lfdr.de>; Sat, 27 Dec 2025 15:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181363012259
	for <lists+linux-usb@lfdr.de>; Sat, 27 Dec 2025 14:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC8C21B9F5;
	Sat, 27 Dec 2025 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdbMrXp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmBTEieX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EBA17A31C
	for <linux-usb@vger.kernel.org>; Sat, 27 Dec 2025 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766847156; cv=none; b=O/URF4Rtc6jmt/CNRnISV23cT6er+Y9/f1/TwaTE6hFt1XuVR7KmFgMbkqbx57MGu30P8K9ICarbAtZQL9Qk4SBEvzLJiKMPSirlTp+Zvx+W3p3OuOBNMI2eX5QR95zZmPLhGyI9R0CjeIUSUqXIFPwZVi1P2h35TNu6TiHnHt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766847156; c=relaxed/simple;
	bh=QVwu/cly5PIg5l9ixNViMh4+cYAoXOja3oSlSRthxkI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZTvQBA0S0lZGAV3Jy8tJ6Af6mwhyGFeEZ4YrsMq+UWaCYFbb4BxULSLY0gm85AsxATOvNoKiyRYgIsGDy8TRaNJo7lMyImrHFaHkZgLqxDRuczc6Xxio5HVRRiOsogzk5/uUmyxhHw0/XpdjMBm5WTAfWFgn91J3xRroZrMmoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdbMrXp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmBTEieX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBnlMR4155515
	for <linux-usb@vger.kernel.org>; Sat, 27 Dec 2025 14:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AEWtHZcWLawGiNRhaHiYMPStvPGArMGlYGW
	jUW6JiB0=; b=NdbMrXp6on+oFdvplw2M0LMlsScb3nStqj8C8GYlh18B/Or+2Eh
	EiTuUct1sCeLfvD3XeNkwlVDC+F9OJo8Lkmc+iGu8IvF4xq6WIjeezrVwiwiCKKI
	31VUWP0HZ2eVRrw4d7ZLAMa12rV4bWsnnLvurOROMjJn+TPxJCN8Grobxcf+4kTt
	SSKqa0uZ/Z05eGQobb1IAHTyX08h4NzgDb2GJPUbPmW7oR8c1IjsNXse9iYmzTXL
	hmVWkVutMQ6n0ScdaPqVcxykZa1RZrqtr2/d83Yqsd66dqp0f6ndmirt9n8nRNM4
	cS8M3fJXCtBqx38HdQ+Jjn6XGwKPpD9lORQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87brncm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 27 Dec 2025 14:52:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so20074839b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 27 Dec 2025 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766847153; x=1767451953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEWtHZcWLawGiNRhaHiYMPStvPGArMGlYGWjUW6JiB0=;
        b=BmBTEieX3DR0HDoevRqdw/yyVhL9w3Hwq5rX3bEHS+oZUzjlFFS2bpRmQyjxi/jUCI
         FpO5y71Rj/gWvZg65N0KzTRtGMnJiVAsd2PLO3PL+jneUAHBeinKbrFGn7QehLEgN/X3
         h/6YT3nBW8cMaKvze/bypD0GGJUjaZreVoL7FL4lM0AnvpoXDdXFkLl8IG6NN4WMSOA6
         FaXCsqmXk2rh6RnmI95fsPXCUTpZ3/7RcrvJChhWW4HWpIBPjhqHEBP7WVQy+4ToUAjM
         uFedqwqB81lnlFS1Fa8RCh9ArT5kdXZoryuUJVZ+wRXG/8/nS5mZKGhKsqNNSm9UNtrg
         R+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766847153; x=1767451953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEWtHZcWLawGiNRhaHiYMPStvPGArMGlYGWjUW6JiB0=;
        b=b/OGl6YzI1PmrJEp+MN2w8v9gnC0ejhNymGids2JfSn2/kEV3nyg2a7vFlh1q3yc5g
         sJLOlswC6KdDXxOTzWgXP7STeZw/1Z72Grvw7N5TEJ1cDVI5vcLUz7P2Gs0dFgZ0HkFw
         OsiAaggYoLEjHOOBhIvEOLnQ2aMH47fj7RAs/npMY7iZ475wTh27n8ucjSFF33Kn7mDU
         a5rla+FL/vYDv1z5v9A9+X8BWqyP1nOM9uiWO2ccRriQeoHmcYizRf+winXQx9eP3oXJ
         DnrJBjDIoEdtupAyIbeIm7rNk3hownIXYWeO4LcGCLgfolGq3rL3YAuI9s8GDpxi7V2n
         o7DA==
X-Gm-Message-State: AOJu0YypDnrhcnEri1mvOua+vNy1YKf0em5plfoO3od7CHee/dmHblIp
	jW6NAg9cT1KWKqkwS7RkT/P/xOc8UzeYdl7Jdfh0nLaySUFzAKQ/UZyhwc4xVJHWafVozLxUHzw
	EKOHG2dUXz+I1zsAHpJA2cK+ukaaFsNHFGctve7yX99HncAlimwLWiFIDHRl2My4=
X-Gm-Gg: AY/fxX6OH9frWo3UdVUQ7Xphurp7LFDo9roNRAYq3iOSWY60W4KsuTWgI+Lehr+58Aw
	5dXyz2pQ1SucCGzY7rlv138o3uLhbwO3SqVCT15GiKPQu3RQhghC0RGSc4fJNVoHn01dNuHYO5G
	/oCFcQ+aSiijmviHWjM0fjFA9ZecfoGRqhisCexoSH42rxDnXb8LYT46h4DvTd/hqPsd+fsiGRe
	XwSTYyTxtz7jgPlnNrE1d0dsWeFAzymUTxi+y+8IRo8GjfhHzk+e3n9hkWZdNQxsqHAkQAN8+J5
	vRgxzchYkUnxeXWhxdlh/hCOlVEl91zzpB13e8dG1pYvNVLjAKixFwx/CwXONeVYj2vMGYzaOT6
	/lOz/D19vU2YuTQ7OkbUWq5I0theXXZeovdOtxoX6w0iljK0=
X-Received: by 2002:a05:6a00:4006:b0:7e8:450c:6196 with SMTP id d2e1a72fcca58-7ff66480856mr25050467b3a.45.1766847152779;
        Sat, 27 Dec 2025 06:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSfMKtxceN14N4MPlrZYOzEaI7Q7GksOqhJKTSN+nRa2lD1z1LjfzKg/21jcBUycRzSgSeUg==
X-Received: by 2002:a05:6a00:4006:b0:7e8:450c:6196 with SMTP id d2e1a72fcca58-7ff66480856mr25050455b3a.45.1766847152354;
        Sat, 27 Dec 2025 06:52:32 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a1a2asm24706340b3a.41.2025.12.27.06.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:52:31 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: gadget: f_sourcesink: Support maxburst configurability for bulk endpoints
Date: Sat, 27 Dec 2025 20:22:24 +0530
Message-Id: <20251227145224.2091397-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CpmCAYX4uxPkA9FG5srOsOKJrPnRQCZ7
X-Proofpoint-GUID: CpmCAYX4uxPkA9FG5srOsOKJrPnRQCZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE0MCBTYWx0ZWRfXxwtV6JSMGaUZ
 1B5x1GDbgjUou1nbWATG6xoj90vmpgtJlS9LBIU2MWtB3AXcSmmZtxc7VTIVkHxsHd38qHYRTtm
 gRSKvt02gJLGcciql72+DtcVbKPEujzK9cjkxdAuE9sA3yCTtNSzXaX7zNSWOnaewd8oiDpb84+
 oKivNkq+PMmaEOUR8m+4W+ZHKLVLzmbptC9fUsyoDAkN2TAtGyuhUDVK+YT0VSZ1DMkHUtYtdbn
 6MRoj8vQ6Gw1/imwQnHAiN3VN7jJnTDwfNPKtHYRFHymayMdY9Zeg/nI1a9vrFI6BMptlTr/S9C
 /FTZ0XIayuYaYf39jGF0rX/dsBFnjM0YUAnbUq8UKZct6Yl95r2/huUO4Wmx5y7k6jE7fvViLna
 GmdeMH34Wnk/XPSdGyQ26NUX5PCk0e7aJXJldVzu/M7lVOtlh4jofc4OszehWzf+wm33VmYvcmd
 KNB4Z+e7f36rOXjIraA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=694ff2b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UBjmvLYHQkscieVNT2UA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270140

Add support to configure maxburst via configfs for bulk endpoints.
Update gadget documentation describing the new configfs property.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Note:
- Verified by checking bulk ep descriptors on host after changing values
via configfs.
- Ignored two checkpatch errors complaining usage of "unsigned" instead of
"unsinged int". This was done to maintain consistency in declaration of
variables in structures.

 Documentation/usb/gadget-testing.rst       |  1 +
 drivers/usb/gadget/function/f_sourcesink.c | 52 ++++++++++++++++++++++
 drivers/usb/gadget/function/g_zero.h       |  1 +
 3 files changed, 54 insertions(+)

diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 5f90af1fb573..e32c5ad29e2d 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -686,6 +686,7 @@ The SOURCESINK function provides these attributes in its function directory:
 	isoc_mult	0..2 (hs/ss only)
 	isoc_maxburst	0..15 (ss only)
 	bulk_buflen	buffer length
+	bulk_maxburst	0..15 (ss only)
 	bulk_qlen	depth of queue for bulk
 	iso_qlen	depth of queue for iso
 	=============== ==================================
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index ec5fd25020fd..ca80b26e4fc9 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -46,6 +46,7 @@ struct f_sourcesink {
 	unsigned isoc_mult;
 	unsigned isoc_maxburst;
 	unsigned buflen;
+	unsigned bulk_maxburst;
 	unsigned bulk_qlen;
 	unsigned iso_qlen;
 };
@@ -328,6 +329,12 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
 	source_sink_intf_alt0.bInterfaceNumber = id;
 	source_sink_intf_alt1.bInterfaceNumber = id;
 
+	if (ss->bulk_maxburst > 15)
+		ss->bulk_maxburst = 15;
+
+	ss_source_comp_desc.bMaxBurst = ss->bulk_maxburst;
+	ss_sink_comp_desc.bMaxBurst = ss->bulk_maxburst;
+
 	/* allocate bulk endpoints */
 	ss->in_ep = usb_ep_autoconfig(cdev->gadget, &fs_source_desc);
 	if (!ss->in_ep) {
@@ -853,6 +860,7 @@ static struct usb_function *source_sink_alloc_func(
 	ss->isoc_mult = ss_opts->isoc_mult;
 	ss->isoc_maxburst = ss_opts->isoc_maxburst;
 	ss->buflen = ss_opts->bulk_buflen;
+	ss->bulk_maxburst = ss_opts->bulk_maxburst;
 	ss->bulk_qlen = ss_opts->bulk_qlen;
 	ss->iso_qlen = ss_opts->iso_qlen;
 
@@ -1101,6 +1109,49 @@ static ssize_t f_ss_opts_isoc_maxburst_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_ss_opts_, isoc_maxburst);
 
+static ssize_t f_ss_opts_bulk_maxburst_show(struct config_item *item, char *page)
+{
+	struct f_ss_opts *opts = to_f_ss_opts(item);
+	int result;
+
+	mutex_lock(&opts->lock);
+	result = sysfs_emit(page, "%u\n", opts->bulk_maxburst);
+	mutex_unlock(&opts->lock);
+
+	return result;
+}
+
+static ssize_t f_ss_opts_bulk_maxburst_store(struct config_item *item,
+					     const char *page, size_t len)
+{
+	struct f_ss_opts *opts = to_f_ss_opts(item);
+	int ret;
+	u8 num;
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto end;
+	}
+
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		goto end;
+
+	if (num > 15) {
+		ret = -EINVAL;
+		goto end;
+	}
+
+	opts->bulk_maxburst = num;
+	ret = len;
+end:
+	mutex_unlock(&opts->lock);
+	return ret;
+}
+
+CONFIGFS_ATTR(f_ss_opts_, bulk_maxburst);
+
 static ssize_t f_ss_opts_bulk_buflen_show(struct config_item *item, char *page)
 {
 	struct f_ss_opts *opts = to_f_ss_opts(item);
@@ -1222,6 +1273,7 @@ static struct configfs_attribute *ss_attrs[] = {
 	&f_ss_opts_attr_isoc_mult,
 	&f_ss_opts_attr_isoc_maxburst,
 	&f_ss_opts_attr_bulk_buflen,
+	&f_ss_opts_attr_bulk_maxburst,
 	&f_ss_opts_attr_bulk_qlen,
 	&f_ss_opts_attr_iso_qlen,
 	NULL,
diff --git a/drivers/usb/gadget/function/g_zero.h b/drivers/usb/gadget/function/g_zero.h
index 98b8462ad538..7bd66004821f 100644
--- a/drivers/usb/gadget/function/g_zero.h
+++ b/drivers/usb/gadget/function/g_zero.h
@@ -34,6 +34,7 @@ struct f_ss_opts {
 	unsigned isoc_mult;
 	unsigned isoc_maxburst;
 	unsigned bulk_buflen;
+	unsigned bulk_maxburst;
 	unsigned bulk_qlen;
 	unsigned iso_qlen;
 
-- 
2.34.1


