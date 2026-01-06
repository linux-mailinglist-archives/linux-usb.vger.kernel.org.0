Return-Path: <linux-usb+bounces-31965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8991CFA4D3
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 19:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B17603012EBC
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 18:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1827C33F8BA;
	Tue,  6 Jan 2026 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mu8cq5g6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzVOxAJ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9768C2C21FC
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725427; cv=none; b=KZDHujj1Jhgy8a8buF06sK97Ri1Q/DAvpHNyJq/kET7lbUrX7wqxmA96VKW9NgPz2PrhSHj5OX3MLB7lmiE5n9MBmesudDf2mnGgnOY11aRM3zsTsUGGiQ5o/PvLL8YeT621SAlpCWW6SDux5AlikMk5hGW9NIvDQlgG7S7vQ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725427; c=relaxed/simple;
	bh=WJK8v+ikfFWQ8X+AXUePFUhOsqrjvPa6LQ6zJRngW8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFNHursPk1nqb8G6ydP4YmtM3tP3gLPPZtGxcrIkQl74V6N6BqZnqQqRa1ukSngEYOzNYqiBjxqmESeu4xfTkneceUuci1Rq7WDbUz1eJlEQd1OiT2WRS6Em12hwHILj3qUqPmshC3MorRi4jQqgn4sBelAvDClUqBd16ImvkwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mu8cq5g6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzVOxAJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GiqNQ959394
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 18:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oxGyO55qREF
	giCeWyEmjYD1S47olcVgOHj5KlI5qppA=; b=mu8cq5g6eYg3Ehw0g+8s7ZTgLqi
	+eOuCsOPXXiDZulckfU8aL5v+J19pnttHgskgbCNYqBDHriLP1NaRfMTKqhNPMBq
	I/3T8q2FpACEtonTm+TPv+CvU+N21d9DeWi56esvxbI6tef32odmZrt/OZW8/MJs
	E6PqvyfFABhW9diggl3j+vhtDY5e9AqD/lKGpLU9lQwiKPuy7k+cnY9lwT09D/d/
	otUoko1uZMiB/cX/hStrStGzsaEdATp7PQ84uts1/CM7/jIdStlMnVDn2MsXCzVH
	UhYdoj+h9YxrS7zpchSrHi7xoZ9SJo2COanazgZXQGFFZC5ioW+jG5vdK9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66erckj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 18:50:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so43281cf.0
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767725423; x=1768330223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxGyO55qREFgiCeWyEmjYD1S47olcVgOHj5KlI5qppA=;
        b=TzVOxAJ69rALZGVEKDxOz41pOfPPOCOfVk6xiN9/6Kkt8uBXYSTiFl/mUp9I1m0BiX
         Rqxl73Dr2ALYRQ9bh4mx6V19/AYq4pZtjPoWy9DIq1EWLwNjoiKszjlQxj6HfhgNRzmc
         bYhKR+x21hnGLKCiBdpj/mggMPrWLFO+OAiRZfiIp3EZalMrAyJ8vFMVV3baR3iZiNR6
         e+g0eIAleDfMxPq/Qkau/QBtLkIq19Exl6t+n7RfJQnclPQELaGpEqfgP8K2Nxk1LE7h
         7kA76Hqy9UDzZS5zSttLeEaTtp7lcz1DlIKTI3X0QLKV4TC7uu6pGcf4BUumvsIluykf
         XdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767725423; x=1768330223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxGyO55qREFgiCeWyEmjYD1S47olcVgOHj5KlI5qppA=;
        b=Y2sP2k1whSHNGfDECUXP2ICoSd5kK0eFk5SukjOtnx8zkrAy64gm4wJJCvhC+hgZj9
         fzIm/eNciZY1RNkZzmZ4tR9OvMXnk4/6nbOm1rwwJeGHn0dSJtTJ6Mscwa/Dm88xihOI
         zvo/lyJo7YvOiF2wlTv2ixXFPdzVplxLYEuxvUG0b+EhA1D7AWEdhFPKciNEItBHZI5b
         07OZWzT5r4hoRi8KvH+9lnHCvgXaub3i/3CLa19WNv8hGZO322K1hMLMRVn/TJrDe87i
         utint/etrJ096OQSQeztrmBiMSURmt3Nzhcm/C2iXMeXnS+emqbksNfErBBVlK+al6uW
         Hmig==
X-Forwarded-Encrypted: i=1; AJvYcCXPVnZB9Z26lKV79/zwJmqHvRmwj0cIRsHX4+yvtYI7rjd7sruEFgy3swVOxrvQuzg3dXPx2Ml2ydc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzihfq8yaxIYYGyEUNPOd6qV/1rFjVmQomXaH5vhylVOai5I+4G
	y/KSdRyIw7cDNkABgpZKSoTp5HKxE4BfqldoFJbhBzX8IzmPW4E+hp9jGjuDUenKbDR8jFXMQ4f
	pbTEo9GPARhyTFtrpuRcKrKuJdxe2mRPmSbzK7hkQbDiaZDbs7cK91I4AbE9GWmk=
