Return-Path: <linux-usb+bounces-37684-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP/3K7JHDGoMdAUAu9opvQ
	(envelope-from <linux-usb+bounces-37684-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:21:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC9457D725
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CCA931FE62F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E418E370AC6;
	Tue, 19 May 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvzVjYFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLgPnZT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2C32B121
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187693; cv=none; b=L9OJ40XhkSrCTsYSzhlyzcJoWOMY3rlailGnIRQT7LFOp+tZVGxj8M8IsIjNkEhM6yXQ0bZSeSFyCcn8+1GelXEntYl1wjF87bLR50hkJHIHXxlvOLnC6a368C5qPoHRl3asMRkrTav5yB5kAmDgxza6WCzhD9eMGa3pivSNlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187693; c=relaxed/simple;
	bh=4fWwIr7NvRH0x6FmEzFYjJm0PsCxwUfiJxfBSBAF93k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bK6AP4iJelP6+7ZjX6c33kogM0pT9GpkWH+OdJIyn4kbEkoekpkGvUIv9RiBONPkT4T/1UHN7uLcWYtz2d5DYqO+2ir998CICZ9ImvfOxdUhNet/GGxZmk0csg+ZauotkcWdkcf5EsQL/CKMfoPPDVELD8e8hKRXo2FYL9qoYSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvzVjYFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLgPnZT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8A63L2975542
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=; b=CvzVjYFRfE6ul9mG
	yP8OXxNOsI2nmmhFKzZs44CIsDWEM2Mu9/mVTJ7KTg3tsLnikkv7ZD/XoIpuoCr1
	CPat8/Z8o6i1rFsLTmsIcDETmZ2Ih1MQSmJB7gfj2dEkuwQrIqVgOX2VxXJe8GTH
	IVD2TQIc1Gn9DWReDotAyd8mzbeniXkueZXmNvY7nZv2RB8GhT8wB9GF0m38tvAX
	m6oW/v9yuPp2+OQusk96znYiu6CD+sGdrKEfnfbuteHMcu/82SN5+0HZIb0VCpOx
	pZs9/ROseewOfSsSDSBISpm6FnuC8p/8CmX5aRNLoLgldWtQWKmFOPRaQpy2s/7X
	2a1MsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4c2yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so105745601cf.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187690; x=1779792490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=;
        b=hLgPnZT0tXJNcPoqlJgtseF/LDtapK/9yEebR7/ulkIz/7F9yuUttAC8pSRy2rda15
         eEQBN0Ri84JMcZp7l1BUsABV8Meyc89DYRGicNfSUq/ct4HRFaufKhZC9jxmluEeI+Y5
         f1i75UOqkaRdF1vBrQeosKmcW17aPw9iaVQhSoUyP0yoW8bZYgXBiUe6DX3U2IiVqJuz
         Zjrp0Kyrnohe/M9/+AWk5D0Lb3OyaumLF7DVy2QFWBdvEuaPmrOSmmZgaNO0XAUOvbMP
         b0GdNds2DTB1MQ/nrxMxaEwtTgk4idq7G9LzBNk3LV1sHyhe9mqTQBp2kki+PIcxErOg
         B5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187690; x=1779792490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=;
        b=kesWUNI9zXe5QYbmf+0dmEeF0XveB3ralQVMx6MFWyCeleWppc/U6mBcYL6qkbOUc0
         fr5B4fqL7RexX4jlKpqN2Ga+grC4SVzVYm29fUnXF0CVo0soRw1phD9xfxANbpr8lC1r
         rejRNuf47Mzy9pWY9ECJC4H39H9UKSeiib0ZtJAtM6rt+h/xVqhYGrqUXOn94ebW9Mfn
         /06dGZrnGSfVqmM/RdBmzn8T3TGFKNnLR0+obR4SVYJQk8pMP8D6r3f+Z8RlZ4JCt4Py
         NkS/kW+nmtRI4kldKozIHuMg/nxzHZsFxi08ezSLRsVM3JgZcj+fbU6Ady+V4QbnCDoZ
         D15Q==
X-Forwarded-Encrypted: i=1; AFNElJ/XflR1qHv7LhW4gHKozk7vtjQhs4zHKCJAegg/nAndvkGSvQ/2dIAfVe9Ill6VSGMHpL/7B5OaI4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSjgRYzRSNf9VzQEuRh/KZbVSxsObn3IffyBI65Gic+eSf0eI
	RRrn+OhLdXhFOKxEjl1eklIFm0UICrwFnosTiAyI7Cte65Qy2+1MKhHWtVq2W9yUPTv0P8bkB9H
	bySeOGzlnkW8bMlWotA7NvmhZAk9/0Lnv6qhKjqT+CjdbfVCizcQ4Y4rEjkvsq/o=
X-Gm-Gg: Acq92OHTl/Oh43U4nXmBf6ibteghDiRGknTqA9P3nqF8Uuzbi5PLAPOTVE0V3eCFtdp
	dm4EIsd5FQWpred8QEm7ngVkpq+AwJ18Wc3esZxKwvRnELClyXLriuB/mUm2FCcHWZSpxyCqvak
	IhSlf24+0NEbIfKh9IL103z7cM/5b1Csz6/6t4e1tM6HpW2rsOJDUBPx5d11KqZ14je/Kk5IZ/W
	3MhpQ+fLTiROHKYseucwM2VMt5cA/PzIJMNAbZgIw+Y+6D7mHoKs5JfrekiCZ9UWH5x3lzaPZd9
	DvxuI3v51NG70vgVyasiqk1fTxe4UGBF3rSOgSPiQhgChDM2I/vKoenx15pNiy09uxj3NKn7zMK
	cnUriHY6abBSpk+qIH1cnRQO5YSlWRwrUGdzgUWJFhMRMTrs+F3Ot3j8NhDMTQk+ZFqBvzspn64
	liPaOTWNFJMP/+7puujBJx5HGUKJ2FpRrIcok=
X-Received: by 2002:a05:622a:1e89:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5165a26c6f4mr257681601cf.57.1779187690362;
        Tue, 19 May 2026 03:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5165a26c6f4mr257681321cf.57.1779187689930;
        Tue, 19 May 2026 03:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:03 +0300
Subject: [PATCH 1/6] dt-bindings: usb: qcom,pmic-typec: deprecate
 device-specific VBUS
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fWwIr7NvRH0x6FmEzFYjJm0PsCxwUfiJxfBSBAF93k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mDo/9hF9YmNtf22Hh0vmjASmvXnXTPgK0e
 IuG3QEymNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1V9oB/9pNJFUqdVJq025KehmqUU8Fg75+ChcgiP/zBpiv6i7H/kt7vrPuUn3xRMtQSasoZbHYvW
 7zuIFbTgpj1gVBS/usCI+GdbChO2YI6/Jm1aCHStYBPRVIfHY00GUXfvcb7IpJIC5RYCC8ootxu
 1n3p+7NnxH3OCFC0uEfyezt1NeXj1BcsVOLV7VzNv6RtC9zAlLOsPOvWmY7AjnQ2RueK1VHM7Gk
 XC+bMZT7Z8V1KnQ09qX7niKQs3J1F5yV9eAFCA5Yf/1OKV9C5HEFk05YNYW4RGqb+SdTDG8AVmH
 Ci8UB3fiJk1FWmC2c41K+A0/McTf6lMsS7xSXelzfdqI4r30
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c3feb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NGvXnOm9UF3A347_PzYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8RIj5raNhyiEgIiCll-GkX6YbL8amkFE
X-Proofpoint-GUID: 8RIj5raNhyiEgIiCll-GkX6YbL8amkFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX1Aib2M2pGBV/
 i1p/ew9kLIuqxJvGq3uNvCElLt3Pd1L18245WdFXgsAYJkbuO4uzVL0s2/8k2p0WFa975okWqto
 G2F1gDeZKHFb0z0nx9mU+/yG3ArlpTKA/sjH9NZm2mmXS+1x0s6dnoYZEWIEM5x8a0MaTU8ov25
 Q7JUvHY4ATThXiMEHmPvDRMM0qXJrnpCRpZ8aI7ZmjXXUVW7w1eJLIK6ceciM1D1tra2jZqTDoi
 rTB1xrwPux4W0I0FbzwCsZ6OshXfSL+Yq/SvspiboLic6eA6TY0tjgUVMpUqpKHlw9QzY39d1Tw
 TLXYHiRzIzYFaizUTZAHAchMq89cNcjr6gKOGP9YmCRj4cTTu/N7R2lKnj5DrdPUH4hnjdU+ZWd
 HVO5RmKTIiOg/vf/xEgKli77T5SC9ntkR8Y5iXJsOwVVxjrFps8xoe03bf1WmiFRx3/mizTP/cs
 GEwi+xhFwwBpy+RbuPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37684-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CC9457D725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMIC Type-C devices historically provided their own way of
specifying the VBUS regulator, via the device's vdd-vbus-supply node.
This is not ideal as the VBUS is supplied to the connector and not to
the Type-C block in the PMIC. Deprecate this property in favour of the
standard way of specifying it (via the connector's vbus-supply
property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3fa2bc9cee..7a68423fb97c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -79,7 +79,8 @@ properties:
       - const: fr-swap
 
   vdd-vbus-supply:
-    description: VBUS power supply.
+    deprecated: true
+    description: use connector/vbus-supply instead.
 
   vdd-pdphy-supply:
     description: VDD regulator supply to the PDPHY.
@@ -94,7 +95,6 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - vdd-vbus-supply
 
 allOf:
   - if:

-- 
2.47.3


