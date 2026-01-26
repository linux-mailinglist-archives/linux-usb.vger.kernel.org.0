Return-Path: <linux-usb+bounces-32755-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAJ7EHL7d2nlmwEAu9opvQ
	(envelope-from <linux-usb+bounces-32755-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 00:40:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B00288E46E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 00:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 724263050432
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF61314D15;
	Mon, 26 Jan 2026 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4KwaqLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/AbITzY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1A3128DF
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470722; cv=none; b=qxD1qykSVGAGsUQuFSxd6ZALOQNfDUyGMneRWjHBVkRYtM/O7JBDgQa2wqUB5iIp1cpc40yGsxPGC9U9NX9jb7y1HNv8aGuJmaRMUvA0DFLvdPmTQQK20TWhn1fekPbWDhisJFyMUnpWeU/498SRPiunCu94WoOUg/Umy6eXm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470722; c=relaxed/simple;
	bh=r1bqX+YKzW7Wo7iz/2rkXvfUlo4SFKFYbrl1Eh5BoSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FtegZ9Kz5lOlLC05zBpkiEEK3vY/S17gJj9DCfNTzG7+n60t9JS26hpYCXYudU+xqUK4nq10NtX4cxlTiWZJE+6g46icclBsgKYi1HviCVDv1DgYwqL1iIDuAQYV/Ni8qi8k37Vh1z/9baq7mHTkCoVTdSeaZsNf8BNKaMWG2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4KwaqLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/AbITzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgBXZ2880041
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nLNoInJmlgi
	CyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=; b=X4KwaqLC9LLCemO57LUhqgJjAMq
	B2+jhNok4UWzP7eKmowXMNqX8eflul5TxLtd8wx+zHAiJg+Buw9B70nhTnActyOJ
	gYSU/O899BmWhDhxAjDMVImicSUXH+tFsZkE+DHm7zjgbvfp9ZrhBrctUJucF5Hl
	In62/ROlblEDIup1Szjhs7//gcYIC4wusGOulWh0AIqVl63Jyj39NJQNMcfmFOxE
	PK2qvdd+ynPl7SkKdHlpXSS38jn5NFW+mHhcbXwO9nmBBbK2+P1pxQx2F9EIK//E
	F2Tnk6IZjOpAvyLa2bwRYEp2PQmI6P8tJ8Ehslm3+GLu2oBrnelBKhdl9AA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0ctb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 23:38:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12337114f3fso7033638c88.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 15:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470718; x=1770075518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLNoInJmlgiCyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=;
        b=h/AbITzYvNoSLuacqnaGFqyw10AqpkH12dHFNEahRsbfO7B8gBye5mnqKFMKc5XRNH
         BC+xi7NJa3QfAoxMEZ6xpGeNF5bJ0k9Xc+4VjplT1KNv/FD5IeWMy3ROcGkzot7M4b5m
         DjfQLUXcBemIjadmHNemhScqL0PTzpapV11n359KAr0/p9kRRVVGdkWd4w/8J+KbifKH
         RYXgDC6kpTrA36OAqlkZHeNJN4g/NUsZkWSLLOHIwzGgtW1fdmppVlSZiXcJpITHyF1h
         vOWj0eNLugQFeFP1jqPEQPWq7VmDEFoojGwyiCWhvEfm1nTYOgdC+Qllom2ZSjVexloh
         vVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470718; x=1770075518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLNoInJmlgiCyTSp0s0aDwUKBeAC7fdewIAWrT/v+x8=;
        b=nwubKwOAHdXS8pmAO2bfijybrxJyExR2Sgznt56v5LTAh5ZheOKWtq5cdDDufqYveW
         nTm9tGqCFL1yLpfQ6xfakxyUoUVWMZC+S6VspKhRcb3nGwpEGh5RwIPmNceCeh/TZ7rv
         mI5KSGTAKsRlO+5pSRXPjswQ1CYdg9ssynsL16XqJBWqQJX0qneCAYOEDq11bJ6f/Qer
         H4NgCH2vTC9rP4G2nrfDjjvZnUT8Jf7FZsGND/MR0SpydjTKCls/QHx1iYyay9B3FiA7
         Gwfte8lko7jFADSOhJAaOJ0S6zBJcqTwKuHJ8EDc8Jis0hf0CnbFvKAABO3b4MG1DRKF
         jjug==
X-Forwarded-Encrypted: i=1; AJvYcCWDy4gxtnI4zRA8nFU4CXiadY+zUoTrrCYF5OgFpzBE4d54GIJeNAtF6g8935si43qnsMyXVZx6IJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV4YrTNqEnVEm5Slc3xZRtTJXDrmixkcNB7fJbsy6Tlqh6dHVV
	CbEJaQJ9tCrzkS99q21bkJmVzXgh5VqAItNIlAmoZtvCJ54vPXn1d329vk/kpL01bPlU2X/maFY
	/aFqrzBU6FoxnfbDmKobzvxg5RsUJL6VdwJ3MZGyzk1rItcfmFunW1CekVmIxE3Y=
X-Gm-Gg: AZuq6aLFUsf+L2CiHzkxoGChvRfcoDHxneIWd0wWY1q928L0skUwiDe1ikn/RPyR0v2
	7IZU8Liqsm6cTKjpJ46h9rb1feQCj0c84apijGOhh8m0t5hf3K1X/lzqFsjk1b0cGcfn3dwvb0d
	a4Cm4UbaX6gBIWu7R6vZvMwEcE0pPPLovQ38tk4/c1GAe1L7HrDIEFgEt3AoHI6Xd5YLSTDleRq
	Vlpur/9o5C4dIHad95j3CMrY2han6qCsseqS4hoLeUvkTQu1O+7qvyQ+s+PRzhYex3rpNMzYsgS
	rthI2YdO1Q7XW4saR0SHCSOn1gHXv5SAvoSGK5JAp4dwj2aCvtNdQWHOhGbs/SWPROP/4vaTz/z
	GFsa3MGAKzGFd7NTxJdutXwlHd52fcXmrShkmek+5u0n599KAAece6YWPPnRH5Ws=
X-Received: by 2002:a05:7022:438c:b0:11a:51a8:ec9 with SMTP id a92af1059eb24-1248ec41322mr3202368c88.29.1769470717626;
        Mon, 26 Jan 2026 15:38:37 -0800 (PST)
X-Received: by 2002:a05:7022:438c:b0:11a:51a8:ec9 with SMTP id a92af1059eb24-1248ec41322mr3202352c88.29.1769470717090;
        Mon, 26 Jan 2026 15:38:37 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:36 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] usb: misc: qcom_eud: add host mode coordination
