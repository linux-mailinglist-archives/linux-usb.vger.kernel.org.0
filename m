Return-Path: <linux-usb+bounces-36774-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKBNEdhC82nMywEAu9opvQ
	(envelope-from <linux-usb+bounces-36774-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:54:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0A4A2685
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82A113013017
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BFD3A7F79;
	Thu, 30 Apr 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoA+SLq3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEyDmLwK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9C2C3259
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550000; cv=none; b=qTDUWyYS+lsJi7rD0gSA2HjWsOqUlXMViSGxcnZbseGcAwW7xPKdbxyIffKDkjv+zv5L3sPYYlz8MIUTcFR5AjemgZp4o5l0hzuNuYK+5t41olhkVxRcvyhZvJgy5VDYEkoJZY1kNfpvDTEMH2cAsTYZIjWWkgFxic+tSWCJZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550000; c=relaxed/simple;
	bh=x4eVVNS846ZQHoUs7t/meAjByiBCXhn5YSzxZvcBxhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=du2w8UR5upcANlbt7uGQwrWfKDLvb1RQpuYtY94tqUkQQdljiNJZWrwhoYKip7zhh9mCT34Hwaz45aNYehEfOHdgKj+aCJ/7V7QAIBMjJl4RETjrzPwGKC+swDYa1u712JftIzRdeVHf8RSMdG7Og3FM2Op2OxiFsOZ56sBajNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoA+SLq3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEyDmLwK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBkkFO1821577
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9V8PeHe2/mRLE1vPkwLpjp7J9AlNjCRzuuPJCoF5Ag=; b=CoA+SLq3XMpGblAf
	+E+Vdu4edKZLl3GX0w0lSI8hFwTAMt2yHMPOXqFMlUy/QH8vEgqAjqjSzPa3WgRd
	zVxbdmpg4dq0UV1CVFVPiWCIVvzN2U1RO3E9vfSmN9Xhb1C5HNHOkSwYKvAxf3oV
	KKTo0hPVazt+onvmS2X/p5D+fSyOfkMP+KX5MtJBfHGXusNGXlWd7neI8nyqgYV7
	lF7InDL+GOTAVSVBz2qjXjpj+b619jg/hA3z6draAA3NWiGjPEzBGUO3rx+i3EOG
	zldJBlfj15y5MYyf+ufqy5wxPZ9Cwb6dpVpkg2+pQk6QG141fbs+43/Q1RYwoMG5
	eYFA4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6ger0q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so16693855ad.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549993; x=1778154793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9V8PeHe2/mRLE1vPkwLpjp7J9AlNjCRzuuPJCoF5Ag=;
        b=eEyDmLwKFfp9QGcghY0ykMDSzYkJJQD3L0Om75bmBoHcA1AIbpCpq61TlL3VrbW5X1
         VLCROkcrY2v7FgvL/0IWTRCR4VzZJZp38uZiIN5oAeC6GXiaIqTiFkB+oQq+XoEbWivZ
         TuDJWIZQBlpt0MC5UFuQSJrn/q5DqFBwHgPNV3D3g1P11AK6WMWfTri44zgClQBZ67fi
         3/Tcd8KStiwaChWIBL2r0xe1yJt8At3UFdCTxe1+ZdzUZY/RlOHFxVQUu9DUeBxVTWSF
         nC4qVnrRB/Xu/r0XruOWFfD4ALKMG3LYuCsP0cbSjMxNTVIfL3wznQzOCcj0F1GS41tp
         kK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549993; x=1778154793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9V8PeHe2/mRLE1vPkwLpjp7J9AlNjCRzuuPJCoF5Ag=;
        b=e23w85qa10JLvJNVavGg93mtUWLAJ8YPZjh7+BJwd5cjFaTi9TvevaY4cN5QjJy8Oi
         3ds1A8XQsqGoLCKI6gVjeSXXQl8OACnfcAi4oBfpMzRQdstAO5rjfZ9MmNfd9iItnboO
         lFTCLKNvMy4ZjcX23IOuwYNgoON1HqZnonJC8P7F4QmqIx1EUiHSB6Q3FkVSpnVUiQVl
         CVHYF8/2Ga0jeEkwfPSJcCFrCOsTtSTiYn/PnhqnJgRo23p1JB9noniqUAMTZRO1duFz
         o1binFl8A0qYU61S/5+UycBdZ2jybuM8SIKV6famsonu4p17VBy3RDfRqS3XWUiWRtui
         0sAw==
X-Forwarded-Encrypted: i=1; AFNElJ/jvDeaeov+HiZpOhfvSKJMQIfZ1kNtAXmiuSR8ugdXClyRD5wkK5PAJrFgUrw1/kzuEdqpR1fjxCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAiLHhgvymofF4Q4byEZPakOPWelW0MFRPIcLzcBRjwPAfTRd
	zdJrihtuVRKKQoQ6schmy9sCk4uEulridWMxtaIjwS3Am5aCkRh1q2j0+4m1Rz+mVkiFQaG+/vD
	xwmHRsyuaAbPYajspUYAkEbUSPfK42P+Y/HtrcVsLPw7+ASNnndjc2A9F1OUAvhI=
X-Gm-Gg: AeBDievPL6H+b11PnpQoZnzxGTdy7NRoGp2GRDdTz1p7yUS/j0ep8rsc3s1lXKftmTj
	MaVYnmD52or6vsB51KrDMfULnEaj5uVj5oTZgeeknobcZDP7BeYPE2v1bbSdDvVry5/4bxbZM7D
	IOWuBgLMhNuA8XpLMe8tUJHC8e6H+jGCNz+GcbJzAlXZjjPs36W1rhc2WYNEN57ACjjvwL8u83C
	DLwXmmwlyD8SOTAj1/sIrB7lScOd8nQjE9ExnKdc3WVkgIS+rQqulOZOoTvtglAax1Ql3GRNK5b
	tpbnrmtVP4PIZq/EkAKVGlRDH8rmj/2nNCzudZ5pzRkmHyCSG/U3LxnSG1hSyq+n7zfOYNpNB4N
	vStTBakdoHQkVH+hATVbRy3kEMixArqFiQE+vzhn2jXilYeQ=
X-Received: by 2002:a17:903:3e25:b0:2b9:a6d7:8da1 with SMTP id d9443c01a7336-2b9a6d79d06mr13556935ad.19.1777549993140;
        Thu, 30 Apr 2026 04:53:13 -0700 (PDT)
X-Received: by 2002:a17:903:3e25:b0:2b9:a6d7:8da1 with SMTP id d9443c01a7336-2b9a6d79d06mr13556735ad.19.1777549992695;
        Thu, 30 Apr 2026 04:53:12 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:26 +0530
Subject: [PATCH 1/5] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1275;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tOSyAo4meh2wJat6NRjzhY3Pkc8uEyXIKCYEmOZPudI=;
 b=3CeDKdT4BBdhdAZ4vvdHoJ7wHxcu5W+RrQeXH9F8VuUOb3d5NlP/YiEO/+US8kJiIee9s8pov
 OPROWHukQNfA1DECuA06jqwntdAGRgH+xBOOcDo4Nx3UJjHRMSFeZqL
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f342a9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mkQ1ARZptfdP9UuQ85IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cjGOejIH0x9MmfOMC4owVpBvNKqFT8IM
X-Proofpoint-ORIG-GUID: cjGOejIH0x9MmfOMC4owVpBvNKqFT8IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfX7kzbyQ4jpkHA
 5XNhEYH5cpAuEy2jYa/FvnVC33MIqokBh1dZOR0Pgw9Kwigs0bbFiRYAQJnKSL0rABS6vrrFh9G
 xmtdc39h8Ozizp2Smk1VqKbfIOwGF3LpuHxnO+4n6AHEth+I0+TvOpWnG2H9eKY8ge6uOV1BULk
 Dt5n0JKhyJHT0aDGngm4r38ZE3KisfYk++6QvFJb+8aOc+cP7WHxhxCZX+MqhvwwwJn96RQXOML
 tyaxwX/rwczZFPgO0beXC6muxdI2n4UJ6klA3/6QMpjOsVITwRjO71LquwjJaDB38rNCYnMrHs6
 KDCra0HNoQJ/1kIsod1Jn5roiCOiOpgevUFcY7j66vc7zzLJr36EafgcrFUMzRhK6MdvItzzlP2
 0Mpdzn2+fHFyNFbgRlp3ybqk07LWvB93gim/Rn+rp/ZXBCypql1kviUZkV6kou+LOcPLpnZiWSl
 p9iLLftqhWEdBbwlwOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120
X-Rspamd-Queue-Id: AAC0A4A2685
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36774-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Introduce the compatible definition for Shikra QCOM SNPS DWC3.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..68d0491dc653 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -386,6 +387,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,shikra-dwc3
               - qcom,sm8350-dwc3
     then:
       properties:
@@ -456,6 +458,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3

-- 
2.34.1


