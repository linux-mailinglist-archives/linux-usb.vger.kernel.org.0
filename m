Return-Path: <linux-usb+bounces-36572-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLPUAvrY72l/GwEAu9opvQ
	(envelope-from <linux-usb+bounces-36572-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:45:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DF847AD43
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93EB1303764C
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 21:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FF93A1A54;
	Mon, 27 Apr 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SA1MYBMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1MN/qs4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13A38F951
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326161; cv=none; b=BlVH/Ed2K4Mw4uMAu3GqHBYJBo2orDi70zZLrYbNjSViwqNVsUE+t7bIBFYucjJND8im0lQNgOgXPat1/FqDqrtbG/hXt76Ta+8chCEfyrEBM7uTnviECcb0A4wxC1vpX75IA9VE0XtfSYevYDn9PpUsUHQc2FvDcmIdj4jCSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326161; c=relaxed/simple;
	bh=RdFm9GylrrXXv/eeKp9jybJhFAM8XC8WDco+aM6QZOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H/Lg8/p7QQRrLJqjZLX8uvgWK8SFSeQ7tzDiyVi4Sn6l6uhta1eM1+JExuw7agFh91jeGmZtYMb0QtcMU7vG4EMdO9bznhh9XBAPNdmEM+PqsXFf6QG/qz3ATMV3Ebu6ENJAgLZjGFFKrIKFoKXmVv04AqPLhy9eakuIo20L4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SA1MYBMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1MN/qs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLH4w440498
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+S
	vG6pXlRU=; b=SA1MYBMv2oQINiSXWPiyj75cCCqKhQtibSeZsvS5Yh3gVG3xW6j
	TAg9Zac7zhqAA4cRd0onzYu2aVGfmAeBRs923zWqGoplkjaH+e0hRXonriAXukX6
	BG0YrqB6wOWMwlxQmNLz+63fOuj27Ur38P2pKC38Xl3VycLJlR60jdjJhGRY2Odn
	jifunNy2ixO32nxPAEKBIyoY5O1wt8W147Y8QejXMjiNfmlff4e7OrcyICkdWJu7
	eYCnsPlE7rr7qcCh3PFKFFp8rD5fnt3j977VGGIfmK05dqND0NMmAfQpPgv1ZxhD
	ZvuDDw+kCla/O++ATbhaSsvMKHaGq0qJH7g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac41bj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:42:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273dfdaf5dso8902035c88.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326158; x=1777930958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+SvG6pXlRU=;
        b=D1MN/qs41gNxHSWQfhEVaVdtFJCPtDmoqy5EuJ3ggqoyOG7n1R9/Q9wlpGw/Qorh2v
         deKddUgS4WjTyk1nMz1i2WYcF1Y0MeUKTNlRPWnXe6wN8LziygWPwcZuko+xdb3kMxea
         1XuGUBHGgsCJm/vkCsnbk1my8YfBUg4vKMgdckASofpz385IsU5IYU6LGUk6pBAAIJao
         8Oj3DgWvuZ2kfrW8TL1I41YqLopuI6k3ipZT0Puc9J+oSvOldafEQTkUB3n0OJE9UL/r
         4EaoWXrfZ1MoVVRz+4UVvU3Pz1KkRRfg0QZC8rfsmnWITLLPKUFmJA0Je0aZ74LuSccs
         dQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326158; x=1777930958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJjHZ18GH17YGrCyaUvGtQLd/cBQ2Wd6z+SvG6pXlRU=;
        b=ngSlabRI8fyCvzAmqRgmuHwjq+e8oHxQOu0GlUgqKjSGeslJG1rr/13AIB1PB1Fcil
         dUeH12L1ifT4jNu+hubidaMK1radNL6/StHY7wdAaE3nac8R9zcr44Gomj3XIE3fP6Yg
         /ZsgnxK7ipW3uIiSy54h9reLVzteS9KX8L5UPUPrGe2+xPqNTbOwSxeDI1/jYTkwE56h
         2m9LL9rApNIOPPjJRoSZVeJfqgQcN/bASDf65BasRcghQO/OXlLPelJltNyjZu2qBnXN
         wQLKZQfO7sSehvvIYK51QQMgDnUDkD31f+MBN7BR12605I59JxzJxQ7Fz2L/IIC2g5tm
         6Htg==
X-Forwarded-Encrypted: i=1; AFNElJ9KANohc1HIEjw6ay7PF3g0KTOanlzAPw6YxIqfu2NpyKxwmZRDQgjdLhsZu1dbU0gxBVflz9mWrB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzQJIKw6FR8BQPmyiR34fltu4oaDuMg40f/OjOmFXzWgehKfI
	50yYNYknXvaKDS1X66Y9H7cNgI4hZEaiKLwGZShPMamrrsJzF/p95AZVO7h0XQOMtYhciJJgH3a
	Vkw/nyt8otW38Lu+M5VaZkGB05+eRKqewOQ1qQLxgXT/NogauVycDD0SSM8QiuCU=
X-Gm-Gg: AeBDiev29oSQGIwGpvReCm7ULPBGw4U7H40XUtOrbySZAyUz8dcPvnRvENvP5xwXr3P
	3jeUcUpJqCFzLJ5W7JAUd831/L0VgFkzO8xFd5qh9qfVBaEaq3mv5HJuQ6TdriGcxJ7vzEiwyHk
	/fIJzHdb1cPnE9xa1thO8BzxVtOoW/ewUGm6mbXPt6n6fLDPOCKjV+01VsBFEvuxde6oSHKr/uj
	h/U4TS7nkM0P4bmeby2lVVwL1VIADPhuCnRsTQN87RY/c82oNZROPfl2CCxtaqjgE9MZOLeU+oi
	fq6gCfMHJ95DDu1LjJanXN+Z+QJU9z2z5FKsYayfruhkYAyu7A6w+GBQq8SftbwWW95uRvJLyMb
	42RcnTovGxSEj8+ODeP22iF8RnkWqYCo9IzW2B1J6kPMW14vNpnihVIYEAMUGJcaWCbs+uoFdfM
	v4uEiTqFmFGQ==
X-Received: by 2002:a05:7022:b8c:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dddb46febmr179871c88.7.1777326158505;
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
X-Received: by 2002:a05:7022:b8c:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12dddb46febmr179836c88.7.1777326157948;
        Mon, 27 Apr 2026 14:42:37 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:37 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] phy: qcom: Introduce USB support for Hawi
