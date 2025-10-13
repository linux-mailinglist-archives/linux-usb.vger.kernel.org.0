Return-Path: <linux-usb+bounces-29194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2D8BD1581
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 05:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771DA1896220
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 04:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B46727F16A;
	Mon, 13 Oct 2025 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsiHS6h/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4233C1BDCF
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 03:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760327971; cv=none; b=PIc9OfTKRkieiCeePLcFBVTaIrlLGdl4SWd0zkdvOOx7oNOnCYyR2JWnBcGtiELODGaq4qOZGr2uHbqdt2n73SCxPo6kO4VPU024EgSspiWwY/C183TIpRwtsL7L75c27rjbFAPoIJY4q+33rSsf0Xk98WKGKsRwbbaLLf9JFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760327971; c=relaxed/simple;
	bh=4s97OXsE4t41H2WY4gfLk660rhvi503He0pOltw2Gjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c8yY1Jfc8vf94i2Hg0EuxBAKJCuySd9H7DqrCFsOnmaLoG4oyKQzDHndkEolnvsB10gIhhROmBouTiRdMMawLPerMgFoCUV9i5KQH8GlbKKO6cj4OZXMVeu4jmeAb5mQWZqIGN3AZe7qACNVc+qJS+kHeAqYIk6TIDyRE3HUPFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsiHS6h/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2oQUW012872
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 03:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RMNDKKR886AjMuufIuUKdsSR0GOZWJ31sPM
	ac5ueuzg=; b=OsiHS6h/PXetzJ68Vfd9KrL4bPcXsezkfZvFDHjSke8nPXovoLs
	5NYN1nzjyGwUiXfHvaGbSBOPB6jswbuVxAnRGFpfa22wPFFX0htfrKNS4gZ4+XM9
	PmwyX1RGR/HwnfHD6jyhHe0g4tbs0SQARIC0VXaugmoQDOrcyUOPyrcar8tafBKY
	t2WuEJ+MzNXR7QCh+1BfMFQC8bLMWQ+odcrLPTSI7/f43HlgVBVMx+RR1IjzkbuI
	19lCun8l1FUssEUoHq9KeyLTiURdP6Bua6GMZM1x228w7+8nlfFVxRFc1hJoYfhM
	OcH5AFCCtU5cisdBb6KDljlDs85DTgqBvFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bu4a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 03:59:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28d1747f23bso79232455ad.3
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 20:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760327968; x=1760932768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMNDKKR886AjMuufIuUKdsSR0GOZWJ31sPMac5ueuzg=;
        b=ldr9WoiaX+K+rerzaAFT3FOE4Ch8M6Ak4nsB2q8Lvmbqiarti1EwiCgwl1mHdAthEm
         ajL0hh0xMcLxTr0lujSQ/ZR0gMbvDh0ox3tz4f4pxdF+SOTQ4mwZ1H2RMr3aWuN7SekJ
         oPMwwciBCJg8h6XpZmDZPUJxv8Px3zXjyRhlX9QbPm0pHotKjGeUrV28LX57Wmhbd83+
         w1hiSKVndWp73IlNvjv5jTPYHw5LTPqb6i9H4fWNbPUeYYy6g4/0X38llwg+iordVrv6
         I8cljjp2WiuFua/ymaGYtbT62Zb7UeIq+PKcOwq4LnZN9vmWRy2W4GKJNoq750gt029t
         YfjA==
X-Forwarded-Encrypted: i=1; AJvYcCUKsjoWo8MJiipjf6UJUh8MK1jK1E4OgYZ/d6B6aya6N5adY+uc5F4RAxSvQt5PVZVpdJlZo0RFouo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy6TXJBRTBA29EfkSU9+iuRbb+OU22miYq/mrnIs7eo3KweCtA
	hbjI+uNyXMLWnDM7S0GJhBvYz9OMun4sNQqj2P90TXw24qMyb2UtjcuUkoi7tGRBomzgTVAc8/o
	s+BbIy3QQM5xN0rncnoBBMfqE33vJj5MF/bbNE3tXOrt3coNN+hbfQgOZBJH81gg=
