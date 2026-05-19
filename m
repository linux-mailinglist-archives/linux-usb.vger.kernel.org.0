Return-Path: <linux-usb+bounces-37683-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF8oEx9CDGq4bwUAu9opvQ
	(envelope-from <linux-usb+bounces-37683-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:57:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540757D00C
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88CF930E1E65
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FFB369D62;
	Tue, 19 May 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9WSQIdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmVcNs9U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619A32B108
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187691; cv=none; b=hgvdBnIhBdwSnjEOJ/gKqc1IR8/DW+m92ZeaApkd2w5Lo0MFtCbjtQKnsAhtDT4sCjHZjDHE66+tzI0tkzXG0w77Ht9acDBatYG9HT0mzKgAymFlLEBa/NfkpNvT3nJP0JN2UJqsHcLUTlyKduY7026K/ssTj/JzyOfXwdcWdqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187691; c=relaxed/simple;
	bh=HTFphzKYcyqmn4TPcf15E20qAhds1kVEI2UpBTC1iI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RZ8RsGSRlNNuF12Hbfo0JK1lu/w4mbMwRzD93wsxOnUW6JJMboihI1js+QJ1eHPBubCB7oRudXTMii4tWJOcqzA5XkHyiDQv6YC6n7e2JJ9dZThMXPfjVy4W11p/6SXCPH1zRIZHpfM4xpLdyDbe5O7IhDPkolyn+pRDF+Sonzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9WSQIdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmVcNs9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAeJX94131492
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CyZKwpt9Y9+NnTuv9GtsPF
	s4GVoUYE0pbJay0okUjXE=; b=m9WSQIdHElS2Asr2dxNRl94jGhCtbUdYmgH2Qz
	vlq0OtNxk7guUPUl1besPB0UsX1VpMTaGZF3b/s0Mr2YyXPowNBhLMvgKJxRvLD2
	hMr0f9qxi4yShzKdyYc+JpxRglqJ+LuxjHj9Vl8Wv6qSPKRbcMVho5cuzoUKi/oX
	6lLQNNiqI6WMO3F/TCRVf1hAaYMcVX0sN5bobo0BUQLbuURLXnLRbWz8s+VNWR0x
	57EG/P1qUrvtUWsKJ0lqt58jpYEeSyMg3fm84nN0SUNpzm4MUm27LdOVfUDn0zly
	H7htvOqB3nI4/om2FOM0JhjAHepxqK8cWdXw9mzES3Pglh+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hav3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5165d10e036so19150741cf.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187689; x=1779792489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CyZKwpt9Y9+NnTuv9GtsPFs4GVoUYE0pbJay0okUjXE=;
        b=VmVcNs9Ux5Ma0+Wej9T9k+KRJ0kt+xarSA+Pybup0pQO9oYyB6uoJ7+boPJRTQ7tnB
         +ykrX9ZKNFa9do8Uvadn7t3EH8P+3oxHGQRlbaekaVgS+e13O4LmgEU9KT3AeWPJnBU2
         AsOnOKmFQBcQALFsgsZTUiWi9AAirWhqjo2OJuiK8MNotYZBPCD6XXck+n+NPBjnw84d
         xN/+FM5AyGlueFQN3i2vr7dBaKJkr41RMEehWUQQhktEPzDzaQySfsvuz+vmonn9fvSF
         in+9Gw9Wb9I09mD9dC7Rz+qjsgxktolRFzlUHviRKUPRuuEQGAepgZF3zs0r7AL2OJtv
         JYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187689; x=1779792489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyZKwpt9Y9+NnTuv9GtsPFs4GVoUYE0pbJay0okUjXE=;
        b=p+ArOsHfNxCaml0IfW4iaiVgtZ8LD8tpC6YN4rLjggJf1Fsw1HghZUP9EnzDGt8X8X
         M1PQF7CF4d62fSxhPa3Ijdl9m2gjiWSOCGEnGN/x1NjVDaFwEiSy7QZ3vwRfAtC4zhow
         sg0Jl6QQR5Mmw5QpflLMunzwKHWb/RQvRc0Cd+8nOD6xk6jdV4Y5eHvpcYarJ71RAGNh
         21EVWckkm4N7E4GpJrg27R0PSFZAJmK/mcrBiseFL80IxaTXcXo97SAJE5qSUtOiKeWK
         XQn9U8ONq8gktpKkTcnNaJjjwZBm+xKT3IAOSjFJojuV+BaVrZGUbcVEj2IOZDHGqElH
         GtxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Rf0WfdX5B9YTsC8iNGEbW7vxmHcDpVteNvR8mFr7N+wvmlWeF1oY8ow0zdpYaQvMLCCxqCQBWjNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7SqoQT2f2P2eCuJTHt7uxmbXRiR4vSxmVQMygPv3XNZ5CT6j
	VEPcSa5jt520n1tNinCYVj7CAkvsTobpR1eLUmffPhLu2fkekyrq+ruoBDFzAnmsVZ8AWpWVvrS
	k1TBm27H0I+BfELe/S0kD66T2/a8oehNuRVX5WlGw3KRT3SqUJbGLKMqHWP7zl3s=
X-Gm-Gg: Acq92OHWfxBV3wBLfTyJ+WWqnkJJqHOZDGIbgEqgJv2x/TQduupVC4ocC/F5+V0BdYR
	Koj8cEt2cksIAfvDrm5VNXUhRE/hzjpSP+Dbf48EeZbJa0ZcCTae5KjAFO7K4WILw49TcQFBOmY
	Os7LBvYs8/km/Nh1g+NXR4bLmCv2AuX71gcns+gytW8JRmVlMxK1aTl0Yf8CCdbYAPcfQCfTixq
	oJf7RWRy03HSvZSO9MRE9rdW0j+JOA+TWKPvCgZw0yFnG/KRnAqznP5u9ELXGxzly5mnNYWhSt9
	CdvxMfesR3U+op7MnnHFktxiYsmnGvg1IXEiwMg+iVhjudBZ+8xdvS+puw4NCRGTfyLMVR2vdGd
	tAbBWYExp63cXnZQK1nRa3rj/+9EZ5y8l3JS7dnvuJIoJJlONc38p/bze2QtW13tTuN/l3WC2pN
	6pHLbCr2FNIMIfiJV7K6nEbfMfOZNp64zoJr4=
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr279501071cf.19.1779187688848;
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr279500741cf.19.1779187688443;
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/6] usb: typec: tcpm: qcom: use connector to specify VBUS
 regulator.
