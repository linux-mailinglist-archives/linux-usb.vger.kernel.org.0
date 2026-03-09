Return-Path: <linux-usb+bounces-34364-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H4pI5Uvr2nFPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34364-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:37:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1438240F08
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 288ED31459C3
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EB5421A09;
	Mon,  9 Mar 2026 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+K3cJ8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ+toy+Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F0236BCD2
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088433; cv=none; b=WdquXfxzEW3Qk6cY7EKpEG1QShPJGnDVHjNGeCB3om6RvVoQmNawbuk0n56OFL6FLweSU3M1FlzjhfZP7oAhP+tvXFjHWNKE4p+hTKj6q+UjbchqdDZR+CAxi4OQ5aZAvbdgKRi6oAgrG7RVIl5DxpDKlnc1Ik5b+pP2JMW+rzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088433; c=relaxed/simple;
	bh=hBRDrGzZyzQbp0j3/9wGZbipBYnsHW9DmPOsNcq9U+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oX2eVIYK7fkK7gQinDWC37hI0jj4aRw143l1nmcAeUBB6C/I8SWdjNlV6L0Z+w8Q18NdqMCly+6hmGiUwXJjbA+DZMplPTEhsP+Y5bGkTUhG3W1TisYUtvQNz/yzKH+r2FbqRT6XKAQUHZD0PULqND/ARyJ33B0khHuuyNL2eng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+K3cJ8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ+toy+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0QN744383
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m0r0f2DWKHm
	8QlM7U3TX0AkmaU2aSB7RsqthJ3TDCeI=; b=l+K3cJ8Ch3Dz53H6KR3LliIDqTN
	eFWdjHWJpglzmHPhtOetJznivFa88hupgxeKWJNS/b1GaiTNsU61kHmbRTZ7Ok/S
	0s0Y4qihHhb/7OsJkpeMVD441Fc0RXVuX52e1OHlAS9WIyXYuA7w+GfdjZNqqgQM
	zTuGwlPQLAVY2/OYOKg9EAd0/tU3t+xpV8+VHY+yTn4x6vAc1+YEf7PXLyKpOEyQ
	LJagbzQpRqjSdM/RuW/ecsiT0x/ThgNNATqTI0VDKjI5A/orx3pZSnuwCznYzcVF
	m67DVmDVpTq1bJDnno6jNnT2eF1FUf7sSiC3o47KEwjOaYm7YekgF3IgUbw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaad4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:50 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4d4db1523so54438655a34.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088430; x=1773693230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0r0f2DWKHm8QlM7U3TX0AkmaU2aSB7RsqthJ3TDCeI=;
        b=MJ+toy+Yhy0FOsHEvHFNrKwVWvedyICxzwcc4X8UxeO8a+VXi6cRkauviuO2TeVZzi
         Uj7GHJCpf72l3VzaYjtfyI+7yS0Qp5BIhR396rWTte8n2st7ihrhYMDQ9eQXnWrE+wOO
         0dlVrds97+rL3uOBOO9Yw6HEAo+D3Uh1OwvAzr455oa0XcBfumgerGlMQbTUWYJFYOn+
         Tvz3lKK86nnYv/VDwhGoVnlCnD6LbUAHiE2jhUQngf/mHuNdj7lQDVQha+yck3f0uJ/g
         yLrfa0PM0ZyTSPn19uAf5q6RfD3i/XSNEJyIuOS9TQZcksjC15MVE9AqN1OhZ3rSC0Vn
         5EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088430; x=1773693230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m0r0f2DWKHm8QlM7U3TX0AkmaU2aSB7RsqthJ3TDCeI=;
        b=D1epCJWjA3Pe57MvHu82WWjQSXsk2P1o7ywjBUQVABXAzA3S5MVjnoH2haKMFvgr4G
         g32GHo/utfirDavhZxbWuVHCj7MWD8cBFyXa8KsqEA9tdkao5dQRzcytOQsJx9r/zFCC
         MJxMoyWEVV+2VMKrJPsn8V1YVJO+TcwgdMee0YKQtJhiLFBpMBR3LPKAjwKzD8G2VpGG
         j5ELINUFNtlSuwv0PpBk7hUFGK7OrViKsD1sJ2eKbLPLMjySG47LhrHkWYsr4agU+3r8
         /IwLwGXx5gKUrm8qasflQJCgrFFvHIyMqCxLzQzM4lN19TliYT1urHe1QmF7TGEuwBAe
         HuXA==
X-Forwarded-Encrypted: i=1; AJvYcCXAVMt/lDHDb5HsF70/v8CN0CW7q7Wq8xktAXmgYL68JqTN80Q3VpAypxkDOoLvdHpWtRCHrhHi/48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCECzqwyGZuQyWmAprpBMDgbffxa/2eKE5X7N2zhHe9UfOpqg
	c3lBSF79Adt5O5FLfUPQse0OiZzw/hT1ojeCQDoNdRxm5K2vBMFwtcfvUhsbyJmzfO6XWORn6UQ
	MbmIJrgkOkCOmZsDKCH3JPN/8wYT7KEK8kOHcsdZVeywoTf5aXY8stlLvd8fWr88=
