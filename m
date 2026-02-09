Return-Path: <linux-usb+bounces-33221-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH/fBIxIimm+JAAAu9opvQ
	(envelope-from <linux-usb+bounces-33221-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 21:50:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12211493F
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 21:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73A5B3010B7A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 20:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D09C41B34B;
	Mon,  9 Feb 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7ry58RM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVgjzRAM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66485426D1C
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670167; cv=none; b=RYpRKA9fQ9hBa7/IoyxcVIF4fB7dimoTKKPNcP/K8FkrpNkXQDQ0KbCg9X4hg+O8ZNLcqcRGACbYOGYrt4g+Om6Wg/707a+Jazf/z+WKXzOTe6xbmCulDEkVj3TBXUFCs+nradyQ5mlCU06vIdnuQ+jwxzWPLdDLBQA1VG/AkVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670167; c=relaxed/simple;
	bh=wbDLIC/kNGZ3h8BMBe70rlk5uwo566aWa8ZTAO9AkA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U5cBfxK1CYtN2LtlZGFvwirhH36KPvKUIvKELumE4kBxvs3KdzFb5F9MEnFgMzyhlHJL0tF2d3CTehNogcZ04Pk7Zm+k0nLkPCc6nOmvWR1FOGK+5e+Mg4gddYLDeZZ9lTZfYX4o6+9RT6jtYYm87BO/nr8CZjA/C4ZnJfSXh50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7ry58RM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVgjzRAM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619JR4iS1924179
	for <linux-usb@vger.kernel.org>; Mon, 9 Feb 2026 20:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jip/3G8CKVy
	YJeY/9bxM7H7qr58iBaNdMarG43/Z/YM=; b=A7ry58RMQ979W5nW9paYLGGE/PH
	HcFW1aELJbubeasIWGRnD+6efBxV8iA3UcTbLtr46RT/0n6g17lwOYH5pQZz0yS8
	L5nVjNmK6ScnLjUhFVtzGBQ1ctlmDMD+BGmNsnrvhnec/dlWRPmglurWUFY3AoqA
	65XTg/yacTGTaKKjuKVw8MWZNbCjd3YHMu03l54f4HmR0btUetmKMlBNFyN/khXK
	w52ZMe72NyiRyeIsJsWCCGbVXDU5C9uXahtl880o3/4Qy5+botNV504t2BL5VaLi
	Dt6DQdFEA4d+mayaQ1TE93YvBUe2Ghs5DEHxE4JWPRHO5ULks9CeSHmAHJw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ku0e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 20:49:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b7a28264c1so3175168eec.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 12:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770670164; x=1771274964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jip/3G8CKVyYJeY/9bxM7H7qr58iBaNdMarG43/Z/YM=;
        b=XVgjzRAM+Ey/6mK7DGCzG3qXbSyY1xR+XtlYR1V6o0OipXKUrjsdgSkoTS6MuCq3q3
         MVhPXHwIEr2p1UODdPdRa0wZfGB/BOViflxtuK2JK4zmR2f3IDHJap2MlAtA6NedeNXY
         n6wW0+3tNCFgC6ob/WpliapTtRNBTRw0+Oo6kwnArDIGE/XQiDrnvnYOmKosqxvsr+VP
         qwTukebRUlfatFjHekJIhbEHJfYPiUjJDY8/Iw/6lzxi1LNi1zddtW0LNVMZUqJjrLGF
         Gs8VXnqO7dwHjSNUcqrh23X6Fv8xEegOVS/JQCnGkqISO+QiPZAlvMMPDuSvkwnojw5p
         X9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670164; x=1771274964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jip/3G8CKVyYJeY/9bxM7H7qr58iBaNdMarG43/Z/YM=;
        b=Yu2p4v00evBfzkq66kqSwTGZw6oDkwcyzYBwvARm02GfRm03McPWibET/2oQ+FT2XZ
         TwHwOokz6SMdHWlwr0xIzQ/RURbocMgQhTg1fneJOHbbB48fFBrmd21HeMdYVm/PN0u6
         h5xCVYlR6YBAIxhn6tOH30DRrwL17f5paR4cEg9fHZm8ocpBfJKMbGiLYXosEnHoaRTq
         8Y39XeDDZMmTBjlZ7blo/aLdl4m9hNjod/Y4Hb/BL+kwCEWEhj+kmLcI0EdPUjzd4l7U
         yiVvhA3e7kyDb7/vHSzTxF6ZLO8gtI/4z8WsxXwuOeTrcpvK3tWbgyxbM4AMO+klPUs2
         B7rg==
X-Forwarded-Encrypted: i=1; AJvYcCU1p/7src6c95MDRcC/STAsg+kw5D7+Dhu4IkoGWCOf/N9O9hj8dGTZ+XpaDQ2WZTKXFYggtsmw5KE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXD+dtBlD48KnaKZV6pR3JKa55Ch9rJR14FlSbiNEIoy+vEVc
	6Tcj4khE/h0Pa/mY7WDZoF0TJ6tPxFDvCoT/lzkCWoMMCQYJjfnRzG+kY8liIfWaseEZEhLlXYd
	ERikYFcKSbsbzVWzD6+dzJXLdWSF/BsPQKGSYvvl8kRpbpksCowfos3yyVCvCHVg=
X-Gm-Gg: AZuq6aI5R5CR+xGAoW+u8ttOsPZIS25k7w31OBQ3IZmywPLBE+rAvOoE2NKy1vhwmdd
	uD3T15B7OTVBVUvpKOqybpTMzW7YwUZmCcu5OcT0J8YiB4dK1aQXYuCPmnyBhFe2dKIDDQ19JLi
	qDP+X/3wwyrZ9KkE/cdw22L9oyA1qGfhN2m3Kr2PlvMWdIgjfQdnhWcJueH1UcxTo0EO5gGIaKI
	e75c8Ej/xlA81wiCV4kGC5omTFEY7MocF1HI3UUc3xcMe//7h0roU97LLopMgDIQSnAcziuNCOT
	GTq9wh12bFtcIjxkVxzEGv8DLpeEeGnuTGsSMl3OlvgvH+3GLtC9sHUQ44Hf6nJ67s+aCQi78Tz
	ToB7tZc0D4dr2w3Kx33Z1zqcUdcFyc2Qf8FCQ+tpVx+BIkYzpI2BYx+LycAv0gvlTRegn4FRB
X-Received: by 2002:a05:7301:418a:b0:2ba:6b3a:7696 with SMTP id 5a478bee46e88-2ba6b3a7b06mr1980386eec.8.1770670164405;
        Mon, 09 Feb 2026 12:49:24 -0800 (PST)
X-Received: by 2002:a05:7301:418a:b0:2ba:6b3a:7696 with SMTP id 5a478bee46e88-2ba6b3a7b06mr1980376eec.8.1770670163883;
        Mon, 09 Feb 2026 12:49:23 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba89ae14c9sm106247eec.29.2026.02.09.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:49:22 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v5 5/5] power: supply: qcom_battmgr: Add support for Glymur and Kaanapali