Date: Tue, 19 May 2026 13:48:02 +0300
Message-Id: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI/DGoC/yXM3QpAQBCG4VvRHJuyK4pbkYP9GYzy0w5Scu8Wh
 09933uBUGASqJMLAh0svMwRKk3ADWbuCdlHg850mRWqwo5P3Nw64WF3QWOsJ626PK88xM8aKA6
 +XtP+lt2O5LY3Avf9ADcpwiFxAAAA
X-Change-ID: 20260519-fix-tcpm-vbus-aabde21f339d
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HTFphzKYcyqmn4TPcf15E20qAhds1kVEI2UpBTC1iI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/ljlj4J8id9tElx6rkqM/ipS18iQoplvyEE
 YZoaUcNrU+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5QAKCRCLPIo+Aiko
 1W6UB/9VjWFxICZyxepRSIazpJtcoQyVkejqs6Iw8pLkBiivsPOAsZJZcd5VdenoWTxvq/4ODe6
 Uw2Od3C1dTtVvn/IPTn1zS7FTbaWkHZiCdonnZm2qCTvexbuAu9PNOt5xOK43DLANCxnCGf4Ta6
 bIuuWIWUJy0ygMon6SyRLlcS08vP265M9Hpyo8xvAhk2URb5NwdCeeuwe4gVBnnMp4st4oLVdyi
 4tXjy8EToy9qkW9LkF6cT/s+rvvanZi5hjOQ64UNI/HUVDvw/csoObJkkwWn2IKRJw9mjU9kKON
 Ie9edwKQ1xqykSarjzjITx8J2XK1GthgKGWDR4Ha/U4o5pt1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c3fe9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YnsYcYk5mXc5G7qeyjcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tKzAbrlDZBhrdHnNgaIDjYvIb-vMBWHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX9VFC3GM2mvDK
 1teOFzyyHMuEjcpgZkI/OpiOcehO6j/YSXPVWDh0mR8lEx3ZfrT5FPfXncUz4PswU9AF+9h6mdu
 xulRXRhqUgTdfwA6/TnKgz2IhkVEJR8bglZqUnTgejxfcii3mNX5Ev8B4X8M8uXupwOk6KedJAR
 nSrLj7b4ilBL78h/kymKz/ctBBigJ4TaRA9oKC45uXNrKE1brymCcHVbR1e0JaXm5Hq8V/lwVhR
 bzvHv1MrxP6bN2Yasz26DzSelibcL+U9umJAzQh1kY71VjPcrQeDwMxixTWzOwALFH7P6SZyAWM
 mqPmHFBXQAsCo03Z4zXKjin/jKRLiF+42XT+jTDzbCuG640Dx5LWlV4tCexgQrt0nUXABVTfIzT
 I44PKVyKMLeA06nzUUASgSbkZxQi4fWXWJGrCzjjuALUSxC89E8eOS13xKNQGMeSjmTksTqMJJf
 uB22E4aWYyc7ofyoGDg==
X-Proofpoint-ORIG-GUID: tKzAbrlDZBhrdHnNgaIDjYvIb-vMBWHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37683-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2540757D00C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMIC Type-C devices historically provided their own way of
specifying the VBUS regulator, via the device's vdd-vbus-supply node.
This is not ideal as the VBUS is supplied to the connector and not to
the Type-C block in the PMIC. In theory hardware can use different
regulators for VBUS, so specifying it in the PMIC DTSI is not correct.
Deprecate this property in favour of the standard way of specifying it
(via the connector's vbus-supply property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (6):
      dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS
      usb: typec: tcpm: qcom: prefer VBUS supply from the connector node
      arm64: dts: qcom: pm4125: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pm8150b: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pmi632: move vdd-vbus-supply to connector nodes

 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml |  4 ++--
 arch/arm64/boot/dts/qcom/pm4125.dtsi                       |  1 -
 arch/arm64/boot/dts/qcom/pm7250b.dtsi                      |  1 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi                      |  1 -
 arch/arm64/boot/dts/qcom/pmi632.dtsi                       |  1 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  2 ++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  2 ++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  2 ++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts          |  2 ++
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  2 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts          |  2 ++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                    |  2 ++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  2 ++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c         | 12 +++++++++++-
 14 files changed, 29 insertions(+), 7 deletions(-)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-fix-tcpm-vbus-aabde21f339d

Best regards,
--  
With best wishes
Dmitry