X-Gm-Gg: ASbGncvxdRt/HdqlBoCd8s0wwqYEuCyWIO8/kzlxvPr63V7cl86Vfti0xpzy7i45cOZ
	909pETDeAvZq6fes8ZiGjETrSk0qpuD+U6DQ/ndOcyiXASg+UVCHOdJauLb9jFXVXqmNWfccWEm
	BwngmZbRWQAzPipl/G42TffHUqyZK4r3BdsW2oKls//gzjw1Mt81gxOA6ZcFBZ6Q9YwCOl8jwi6
	wIArO7+rI6ToY4ngeoR0/Tacp7ordhyxEHt8QxmfotDosgJZSSHGfMRpQX+ZwVryUrzSoEbVzwh
	cdDuTnPd7QnxRAdEmue2Qf7ylQNXQylUMLY46Y8AmnVMVeA7FzrAZUs9Jgc1xokiBFbtLIMt1xq
	aGw==
X-Received: by 2002:a17:903:40cc:b0:26e:d0aa:7690 with SMTP id d9443c01a7336-29027402c79mr221611325ad.41.1760327968211;
        Sun, 12 Oct 2025 20:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHVGLZBxpNB4H/Xm0MJmTnYuQju81RnfMPIBs8IrHHp9PZ9c6HxbnrwU84W6QcEl3NEorCEA==
X-Received: by 2002:a17:903:40cc:b0:26e:d0aa:7690 with SMTP id d9443c01a7336-29027402c79mr221611125ad.41.1760327967714;
        Sun, 12 Oct 2025 20:59:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54c7sm120732305ad.10.2025.10.12.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 20:59:27 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix bindings for X1E80100
Date: Mon, 13 Oct 2025 09:29:20 +0530
Message-Id: <20251013035920.806485-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QLH5bBrS-VZCjtfGqTr0up1W2T7aiUCx
X-Proofpoint-ORIG-GUID: QLH5bBrS-VZCjtfGqTr0up1W2T7aiUCx
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec7921 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ojRqNddluEt3zInEAqUA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0M0CZhaTr/jZ
 4+N0BoZMB01PpxU7RZbi7Y1KYWyfQtwua3Z2inn6TvQiVmVnxpZvdbs7B+JST8D3GxobKHr8n0G
 O4OQlXS8EWHlh7M7Sz05xywa1m7egIeLHIXY1SJCHyERBiBDMEtLp3mwRI6iRJGVhkMrLbFBT3u
 6JAdHs89pKuYYF8q76UC8eKd5GQNwbp9xD/vB8YWTP/gXOulaRTh4EwPxv1nh6cGp3upyk/dSqn
 XOvzZWJhQ9DIYMnAvSWjV0KVCa4WcHmm+c8bGhMaIyHABdMXnEAUlGHJPVRZZ6o+gBtmEdTKlb3
 UmQRfOM4K7ob3f4PLu0T9b9QPviWgqi4ly68ptNo/hRI/5B4Xq76RQwGgXO71WdkIZutsFbVzkW
 mVQFY3ZaBnR3EAn4rgvM1O4o+nj0gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Add the missing multiport controller binding to target list.

Fix minItems for interrupt-names to avoid the following error on High
Speed controller:

usb@a200000: interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Fixes: 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
Added fixes tag and put error log in one line.

Link to v1:
https://lore.kernel.org/all/20251013011357.732151-1-krishna.kurapati@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..d49a58d5478f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -68,6 +68,7 @@ properties:
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
           - qcom,x1e80100-dwc3
+          - qcom,x1e80100-dwc3-mp
       - const: qcom,snps-dwc3
 
   reg:
@@ -460,8 +461,10 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 4
           maxItems: 5
         interrupt-names:
+          minItems: 4
           items:
             - const: dwc_usb3
             - const: pwr_event
-- 
2.34.1


