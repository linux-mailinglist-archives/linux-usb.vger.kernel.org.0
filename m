Return-Path: <linux-usb+bounces-25628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37781AFEA3D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 15:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E003A542F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 13:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F0F2DFA21;
	Wed,  9 Jul 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmbiKadI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F4295502
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067753; cv=none; b=mqIiZYOrlMbp1QZgC//ukprXSrka7pkt5goS+iqVzkhgk8iIbrnFHO+vYVValE146uxAplATWape7UbZPGW4jUwhCIBNm+k4ukm0LsDAfeYezXDkywiYRuKogXiNeMmN8GlEm9QWFCSzHo2P65DVSdICd1LppB/XYEshYH8l+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067753; c=relaxed/simple;
	bh=O1sRYtFIa91eRFyE169T7pwwXOo8vibbwjrf4WOSfQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FbG+7XWPlH3d39TrcrbSTmOXX1NnZ8DFee+2M97SDpPn4BkqtO06rcuIkgz2EMDE5rCvZpMdSrxlPAOESgumAYekc1MNCMU+zw+gTSkvSO8yjvc0/HmdqAys7iqVDVKVUIF0zYTjNoKqE5912er0Kb2+XaEGLMebdTL3267yJ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmbiKadI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ColpZ030233
	for <linux-usb@vger.kernel.org>; Wed, 9 Jul 2025 13:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wExzXfGx7fVDJM1zX5REeYphpIZx0vWkU46
	ZWHHNWtc=; b=HmbiKadIKGp0fUVDC4eIAyN4bMw9PUvK496PeVSxZgvIQjogdZT
	B0vA65jF5+J9o0CMzfwATsVWtrSx5h6/vHGFQWzt0azxM3jWEavdF5Ug4DTHZOgc
	MJSqELwbtoL1CqaJTkFB9RczkNkAkbWe9PmKx7NPiWNf1iA+npHpCB3yATw+RaOx
	us3yQCsbQwcfCmG1SRo0NLat/nOh7rGtPYlMpZ+pI/4j5r9cfGHN69avZWaByayZ
	rXf3fX14mAXUIXf+AC/j5ENuhdXj3eX0197TxQY7M8kw8k4E6Lg4LPMDKQTJQGjA
	It+9RB/AWE7lVrQt9C02vxQHPt9rGjImoVQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg13qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 13:29:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso2642473b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 06:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067748; x=1752672548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wExzXfGx7fVDJM1zX5REeYphpIZx0vWkU46ZWHHNWtc=;
        b=jQGCkDkHTPtc+FovDZgPliaE7BVSKVRh16LUrRqJEBeD/wiLKvulG6647HLK5VED9f
         sfiGSgEioeC82GHI0Lwl8NN85TTxOu6VnFTLl938HIHXViRZ8H7bRuWbTWJO4gS75h47
         z7dsXVJ8vWIQsGkP6oQwo9h3wx8E86GAB5z0Tpsu+wGTMNQh98oBbfRCH7wOMMRS/H0y
         sLADgsNODsdeQqaOLOksYysZbqM3HdcxRotHEasBu5BFlOn93i561QM8ImCu+OuN/8gL
         7s0WszcRUZYQcZWIadZBESbg1Xx0+LLKSTCfI+LOWSnkBjwlL2ufdURg/1xoxrlgl4Cu
         +j1w==
X-Forwarded-Encrypted: i=1; AJvYcCUgatVXYpcerEjWM25K9WBJuBIwlEudsT4Jf8eQl1jLEdCqk/v3ROUD3FyqhrEVv7b261UbKGMNpi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDtoTx5jST8ql/zRs3tRcSOGIDhBkmiIA0LWX2OII/a3FdDYMz
	HPkZCd7fUY6ZR1mvcuMLWiEhPBI1GiBSKQNVEa5ZxbeTr3kWZpzUWmUTCOsgv2gntwsnOD9/LQO
	O4xbGdlTFi0E6fnFjvNV9821+kWvsDMp7vqsN7iUyFOP4McsTS+O2xPShNegpe/o=
