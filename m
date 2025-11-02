Return-Path: <linux-usb+bounces-29980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F71C292C8
	for <lists+linux-usb@lfdr.de>; Sun, 02 Nov 2025 17:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB7D5188A262
	for <lists+linux-usb@lfdr.de>; Sun,  2 Nov 2025 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42052C0F66;
	Sun,  2 Nov 2025 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxTRJY2v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqX+nSxl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1651DF965
	for <linux-usb@vger.kernel.org>; Sun,  2 Nov 2025 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762102111; cv=none; b=ZfBt4kzE0xao1ikl3zdyc5y0u9Tr+3NfAkK2GE27n9kgMs4KePK+J8cRh6lpE7+d1hAI7u2sx4EtG1GwS0RspD3muObNd4YbUJy8TAxMv57Pos8tMzahOwWT+Z16Hq8ktOkBvrqsTOvy/lQMgpPntkzJsnIyPdvsYVUW4EK6K0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762102111; c=relaxed/simple;
	bh=PDRCwWAw4zLhj5fO+O4LU/ku0bQSkjJNl9hIm4G6H8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vocj5pPzBOlM7S8TBlQttbEkIUb7V9XbE1uSMSiN0OhvW2dRb4vBuqiRBxl9BYdUHGJhsMJiiXf2Tm8JsnER9UPRGTZrvSuyMs/vC6VZRlsUEoTdkYSbQNcsdyf6OnxoDw7YWfH6WVUEJNfrB9mRA1BKe7VsN5HCjaQH+6+2HXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxTRJY2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqX+nSxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2GfbRn701769
	for <linux-usb@vger.kernel.org>; Sun, 2 Nov 2025 16:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=udj7T7Cj28h7tfx0aOeVMexss2vLL9UMfeK
	creEJKNs=; b=WxTRJY2vAVWpri/3LkFTtXycnaq5abUUWyNu4ipt04YzZh/jouW
	EyUzhLL4X5O+dYQR3vzIIPb082fWVOBNaNu49WyIWlZXsgzYX1ojGN7/7h0KdI5d
	x4mCS+9u64pCbhVUDbh5OYrHu9RU2qP7OWUYlwf+ThmV2UpAOSSBRLudcP/MBvxJ
	IqgusGS5HoGSpnmTHRPXNZxdry4dpvM1TvpvZwVpucqc3oio9LcpCeVMYgK5Ue+U
	ExsvwLJTGuqG3HWBXmWj+U8qF6nzrDYrJDfpuh6lYXq3pjAg7dhVcq8GF0N8im8Z
	NZw/c5uzbKHHhNqgyY/HdAKyQrZ+Tox1IUQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5pj3hcx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 16:48:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471737e673so6301456a12.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762102107; x=1762706907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udj7T7Cj28h7tfx0aOeVMexss2vLL9UMfeKcreEJKNs=;
        b=IqX+nSxlyUFHw+elZGISoIhS9Nz4/hIGyA6RR89ZIV56IalMdrflS9IY6ppVlU1y8k
         4eerEZ5eiopdyX4e6PhhL6mh4UJJxwEUO6YmjczzvDzeb/Z31qhbGbiobOa9SvX9TGSr
         fhvZBb89n8MMQ4x8gHnukByCFwHO76Zr2eu0AzIPkN9b5jKx792SrN+mR0atihLC9ZaF
         qaFSjqeH6qP6CFTzkE76mCml/PD7lx0v+Mk/qfisdTPIrplVzfbd38oChg3HQoKTVg9L
         KqYETvPUF89hsqCAxw6LknGAHGFmU0Io53ptiwGoQn6trEM6wisQAAebXm2dwCgkschB
         MWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762102107; x=1762706907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udj7T7Cj28h7tfx0aOeVMexss2vLL9UMfeKcreEJKNs=;
        b=DnLMU5FKuLOwqduLHbbJ4ctOPKnY59gCbBAJpBx6ByMwOSq5XiPgHeh0XVd8IqcNHk
         dGxpAisUU6R0jPMoZtoMXmUDHmDrffc0j9XE6KJSZwfq/V2FMv6//EEOS0Hv5BDw1f8J
         wNPtzMwYOsTgT78T11HEpb7O4gW+qKdYndvi+fEi4pYxmwEgWWQX6SRt5Gkgf4dYlDLm
         PgBMjhQ34quZK0ph9ImiAqKYv/YE5AuijWv8OTz7SvpL3lToICFFlpCpUze88mYQnxh3
         NiPwY9hJ5uknesR/CKDTggtDRLnq99E+ZfjeaslUquZTpMg6Ed6AJ2+086mdoO8Y0uKv
         MEOw==
