Return-Path: <linux-usb+bounces-36825-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGdcBgTe9Gn8FQIAu9opvQ
	(envelope-from <linux-usb+bounces-36825-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:08:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A262D4AE567
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7BA530498CE
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F19C4218A6;
	Fri,  1 May 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikgjItW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2krYwRt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09344218B3
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655205; cv=none; b=DnIV+WU9XEfa12kNxa1SnHO1cNja6IuPtD6sNV0vJwuRILAWitaByTXn2bIeh+EcZdbYQ8TY3suIH75bXrnLzneHk7r7LopiOSbhX3NNnN3GCbsNu7U7k3kchaYXoFQTarCavUMzjUl6tb7Gn6GDOR/hytAIaZ0OjxcAFX1M5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655205; c=relaxed/simple;
	bh=2vWMBTTCgHzaxP8XjeM/vaujyh3P+bvBSvyTQjbeOZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jYW46LoWQeWLuROfSDAqc8gPv/QjVR2NZIRAnFIwkraNr6ji7hBrzTGD0RcSXwclBK7G3pY6WiA7nbBonexRBnx/fKqSo37C99YULKEEDf2D7hpBGvcR0wI9vMgsA93qgxCBTbYEm4OslhC76n+IE5bZtQsk7Sef/AtBRtMVImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikgjItW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2krYwRt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLnxh498460
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3CNdC0e3Md8
	bYeWXZIY6PP7X3JYtt0X4YEwWO24BnJQ=; b=ikgjItW07aAOUm0mwXkWQX+hQC1
	1h93JWUsEstk64rsmGIQgeffkxTYByDpa4hDgkCgWyvTZJHbc+JdQpH7U/f3p1jw
	OF3iHpM6nD6cD6Bzt3cQlwBWXF1Ck0FbUFWaHCUNb/sVYa5N49gGo2nN93JxCTxe
	9C3jfBuNp4655Yf0RrmFV1gHCooWTZ9xHaC5UK8wHXqL1inwpmh+5vRbX1kv9ykL
	Rog4Ywnqd1vdhwpg+2RbbbzXweEAYZq9HVG5MwE1Bsfmc/M83YMovulcSdacL7Lb
	S+c9RLNya8XMg2Bd4yAcJDxH1PzFEtYXxjKfi76rafe6JfYj26R+FNIERcQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbc2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c35f2c09dso2904976c88.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655201; x=1778260001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CNdC0e3Md8bYeWXZIY6PP7X3JYtt0X4YEwWO24BnJQ=;
        b=b2krYwRteki3UnSlDXo/Z4Xmd4KFtIN/a/tYM7oAfOD1/ZIHSFA4mpAd3Iadf1chVI
         g2hGZW32NJt60+3n4IpxyLp0Lw8LiN7ZgUvVYFeo3F0DWUGvIyH6X15EROJF0u7Tyw3q
         Q24FywsQ0F7DlcFiyZwjNGnDoilNwnN2+KqyuKv5YC1h5x9opRDjV7aky+zRJbk7syxu
         gZmC1H6Osdvs9uwkOZv+TOIOVP2CIsL6r3BdpBtEv1PUvQf53UjNTqDqAswYXUh97Z5R
         Kpmg9bLqXZG9YDPGKXnlnQ78S5WmjuBdfCvmCGdrpfPA8sEjTfqo+HoKZNz2B7L9HkhR
         h2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655201; x=1778260001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CNdC0e3Md8bYeWXZIY6PP7X3JYtt0X4YEwWO24BnJQ=;
        b=s7Fxv+RYFVi7pazN0TBNdiZD8d3KRAeVtlqG3Wx7CXhygFdphNo+/Ci6EFZzljDfXv
         vyBTjGygzcLFaFOIhkSYL8y7nmTfUbXPjz9uPGGWIGwaYZ0opYeYYN75Mo02BnUgyLZo
         T68SLJv37uCVIvpfJHrFvNXL7IwW1hye4+iewk+XeDqlOTeGQL1dy9amY8xS/fWxkOfE
         7uuIIIxZVts44fDtPD/WJwBx+Lq38u7mVgbe9tQjYizXRBbceTJowYWs3dhMkVWAuzH8
         ermZCpsy7PuAZbZaU93QAbRu1jyAPZF78fTTVj56sAeotg9YO9JChwzJmrcfidP050yb
         ribw==
X-Forwarded-Encrypted: i=1; AFNElJ9AoaKuqSzvKW+l9RORGRebUbN8er53WisWOH4hjearqzURvKndG5xgMtKbupeASejNBngUL/0ZPK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvMtY6WXW1K2WWiqEO/nNwdBvW2UWnSqt4jG5v06ciQcwbZhMT
	ECYFTpnVSaQuman8YbwipNZMTZ9JR9V6VPQIM93B8ewR9f99OJOB6WFO2iiYgs2PsxezYNedsOq
	BGgs7pZxyUQaJXckkty7mrxMxu/GdBB+02Rif4cv8PURIqIxTcXTLyGDH3X0a8FM=
X-Gm-Gg: AeBDieuX86uBXRm1SIgEkQu/zOvIcTspnvVbC2nQ4y2bcuqsMN7XkLSPEmw14me9RMt
	GJXdM+ONKZpkysHF/yFgnIMPWlJCvI6yJoMwly+YUYxMTrUT7niuT57DXEkay5X5ghMh6pAXYuy
	X5YRPJfkJSlXJc7SPqeeR+mVspUF39yqpbQbNOWbYQv+RzfMJFI79IgMwsCQYc65c9kOZnJ5CVP
	VCAGbPeMKxHDmNI1rwRQv8kTgcsHJWPdeumZpjvpsvjKGPV9S2jB0Y28E166TLSCzpudFbcQAo1
	vBwgYas2vDDZt/ZCMykoQefC055GhLA0+FA68Jk46FjoTTr6jO+15x09edgVAbYTsa1/nmAuto4
	wlWnz27F8lwkhD9BW4bveVtMv26QME1ND4o68QAcEotZSO74ERf1nkvHBI/PpnYA7fXFUMR7ONc
	tltOx/FcdSnw==
X-Received: by 2002:a05:7022:eac3:b0:12d:b654:8176 with SMTP id a92af1059eb24-12dfd7ae517mr78334c88.1.1777655201346;
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
X-Received: by 2002:a05:7022:eac3:b0:12d:b654:8176 with SMTP id a92af1059eb24-12dfd7ae517mr78298c88.1.1777655200583;
        Fri, 01 May 2026 10:06:40 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:40 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Fri,  1 May 2026 10:06:30 -0700
Message-Id: <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX1rkdKZ4JlHgJ
 u9LlzO4mQUNla6FVVKEM+DWRwOZeX+YwqDaAShc0pyzvlYIUU+ebF5ogdRQoWzD3moeT71R2NP4
 kSYRrGtEr2GppZ24u36mzDW0unHeioN3WacW0krqtPBSWgudWPQOLzmCG9PWokayr+VRmJDmEMA
 FWjoBe5mPC1K7ApD9PXufZyT48KW7UqdvM/RZfaM+jehkn4aEzs8vk2+Qc5pxAB/rBTPiRyNZzW
 ylorlGW/pCP3/IY1c3QgIMp7LsXWropnT2fedSQJlQtFAMx1VAuHirVnrqHDJziiCTOyfrgzcQW
 FXEGM4dImcTcrVasSC5HaZcUrBUTbarYplivTTixLLYcuSyDf9X3TMt2/IkEK8SNqLXqnYHKJW9
 loT0aGh+IBsr8Ei0jCOV4g5f8xlEnNPOWIDBspIOz7M1kpfcqO5WgObF6cx6Kz9pbZEn2e9jV3Z
 hqHGoWGNZYTcD4fWiEw==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dda2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3maAJ9QWEdykmXBQECEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: es0K5GF_ICisLn41TVX_BzQf55TdCI-J
X-Proofpoint-GUID: es0K5GF_ICisLn41TVX_BzQf55TdCI-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: A262D4AE567
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36825-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[role_sw_desc.name:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
 drivers/usb/misc/qcom_eud.c | 89 +++++++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index a624c44d5d59..7fbb74bf1599 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
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
@@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -274,12 +277,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
@@ -290,15 +296,36 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
 
-	usb_role_switch_put(chip->role_sw);
+	path->curr_role = role;
+
+	return 0;
+}
+
+static void eud_path_role_switch_release(void *data)
+{
+	struct eud_path *path = data;
+
+	usb_role_switch_unregister(path->eud_sw);
+	usb_role_switch_put(path->controller_sw);
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc;
+	struct usb_role_switch *sw;
 	struct device_node *controller_node;
 	struct eud_path *path;
 	u32 path_num;
@@ -331,11 +358,44 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 				     "failed to get controller node for path %u\n", path_num);
 
 	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
-	of_node_put(controller_node);
-
-	if (IS_ERR(path->phy))
+	if (IS_ERR(path->phy)) {
+		of_node_put(controller_node);
 		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
 				     "failed to get PHY for path %d\n", path_num);
+	}
+
+	path->curr_role = USB_ROLE_NONE;
+
+	/* Fetch controller role switch if it is role switch capable */
+	if (of_property_read_bool(controller_node, "usb-role-switch")) {
+		sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
+		if (!sw) {
+			of_node_put(controller_node);
+			return dev_err_probe(chip->dev, -EPROBE_DEFER,
+					     "Failed to get controller role switch for path %d\n",
+					     path_num);
+		}
+		path->controller_sw = sw;
+	}
+
+	of_node_put(controller_node);
+
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
+				     "Failed to register EUD role switch for path %d\n", path_num);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
+	if (ret)
+		return ret;
 
 	chip->paths[path_num] = path;
 
@@ -365,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
 	if (!chip->paths[0])
 		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
-	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
-	if (ret)
-		return ret;
-
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
-- 
2.34.1