X-Gm-Gg: ASbGncsyN/L2LvKEEwH9grsEPdwWaVVT8NYnJmsgkuzNh63qv+GDji+W9M/XCvmKlZr
	wWLhCAcNRiId1LrQaYEMXLBMcn2UXrpFN4fjWn0GL8XWucha5Lwae/IAO07BW23TMe++vMgnrWU
	6dbJ+1t3aDeKgo2TWtVe+ihRnQ6oUKHJDhA6LyntrdgLatE2uP7EpdCk4ROuPAn1Y79Xnbr0JCi
	YxLjlSkRmUWIHdt8xlR+fitjO7hYPBo0PakM/2+r7P/+0Rwt/APZG2jTteUuxd7A6jDnL04GOb7
	i19vllm/udGEOvvmzlxFnSV4bbAATbO7BbTrVkpGg9P7UvIgr8eWo78ZQiN/
X-Received: by 2002:a05:6a00:84d:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74ea66317a4mr4024384b3a.12.1752067748159;
        Wed, 09 Jul 2025 06:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzRHaHSO44BBzmOOKO6MwOJrBeEiWuMWa2dHzR3KNz7K+mwg+WYWP5MCNJ/+DbJj2XR1mU1A==
X-Received: by 2002:a05:6a00:84d:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74ea66317a4mr4024340b3a.12.1752067747675;
        Wed, 09 Jul 2025 06:29:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a4117sm14062393b3a.125.2025.07.09.06.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:29:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] usb: dwc3: qcom: Don't leave BCR asserted
Date: Wed,  9 Jul 2025 18:59:00 +0530
Message-Id: <20250709132900.3408752-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686e6ea5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=rzSUB_1TqBMNDQYVAdkA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: kTzXAWd6FbekwsUY0vYTuytgRRYLR9x5
X-Proofpoint-GUID: kTzXAWd6FbekwsUY0vYTuytgRRYLR9x5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyMSBTYWx0ZWRfX33VuNwI9bT/p
 fN5pT8eL6Sf4tHF9OyuTUz3buTrXIteb9UeutesifbrxdhJQV9mPS0zTtN3ym0aimdVi3jRMB6H
 mXtoTyIkrLrk4WPFbkmPajU5rTDzzg/Y4ku6sb9QPVrP7/QgRcZrTT+dus2UMQFfqYktmY43Q+Z
 MIWgLPIKGboO5yn/c90CpUPlBigEM7WHW/jPDs8xQ0NbQxOdUZvEZaHCg48RriUWcau+f1qiFEZ
 eg+16o9lTj59G51VbLv3Pkwke4hCxkNtuzfedHXu1+wX7Mp7LCfFZAKUKiBSdd4ttJET3oPP8oj
 PU79eXcxcEdcA40XIIJDt7GcXSDMjIR9Wj+LPYiZ7jt2P6R8bhldL5yB45ha/FC1KaxAH/LQIxE
 o3Cs3HHMtRHphyCOtPGlx0dzNYXSNB8MJa/F86xxtOen5DfVEvKhkxKyxDO+tX9NeZNJlePv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090121

Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
blocks any subsequent attempts of probing the device, e.g. after a probe
deferral, with the following showing in the log:

[    1.332226] usb30_prim_gdsc status stuck at 'off'

Leave the BCR deasserted when exiting the driver to avoid this issue.

Cc: stable@vger.kernel.org
Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
Added Fixes tag and CC'd stable.

Link to v1:
https://lore.kernel.org/all/20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com/

 drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7334de85ad10..ca7e1c02773a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -680,12 +680,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		goto reset_assert;
+		return ret;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		goto reset_assert;
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -755,8 +755,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-reset_assert:
-	reset_control_assert(qcom->resets);
 
 	return ret;
 }
@@ -771,7 +769,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	dwc3_qcom_interconnect_exit(qcom);
-	reset_control_assert(qcom->resets);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
-- 
2.34.1