Date: Mon, 27 Apr 2026 14:42:13 -0700
Message-Id: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rZVO0DrIwtWjbEERTAGNES4ZhXPtE7_I
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69efd84f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fySfh4wnc5TE2N7XS4QA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: rZVO0DrIwtWjbEERTAGNES4ZhXPtE7_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfXz/XBnZJgT4M/
 qzj630qDZNglt2ceNP2I5tfi5oDvGJXACsaXpAa86FBsuDF/10iHY6upKTDUuCxhI1MqysmK+fR
 Uz6084MLtnwicZWgB5MyOeTeWcKaypZkkyWTfUfK2GbxMuDXu+e4x6mCzQ8k+IHWswMi8d+HQeT
 G4sXf1QotvS+ORWdqu7H3LkGAS9sFKwKQ9iB6ermsZ2GbJqzvXgp5frEGGQTQNa634OUgPbDE/u
 7w+uqH1uhWF8uh4FTOZ9blcGz0uwQ7WxQE/V+nH9/+r0QKq6ReqkXTX3tN2E1tn5ruf8bBBbrKh
 +zeCGV33h6lNlaH3F9PLBSTYaOcRydnefhjsYnM2L78oIC2v2o0bq50EYrcy9uSkITfZsGWEeiT
 1DSsj+D8/cJ21ZKtw3SaXbCfG1j88hHEVwGwzLf7858yF4LXkvYZkro3xP7X4hy1dJ1T4KU8HG8
 fNmwmlVt8Wi84EBVQAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230
X-Rspamd-Queue-Id: 74DF847AD43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36572-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

---
Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 512 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


