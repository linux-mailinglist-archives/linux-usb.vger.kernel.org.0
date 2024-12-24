Return-Path: <linux-usb+bounces-18772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D029FBAA4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 09:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 284C57A1B97
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 08:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4641B393C;
	Tue, 24 Dec 2024 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gs7VcH9c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A41AFB36
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030015; cv=none; b=UQ/xoB0Btzb6JJPdlr2Dw7vPwM+NclAWSxh19kNyTrSdcCawmuP0TAyOpWDpjHkWPsZZdbGq1SkQ138IYC83IGfrC6YGL/+OIL7oLYpcacOgb61NhafhuabHbC8TFrpB/SSQv0uAglwE5qcN3aJLqm0+Ki5ndM7URlF4oa/OyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030015; c=relaxed/simple;
	bh=qGpWgIXL47YBUsbnUQeWjPLqABrak3lVm1Q6K257iLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k3DNWCjHqn/ILB7TrtCoOzPY8mTmCUKvDIvMgbuf1MFbD/PFWKs76p/CpXna7z8z1dUwd/gxC6t5Z1LrzdbkY06zOLYmQf/wYJtqJAH7hE3mvpp8euL0L6wy21M5impJxR0c92OvEJaUP/2i5pt7BvscqEpcSCsXSFnkx45juUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gs7VcH9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO5lZxj006798
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=suI55uQNzGC
	SiQih4YuTNalcRhTRpBC18Rzl3f7fUjE=; b=gs7VcH9cb0WKlxVuEkk6YPCR+th
	7pgopASOK2rGRLaX3o+HJqmIiptGf/hxMHYvNK8ZMfLw1IjDBtGVO29BAc/MO2Gq
	w3TAJlQ569k0F2WsNrk96ZpGFgu0VnJfQvEbxKnoR2hFoz01m86HR3AP3ZBTWJ75
	0R3EWaaJQ5TU9qVwFNLQwo4m9OWnSv6UbE7GdxMiTBfNtYtSiyPTUo5s/X1cPYOv
	VekT2DG0y9cv+NNGHvPxteJoS7O+Z6iGHxAsG6JHvVclYycP0Vvp9QuVB84fD32q
	2MPL0GLymdNNcISV37olrTqVUZLY/CXnOfbWUHo/bSh4q+YwnvEbgZKsLYw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qq4b0q7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so5250138a91.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 00:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030011; x=1735634811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suI55uQNzGCSiQih4YuTNalcRhTRpBC18Rzl3f7fUjE=;
        b=lbVfAVMU5VBzowY+VRoa/hhbF1/+iVuuyjpa3AtIzL3jWvUqZ1yWQj6yP4iHA6k8d+
         DtHfmYThDMD6ZWqcOqcmFHe+ERDna6aXFSavdyy8irmeYJ8o+X0P1xMFycGykxxFdtcu
         Nw4FStEVBOiRe8v20Cz9BYNYnqIKuMARptyi71eZek/4BwJ6q2pLXIpkMhKvQzOQCx8I
         +NIyIRUSCOV/OmUkxa2kM2mTYxmXDi+05YoyceiN+XtHLftpiiiIuYcThYXvX94wKdU8
         iph1lI8yILjRQxA1cqPp6QHxzffzAQmF0iKsvaKEBP3rr2T9e3S2WBdJ8MYdh+xfN8Qb
         Gulw==
X-Forwarded-Encrypted: i=1; AJvYcCWiKxOVLGIRYwKvJYxgkfrrgj8h2umNfiLa6I6+SRn+5aDdib9zPsOFtyNKHh9pS1bN6PCif9XdsW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLtz1F8FzvisQ+6AnuGT7D+pskWmAjZHTpWyleNcHyjs2ovLz
	73aq3nqqHtkEB1uNdhYPsEJOcCT2fAGlgoMRiHC/B/3RedZGECm4+IBwX2ktJSocJU/IPZe39sK
	HrLhMFRTNj/MZf9+ce5LzTltYqkeruH1nWhvOu55XJUrEn9WiKj9K6GDlT9w=
X-Gm-Gg: ASbGnctKq9mxoVlNE0ocfMSckvJWeDLnrgiPR6QKVEmMwayGQFXVH2F5hzKm6E7ecjU
	fnGZYGAnGzZn0y3X7zmal5NjaGJzH/yc3aabKjt/pOFzv+w4t3ZZaROY/Z8c+06cGPE6QvtOFgF
	nxGfrQVnJCjVa1IPeLKDbdAsPPZAm0AMx3tqhI3ykWPLEoTO8BNs0BClH+8p1tu1txeEt9i/pAa
	vfqHHOBtT627eL17EqZ9idAWi/R0Hcz4vKiTxcmeorbB0cggS2rwHbr8iS/PNuZttSRp0VGJGHN
	4WHjP2S5pk2tU5lTrSo=
X-Received: by 2002:a17:90b:5202:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f452ec6a53mr22070966a91.28.1735030011254;
        Tue, 24 Dec 2024 00:46:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0+3qD4z7RnyTP4+sb8Ve+3MnRYVWj8h/D611r2RH3W4G7mum8I0Hgbn+yFyukzggbMv9nwA==
X-Received: by 2002:a17:90b:5202:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f452ec6a53mr22070941a91.28.1735030010895;
        Tue, 24 Dec 2024 00:46:50 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f692fsm85471195ad.216.2024.12.24.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:46:50 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v3 3/3] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
Date: Tue, 24 Dec 2024 14:16:21 +0530
Message-Id: <20241224084621.4139021-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9dNimc6pN0QMph-7BLftNgpO-aFRTvix
X-Proofpoint-GUID: 9dNimc6pN0QMph-7BLftNgpO-aFRTvix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240072

From: Krishna Kurapati <quic_kriskura@quicinc.com>

Provide PHY configuration for the USB QMP PHY for QCS615 Platform.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index cf12a6f12134..5e7fcb26744a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1124,6 +1124,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-usb3-phy",
+		.data = &qcm2290_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
-- 
2.34.1


