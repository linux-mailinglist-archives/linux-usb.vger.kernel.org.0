Return-Path: <linux-usb+bounces-34360-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KcaOEYvr2mWPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34360-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:36:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48866240E7F
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28AAF31087D2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D93241C30F;
	Mon,  9 Mar 2026 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VamMzwDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvAoScaM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3DE36C5BF
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088429; cv=none; b=hKAV8gEulATOQVm+SOpU1OG437jx1zAT0MSkzAH4fbaIP7YmmDTJ7DsDwPwQQ1YlLWInQ9ExLgzgU3hZDlpSUG82kNhYvFMef6LO4S9yYaB8KXm2kAy7op82I+22qf330g6vsTKwuIuAZlURsb4HFQpF13FV7fZWEMp5FOmdcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088429; c=relaxed/simple;
	bh=K5zCrwyUodQrO/S0E+Ed2/TLcRf4SRw+FFja5CQCvCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aMJVcH3QZ/0emaULGh7cPyAAMXD85RBkuGWlTQnime7BP+XnAAWUlqwW/JK6MGG9p28rtTpOAGLsxnN2fgC+i+Y3cdxbjB5VkY53E6fASjbAI7MsJo3ZWEAQMH2H+6UDJwvu71PL662wC8Pdbb74XbR8fqGW7N/bw+ezqAO0X24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VamMzwDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvAoScaM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC6j33280642
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tv7zku8qccC
	AqWcffUyfjdmURlu+0i433EEONBaxuaw=; b=VamMzwDA4934SEWfsBbgJPTLxAU
	m2+5vpQON3WbyzlrGRKlFK7Z/2FbIxML/TrQ9Fd5wlld8FlXd8pKmC8vZ6GjwJ/N
	VM7nFtK5tUl2soDLrGM67xObgukCVoygvsgIqSJeRIWlsIZF+iphSVy4ndvMOkn7
	zJKD6iIqh0DXFJtMNyfqv20xzzYzRg0bN5bl3OG0PWWcZ4+O8EwlAlK0gKhqP+9R
	tJH2AMIte3/KqJdwWwKT4TkoQut07ip+Rhe2u3mmguHfIwXdEbnqade0EmTKuxgA
	4lxQ7nSgH1/Izf4gx29C5NqvWD52kWb5b1vz46JrQyDcejRl2XYkhgtvMbA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb50f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:44 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d74ab502b0so7424594a34.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088423; x=1773693223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv7zku8qccCAqWcffUyfjdmURlu+0i433EEONBaxuaw=;
        b=WvAoScaMRDaZzX0ubVDr1DU7NFM05AVQM3hHAj3PD3V3Z2QybuojE5ru4/ehAyMkRS
         sZ9mo9wax5CNF3+ZTsepQngDC0ikuOOAb1bf4xBHwJ3RArl+j0ZwSbgfrVeARPuGoELC
         71un3YGwVpQrjEmneCWhnfLRXscDqIxeU8vVttjwnU962p2J+hk52EWxRxjf9n5Uca/w
         oTboU8LFdyMHs/pktYDQR6lfj4tTxlDBsAeamOlxMut3p5rzAXY1PkobhxPF1KeeIWZF
         hhivFdGovXc/+lmZx2yDTsE9lkJPEjS5E+25YyJrVgiOOkY7vnzPwp2fli2d/A8WzW9u
         3J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088423; x=1773693223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tv7zku8qccCAqWcffUyfjdmURlu+0i433EEONBaxuaw=;
        b=JUlJ+8rfcdR6FxAo7POtUxYOAqqjWWGGvqfUr8n68HbBS4P4yUluk8GOHdiWuHobdE
         y0+64UpckbOqdkHCWI7gVYzqlR/KSX0Pch/Rf/UV47Fkwx+OhmJRuPx0n43//2DNHIDA
         PcgpSxwN9awG+NJiriNoUOaT+PzxqhcDQ65+4oPDC0Kgxyhao9i5Kc0XB9SY5Q3PmuP8
         lPa6hmURKoy2gzusDlrDzPcSFg00/iddymZZtG0LE5MjENVxOK8VwGtY2OB4AH+KrJ6m
         pBHgLav9fQ/WbCD1+ylBD+U7O1IEdeeXVP0bRFzbuPmjel0Pho0ii4mn7HHEzdD/+7Ia
         8Guw==
X-Forwarded-Encrypted: i=1; AJvYcCUpAwtlRpuRe6GJpXH++rEyo86vSuVKdCs4nmDog5SISOpLW6iBixFE+ypRqv2T3IaK+qkhBA3oAtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRo2y30cFCF7gSMJd1ld2PF9YjG753oHdh7fjjMC5oFdfSI6I
	zShOdiTPPhzGjnusBRgFrA9I4HdLfwpkeaJdq1vNATp9moY/MkXlE7tTZBI5mGiMfttusuP17wY
	0x7WNOqkyNhpGabaAyyI3Mj0psUyaC92LXTWCbpsM7dUsGdHp7SNG/7Of+yKPgXM=
