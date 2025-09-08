Return-Path: <linux-usb+bounces-27759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39664B49D8A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 01:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37C3C1BC4EE4
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 23:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFA82F7AD6;
	Mon,  8 Sep 2025 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQ7/ioF4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6C127E1D5
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 23:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757374625; cv=none; b=EyN1crqutl5qzyO/OzxCaL0J8pO6/DILfeeN4ctfX/0xRbyLBAIcAMwZog2Z7VIwrVBmD+cl51hWydq659Sip3r8aLOAEn65lysjyKfbLdBzHvnpqpKU+wL3X801P2b3eZjzAZOu92B51qRxNAZv+joJ2WFN/zTZD+RVATJN3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757374625; c=relaxed/simple;
	bh=aV6x9i444yKwrh89jsUIy6W2/ZSo2GP1JzPJOvHXhPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gq9Qv4tLalWA4F142vRnmYU/qNAn8cM6k44FQqpIlb6q5Qfy1PzYNdYo4IIi9glBNfXZheLZ3aLkTLylS6pu70s3FUrdLoPTKonz47lhxGfDHs2EMTW6xcFV8tMiT3xsKvwx9xDCXklQqz0WxqM5DguqB8eYEr9nosDPsG7dtWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQ7/ioF4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GCTjO007791
	for <linux-usb@vger.kernel.org>; Mon, 8 Sep 2025 23:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYDBlg0WkTcfh1+naLAv9d
	eJDd4moNkfZHLu8U7qAJA=; b=VQ7/ioF4wQXXNInep9mjhXOwWScPQfe4Q8Nv7t
	L9LyEV/u9q16UXS1vN/+7iY5GEDXY37lr3a5rAgqh01XN7NFXdu+kVLNtnk7+xM4
	wStVdE71u1Oo5wlfA37B/FhgYd1wSxTSF9ebx2McjpD3UzIi65y6wHeRcgGvZefx
	KDwZ6hD+hdwJz1BDQl05Z1tUFIYKTSHFEn/rJXtHiT63FW4tWg7z3tcGcPPMD3bb
	Faa/hWzWayTV2Ek4irIuhHYkGXkx3ycgon5RSsI3de4yPl06zV2ZXJf49yZdQ/FT
	LuoP8KAKs7p3ssk0NJ5ePuOstXSnQUBpdjD8S8SLnDeOWvOA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8e92y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 08 Sep 2025 23:37:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-724ee8d2a33so106815576d6.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Sep 2025 16:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757374621; x=1757979421;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYDBlg0WkTcfh1+naLAv9deJDd4moNkfZHLu8U7qAJA=;
        b=wbvuv4tJStGZbQLxn7D2iozHRI71Ol1zqXnD/FrNSdWs5ffdIQ96EFrRA46Os40o+7
         wLikcS0GDjmyGBY6nEVYSV3gjyGztPaOKObHclXqYbY3FrMiV8Jzh3bvOHPysmHmRbRq
         BjFC8nB0lEq0sj6PdgVHtKlCgD0BeJphBvo8b84kro7d6JzsCtB4SlxOdS4JgfA6jYdJ
         uE7+PtuM5wkOqoDXFBd/YuHOkRN6cx6Gj5eUPrPHf16FpbjKFrin70hphgqiJ/oK35Ud
         dBlO1wp8uXPjBwHPv1wUo+s6t1EfkKL4SG5S1Ic7O0W8Vi3XqIde+Xn2ZfyRsM3xUxgb
         YBJA==
X-Gm-Message-State: AOJu0Ywhy26PqKgwVWQCnkgDptX7Rg6/7hk8V6xAgfOajpAQsZiKOgud
	cTh2r02fMAdR2BiVdyiJoE9NXrSOcUrcz+GnugK9a5OovyhQb+zNEdaE7kSHKZrNv/MVD2w7j41
	ucUjzYCy8xVH2deF1y7Flt66TooTWJqyYPAds7h7nFDSB1h0ZttUyZT3HjuGy2Hs=
X-Gm-Gg: ASbGncvwRRk1pUvmHypc2v8o5rOfjpv7hflmukm3fBX1Li5NoRNnjrow0KUM7FzQaf/
	e2trAkmScbOqM14sqOaXQjvJ/MTynJid99CI7LmTJVuzepbMJsLPetSt05V7wQR4gamQorOWdwa
	pLbLeYrW1CgSTu0PKkQZZ5giK3TEeLjicS6X3pxwpbxUvugoWFrHjF0MSt8j4xJ+JZKF0UItX/r
	SR+nyqnIS+GXfME88TxnGaYb0UFaQm5VQEMXy9yEaxH02y2TrRAlgiL+akiwBrZc8/9OSH/vAWR
	UujU1j7CmigNx3S+tERBLd6XNDFAHmYj1NqErjdIKq3AUhEm8HKEz3b+0O+QGSXHv5hWNqPwCyL
	dcwiEe80KPDOzw41650ElTV4PEPPlDGB5zIUXBCtIt+XIolrW0PzI
