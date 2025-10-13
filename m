Return-Path: <linux-usb+bounces-29182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C9BD1111
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 03:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27ABA3BBBE7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 01:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26FD201113;
	Mon, 13 Oct 2025 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQGuRgAr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59551E5B72
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760318054; cv=none; b=IhdidY00dBuSOWXC1AOB00+oJxuJ295PJjQKQDKIRP8G33CdSaXBxEk29VH0vj0kybCSVG1mr7mMyl+lGC7yO1SczSUWtS5JkzSKufAGcK9LtUvkZPEBiFJ7yfPozob5SkK8GANwFqr6EfRq9cwby9Mj13uPSCy3lf3iEq+we5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760318054; c=relaxed/simple;
	bh=vYTNGVpJqfVNWqTFnghL5MAMhtBYnTD2XCWEwdgn2To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LXZlM5geGFRpeSZ/+B3SR0lLfD8gWPIkuRyhFAayfmcb8e1FK6KHd96JKCbXAUUtwpTk7Vd2fyMXzSB1Vdx/iopKA5I0oex0W6OuBihIif+9JBKjMB7uwtvK2kX4a2BHbW2WdiogVr3sGy2hj9QndY/LUWkdCORVw37YaFByf+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQGuRgAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CLVrF9025581
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vK+SJgwnOTEZYAlMkPB/qihU7mC9Y5KP7ce
	r6c8Azng=; b=gQGuRgAr0p8shwpEcS1em5PgCzaRp7SDskDjDsJRc7IgOj83lGS
	xZ1YUXq73s254/R5Anbp2PwBB8lWyQGUzLZXRi1A3kilMkJEIiqcmf2Wfw7/b9TY
	qXSc3pv29gdT6dPlQix0h3b8/uwcWe3EjPHdS5sYk+aKhc+9srfqSvc+bPfCPLBh
	wO0t4Z9b2JwjVVpk6MGbCfzTC47o39aWnZu/lyb8whnYzzNIsdiuJUFUk4cakj/r
	gfzl+1wX1DxDyhEiCK/PUshUBjSqdcXGd7nMw22kRzoLm26ymfK4ZbBwCqIJXa80
	mi7q31M+i9t5zRtuoWJL/MNvj2MdI6uP6ZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk2t5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:14:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78105c10afdso6656792b3a.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 18:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760318049; x=1760922849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vK+SJgwnOTEZYAlMkPB/qihU7mC9Y5KP7cer6c8Azng=;
        b=PtyQoirzydgZEBcBNWGEx///P6aY4gBXxZyOOlOjNa2JMftzEOCeO4Ka7IYktrXfoD
         jqtnKF4U1WaaS4f77vhL3sMWDxEABXIPDw5+fvctoSzWO/852s90ekKhhduIYpmzpTq+
         cCA70EjuUUGMO0G9b3/mIF1geOYPYIKlEqXpMlCRzkqKi4aW6ovOR7F2kXrpcYWBDgg0
         JM2Baa7eiV6yv+HaR6d6FfDiKwbXA/BMow10/4Z4McmPipYYSMb9nxDGofajR83DPdrq
         8vLtYViAoeURTSrf3PVsHN5+2euKOtkZW/lc4ASQoigkEt+q3ucLhkWKI4jYgFre3YQj
         D46w==
X-Forwarded-Encrypted: i=1; AJvYcCWBVAHJkN1PUJtl0UQCbMtSTTTIWW2tOw8Uin5eeVvXIuRG5A9gMIkNK88iaKYwhoN4hSlquoV9ZRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM872qmG0CbLOcAgeufHPzOo8ihJymKM0SVeDhWNAAzjaUrzOr
	qEX+i2n8Gz5VheG7KnAONPkm6NNt2Nw2vCb15edxmGm/NrrHk8MT1qri7ruKfpZdqtDXEWOcTZE
	zlmRd/77ueL4QdqgpAWM60ZJJi+chwQpD0tM03ONHXkVJV1LFR1gdZsGyGWvza6s=
X-Gm-Gg: ASbGncsfsoQyMxcocRjOak5Q8WCqtzcD5+r9paGIHbIuv3uyEXyLdTnfIEaubHjVzz4
	/sgNQ6r5NYtEukEdte7QavzR3Z91xCF5xup9/YUDiVWzmo9ryIZQ+mlgr7rJ/FPBcUSNeViCo7S
	EyAY/flQtlU3ubRJkKjpwwbZIT9ZZlRd6cR3JRXixyw/bXsgUsoesRzCAp4+9Iafn5op+hLV1S6
	9Mx1qUBB9HjgLQXHnNK0oJvHTZtQDBYr2JnVxA0Kje/uemGbQQ+0zMPuDRAbamvDTNIjkQlN/HN
	8kFvuG9WJa2vbkAkwqHEsWtn0BqlITLk06TxONz9z60IjbO23mweVgL5jSMYh4MGXTAj2bDJRro
	B0w==
X-Received: by 2002:a05:6a21:4843:b0:32d:b925:246e with SMTP id adf61e73a8af0-32db9254d9cmr17513627637.43.1760318048825;
        Sun, 12 Oct 2025 18:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2QXwY3MOrK4ad1ja2OEJVP5yyAqc35NeoeynehrZkJOMLTtorm2RzOTEzGNzwKQ3z/GLTDQ==
X-Received: by 2002:a05:6a21:4843:b0:32d:b925:246e with SMTP id adf61e73a8af0-32db9254d9cmr17513603637.43.1760318048362;
        Sun, 12 Oct 2025 18:14:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb11ca0sm9672647b3a.32.2025.10.12.18.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:14:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix bindings for X1E80100
Date: Mon, 13 Oct 2025 06:43:57 +0530
Message-Id: <20251013011357.732151-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GvWwUeRlI8BfCSIcysHDehZcdz9Qg94c
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ec5262 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QltsTdpWXtN-n1SMwaMA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: GvWwUeRlI8BfCSIcysHDehZcdz9Qg94c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6XkuWOPFXy4t
 Ym9u3Ps7p1fGqh4zuXfbDcoPdTDYGZOwT5qwOLaovi6uCAisnsm63XkuBwWk7mFVX9vSpH2rrRx
 OzY9okfTO14dUNIEfJiGwigGIEIfsO/B2bG4B+URyyxQTPT8EgtdK7k4cSr8ttZ4uIejG5eHHEM
 2XcoodRBBpyKOtBzji8QEepgs9xjeMtYCeMUzQHoIRoeKkXVQbXYrGs+8PNjnmtQ1qlVQy6Xp1J
 cl2Gk27onXhCTO9kGSx+5pACtC8jIEDuMzRB4vnCh6w9FeL9qdgSjMhZViTRXRh9VD4aTLQuVVE
 8bFJYBF89vCWyEGh7M3NCtip+FNLRa33I2RlH8qHdvEnOuFQe+CblAFJEz3RcNNvyJPQ4Hrz+wc
 Hy8kytE7EvYaGi3mvg8eL+mqDax3Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add the missing multiport controller binding to target list.

Fix minItems for interrupt-names to avoid the following error on High
Speed controller:

usb@a200000: interrupt-names: ['dwc_usb3', 'pwr_event',
'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
The above issues were found when effort was being put in to
flatten usb controller nodes on X1E80100.

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


