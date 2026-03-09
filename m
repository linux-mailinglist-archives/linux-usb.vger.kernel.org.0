Return-Path: <linux-usb+bounces-34362-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MOwB2Evr2mWPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34362-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:36:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E3240EA5
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2BF13121DA8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197E136BCC6;
	Mon,  9 Mar 2026 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvlMvyGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDNRueHp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B341B369
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088430; cv=none; b=O57hXXXE7p2krbw4rS1CwYrkP8ZB3Sxrp9yXiHYQvE1om6IrEVsajwyC5ZmvQnpbc8FjB2pga41nX6y147jq1ixY/VGklglR7iHIZ5NXoRO56eVhlVgeU26L9KfQT1wnqSg8ixOAbjxa+yIBePTM/wttyJiJJrp8NdEeRMTmogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088430; c=relaxed/simple;
	bh=iR9FBVRNdBPKUJuF0gdJRHocxr70Pd+iL3Ur6tNvyx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I1sw3lXNJdPSssDJTZxvYXIJtzga5BuKQ/8E3CP9Y0/Bn33dr2VfNjEunGRk+wHf4I+IJbmHGqKg6cTOaSF88z0H8AekzGnuWgVzbMc88078GqpMUO8CXDsnMWIrmtrq4Yam81gSXAY9ylVV6r5ks18sopZGuYitsQ34Fcl5+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvlMvyGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDNRueHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCQMG2428971
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6aSf9RIHhE0
	ux1aAmM2DjF7m6jzh28AeMG4simH1BJ0=; b=kvlMvyGVnIOq2Nbqz48K1o+SloW
	5bN4LqbAhvHIayeWjrUzduAq7bl+Pz5sa2QX4PbefpArctiPI+nArD1jpgjD75QG
	6u27c8hEWsTJPgaI3+UEgUDQIwlBYSkZX8WgO9UDJCnglXOTEqoRPxzFGVUOdefm
	LC4tMrKgr+JLaXzPFhC1v8UJKXyr8QeeRiqwi5McBfGj1wA11wKvgGFrSqVgAH4j
	qyHohRHVGxAFSg4SVrpIfaaQ5SdLSmz/wcDpTmwQz3aidZ8GHxvP6i7tAokKDeOB
	lzldC75OhdApJeF357E4ZE1UhlUevWeBGUL77SJ7tY7JM1LYKKN3aasTokQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekrwjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:48 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4d4db1523so54438510a34.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088427; x=1773693227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aSf9RIHhE0ux1aAmM2DjF7m6jzh28AeMG4simH1BJ0=;
        b=iDNRueHp49/krD9OgsUK5Pd6sDh0swG+xfpl2agIbFA5m2H70QKaOqEolX3c00uwe8
         hhFbykPG4OUJ6RF6DQGmFOO8+iAWyh0/XPEyKsg/xXsoWyFSZj2pKMHmcCulD4kOqQNy
         B6zFsVMn0LAj/yOfiivtooKwlQutskUwXXQaITJKSvpHnWE9pxRjhySjS5N786CcmRiD
         Jl0cl917pZtkzDyE3BtGiS49o83IBnwbngwZ7FHjPxfkXQrAH5vgMER8V7gbiILUrWvD
         v0wupt3r2XeZfBvfQQhn0QNkSWICKP0bY1n96ro+yIdxk+lIHkXxnjBMr3kCLSFF8ILK
         gPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088427; x=1773693227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6aSf9RIHhE0ux1aAmM2DjF7m6jzh28AeMG4simH1BJ0=;
        b=tXIGOvKfDYEq7931MIh3eyGerYccQO2K0mN36IbbpMnQXpl0ZrqKpDfbyaHMytFCyt
         B62ResJRfC6CjXKE2GUW8t84aAgfM8hydJHzDZH2C7+5JupQrO1y6W2L3FAbnG0tqhOd
         15tgcx4/F3EOumS9pDkQDhUQKFCh4dqz5UwHqXUWWqnWoWj36rJqUUvhC/54lzSCihy0
         LGSiRkJwWrloEJXW4yYidyNem7CoFnBjRQ284pfYTbtXOs9xKHbx90a1gJUljWcggbL/
         /k0qqsYZQTqixOfEn9yuqG1ct9YY/B4CQGMn2kZquYuOag/w2Cdz9WIeEu3QVEQgxZN3
         nzJA==