X-Received: by 2002:a05:6214:4005:b0:734:fe8f:27b9 with SMTP id 6a1803df08f44-73922f68800mr104019596d6.13.1757374621169;
        Mon, 08 Sep 2025 16:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzaeHoIims3X0e3h2M5HKMNYxOLzNvc34VKws3LcgytKD2PYzVCXkYiTsiD7uMOpOqoAVk0A==
X-Received: by 2002:a05:6214:4005:b0:734:fe8f:27b9 with SMTP id 6a1803df08f44-73922f68800mr104019406d6.13.1757374620733;
        Mon, 08 Sep 2025 16:37:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795eb4asm92926e87.85.2025.09.08.16.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 16:36:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 02:36:51 +0300
Subject: [PATCH] usb: typec: tcpci: report connection status for non-DRP
 devices
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-tcpci-non-drp-connection-v1-1-e09c7d877d44@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJJov2gC/x3MMQqAMAxA0atIZgO1KKhXEYc2jZolLa2IIN7d4
 viH9x8onIULzM0DmS8pErVG1zZAh9OdUUJtsMYOZjIjnpRIUKNiyAkpqjKdFaF3FCY3BNt7gsp
 T5k3uf72s7/sBP/LfCWoAAAA=
X-Change-ID: 20250908-tcpci-non-drp-connection-bacd9a5d24bc
To: Badhri Jagan Sridharan <badhri@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aV6x9i444yKwrh89jsUIy6W2/ZSo2GP1JzPJOvHXhPk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBov2iZq7yOcwNWcciPqD88jCchhhtgzMx2mVaMy
 hT6lZuRLWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaL9omQAKCRCLPIo+Aiko
 1dYxCACqgXNZg3RY4iVsOC3M5uG93cPZroFWXdl8T2yTOqzz2JlZL1XVV/5sjXiPe7doee009it
 r9sPSiJ35iySr1kEGuOVtj2ewuvuoufzbUfky7lfE58qjg7zxefzC6PuV24c8/DeX9u9sUmkfRW
 6Jx1bLvTUmszWmRQzuppRhJfty/EI1uFU48e0DQpDWA01nrD2IaW+qgvfeGFKy4t/0zklE5KrGj
 piMlcyBwpQqlHcQOeYgIQwVGV4KCpL33sCOLg1Gs6mjSK+FEqKt/dP9mZ4eFOrY2L3Gn+W2E1aU
 LwU1MBoxKGHIEgAj32cSyDxtBS3y/4ebSDByIl8PUGOuEqGO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXxyhnAcyHcQzK
 NCs/g5S0dzdvLiDOrhU0I7f+31YQ9bhstcXWD1oL5pO3uKlyI953Bilmc3IK9zYUtgbNenogOZ6
 8Z5OaQBYQBQ9CceT+iXgCO5zEM/VJzwnlejxmgwOYHqdYT/e4bbPfjfNRTh4sucvprEEtLzEezI
 t0/DE25TC23ipGu4TlnsZh2M+GP5ZZkEYaox21DSNOqWXEYPQFHVYsoGwoMFUimecAa6yM1NtN+
 5YWDqISQRi6NMLyjYotj40yv6LLGQDogLFeRHBFp/pniAjHqmuvUE4ON3mqiSgPhcNrn6fUJOVP
 AnkIms9g8pgG2IZkx+K8fLTDwrFuuxQpGcj7xEusw+AeBlPo5E5yEz5GshyqqcrP02P1llcHBkI
 KLug0ViI
X-Proofpoint-ORIG-GUID: GUhSRqDz5t_Gw3K2Az4V0ArAEG_mOkI1
X-Proofpoint-GUID: GUhSRqDz5t_Gw3K2Az4V0ArAEG_mOkI1
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bf689e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SqqGe75Sp6Rn3n6DgO8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

TCPM core calls start_toggling() unconditionally, but TCPCI simply
returns -EOPNOTSUPP in such a case, ignoring the current 'connected'
status. Make TCPCI driver check CC lines status and report current
connected status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index a56e31b20c214fc509423d2f8602d3599c1dd2c1..9d57c73b49674858d799790c5c8cb0d929841def 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -178,6 +178,8 @@ static int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc,
 				  TCPC_ROLE_CTRL_CC_OPEN);
 }
 
+static int tcpci_get_cc(struct tcpc_dev *tcpc,
+			enum typec_cc_status *cc1, enum typec_cc_status *cc2);
 static int tcpci_start_toggling(struct tcpc_dev *tcpc,
 				enum typec_port_type port_type,
 				enum typec_cc_status cc)
@@ -186,8 +188,17 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg = TCPC_ROLE_CTRL_DRP;
 
-	if (port_type != TYPEC_PORT_DRP)
+	if (port_type != TYPEC_PORT_DRP) {
+		enum typec_cc_status cc1, cc2;
+
+		ret = tcpci_get_cc(tcpc, &cc1, &cc2);
+		if (ret)
+			return ret;
+
+		tcpm_cc_change(tcpci->port);
+
 		return -EOPNOTSUPP;
+	}
 
 	/* Handle vendor drp toggling */
 	if (tcpci->data->start_drp_toggling) {

---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250908-tcpci-non-drp-connection-bacd9a5d24bc

Best regards,
-- 
With best wishes
Dmitry


