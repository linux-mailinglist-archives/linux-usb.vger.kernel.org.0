Return-Path: <linux-usb+bounces-37497-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G16HsP6BmoKqQIAu9opvQ
	(envelope-from <linux-usb+bounces-37497-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:51:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D754DBBF
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38C3F3018D55
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EBF46AECD;
	Fri, 15 May 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE1/2tgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adFkljcG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB17466B52
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842072; cv=none; b=VXQQO5Wsd9qqRG6v8ASj//iQldvRBrzI4ShGKX/XwO5Hu1sUn10MBiLhsFshSGVnZZnBlqxfLNKPhLobj+LyHQ7PzGWNce/H26DBvf5yPngmMl1I6PgBT6EHsAqKgbXx1PL+ipoI9504KSq9s4bYH1O1cMkwSG9QsjMTD/yJkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842072; c=relaxed/simple;
	bh=RijDqSjfKJNIL2BYqA6ow9Z5hjliiMofsCwqL8Aqnyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BvhEmqGVy8jM8sAzpBYUhkQlS1rrY0iBwRVLUiODkNu2e9THPyKvYc6YEvx/xvIWKt8HXrKmkuBzSzm5LKQhhgGVmM/djfNoStdgt4CjysUg+syyAvo1sNxuJiIDoWWMbzTkq0SGL5H0aX1Ouri7gFMaGI+SKi4uEmbf9eox/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE1/2tgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adFkljcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4nTWd3670929
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H/XXsyRxgO0llNZtCTaH5Q
	dQ6GC0REVLGnyPyOphXoo=; b=CE1/2tgHEt2G7N/4gq2ywgMg2/ZZOrHf3VAgSf
	IEpkbXyv51RylnXz/PT5dJsKdWxw04hniMQDH9vycr49ahGfAFjUU8vPAtcch91L
	XmfwKtvMNU3xOLHb590yB7LR5EBBTm3XylbsssbgsToi4HxaW0R7kuqwSmdYSIBJ
	pxPjggOfptSgZnm2azUIXCDnOwzozd5KGx/kYD5ctJcUFrhv8RUYdgns8OvRWlgZ
	b20ytJhNC6mnjc//ADbaqTPmY8Q1g2SipzoUDIQFqi33wMYlEHxMgJRP1VA06iQA
	lP/+29ztZw3GhARRZKsBqb3K1okWBmhMxDDw24VwdH5gJ2+A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2y51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 10:47:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso5859190b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842070; x=1779446870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/XXsyRxgO0llNZtCTaH5QdQ6GC0REVLGnyPyOphXoo=;
        b=adFkljcGjWXbAFcGHxlIgshfTwtrMMYgpXt9tfdJepdIinPYB5gpldeJb0AJBk7s4g
         ELDLuNrwBEpbshZqemLzXj0iYN09owmQ7XLdBP5tktxIk5rys2+oi/0/+2+MWfEYcBrm
         MzWwPinnivVxtiapqHndJSyGA5ZOXV9n5TaTszDHLt0wQ/F2rn/klZO3ebkURglEM+Cn
         9zUA+xREGsMYYOrlZt2HOpXNRudQ3WD1jxC+ZR4uMXakXRjQyKokWYMBRm1AZ0aOggk1
         jW+5QvaLW2lxT6gepmVH2Itt/Bu9OPMdYxQSozlLvgvXqzfG90R7crPO1s8VGmSTcABe
         1x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842070; x=1779446870;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/XXsyRxgO0llNZtCTaH5QdQ6GC0REVLGnyPyOphXoo=;
        b=FADOK/b9F7mvPw9i5HO4YINKDSoBbH08h5VL1PFpB8ny7hEU65iNqdbRJZOH+vugkp
         0GuY4dB7l7OEPDm74NWPIxzBXH0/rAGx2iRHZPEWdeb/gZ6I8z53WRhbbbHxPTKr8FLw
         KRfDSSRRwD36Zb6TN9spSbOcQCWSYRqB9+WzDPhQ9GgWHUL+7CJNCtg1qHF3sL/23jrO
         6RGHW7gBj0E9i2D7r/kCSmx8te94vGES9mohavlYG2DayHZ//s3f2IytmlHHjWI1g4cq
         jZfm1oUC+vsRQqET/4gdcrfhAvI+5Q4vVYP6D2ekQe9a6oMlyf6U82v3RkWTjJJj/UbS
         y3Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/QtXX9iptreaU60yTKwpsoN6wvGLB5J8hXEOAvlIC/C9LfDzeLQ+7mIe/oNlsipHmw4QiRfpxVbnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwWdlv21A3aq0aT6VB7jHRVYboHWMSyAQnDFuq/WY/k0OXweW
	omy3B60FTElPT8L7nxwSP9bQ8QXxay/d6Nyl31O6ytOKyj0q6frxnXUXZIoDreEReytdoXpMqXB
	s7WcWTtgF2KlkgF2GdDbuSqgPCQI/4TdVItXT3EQVKUth1hT5Gu8sj31dTxEDWLY=
X-Gm-Gg: Acq92OHHHlQLh8cLkcOjpHZxKY5dV5AbYcV446QOtl8hVSCxQeN1pDjrc/3+vhUh+fb
	kvGC7l6TI1dPEvL7t1r8CGsLxLNarEKA4Zm1Fmj1fmvdnQI8fBkHVjsImhCADdmeDYDZNdk2RRH
	94XnpFwk6sWsbRXEjOQfnqSe1bzhoSUw1a0+79NSRh3vlyay8g8kx0PNcoX7tdiqQ3IRyebRyJI
	m8JYzGvNUk7X8DVjPqL2Wh9daibcHQLkEGm61ORTiHlcW1yLNGFAWklx+hoQ6fiv7x3b5AOscJi
	R6w24HQqjnW2wmkppcvAcQ0j4h78qVtNiC6i2RCpVO1LkITDSS7fzh5SyGeyiHN7r8c6bLYti/t
	hrKEZUrqe42ZWFYHVvgu4OqZPm6u5hddBjnfKlDVBJge5ctnGn39xeaWk5NFzBmZgRXQLFGj8EJ
	Jl2OmKp5QP8y6iFMIKq+lqqa0HRN2qDdiHmhU6PU4+9RQjQVPfvDI=
X-Received: by 2002:a05:6a21:33a3:b0:393:74ed:7de9 with SMTP id adf61e73a8af0-3b22e66471bmr3673864637.3.1778842070106;
        Fri, 15 May 2026 03:47:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a3:b0:393:74ed:7de9 with SMTP id adf61e73a8af0-3b22e66471bmr3673829637.3.1778842069588;
        Fri, 15 May 2026 03:47:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/5] Enable ipq5210 USB support
