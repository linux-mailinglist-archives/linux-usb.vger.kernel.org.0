Return-Path: <linux-usb+bounces-30936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC9C882D6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 06:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 186633538FA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 05:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA0631281F;
	Wed, 26 Nov 2025 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZbjw/3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="euxKxTDf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ABE2236F2
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 05:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135753; cv=none; b=b3hOtxCKWT5nA2yXUjRLUyXknY5ObeA7v8YYQ3/9X3sedWy6bNLl73kap8l+LcFZwFTdqnLEcQf6AOY+ZB/z6irRs2gP7BO2A8G/5G5YaLgBZKi57RqDnp7k+aavHIU87yr9qzTOwfWOj+/V9PTF7wf9wzWy9u0b1kB2bJdQR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135753; c=relaxed/simple;
	bh=ZSGldPpQdBPeyeRPvxMinYAqNZms8SedzpBSMlb71HE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PI3cDBwzZxNR3G64OBKVP9uYD9ZNK3pJCDDdvlzhQa5aXn525uDoU5eBxqvusQzS2zgXF3zqrjSvLy8iXnTzsRJ5UxqZggcttdUzFt2DXFLAT9sBKY2JcjeakPhlqD45L0jCjHD+nn/wSHXPNUPMqeej99f0D3vRZaxt673EYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZbjw/3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=euxKxTDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APIkX8x2659967
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 05:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c5wgl6eITJ72vHqJebcqGjx0u//2f1FOVM5
	I9mWULoU=; b=nZbjw/3hvz+mOK0vKXZI4E1sC73al+Bf4UxEh8Pv3QOPpQqP3nc
	I4Eccng1gU1XN4K0DlY4WeGPH4MnKflF0H+Yw16mMrahQ4nAWJ80GbM2rSg8b1o0
	cIdKxFIytCp0KxbU/zIysqr4wXCc4mXey81wK9qCyBoLFHCyiH/9ckfNDzqPJfmn
	Xr0IbDqbqIGSt2UvV0q3SsaElef7YTLHEfoXs4WHBMD00XiFLKtdtg0B0voT5O5c
	qj4QfyvUs/TakcbTT91fIvAtwRNw67niYwmLYDPZttHzKDglWVvqlmsAt9vAgjRa
	gw/EdVsnBWZX/pjtd7htb6KlMXxlm7ts4Qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xaw3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 05:42:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f3710070so149902015ad.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 21:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764135750; x=1764740550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5wgl6eITJ72vHqJebcqGjx0u//2f1FOVM5I9mWULoU=;
        b=euxKxTDfXta63r9zWU97m5I+BPzaWZL8RnMYsRNKndF2FjVfL5QRxDsfwWE6jqsKA7
         i5HL9Df7gvNSiJkH06KZ+3T4DXtNs1u+vdee19Gzb6KMrPGnllhGJCsUmNw7a537V8Ji
         976ipR3Qn/PCtqGu5VcMIhTyFaj6HV2kKF/82SnHmCoeW29ITuXN2nVdwEl19J6uO/ko
         HZKax896s2li+XBXIV3rmXPLxrSLlBi9gahueAmqZIJ/zZeP5ZGwhWMBGgClr45mS0pZ
         pHXEyX4LfdvalYQiu5TtqM6RA/CyXef2wjCdOL4UVTJWF2RTnoo73P3aYFHjoPowbbnw
         lOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135750; x=1764740550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5wgl6eITJ72vHqJebcqGjx0u//2f1FOVM5I9mWULoU=;
        b=JsYVmmRPS/TL96chGzkgyuo6GRVNjz3q2strNlpOziJfPwbSTcvFrJ+z6m6RdOunrE
         cUFv28u5oNcEt/hAch7AaEPw8vZ+YvGhlt0oCqy680resOcdVvN5MaeoRFu07yhlLcs4
         NdiHeSTv6ESsbywjD+x4v+yelqjPGM6u5YaTKgFzJQIjAb5ICEDJ+LKElUdwCPM61JPV
         6mp2o3OKFw5VKNuM/ZhdYHzJFucHnICoCz3+pI/BKha+zoLHdCFfkMgjlVeOzuBUY9wt
         R5oTE5Si6Ob8lQZSwgLNzrit2BazJLf11So5+Ul1ev6otaWxqpCmWNWcLHg+c04tHANK
         ZUpg==
X-Gm-Message-State: AOJu0Yzc/CArFb7c+d4Rc886Mpiya+dZ3+g8qWcPb5cW2W0noZ9y9AKt
	iSTW7ITqN7Sbw7s8J2jhHESQEHqmepTx1Dh//laMWJRVbspOABa9eqhZ6OdmwsGo47ZYyTof1QC
	WGpXSDhckpm29Za5GzPdPJYEOKn7+KIz1+jY/gY+ZBeZpQgxHiqmfHsnpjnUdBNU=
