Return-Path: <linux-usb+bounces-36575-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI0pCEXZ72maGwEAu9opvQ
	(envelope-from <linux-usb+bounces-36575-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:46:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9F47ADBC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42C0E3070745
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 21:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5A63AC0C4;
	Mon, 27 Apr 2026 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvfSHd73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRaKDDQI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C43A960A
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326166; cv=none; b=qv6tEYMAZvq40f7MRBzdBeOyZK0P6DjMc27yu4ml2jG6YA2ayD+qNdrIxb7DaDYvo1Pnu/ojGjQnGE1NuaytqgGXwMwQ98NTXVzTdO8B1NpAmVuknb49xja3+oHsJiBAW95TpFSBE9g3GhwfxbsOxTLz/vgWGN35NcCta1DJBaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326166; c=relaxed/simple;
	bh=Xi8+8vBpk72pueSbcHCY6ojLbswdddkKT2eKqWSkDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qsW8O+H+6L4hnFembrfHXy7WljjVlOCN6iGytqEIRwKi3A3b7Nza2Jpw1lGm9rud3IfEVhvxRt6Kgrkl6PrgfPerl7GRAHjVTC+ONv0N2L84Yu+dXp2kuOxIyM2OcM2zxXGSkvDSfXIvl+TB1g1Ann5DA+NGST45y95CviIRQ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvfSHd73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRaKDDQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3MPm2111973
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkH62hBfkTl
	pUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=; b=DvfSHd73+kAJ0ftwmb6AtqLiKZl
	/OZsa6Zcf8dspJzo8pFLJ0U5Hfm06LdhFRbks506p9SOAP5GTmjuRq2ipIwaw8b8
	1X/nt1tUNsgtjLUQzbhFR8dDiBZtAdY/BNji647aFuis6PdLwxKQwWzTt+1L+Y8C
	9JMfdn10as15aPT41HY+AfLBYv+u7g/pFz25r+W8HmdSf1mI2hwA+Q+xyt39FUpJ
	4fTSknMLwz9/LIm6YLcLViHiKV2o/kpAq565evuI4s9oi8XB0QvudS3XYnnx+CU9
	nzJtVZOMOHEkY/gs/jwrAhpKtvQiUnY4WC+80ST07/LoajcmTmvktJuDczw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbgguv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c35f2c09dso13698653c88.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326162; x=1777930962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=fRaKDDQIsw+T1S83ftK40D3VULCXzWkcKaZ/yMnkNUnIga1F0dvDBrWa2BRu/rYP41
         D4fqXWhZ6HCOn4ZlL33y1jGVIyNsrh4zac8jV8y1tFGXKLdLXruaCOqGTC4AZoqYwWGV
         cn7brPOEGKZQOz2ziaBAZkqWZGCGsGsHY+oxVId2Kd/915rsvd3457nLGZ2if4trWJaS
         +BynrJcBK2noZRbv8qNVi4b21aKR4P2rISXMEL0Ts4yFnrDhvDZSyQZhvUp+VWMHkGXP
         dssqmycaMtSgwOg0lG1tNuQjQ3Vfxae2wf+d496bCJBCywavviaaSHiCT3S9NBWWwUxP
         sDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326162; x=1777930962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=LVh2F2yV4KxtOsAmH0EMEU17w4ay8+oJVN2i7DAHELZ0Y1hTFWxdZCuZAlWktK6PMb
         V9kYceiIQ7Et02Z5MYP9wS/jrwmBQwMuvxQ83cO4GVF6J6bnnbBHUHTqkERLQyNNk2Am
         Oq0zYrOlfD2gecjdJ/87WYpiH4DtSHmD8F+4So0fnlezJlciYiLaWop9keDZWa/sco8o
         1bPLWQNIL2t4E5qqjNHNqX4UVRbk/4GcjGZXGe8U5Ng1THs5ABqJLsRVpkGS0UnTkSiH
         zdeu/obLEOUkVft1D5UWdX2AUG4kPkQmRI06Zs22dhs4OApBdEqE1+dEY4mf4PMSxLpk
         WSQw==
X-Forwarded-Encrypted: i=1; AFNElJ8vR01ljZJIOrJyI247xXDoz8gbzvxUykcSe3XtAym9Xb3UA/GuH5IxuMK6mtlkPllqtNEmD4aAki0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPl09Pc2iKbBjgcJN6z5cjPE9A57qDmngZjAQ7Le8pVOuMZWH9
	v9yyI0x1Yag8cYXAUdyCscrGffzTOW27qkb29Y0F9n0YOa9WqSH6vXR3LRW2iHer0OE1TMPyvhb
	e1A6D4hOjz10BhsCkR1K1nXCdAooYWkL6NBGxjMbSgc+OaY/FbxPs40RB7I/baVQ=
X-Gm-Gg: AeBDievtAHWnFRJTsE0zq3Hbpkh+5+Yp0sqqgAwSHVKyHNZ7nX0H6xJzmhodPOtmVp3
	lR2+Bo9f8E/3I0NUY0YeLk/ZuXV8L94KbeQkjF9BsnmuLfTuUNC2QuuNorpHTvmwp314X0yyohk
	GdmPQ+ACtAaMk2vlZ7KrpMk5DZ2TuLiafuDMUVgTQzi2OK1jURI961L3/0NWh04DgGALbHn0heU
	854vuDj53HlBwexzZTaQRzbOlb8o+51cyUJFH63+V8CBveN33QNjl6ukIyE8yWPwfHGoupCfM3q
	QRJ6aeglvGkje5taayilpWYdHu09/FwwrDA9s3oFj2BO9yP1tCKLHdsYQYk6I5iEWZAU1ib73NX
	WpV7eNKAwXk1LAEhkJJ3jlhyxa7KsQ0FRVnHPEWxwohYeCyF6T4xY0bwRhB/BZQnsv6Z59Rsslv
	vCkD/4FZfl/w==
X-Received: by 2002:a05:7022:4188:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-12ddd987d35mr379665c88.17.1777326162261;
        Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
X-Received: by 2002:a05:7022:4188:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-12ddd987d35mr379630c88.17.1777326161730;
        Mon, 27 Apr 2026 14:42:41 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Mon, 27 Apr 2026 14:42:16 -0700
Message-Id: <20260427214217.2735240-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _6xzt-678elvZ6a_v_ZtXU8nD_6RY5bk
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69efd852 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: _6xzt-678elvZ6a_v_ZtXU8nD_6RY5bk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX63PkC8P7GSJg
 XKu9ChM0bgjQWC/B2MESPV3HhqBRYU6OXwEhSoMVudwZMRL3Kg0UTVSwkw9h8S50RzGFoD07Sm+
 u4EYlJ6CytsFu1/BBe6p4c7nVRD/fhJ7HshbsH0Wt/fQrfDm0jsFx/Gw4gngH0jOnhjLZDSveum
 l7cBcmLjidZXhLkIbbQHRZ7+BM+yt8TUQ9NQ2zK8irXuLrcED/V8bAWXy00y1gFswSA1b8I51Yv
 Ey7bTMvfxMc26veReMTI5xw82HTWn5vhV6m8iZqqX8dfhy8izlnrjyFYUA1STI5LEmJhg5FI7vJ
 8HzbrLZm1IMc2TlU+99jfB5zlKbMOlifNVYw9gh73tAFlr0wCjUsp0GUpzodWqtpLw43Wr0pag7
 SbsDEZvUQysS5NxzPBkON4c+T7V0Ck5wV36VADkIDxuugLKqScV4PZWx4iRx1mZjD3WtOpqbSTA
 jX2gNBOaFyYy21TLkoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230
X-Rspamd-Queue-Id: 8CD9F47ADBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36575-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1


