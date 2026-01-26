Return-Path: <linux-usb+bounces-32758-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ClcCUj7d2nlmwEAu9opvQ
	(envelope-from <linux-usb+bounces-32758-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 00:39:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F98E433
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 00:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6D18300B9C1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72C0310777;
	Mon, 26 Jan 2026 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dw2TMeN3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jd87A3z8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14881314A6D
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470724; cv=none; b=pzeRHs6srVZsezL0wJPRWEz5U8AJJ0Mo2lenQVVjxbXB5oxJphEZDKrfflY64YGgLZfnFe9/7WlxlmM1GZS+0K02DzDhWPXEW/OWjBHu3C9WRmpPUrsm5+fH07Ml8jlPBVOLLXCslrbtbD2cHcTMzApkvWKMWzHl+ytAh/w9XLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470724; c=relaxed/simple;
	bh=oJZEE75ljDhbxjPAjmqXX/qekCyAnUUIY+vndlyCRTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pBuIL1cjx5w5PdryT1T3ZR7tBUoj2vCuY7/LJ2DZsRcdJDuwQekP15Pdd2RzLoFXTtOo/2LKEhV/CGQAx1Fo1MdHJ2tvVU/WeWU3RjB6VQqZmjti/ZEmPx4JMDa3aehUeeYQy4SplnvaBquqgBqfXaymKeipy6ZetUfJXMVN9p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dw2TMeN3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jd87A3z8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgDRe2880088
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YodHWG0Qjmm
	xJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=; b=Dw2TMeN3cGX/bc3JhndNUoL2Xax
	4r44DIz4/ZvCanCQrhrWPp24JbyhRvbnEBNtcd0pfuZf0083mwCN+4VQG1tEZzXx
	aedBQWZci9N2xHlgCxNUAfHeK84OE8i4MPV/zx/XRo7XWKi2g/GMHOWOohZ0vmvh
	fKaeOZ2OCo12rBx2QUTtUcl2sI50odA0X5lUZzxvVQOYu8O4aQP+CUxbC7cE3h/8
	eu2NPEo8KEnyFZpcrDho3txoR4QtXXVCYRRSn89h5HF4Td0ZUt2w9XL9F3BpbKMC
	tW1CylE+mZxh6upxlZCAa7L7p7k8xxmvlRmURDcqar+gyCLuOCoJ2L4bHfw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0ctq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339e20a86so5727071c88.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 15:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470720; x=1770075520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YodHWG0QjmmxJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=;
        b=jd87A3z8j1naf9Q9Lo7y5eRxReH0nqo6cWj5MpZGZbhyVRDXiVKIALZtvQomlHFb5O
         hsPaoJ1tEk3T13JFWD2qk80F5xO3lCSl39Tf6Wo+cFmUZqCcxpNe9/K7h3T3vpQz8LZn
         uulAJlBkQcr+Sn0Et5Hp+6SgZoBRjkyvGJ56+U1e8txgpOy39/GunyRq8koHTDK8nEWH
         BnLsol+HjNC8ej5hlCfh8+mPfpSf4HJxDaGuG2LFmxdQqSS16YK25OrL/Vfezgn+KbX+
         4jdejbYEOL7bAwip4FhtmpkwTsq/2/u5aT3EhiXVOZCDYEEU3DSHB2gROXKx/YLgouib
         hvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470720; x=1770075520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YodHWG0QjmmxJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=;
        b=fSN8ynpLXIPwvEBg4/tFPeQXmM9ZNkMJQ4BPDkXrgDvCOiOI3rVBYi/2bDT0xhMMk/
         REt507+TrTJCH/MvugJsVY1W55aofEApF74WCTL4NzW4XgAdzMmO/ePnsVzu4j5sVOw7
         ejzhNPi38YLTDh+6xREff41vlGg46G+qayycY2HnwomgLDObD5l2FXQ7UHJh49WhbeyX
         moab7+fZe1sIbFL5zHm1AWhuPAUmIfiYgmL6La50QrAanH6CSokvIXcSRNknEI9wE66e
         7hLTSIv4P4pZZRsxlcL1a3Xx2N61YbnBS0whF+DqU6UcxLsIn3dl3ZyT1nhwe29K8ET8
         8cjA==
X-Forwarded-Encrypted: i=1; AJvYcCUEhPab3rgoVqBRJ3/UeGI0dxocrgFMThR/0rkjyCRq6Pl/0XWkBPUai5+I0mYXe5QACR9KFXzH+FE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ylYcjMRE7VXXS9Cie2wF97h0JCDtGQpc5dpES7LEh3Rx3ZZk
	xZvjgdTRlD+EcJ5eDkV0NhBkdFsj1j3ZeySE7YBr8r8ijrK+jB97luU60wpfEhgnFlqmQgIx7Gh
	GJ/9phwL/vuWpjiPBi/WO11NqbvznO1z5Nk7lqceVtB3Ymgyoy8bKwjnEN4d0hwQ=
X-Gm-Gg: AZuq6aIzHsxzNYLNTHZvtFMiQ0d3U1Cp59jv7X5noHcqeplaV/l6j2ZMPlo0gIpgrB+
	FFj1raESH1TsZIHeDGArNCIMLwvoTh/FWX34n7j4a8hi+h9t6ol9LyPhGl3JJBgkP1ZuaTMXU9e
	DOsBMC8VMKAnehbOoQags7jDFq0b9G13rcklnyAjDbb+o9U13WLrw+rLiRDvfvGkanINUrnAn/j
	+8rE2EHG72UNfOfrVVYQaqL12aDeFq//fc9Z/20ljqeL+u1l2/IOMdUEVmzrODFUId7OqkN6CDZ
	yj67aHS1VdH74VA6YmSyRGKBPCpKVQsjtgB8q/SRTFa953mSHCB2m7+oZaNMU4IXhadRz7bB4N0
	+hNZfzJA8fH5tYbHuyF/djoefPfRAKkgEXHhOFIselfnij60GNwZcUvcOM1lTCPI=
X-Received: by 2002:a05:7022:619b:b0:123:2ee9:d1cc with SMTP id a92af1059eb24-1248ec9c04cmr2997173c88.48.1769470719918;
        Mon, 26 Jan 2026 15:38:39 -0800 (PST)
X-Received: by 2002:a05:7022:619b:b0:123:2ee9:d1cc with SMTP id a92af1059eb24-1248ec9c04cmr2997152c88.48.1769470719393;
        Mon, 26 Jan 2026 15:38:39 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:38 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable EUD debug functionality
Date: Mon, 26 Jan 2026 15:38:30 -0800
Message-Id: <20260126233830.2193816-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bMGsHenD-z3pHYVAaX4dqgeKHcs_wkyv
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6977fb00 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bAolQom50hykzV7YMrMA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: bMGsHenD-z3pHYVAaX4dqgeKHcs_wkyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfX1FgLTc23lWi/
 OvdbgAmzqK2s2LqYU5uZsxffCdhKBh6zqfMJ/+V5wdU0Y+gps7AVSmQSqaF4+cMNxuWhQysKGMs
 9cJvgZMzdAbM6TbFiooX6Jl3uDIh0J9E2rXRbMtpUygWPnhPaegUWqAZ323p/FqA2Mv0q3nm21r
 rGmwMcOmk1+QGCtjB86FEWPwYBh8BmR5ZnWFtM9atGEM8cH7CoR932q8F6CE/lpbIpHIQPPWti4
 r5mMg8wAkNd4BActc0RaFInMvl8Mh5gcv44rWIohcfkg+5cD/K6UIAUgvQ0lIr0v2EOHFM95Rx/
 2IOgiJyKBRQPIVMkWI5VjhJQUzMcnRB+Z326joSI7TL3f6Zhvylukkfhiw6qyjxTwhpRrjPUIsj
 Lcp5brOmVCfdOEGLKV/aYaULflhbFm7wZuvJ1bFDsASsHxKdPjpDGbo2RRn8s87dzt5bWz2p2jo
 CwbA9T+Z+V3zRiXkLvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32758-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC8F98E433
X-Rspamd-Action: no action

On this board, EUD resides on the primary High-Speed USB data path between
the connector and the DWC3 controller. Update the device tree connections
to correctly map the connector and controller endpoints, and describe
role-switch capability on the EUD primary path.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..2fc2d0aed8dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -194,7 +194,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con0>;
 					};
 				};
 
@@ -1176,13 +1176,29 @@ &usb_1 {
 };
 
 &usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
+	remote-endpoint = <&eud_usb0>;
 };
 
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con0 {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&eud_usb0 {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&eud {
+	status = "okay";
+};
+
+&eud0 {
+	usb-role-switch;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
-- 
2.34.1


