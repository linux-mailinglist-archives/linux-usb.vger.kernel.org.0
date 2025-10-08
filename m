Return-Path: <linux-usb+bounces-29045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A935ABC638F
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 19:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1BF405A8C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 17:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD97D2BEFF0;
	Wed,  8 Oct 2025 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNGipyua"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A832C0296
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946293; cv=none; b=T3QhNh+W1dwvE/qWRmg8TSFvaiiwyQSIUbWfUkbzNJzELFXxUVWSKGkZqfqnn6sRDXsM6YkbHMm0GqxS/9hZk6WyUptOMwPUKoRJvSYt4yJgvzfESrfNMwMuJSF4e6FSuUAEHrbOv5mWrZ8kIcl5c/Ipu+5zCGOtsf/SQFAoLJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946293; c=relaxed/simple;
	bh=GNUvo6ahqMDDQmc6VatbjGcaUHeIlPCtEx1Od3v5Zoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=edbNQ0+eMiWYTrnBZ7MnD/cGjgizcw2Q6To9XuHmik0/U4JyZQPtLZMYUq9xISE0fdwjPPQgdyIK3IFIp77NLz4rQIKmG/6GJ2en9QdVAIcjA4SnNPSUAKUInuLy3rUm41vYdsPqRUKdA9xUYH78cgSbW5TqYhoXVgB4Z/IWWis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNGipyua; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HAxO1002039
	for <linux-usb@vger.kernel.org>; Wed, 8 Oct 2025 17:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Lnlm0zjjWiQ7ki6NUOp7Ssyybk7floF+zN
	XKL9UuRo=; b=eNGipyuavhbm2x+sRx8cMbG2Ca9vzdFVHmRjSZ7Hw2o2F6chXjv
	aA5Z1xDVa5KQ+2rFc4d4d4i4U5pTkbtCsJOJ2m9ixiGxTSUQdPzmN5YC3KmV1u//
	jZgVRhZEYZurUI0XcDCYcgqNpUA9Zc0Fm7eP0hVOfDSomKwdJLMX4TmN4NwwixUe
	l4jU8DMGmdLdR/CFHaWCDEJEIuLNOW9zVJlGh+DQ3joTrtvG8pzA65tl+uk6nI2m
	r76wak9lv1dOCxAAIS84/31fqnMxIAFFAvytOglG7ozbmBMT7tMcOJoiZf+EnuUO
	htazily+3FXBekPB6+cj1+x91XW7JxNW+XQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kg4uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 17:58:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3304def7909so284488a91.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 10:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759946285; x=1760551085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lnlm0zjjWiQ7ki6NUOp7Ssyybk7floF+zNXKL9UuRo=;
        b=NSPxYcGIs61qUtRJuT1XBkPVOgcCmJipFQoU6IZr2ymMow7+YkA2Cjs5NXBVwVqNzd
         1eVefx2EyDsdYG4r0vQtIW2eDYYaUDYjWJtZXixbXIfqr/ijOecbG3gdm7VY4hJmH7Nh
         JQYNlzWuQUm6vxqUCLgaSsqSU6cvy7/yhDqvUopcvf2GEs4gXtE65BJS9Qip5bXz8uYs
         Cl+skjHBvFylbCfl4vSWDv9dufBJqkI7tfKlY60SX2M32taAuH2h+W3vzKZPTa53uuyO
         8gKasxTCJTWLjuMTBoJkYq+nb2N6vxRy/uCx843M2ZabHcp8OpmqiDR/b8t3roVoD4aW
         CKTA==
X-Gm-Message-State: AOJu0YzwBun69Uz5+EzU3XhUPvIXc3EvzURVLg0EtIb0I+JF18nTX2i4
	uuJ2ul/h9S73j12WhCvfBwXyT5S64f8DT7HHxK/fw5CnEszFoxzpvSoBpoMeUi75ULIWoXuvOhl
	dS5/PaObveG/EeBh0Jg2ghEBJTxvlTYmp+TPjwGUdBxFqziVKM0eUPrL2we7cYyg=
X-Gm-Gg: ASbGncsFzm5GtV8qfSjfQQ3asqA6XYKQJnPSNldYlrsxt+3cXLm42DoFLq6v7zDWoSL
	NnR1yJbL9ek9sFz4TETvhKnAlG3nfHJubYozE9/uAJPJThgq0fs8VBUyqxg6su/lG45xpcHLb37
	e//mRGsZFTe+5mnv4aSTJDo6KD4HJhWR/PGvVTj6vM0YhxJJQtOwMb2dLHYUz1u/3qZyB+mVrJi
	KldATt5Syv16c+oq4LW7uJtLas77m67k5ZXu8MVUvEjKME0PIWF3/1Zd0CbcP6NfUuwWZ1lpiC2
	jFBrw3LRpHlOYx1pFGHqABJWFdT1u4KEKIl2vDMzKfrlepzSlDPYYYhcOChKWksyk038yd/X8ki
	AqmLixNE=
X-Received: by 2002:a17:90b:1b41:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-33b513d0b37mr5027248a91.28.1759946285382;
        Wed, 08 Oct 2025 10:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVKULYrHHKoUCwdURosQLoIlR8wgg927L9HtEPvDdQ5p0v4OJcirdLLPyK7xjfNTlVbUm18Q==
X-Received: by 2002:a17:90b:1b41:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-33b513d0b37mr5027210a91.28.1759946284796;
        Wed, 08 Oct 2025 10:58:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b529f51b5sm1275726a91.7.2025.10.08.10.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:58:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Implement vbus support for HD3SS3220 port controller
Date: Wed,  8 Oct 2025 23:27:48 +0530
Message-Id: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e6a62e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0ZYI1qUNTW_HKTauMVIA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: uGMX8j13HcJPAh2-yrn8izU50QzuwQ1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX224nbsGPnIGo
 6dcUvUvSxJghnioE8qA4BQE1ajAtgwdY5UTt4BJT/V/2aOK2r7NjarZbUMAQKFjrfNJnNeF75Ge
 tJoYfvWcRl6wB7AMtAUDL2DCAU7XJ17/rEk4N1GbIlQCqicNXjezqfP2KesBr2XFQfV3zAQbKIY
 ayJ0EL5tWLbF21RJXd6h6qZbVyn1K9coLaN00HHJW2xKy9VzfpbHqJ/BtJpnnta8Z5Sx8VydNuC
 AXHSjP2XjUiDWzZzjIp5/KiPnWsQL220sE0A15m2rVW0Fo2n0srjrBhH++pXaOv2oUPaE3Yjk9e
 7MJV8uMwNhbTDDmtQFDKdCgj0oRbcOXEa+XaBxxY7lR+x9SO6l7GlXxvSANC04j2U92ObY04UzW
 KHfZ3983Rtgc/UsXyj22LB5ufAdk7Q==
X-Proofpoint-ORIG-GUID: uGMX8j13HcJPAh2-yrn8izU50QzuwQ1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

As per the data sheet of HD3SS3220:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

This series implements support to read ID pin state and accordingly enable
VBUS.

Changes in v2:
Fixed inclusion of header files appropriately.
Modified commit text for driver patch.

Link to v1:
https://lore.kernel.org/all/20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
  usb: typec: hd3ss3220: Enable VBUS based on ID pin state

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 13 ++++
 drivers/usb/typec/hd3ss3220.c                 | 60 +++++++++++++++++++
 2 files changed, 73 insertions(+)

-- 
2.34.1


