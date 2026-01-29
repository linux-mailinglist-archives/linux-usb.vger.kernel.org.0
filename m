Return-Path: <linux-usb+bounces-32908-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHxZAhBBe2nECwIAu9opvQ
	(envelope-from <linux-usb+bounces-32908-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 12:14:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61EAF7FB
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 12:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17282301584E
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53943859EE;
	Thu, 29 Jan 2026 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPmlYnFK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6ZYfxnU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6734352C53
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685253; cv=none; b=a8g+HvsspM9BdE4oHipouP1BmPTDYwQ8U/3Y8JrH8zu5jIABvF7M5uuanCb5PcDIUIkhSWa+nbuHtbxuEbvB75rdlsGLEvwm94gi37CcJBjgS+ABytMqoxPxSE9o4jdcHtiws3582qCppL2Y9UNU5xxH6JYOjlrrfKOLxE+88DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685253; c=relaxed/simple;
	bh=gv29jU9yC6reY0wiHhfJCVIvhWk6C66NRxUhKVYRvxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gLnC6rOtahy+oB9p/zchRm91RZtSr76vWyvFzOi9NIOieKXo9I28cOs7tmIvYg3sOBpDzT8ZDWX/NxLhcQjx4hMDuuwxXL9zf91di+o/KI6HLkq4Ckkg9G3lTyREVWi8V96WWGJQqK5z/frklyQJt6AxBVREJzxVvWxYommIndA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPmlYnFK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6ZYfxnU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAR8gh2505278
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 11:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K+VcBVORyVtu3fsMHfWEPWjAAg/2TKDQXow
	O+1KDx5g=; b=ZPmlYnFKn8gzsL6akJQDp74crTRdALNofKyUMwKeR0pkC9Af9P1
	EAItNm8Vmr0UuKKYOY7Oiy5+nc/ba2fMbctPByewtayQutry4U/5lVpElRB7uCKx
	PWim4DTTGaf33nGRUutqFypPDiGEGEuwGtXVw7DVTnnT8gIAxQ0LcHqCDSmrLdZz
	nuTvWLeq8pXkQ1gWynLU29+cSZxE6t9TvPE33E8oM/h0RBu9poaa9hgyVrbiSK1b
	cnLYPV2d034dAtFHKaymFI7M9/RIw6OZ0pmDRbPbcQSSfHsLFUR6brMrHFCpuyfn
	1obVLsilNcPkP833y8/y3YnZXd3dX6+Np6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05tbr4ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 11:14:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a351686c17so7838665ad.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 03:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769685250; x=1770290050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+VcBVORyVtu3fsMHfWEPWjAAg/2TKDQXowO+1KDx5g=;
        b=b6ZYfxnUxG5biuzzAFB3qd2c/woJ6DGePuK3tR3yMwkWXHOX+dl8J65S2l/jbsxXGW
         HEEOo1ny9Yv0a/EKnBLtbStqw4Xu0hIg6k+66R7gqToWtTEaGM19JFgZYbnn91NYB+sQ
         CSV3734x12rM6DHXi4PFgu0UThxnrMQ9C16dGVJF/Y6ZXoSujvt7RKrDeeuqMvH4X30H
         HGznpv0Fv4VjtAV/+Oq/90DL7eOGaflMwsboEp5eTqUCJ3Mcmdvz59V9XxygnZnT2a/a
         N6bN9kr83P6QfXBP/3RqDy4man5I72Fg5c6Dp7OtCnOYK3Og6HNbhYfe55K9g7Mw7908
         KDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685250; x=1770290050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+VcBVORyVtu3fsMHfWEPWjAAg/2TKDQXowO+1KDx5g=;
        b=Ww0PWsh3NEAYJnAh8QTba8au44NGOJD1ZWSR5M5p/0eO+gYic71eB86q2Z37pJnta0
         FhoCVze8j08ei+jljA5TM5taFoweIVhUlzR0P/ZdDvGTIErrSLec/33YjK4fDmuz/oSi
         y+Bk5o85BgYG1X2VTAgsFTuQzSQpAJIL7HSg13R31zppqwVQshYBEKPnBzzw7IoOIyc2
         qU/u5nWD7lbueW+U/iqcMOCBl+EkQJW+SiD08fgzsd+6MEf6xpeSUsfGe9pdUmbeTYZV
         8g8gjvIRztB1zxBi/pt0Df5gt/sLK3l7N/Io9dPg+2p3YAvzlF4fPxZkPekgZQCmEy8W
         oGLg==
X-Gm-Message-State: AOJu0YwyHV2rYX8nhpOx/efpb50HMsYTQ4CRmYsTxhhBtlCkbMT/DFgW
	ybHrgQA3gomV12fFXv3HiGoZpDoRcmDAxL2XQVrhquk1kZIzI+wlQsS+Rvd+nhHEndFwkd6kWu8
	Jl0rn8QTWhuBcsLXYzRo38f9VFOOdxmxBwAbcJ3pLOWLwVuXdj63C65wNe71reaE=
X-Gm-Gg: AZuq6aJkmaoDLc+21TpBHl8Q4CZDDmd9DtAAVyu9qOK4OBJ5A7nRp6Zgcj5o4RO7Ps/
	zmvO5AAVh2/dUH7UW1ZXJNGXnR6Qwi327OHdncIth/Ty/2m4QBImcvTAM/neZqP4LdsD8yUgMxM
	OrW/x7aMky8E6vk9voPVXBuLVTD3scizbsF9Zyg0EgBKF6AMEAzhix4w9f4RD73cLQObAfMAZPz
	5r8WvKB3S0Ytp+l3aK1hjwGcMMVjpPTTj55P8JcqIBcK88jND8siycKF0U7Ch8xvk9fM9ODOOvQ
	cWqHwNQolapKy0CNLcdsnvJpN42KUCZKTS5fj9bcl8/rykE8yhyVs3FMFncn/6G7PkWN4pQSuug
	84VBrPZyxSFbWfqrTWR5bc4qdCvVXnjxiD7/24g==
X-Received: by 2002:a17:902:ce83:b0:2a7:99c9:1086 with SMTP id d9443c01a7336-2a870e18d55mr83113035ad.47.1769685249827;
        Thu, 29 Jan 2026 03:14:09 -0800 (PST)
X-Received: by 2002:a17:902:ce83:b0:2a7:99c9:1086 with SMTP id d9443c01a7336-2a870e18d55mr83112865ad.47.1769685249313;
        Thu, 29 Jan 2026 03:14:09 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4153e4sm50783985ad.39.2026.01.29.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:14:08 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] usb: dwc3: gadget: Move vbus draw to workqueue context
