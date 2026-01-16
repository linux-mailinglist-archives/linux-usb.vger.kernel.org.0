Return-Path: <linux-usb+bounces-32439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5318D389D6
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0593311A419
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF9F32E690;
	Fri, 16 Jan 2026 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LESjgGBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efx8bcmg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3A31A065
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=hqQPwbw0j4u6nV4gYkNsR8wLFovsI+WSj0nJTBs4Q8Ui4yYUY5sAMzkv+WQWfXVyCdHAvxtD02+gP3tvoqXYrErNkw5qyABXAi5gfGNWrVVKx4STonf0EZ0JkjPsyh4yxj/+4H9nhVCrOUlws74LpQzqTHhRhUgf+QzoqRO4UL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=8QuxfXdYRJcE3fyNR6NyT4XaseLCItGHgJZH0P+Yloc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lf6ZMye/9DLUu5LjOdcKr6zRK3rQp6PnO56ds8MVr2hZchrmT3QydEAXztykeWQWsuu3nqBB7H9BNV+BeZFgKdqhZ0da2EkOtnIWrr8GJ7IvezyyyCnbqKbMbjlMZnOxpAeQozXH/C9wrGqNMIBKm6cCcWAi8NKlcvRTwO0Vzaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LESjgGBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efx8bcmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNCwpe2527067
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VKaYciJerw3
	mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=; b=LESjgGBP0pE9vVf52fp90RjyhCW
	O6kYko17U4C/ld6zZfgoF8vrFbt6EQE00tglK7nQeMDuzc5xfgROjcQEjS0CJRwY
	0FrVBVvJ0Zmr/keyabSVifr2YNaakqwbnZMqa2JAZYL5HRDq/Eb2FoniearXERcx
	DrJuf93gel1dBDWnlxSgfr3aFsFomj/m29yFUZKja88arriPa/vE3b/Dgvdj4jdE
	07qiReXSajxmwJ0bAgf5xdnTNAhjJtnlH1uerZOI3+/oPEcYYG1AlYNmul6P/zSe
	AK6F1vY0Gck6GdVdHX+tt96zml+sPG/NO481dEG3m5AVH3ORd6TxdRaN21g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvevgbdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-123840bf029so4797793c88.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605671; x=1769210471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKaYciJerw3mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=;
        b=efx8bcmglPgVIQ7+yCUOk36fdpSZD9zeGEvbolxXxbI7fXJGw/d28eWvZuQQpDHKpu
         QcDcjPLKofFl4GkRy7m6/r0WpzSFl+C4tCHMJtZ62frGvhvYqqAdWOadhVaLlqNo3/un
         iQQJyAL3YlLByK1ryHSw+0zwI3Fx/Lx4D88TX4k3DWrdJXnuzCQ0fLJJmb4y748F3w/O
         VPaWDvQPHpGC2D3LAvrk3V2Zn7+gPWLMWff24HSImWqRR2l+H72XGCr8+8q+c2Wugc/q
         HcSkHcPyw8SCKqP9IbfOjSvdnJvtP5+rJCJODjrSM3Gy44RmeUP3SuyMD52qRyaTzfGI
         r8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605671; x=1769210471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKaYciJerw3mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=;
        b=Mg6Fag5g0w3IJqCndITo6gf2KVC/D3aAp/QzrcZ5snScJQB+Vo4Bpcr1LsNJPvclx9
         K9VF13TnwFCFM/7JfkqGO4UJzlFgqlMGp3X8m5MBS0Awf4LtjkNp42HfEZXDNUWdt0Nw
         /TwDwta8knAOnnKkQdhVFDI/Ib3MujWhZ5uYQVPNAxPWXPkqIK+juRUc8lNjGYljZTgZ
         xiQncFWgdVl+72BjzWRjEqE6FDTKROsZ0P9K2i49+9tHnlLCAEDflL7BGKyCDN8BqRu6
         Tu6dcejpJ1hosIfIN+pD7wFBHKcotSRFhjF3vO6o5dnbJ5+DKiouQpB6vM23b9a8pZpv
         hkxw==
X-Forwarded-Encrypted: i=1; AJvYcCXMppQkUUrQ58XgWH+46X2VSGs2IL9+dRgN4urivnLY0ZsD46ubaPNK38B3PMrEBz6FqbEJaN7S9yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtE+YwMOwQGVcYx/Hy1C/VvbXckeXjr1rO+VRdPdPHoJy5DI9
	FOyrEaLQ72A0aOmtONyxWZfArarYB+C4EERsfeh69A3WKrcjTwhirb6nlPimsYycH8oKZ9pTg2r
	TC6NXUqZug2u/sE92oGVmtQMMYy8r6wCiyO2uLg+u+WjuBdBzkIv0Sj4xyJkwLiY=
