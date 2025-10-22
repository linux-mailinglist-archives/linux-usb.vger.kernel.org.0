Return-Path: <linux-usb+bounces-29503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B20BF9823
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 02:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5805E4F9375
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 00:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4508E1D63C7;
	Wed, 22 Oct 2025 00:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7pNnJMe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E718B0F
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093961; cv=none; b=eI5hSSZSNiBjZazyhsct3z3kRZDxRAX+7bkMa8Wqh7rXHE87qMEmX158nq05Rn/DUb1sdDjU5UvcTGaRmoJSSuovn3eL79kx91qzIKid2SbGS1+TfGglZE5wI4RUmfSl45RsOcrTWlRx42D6/WOe7OhMx8tDzW6gZnFfDTLnXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093961; c=relaxed/simple;
	bh=A52ROh/Md8E/l7pDVKt3JwMJSU6DehcWufqvmQgZXsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VU6nMjfSRsCXE3tDh4pfDAw0uHt/bGJPsL65Dpn9vbFTzJOR2fx7g5Qxi89tn2eWBtT+H2di06Mtk5hYwiqOiflccoEhszABXICZAvS+ZGM3VRA7najN+neSK+bBkzbTDNjrTxjvCpv7oeV9BfElKsg2xV2oLqOvlHU8lOqdjWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7pNnJMe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LNHLVN006339
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBL+fRZoVJd
	0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=; b=e7pNnJMekYEGtkXQbHG8yk4j2OE
	h+Osd2AsyklSBeAj8uCAiHKEnqNauHA+jQByDH0WcnoLATdtHBdqZq5TaB4QcYeG
	cl2VLu+6ZLbhYoSUcEIdRNq7WgIHv+007Y/ZGYRnIlSZ5JJm4eIZq2omiCAhVmbI
	L0GynrSdApOPWuRWHFmhs+112wmu+rlYjX/wluDYm5KW133YHhqYUMcSKosgr+V9
	kh83px9RK8JeF4RdD7hTyzpakwlQGq5CGGj+N3cwSpN5CLQQBITeyt59Ccgl4PxV
	JPANh07pkRADMHmleZDlmbIXDaVZeQfqEk8IrW5UQUDlfzFgtlLyD/nP7Nw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkps85ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:45:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290b13c5877so125109825ad.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 17:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761093958; x=1761698758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBL+fRZoVJd0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=;
        b=XaVASs7SnYZNW+mw+IDuZDYDc1csilTtY9FOdFOhvvQC8hwmad17syZGvhz+KQc2N4
         q1YvoWKEjXb84i/fJ/F/r5F2sJS28gopmseNddtPBNd1XnqlxogPzoExWJ5qI/2ZqQ6O
         7cAJZIbnEmUrfSxuzfuhhrrHEQrsj76N+pcdrTbvFjPYvM1RrrTm29XooY499+fzlemc
         KQT+gFbaCjHJLvS9OYslEg/T2ijociK9RoI4ljSc6tkJdjYa3yvcVxtjK7VddjA0uo+p
         2/PI+2uV4W6orEtCOuuhrlfylJi0E5lr8VDGDZ38N9VXIPlc1VDHyIuO4hjRIxOMzylW
         Uyvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBaYMuz6fjMY3q9PD8/LT+h59QrcHCNm/EbbsJ3ZspR73VGCo3KlaMosIxZB6pSdR0urXs2qxuYBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEuFrdJZUsToC8hGuVmYyac/TqjZGwcJL/XkAySgzE9kHB8Cb
	umM740g1XTR9+91I1y+fbcILMrrxm4TRO6WJT+bLRGq0UaLz3c1EAfavpsj57+rVqvIAjcrpAq1
	3JF6+TSpcqoT6hCC/cJGuRcswMOIMQRSnp4bvHQFi/I3DAJU/Nl+vcb7QY7oNnKw=
X-Gm-Gg: ASbGnctg9l3CfkaSyZ0jU1pq806SP+WpGExdt0X6twnrAw5nj2oRUDyRcY7bshZeYMq
	kXgW4aHQsKU6/+SghBpzZsMXTKwXonCewoonpiYgj6X6WTiSFKNspRpQoasUe7RMpJj8A5may17
	v0MffvZRQr0gp83zL62txFPuWY2io3YW8UN+6xWJGJTdEXzgtkN5/ylVhluYBImcjIxLEE4+O7j
	TIa80YV4ESUMnsQHwwTHwyzAzA/nqneD4IDx4L4Wet0QEHzVbs5Wz5GaY+9FD0f3P6rBHsDvMEe
	u5bx2097yeKyT3x7tGAPWajma+CQPaFvCAS9YRbX1MoVeeGTs04BY4IcKP7WufLJCSGEsj4Y5JM
	GvL6uTauLEu2K4tPsC4UH4nMRomueZ/2nSpIhI29uM+QxX98qaWo5uCOgCWUUXw==
X-Received: by 2002:a17:903:15ce:b0:273:ab5f:a507 with SMTP id d9443c01a7336-290c9cd9f34mr223087915ad.21.1761093958479;
        Tue, 21 Oct 2025 17:45:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFecZ5N9CY9Li0/dfJQAVy9O0/8BZE2w5QKSyPywvMXAXjd7XtWluXcbSuBxe1gDtRVplB+TA==
X-Received: by 2002:a17:903:15ce:b0:273:ab5f:a507 with SMTP id d9443c01a7336-290c9cd9f34mr223087655ad.21.1761093958016;
        Tue, 21 Oct 2025 17:45:58 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf67sm121913045ad.15.2025.10.21.17.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 17:45:57 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Tue, 21 Oct 2025 17:45:53 -0700
Message-Id: <20251022004554.1956729-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
References: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX6AsjS0JiablV
 tnVnbBzapK7uMO7WGktBbNmI8B3tfjRIjBRs3zc4KUmwd2gQGzB7gKqYT0TxULlEn2ODCLQJtoA
 KAjBmcHXWcIr0WkKf+L82KnICLYA+TiNvW7W900VhVQKjG26KzKUVo+BbaSd/ErIe+rxPzZohjJ
 X5i5h9B8khjGIGSIa0cdSFkodkIGDkurkShLq73PDwpWloJNH2IenzxyuHUV1ddKH8iOvBViJxo
 mzdkDEE1ugKYC8GHIkVbEm7mxtxAOOJsOix23LrMgthKGDohkh5UNx+vMPXs1CR64GUIXz0F3TR
 9FYlUxW7YMFKBJM3K+Nv/IB04odr/IR6lj5vwDHYysB0LgAf0w3dE271sOoqvOmhaMk3S9kphAH
 urcgOYLjzS6JbeqJkG7dVHe77nYI5A==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f82947 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=OI1EoHIFZYFGuZb9aTAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _rc1BfNpIbUrwUN21FpB697JXiGhp4Ne
X-Proofpoint-ORIG-GUID: _rc1BfNpIbUrwUN21FpB697JXiGhp4Ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

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


