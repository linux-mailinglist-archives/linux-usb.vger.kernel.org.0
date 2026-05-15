Return-Path: <linux-usb+bounces-37498-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AES+FssAB2qVqgIAu9opvQ
	(envelope-from <linux-usb+bounces-37498-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:17:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40454E3F7
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5966E30A9CB7
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E12C46AF0B;
	Fri, 15 May 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYBuTwEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cO3IUEcW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453D46AF2F
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842077; cv=none; b=hv3HCWvwxU92oY93IRJr4KwSUZQsxjeISAHTXhBvb5hBJgCks5muknsdHcMaFzn8q6OzBAB/YY3LDk9ITeIsQ1RHrqJ5pDSYfu8Gs2Q3NUNSE8hV/xUUwhiGrU5ctGGlZ+ROmWGkhmN1Qllz1TVo2zj+l4UVTXHIEtbvh8hZUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842077; c=relaxed/simple;
	bh=b71yeC59/LhtW1vdjS+Vxsre1vTfwmr11fgGfIEr2bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0dv8uPQR9oqZhy3hchh0SfCcUFsLnG+Sx1wDy/8ctdvuB2Cn6zaueBEAyL6gE85kH0lB9nggDdHaUnltXq/JsCSy/Uyu1f6BUrIn2bXGxAtcO3QelQBLSdFYZHry/yqjIjcEFVGXyyvcqhhxGJlUUVkMahgAsTpqi0puhzKn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYBuTwEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cO3IUEcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5M0RK3200291
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5cWGH4JJiSLE2yXBQcPdSMMDAqUH64vfOo+b0Xkv4A=; b=BYBuTwEL/MoUHQb3
	N0SRFh/E8vvJsZq6w76AFlMzQaeCwRx8ZiDDkb2lhO2FXgLg44TW7YZahfJUSLiT
	A0jht+V5m3L8h71CfajHFWEfpr7ukmQzfXgaWrulHivwPorfLdAX6FVgoz8C2Sh+
	h0LzwKNpuo/yyytWx5PUppK+C6I6KHJt1JtX2JKeYLSUT53dShe7hKbCKEj8O/l+
	xfFb6S6qW2W31zo6QTbY/wuunw33NgvfSVMWmh+9CiVlekViGTG6QfUHdyelwAUp
	UAOcTGoPtIjIru9NkdwHksd3E6e5L8+pF5NbvtbsHWaR3HNSJtZTe5B07DlVZ6Dr
	mylqxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtut8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c823549b1fcso12266603a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 03:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842075; x=1779446875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5cWGH4JJiSLE2yXBQcPdSMMDAqUH64vfOo+b0Xkv4A=;
        b=cO3IUEcWrah2FmOjE9cykQu7F8JFCy0bAXD5lcFafBDvO82IWYWAInkkNNTdNn5MO4
         CoagzV1eKBOBbzTboIFrINWXfQZjnOgqts7sKLT3UAT6X0s7p9bbVqBDEmrM2kCzAi1q
         RcbmoarGRBAlC8y+eiIuq1L/1MSGXeG8CZWWaxJBbjJXyVChO9uqGlXu0pGeuBzYyAuT
         YramW/AelUNtYNbNcDtmuOFjG158vtLIomF5C8vb0j2P33WyO05ou9Yt63g04KxdD949
         /lWaGaAjiQYwfxnT4LdiC1aiPro0YxO2TjnO4C/UDvKhaxir0FAvkSnc7e4hVxqrKPjA
         j7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842075; x=1779446875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5cWGH4JJiSLE2yXBQcPdSMMDAqUH64vfOo+b0Xkv4A=;
        b=sHautnpOruPP6VOwzE92K0uJBOSjSnRc+7Jp+yuC98lJYRCjVxxFy+nGHhBWs17y2/
         JNTvdJOtW6hEUzXFnchdlbECjRDG6id2+yxjOS12KkWLR554L7VR0dxl5cdHh+RN6kde
         qkBt42vk2TwlqB3Ldp3xjFsCMV4sIJj/bS1F5UCnXLtMOztxFbCNs7321EdyS8q/y1Fg
         Nx+y5pZD4vRguxwC7azKfARz3PyOqe6P7cw3CIfQNhCOtxFMQMsZMtbA6u5Sv+ttsnCk
         Ry529ZdIeair8iNEMsVKw0pekkrstCWhCLjEOa9xRmezBx0RhRu83mUVjvueG/3FIm/z
         hv0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Mt5LSXtBwaEVFboaHcnIsu6Wm/OlCoKZbWZfhU4LyyXpTAiNx6iccQqtOo8J5Mrf94b+yz5N4uAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMC8J70aALPsftDIlDFNTeP1hlSL0b3bT/GtxC5bX98USj1sh
	Dd5S5wbwLTNKn5bCEQc0Ix3/NrNErRs8xVP97f1bSxYIyA5wZ+lmR9ReRIrH+V2UX8wc/BtphTO
	3VEdph3q2hDOA7e8jMNt+AELeH2TxeUpUw1La1lZX7PNKDjGFOJy2JCsOjkecNMQ=
X-Gm-Gg: Acq92OG8pz1jUK/TfUK8y1SsSU2EFLEb7/toj2tXtLMB3rzrIYMlrCx3QBtZLPGXjzj
	AenTcdZXrFogLypJ7DYafToDPSeedAguzL/zdtud/lg0tXfwFwIKBgP7jfV742+ITrsEGOZ8tZC
	AlapR64Gi8IRHTLoA0olyMmMQOY+bkOjTr+FBGUUY1CTTnOEFsVQdgTwfUO3z2Nl5zgh7R3lHEV
	ncnTC5B1biovp//DeX353SYwOVvwaOR+z7/rX+JQBjXPFCZcIk61ndIWJnoz3t+D9SWnXte5Bcl
	fGADfwLEAKu+j1W0AxpkS9vTijMv+Jn+svlNkDHILPnhUPoMeqnAmYbtNUlvyNSP/e+MR/wsqBA
	ERsJhDjsRA4XSYg4saQvX2w1iWT0PS59XYrfLL/PZzX1in+hPZyR0ZL36XLVodWYiCawmZwJndn
	0iOZLodP0nyCBn5ci4651N74n3/X2KAEzeZ6pJ45bYxLeTms8prtk=
X-Received: by 2002:a05:6a20:6a21:b0:3a3:472b:2e6a with SMTP id adf61e73a8af0-3b22e843edemr3802335637.18.1778842074566;
        Fri, 15 May 2026 03:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a21:b0:3a3:472b:2e6a with SMTP id adf61e73a8af0-3b22e843edemr3802305637.18.1778842074098;
        Fri, 15 May 2026 03:47:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:42 +0530
Subject: [PATCH 1/5] dt-bindings: phy: qcom,qusb2: Document ipq5210
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f9db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mYYFkqwxoXFK66vEoW0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 6tZN9GFGzp_G9GYKY3bvX5_I6LoOLzIR
X-Proofpoint-ORIG-GUID: 6tZN9GFGzp_G9GYKY3bvX5_I6LoOLzIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX5G8GpFrQ9cxI
 Z178ssIzly/e85ZD//7pdE2rlwnQwZkLDcNKNH5stWJURI2oOfs3xIFHjc4RAPHYZr8ZWqZKy3u
 L+uiF1ySowMFy5JEaSGQOd7XvEbImIVUUM1wkjGpydW8AoQkw/y/ETJtJGXcvsfCoWZupAAv3Xj
 0QO3EgiQ5/a/iviScCs8q4l8iYQTjXY4G8UPCr0ZvEeGmkGjuz/rl5ysVQsP3QYoe8xRAbv3Do3
 qOp1kOZQLM/wuZxCCdnZzEDNwQ3/u56tPzvXvcNJ09j7jwIM2P1qvW+aeDSkCTKNsileejVpgGY
 ezEOHRP+GzDtDXHYqgCcu6Hrw0Yg2KvnvuuuDEBknJ3LBCxlOseqszTIt77PSNOi/Aj8kyUZv0z
 Ok/OC7dSsjuIWua5/8FRQWw76Z7OzLYfU8tBa+0KJRqTjUeME90WxFfPxRm4/IIzEiSubIXW+qu
 /ttk2lONjroCawhOqDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 4B40454E3F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37498-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the compatible string used for the qusb2 phy in ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..509cadd31adf 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,ipq5210-qusb2-phy
               - qcom,ipq5424-qusb2-phy
               - qcom,ipq6018-qusb2-phy
               - qcom,ipq8074-qusb2-phy

-- 
2.34.1