Date: Fri, 15 May 2026 16:17:41 +0530
Message-Id: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM75BmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3dLiJKOCjErdpBQLU4NUw7Qk45RUJaDqgqLUtMwKsEnRsbW1APe
 eit9ZAAAA
X-Change-ID: 20260515-usb2phy-bd850e1fb3de
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfXy+jqlgLYi16K
 hJN78P2AA4vEft3FgLvAX3J7NU3XH+egNZjKd3/YedPmhhzKvb9vewxeKoYjG1wf/3MdgFVCbzL
 mioEzmcvkg3aso35sPc+RFcCLr6Q32/1X6eaT+1avX4SpIZx8BmrZVuDBQ7d7URmtdPkFjUygw3
 LacFWgCRTocIyGiVQk/y5ZNi2EKAZbxg5FU6vfKWBLothqfQ+sTKtf4rpurkR/6s9iEsGlK+6sJ
 wfkBwbFsouGMGm2BwwkjHVRkiT4aj/8r8REcUQgE9TKy27TvF3GV0tMfbzw6KpjxKdXmcdR4Ize
 gvWkCudUwiMzzcSwaEbn5mDjJeqah8qnq/zkZzYpkMSnTSimR0u/qmxx/aANobs6o2y3pzRSfXe
 fe4Dy4MFsLG6jEZ6Fo6yUa+5OM4T0GbYUIex/rHXhirhHYkDpDWp93937pv3tbhdoOoAkcR+DgE
 KyCW5vLXcR8OdnFbzYg==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06f9d6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6L2eJvA39pK3U4l1HDAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 7l6DK6BorDbSpkg5-hfuP8Qs9dLtkn_n
X-Proofpoint-ORIG-GUID: 7l6DK6BorDbSpkg5-hfuP8Qs9dLtkn_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150109
X-Rspamd-Queue-Id: 151D754DBBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37497-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ipq5210 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qusb2: Document ipq5210 compatible
      dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
      dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3 bindings
      phy: qcom: qmp: Enable ipq5210 support
      phy: qcom-qusb2: add QUSB2 support for ipq5210

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml              | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml                   | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c                                | 3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c                                  | 3 +++
 5 files changed, 9 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-usb2phy-bd850e1fb3de

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


