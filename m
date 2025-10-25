Return-Path: <linux-usb+bounces-29646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A561AC09042
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 14:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F27188DAEC
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 12:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D047E2FB62A;
	Sat, 25 Oct 2025 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyG+RMzO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005B2FA0DF
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761395354; cv=none; b=cBskNHJ+eDc7Yoysb13kh25aSQmOwEFR1tI2/PZaDhvCSNfMV3GP1d2I68nmRLxd72Mw5kgZXeoeidvHIrti82IfRw8LXACg3VtD/UcGYUPHyVn6H4FtTuj6QV+QysICi6Q44o8OVtZGiO9NpFKSJLB+aGUINlqS901ryI48dAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761395354; c=relaxed/simple;
	bh=DdAra/cZ1u9bNfmmdm5GVrfXJUXNr6ACdJxrNyHNLJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kLJ85mb180ekklhMrCMJo8AStTExvsusiSTIeBtkSERZPdz2p0VdntBt1gxlub9oDVfzKfuZc6WEIOJ0IEWVnugte8Cvwaded8sYAxNXqMOjsgO1ZJpmmbwweY08JG2E1xO8Hbkagl/o0ing2iV0qixLsXgEioUUhksCJILn8TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyG+RMzO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P5Un6w376395
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 12:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jFjL6anUYqjYCKqp1WFhPwx70zokWMYl2Sb
	tHR8h0po=; b=UyG+RMzOvW2FfswEKKUGeXZBMILVsvyLsFBXUlyj6ZYjy7+LPE/
	Zj1Zpy9gbMAtTlTH8tY8AiB87QFEYzDjPXc/MLT8wlJfOBqM3D0+nNp5LOoeElJG
	9LNEXheZqbBi//iHKnFT9yCsdijb6wUdcT9ZYnNbZX+iA4TjTouuUPES+TlXsFsf
	r2u0njbRjCU4B5jktN8gkcqbsSGsNAb9bQlSSQFYS/zr7aXOKwhtB2QgQptZ/UXx
	NFLbdyBRLA4pIK3oIpwmMGl/JqLVa/b0WkTDwkV8HvWE3XDH9zDJWzCHyCC6NyAB
	ryoRCMQJxJphqBuEGt7q836ro7y3KvyfBvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p2q0m8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 12:29:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2924b3b9d47so30149085ad.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 05:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761395348; x=1762000148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFjL6anUYqjYCKqp1WFhPwx70zokWMYl2SbtHR8h0po=;
        b=Vb3ZP+UYubxSWkeQzrTwnSRav6YOvAJ7eMmDV90C6j+8czyz1vT5YlwJOg2kBRzOyE
         KGKnizUl8Ms0V9dLrsD0VwQDp0F/S4XQoaape+xYLLVndJWKDrMKz+V4KVuA/CQtQCRg
         9vFOFsWeoQeycMLaVbK8CitGRyhiB1kk6+O1K7fbS93hMws86GdaZ+rLpU1pnjQC2bo1
         RHMz4TvaBRsBskAnA+K+e0lh+wSSzwyC1evqEgG1DOTo6+Y7937oyHlOOg0PrpLrr72r
         StszzSZAyBbQlNRVe4ecBQi1dghsoMVh06fKGtpE6P1sXS/tvMZZOlgNFtiqcrShKgqI
         nvkQ==
X-Gm-Message-State: AOJu0YwEFMBcm6YprKqGko03g4DlclXeYTBwYmVr9ZNcw+fV+6y/CGkZ
	I7/31KY+WwYYtmmbF7Z4s1fbnGDADUuSEzH4EXtZgKeBGGGv4Dt5HJKSapq4Qzls6eiVGfWVecz
	bJOqdEc9i8wEWyYkMYx3Y/uGRW3rOrC8w33cmjEXI6TzjCGHk9UAIRwHpjfuyy1I=
