Return-Path: <linux-usb+bounces-28922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216FBBFA9F
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9DC189DEC2
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A382135B8;
	Mon,  6 Oct 2025 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNzmyh2X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BC1D516F
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789218; cv=none; b=NG74/k2OMdafoYOokvy6hoDWuGURRkX09Lz+mmEFcq75BawiklJacYO159+kSZECuK0Vrxq9i30EXXs1IdrpLDt4lOhb3vC93PzzDS1AMeRZIutJYSFER2d1yBqNyqb8Ykfj6dv3bIiVjhtyWRwj3nfRBSjLPkrC2HtShr8SMsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789218; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DR0g18a1nm4J3DGfFgXMvKH/ZbLGI+N4Vl71kQf2A83AwPFgOKJc2M/P1xYMZpn+j7k0QCxBxMS8qHBZfdxqYP2wsY881JMM9eEsHcHO49L/5lA+ECGDC+RhVrgKJm2n9rYyjRvWdEsrv5bZI5H2HAgYNbvNtOHO0cYPVXKgNcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNzmyh2X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596ExAMh025014
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=XNzmyh2XOAAmRvkmnEGA9YOas+D
	TYNRCEo37uwuxgKSoVQ2PNZOqqXuza1cPH6fDea7aQ950p9NlUSH3uxOZn7Jv6/6
	BBvbmdA9fg2GDlh2/ocumOWL+3rQeiIrF2/tze39ZEBVDcl3R4qpNyzEQ9CFlISz
	fYHw6K7ed8c+izO13JIZ2Sof6+DhzrjDK2kYrl/jbEWQ+Qor14qvLS59Msy5wDF+
	LzuKqmTepXBELIVbR6o622fHxqTZpn/weNV3B9HewUTcKRRB9EbMOfrDGtfXY5K5
	wSgPiZFGOJoO6scn51m6sk2AE2F0lF2b1ovtIMZhlPI8bZF/sfoV3PMTxvg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn5mdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f9cc532bso5269008b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789214; x=1760394014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=Nu7x76mHt+NGvEsylIHM0BFHrbv8AH63dWfTUB5P6+3mwbAFXTYy1dxr5Xq2tad+Je
         nUXSjLcrcJVMVV19/Je/XBowsoRM3sRp0VODIUmfzKQd8bzcHCglVmya29iY2HEJ8Gvf
         KFULNPP9aq6mDHotcPIFfbM5f8AsikqrWF/slNNq6IIAnbb+8Ncokd7aZ9Pi/XM3lf9e
         i+MIF3AoL0vV+NwENvWufMzpW/SBc8YkfTXd8qutAMc6nnXB8ZwX2mu4GWs6nxl6+XM6
         YNPA5Xoe8GWUeo26XbI35dRTKEXzF2Aud7DIGRtEb4Tmuc8WYbbWpDP44FeZWInzRatT
         4yNw==
X-Forwarded-Encrypted: i=1; AJvYcCWPzfAcbY61T2NJ3FJ41h/OnADeIiEPySeIXmiZUQFrgM87UsKrtuQpSO8DjVwKdK69gahb9brOIQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJBoQYVhstmUiI5S3Zq0Y3riJDicIvJwmQTskqALKWNM2wTD/F
	SA/MRI1T5taMYGrtKslqMHLaysNU+0nRT7v8YDBsbh8HqziHXh1LuL2Z1wmDG6bGwgJEK4gah7/
	ahK3yn7y0Iz/+IJHVG8AOQpWms+PhhLWDfD8t1N9WbLMOsy97cqEZzhvOf3vDulc=
X-Gm-Gg: ASbGncvbxfPi7l8AZQKofhT8m/uGq2O/tma5MQBKw5J7KvQ8mnBBr+L9Is36caPVS2h
	c80ePNCatBu3Q1xKYMzCcNAj9nq325teEWZWe0LfCLxCNQ2VzH3+OvrB/zBBRvMjtB0ReseHslP
	280wIT7/qt5WI4Q15p14qXyPSWHfnWo64anLv7ZZHxoX04yBhb1k+fy81RRi2IqWTh2qVKsyML9
	dLrwnB3lkxYaoAWoILzICqdFzxJuqo+dp3X/lIVZzJ79BVxLeb62/VJ8AE9LT0T5zMxfW+PvSRg
	nlsLRoIr40OEZS/pyqX62uVYxR+veY4tH355WoikE489cnD7rrOcnsrmpwfgNKykIqb3tq2QvKr
	8NOt8DqSMa/QgiwAQvO1Neg==
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-79230757802mr1247806b3a.5.1759789214001;
        Mon, 06 Oct 2025 15:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnkZXwidFHz7CWQzFnYlI1XTWEVkHlGYGjn1W8QN2IS0V8sHRnZ70wzY70yU9/PuxBu2FvJw==
X-Received: by 2002:a05:6a00:399b:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-79230757802mr1247773b3a.5.1759789213473;
        Mon, 06 Oct 2025 15:20:13 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Mon,  6 Oct 2025 15:19:57 -0700
Message-Id: <20251006222002.2182777-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX70PHLIH+WJQN
 y9/BjX6jjRfx6wFrDPs0jrtu6hnt/M86biYe51FbvRaOVVs/ZS+7AfVjE4u6DPdGfYW6QzKd4zm
 CxQz5pxQGyFzMTBLJBaEfMv5upvQBn/Eg2SboYC4YjTZXwGlB8wLxL4dfKpDOizIaQ8klOesJ3D
 RiQ8pdvAGax4H8/OwCk3Wj7LU+Ro5U1rvSCaTmkAnnsgWbZFfcD4EFJ5U6WUixBd6GObGL/y/de
 CoMC9vQNosqyIgWrBDeSrtx49Exezum4ILy9KxJoEdD+50CuLcZJgWbhO8kBPtraAC4Me/vI0Io
 m2yzBYZ0LcqrgLzlhHAzYYDoPpwbpiP6dFfmStIWmCFR91xSMNUqEx2AN1A2x5QMlDiDGzU+1zu
 idfAqrm6F0wEC1TUZfIYPF5OG3y5Cw==
X-Proofpoint-GUID: pTCm-0w66mDTSKKe1AjF6r4EwqkRvzkm
X-Proofpoint-ORIG-GUID: pTCm-0w66mDTSKKe1AjF6r4EwqkRvzkm
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4409f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

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

