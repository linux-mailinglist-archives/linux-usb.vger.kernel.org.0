Return-Path: <linux-usb+bounces-36775-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCPIEdRC82nMywEAu9opvQ
	(envelope-from <linux-usb+bounces-36775-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:53:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D713F4A2676
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 13:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F75A30039B1
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C798401A15;
	Thu, 30 Apr 2026 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0At4fTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCk+8HFJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87499401A34
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550004; cv=none; b=fh10qj2Qfj7hyB+dCzVdvdSgRXqDfxSQ00Mv6DRfIb8Nw+WmmMWNR8qwHOYqwwsVLrMWL/2PWeC4oLx/32Y1uuHbwWz/COJs+DS84Unq2XMIAf7s2DjFc0KYaYqHCMUAyVU7TlUqSsS+BOkCr3j0DmcGIufuEK+uWo3ojezVRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550004; c=relaxed/simple;
	bh=QxPMMGXUXD0goR22AbWNuT7RO7qnAyoersKff1sz5dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zz69J9YHMHWOFkfJgOGtFc+1NqUz5hD+M3CRu3bVV26mKzf9bIiYeBQAYTbh75trWA2GTIn/am4rbi3KsJsJrBQPg1BYsg44j3etuJLvaWrl9ufDvIwkhRxoSgmHbzI7a4YfCUApTYoD4B40WQ5Pl9e1Zg+a37ltbd35JysH+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0At4fTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCk+8HFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UANOPg1277325
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=; b=U0At4fTdrfl8QdP9
	JQsKIphtRxGzsjY27YXJu5B9VF4ru5zEPv8S5HvjrN5TjZs0G3L17HcKX3DBzseH
	vSHF9/N/T7lFiASwUOJSOs6QfrG3L0nwheGTMw2uzmKw2BOlPnmX4X9Viw8fTYQE
	cRhzhPYWB4OYo672bQKUcr1oIXNkRsfctKpBrkftKQUOdq0sf3ls3WS95OvBHiCo
	mgf+kpNzS6rkJH8cQJt3L0WLu/vQSuv60BPrsPzJdpvCV+t5CfH7ZQ7PmsHbNpax
	+axDM3qdYPJ5iwS7ufLyRmJguhR1b2mNXiLTE8PXJRn3dsdLV7XSNl1fiUwpNusI
	TP9/Xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq179e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 11:53:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e6ee9444so8357575ad.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549998; x=1778154798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=;
        b=CCk+8HFJCwEs1Iw0VsLwuKUaMKe4sGGl9RF1+ba+HbjGAkGc5ZUkKGBJqZ+wy23ysG
         beLWPt3mgiko8VuNesIyb9mwiyp9mupkUK3YUYtlNBgMzJqjsQxGwVT2EQXUQ+MkZu/R
         T9CmgziN3YaebIAXm16BTvxZX0Bpqmt+IqogG1kU6KIPqsoKe7l8GwpneLjWwyWkTyGB
         2xumrXf1HqANo6v8KWpNHLzxv7LettNRO7j5aDafkI2NdLilp5FqVEWgprQ8bSZl3sEL
         k1viFKuX9NQnub/Xf6pEiKnD8AYRzVOTM+nh+wk8fp2ybKdpDSN0m806/gbWXPKN9Q9I
         c9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549998; x=1778154798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=;
        b=KV/5s5QCL6HDFlZOpNVBpmNaP6TauAI+ygo9tEiGIrjP7Rmz+ojuzr9S84yVk/mKMD
         wZ4whOqpKY8+lr/JgU+o0f4BzJsGswERfZJKPib39KVf7p4Ubt3xWlDTLL6XfUkE0ijX
         imtG9Knls7M0VVP1Y+FsJ3/72B0v5XgtruC/pmPCX3UNJuEeVvcOi81UkazWT+5WXBi+
         +lJ/bHBy8PA7yEXrMZYD+r7twLYsWELgFXoXJ5LmY8bQG8XbBQAtcdZkNjs8d9YDd78A
         f0Zl7LrE8kBXPyO3AtDOT6he3mumSqiDUxswfgU//38Cl8lFTvWSlTbiXHLgiqO70yrz
         HZAA==
X-Forwarded-Encrypted: i=1; AFNElJ8sE+KRyA83c18qcLMdLFNA7ikMCAR4yqgsrl+acfAYg/8qCpMRQRYjTZGetwOgy643nxsqbiSjqx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1NM7Srn6dI7GIJhE647vVqvveltTJjS9a4GIl18WzP1zHPHd
	fpDRSsWlSYBiTc+NMR8YRnenl8UrBwhmEgOszqR1xJ3qtuFHw2NchR/PdCEy7k8frs9QzTq9uyT
	SbSSt7odbnSXOdpkZn2CKz1SuigEf0a06X5rYjDmxTTrMrrC1C6uqsIJTOijwYZE=
X-Gm-Gg: AeBDies5GfBhMYrfX//Zv4USUI5TV1Ze/c560EIiB2oczUH0wrbgFE5tWflO/9zibVc
	fZZyVU5h9tBftQZt6EHC6u8KP803Dc4p9iQAP/Dz7BEx2z0eF7ICR/ysbV3Tc+e2ziUFxiuOnPe
	LV/q0IuH1WpwpDhGQ92VAfG35aIhzAQkyqAnMVOuv4uWhSUymtMKT5wcWS7+txv2rq4W1cdngRI
	r0WgVIwgm5dyfLBhpQA2YuBeRjCT6/wcua60fU3Cjw4ENIdKXiJy3Kdx1TgK+/ct935RdeDCUWm
	5zPHpweBbkGhxzJULtxK7gt1KCjEpENMdk5T7BE9J6n4UzPZGgJ+G1RWPvOGDSUZXKjE7rLsoN+
	QJywHmOEQUVqLLodsJ7VngUr6Pl+bOEMMs6VqKj0CrriYtMs=
X-Received: by 2002:a17:903:7d0:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b9a43103ecmr13838065ad.10.1777549997908;
        Thu, 30 Apr 2026 04:53:17 -0700 (PDT)
X-Received: by 2002:a17:903:7d0:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b9a43103ecmr13837835ad.10.1777549997476;
        Thu, 30 Apr 2026 04:53:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:27 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for
 Shikra
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-2-c9c108536fdc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=837;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jPWQHE6KxD1TKLInNu/I4iHlxuYT8OtLcKrqMYmEjfk=;
 b=ovx88w9T+mcFNC7WEAoQn6UBWfH20QIo458COMnNSXaqu+iBLyiJBQHt5LLUDfEzb2MVWXzVW
 Xb0LKnj8h0dCcpEu0CkyF0hf8oXDBgKjNdD2FPA1scb5SmsFZPjM4Gp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: X7a_1LKlnogCVYkM6EWimCQP0kJdEJ1S
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f342af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bYrxjfJhQvMAygBm0bIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXxLikIu9pOOtm
 GwcVqMFz15f0nENgsOOJNqoxfoFWpZzFufkmwXfzaKGIdYBY05hN73OavjEkn2Xwleb2dKZVHQi
 xnup2HKYYG+KlO2Oebj5varwGJXei5HKXHnGaxNc/PUPcnGH3pP4xFDnvv8ON+jjscr6FESidOA
 XI34QFEFSIzsP8bJxu1XWWpmpkeSLbweZPXeYOTIjm08OW9DaNdW3vEk1AIR6TPU+CbAbnDV4zF
 M30f7x/0AcJjxQ3wEXKcSpwJZpPuTzizmq/rCDk+FPpdwdvziqdk3Xx9fvW6JQrWDA45B1lU8V7
 SXcuY8aByhXQNHzgDlQfPvBP73ZxHPyFIT9v/8gXIIYJ/vM4yMzF3GD/XHHEEGB3d0dpvF3K4eK
 I0LDmST46K72rXBBYvMhMhPzRPHAVnWBB9KLcLjNIwmAJv7nmlmYgNToEQsGux316ETEMP8SU2g
 qelYWiOriNySBFGTmdg==
X-Proofpoint-ORIG-GUID: X7a_1LKlnogCVYkM6EWimCQP0kJdEJ1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120
X-Rspamd-Queue-Id: D713F4A2676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36775-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QUSB2 Phy list.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1


