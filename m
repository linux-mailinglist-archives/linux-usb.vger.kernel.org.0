Return-Path: <linux-usb+bounces-33027-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN6INAaCgWlNGwMAu9opvQ
	(envelope-from <linux-usb+bounces-33027-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 06:05:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E2D489E
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 06:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0353B30431D8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 05:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBBA2580FB;
	Tue,  3 Feb 2026 05:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YprlHWMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JknzXY7c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF31A2C0B
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 05:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770095091; cv=none; b=Dqk4IgU3495kB4pt4364CTCvJMAwAZfw71fpJiz1CGxYSHb/nxQmZosbCsWeGlN62X1UULiibmQekvBY2kmxKzviUvJV8A7GfocPg3zhCe9i4ymd2NmhrrO3a38/TRs+scNuvDm4Q1+sgIxJ/L78cq9GtUpx8t3cvTpkltsrEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770095091; c=relaxed/simple;
	bh=83ugOZc3NG5Y5JWJr4sNCIXpIKfA86Iy/3wrXzPzWCI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DospY3qS+60enKVcG/dazj+siY+qBCVlCvYsgYP3QfizZ97ND+SSRJEVwqsMJieQgBXrrtrYm/xKbqzkSDTY0QlqzIYHJUiwZKBDlTmz2Y2DfhPf0Mf7Fx+76WcSb9tWChfyPGEawJUxRiQiG/h5o3XV0boVi5LLePgQMsN6J8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YprlHWMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JknzXY7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JP8NZ3916029
	for <linux-usb@vger.kernel.org>; Tue, 3 Feb 2026 05:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1uXrS+fqCpvsKh34rTFsdql8DjvfOnGN234
	mAL9FJiQ=; b=YprlHWMRFoXqSf2R1YAzkV8LPjTBKSrStCcsXNK1WOtzrFAdWzw
	bsJNs2+W61FuekCmCeoIU+ZC/nY1xVZc51QkTXQ5yFziABFWCsF6pXrAI0Meu6Q0
	Q13LA2fJIB215ZuM9N0DusAAw/1ZQBQJKifZ65r5UPzPevGWpq0EMVbmHbhKAFYQ
	9bki2ZQGDdx8zGG3MkyzMwiN4WhLIqFECAi4SRFQYaolJ6NdiBfx6B6cRebSSeR1
	zUaXnL/9wjy0w4Jn7xBrt6TnegR81nkLt79+WfAkqq0dLwAP478xbXB0W1BOWu88
	yBZzYfklcxEKUTs4cpGmXVKkLy3rnWaWEEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmjy68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 05:04:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a755a780caso3659715ad.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 21:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770095088; x=1770699888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uXrS+fqCpvsKh34rTFsdql8DjvfOnGN234mAL9FJiQ=;
        b=JknzXY7cc4+YMS+PhSWCPv2s1VkYVwBpjoUrUbe9SEA0N3lgaPJMzCr/ynWpzuXdGZ
         oNUnAF0TPWqujx3Yw3z7so2LfYzyyagreewYmXwzwreLoAcbYvaFp/O0UTH4wnCsXpDj
         eqSmoOMNuJcTPxPRLIahHYec2QKtTt8XTi7D2bWfxQJ656Nxmw/1lV9tmNAbPwUMQJLE
         BSS/ra31qWmz4dPvKkTaCG+US3fL9MAy1+ImvxA4PAArMvcO+JSCP9l/sMAuG6vIquC5
         aX5gDxTV/ZeA5GnSd0cfYHQs6osLHB2pPKMjM+zaL09JriEZ55kFIqhhVcp8BmHucqz8
         WurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770095088; x=1770699888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uXrS+fqCpvsKh34rTFsdql8DjvfOnGN234mAL9FJiQ=;
        b=vmNzIwZlTuz8gtsrtwX0JjncY31V0D+ZsvYttbt0RavTJ7MdAso5R4iWX102+paJiG
         xXlQF3FKP/ZG5xfnoHpFeL7tvKB6o5Xk3iEhEVO38qePM3+A+4fTisOAJWcAr+vD46FZ
         Fmsrt2VzJ/gBEUo67+xmkqUkoyFvHGnldrDqrqb/6HraO+seBUs1QvuESPizL1yx/vwq
         IhgG+jS5wn0rhlg49d9hy17zRj1Mu1xE6tPdeQwUKTjSM1kTdT3Q92a/0HoXscFE1Sj7
         OMZlHgbaoVTUB3845S4P3pdXFmxrA5cfAqnn1RvyGIW6GlnGK+zF4QfeUvh2UoU2aHno
         iVOQ==
X-Gm-Message-State: AOJu0Yx3PniQDPaPTHxa4d5gTBQxXe/K2HdpHwXV0OWuAE/C3+II49tA
	N4r29MyMOUreT3durQn3xroqGzmiojveGBmBXwsRKYVQzaNfXRTj/+/bTGSeQvkILzheNA6RQdK
	qC92PcXOMRUn/o2a4i4/b3bq3p3KOWET+5faDdpKkxDycCqv1eAu3tKuWdYpF63s=
X-Gm-Gg: AZuq6aIZhgI+Lw2yfwdEKtRL5fd8v6Chg4Gom8X/MmSozeJOswEns7LciGAOPjFkX+0
	JZxMgcoU5bS4gQBSPcarxGlAk2rR9N19TQfIzIkSvZZnqEm7hbCJHIEeiHF7Jbw/ETfBzqnvvfL
	w6znSnaAHQvyibsCkpfi81eCDUQIHkQoDb7tf6RG6MSl6Ml3wqmUR+lVXkOJXbclAh2QZr4WSko
	Api5Gpgc2b6tuiA4PXVHHSFH73wx2dfGpo45UrwHQ07J9T0J+uZkxciqCGLEMxUK4IJurAcQPyw
	bK8+nP+3FnCzKSpVES638Zd+eDWHWdWQ7kNxok4ivZyDc0th1UWCUxKO9c8nuqOlgIJACUf6a5Q
	OJzsNGu/KoseT71eczUrzjeKoXnjbRGxzpiMBEQ==
X-Received: by 2002:a17:902:e851:b0:298:639b:a64f with SMTP id d9443c01a7336-2a924595003mr18937935ad.6.1770095087519;
        Mon, 02 Feb 2026 21:04:47 -0800 (PST)
X-Received: by 2002:a17:902:e851:b0:298:639b:a64f with SMTP id d9443c01a7336-2a924595003mr18937705ad.6.1770095087041;
        Mon, 02 Feb 2026 21:04:47 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e55efsm160911265ad.89.2026.02.02.21.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:04:46 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org,
        Samuel Wu <wusamuel@google.com>
Subject: [PATCH v2] usb: dwc3: gadget: Move vbus draw to workqueue context
Date: Tue,  3 Feb 2026 10:34:30 +0530
Message-Id: <20260203050430.2211487-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=698181f0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=sCfbRl51OHjYAUcMWzoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: PXKqmig49FmtAnblkA7vcCw5oxPMsYR7
X-Proofpoint-ORIG-GUID: PXKqmig49FmtAnblkA7vcCw5oxPMsYR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzOCBTYWx0ZWRfX96Sil9hQQj3d
 4fIJGFX2i+PmmG2yo6BFkzGyArWjmU2ToOz+9jXVafe3ZfqGnmmE+wqNMscsfp6htRx5nZKivNd
 JuCo47wZkxmFBtFD0lemCygrhmbJX6s0obfJiwDZH1d8NOV7BFH6a1YoF9ujQtBuoJDQTtgOJWH
 MuXaKXUrZ0ud2DtvJw5MUGtbmh6KOT20nh0kQI2KVoM+CZURk5bMdZmmuaQ2YfopXmoEsVBI3BH
 XCfgfs3mWou5VcNqblAQbEpSvyJCn6mprrJ4SW/4BpVTtpsTjoDtFPGR4yLNvdSF1bPfznHnlxV
 JbhSzGw+MjWcKgxlbIKtxJqYmSxMqipnDxZ8Hh8BpBikJVnNE4+gENQa70xU0HeqNRlRWP0bUkh
 6yYmmccS+pvN4hJgA+AdOq+duDY2drvq/uzk8meAgn5GQy9GIHUPYC4s51INbhKNFVmMYBzYhpv
 QUDP7R4S9Dnft6WDyyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33027-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 949E2D489E
X-Rspamd-Action: no action

Currently dwc3_gadget_vbus_draw() can be called from atomic
context, which in turn invokes power-supply-core APIs. And
some these PMIC APIs have operations that may sleep, leading
to kernel panic.

Fix this by moving the vbus_draw into a workqueue context.

Fixes: 66e0ea341a2a ("usb: dwc3: core: Defer the probe until USB power supply ready")
Cc: stable@vger.kernel.org
Tested-by: Samuel Wu <wusamuel@google.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Changes in v2:
- Renamed vbus_draw_to_current limit, and rearranged the new variables.
- Link to v1: https://lore.kernel.org/all/20260129111403.3081730-1-prashanth.k@oss.qualcomm.com/

 drivers/usb/dwc3/core.c   | 19 ++++++++++++++++++-
 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c |  8 +++-----
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f32b67bf73a4..cb5e829aaae8 100644
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
+	val.intval = 1000 * (dwc->current_limit);
+	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+
+	if (ret < 0)
+		dev_dbg(dwc->dev, "Error (%d) setting vbus draw (%d mA)\n",
+			ret, dwc->current_limit);
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
index 08cc6f2b5c23..42cd1667a91b 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1058,6 +1058,8 @@ struct dwc3_glue_ops {
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
+ * @vbus_draw_work: Work used for scheduling vbus_draw_work
+ * @current_limit: How much current to draw from vbus, in milliAmperes.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to array of USB2 PHYs
@@ -1244,6 +1246,8 @@ struct dwc3 {
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
+	struct work_struct	vbus_draw_work;
+	unsigned int		current_limit;
 
 	u32			fladj;
 	u32			ref_clk_per;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 9355c952c140..8562cc358694 100644
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
+	dwc->current_limit = mA;
+	schedule_work(&dwc->vbus_draw_work);
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.34.1


