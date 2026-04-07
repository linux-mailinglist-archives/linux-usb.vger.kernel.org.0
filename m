Return-Path: <linux-usb+bounces-36060-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOvONC+S1WnB7gcAu9opvQ
	(envelope-from <linux-usb+bounces-36060-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 01:24:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020A3B5747
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 01:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34BE730221D8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 23:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BF838D00A;
	Tue,  7 Apr 2026 23:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU1eIr1v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrpL0DYn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B61A37EFF8
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775604256; cv=none; b=CYiC/ahJaENP6/n7Sh3TlqsT9SpYr/h+c2biGh93KEWk2EWcY73b+AzrwLOoSl8nWWBRVktPen1Ak3iDyN3Id98WUHhtX/am+Hh1bBLGympAAHA7aU1as/W82B9suVbqc4bKX1j9+FabNc3FXALSY9cbOtkyRbvRLXTT9uuL5Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775604256; c=relaxed/simple;
	bh=mhhSE0DTLHfssa/4rIrRQJ+BLeOe07efczXWZJwE7K4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b8TQ9zQU5c4OmYkc236/ZHpXihC7rtpqv0TAK20CA8Swhh2hdpNoL2X7P6ZVBo6DXCqrS9MrsMtoqb9RWgmsT01/TZbB7kBDdJDcKCnIwpUiMDlXxeqY+Q9OEUAP0jCGhNtW7XI0OTnmDSS+k2vnVf7gwnhBAqO7o1ggtA5m/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lU1eIr1v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrpL0DYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M6U6p2451216
	for <linux-usb@vger.kernel.org>; Tue, 7 Apr 2026 23:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Vify/tSNNfOxujkABv2RqFXr1fdKkM70W8x
	YgfSuU6E=; b=lU1eIr1vVGYAWUosjZiWxfBacBoY03+SygJTiJmD7/evry65Sud
	n6STw007Fn15oJoDBxxisMzerObytiTI0Ri0eX3KrLfKpplWtJUkpaFkLJguT7tG
	hqfBD03imgV+ENyvOdTeCuB1MXtepF0TH3LGBa74t4i7Maye5Y54VFgJypBV+eiL
	AkA2c6ELY6ZwQIO+5gHGV8RoSsQ4YrwzQYBt4MvGfQrKP3Fi1b41PFBwRoyXQeF6
	2x8cmtnbyvL/yO5XTWnR2ehNjNugiPLHNuwvwCp1HH5mHrYTi5E3AsTx+9r7Z33i
	8UpVtduuiLh4CLHALX2JApBPPG28ssOtPSQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae685qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2026 23:24:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-126e8ee6227so9262010c88.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2026 16:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775604253; x=1776209053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vify/tSNNfOxujkABv2RqFXr1fdKkM70W8xYgfSuU6E=;
        b=VrpL0DYnqJaSO/am2wJb37e1L2AZCZcVEhbQXoPe5oCJ65pxkW11rkCl6bpEKT1CIq
         tbEavQCup+h1D6XH5HjjLlrixBJyxf5vJVPZUPEvjX8PA+eFxAfYe4UpPQSYzWrDSZU9
         1uUVnq2+VIwL2Xdev3Bkg/DWldodJwTNq7qDeoz98jCqHFU8J9qe7bF9xjCpK5p8ofQu
         rUJ0Yb081BtV65DmR1D2OB1ZcH2b5qIpn1+Dffdk5QncMrIowMmCqYSFaBr80RgzKzn1
         +FKpZ+jEtukA4+K9FCed5MG0BeD1HVFmBluCeHG2V6dpFf1wszOWKr9VFdXh+g8gLzcR
         VGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775604253; x=1776209053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vify/tSNNfOxujkABv2RqFXr1fdKkM70W8xYgfSuU6E=;
        b=lwXNVV+vhvWmILlhfDaByhACdwUGH5Y70kG8Yjm0F57V3IEPSWkPjJ0FxciD8c26in
         juoR1WGp/6OUqrtLIUXQDQcmOr4+HQCsXH6e+Y/FstHZMmcAUfTKpGCmmsqVhM9H2aS4
         QWjwjySEtO9J8o3+9rjmE0QWVOIAzwxcCBhFEDOBlqBYOaIBZzv4VLgJt2JPcn5+UMTY
         qRm6H2fBzenmUVPKjazEEKOqT50BO44j39pREb1g3leMVZeX3P0HgetNEqJlM+aCa3+p
         gKTDKipu2ap6fP1QNQYOVgMNcg/QOX4aZmY8nMLCeys2yp5JS8eXE+P1Em0vVvpdWjTm
         xFeg==
X-Gm-Message-State: AOJu0YzJQzRoYtZW/aUj90+Aiv98ZrIfSA0k1e1HLsTsw93QUB2Z2Ay5
	FYnhYdPklMX6MlJtOHcaNJyGs/tyZeE5p0mv1BVlI1mq2PHuOnTP3O0iKxhk/BevsJveoDNGoVk
	N8xLTJiaOMyGjDfyYlTu8bFzEdpkj85Tht/1CZnKLOZPJnMOZoNYzhMtRU+clmFenrdVx10Y=
X-Gm-Gg: AeBDieslEiZZKfdhZ8P0ZBr4nnCdg3jnAeIuLNbogHGoxD1uIQ1yFXzUGcGIGpxl1xZ
	UVBNbN+swN8wfu0d9TwGFlBnb315vmrNTqkMZhsphLR0URprWNd0vazNVUogEhTdYbOJcSKNRb5
	Eb+J2wHYRcHGNN5JjBxt3I++J7DRHMMyYUWmZweZbd/o8u5Ekm4mkWc6MPbWnbeuMsZ5yASb8Lk
	jnfZ+SexoZ3TNQ9Ak/UnVWpB/yX2hoS8aj2q9hok6lZAjKlWcgyM710byAF767t+V7Qd/aPhxGz
	3devKqW7BkdrBc9TmKdccEru/ZP2GyzYrMElmnZRdR0pqCn0624mpbu8FLUM4Iv780bhg2p3us4
	6u0ABo9Zn1LSRYKF5eEkTX1LAsjQu+SET/g1yBpjh+GLRE+zUhJYzjvso17QaNm8lkxXxLJYhIB
	Y=
X-Received: by 2002:a05:7022:6629:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12bfb6fb392mr9954152c88.11.1775604252531;
        Tue, 07 Apr 2026 16:24:12 -0700 (PDT)
X-Received: by 2002:a05:7022:6629:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12bfb6fb392mr9954137c88.11.1775604251965;
        Tue, 07 Apr 2026 16:24:11 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede545e8sm16163393c88.11.2026.04.07.16.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 16:24:11 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com
Subject: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is not available
Date: Tue,  7 Apr 2026 16:24:10 -0700
Message-Id: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIxNCBTYWx0ZWRfX/5CHlERdVUTt
 rV7ucAgWYZlcdjsWvwULp1O6BkZ3Uc38V2C9+6CrlvKwoIYqTw6cdGnhloff8vFmLr5prkdmf0H
 sHkI/ekMcYLhbCyLHdlq63/Gzhc4sVSvpJeT5N7hTRURWgwn4oMPEDJA4yH1UHyygw5vx8jWx38
 sHdObeXVjwwk9Jwn0tI3LBbK8+9fGWxGOIw5k/GLQ1eXScJm2xku4FTtPa6yZ1/L/LclA0Ruere
 Z7hWE0oE3OxkfZtFhGLr8wsTiZ52HU8+wOXjSk17GO+9LDOZUdU58CItudS75DLeax846TdXbmT
 0wqA2oiuNTBmVp0uYu/PzBJmHyPBvr4yyxbQItq98AqKxhQPCZDL2H07ahOdbTxQfJE2PR+XR93
 yZAt2xinKvbQJI77RWKMn5NjYKpsoW3nlM6HvnIlLpHQ0VY5E+R6KUKLGxA3QxIRvgY7UVyABNt
 p07bky/o4OyYhbTTq5w==
X-Proofpoint-GUID: 5-TIWhFnLf-p8mdmjyMDy-IMakINKse4
X-Proofpoint-ORIG-GUID: 5-TIWhFnLf-p8mdmjyMDy-IMakINKse4
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d5921e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SXPYzt1XaJ2lArBJve4A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070214
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36060-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3020A3B5747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The dwc3 driver currently defers probe if the USB power supply is not yet
registered. On some platforms, even though charging and power supply
functionality is available during normal operation, there may exist
minimal booting modes (such as recovery or diagnostic environments) where
the relevant USB power supply device is not registered. In such cases,
probe deferral prevents USB gadget operation entirely.

USB data functionality for basic operation does not inherently depend on
the power supply framework, which is only required for enforcing VBUS
current control. The configured VBUS current limit is typically enforced
through the charger or PMIC power path. When charging functionality is
unavailable, applying a current limit has no practical effect, reducing
the benefit of strict probe-time enforcement in these environments.

Instead of deferring probe, register a power supply notifier when the
USB power supply is not yet available. Cache the requested VBUS current
limit and apply it once the matching power supply becomes available, as
notified through the registered callback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   | 82 ++++++++++++++++++++++++++++++++-------
 drivers/usb/dwc3/core.h   |  4 ++
 drivers/usb/dwc3/gadget.c | 10 ++++-
 3 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..20df0b287623 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2167,24 +2167,72 @@ static void dwc3_vbus_draw_work(struct work_struct *work)
 	if (ret < 0)
 		dev_dbg(dwc->dev, "Error (%d) setting vbus draw (%d mA)\n",
 			ret, dwc->current_limit);
+
+	/* Unregister the psy notifier now that we have the power_supply reference */
+	if (dwc->psy_nb.notifier_call) {
+		power_supply_unreg_notifier(&dwc->psy_nb);
+		dwc->psy_nb.notifier_call = NULL;
+	}
 }
 