X-Forwarded-Encrypted: i=1; AJvYcCUMJGV/o51B0v4nvJBO5zXRIEvTsGxPDnvAOSV8xBybCCHiMDg3LRDXXybPe+rab0GAKIm8rgRpDKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8EMeMpUSLq+8PEPiDn3W0LbMyOUgJanfloJEHXzrJsNySRzyX
	iRCfaLySisLFx8U8B6ktUl4n1BQbTOF5gjXu7Ol3MOtfO/NqtcxbF/jK/CO4JlLI14QzYMD5Au5
	VFn1ckcfyM2v6FwpGoV2du66AF0YOTZxab4QSr07+oDHq2c3h8euPLmhPLOCH590=
X-Gm-Gg: ATEYQzzwMk1W6ykOJaWlAXh4F8QB4vZ5X+9j4ErdRoYaZabDRNK2ORWqbcCN00LJ0Qy
	gCgIM/B13qDGXS1hZlESaF7FqoBssAJgb0UMoFnRbDiegzWTacRDz2keSxWr36dDfagsh73dFl7
	5hWv7gR4+mVSNKYcekjHvVLSu4Xc9/PQrena3OH9EXjzc5AEPf5YKHX/WldrAo4QH66Gtqz0UAz
	WMzexfxnBBhU18jLHkPLVFByzO/TdcWobHUFzCxWWh6/H/phpHvsqJjCWgCge2MygKpBaN2OZI8
	0eHESXoJqfqa3CmjBSIGSt8gbt8mYGaYXEzE1G80nJrEsY8ejLCDW+2//poe0lnse6hhT4hi7TR
	JlEKTFMK/f5cLF6ZPa0Ta50mxAJHI2SllgH0F+MhqYX8yOUzP4c6/tzR+0yiq5pR5M22ApsYyhn
	w=
X-Received: by 2002:a05:6830:411d:b0:7d7:4639:440d with SMTP id 46e09a7af769-7d7463947damr3864438a34.6.1773088427341;
        Mon, 09 Mar 2026 13:33:47 -0700 (PDT)
X-Received: by 2002:a05:6830:411d:b0:7d7:4639:440d with SMTP id 46e09a7af769-7d7463947damr3864414a34.6.1773088426862;
        Mon, 09 Mar 2026 13:33:46 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:46 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 06/10] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon,  9 Mar 2026 13:33:33 -0700
Message-Id: <20260309203337.803986-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PAbCJQXQU4VsdhSN3v6O1vWB9uPiQj2e
X-Proofpoint-ORIG-GUID: PAbCJQXQU4VsdhSN3v6O1vWB9uPiQj2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX+47PUVAKdjH3
 gMTbGtomwi5A6mXYF7FBfu/7BD2YKTxZOlu1w4xQf7R6BtD2lYTEEGHrsAC3Re2VuV6NOE/lBSm
 Y+r2bQrFow+6KErBo7ebKYo+TwcN5fMHf/B1fcUxnXBdOFQ5n8yzF8a4oDL09w88tEM22V/DOex
 JiP8mECEPT0430GfVwLvBsgyk8pCoqZZMmxjyxYfgTr4fMQkPtBXtWoZPPXmtAGsmU+2Ey9UcEl
 EZwCnUpBnj9DYx2GySRGwYvSzIPO0KLrpqE0Rdlrq6WDf4Vyw2JiZ+/y38HuBLXVMl4q/evNFt+
 l08HQVXqC24uACtMEOi5yyn7myVZket+tjscuQvelZRqQlST9veMbPh4M7w2x9Lzwt555ndnWZB
 HePkDfek0iJtbVz1hD3f5hNdBPjhEWDAhZueWGRI/ibPNlxsYxZuyUreDe3SYL4JZT6LSwCvJ5C
 zf4nw5OGxy/zctSrDSw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af2eac cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oDIJ3hVRoRHbvujwG_AA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 890E3240EA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34362-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 4fd08962d4fb..3a71a0d27b5e 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -280,10 +280,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_chip *chip = data;
 	int ret;
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1


