Return-Path: <linux-usb+bounces-29629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E693C07B41
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 20:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2C61C443AB
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 18:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A5F347FEC;
	Fri, 24 Oct 2025 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtpT4FvL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2733FE07
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761329933; cv=none; b=lAW2iesHPDJxMLFlfBsQNWn3wjJMz3hPVmB3TD221C02bSoizk6pkL676PQQtIgmSFqoTG24kECtW/cJpJK1zW0lD+ZLxNvNctTzu5HxqUM3hhjLx4Qg8RcF3aquH82t5cJda2WIYmyr68bcpW6RKdCUzrHc3oQaw2UphxqkViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761329933; c=relaxed/simple;
	bh=ZKqHGBqht9+vOXZWnMdIb2qlDFvjo4TXm7DhSQz12Bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RE65BiMHJH/T/gjn85tmWyvVexSGWZaBtR3jlCxLinwjmz5xc+b3Me7jFt/yD/FUA73Nlbzw4IzGFvOpQftj9dYHXSlRtFYVOTN7jd2KQM3mlNEsJDpaoY+8spRtSF3opTKgW4XP9poZulQy6G9CB/a1cvvivl4JiexsSF2o6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtpT4FvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9Gwx009633
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IRFK4cOMW+kcSMn9HpIyzq2Gx8pGlfR7x7M
	K7vaKSWQ=; b=LtpT4FvLFAmf31hW2+YqjrTD5FJJz3KJew1yFqu5jECLxgut0eJ
	IXUUAtjwGSlNZe1YMFVOBBajGrEVHZpUCFC8SzNB0xb3gatRi7pFoLhz9G28tWlU
	Yy0Cmm+6NW/RszrNcZu0sAYmhNN5IBFEZI96hgXo7LrVMn+wDqx77pnibatvxeLu
	EO5s0zd+F8EqBJTRlATxL6r7y2Y//OM1QDB85N2cJjnAryppbozbCzUm5fQlv/Zk
	zb1rIeV0fE6GtqM3dKGJDL9hzps1QV1OjLCtZ77faAvNCqJnp4r9I4D3uillcaok
	1gJInBKu5H7OwfJzpd79lC1iGBbhJf4SHPw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jct7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:18:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290e4fade70so20658225ad.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 11:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329930; x=1761934730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRFK4cOMW+kcSMn9HpIyzq2Gx8pGlfR7x7MK7vaKSWQ=;
        b=Z/J+GzuEtV7exbIkpTQXeyOKZ+1Cd4Cyd21Dd8gN9MqIozK2LPo6W0qRFpSDHxEuMZ
         DfMcXDppaFVoUlqqW56iHLgPAS9ktWv1jStUV3KRC6FqmBmwOs2gG15WfEelX3NfFdWr
         lMQbKvKyiQT9+hKiXZj3MFsRjtVkcFYPiQskXiMeARmuz5mG3mklCJ8cRBNuDsLIs+8W
         7FFEfNG4QwuCLxec5ZoEzwJpDa6c5ce2WgTXWmiV/PY1Cy8T1Zn62BLnPVqdjYBqtuOO
         6ob1lAhCLqlhTDdBHvqNFsk78RTXvkqie14Qjuvt+iAzkAEAOEa/XNFJkSNFhJ5gKrgN
         eYSQ==
X-Gm-Message-State: AOJu0Ywlu3ML2Cx6RuL34ypCoVDVenmP52FEdXOHQaMW6BFJBDud/qyj
	371j8wsIqqogG4ZsMLluhbJ4IDdSYi1pHvE/hgys1jSmoImJLZh6UALYQ4CgaI59dc9zUJcuCZv
	l1VuXLeOkPVhiIzbqmTQ5q9eaeVs2Vn2r8hz8xviSspxOcEj1SoVdsHq/Qm5hwjI=
X-Gm-Gg: ASbGncud50gwz8ofMVHUB2Ev8TnE6LSwgIqLhri0b06nhhvoHJE98dJyDKUpw3abVUD
	/WFdh/34i3rAchwj6vKga4a5lno0gAzENNRtWnN4stN3f3hWTJjH8wHsJ+4ooGbsd3fD4buyVXh
	gR2VjJD2i/EcQC9DbXL1EIgDUuRfUTN4+VB8MsML+ZO59U2o4/uxacBuepLVmDmMPKQBHYOi/a+
	XB2eChQXVRpbrMNgzxON3jvVktn125SZi/5S9WRHaDdAImJaHtEHm2mrQqHS0CqkKJONQMM0uJB
	OsqVPKVp/ZVODSaqJBjawvDu8ct0wicSIMubWEXN6uMwhaSEf+L8UriMgfzWFuG8b73d18TqZgK
	YGyYRihIMDmWob9UFvvoqbuwhGW0QjYKbGq8l
X-Received: by 2002:a17:902:ccce:b0:291:2b6f:cf64 with SMTP id d9443c01a7336-2948ba5b7a7mr38569365ad.55.1761329929515;
        Fri, 24 Oct 2025 11:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxmSFrHaASCsFr+5s4+V4woE9zhvtI9rXOx7daC/mzgx4vqNPPBLgn3gf82z4cvVigpg+Twg==
X-Received: by 2002:a17:902:ccce:b0:291:2b6f:cf64 with SMTP id d9443c01a7336-2948ba5b7a7mr38569005ad.55.1761329929031;
        Fri, 24 Oct 2025 11:18:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfd0405sm62398045ad.66.2025.10.24.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:18:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Implement vbus support for HD3SS3220 port controller
Date: Fri, 24 Oct 2025 23:48:30 +0530
Message-Id: <20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX0fMFCPobiQNk
 f+rqcqqsfELve/e3wUZJUkEQ1Ygz47BJoHXJB6DZUmT9rXQWSscL+MlOpiBKL4L6NhBNcSOrGCg
 hk/U3gP1sbaPET3IlFv9tfj0ri/Tt0E099T0/ftTeL81JcOoWDxsuCvi4KRJzVbuV8Mgc9RdzIJ
 7+BwNXVkrDKjEMBOW/um5mGMkmcOjsAhU1KiDQe/P8IQd8qvhiONw6ztqUus40vMaJCDM6yopBx
 oBaXuLQSbV0O5K3LeGE2NZC99TXv1qrfW6X255sQ9SLktHKR6+n5zQHD0Zs8QbJ/+AFZkbNCX7A
 A5en/uKDqPYY+Mhmx8IXCdI7nfcWyE/EuVkl61ebUsgtaEUMlWb+g9pny2B8FxjpMc8p+Mda+/i
 91d60CUWj1F9bEDQmNz9BXn0yYntxg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fbc30a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gs8g10pPhjI8XjwtQ3cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Xix8yb6sieve-D7g2ldUuC6hfByoCrPI
X-Proofpoint-ORIG-GUID: Xix8yb6sieve-D7g2ldUuC6hfByoCrPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

As per the data sheet of HD3SS3220:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

This series implements support to read ID pin state and accordingly enable
VBUS.

Changes in v3:
Removed vbus supply from hd3ss3220 bindings.
Implemented getting vbus from connector node.

Link to v2:
https://lore.kernel.org/all/20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
Fixed inclusion of header files appropriately.
Modified commit text for driver patch.

Link to v1:
https://lore.kernel.org/all/20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
  usb: typec: hd3ss3220: Enable VBUS based on ID pin state

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml |   8 ++
 drivers/usb/typec/hd3ss3220.c                 | 101 ++++++++++++++++++
 2 files changed, 109 insertions(+)

-- 
2.34.1