X-Gm-Gg: ASbGncsqpFi9/TPikuXg6Poa9Ibt402StSKRD9vizy2JiULGa3G8OH3Mf/JeUbPRe8F
	2ZdZfOR686QgF0HUAotdPpANxMQDZ4RsdXfFlLzz7I4AghahRuoi3bh8++DKLdYj9wKybMdUtNv
	tNb+QCb4kprj4Od0X3QhDGK/uLdx1KNVypn30B0rXAtSe5iRO55eA2EGzKqJbLHGg5yqePdydul
	zIvjFm8v+bNnN3K/aQzsOniVHSRk4hj90ji4mhOyRlwCZyOHM5pX6hMewM8YpyxAXeIKp0fIZy0
	ONSPYyavI2SJlGmv041WiFdS0u0qu0B+yPWlZ+9Og/48Mg8rMwIGvu4zKVn8B7L95mEnUwhQElj
	pDKSmbrmhoxIYw4VcJBIs0tm1vj7SYHEw+1KIvtcAJqwB
X-Received: by 2002:a17:902:e545:b0:295:8c80:fb94 with SMTP id d9443c01a7336-29b6c6f1516mr186031295ad.59.1764135750476;
        Tue, 25 Nov 2025 21:42:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJJhXiScgCSr/ZzsfIwxpspEZaHpOeDfSLmXRjvd77UkstRH1vhvctykC6KseW7LJ4BjfKjw==
X-Received: by 2002:a17:902:e545:b0:295:8c80:fb94 with SMTP id d9443c01a7336-29b6c6f1516mr186031065ad.59.1764135750046;
        Tue, 25 Nov 2025 21:42:30 -0800 (PST)
Received: from hu-ugoswami-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fed2sm187048575ad.69.2025.11.25.21.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:42:29 -0800 (PST)
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: keep susphy enabled during exit to avoid controller faults
Date: Wed, 26 Nov 2025 11:12:21 +0530
Message-Id: <20251126054221.120638-1-udipto.goswami@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZOu0oAonoqVAkvtnih44FPN8KXTEOY1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0NCBTYWx0ZWRfX0msWB0iN3XPA
 c5D2cyCcbc6HKN9XAvsvHkWhA1PI3QsmFH5JYKRutXEmhBS0lquoBequFKJ/O/TGNG1NgBoGp5Z
 fn9gLYNfTMDzx4QVH8ZIbTIEOr6KJvoAilo2wwejixXZlO76X6SebMK9XyTqWNs45g3pS1WUh7Q
 I23hxbZXU2wMUdq78lxUustwVy4kXPXUOqoQ2jeffKRMiT8bZ3ZJTxbbW7prKh6WHCmOM3Lpbfx
 dkev9UUYXAfxh0V0IJWIA5+O0U7nMvQsGpz8fWj4ADRUBOauPWs3j4FoIMyYZ5sqOEmLi90HQ4m
 pWNjbfGj2AFmInWwo7/7PXoaAhD3RGL+G+qY0a8+nd41YzEAKJRT/1TeuyML8sSU6m3CdlQ6F3f
 F7HqQ+GHKCp7+riHUiL10JqVv/y8rQ==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69269347 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=Ge-yWl1-5HWGKH8EmegA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ZOu0oAonoqVAkvtnih44FPN8KXTEOY1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260044

On some platforms, switching USB roles from host to device can trigger
controller faults due to premature PHY power-down. This occurs when the
PHY is disabled too early during teardown, causing synchronization
issues between the PHY and controller.

Keep susphy enabled during dwc3_host_exit() and dwc3_gadget_exit()
ensures the PHY remains in a low-power state capable of handling
required commands during role switch.

Cc: stable@vger.kernel.org
Fixes: 6d735722063a ("usb: dwc3: core: Prevent phy suspend during init")
Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 drivers/usb/dwc3/host.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 321361288935..34c5a4de612e 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4804,7 +4804,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	if (!dwc->gadget)
 		return;
 
-	dwc3_enable_susphy(dwc, false);
+	dwc3_enable_susphy(dwc, true);
 	usb_del_gadget(dwc->gadget);
 	dwc3_gadget_free_endpoints(dwc);
 	usb_put_gadget(dwc->gadget);
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 1c513bf8002e..0c171118bd55 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -223,7 +223,7 @@ void dwc3_host_exit(struct dwc3 *dwc)
 	if (dwc->sys_wakeup)
 		device_init_wakeup(&dwc->xhci->dev, false);
 
-	dwc3_enable_susphy(dwc, false);
+	dwc3_enable_susphy(dwc, true);
 	platform_device_unregister(dwc->xhci);
 	dwc->xhci = NULL;
 }
-- 
2.34.1


