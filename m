Return-Path: <linux-usb+bounces-33881-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMMiCPfEpWnEFgAAu9opvQ
	(envelope-from <linux-usb+bounces-33881-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:12:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B71DD9B9
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E3A0303B1A9
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 17:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7398442E00A;
	Mon,  2 Mar 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeGIcb0i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INj6/Vns"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3D42E00D
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471427; cv=none; b=MWPyYxpEDc+sQNHexeQRG7fs/VO/5utDWALzYLPZhm52BCKrdbJ+UcwE/AgHw3ihjPyWusHriGsN5PxjZx1weLkkCMAofkhm4zIgZpHFJUeGEdYSivMTFuHGOq4wBrnwmUO0fCoVO257RpARUA/VoJlTG9cIIhWVr2ZYiB6eKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471427; c=relaxed/simple;
	bh=ZmRqLAPTrxMNim8UEkFjpOyAZPKSkphacwOdZsGgHFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6mVQ/OW1YaxnbtV16Ls8su1HGZy+lHEuWvVF3Addg2FvBcOyuqC/20MYO8/cyWCujsOoTzgRcI0SwEy6Zvs7msL1sfd91BlO3uTAncERO53Etttt/Uhk2FTsEf/hJb1v798MBSWPFNheSAajKR3LoeaOALM8qogsYIDe1xK1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeGIcb0i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INj6/Vns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622C4w1n2504593
	for <linux-usb@vger.kernel.org>; Mon, 2 Mar 2026 17:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Fj6WfY4AFutTrGsD6jCgwzvH8KDrNTlW3f4S562yCE=; b=CeGIcb0iZQbB0xZi
	8SXFlVXDx+2nYp1tfKwzmj49QtjctXQ76q+7+Q8IwlcTQLSKwX1eWkTKpP5ssHsD
	RZe3Qcf8DC7BW4tXI+fQchexx/A+qEB8gXOJR761NlyMlAC4vOdA+GdhJqY+yFQY
	RFj+X/gtw+bv6nZs49X6c+s94aEoGWW+qtv1iBDDzVZA+XAf84l914OVHEmxdeHd
	WBkV2rZl2VmVp3lSv9XAImXjpA0jySKs5SIxj0OCpMz44a/ql8Iyl4b2XOYdkx6L
	Bt84j/+J8KC7n5qzMN6M9lxxr+xjWQTTXA8+80Pi726l/v1e4o3KUVEb2FwR/3iR
	wOOZcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5het7d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 17:10:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso103471385a.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 09:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772471424; x=1773076224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Fj6WfY4AFutTrGsD6jCgwzvH8KDrNTlW3f4S562yCE=;
        b=INj6/Vnse1tbqiExpUQxzZd4CaX+vpeYA8PLHx52otJjoHUDuUyX9dW6f9vYz+Oxqy
         lvAFJZ+y9Yh8KvPIPeDtSvyGUYDyqRPmg/6xLs3F2Gksv2bdY9Yddrk22Cld6+CLmw89
         08DAXZzTuYOkPXOmN+a2ATh1wsWiIhT2sQY3EYjvc3/3T38cjWAdCKEmNneVq5bQK1by
         FImUqO1ADUlRV4kULfl1jichOO/mDy3b48jefWy+St6hFvx/E5s1en6AnExbj50QcbrT
         XOPFsicEWsBIw5dKuJ2D5cdPWnuNh7iQN0bFaLSjz0rfUOjtXzb4gnoiGAydMH0UJoQU
         5q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471424; x=1773076224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Fj6WfY4AFutTrGsD6jCgwzvH8KDrNTlW3f4S562yCE=;
        b=AntYFIggI0k5U0S7HofLJu+VfnskKy7c7TYTVcSYgeH2W/sze2akYrtOuCYyNHjsgE
         jnl5tT442htIwfNJPbpda4KZpQX/yWhqfBTa7GBTh93qmX9WPqe6CiSRQens4RT3TV/p
         uAG52fOI+Qf4HW95p6E965ff8I72U6iqNL44P1FnS0QJCTScYilDP+sBm+Tw1EuKfdg6
         4+umO4ii1c6+VC76yLZDrpk60g1Ir0o8EJmZ8m+L7erXg+HMwJRAHhL4RAGV75bAmdtb
         ck1lu4hVYgU0vrHbxPR5Mk+ohYfVYSRK2/m0FQ60KA268zDPiKU/ai2+Vh4gSNXsvxOA
         smhw==
X-Forwarded-Encrypted: i=1; AJvYcCXW7AfUYsI5xHYETbE223MlEGdEVNEPw1N5g+szppkry3QbFlDpa5ySaZXJmFJfulAWRFfJrpUrWYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZBTgiaQjZ+IgBd7kmnPRFv4QasNn5RLeGpMOpo1eWp/9tAX+
	+jGz6HSEFjM2s5VZa3ZTPi1wcKs0JX9dFCE18lH/se9yoTz8qyxt/cX0bSG5WMbDGVwC9+6BjIZ
	dIkKOp/H6EbHnFJJg4ApDOhY2WVJCq5mOnmbTLadBK5KP5I0pQb63U4mEUeLMg60=
X-Gm-Gg: ATEYQzxaIVtjRE+6Iu+gcb5HLA5qnGd9qMWACJd5HnQVEa+hhicPmQB/AzOvESf3Zbc
	kDkRhsAW7Q7oQQ5DgmMMce1Lqi0BO/lEVa6fuiJbJvddL9aaqOLdntnHUPzOMiZu9GUhk2B4Uw4
	SBGkPOO4ZLYc3INsDX3MVPl8AC2iTVac0owdYtbxArtkPqG4c2uaMQrV+eBJ6UQykHEvX6Uxksv
	vusJ2TgWQfiqTyB0we1fzcsPxpnZLA7K3JhPOzuOFGM4m9tHjAWtMdVtWX3Rn9g2GlNJu/sC4Di
	fG7s1axK6eNyD/uz75GHb84MU4t62oyktptLs7uB4wEsNTFHV9K7q5sP+gJgA8LecM9w7ZGaLWC
	KSZLoIj2a+CtoufJgeedfVLP6dS9ZeA==
X-Received: by 2002:a05:620a:4727:b0:8c9:e976:d20 with SMTP id af79cd13be357-8cbc8e03a49mr1673102585a.46.1772471423386;
        Mon, 02 Mar 2026 09:10:23 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8c9:e976:d20 with SMTP id af79cd13be357-8cbc8e03a49mr1673093885a.46.1772471422598;
        Mon, 02 Mar 2026 09:10:22 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4175fd2sm12824083f8f.14.2026.03.02.09.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:10:21 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 19:09:54 +0200
Subject: [PATCH RFT v3 3/3] arm64: dts: qcom: glymur-crd: Enable USB
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-dts-qcom-glymur-add-usb-support-v3-3-883eb2691a0d@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6648;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TcvRpSgdxm/WfS6Y+xwJZ1hf5MzqTpYy9kdCACDjKzw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppcRzFhi7PlPbDzN7YEoLR+I32AODdbUW2Y3io
 DlBcloAjiaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaXEcwAKCRAbX0TJAJUV
 VmXAEACYncEARREnloMSy08W3+G8jMDtr9mXAAYjN9o0UDNmqhKnaBZgv9C0unrCtMjpQEHmpR6
 qTg0a0mRAHynbTVAieUEOJOZGzNMLJFuAUxe3twQ3G65zEr/AWXuZdV4M3WTr4NW02TEdg53A+b
 TwCCIAbuCfNtG/WLsp2BSSNxlbgT8arIYZi9YKk5m1RyJS0STHXL8Z821h8/jPHG7lsipOdrTAa
 w+ZQb1NwHsOTd2sqxHqvURR5Kd48j1vjGzXbhpXGXE9jPYPl6AHy4YoDmW8qqRtnbgG5emyrMvl
 K0L+jtyYiGK6XbDPW9+Uh0+4gdpjhOmYDKZfEWCtlI/4a01oFBhhWq9cc8JOejIvpltp5CVU+1C
 fplRGNL4C3rXqFYC0vH+kjx2WMf8ZK+lc4veGEW3L7zbl4uztHm6ifvoXXtPiBBCezIbhFrDlFx
 MArY+sjKOZJtKZNvc+3x5+zAZ2k7D4wBlR7k9FEcgsfAAgE3mLwoSwtaSwH3FKEF2HV777QWuDS
 KfFSyN6moo9z0Fh/1u+BJ5dglTiZQv9gVODB4jaWOpfgj+A6Deq17xArrn67i0dLgqBAGKm/YkQ
 xf6IGun1U6P7eiNZhRafa0H2cZT1442DDzdNQJ9zUchJR80zKoe6qJ601zJuZG9qJ5h8O4lltsn
 UNcC0gKKAGBZIhg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5c480 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IZckZgOlll8TeJU42_cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LxSp8rAT624XqNtIUwmeORDJ3ocTmV8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE0MCBTYWx0ZWRfX5s6XYRqp+lBd
 aZyQGaRSzuLAklBL/4LsBpEWTUZTv4iUyOBnWaQXKtCosoz0tkLmBe+UxapbVLf8OmWtC+2+H0D
 8iP22/leN7lg/cXyW6rvlAwLJ+WYC+LeRAeP8+AAL1DxcN5h7q3956lD5f+uGHdVT+Q9UYHWSBn
 nJCt8wXa7OkX5CvPKvXnEkN6QCkA3GcIxRaIyXYjbqiDyImHWLQHcBuqJMOJdT6cN4GZyjraL/8
 yDXz+PVv7FQTSzdaXI5kSnD4LwgqKRF5FQoFiAuFumacoeIIOdZrxFOu8oRafj8/20wDSP7A6FX
 p6olHhGmOocPeiUJ74P/VK0Q2kilqplKPEZlTltlFaAb/+IyxXPEGLe0YIKzUT2fcxaA+q04Ket
 0CkcBFWKt8ZCDbJ1s/gcS1XVyDZd066cz7YFTMiigrIAi7urLoP98uLaHVec0mLD69kZwQk/53I
 2AZ2LEn/L+xC1PFowTA==
X-Proofpoint-ORIG-GUID: LxSp8rAT624XqNtIUwmeORDJ3ocTmV8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_04,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020140
X-Rspamd-Queue-Id: B27B71DD9B9
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
	TAGGED_FROM(0.00)[bounces-33881-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.2:email,0.0.0.47:email,0.0.0.0:email,0.0.0.1:email,0.0.0.43:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
one USB Type-A, and a fingerprint reader connected over USB. Each of these
3 Type-C ports are connected to one of the USB combo PHYs and one of the
M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
dedicated NXP PTN3222.

So enable all needed controllers, PHYs and repeaters, while describing
their supplies. Also describe the PMIC glink graph for Type-C connectors.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 271 ++++++++++++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..795ab0df3b40 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -60,6 +60,96 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -367,6 +457,36 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_2: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -485,6 +605,21 @@ &pon_resin {
 	status = "okay";
 };
 
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_l_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -596,3 +731,139 @@ wwan_reg_en: wwan-reg-en-state {
 		bias-disable;
 	};
 };
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l4c_e1_0p72>;
+	vdda12-supply = <&vreg_l4f_e1_1p08>;
+
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	vdda-phy-supply = <&vreg_l4f_e1_1p08>;
+	vdda-pll-supply = <&vreg_l4c_e1_0p72>;
+	refgen-supply = <&vreg_l1c_e1_0p82>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
+&usb_hs {
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_2>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

-- 
2.48.1