X-Gm-Message-State: AOJu0Yzq13wUnUQlQtF0mZOmTmFesbJuREBLYpnmwQLI28TBo/wOJHqI
	0Mu+9sJ7Mzc3GMVqUnqv8C6Q7gfQMIjPGUAAq5kn+uWI4mHjY55rguYFtlcr0P7/nHg0eWtV53W
	ga+z9BbZ/TKLIfeeQc3IjcFkHJoKPASJUyWjR9/2o7+q4aiF/mm6r+ylSBRgvpQU=
X-Gm-Gg: ASbGncvnjayoE8iWBfJuoddbND3G8EhhxCEiDy+7IQ9VSeWWIhfnT1XF9yMa1jen1F7
	w28ke1cUKs6SqOhZ2jdhS1WPdvONBQDuX4YUXpoeIMyGIbajxoJWB2kCuN13rqfZve/NbdbInf1
	IpJs2pE2NeSJSW1JcskniElw3x0BOYH2CMMYP4R95tkVQNn25mXgc1cEGNZ7bVN8BtPG5HeWyUs
	Cyh0AYn3Wr1fy0lTY51YhQE2k8sKVtg1MJGmqU6rX/kEGYGtUNAnRxZcbagJ05NxGOD62c8V3SM
	5ekvmVvCSIlwSSKRLDVxnxO+5xnmVhnF540G/FZziAGRfHDpC0Xz/qI67BQZtJTxGJvMtn4rGck
	co4M8JWubPIin+ciGKQIsfFXhXnwzUI3rSIIP
X-Received: by 2002:a05:6a20:258c:b0:33f:df99:11eb with SMTP id adf61e73a8af0-348ca15afa2mr13556428637.7.1762102107520;
        Sun, 02 Nov 2025 08:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH87wFetbaiAuC/psagPJvcH2NpFNha2arQJdLWwyoEanSrv8miEf7whLnmWsiRx09Jo3vJDA==
X-Received: by 2002:a05:6a20:258c:b0:33f:df99:11eb with SMTP id adf61e73a8af0-348ca15afa2mr13556402637.7.1762102107038;
        Sun, 02 Nov 2025 08:48:27 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bda55f74sm7708125a12.19.2025.11.02.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:48:26 -0800 (PST)
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
Subject: [PATCH v6 0/2] Implement vbus support for HD3SS3220 port controller
Date: Sun,  2 Nov 2025 22:18:17 +0530
Message-Id: <20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItsTsb/g c=1 sm=1 tr=0 ts=69078b5c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gs8g10pPhjI8XjwtQ3cA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 4ppyfVopjYuaSf-Lv1gnPwjplzQ9P_lJ
X-Proofpoint-ORIG-GUID: 4ppyfVopjYuaSf-Lv1gnPwjplzQ9P_lJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NiBTYWx0ZWRfX7GOpemmzfeiy
 vp0qvvmHuMGqSC4EmgEaUkD9rM4f4gDVMy/MEuciyV4/5A3mRLu20a3YiuYlPtRsX4TOzbJuG5R
 chE164oShKjgeqWK87Fo24K9L5UFI6bg4UOPYNrVGXpoDwhzfn14rONjvUm9J2UmYVCfqKuLRes
 bTA2BjZeUKo8+tsvFJPl315myuD9L88SVmClLycjPtWkUI51mtp2+5ynenzI4OgJCqNlM35HKvk
 1laFKXnfjgQcZ85aioyazO0fTu3aFz+4GK6I2RzYXXIBPVYpfwRq0kKUsY/5Y+YBZyu0WUb9hw6
 +mjpJnIevtKtd3UzBCqoZ4xvVh3y59rrzYLGbR2aIOryZvMrnmtUsFAot2ppfHWbJeczm7qNt7D
 u1oLFgfEET/ZoPRdzLowsa2qn1USHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020156

As per the data sheet of HD3SS3220:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

This series implements support to read ID pin state and accordingly enable
VBUS.

---
Changes in v6:
- Modified logic to get vbus from connector as per comments received on v5.

Link to v5:
https://lore.kernel.org/all/20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com/

Changes in v5:
- Modified error handling in driver as per comments received on v4.

Link to v4:
https://lore.kernel.org/all/20251025122854.1163275-1-krishna.kurapati@oss.qualcomm.com/

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

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml |  8 +++
 drivers/usb/typec/hd3ss3220.c                 | 72 +++++++++++++++++++
 2 files changed, 80 insertions(+)

-- 
2.34.1