Date: Mon,  9 Feb 2026 12:49:15 -0800
Message-Id: <20260209204915.1983997-6-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=698a4855 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=E9l9NioYpaNDlZYFeTUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: L08enzBmT1m9U9XlOurTENNjZGUQF0vw
X-Proofpoint-GUID: L08enzBmT1m9U9XlOurTENNjZGUQF0vw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NSBTYWx0ZWRfX1lWbHX19rmH0
 P/dtFcosmaa3R5ZySkSa+bdL/9OHoxTMKz/rpC/3nKg3z4D7c1ovlcY6gqjwizcVB5RNA2dP+lU
 KBteL162F29S74Ire8GmvCj+c2Qm9sLhlJMwACtEQ5RFEBW8lC5zvMGE/ctCSFJ6Ltb2ifkngav
 Rj5Q6kOQzXPj5Vvzxbyage82n7I6WwADINMzpHmbjL2XRcReWsiW+VmB1yFFOOAuKjNYjr/VDqX
 FNf7NG8dSrkIn8zLFLmqUiiA3XiODO8sTEcTx5n56EJ6GdxVfErZ37b6X73RpxYTF8q8RKum3Nv
 cdowg5loyxDJdID+MWsTWuLgsrOwpVOYoMn2JW3rLsccc4r+Yj2ICG4EFA5xdt3IhYSRcjbsWMR
 Zs/crvNGFho/rgkvR7mR3b9aVIii8rKHKHGfQo1aeqQOIkheG7FgRYIqj7vtSfVAGUDTvsQxagp
 P72doua/wH6dSHl5ARQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[anjelique.melendez@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33221-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA12211493F
X-Rspamd-Action: no action

Glymur is a compute platform which has the same power supply properties
as X1E80100 and Kaanapali is a mobile platform which has the same power
supply properties as SM8550. Add support for the Glymur and Kaanapali
compatible strings.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/power/supply/qcom_battmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index c8028606bba0..576ff35b4b71 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1610,6 +1610,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
 }
 
 static const struct of_device_id qcom_battmgr_of_variants[] = {
+	{ .compatible = "qcom,glymur-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
 	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
-- 
2.34.1


