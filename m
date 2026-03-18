Return-Path: <linux-usb+bounces-35013-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEaMAHQlumk3SAIAu9opvQ
	(envelope-from <linux-usb+bounces-35013-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:09:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB72B5B5D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5D530E6B2F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 04:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FA633B96A;
	Wed, 18 Mar 2026 04:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6ElmWlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTyEEP+D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6BF3290C7
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806843; cv=none; b=mMTnk5nIHfGik5OeWBYbOUvOs5BP5LHXvwCRjVHnz2qXuGv/hf/6zq8bw/81P0rAbcV9F9wBbL4xel6+T2VzzCViqr+R5MPo6G99y5J4ru5PlwjUjGRbqjexV/VQZDjdxfFhF0wJlcau7IkAKf6aDuH5lo0cDYTphlqHr9QVTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806843; c=relaxed/simple;
	bh=3UXMGbI8WON5H1T63QkkNnMrXoZ3C5K4RVu3prv1os4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q4QD0VZnwmiy+2ZyfQ5HFr5IA/piA4YCBMG42xvuPaElN0CpithEu5aEYkb+KOb5FtnmJhlu1LM5uUdmLHt6GdIz/9O+fyNCPZ+v44VY7bTntOfhcGC7g+X3CFWA3P7GRd6eRlYsTj/B8We22b11kBF4IXLPEiUfdZI3Hd5f8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6ElmWlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTyEEP+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I31peR402508
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PXXpBOuSHJv
	aASkuV/7Lh3OvDiKIdpCO2MCERf7B6gg=; b=Z6ElmWlCvF4iAT1FTv4cPPgGX9A
	iEfDyu0+vNBgWS9ntgXTup/1/z5zG2mRpM/9PqQtJO69fDU7sVMZmedGCs5L9U+b
	kTxIV0QrdZuehiXod+l5IBrm+veYwFusb9AHC/fVOb3NiPjetVxrx2r2aWYlZ/g3
	ic3/l15EMxa7HBVhaEOZdxKAfwglJNWDkaH1hZcYEyb6GENbM0vqyhALhR1uJk6E
	TPOnAF44DnY0/23LHn0c4V3tCjruT0/U46qJd5xrLtlOi/0FBq1wxncV/GdWVkK7
	yjEhpF/K/w7iW6D9lSwQ91yvu3IUP4qiSbeVT3nxV4mMhUWWXanDOZjFuVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dsvg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:07:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b064884a7cso106502785ad.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806840; x=1774411640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXXpBOuSHJvaASkuV/7Lh3OvDiKIdpCO2MCERf7B6gg=;
        b=aTyEEP+DQkGGvN+L7Ls6d+qnmOC6Zo2Ts4VSMYNZayi4XubDi2X0EIrRGB9qQe5k8x
         EfiRfVZ20ddFFnPOwi/TfAFXO1ZZCyYOY8X74qNuE2wMjmCSsMo6gFG7DfnwhwTQfQx/
         ZaIaZ98ohHrAZX8c+P7IQEK/gKUW+h6tXeIA29dv5UFWdU3YRND6jn0Oi2Mkatdh6KIp
         sySb8yN0RokmlqbkX0ISwrm8DnJxVDmb3qe1NdH3J6AAF6f5kh6xxG6o+JtSzon7K1WX
         jLF3h3xL278aLDPXWzP8lK9QEXJeB83MEd93gsYnlHBGvt/oQmiL5ZE0AwhESjvp27wu
         2Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806840; x=1774411640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXXpBOuSHJvaASkuV/7Lh3OvDiKIdpCO2MCERf7B6gg=;
        b=pffNKkxt15knbdoXPb5WqKBO13hgU8UKHr8nUzp7Ic5/1n4oSW4WlIsINa0nfnRXrp
         gFclxySMuIB5pAAGVdk7jcAlME4YyCygncFvGQQzcnkhjIdZaAdbhb+1Sl/ukP8g2KME
         P3tCCeSisWoBVSB7V66Ykm818Bl08prF+CH9c7Ocv2HC+MSiiDnc4Q7/SHCtgNHavMNF
         67K4tzXQptC6kVlmic1nYwnfP7RSBWJKU1dApB9zsx4xB+aCL62hXeBAVfLYMn0IVgro
         YaJ7m+Z37rI+0q77e+StMRYNWOZakNiFsiHk1xBT9zYJCIe0PFGjJQijhdNT7cb+2zHp
         OEhQ==
X-Gm-Message-State: AOJu0YxiuGmFV3o9GMlUEtdEbi6XZlqkUUCwfZ9zuIKh6iLibJWUR2pU
	V08Ky/KlnNKaueiM4ma5toooQSLGJZAK7zaF9C1fnk2o/cgWDM+xdVoPEsEb6ukMQz0/fR4RU1b
	vsnpCSfE0xJXaLQeYV4Oi3PMT+UR5IUfiu42JksXwxJCH1vOrVJICk+rJjStflrg=
X-Gm-Gg: ATEYQzycjLYinRwRTE3bKkUePCsUhY4OSzWcKpOgmvw0VlFJ1Iwy6zx7rOUPDQ5OV/O
	t98TKUCDEX86Qo2AuFxRQtDWfo8mBJjd3SHSCOf9nAiiPwEPsKrf6OPA8aveOkqbbWfMriR4UVe
	HccEMZ2qBue7+vYCDUoC/yHAzAsbk5/U7f+tWWJfdP+vv135H5mTOLZaY1r4IFo5J+wiihBDYIq
	18/2JJ0kpo0zVUQd1TGAwS2CCEgqMWVQGbWBz7qLDY2LJmI8dN5SWpw9sd8Iu08kMRAwn76ARtr
	zx/MRqQlqaNjboD2NVUDG3FSAD+vlfxpXRk5MuHF9H1ywYaNufVYbL+mA89gYE5zjG2u12OtT0q
	E8lrBpYXBgCSOrWKkuKvojyhP5oSK3OywoTT3MJ7ECZZnYE3/dcXG8tU=
X-Received: by 2002:a17:902:db01:b0:2ae:ce8a:9dc5 with SMTP id d9443c01a7336-2b06e339e4emr21551945ad.13.1773806839823;
        Tue, 17 Mar 2026 21:07:19 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:2ae:ce8a:9dc5 with SMTP id d9443c01a7336-2b06e339e4emr21551655ad.13.1773806839362;
        Tue, 17 Mar 2026 21:07:19 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:07:18 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Wed, 18 Mar 2026 09:36:43 +0530
Message-Id: <20260318040644.3591478-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX95leJ0XQ6Z7t
 D8hHJNTcu1pjWYIbOMoozTYqdZYLNdmK11GJQR26BiAfZTFIzPOwdaGV4d6azi/LcyVJzM11rde
 3NBepOYNNCAaVExjNGV5Zr9w0Yd/EiVixUuembt8MYz9QTPYARq9sMPFa3emi0LrbnAHR1NEB+Y
 nyCElXa6q0keIJi9lW0Dtq8oEnF2wX2/HcjPUGY60yUhM7K68hHmPQCEN3KbtiqdWVsNevS51Kw
 1e+a8+8EQNqR5NyjGK+DG21ePPEAjTVfwhzwr/pvwQf1H12o2BCcliPQwVFelPtLH9IRdETOj5B
 RC6ILsWN+f1Ea8JC+g9F9iLxBZf6uuLVGis4VJtCnUxz7tYZxh2vIKBrGHS2N74qcSDH29dFGBg
 vmiiJ+W/tdM//m3rlteflr3cD7FazNdc8jYTE8sGoW7Y1FwCgBZBNt/PKUN95+h8mB9RuiCV4BT
 fpaobNriZR6nUkc3tag==
X-Proofpoint-GUID: 9DxGnkrc1rclokHlbAZuCmajrzO3NFr6
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba24f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9DxGnkrc1rclokHlbAZuCmajrzO3NFr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35013-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DEB72B5B5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a1ef4eba2a20..2d7eace9d7ac 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -62,7 +62,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -550,7 +550,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -558,7 +558,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -984,7 +984,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


