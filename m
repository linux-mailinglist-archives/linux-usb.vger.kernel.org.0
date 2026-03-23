Return-Path: <linux-usb+bounces-35316-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEQ7F1cAwWlUPgQAu9opvQ
	(envelope-from <linux-usb+bounces-35316-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:56:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 101012EE8B2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D501303A4BA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA8F38423E;
	Mon, 23 Mar 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzhukhpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZ4+bjI3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D52386458
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256077; cv=none; b=TItG3hEMkxm2KjI+sRr3UvRwj+KiThqR3NHiWKxnoOUuxMWTXl/XXd2vF1iWodjkgIWAAfoIGC0oyqgKN9MbduHUc7xHlP8EcnpH0x6VDTtKCX27wcoYVqcgjSjfPa5JZCEh/is0BfP9kHBj6lOlXU3mvf52hY7ucdsox6Hjw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256077; c=relaxed/simple;
	bh=QH52w8WOG9WYQEGbasl9y2Tcm24j0/g8q5KC6Udqku0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2C/73pKr+xqcg6okHN59nL1UXUqg7dgccgGeOKa8mhrtnnfAfWPmL1huXiKjb82ryAlc1DmmYa9yUcjVETb5S8SvDByMybmfF6wtn93SvjGZQS8EHjiDVk+59XrpsB1yAtwMl5exjPSDkCHt+6eyi52Rb5p68rJySxcbaTxTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzhukhpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZ4+bjI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N756n1199272
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WymoabHoDjb3N6ZbM84msegTQLgBeB0c0sVtzWyCNXI=; b=MzhukhpEeFP3M7e5
	rgyXocotUPUCNrf/5sqpeO+jI310uOFX7kQyAizuD+msqZVhCxMUL75xjUIhSHqE
	eKq3nHNVkW8pPWEe2aynQV9CqFcFDnOn758eZw02S1Voyr0KUYqtjac55ZJu8qQm
	V0tdhaEnuoAuyf5xmj36MVhnK35G2XusE/xZEVOsA5MWoO2zvb0volq1yaKKkWUZ
	85GTIpfCwcNXt0Q3/nYfZER8H5H12T8E2PuVH7/+o0zjNQmHmUko+h/fEcB8Lu7G
	7el9CCMz00+d+oDxfhL/aRmkysw51bl5nhZuXLMyAuJpBuQcEauXxEfNELJlD8M4
	DA/tDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4pxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 08:54:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso4354731cf.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256074; x=1774860874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WymoabHoDjb3N6ZbM84msegTQLgBeB0c0sVtzWyCNXI=;
        b=EZ4+bjI3HzywAxqthJowwmzZkEZtPQykJQIIW4KaCakOhgvG59Ylhov91TWVl1pqwb
         SrpbpoM0Glu/b0cjm6AAdfZSXNsrhRf0cF7W+3+MVxQYPWkA/3DPzMMlirC1kT39URtR
         RTXQpGLK+qITK3bEFIZeOM8tR9M9w3gSrjkyM6MNElc5PSI6XKsxJVH2vGybVJr4xkkO
         yMRDc8Ao9pibg6GTAyIasrZEs0TjYfpeIaYgfzPIOzzzFyYnJ9IPruhkUxUt5fncDOql
         LSwhwdXTopzQLF2+e700+7A/6V6OHzfF75RTXZqsJihiDpx18RfiYmPWurv2psy7XAAU
         aNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256074; x=1774860874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WymoabHoDjb3N6ZbM84msegTQLgBeB0c0sVtzWyCNXI=;
        b=MPF1fZyPf0C2e198wRVFPCsB47SwuGLdqYn2aHtczPOXSzvdJ1j12hXuO6+xttRhAC
         t9pOtunlKwtlp8ImML3V12obP7tQ0wIhUjEFiP2/x+aTNCDoU+ypawTfahfercuT4dTH
         2KFxZ+WlM5SQmYpqjYUzVmcI+2ENg/RdIkWSiYK6+aV+ttEQz0FrFvImbQ9WoG3Tob4i
         r5I8Zzyg68ocU3cTwF2XBZqUTziJRHzg4Z4shVeLjdif1/atPiolZhTw6PhsTqsu21MA
         ww1DcE8rjBnuxXDTfsFUuAuqaLuTXzbkwmyt9NddeqpS919RuRV9Cjw+GpYt+bs6VxUj
         AICw==
X-Forwarded-Encrypted: i=1; AJvYcCWf0/lQVeXzK/cRCX4enf1LHnykspwSeqdVM4baMKiUgQqz2vu1RbEBGVNUn4NRiReHzZ3TpOtEYnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHiWCJfagdQxILwg812XnyKtSAgggGCeF5d5WsTB8mR1vzP3VT
	wQ9FveopyzzQvRfple4Xk8TXOn1Gql0GBJTI++2XDg/3ZxFdFc+qzcbH7bGHqkyfDJ0wqoIQNkX
	SrvHjuKPzuqu5lVF1risP7C45lRIFEQKO6joCKP5w7UttISxdZE+Fd/wty01zZceezAOAImc=
X-Gm-Gg: ATEYQzzOw5ucrdSWwe9lrNiqMevI7LUnVC7XE7RABLQxzn8shJxsBZyslGEohUzcYYl
	+dMhxvRYsf9EGC7DQAO7h8NTtjTeA6Wvwymvl0ZAI0Cv3kGNpnH3zPr0oDUJkSAWn6UPsLheOkw
	mkVN+jowCya+fnOkRXLkJpW73IDECleFVpUwiD1UuNjJya8zz9PYzW6YyXfXfo3cps0cizE14Hz
	4YTd3pXY+JwwsHVOmLCr3ToRHkJJi4Qh+GubYGh9F4sx9kHvWSr0EOCtKyn2dLhUBGkMxxM8mWc
	aAHZkV8B5lWXDOm/L5DuXysKuU+xAvtOgGaUGLrGNHLPl9aaqoI+AnBtkTVG3Ev6y6B788tdJL6
	LbRgqGn+FHygC+9BtbxWhwUGghrpOVGPBDIyiFH2rSCNk
X-Received: by 2002:a05:622a:5a19:b0:50b:4cae:e37c with SMTP id d75a77b69052e-50b4caef275mr94775671cf.72.1774256073842;
        Mon, 23 Mar 2026 01:54:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5a19:b0:50b:4cae:e37c with SMTP id d75a77b69052e-50b4caef275mr94775551cf.72.1774256073444;
        Mon, 23 Mar 2026 01:54:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:15 +0100
Subject: [PATCH v2 4/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM4250
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QH52w8WOG9WYQEGbasl9y2Tcm24j0/g8q5KC6Udqku0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP++FGebrAEu1Va7WTK/O5g3L1tF9BVF1JEj7
 wqnHN30tmeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vgAKCRDBN2bmhouD
 18XLD/9oWr3aLH4zk5/K1hvTz18gphb/xqV5yc4QWwMI0ndQSi6BbV+TClCudD3s0Oc9CoPuLM4
 bJOZe0hbndulXGRe8ve12ejJhJwltW/aNyrEwrWeQzDtQMOheb+PauBepMMnmx0qxo1hMc1+Hj1
 eZT/zhgzsFadZ8syvupRSA+i5TW3LEds9sQVz7ftY42CrCX6g55fK3lamahRnW0TdhxEj1OzRuu
 td2HiTfYAk0Vl6Ax8bHfho4Ul1SXOZkDH4riQYOD5ktcv5nE2i5wPhoERKxsPZjCbdNed76JVQ4
 ryOeTgW4UCTjeg01g4zNu0wWeGA6P9czO+nT4YNRIabIaXZ44uc+BWHMnslTISN5JHrkmlVyeRs
 CvGKeqVYsPIbgcVlxhPl2iPMYjreNpvqLF94klBLPwciiiejfpqSEllVO+DZ4jFdJBk8lZQLmFw
 kDpCKXkiKLXFThb40MCgay1Jc3Z8ygiYRCVfLssiO27GkxqkcDFpsM5olddEWP40wboKN5qvZu2
 J3Xh6pVuTFdtuBSPhLGrntcPwe58PqpXcT8LeKQmi2AoOqpAjLkmAMe/zuElluFCwj/vR6U1Abr
 I5gw6RXumCHgh5Wjtd8y4wNhoZqV1pE7BN7jgt8rnZ4F/AEy0r3gJ8SgAdtX2n2g7I0z7tHY3vt
 smcyf9Whec/+ZGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: -heBVuhMxlIqZHdzlpe_4JfG0VMf7Ksx
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0ffcb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=r3R1BFB3LEwGWC_32Z4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfXyRRj+7y/zqVi
 K4hxlU7bNNBXjkqEfGrZy6kY6gd/SPSdEojOpJmGWjozP4confUIGxWS7/CdWFzEASymAKypEJ2
 0+ffB4ymtxWUcjg/bKRtLqKeGxeg13+sN3Wrj16RsVL5ejmWYMYTLDkrLos8HIieySPX3YJkjMY
 vTaBSGzbMfbUw2ndBahN86wnUME4HaPskwyIAYSXvieICWNCb3llTc1N4siKfHmkth34R+TPV9E
 WI7ot1j/KYuM9x1zjr6+CKeHIJ+inv6qavBg0S7xHvC9ytx7pCo+Dl/SThmzwX20bjiiBBsWbOO
 snvkHTAGatdKSq1DNf/XwNIE9SK1xV0IBNEmzAgTBTNgTJZ7Ses2Irt960et6+b9uNZzdH6/sbb
 ROdD5j+kf0C9iQK9kDIiRmPtN4YgOmWam0IdE7PIB7k3CrGiiQQMgAiRDwXTwxOeBzJ8pIkbydt
 QvvZLZ7KV2jTdB9mpMA==
X-Proofpoint-GUID: -heBVuhMxlIqZHdzlpe_4JfG0VMf7Ksx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35316-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 101012EE8B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom,sm4250-dwc3 is already documented in top level part, but it
misses specific constraints for clocks.  The SoC is derivative of SM6115
(or vice versa), so the interrupts part is incorrectly placed and should
be same as for SM6115.

Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 94eda4fe48ad..e9e534f49183 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -355,6 +355,7 @@ allOf:
               - qcom,sar2130p-dwc3
               - qcom,sc8180x-dwc3
               - qcom,sc8180x-dwc3-mp
+              - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
               - qcom,sm6375-dwc3
@@ -452,6 +453,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
+              - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
     then:
@@ -530,7 +532,6 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
-              - qcom,sm4250-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3

-- 
2.51.0