-static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
+static int dwc3_psy_notifier(struct notifier_block *nb,
+			     unsigned long event, void *data)
+{
+	struct dwc3 *dwc = container_of(nb, struct dwc3, psy_nb);
+	struct power_supply *psy = data;
+	unsigned long flags;
+
+	if (strcmp(psy->desc->name, dwc->usb_psy_name) != 0)
+		return NOTIFY_DONE;
+
+	/* Explicitly get the reference for this psy */
+	psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!psy)
+		return NOTIFY_DONE;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * The USB power_supply may already be set. This can happen if notifier
+	 * callbacks for the USB power_supply race, or if a previous notifier
+	 * callback has already successfully fetched and associated the instance.
+	 * In such cases, release the newly acquired reference and ignore
+	 * subsequent notifications until the notifier is unregistered.
+	 */
+	if (dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		power_supply_put(psy);
+		return NOTIFY_DONE;
+	}
+
+	dwc->usb_psy = psy;
+	if (dwc->current_limit != UINT_MAX)
+		schedule_work(&dwc->vbus_draw_work);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_get_usb_power_supply(struct dwc3 *dwc)
 {
-	struct power_supply *usb_psy;
-	const char *usb_psy_name;
 	int ret;
 
-	ret = device_property_read_string(dwc->dev, "usb-psy-name", &usb_psy_name);
+	ret = device_property_read_string(dwc->dev, "usb-psy-name", &dwc->usb_psy_name);
 	if (ret < 0)
-		return NULL;
-
-	usb_psy = power_supply_get_by_name(usb_psy_name);
-	if (!usb_psy)
-		return ERR_PTR(-EPROBE_DEFER);
+		return;
 
 	INIT_WORK(&dwc->vbus_draw_work, dwc3_vbus_draw_work);
-	return usb_psy;
+
+	dwc->usb_psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!dwc->usb_psy) {
+		dwc->current_limit = UINT_MAX;
+		dwc->psy_nb.notifier_call = dwc3_psy_notifier;
+		ret = power_supply_reg_notifier(&dwc->psy_nb);
+		if (ret) {
+			dev_err(dwc->dev, "Failed to register power supply notifier: %d\n", ret);
+			dwc->psy_nb.notifier_call = NULL;
+			return;
+		}
+	}
 }
 
 int dwc3_core_probe(const struct dwc3_probe_data *data)