Date: Mon, 26 Jan 2026 15:38:27 -0800
Message-Id: <20260126233830.2193816-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FpsgVc8-P6_kTbx04mdpksuqFtKrdRVz
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6977fafe cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0DRR6HtdnbDkULtDn-kA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: FpsgVc8-P6_kTbx04mdpksuqFtKrdRVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfX0X7ztWiEU9g1
 PphIVZucTTOF8p6uD51cennLfkJ0rbX12cbzuoBg8aeLviUp3i/f/yec+3FmUG7T/BBWOeSvqh4
 tsDYd+3jQgnFSLxdxqaoA6/V0ma6QoX4mNmvnmXox9uxzW1uRpqalfcWSJ7Xz5FAWS+CgYCoScF
 N+o5Lbo5ujeWMx2L0bbEegP68ifwc3LbdAvoFXhTllLjUBbDvlbaqqJtRepRcFjR2GF+jrh2mHR
 YQ7PTQClwuI/arEVTGi47Vmlc6yy5owFDJzpEOdW4cGdOOa8JGa665ROU1rFn4Wi0eAPjZw772r
 vf88XZ7dHj+dVEj36xaJ93Jx7sZ8MxQKYk+bV0/b1/UyFaCGdTyRgA4c2xYgRaJZqXFxjxQy0k9
 yXJ8l5iPY7ArY1sejLoqub75U5Aa5c6k05R5CI+A+U+cHChfl4uMMVAecYG+NURDhiRgyEVfMVQ
 TDXQM8Gc0ZZ7KnONJbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32755-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B00288E46E
