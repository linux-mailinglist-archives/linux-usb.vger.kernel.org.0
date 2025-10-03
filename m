Return-Path: <linux-usb+bounces-28878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2739BB5AA4
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 02:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A661E3BBA6F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 00:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F44A7261C;
	Fri,  3 Oct 2025 00:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dng5Vfrz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37962E403
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759450851; cv=none; b=IKzSviDQOWfTkxo3NTD679+CR99FxUri8aP+mYslq5SvALbNsoMJ/fds2dekWRQiHntWOPfUC7qCDUM7W1nOIPYBNFOxvXFzchzOMTvm6mfa2Hasf4gxy4lBxD69wI8oXbHRjrsX6I3+SSAsiZWBbQ8P6SzXWzMYr6trsK45J/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759450851; c=relaxed/simple;
	bh=A52ROh/Md8E/l7pDVKt3JwMJSU6DehcWufqvmQgZXsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mJwAhvlVS5nBDmg06BEeGKWjBsIRmujjwB/NPtLMi+l+qOqF+iYpLTPr4NZZhwbTek/qEOof8xO6BXLWI2zeBUKtLewiMfkbzak08DNHFmYyNXH/5V4DnLcBd7AMEi4zX1fPf7V2rLIEPrZkc9IcfWmR0xQcQbeaaTj6NwaDVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dng5Vfrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592Lg6gS000949
	for <linux-usb@vger.kernel.org>; Fri, 3 Oct 2025 00:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBL+fRZoVJd
	0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=; b=Dng5Vfrz494jZHTgR8f/P3BkXuk
	V6z0Jk+XTkJLBboZyRBFVyu+/RfRHFt7hT3hXLYRQ3xE9s8eUJ2gXuheRmu7fIz1
	p7FtZtpFdlmeIRGBBlQj4avXVIuqz5fKIlQ6thdmnlQQGRRYTYL41VrLjo7eVNmb
	Y8EyN0C5Zx1k42oo8dSzVYHFD+EpNBxOe0RdoqNmz4gCceKNMmiggvbmqfVRB8vQ
	7MM1e2JVz0eG0uYqUti8lXDpqs04lLr54ogep9zow3/2xyC9fyWsOv527J/x0oY3
	fAIU4GGg5LRHacKraNByNLER8LFS/Z+r6XL9EjZ9Y24zOwBRDSq++efEh8w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x61gq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 03 Oct 2025 00:20:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so2802845b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 17:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759450848; x=1760055648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBL+fRZoVJd0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=;
        b=ut3MjfvSsv3qkEyVgnwuDI5l4CsMwvmrDbI+rChc5CER9HnHMa/uS8UL0ca24cdraK
         erIwyGLg2NPLNbFw4Y7MJSQEQIDmait2N4wsq9pcuXmt7lE+wbaKVCUSIapqECLsSD6T
         Xz9omCy75yFs3+2hL+VHHnUnvmkf3fRfmVJXtL79aTMwmZIoFTA+UUf37I6+AcsF4RrO
         s05OyB+X+LLDRwrYarcOMsF6OoDRBmhEzAmLDqO9xgjxp4umMIQ3RgAeO/73kplRQnDi
         2UYWtg5B62beN41l9LqOfOoE/zUspmMjrPD7QqcEfyqeYlUfeU4jBsRmmsnJH7px8aPt
         XuxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsHVsAB7EFCs280VX7sH5FAeuwLcN7+eb0g/a05HGFwOSSuj1J+2soMUmrZ/Q4PT9QO8iv5iwnC/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZflcWgZFtDwssWJyq1+G+1FF2wdFHTYYrx+xcXv3tWfNPqTa5
	9GWffxRsEXUwkoD/F6DZK/nS8TMCLCAuE+BoT433NLqRqQJiHSy7TN0IzPdS0IDSaH6Uy3pMT6l
	XnB85IkrSSb6mM9jUcbEh6b15BrUUgx86d+FNmY9t9jdlluW6A2zST+gJbM3TSV4=
X-Gm-Gg: ASbGncuc7JJPPgPVJuKRJVXWp5iXLeaaPPWo2Nzibmo+4ywI1FQeIAmsMuPdLLWeMj8
	HIC9buFDGVVMxMhYVoiv1gReJ1OxKGPbL8XJIl4TEBOhea5HtO1WCKokyk7+jGjcXrMxw9lPqB8
	ribkna6o6tdKWq3Jh76lSGzba/3BvyHbTUjoz4Sb2tEkWnal4scKafK2IoRh22XwYKJhrKs9DgX
	JWmOtwNUtQJDqIhzaqFVe8KlpTGod4LSctoXP6lltTlf+sUU9Uffkv7Gs1UjE9ropsHk+GCLZcc
	iIzUdU2W00krJquM+GECBcr8uI902rbvaMA863YDZJubeIDVTFEldeqlR6mlsqZJFymHXPSVFMc
	z+Zd6t/znYIffEyF6wwHdY5LrxqRndqTP
X-Received: by 2002:a05:6a00:3991:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-78c98cad84bmr1743826b3a.18.1759450847699;
        Thu, 02 Oct 2025 17:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzrJ1TUQnXO5ZzMDLySuam5se1Et+TpMerKKnyr5XaAUqjom5zSs4tikKzGJr9VdCSccGBpA==
X-Received: by 2002:a05:6a00:3991:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-78c98cad84bmr1743803b3a.18.1759450847258;
        Thu, 02 Oct 2025 17:20:47 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a3f1sm3128632b3a.12.2025.10.02.17.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 17:20:46 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Thu,  2 Oct 2025 17:20:43 -0700
Message-Id: <20251003002044.2944497-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
References: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kwEBMRy0pJ-1GkDlwe4XA9eDnCJHcb1g
X-Proofpoint-ORIG-GUID: kwEBMRy0pJ-1GkDlwe4XA9eDnCJHcb1g
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68df16e0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=OI1EoHIFZYFGuZb9aTAA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX0g9Ljvst0BpA
 Qvf+ptGM2hh875TcVUMrO5wvbLKCX3IozNBqCB4KBh5mtcZntGbghsIdL+Y9GlxmBQCXjv3si5d
 7WBmaD0qnWpqyTl9ND2iuB+5cNHxYbTW8VHJSbKFpAiRIObzPetGhvsGXbRvqMvWiAQWffOKeqh
 fhJX5nhuUR5GJjJi2jq6BPr93yVuRP7xohxT817wissRQpvcQOqTUYBK+qOPJrPAZQEcPPaMCNK
 L3ULM+C0RRR8lrjAF0lDjOkN+6TjhmukbBko7IeN0V0EPaukvZJG9C2adb8P6S6Y+OXM7G95hhz
 B1yFEjv1Cizl/TRwiBJ4gbcdLGee1n3H0Y7gGkbPwriud8HbvDNROINQ+Ltrpwu7OH8anndixrN
 YnpEZTxyLMkGdGLjDOsJcdFtPR3X4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Update the ucsi request/response buffers to be packed to ensure there
are no "holes" in memory while we read/write these structs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..1f9f0d942c1a 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -30,24 +30,24 @@ struct ucsi_read_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 };
 
-struct ucsi_read_buf_resp_msg {
+struct __packed ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     ret_code;
 };
 
-struct ucsi_write_buf_req_msg {
+struct __packed ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     reserved;
 };
 
-struct ucsi_write_buf_resp_msg {
+struct __packed ucsi_write_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     ret_code;
 };
 
-struct ucsi_notify_ind_msg {
+struct __packed ucsi_notify_ind_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     notification;
 	u32                     receiver;
-- 
2.34.1


