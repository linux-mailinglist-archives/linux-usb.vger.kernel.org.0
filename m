Return-Path: <linux-usb+bounces-35936-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ME2GTuRz2lqxQYAu9opvQ
	(envelope-from <linux-usb+bounces-35936-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 12:06:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25398393233
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 12:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B18E93074AC5
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 10:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BDC382F3C;
	Fri,  3 Apr 2026 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDvDeoOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OLDN0xG+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C43845A7
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210697; cv=none; b=ghF7X/Q6azKWXMTE2NyhVDgYdS38r6+3bx3ihCjyHJac4qalzR7o8M6VsF+IV0Yg/3V5Grvi1kCOGxCVdF1X/zBIMjgUJ9+3puDh49MPRvpfm4GYcl1+qiV28wy6lYxZvRm2Wg7/QUCRV3qTMN0EGGSDusCls0we+CC3Z9E6Lh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210697; c=relaxed/simple;
	bh=YVJAFOfqRtInttj+SdxLLlYhxTozj6hqjuGCkDM0s6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=d/ROKgSWI3kaNIEZLX7aLSMwtoj9u1R90fphshRfcJuAI7+Z1NqBcDjErG3O56GuGdPeIa9SgXAPSLQLpLKc0AnaxY1prWTVxXZw/rYcWTo8Aic9n3dpsVLv24qxFlRX1sAZqV1RLoWQFEj3+Fwoe0xV5i6O2BSZtAXAw8JWmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDvDeoOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLDN0xG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336F869141943
	for <linux-usb@vger.kernel.org>; Fri, 3 Apr 2026 10:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=csPCeGNQRnN1owzDL3PkMg
	p9VvlLDIVr2HSlp09U0aE=; b=nDvDeoOJDWInCa9EoMTNwaVuW742xaDeC8Kw21
	6q0f7j/GI/VnB3+fGpzvujvfeQxeoB1iZpYddsJ7Sf6jFPz4OYaWwFefiMHX3HqM
	vcK9T2CHYon5985yxsXuOJ90FASt8VXO6pAUqXyLF59PbEwN23odMNdJTRonYmqn
	MIf3aXZyTUNFG0KIYOz2iUeGGjQKry+OpBYo1VrBQhqFNbTCsZaP5CeXlhRIaESX
	UQdvFG7wZtpY+iCz9I/RUVofU7j8WNx7Rgtlmsb2bdJNadY1NgNw3OxwEXWB9X+t
	RFl+NyAvTMEHQRAd9viwFiHKxBRF6FIVxFg+t2Swkc/IFUtg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0nux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 10:04:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c9364612fso2668140b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210686; x=1775815486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csPCeGNQRnN1owzDL3PkMgp9VvlLDIVr2HSlp09U0aE=;
        b=OLDN0xG+QRQbcoJ2xBTwv/NWZ7sGg1K8j+1le6h+DL3yJUkV/aRafRefeD/yFVodC9
         +xvWXoPrgLnSA5Q0sq21phJ21d7aZhMYei+z67hEjd8umWaaePt55mZvQ6i4Q+mxGnos
         EvbOww7Uzv94HUIWoGQc4L680R14ZMwN3aPgESrHggMZcliSCqdgWT4KjFaJxL3RHWu3
         3hM4u6sXHVSt7ldUTEBsDMupvQh3otBi4tLEtbxRCJd6lZ2ANHla+dvpDesVX6Kc4x0j
         Zl1UkgZ3GwSYrspd9s3KNDxTMhmj2SOOKAFhl8Q7wMbsH0qETQZVfB2SO8tPCXP/yZlQ
         ZWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210686; x=1775815486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csPCeGNQRnN1owzDL3PkMgp9VvlLDIVr2HSlp09U0aE=;
        b=KM5Cxywrhq79HAVQYoT+fbspx4rQZmzArfzOek24tYIE2UK++5jD6rpq/nwmICmSRv
         3rFsVURFvP2+ImiVVf4it3co2JGLqNRDeAaVA3VkT0R7QgmKQnRz+2raq4xUz3vrQQNP
         yo3Vsh/z53Loe1IDcVEqUME1OGVzkSz/i5ux/I0sPoN/U3rL6P4NH7AQxs+IeBgM0S7M
         QZuvudn0nKQAXEbPz3VddnlEO5saDmzFLObQJAaW4a/8Usw+C5uyafMelXz1pzVEFCY6
         ZOm3V46M2pqSZ9zMrNlnHkQRPITPJsAO27Okx0aoq+52IbjL7oBrviE017HJOX0lbqiy
         ABGw==
X-Gm-Message-State: AOJu0Yy3HmMmA6FEapFviGKPwaXMeD+5ZXMG9BDGYh9dBXreGa5DFSlP
	HKpytMR6SLFLqQ2lskvjrVcMfa8pXCjXpwQmFu0X0gofcV3YpPmgJozvHso8UVJ95+MnGuQScex
	SzFkeSGVhHcgdXRLJ+EyiTpVcC5MtzvMDXZZnFI1xZnU/TZa1WwfRQnB5r9kOlNc=
X-Gm-Gg: AeBDiet2jzLI0z0lcS0t5Et+GJZMvtTI8fIlF8RhmoiOrVvk/5LRepU4ZWojWZzEh3y
	Gh4ebbvKTQ6483g/yz/qnd5DSQftio/udav/Fs8Qp3/54BjHcP+dq1n6i7jYnFzhV0+VwnVtttp
	bDSqIuh9/IJM7DuLXbfXm3gnVFUjEdhTP+0ytxNYqxiBk4XGR4j9MTg19t/fGKdp7+ZOdWaFmrR
	f+T0YHMQ5h7HBQotOXtDZxR4ftaPdzB6Z/3tyMXaKqIyj3xvF4tmHZ8EK7K9dIOm+61QsTZQhGM
	xsVMGPj4sTXdV9QD7FgkdjZCQQHHDHHQ4uraqfQRj5R85AsNr6qBaQ/NomGgIuYTQ2VARHZS3MI
	0pGnJURcLi1pGVR7/mSZBQYrm4luh0t0qkNKt8FfHZ+L5vB+RbMTuNDY=
X-Received: by 2002:a05:6a00:1bc5:b0:82c:d8c4:365 with SMTP id d2e1a72fcca58-82d0da41c36mr2512500b3a.15.1775210686004;
        Fri, 03 Apr 2026 03:04:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bc5:b0:82c:d8c4:365 with SMTP id d2e1a72fcca58-82d0da41c36mr2512457b3a.15.1775210685512;
        Fri, 03 Apr 2026 03:04:45 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5012644b3a.23.2026.04.03.03.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:04:44 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexey Charkov <alchark@flipper.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Add Genesys logic GL3590 HUB support
Date: Fri,  3 Apr 2026 15:34:33 +0530
Message-Id: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf90be cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IE0w-zv9y5jEDUWxtIIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kjRzBJxfeqnhyXJj67PB9dmeHVeoORip
X-Proofpoint-GUID: kjRzBJxfeqnhyXJj67PB9dmeHVeoORip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OCBTYWx0ZWRfX1NU2fdoypxV2
 U1sB0py2urrLc+EllNM84af6YvmRTib1j3Z3SFpOdcaanitEvT6rDwzZcx1HsR8e72yfXqDkpA8
 n4DsnvSdLpxIaosFVt4R0OrYxBdGXUeN74WtcGwbWLmcxizA4eTaJQKgAIyiBlfpOxiyI6BSRjr
 BtDdRYUWbnVZ11xUJ9v7mLVCMHvCpnylhak2o4D1kYmSmwUWF5u2mFbIqtd1aC3+O6L1nKmxJAD
 yuFXIcSDfZ1qjtT4GZgSw/xiMBOYTPjVE6jyiGlFUyU5ZbXwuB00wb/E6s6GhXMPMzFOxkgdN8v
 mYW7vHTu31aeAwaTzg94gIoKQUeEVMubgbGGejSGJadd3BnQzhczF6yfAxUI++caJlCf+0e9Lfy
 Vd4cyOmiYcxSHTIxADXff2ErdDX4XEgZZW3zBTeBgX8nd9ibAsT680Rv0Il1QOoKivrnynXQyIS
 3NnLt3Z1rZB7zuia1tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030088
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-35936-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25398393233
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Genesys logic GL3590 HUB support.

Changes in v7:
Split Driver and DT patch for USB1 controller and USB1 HUB support
Minor nit in commit text of DT binding patch
Added false status for vdd12 supply wherevr applicable

Changes in v6:
- Removed vdd12-supply property status for all hubs.
- Added connections between genesys hub, HD3 port controller and type-C
  connector as follows.

GL3590 USB     HD3SS3220 Type‑C  USB TYPE‑C
   HUB         Port Controller   Connector


HS HUB                           HS con

 |------------------------------------|

SS HUB          HD3-out          SBU con

 |--------------------|

                HD3-in           SS con
                |---------------------|

Changes in v5:
Updated comment description in DT.
Updated vdd-supply status for other hubs in bindings.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v6:
https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com/

Link to v5:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Link to v4:
https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/


Swati Agarwal (2):
  dt-bindings: usb: Add Genesys Logic GL3590 hub
  usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support

 .../bindings/usb/genesys,gl850g.yaml           | 18 ++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.c             |  1 +
 drivers/usb/misc/onboard_usb_dev.h             |  8 ++++++++
 3 files changed, 27 insertions(+)

-- 
2.34.1