Date: Thu, 29 Jan 2026 16:44:03 +0530
Message-Id: <20260129111403.3081730-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PIVEWxC3mq9J7SqDmG8fHM-wQpAyPK92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NSBTYWx0ZWRfX31nuGNLSfzQP
 r47zDjXHt38ubRK1O9QgQxPnbdNTSEaTe68oEnYXe2/iMQ46GtaJN1ww9h/YuBsCUb6BQafjdff
 wu93iyJTdwux4HVQp+5giVxF1x8Rpan+L7qB9Bw3SsqIc+Qvs21yoNPff4k1u7BGhgl78QQ+Ck4
 VnTlufs461O7G2TfCp6au/cZht88bs1RZJGcUMFhIuXl+nHfniAQRIC175DYxVvkGZoQpAU1y2S
 Cv90gHCmH/VWLcOGoCu0IBwpBZbEaMBBnUJ/dGC3JPtNcQvlvxURpoNq/fICTRn0M0OaPEr5Nzy
 fiYFE8aueFZ5Ft/SKtR+0m5IIRGGKKYigI88M488pz5bLbNRUKX0JMhqG4jCFvqQ6ZimDs5I4A4
 /QWufRPfU0OqurpVTkAY5D4MwP72rILAMhCIFy2Tmbjttb7qfgDAkKrET6wb2ent5x/+guNH/ee
 MTHzP13iPQxjwK/XgLg==
X-Proofpoint-ORIG-GUID: PIVEWxC3mq9J7SqDmG8fHM-wQpAyPK92
X-Authority-Analysis: v=2.4 cv=betmkePB c=1 sm=1 tr=0 ts=697b4102 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6A1mROMnV1P-AVbdKekA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32908-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B61EAF7FB
X-Rspamd-Action: no action

Currently dwc3_gadget_vbus_draw() can be called from atomic
context, which in turn invokes power-supply-core APIs. And
some these PMIC APIs have operations that may sleep, leading
to kernel panic.

Fix this by moving the vbus_draw into a workqueue context.

Fixes: 66e0ea341a2a ("usb: dwc3: core: Defer the probe until USB power supply ready")
Cc: stable@vger.kernel.org
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   | 19 ++++++++++++++++++-
 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c |  8 +++-----
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f32b67bf73a4..c9af126b9695 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2155,6 +2155,20 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
 	return 0;
 }
 
+static void dwc3_vbus_draw_work(struct work_struct *work)
+{
+	struct dwc3 *dwc = container_of(work, struct dwc3, vbus_draw_work);
+	union power_supply_propval val = {0};
+	int ret;
+
+	val.intval = 1000 * (dwc->vbus_draw_current);
+	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+
+	if (ret < 0)
+		dev_dbg(dwc->dev, "Error (%d) setting vbus draw (%d mA)\n",
+			ret, dwc->vbus_draw_current);
+}
+
 static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
 {
 	struct power_supply *usb_psy;
@@ -2169,6 +2183,7 @@ static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
 	if (!usb_psy)
 		return ERR_PTR(-EPROBE_DEFER);
 
+	INIT_WORK(&dwc->vbus_draw_work, dwc3_vbus_draw_work);
 	return usb_psy;
 }
 
@@ -2395,8 +2410,10 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
 	dwc3_free_event_buffers(dwc);
 
-	if (dwc->usb_psy)
+	if (dwc->usb_psy) {
+		cancel_work_sync(&dwc->vbus_draw_work);
 		power_supply_put(dwc->usb_psy);
+	}
 }
 EXPORT_SYMBOL_GPL(dwc3_core_remove);
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 08cc6f2b5c23..052fb18c6b5c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1178,6 +1178,8 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @vbus_draw_work: Workqueue used for scheduling vbus draw work
+ * @vbus_draw_current: How much current to draw from vbus, in milliAmperes.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1413,6 +1415,8 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	struct work_struct	vbus_draw_work;
+	unsigned int		vbus_draw_current;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 9355c952c140..03d8a3a151e0 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3124,8 +3124,6 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
-	union power_supply_propval	val = {0};
-	int				ret;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
@@ -3133,10 +3131,10 @@ static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 	if (!dwc->usb_psy)
 		return -EOPNOTSUPP;
 
-	val.intval = 1000 * mA;
-	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+	dwc->vbus_draw_current = mA;
+	schedule_work(&dwc->vbus_draw_work);
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.34.1