X-Gm-Gg: ASbGnctbvuGLiXKSd2XOiJ20xlmNPDr6b1SBVJiV+onCSRf2ecMT0Hq5fbPazLKmAD6
	72iGYRqFB3NNjHEK9Fb76BztnwyKnG8k06XuCkhHP9R/6NBmiFAwJulgaChDKvEWcGTVXMIa6TS
	qSJyYTouK5q4G5N72vhQkFtegnz2PEfSLeZqUETn+oh8QSsOOTkgHcYIPVifybP177VBqknxW/U
	aj6qAP8EkOXRVMmFhrMLGmbmj/uiIa28pzGZ66eG63xBWX02JmRS68oS89UB8fOK5RFnFrg3MCj
	oHU1IwxQFjm7FB3QSHXD4sWUpryEULXWY41uEs3/mEucnAcwhQSDgDNG3gKpetyS/SswEBVen6C
	Vw3w6HEmdEHZ1RtDgQZwh7rVsI3ZxdY2ePnme
X-Received: by 2002:a17:902:e5c8:b0:27d:6777:2833 with SMTP id d9443c01a7336-290cb18415emr438839035ad.47.1761395347597;
        Sat, 25 Oct 2025 05:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmK/7XH8hwV+wlEEuVM2Y8daSy1zdYSeunyjNJlaPwPnI6EiEv3JrxP7CA43TGJk//ZbV66Q==
X-Received: by 2002:a17:902:e5c8:b0:27d:6777:2833 with SMTP id d9443c01a7336-290cb18415emr438838775ad.47.1761395347097;
        Sat, 25 Oct 2025 05:29:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2317csm22381325ad.48.2025.10.25.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:29:06 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Implement vbus support for HD3SS3220 port controller
Date: Sat, 25 Oct 2025 17:58:52 +0530
Message-Id: <20251025122854.1163275-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QvpTHFyd c=1 sm=1 tr=0 ts=68fcc294 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gs8g10pPhjI8XjwtQ3cA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDExMyBTYWx0ZWRfX289jd7sVDS42
 IpSMPQ4rFUwYKULTixbXWcq9gErahQ0Wl56reV3nPYHmm6G5pHS3rcGtybDA8DaZIqaOMGpQ5gV
 rJD31IZ5mrEZCHMQY9nomBcJWr5iu46PTcX+mI8MY79yVroyiSE0eOtkhpP/yOI5AXUNqHlLnVG
 Rr9TNir+HtZU6YHSrXc57mqpzM1cE6maiWtTatxAc48rUALaF0nI7uCnH/EotTfbE+pGDwIYTEs
 Fii5RwNo9bHxBkfMU6HJncdOuWDg3bIFelyZQt9Ug/H2kr9LbwlL0BMzm5XGqZ3S1mJNJIS4AET
 rYBws5JnMRecGd5Q5T+bHM13BuP30lIZ5ynplxfxLuipPtxf7mlMjmu7/TBxz+gEUxZS5wctaPP
 0LdcGz1jAWwa2f09V4W9Tqyiljcydg==
X-Proofpoint-GUID: uplR-Y9mP3BIsnXjanQz2e7vKsMRJie6
X-Proofpoint-ORIG-GUID: uplR-Y9mP3BIsnXjanQz2e7vKsMRJie6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510250113

As per the data sheet of HD3SS3220:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

This series implements support to read ID pin state and accordingly enable
VBUS.

Changes in v4:
- Modified logic to check for vbus supply. Directly checking first remote
  endpoint.
- Used of_regulator_get_optional instead of of_regulator_get

Link to v3:
https://lore.kernel.org/all/20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed vbus supply from hd3ss3220 bindings.
- Implemented getting vbus from connector node.

Link to v2:
https://lore.kernel.org/all/20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Fixed inclusion of header files appropriately.
- Modified commit text for driver patch.

Link to v1:
https://lore.kernel.org/all/20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
  usb: typec: hd3ss3220: Enable VBUS based on ID pin state

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml |  9 +++
 drivers/usb/typec/hd3ss3220.c                 | 79 +++++++++++++++++++
 2 files changed, 88 insertions(+)

-- 
2.34.1