X-Gm-Gg: ATEYQzwoIWnxpisTGU9414t76K4ohZYl21JZR6GICBJlYhpn4dHaSXTmFcAsui8kolQ
	yC5LsXhDXrfUqUa0qJZ+ZzPBo+N70l/PhlY3HjBs/hviY9OV0YEVto6EPlj2+RTdVdvVO6AuRCi
	nhO5wwa5pmFqkZ8jDkrEePTE5lxkRHW8iZB1n2pNDsB1SgzrBzWXeiB5pduuAD1OuBGTcQBu+Iz
	CWmj33yBj3lPUX/FvTklv+AGKVkf9XiGnPkEIyOWq1z70i6W79as06/rzMbjr4zoyR9/2wg4QL0
	N/xeZPdqj0zmTsWQLqIcSqEY2NP2yMtuzHxPf7DNAayS0JmdkJVfvSCcSd25MXVrgEsHxj56HoP
	k/AatUybov6fEfM4ap9eOYj1yfTJp5jodixYgwGiT7KEfh7uHdkjUG5zT9q/+R427sKXXX0yylE
	o=
X-Received: by 2002:a05:6830:67f5:b0:7d7:5113:f83a with SMTP id 46e09a7af769-7d751142e6fmr1974648a34.25.1773088430007;
        Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
X-Received: by 2002:a05:6830:67f5:b0:7d7:5113:f83a with SMTP id 46e09a7af769-7d751142e6fmr1974620a34.25.1773088429634;
        Mon, 09 Mar 2026 13:33:49 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:48 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 08/10] usb: dwc3: qcom: notify EUD driver of role changes
Date: Mon,  9 Mar 2026 13:33:35 -0700
Message-Id: <20260309203337.803986-9-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: X3nlVyt9kHZa4uRz1lm9Zdqfhb1QGyW3
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af2eae cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=D7RZ5MMOI3w-WYzWcLoA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfXwWdAuo+vDUju
 uUmA2zvWMxBSfk9BU9mgLaZTKo3rP6sC8C2B6pGkFHjlXUcnoIfZwqhr4Yrm6ruAJJQ1dtqCQ48
 GNhuYJ6MfAD6LU7F+ioQ91+4f6TiMIKx6wtXey7FZ6yINC/2Eroh1ntSlpcd9x5U6gHomx+4JyR
 ISuCNNHv+KtRdosTiWKd8pYX7tcPQ+GFw4YEeopxGYGEbeCG2RNt7u67Lvbr5k3S6p66Ikh9JDa
 I8HboYH1uPGkPcXskwhIR8EYoowvVU4GuFn56m+6suzpOadiE12OxPPLqCFApSHw2EtazU09O3w
 OrfbKpWBu8bufOVmte13g6MwEY97FX40prtQLWGApD/3m9chJuRuROoyN2kJg7luaIciev9+Pjs
 hak9Xmfa43FJ7sJk84hqfaZ+Ni9+jv0Cf7I+cXepFnXF9uP6cnpLNwQa5Lhtpm2ZavqNh9CI+T9
 yEtSgs2/pWs5cgVx3mg==
X-Proofpoint-ORIG-GUID: X3nlVyt9kHZa4uRz1lm9Zdqfhb1QGyW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: E1438240F08
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
	TAGGED_FROM(0.00)[bounces-34364-lists,linux-usb=lfdr.de];
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

The EUD driver needs USB role information to control its operation as
it is incompatible with host mode. Notify the EUD driver when role
changes occur so it can manage its state accordingly.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/dwc3/Kconfig     |  1 +
 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cb..1a2d7c883b50 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -132,6 +132,7 @@ config USB_DWC3_QCOM
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on EXTCON || !EXTCON
 	depends on OF
+	depends on USB_QCOM_EUD || !USB_QCOM_EUD
 	default USB_DWC3
 	help
 	  Some Qualcomm SoCs use DesignWare Core IP for USB2/3
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9ac75547820d..b51fd97521df 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/of_clk.h>
+#include <linux/of_graph.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
@@ -19,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/usb/qcom_eud.h>
 #include "core.h"
 #include "glue.h"
 
@@ -561,6 +563,7 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
 {
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	struct device_node *eud_node;
 
 	if (qcom->current_role == next_role)
 		return;
@@ -570,6 +573,13 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
 		return;
 	}
 
+	/* Notify EUD of role change */
+	eud_node = of_graph_get_remote_node(qcom->dev->of_node, 0, -1);
+	if (eud_node) {
+		qcom_eud_usb_role_notify(eud_node, dwc->usb2_generic_phy[0], next_role);
+		of_node_put(eud_node);
+	}
+
 	if (qcom->current_role == USB_ROLE_DEVICE)
 		dwc3_qcom_vbus_override_enable(qcom, false);
 	else if (qcom->current_role != USB_ROLE_DEVICE)
-- 
2.34.1


