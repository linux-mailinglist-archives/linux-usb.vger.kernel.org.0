Return-Path: <linux-usb+bounces-28656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76615B9D2C4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4363F1B235B8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3B72E5B2D;
	Thu, 25 Sep 2025 02:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pm/x9kqw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD62E92B0
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767345; cv=none; b=Bryl+zDgSCaoX+dBTjE9OdXDhFakKpJEIMiAedGq1MpHFrXWEkTehHT+0EcR2E8pSnyD6rw7Q5EHZeYnrrFGgkditKBgorJGoDdGYNrAPwR29ywS1NLjrrZmhS67woHVYmXiIV4iiEnnrFQRR5uZRd2LtwmRruw9mFq4N+ob1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767345; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9b4hYADrzqgKIKz2Xk401mwrUGprLKyY3seV7n2knyHZWeiUeyc4pntyzqaMVgmT7TfgoX9Yyi7VhvVCHJwUpJ8ns8QYIvd/WxIpnPd1FghVv7KzrQLRv3Smk8iyZtHmrE71s8zFoIkx6lZZNKM3LPCNsU3Kpd1UWpdIGxDEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pm/x9kqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0rXVV025092
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=Pm/x9kqwjXpeuiM+EFdZ8VP4H6E
	1Kr6LbYY4UNfgps55EkFu6Yi0SzhcW6/dABhIM1fQoEuVa4D2QQliEBoZb9Pr+3w
	D3PJl/AJxZePybRFQDRHfRhIrD+wtUGvLqIitlDV5MAhDgwekLQ4oT3Rc/njzGe2
	mMfq37HRf1LZp01RbbCnt/Fue36p+jezVTG2Bg1El09GBdTImF8OxKWvt1zMMgnf
	V6DyvFh7faCMB0GQkjGfl3lvkzG7ptYBOYHduZQkMa9T1xAUf1F5hRU6wqxqHXW+
	/kOyremgd5UuvpNdYDN2XPyhmrRXEhtzGpKG7ekk1alptfjEeJyePtIDOLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexrne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ea7fcddd8so759014a91.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767342; x=1759372142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=kUJuq5ncROB0oII8XtjAjFypGODJ0ONevhcxidqMD3vTxMzi4RYwszIdzxKhllaG6L
         /sd+dt7C8Bzwmpl+SsI9BqFbQTIwmFXDzg/Xp3gM3TxTW/DBiNZFtKa48jfc1MswVYfn
         SN8xVMSu2nOx9nFtYDG814RIsznT990fyHMN2NzSfZnADU8N5+z78V3ZXOR/Tu6y1eY5
         LdAx+oX9t6pDy9Ghx03cmwL4VosdpPrDsFqJvs7HhVNShUdh+JRMrUt7lrRWvTcy4OXi
         eFmGSKf6AjpXVGnwKsoZisoSOdg3MqJ8/va8bH6joFe84K654W5SK/cvKbu5ovrOdw7e
         Csow==
X-Forwarded-Encrypted: i=1; AJvYcCXADD/bFy0K4Zd+x+T7spkpsU/Wwz9NcAp4u0DluPwBgBt3ILbnOaUh7kUCv86c4C9voNE1SmABEt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa42RhikasRHo1cZI7iFM4RL/0hac8i5RTYkRNAFIkVMlrjWJ7
	0X1vVAE6W8Vqpf3DhUpVf/PEB4hBs1+JZqDTYQPXwjX1wYLM81auJz65xcUDtIKnkRz/i4ocuBr
	M/1VH8XGgBwr2VApBjcsktNw7k4v5andwFmCPHdNqqDZBPK/9sCF0AZnXoJr3iPQ=
X-Gm-Gg: ASbGnct/uHKXARP/MlmjMPl1BvUpgW+6mBJQuBiJZbNIPCaxvwgkJOb8oa6ZWfNeoyB
	s6pbDnfJKiGKA0q5rPCzS2zXC7F2B3B/knGo/jo5/s5Oo3Or6ZwacNANi1pv+LAMnub/UuyiI/1
	1bX4WXBS1t/N+YwnkrDi7qOUZt8Vpn3sU0oYxdccJ6AeZnhVSgDJovTEDWQzirsvsmpuaKkSm1f
	7slNFLYZQviVmG97WJT4AC1Raddr9fTfQteDNAL3/1Jf1qC2o7RJ+aucCWIrNdxKjjXZnMz3kEg
	47EYVqEzhtQLWrS7P0xD55KuiM6ghFDoI3N0hxTRak1A9RarSZh06x05a8pOFrtnDmcWu+O/HmP
	TENhuueNh0z8MU1au
X-Received: by 2002:a17:90b:384d:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-3342a2436b8mr2376225a91.12.1758767341845;
        Wed, 24 Sep 2025 19:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHa9Ej68o30zwHMqd1RYxe408/D5PXvI6i6Er/fRTSy1fm27Fjs2od49tjoO15fcRaB1IM5Q==
X-Received: by 2002:a17:90b:384d:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-3342a2436b8mr2376195a91.12.1758767341386;
        Wed, 24 Sep 2025 19:29:01 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:00 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Wed, 24 Sep 2025 19:28:45 -0700
Message-Id: <20250925022850.4133013-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CUCJ27tAe2ewQUD3H2PhT-AOzRKbbUov
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4a8ee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX9+Zj+ssfDs66
 5wb0ydu7EvONZPyv8j1qmzUVWa6HCtfQdpAV5s/EzMzEOhx7bMA6IPcYIACs8bNjGjQmGGdt1yz
 zB1aF0QFOfKsRs+/Hxs6/Xtlpze4UtgymoItRS1x4/AcIvDPyvoalL3bP4H43FdnlwlULWmHw+C
 G8GXc/yJA9p8DWSyiFwcUM9k6isdGEyll4AkeBzD2UiyYND0i38hJN8h1e4jWrTvv+QKAb7LxBH
 u8RRc8W4zJdrP8SLVl4S4lZgOapoei03dgqoaTWPqd/U7Vv3rRAJmx3W9tA6f5F/7e4agL3VCRu
 g7cXMxdrMm9y74AHmSA/FCYBl8f9icqk4NtXNnAUW6BtCQFS/zVmJ6HLs9ExGSHBIWJhPNHaS3l
 A4RVY93H
X-Proofpoint-ORIG-GUID: CUCJ27tAe2ewQUD3H2PhT-AOzRKbbUov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

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