X-Gm-Gg: AY/fxX4nInljzADmYLtIEG1MOL6gTvvli+37k+T3WTuT4Q+WTW/x6gjzB+eDUa8IAZO
	THqeJYx8f1BIwW3nbY3/PPGYScLJzf8JkgL6q/drmut9vdkNLLBaxcrRRgIMycKUnTpminBNbAj
	eOMZiEBMuRj67ifCDYe8NClk1Qegt9kObKmOBrmiLBA/DWI3s+rMMwrO7PXB5Sp5E/XdoO+Hgk8
	2mY3zu20EYocBOXNEMG6spnLeBOBtqjnxlrp4rwbV+XIA3IK2ccTEq6U/kLTOwMfkAya6ZXmmyH
	4zeePlJYtuMP0xt+fIqW5ntP3C6ZUx4t4tpxypjHdZIXST2p0YtdgtF3+lfRdsVEBc6ghuphngf
	luuVMMcsuQMVroleupmjT0QleUA==
X-Received: by 2002:ac8:5748:0:b0:4f3:5112:e379 with SMTP id d75a77b69052e-4ffa8418e5amr50859261cf.15.1767725422915;
        Tue, 06 Jan 2026 10:50:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4Y92IeccfpitSC+enhXDLNOmsyKVl7flVd3QYettphmAz61z9ta2Z40Ms6/errATxK6D0gg==
X-Received: by 2002:ac8:5748:0:b0:4f3:5112:e379 with SMTP id d75a77b69052e-4ffa8418e5amr50858871cf.15.1767725422457;
        Tue, 06 Jan 2026 10:50:22 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm2885576a12.19.2026.01.06.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:50:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Correct MSM8994 interrupts
Date: Tue,  6 Jan 2026 19:50:14 +0100
Message-ID: <20260106185012.19551-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WJK8v+ikfFWQ8X+AXUePFUhOsqrjvPa6LQ6zJRngW8A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXVlnTeJ4EoXxUbvJWsyCmy7cKKvtS8Hmh7128
 zt3ysrs6QKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaV1ZZwAKCRDBN2bmhouD
 1yucEACZoVM+YW6qd4zQqB5dvpPXjA1DAL2M80hQJEsPNWq+YgVPrXzueR/Jk3L36nPk6bwcXZi
 CDEgWrkSTQ2wdLrI10r0WKk3yHpFIuUXeQex5Up/r4WYJiLZfOkP1MFB0Fa6dm4+qZ7YvX17zs4
 6KiOUboig6h+oCX97le4zj/MlUuQQ/V4pelKVhHLAnWr9WquxGjQGOoOHsWt/dJllTgLJBdkG57
 J8DZzDyPUPPNjPKSJMD+DpMCFwITI076a90Knsm+dF6IWyK8cnoRbQISDC4EU5Inbl9Md4+j/mb
 PxoorUx84vaqgWCjc6HIPLnY+Vx4YG5Gbpoin53uqKZxhaoTubCAo4jduOqUV9TTnAbqFLTynCc
 m6e9k/w/au07wFmfSc6bhJxBsLpD41P4B69xBKhS4RCKB0jDOZRW4qis/BssIMK2H5sP+k8no08
 /2UwOVHLT6l18QuwMsUPau2jmWJfxxZZkcfn2V4HP3obltPenW7WhXu2f73xvLGjEk9yXxxd4M4
 2VJI3ftH8E2i9Iese5RpOLuDmkeezOHsK6XI7mOT4k2l0KaW0Z4AUm/vogTG3VORDxX7mEr/zVL
 ajYBwbk1IRCL8z5WQuX/HVZBp4JGs5qyMppyl6cQSDekSWNS9gVKWcdMQT02uY7Dqcb86NJ37bS IZWB31tHRlmLFcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MyBTYWx0ZWRfX8GAJZYmsT1R9
 Bjf03lCY3qO0Y5qyrH0cAJiKGYuxL4pxiDtKk91XPsbMDB0OVxkiMre2/1oPk4VrreNg7pQIlJm
 8Z3HYVhRSds8K6JiPjFrh9dQ5DCC5821672OV8ZcBnIakr9Lt/killTF/Yzdg5fTFuSfu55sY32
 gUMXjC16MDlH1JtdnM9iMKgYQ+6sc8QncaCV0cV47nukH1XxvO5HJ/AOUuV5jubLesgxwIrRyqO
 RPc2mozl5EiNJ0x8i9PoscnKIg2SPGfLSnuQMWpllyeBSzxA5SSyMYw1MUcqINFgvCWG2e7ZpP/
 nyuwOcoI1ivbtrZ+skZmQiQVXoliZeMZggdB/qlCj6ewhjJjfPsfT/ruFp3DpzvbUaBpJNWo4XE
 aT5xd40Ms8C+YfuePgERGGRUl+n8t3geETEWHVx1N6D7mUFYk7INxmfn3ouE7Pf0rqKWZJQw2c+
 MY2EMOpNQhsYgkFFf7Q==
X-Authority-Analysis: v=2.4 cv=HccZjyE8 c=1 sm=1 tr=0 ts=695d596f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3SqsvWQJRDs5ZQVTcbUA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TiMULWyg1DZv30QsrI9z1Tj0BO59QjSV
X-Proofpoint-GUID: TiMULWyg1DZv30QsrI9z1Tj0BO59QjSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060163

According to the reference manual, MSM8994 does have QUSB2 PHY and does
not have DP/DM IRQs interrupts.  It is also logical it has the same
constraints as similar device: MSM8996.

This fixes dtbs_check warnings like:

  msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
  msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
  msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Fixes: 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 2 +-
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 7d94b5f7d8d7..c7d76a96d0b4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -429,6 +429,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8994-dwc3
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
@@ -490,7 +491,6 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
-              - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 3073943c5964..7d784a648b7d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -442,6 +442,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8994-dwc3
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
@@ -509,7 +510,6 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-              - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
-- 
2.51.0


