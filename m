Return-Path: <linux-usb+bounces-36574-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0As0E6TZ72maGwEAu9opvQ
	(envelope-from <linux-usb+bounces-36574-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:48:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE647AE73
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16D813151CE4
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 21:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349493ACF18;
	Mon, 27 Apr 2026 21:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iusfDWls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vsz+OR+S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32FB3A6F03
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326164; cv=none; b=mlXILsAkcV/c1z1kQ/ZVrxZrRw9aYLxmC0DGPa1h5aLL1/69ogH9IRze5AJNg/+xMeWcvMlq0BGgqKtn6rpP2htKsqsIpuNdCODmYfubJTTexqlq7+/zYigSXdkZoMdgvn5044W5603Pqc/vyib4HwjnqNB9XN5cfZWOwC/Gduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326164; c=relaxed/simple;
	bh=plsVpfSVc9eCVFj4w17K3FYCogRULKzyFMHGpg/aL+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XifYltTODUDGg1NbyfQgJKABA3ACW6r3XaKIh5PP0m1JqZwYbxQ0SR65psK8DYRUPJOy7TODf3yLKY+NzJt6TY2hgNAf/u/1V7aCZ2n7WiBro1cjmF5PBm+C0hWDgKQh8RR2usy/ZQUkZSwenVYFjJULf4yha06y6NEu4k34RO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iusfDWls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vsz+OR+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNqB9663125
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zDhnhJqpd1p
	k5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=; b=iusfDWlskwX1CDJUcdtKRQ1wKIq
	arymvLyqQ35b4Ou2gburKq7c+EaKOG3I0Xqn7OjS6onrcVJNRYeLoBaMYqgYtA8c
	BEwLuOJb9gad1NBrrsHsGI047mjrnHsC1X7quZpTTYCJmX9P1cuD8eBpdvywSm+B
	bloFTmIUSdp+ww++HAnqchO8bYTSpYhWxYAE16cHBvzr7NrWVsk4P/RGKNSs66uD
	9Pr7WfOu5RqLyYeT2z4tagJB1m3dK9pMNwZmjtqBs+Lnqf9SqJiA7gDtz9vmbdi3
	qKs7Mx9oU6kvAqam4Ho//aPoZsv2dQSadiwNMUp/6o8Y13mwh9AWVQxlHpg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n0w8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so16888343eec.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326160; x=1777930960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDhnhJqpd1pk5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=;
        b=Vsz+OR+SKEbyvN/td4KTb80KrkAyAbA2GhkzsdHdNyDuNDnybxWPsh6pQ8eGBvMjmU
         7vw+wK9KD7KAPy6fW0+3eml7PAEefcGWx2KIdQ8ycMFDejUpAY/YrFZqiqLdZq+mct4n
         0GDmh1BstYmcIlqIO0F2eZLODGRbzmxsWsaXYFrZ8FRHFr5nhlN2Eoyb0NintmJdjqte
         HY4s5oRFCBWyDoBE+kKiuFHM1J1XgIUU3GfWy63oPOmVPj71BkaB12RDyvzJghRo/2Ma
         3ruzDGjebNDSlWuA8C/jldsfPGLOcAXUjnE1pQlPq93eCAb63kU+CDflsw+ksl4W7joQ
         oiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326160; x=1777930960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDhnhJqpd1pk5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=;
        b=SgkV3ZvFUO2BX/VvMrg/WtA5Bw0Vu/lnWe38vTFm6KedaqcacfE6iinFvK1/HKSBlc
         wBSwYzljs9W8AmbGOtqzDeYhxsvy4KmfVQDxRjERag03Cj7l6h4QYBdrKm6IQYUIrxTh
         Sp/F1CzvK4gFcmVJ0PDcP1zfIMSTRdD727KuimugxBsdK7d8bD9K3o32VFqgSEfn90ke
         lJRHH/xE9xaj0RwmFpV01wxGl/2jCMzDjPK4UXjzAAUME4+jIUkwulCLJ1A705ZYAwuO
         aCkquIslTrkfVHcvOSc9nAKLYpLWp+ppW2tvju4CfEV8VJlXszifALd75kVuwV1wYM4m
         ePbA==
X-Forwarded-Encrypted: i=1; AFNElJ8UglVreVX2knv5Taw1IcuVNn2zUeg/4isWcVlG2PxInJ6P22v/GW35E7xz63YkB24exrv3PUK7uaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YymBPVejSeXx71YDi6YeHvirnvICjW+Zg617LFbjMaLIZAmI357
	gUb0oKtr9IDKjA/D8H0X37flz1KZ5qBfztH8pHPiRKDZyVApS0CbxvsXuAX74Qfre19G09pFdg0
	W/n6ibeBu3033wY9gUfYRSqehac27/bzgMgaQzRv/0AyAoKVryT1UljGEItixJqI=
X-Gm-Gg: AeBDiet2WbxU+Ff0cBHHhrlwVAmZpaMOzlaBDl2hhkPWIHTqL0GN2d1zlzpExJ9RuMj
	cGyhd76nXy/dlmtx2g7vUDy6OhfjtltGo/2WRNiIdPk48OqBXx9BV93tOpVmvXUJBldsZb/m0SR
	H/G7adrgNCHgZiZ1SeY/wpLlDDxLkqDyH8We+naDff2DIR+qeapRR3CDe5sE8ZI7PwNjlDmTOXn
	jGdju3TOZ17Qcm81HGu4pUhbhH+KrYSMZEImYasM4cTzhea3ZdTlOi05md/EDjC36vOtOA2dMur
	U3Pw+JvPl6d/U4sK9xq1Pj6pHt0ZOh2Z+MTuh63hyQf/6J+Vrv2RO2srXM47zx3Z6PUInJxzlH8
	4EgNOB/8GCNAIOReQHpdCpI5RgFd7k5EHWpWoKHaaoY3DHsDEADkKXONNSgL3TcrTois8UsYpXn
	TPHtFH2hNpoQ==
X-Received: by 2002:a05:7022:11f:b0:12c:33dd:fa15 with SMTP id a92af1059eb24-12ddd9e4256mr312337c88.34.1777326159419;
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
X-Received: by 2002:a05:7022:11f:b0:12c:33dd:fa15 with SMTP id a92af1059eb24-12ddd9e4256mr312300c88.34.1777326158799;
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Mon, 27 Apr 2026 14:42:14 -0700
Message-Id: <20260427214217.2735240-2-ronak.raheja@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfXzZKHzvKUryfJ
 t0ZtXBGXl4SMcKCKbCQewVB7uv0cZ/917hxO2lBcrR2m6349Jd79tXDQEUK2BHssom8pR8Dfwr9
 dr9Ho3A6UUiEPDSVVpGYFqFG2zJLRLIz6c1FnkOS4GcWdlTypbV/8+UM5cnnwIWmHAPbU2BEHgL
 T+hoima4C8xgxRWQ+qFaFJCzPyqXXYr9tU7LAXd73oGuQaGRN/MY1e0BoYt2ChWh+PXLo+XyEod
 3ew1jAracBKWrJGXQwQ4qJha08tib85ZmHkscxZtJdablyWuFpw2EtreHT6MnCI0NB395EdE2aa
 YhfhHh7N3cRl5/oLsJgQN/ZW6qV7g77HEkhxgDh8f4NvArgBiO8F1blHnnfizHfSdcYBM9MRzNB
 p/3pIKSC5cNYy3VFgpSPhD1AvywuJEWc7+DW3OtiWh6yGbOJJ21LJ0plc2T9K+kBaHVZ2lCVRSv
 DBzmPuhZxSsHluE1o/g==
X-Proofpoint-GUID: njgQxVKUxXS5s_dMJbftIuXYa4qWo9L0
X-Proofpoint-ORIG-GUID: njgQxVKUxXS5s_dMJbftIuXYa4qWo9L0
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69efd851 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8IMiPDtIn6OAJiDpRukA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270230
X-Rspamd-Queue-Id: E0EE647AE73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36574-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1