X-Gm-Gg: ATEYQzxVQoFN9ymKaXqRC/I8bOuIVLgBRA4ObjTOv1oOlnzToeFl7976NJXBCD6LDgp
	CQkhgVRp0dkBRlK9sj2SsZAQLuYpxOtZiSHzIik8pXQVzs9XQXs8VTCfGRKFfT5WIzaI+kInoEM
	B0eqT+zcO6L0fQ8sEiGOrxGyrX56EtDflXw2sk7hPlBxR395t497eWdVt4900oqfMvRAXA8zVE4
	UYwABbNSwqUJw7Ptslz4uMDm2mrQ7OzdVlu6uyq4N/0N98fWeTC3e+HCDpnsB9z8Nj2Yqyp8N9E
	2oU1a1GFP87YemrZdxu0qZ/HI1FhvVPLkW+2a/o3nxe5fwwzuj/+z+gR2ii4WHRN/Pf1B6BfCOM
	Av9FM0kiQfH62w2TxrUWa1AybuSNM38rC3PTfGYdtU/FX5gjYp8+/ieWAojnMuhEbisUI1mtzx0
	s=
X-Received: by 2002:a05:6830:d18:b0:7ce:2b34:deca with SMTP id 46e09a7af769-7d72705979fmr7317832a34.28.1773088423470;
        Mon, 09 Mar 2026 13:33:43 -0700 (PDT)
X-Received: by 2002:a05:6830:d18:b0:7ce:2b34:deca with SMTP id 46e09a7af769-7d72705979fmr7317804a34.28.1773088422943;
        Mon, 09 Mar 2026 13:33:42 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:42 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 03/10] usb: misc: qcom_eud: add per-port High-Speed PHY control
Date: Mon,  9 Mar 2026 13:33:30 -0700
Message-Id: <20260309203337.803986-4-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfXykQ67PF3FjMv
 nj3GK4wM28fR8yq6o0BrjP0hTQ4AS7AyGGf/uvSqw/t9ZZeEHy169J95yjHbz5KDKQWZhaELFUk
 t706sFQF8bME/Y+E2lUicr+01Sz2OL9kL/GGLfBYg+zOA+acEiyU+jPUbqe0YkYqQLv1iStnGhM
 yHyjBSyEHCBn5AIwwmFu4op/6rFgkxtGEwA0BOL8MsuJg9/qg1IaavNDlUpht6xWJj9kIT+BFsP
 Jm4fGh1cqc22c54KfpgCwShHlnSGEXRpNSPv6X4RYEzzFnqhDZkTSa2HmMdByjpDWr20Z9MPwgc
 S7jpfvrzhw9Ivqx/xcP4mzgi9SF9o6LJYm3PaPG0HEuptHh0oo6g4rhijS4YrYp9vcFCCEoC7YB
 7rKq6LxMdXCMNRvuVvxWJ2TxaB4UMyE+u/XEwnKisPTCB2jMSkRV3Ai092yDAVlPO/6JZfuzWHm
 gfyl9p8DRuM6EMDyluA==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af2ea8 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=U2yq5S0A3DoD2uQntOoA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: p1xYg62F2KRMuY0bHdUBauFnND9vJ1i0
X-Proofpoint-GUID: p1xYg62F2KRMuY0bHdUBauFnND9vJ1i0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090182
X-Rspamd-Queue-Id: 48866240E7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34360-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

EUD hardware can support multiple High-Speed USB ports, each routed
through its own PHY. The active port is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active port. To support this
multi-port capability, the driver must manage PHY resources on a
per-port basis, ensuring that the PHY for the currently selected
port is properly initialized and powered.

This patch adds per-port PHY management to the driver. The driver
now powers the appropriate PHY based on the selected and enabled
port, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-port systems because
the USB controller kept the PHY initialized. However, EUD is
designed to operate independently of the USB controller and
therefore requires explicit PHY control for proper operation.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/Kconfig    |   1 +
 drivers/usb/misc/qcom_eud.c | 103 +++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 0b56b773dbdf..2d9190c756f9 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
 config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
 	select QCOM_SCM
 	select USB_ROLE_SWITCH
 	help
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 1a136f8f1ae5..b042e01c6ca2 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -37,23 +39,75 @@
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
+	struct phy			*phy[EUD_MAX_PORTS];
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->phy[chip->port_idx];
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->phy[chip->port_idx];
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -70,6 +124,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -132,6 +188,11 @@ static ssize_t port_store(struct device *dev,
 	if (port >= EUD_MAX_PORTS)
 		return -EINVAL;
 
+	if (!chip->phy[port]) {
+		dev_err(chip->dev, "EUD not supported on selected port\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled) {
 		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
@@ -224,6 +285,35 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int eud_parse_dt_port(struct eud_chip *chip, u8 port_id)
+{
+	struct device_node *controller_node;
+	struct phy *phy;
+
+	/*
+	 * Multiply port_id by 2 to get controller port number:
+	 * port_id 0 -> port@0 (primary USB controller)
+	 * port_id 1 -> port@2 (secondary USB controller)
+	 */
+	controller_node = of_graph_get_remote_node(chip->dev->of_node,
+						   port_id * 2, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for port %u\n", port_id);
+
+	phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	if (IS_ERR(phy)) {
+		of_node_put(controller_node);
+		return dev_err_probe(chip->dev, PTR_ERR(phy),
+				     "failed to get HS PHY for port %u\n", port_id);
+	}
+	chip->phy[port_id] = phy;
+
+	of_node_put(controller_node);
+
+	return 0;
+}
+
 static void eud_role_switch_release(void *data)
 {
 	struct eud_chip *chip = data;
@@ -243,6 +333,17 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	/*
+	 * Parse the DT resources for primary port.
+	 * This is the default EUD port and is mandatory.
+	 */
+	ret = eud_parse_dt_port(chip, 0);
+	if (ret)
+		return ret;
+
+	/* Secondary port is optional */
+	eud_parse_dt_port(chip, 1);
+
 	chip->role_sw = usb_role_switch_get(&pdev->dev);
 	if (IS_ERR(chip->role_sw))
 		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-- 
2.34.1


