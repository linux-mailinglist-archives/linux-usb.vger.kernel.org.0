Return-Path: <linux-usb+bounces-28853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E21BB1ED0
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AF2E7B1E41
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C11931352D;
	Wed,  1 Oct 2025 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8PBNmo3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143D313262
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356348; cv=none; b=MuHgwiwb7pv0xraSmhbY+i2VDp6SZiT0xOp2efRYcaviPyQTQkT9ruLOYgd0awvKu5svaJhAILuFNu0jyAb6bFm+PUB6HlUTJHvsNOZ1bFLpfpARt9CHY/Yl7Im7rg+IXUmuiCSofZKKDc1bAj3E5dVc55yk37f5Z43waNKBRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356348; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=daCiS5J43QUXOD/b/f4bd3qRhyZxwRioiTiigZFzGmBQAz0dxDsu7zlZXpNOynIJn+becQYPooL80fBBhDp5s0MTbB0+may5RMYkH0jllZzJ14YJ6eSNkn3uh2RFLaqY3Hr1TLqFrN3VDsUzn01BBMD27e1KstEg9T6UDXeVGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8PBNmo3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbtbG023326
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=m8PBNmo3eyDlXQAQxCYjNuc89IY
	dD4Y7iU5etjHZ6eSWWUsyRRMfSqwJ58XwUkvnPFiGNVJGUGDzrXs184yad/JR7Rh
	CCBPHSqnjTiTooIOt0Usk85xKZH+tvR7Hb2UUSfSOJ6TZdAaxUuYUY9nZDJlCgxi
	a9AfzDqMcvO0NC4ItA5eXfqFefjN0OJIM3vzMwxETCpp2A+Bfk9beXEH4tCZNTyU
	Yuxbp/pXm5OMGWsbOnRkOGesog96sX24Ae7fTExvLMcqYtOgbAW+OHKLLrtfy0vd
	KdURq7l2Mcu2pm5whproNNbPEXelBSLXr9UJ8vjPJRvIwRyCOdueAvLaGuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a660sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befbbaso447450a91.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356345; x=1759961145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=O6kjQhXBC2NzTh8AwSn9wu6EhqopgEuT2JvNJCOkIrtOjelXX/3yviLtUL43hOKwB2
         gO68QyYXHP26RgUjC9TmpqU7a1aWx12CA9jVdks+sRBTxCm3lUN4WeA/rm1HGN5hKJnH
         Jzf9K7Ka8FbFuzeLI1zwx4mzB6j3sCs3Ju/8fuhtT43OLlv289jBt7O8tzEfHXRkmOGn
         XzNdJWEpyFRzfcGKSrwurxJ8ZmGs2173PlpjXPUQOvdZub2ADZuUvMUN1RtlfjaA9k5X
         i4USUtTgM6MazrLRF8hg5tCqjl1AbgSgo9WWXEQwAk59eT40FfFarFpvsNXuQ/EuGNJS
         lS4g==
X-Forwarded-Encrypted: i=1; AJvYcCWq5eFbJfJPN+s/HWh9zIYxiHh1yzZMUPT3frI8TsAhgjof73vzn3czX7jhLccT9AYR+Zbcgufrm0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXArDso9dGKWeZkne6FqhqDO5Eo0kbl2q/7La8UW8JRmJPpYL
	KOkCamvqIwMVl5DjIFu6i/vvjJRIFaZm1nocgdYBR1d6bmv4U2fRwP0M/I4uoeWZzwFPUEmahlH
	2/cIklUf8Ijc76JFFvMWSkOet/NWt9GACwNra++Efj3eqnpGn1PfuhPmEvjFwq0w=
X-Gm-Gg: ASbGncvN2Tyv1lTLw/XJK+F2sK5ZqLAHKWewEvXVqigEcafwtwETr4ewn0Lvj8UadzC
	uK8+yaIfZFArnP61OmKPx7supaGww9RKh5Ndf8e0XJMSzpS5bJpzhqoF44xPrWyAX9v+j6A62w7
	uVgelsreNDs5fViHOrYnwhVQytx+L/Fz1wPzznZh8VBgnx8svTfj9ar4xvslXMzuypSbgdnxJUA
	g3O/chFwD67m/6CNXP0GXWP2qf8k1+qoeC8I+c97XAlFBT0s33nn68eY39MlYn6WhajDaMQldr7
	pGSqF8KYAj7xTuHYLpp9ilZqKZ32/qRV17eGub7uK8UQxfKEpeGrATCaSx4qkAfZvYd9ng1n4bK
	7rLRHyZwl3LU5IDVDxHKatw==
X-Received: by 2002:a17:90b:4a87:b0:32e:d600:4fdb with SMTP id 98e67ed59e1d1-339a6f37ce0mr5612382a91.18.1759356344595;
        Wed, 01 Oct 2025 15:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwA03IVPTcB3jPZNykUMsai4acp6hXfEk2fjuAdlgpyO2JlX4KBGXUh1TStolV8ltoQm2vOA==
X-Received: by 2002:a17:90b:4a87:b0:32e:d600:4fdb with SMTP id 98e67ed59e1d1-339a6f37ce0mr5612350a91.18.1759356344166;
        Wed, 01 Oct 2025 15:05:44 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:43 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Wed,  1 Oct 2025 15:05:29 -0700
Message-Id: <20251001220534.3166401-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dda5b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fw9Y456eesz2wLufJLfhGXYwGL7at6fS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX6zPdUUbIme63
 I4Fhpm1oLqFPVsLdJ1M9QMlrzXQZvz+nNGOjV8USG/f/Sde9bKa/WjWr3/ZUMWykxAMtFBOmtJ+
 w2XWfWdPHVZR9Q4tsmz/Qd/Pz4vdxAGUc+6ktbq/4O2PPDAzedHuARiAoH5wk4Zztt1D8B+Qw0n
 otO+OJvaMl1t6yzuh4vbrWyjeC/I+NCYGADIW/0cixROtirWQ3qcOgn7rJkvSdvptHVX/8RtFYX
 4XidcZGta9uMbTTjzTuvPwPd28T9aBnPgj1UZga/N1qPnYCYPK3nnsrKBJahJNcJiSE01y9ksnZ
 frsXuqtIcFQTCCWbNOkWU7ZR00c49P6YISPJiczHzmq1sRgqjkL4WDtwxqjfZbH24+amEbOr/Ed
 LRKdg54djzLB7LMQZrcBC2MBLLIaDQ==
X-Proofpoint-ORIG-GUID: fw9Y456eesz2wLufJLfhGXYwGL7at6fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Add the compatible string for identifying a SMB2370 USB repeater device.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1