@@ -2232,9 +2280,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	dwc3_get_software_properties(dwc, &data->properties);
 
-	dwc->usb_psy = dwc3_get_usb_power_supply(dwc);
-	if (IS_ERR(dwc->usb_psy))
-		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
+	spin_lock_init(&dwc->lock);
+
+	dwc3_get_usb_power_supply(dwc);
 
 	if (!data->ignore_clocks_and_resets) {
 		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
@@ -2286,7 +2334,6 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 		dwc->num_usb3_ports = 1;
 	}
 
-	spin_lock_init(&dwc->lock);
 	mutex_init(&dwc->mutex);
 
 	pm_runtime_get_noresume(dev);
@@ -2354,6 +2401,8 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 err_assert_reset:
 	reset_control_assert(dwc->reset);
 err_put_psy:
+	if (dwc->psy_nb.notifier_call)
+		power_supply_unreg_notifier(&dwc->psy_nb);
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 
@@ -2410,6 +2459,11 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
 	dwc3_free_event_buffers(dwc);
 
+	if (dwc->psy_nb.notifier_call) {
+		power_supply_unreg_notifier(&dwc->psy_nb);
+		dwc->psy_nb.notifier_call = NULL;
+	}
+
 	if (dwc->usb_psy) {
 		cancel_work_sync(&dwc->vbus_draw_work);
 		power_supply_put(dwc->usb_psy);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..68171629c7bf 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1058,6 +1058,8 @@ struct dwc3_glue_ops {
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
+ * @usb_psy_name: name of the USB power supply
+ * @psy_nb: power supply notifier block
  * @vbus_draw_work: Work to set the vbus drawing limit
  * @current_limit: How much current to draw from vbus, in milliAmperes.
  * @usb2_phy: pointer to USB2 PHY
@@ -1246,6 +1248,8 @@ struct dwc3 {
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
+	const char		*usb_psy_name;
+	struct notifier_block	psy_nb;
 	struct work_struct	vbus_draw_work;
 	unsigned int		current_limit;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0a688904ce8c..4717c251596d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3124,15 +3124,21 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	unsigned long		flags;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
 
-	if (!dwc->usb_psy)
+	spin_lock_irqsave(&dwc->lock, flags);
+	dwc->current_limit = mA;
+	if (!dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		dev_dbg(dwc->dev, "Stored VBUS draw: %u mA (power supply not ready)\n", mA);
 		return -EOPNOTSUPP;
+	}
 
-	dwc->current_limit = mA;
 	schedule_work(&dwc->vbus_draw_work);
+	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return 0;
 }
-- 
2.34.1


