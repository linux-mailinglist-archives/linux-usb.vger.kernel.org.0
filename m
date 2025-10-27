Return-Path: <linux-usb+bounces-29681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA6C0C200
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 08:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADCC618A1CB7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 07:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538742DE704;
	Mon, 27 Oct 2025 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjMsrNjH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744C2D595F
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761550073; cv=none; b=Kg+g97wm4PJzkPs4dzPzIhfr3/Vk1BnxYV7S70+gmzZ4l4KiWXd2CddTZcZVOQFfP21B4Z9oRhfimxnoQGhgcTcSJgxPX3xmaEOxle5NNOo5coeMeIHHOcxvlwX7U6UB+aEED4lTK59h7+2k4dNjNeD1Dus4LMzopfxReXPVFpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761550073; c=relaxed/simple;
	bh=zrV2MeFOwCCn1TbSlYoH2QLD7xFQ4yvvx2GUblq4lBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EShEtL7svymw4UI5pUuLo+mJHeeN4bJJPIKf+EN0xk6XE6f6nveXUQ/wiEA8Sc9c3hEzV+9UtTf0t7fNn11NCAnCNgDbqXqrsnNioyZm740xqQLA7+iQBvVQxvObuhmZO4CbwZUFufoRLGCQvBbI59+b8FhtTBT2iW0c+6nOW5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjMsrNjH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QNwYLA1132695
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 07:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mFF9ZA9r3BfOY5XzYGAX3yfLJELJvXztU48
	FwzldOw0=; b=XjMsrNjHMh3KaEYoRYYt5ky4Cen4BKMIn1xPoORT4Nl6Y59IexS
	knvFzFhz6zKj05j8NWMTPZYifqdRyMDZh3Jd/wfAZmCWt5nVY+COuPrz+hoxMLJj
	PyRQcbJEIJ9dYi5k7odW3aLtjM6qPTAu21AIEV4qv9P1o02gVd7Lw78CL5BuQB02
	TWmhFYxhWsxd8H5vuOJWi+uw+f8rZ/nfFs4mbMHWwV7e7Fm1GJZXBKvSQRy0ggq4
	ngfGaeJSEeY0JyaqQu85gKb71IsQq2eYGR5XvPHgCxJh15oBsHgm4VGOQCm6vGsK
	eTHSxAvj1x5XuXalHfaiQ4+hJukxjAD1Wdg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g3p5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 07:27:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6cdfcb112bso8804281a12.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 00:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761550070; x=1762154870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFF9ZA9r3BfOY5XzYGAX3yfLJELJvXztU48FwzldOw0=;
        b=nOUUjKZUvFIjT63eppkVnvr8d8mRIoxJ3Mj9pEZgpcyHZAwiJvJ+1a1FVsr9Te4upf
         PZzTVYJlLkYn0V0EfADEtlCnw6zR0ZRLktWNSY0FssmpzeMKOfycuQ95wUmq7RzVpRPb
         tlZgwcMGZZCd4+jfHcTbM35MSXrfFb7wdyOHYpiGySlwCbSBe/HgddZYsC/5J/EY1PRI
         eCB0X9cpXJwOPjM0DVEgdhb5X8xlqXo5XEl7B6b2jFBd2pFSdxgIoZOEIb8TRqNsykwo
         XZjXghc6AC6v2labaGqwU32UDiA82VVAnloWfrreE9Bvi3LSha/kmHTQEQCs5bXRiY8k
         CGhA==
X-Gm-Message-State: AOJu0YxlnbSXGUU0uaBkZAPBcp4Ki7T+NEeTsQYJjgcKWF5Q/rUQIcq3
	JRGSxegvsajic9YQWYpZBXNOmkujER2hvO/KHLFSr8//tmVle3O94Jov0hL7yqhI5InyIHxYlY3
	TNY4J0OiRvaR59jls6Lh0rpknNEKCOqrbDn1kyiHjjUCzocN0ZtPkfO3ZT87lumxNtRah9Tg=
X-Gm-Gg: ASbGncsQlcvUsyxTAdQLWvDpMey5+ROO4A+3gf0i8nxWSU2AMIO3J10muqhUTJGnhP/
	ViNMWAdmr3CQvk/+iow/Y7Aa6o9HUYY+e1EHfaS9Q12o74KioWUYtu325g9PwgaQFe7U8ZSWAi1
	EiBj7K0ReWXrvfsfA6VzP2FlrqTEkoPCo4MDck/TDRqvARXOxvc6wzDMMS6lzEw5Y1h7QqKXQWj
	5K/Pyp8s67k/YeBTCX5zjmhW7eGsvysw2JemMOqMRjFqLASQP3rFEnw+jCiA3K6M3aectiiu2QN
	DSy9IPx2R2a3Vr8f/H0Y+woViJNm2GmJ2eOMRkanyxaLnF6h4q4NJOBzDCpmEzdYCYm9Jtjz9r3
	WTACYc3z41YkCXIhzKyrT/ykCezqC5RNlhVcg
X-Received: by 2002:a17:902:e88e:b0:28d:18d3:46ca with SMTP id d9443c01a7336-290cb65ca07mr458225635ad.49.1761550069766;
        Mon, 27 Oct 2025 00:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpi1TzpQv0X/HWE/wfdrTRqzkkZn2x5d1Nmm2t/H/IAoV6csMvqY2brY5Yod2E4b9v1YvtUA==
X-Received: by 2002:a17:902:e88e:b0:28d:18d3:46ca with SMTP id d9443c01a7336-290cb65ca07mr458225315ad.49.1761550069290;
        Mon, 27 Oct 2025 00:27:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e45a4csm70710965ad.108.2025.10.27.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:27:48 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Implement vbus support for HD3SS3220 port controller
Date: Mon, 27 Oct 2025 12:57:39 +0530
Message-Id: <20251027072741.1050177-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -s1jAjlJQ7b7VGeWJZs3GjRJvphZRjOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA2OCBTYWx0ZWRfX9jsy0P0vPu0v
 23qa/KLR1C9oxRNXHC4Vw+okzQZL7zEVTO5MQVnJQa984mpfbv1tV9jnniqsTxF886+aEHCU3jq
 DYVpMp9+j5qvpWPcbe28Rv+FUgDZcs2OjIc9oN3SrV3oYQa+FngY70Jxuyib80S1XP8hLkbBRqD
 j3gqrC6DnGRhX9D4GbA4rW06XzxqB6vPABHlpTUpM5UvGOSDSF/N5PRRsddt037H4g0/Ns3ha8W
 kCHHd26WQxvCo4hNmjMwQcCU6vfEslba77urqyH5bfclkwNB7+aq67D0uDxmPZeWzVj3t2Gb5Ko
 KIF8+9eQrNYexHg7s2AWqEiKST//6zSrTOV/wxQhvrb7BkzyLrmZ3PAjrZo8/YCyrgpesDiifPa
 ljfC7WgfXV3oiXdgTVEv19BZCdA+ZA==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff1ef6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gs8g10pPhjI8XjwtQ3cA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: -s1jAjlJQ7b7VGeWJZs3GjRJvphZRjOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270068

As per the data sheet of HD3SS3220:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
low. This is done to enforce Type-C requirement that VBUS must be at
VSafe0V before re-enabling VBUS"

This series implements support to read ID pin state and accordingly enable
VBUS.

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

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml |  8 ++
 drivers/usb/typec/hd3ss3220.c                 | 74 +++++++++++++++++++
 2 files changed, 82 insertions(+)

-- 
2.34.1