X-Gm-Gg: AY/fxX6zg6l1FzxhWlMuuiU6aaxnkpQVrvxBacZ9fgM9aY9B213BjvGhnmeOW90UIMp
	UwFaqKNQ93qd7tVYy3VUF2mSfho5+vkBVHsmS985uNR1ZSCoSJyseczG5PBbiPsU+eczYZRAcMD
	CqPpfpIt0UfycLAS3vJ+B4aTSKrefK+rGi2f3lBJFy2y7nadISenLC49Xpfb4LGCwY8l4+VvrWg
	p5wc6+se4VayeO+b+dWNcvtnkDa0VRNZMcqMOr6aJRY8W1STCsoyA2qccbxW8Hz522tv6Lsd9JX
	NeWTVgI9c1QG9SOP41c2bg4mxI1FTgByajKiFdbczpwVaye2MOWgrezOVNJ4iYxJ619eundxxzQ
	t1Ltw6d+rtrf9WTwwN3HRse9La6D5oXM/9D9axPCysqj/pOJTzO/MR/3OxqxkFn8=
X-Received: by 2002:a05:7022:2397:b0:119:e569:fba9 with SMTP id a92af1059eb24-1244a75ea44mr3688681c88.24.1768605671318;
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
X-Received: by 2002:a05:7022:2397:b0:119:e569:fba9 with SMTP id a92af1059eb24-1244a75ea44mr3688672c88.24.1768605670731;
        Fri, 16 Jan 2026 15:21:10 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:10 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Fri, 16 Jan 2026 15:21:01 -0800
Message-Id: <20260116232106.2234978-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX7cflaW6ePyAj
 yoVyWXD2l+Br15QHcuuX9A1PsLKW7X59lw0LHpAUNjHaR8GERVzAcWj8iR3RZJ465eRD+0PAKjv
 n3JhiJVS5SQ2p/IuHbHRxCgsq9/AOODQg7oqpe31IEvqccSZBtLssYGQ7MEZzM5kSqNL+1y5xYK
 uXZmUAh7jCpItlJREWRIUn75yZgGCQLp2XcnsF/TR0AayJOWsewPqUBRR7fIOX4vgdL1poRbI+u
 9Ri/MV/e++oYW8032N1yVS8V1iFKJIzkGUoSZ27nXt5X6nDCwGQuahZICYNofAXIKBgxINQR9dL
 l/mbhrDi+77R0R0i/TBwBD2qNJfMsx5cSIJx91dQMxV0uvS7KG0SCrG94Z1IJj0In6n6PGH8Y3E
 T5tJxBWbCPd8i7c/Dfw2wNsbB6+iUuXbrYoP8ZAB3IR2wt2ifP6x8jWro3To4UMfanMQg3D28f3
 4ZJcFLA+fMpcVPEs/Yw==
X-Proofpoint-GUID: pEBAXDJkDe5o39EosZnNoXRxrfNADZWM
X-Authority-Analysis: v=2.4 cv=faugCkQF c=1 sm=1 tr=0 ts=696ac7e7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_OGk7KolV25BrENr9Q4A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: pEBAXDJkDe5o39EosZnNoXRxrfNADZWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 80 ++++++++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 5cebb64f4a67..a58022f50484 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -38,12 +38,15 @@
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -129,7 +132,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -287,15 +290,21 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+	if (!path || !path->controller_sw)
+		goto clear_irq;
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
+clear_irq:
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
 	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);
@@ -303,15 +312,45 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "Failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
+
+	path->curr_role = role;
+
+	return 0;
+}
+
 static void eud_role_switch_release(void *data)
 {
 	struct eud_chip *chip = data;
+	int i;
 
-	usb_role_switch_put(chip->role_sw);
+	for (i = 0; i < EUD_MAX_PORTS; i++) {
+		struct eud_path *path = chip->paths[i];
+
+		if (!path)
+			continue;
+
+		if (path->eud_sw)
+			usb_role_switch_unregister(path->eud_sw);
+		if (path->controller_sw)
+			usb_role_switch_put(path->controller_sw);
+	}
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {};
 	struct eud_path *path;
 	u32 path_num;
 	int ret;
@@ -342,6 +381,32 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 
 	chip->paths[path_num] = path;
 
+	path->curr_role = USB_ROLE_NONE;
+
+	if (!of_property_read_bool(np, "usb-role-switch"))
+		return 0;
+
+	/* Fetch the USB controller's role switch */
+	path->controller_sw = fwnode_usb_role_switch_get(of_fwnode_handle(np));
+	if (IS_ERR(path->controller_sw))
+		return dev_err_probe(chip->dev, PTR_ERR(path->controller_sw),
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+
+	/* Create a role switch */
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		dev_err(chip->dev, "Failed to register EUD role switch for path %d: %ld\n",
+			path_num, PTR_ERR(path->eud_sw));
+		return PTR_ERR(path->eud_sw);
+	}
+
 	return 0;
 }
 
@@ -359,11 +424,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
 		return ret;
-- 
2.34.1