X-Rspamd-Action: no action

EUD functions by presenting itself as a USB device to the host PC for
debugging, making it incompatible in USB host mode configurations.
Enabling EUD, when in host mode can also cause the USB controller to
misbehave as the EUD hub can only have one upstream facing port.

Handle below two scenarios to prevent these conflicts:
1. Prevent user from enabling EUD via sysfs when the USB port is
   in host mode.
2. Automatically disable EUD when USB port switches to host mode
   and re-enable it when exiting host mode.

This ensures consistent state management without creating conflicts
between the EUD debug hub and the USB controller.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 79 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 0ea6491f963c..3f1cc7ea2a6a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -49,12 +49,15 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
 	bool				phy_enabled;
+	bool				eud_disabled_for_host;
 	u8				port_idx;
 };
 
@@ -162,32 +165,66 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	mutex_lock(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
-	if (chip->enabled == enable)
+	if (chip->enabled == enable) {
+		mutex_unlock(&chip->state_lock);
 		return count;
+	}
+
+	/*
+	 * Handle double-disable scenario: User is disabling EUD that was already
+	 * disabled due to host mode. Since the hardware is already disabled, we
+	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
+	 * when exiting host mode. This respects the user's explicit disable request.
+	 */
+	if (!enable && chip->eud_disabled_for_host) {
+		chip->eud_disabled_for_host = false;
+		chip->enabled = false;
+		mutex_unlock(&chip->state_lock);
+		return count;
+	}
 
 	if (enable) {
+		/*
+		 * EUD functions by presenting itself as a USB device to the host PC for
+		 * debugging, making it incompatible in USB host mode configuration.
+		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
+		 */
+		path = chip->paths[chip->port_idx];
+		if (path && path->curr_role == USB_ROLE_HOST) {
+			dev_err(chip->dev, "EUD not usable in host mode configuration\n");
+			mutex_unlock(&chip->state_lock);
+			return -EBUSY;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
+			mutex_unlock(&chip->state_lock);
 			return ret;
 		}
 	} else {
 		ret = disable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to disable eud\n");
+			mutex_unlock(&chip->state_lock);
 			return ret;
 		}
 	}
 
 	chip->enabled = enable;
 
+	mutex_unlock(&chip->state_lock);
+
 	return count;
 }
 
@@ -324,18 +361,56 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	struct eud_chip *chip = path->chip;
 	int ret;
 
+	mutex_lock(&chip->state_lock);
+
+	/*
+	 * EUD must be disabled when USB operates in host mode. EUD functions by
+	 * presenting itself as a USB device to the host PC for debugging, making
+	 * it incompatible in host mode configuration.
+	 *
+	 * chip->enabled preserves user's sysfs configuration and is not modified
+	 * during host mode transitions to maintain user intent.
+	 */
+
+	/* Only act if EUD is enabled and this is the active path */
+	if (chip->enabled && path->num == chip->port_idx) {
+		if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
+			ret = disable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "Failed to disable EUD for host mode: %d\n",
+					ret);
+				mutex_unlock(&chip->state_lock);
+				return ret;
+			}
+			chip->eud_disabled_for_host = true;
+		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
+			ret = enable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "Failed to re-enable EUD after host mode: %d\n",
+					ret);
+				mutex_unlock(&chip->state_lock);
+				return ret;
+			}
+			chip->eud_disabled_for_host = false;
+		}
+	}
+
 	/* Forward the role request to the USB controller */
 	ret = usb_role_switch_set_role(path->controller_sw, role);
 	if (ret) {
 		dev_err(path->chip->dev, "Failed to set role %s for port %u: %d\n",
 			usb_role_string(role), path->num, ret);
+		mutex_unlock(&chip->state_lock);
 		return ret;
 	}
 
 	path->curr_role = role;
 
+	mutex_unlock(&chip->state_lock);
+
 	return 0;
 }
 
@@ -433,6 +508,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
 		return ret;
-- 
2.34.1


