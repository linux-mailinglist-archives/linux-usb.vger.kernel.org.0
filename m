Return-Path: <linux-usb+bounces-23300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C59A96603
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 12:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F5B93AC208
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547FF1D61A3;
	Tue, 22 Apr 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpLwoBUw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5625320B7FE
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317968; cv=none; b=VIdKPLA5HbJaxpVW8dzyRBHcLsJsmyh6LDmQj50xiu2n8Eo+foDpl3DWtY5a0j7MIoSXoTQ5XMjrC3qgTFz2eoVzGlVhohmS4ODgWxvFpb3eb9J6UDeGr6HmCbzYsZE3nv395tlBNY385XvkaxIUkPoMFQHkXzL4CCzPgAVg2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317968; c=relaxed/simple;
	bh=p27y9NFMXzVvj00e8ZA7+IGcsY4E7svOnJQzifljnL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOeHH/4I37Nc6WIN35LahuYnleYbGrSk5aLIUSHUaskhfT/6Awd3MXw/0qjGGaCd7PfXPlDydse7E9t93gt8agW1jiTnNspYbCb7QUiwxXnkQTB15T0VhJIU/pcXkZhjDYO9Vt4VDsjkZkZ8333Pfb0W8xOoW9K+ZTFwUajQ21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpLwoBUw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4PDgu024801
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lpT545Y/gOY
	A7sVvZRT5W/scaeQvyDclWBr3nb3bgNI=; b=mpLwoBUwiIBnfHKPY7/AFp8LVW3
	Auu1NKKO9gBXyhDman87Bsvst2mjZbgH92mHmQuIwnaOV9gtF91SMVMfsBg8Pe5Y
	3YTUQW3JP3AmwXl5t4eJC+YS2Qd9yRGbv7BtXUPUHrKzFB0yPiJQVQE8XpBeznlh
	hLzXqP7xzsCsMSNh10uZOBW1aHuHR82R8Uh5CFyb0QnzL4QJ2SPgKX3UD9h8CQzT
	d2Y1YceSY8jP1xIWslfGlohzBz+jmkTgaLjcYZfCVZmR0pRPuy1USE8NBkLDxAt5
	6ainCqdpquAVU7RxLv3+F9Sc5fa+RKiff+JOY/+Zvv7qQ3OTfRI4iAXzNWA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwq7ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:32:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739525d4d7bso3943676b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 03:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317964; x=1745922764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpT545Y/gOYA7sVvZRT5W/scaeQvyDclWBr3nb3bgNI=;
        b=vD5vMRk1MBwAd2tinZ0bIi5UFjGaI/MPrUm80Vl5Scd4NIYCP9CPy77PoTKXjDAJh5
         ycuHrsYWrvdYTytA9wCXt5pQQN0P8REKbpqFZIEO2CaEPlyLoZUCdvRe19udctlmkuzA
         8iqEOeV5jtUI4k+G7hMAZlYY+l9hcQBk/AWLNtQB9YTk08rsFdPVM6jbg6DKszrl/jvY
         oRXLGmG5606tb1q2tkeIEFcUnzRlz8FJjodXP11jRYRzH/ye9l+dTG3QRa05vxfgFLvl
         Ut5GUQIMNovthJUPLCgitPLoXPFvf8OwDK7QepWqRB8JbAKsLvrFJyVrOE2Qf6PUiNQY
         jrrQ==
X-Gm-Message-State: AOJu0Yy3lRkAcW0KaMqr/ElQ/fzyqE8eNJVtfrIsSl5Q4gCPTMjfcisx
	MGVPERLyvXXc7+nxSFV6Zwar156Ls1Bejgyfj+RCnXlh3S3gQ7OFjvcevq/RJzV9LyKiXAz4oX9
	Ha7BvZxBlhkkblM7AOPEye3vp5bORGDJdUTGfvzm2+3IC04vTHu/rdwWesv4=
X-Gm-Gg: ASbGncv87wSmcXlgWjdrw7dVNLVonTYKBqgm5Ev5Y06dSsdpxlycR8b/fs3ZganPb3s
	q8zrgV4aFqoMW3kvBr4WPh8LLAA3t4yqAE5JPlYdrYVqztoUzPNfUPhsdO9reDkiMRo3yS18nwo
	YRNYqgoL8QRy1ZpI7aOeyV3GqKIlYMafRMBF2KE2jVF3pjcW/tMyyieyf2Tvaslui60gwI2H3vn
	6nk3E3ont9lqFuvixO0wsc5dvJOtp/pDb1lHvKjzkYEJ91FKjpj5Xd58SZvPx5Z5S7rAqbASrJm
	uIYQcc7+6PB/kugVXE0NZNv6X1iqUEMQZwVyZEXt
X-Received: by 2002:a05:6a00:14c6:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-73dc118f8e9mr19677453b3a.0.1745317964427;
        Tue, 22 Apr 2025 03:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRWf0lx18yKey+Dgn5Q3XgsBWDvoSeOATiYIf/l2yJT5PB6Phu4kV78DU3R7y2nqx1MOLnHQ==
X-Received: by 2002:a05:6a00:14c6:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-73dc118f8e9mr19677425b3a.0.1745317964048;
        Tue, 22 Apr 2025 03:32:44 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:43 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v2 2/3] usb: gadget: Use get_status callback to set remote wakeup capability
Date: Tue, 22 Apr 2025 16:02:30 +0530
Message-Id: <20250422103231.1954387-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6807704d cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fe4CDuQzCUjxA5onUuAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Zxs0sAZeaNyrst-qdtV9-tH9dOcCY82N
X-Proofpoint-ORIG-GUID: Zxs0sAZeaNyrst-qdtV9-tH9dOcCY82N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220079

Currently when the host sends GET_STATUS request for an interface,
we use get_status callbacks to set/clear remote wakeup capability
of that interface. And if get_status callback isn't present for
that interface, then we assume its remote wakeup capability based
on bmAttributes.

Now consider a scenario, where we have a USB configuration with
multiple interfaces (say ECM + ADB), here ECM is remote wakeup
capable and as of now ADB isn't. And bmAttributes will indicate
the device as wakeup capable. With the current implementation,
when host sends GET_STATUS request for both interfaces, we will
set FUNC_RW_CAP for both. This results in USB3 CV Chapter 9.15
(Function Remote Wakeup Test) failures as host expects remote
wakeup from both interfaces.

The above scenario is just an example, and the failure can be
observed if we use configuration with any interface except ECM.
Hence avoid configuring remote wakeup capability from composite
driver based on bmAttributes, instead use get_status callbacks
and let the function drivers decide this.

Cc: stable@kernel.org
Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/composite.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 869ad99afb48..8dbc132a505e 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2011,15 +2011,13 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 
 		if (f->get_status) {
 			status = f->get_status(f);
+
 			if (status < 0)
 				break;
-		} else {
-			/* Set D0 and D1 bits based on func wakeup capability */
-			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP) {
-				status |= USB_INTRF_STAT_FUNC_RW_CAP;
-				if (f->func_wakeup_armed)
-					status |= USB_INTRF_STAT_FUNC_RW;
-			}
+
+			/* if D5 is not set, then device is not wakeup capable */
+			if (!(f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP))
+				status &= ~(USB_INTRF_STAT_FUNC_RW_CAP | USB_INTRF_STAT_FUNC_RW);
 		}
 
 		put_unaligned_le16(status & 0x0000ffff, req->buf);
-- 
2.25.1


