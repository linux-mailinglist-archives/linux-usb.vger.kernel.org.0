Return-Path: <linux-usb+bounces-36823-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHgSNbXd9Gn0FQIAu9opvQ
	(envelope-from <linux-usb+bounces-36823-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:07:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B095B4AE4F6
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22206300C0DE
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044F041C311;
	Fri,  1 May 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQFqB5y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="It/v5CtY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09719D065
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655202; cv=none; b=IMjs1uWEHSkvBtJtBcHUOHz3krk0v3/cYLoP8O3NPx6B+b7RiN7p+d5VE7MKvgtoyFxO0ETeR5F1Rz+96nHxBw+zqloDvHcsKobs7l8GXx0InODkZZJvj0KbAQj0RlmeeaRbk1NdsNh5zIf20MBTA4cMHqLCay1Qxq+WWDDzV5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655202; c=relaxed/simple;
	bh=c6foQKuTgVKrAa7/qWnQsUPiVjjh86lQqk5HwVNHkho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EW+aVCJmIhbdrjvXNdYb3JJJ41pe4L1/6mfoFk7VYa97yjE5b04ePO7gcQMRtoAb6Ch3Ss7LgX6ad1NcOwpZl5X0Zd/lwTtWWF1099sgdxBIt8gqYwhU2e8baw74L1JHlIOZh92lFwFG5TZmwZWmyC6ErXP7Faazz+KDqIrarto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQFqB5y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=It/v5CtY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLXQZ987597
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y1/jMMLEpI7
	VYXMfh+IoS/d8e62Xd13hJ5rETM+Ka3M=; b=bQFqB5y+bBkp7GUE+8iQQVOAO2i
	LdfaILBKWvwvxzeNvjlNWeFfpYgR4k7FlwmryUYky67UpHxFludX3iV9pRFzmXjv
	LFdBeB+wcJgGgWbFxn2fgyIxNyZK1m0wfozCDk3ksRFprbi062mwAjen0yKa74w+
	ANcYj3rr6l01t7djqDYmfvuv4UKyz0JR+2rBjMXAhNbOyzFzN5W5z8G+XPyeIkEM
	BO1WYylnRhOrld6m/v2L8YLsl7DgAl8scQhj33n8kX7++Qyyx1z+j+FQzX0sSrKJ
	q9WTVDo4swdJ8beXP1kDRKe8lEWC1eBZL76YuxOPZ4p1xp+hzYNVdf4lBwg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvjhst3kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee34588671so1565372eec.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655199; x=1778259999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1/jMMLEpI7VYXMfh+IoS/d8e62Xd13hJ5rETM+Ka3M=;
        b=It/v5CtY6gmyxEZhZDv4kuJ2RuSVl/46DrWg7Htt/lNaP4vLTDI/xCxhp8gZn8OShf
         rD0k5eA8lA5uAbH/4wiCNHjfiSs3wouUNbVrsI3uzGl3MD2+bBUFVZMZoNmUSsi0v8LL
         a0fxmqlQju5t5JVEqf3l9ZxMVNcrlDHcLPkClImIxopPMK24Mlh/VP11rOg3E+Uv84PM
         MDXUcFsllV3G3PvybxTaGOV+r+G9UUyxEqo7kw9T+cPmqd5hCJ/NNY7a3OPfViDEsGzj
         2Sd3WV86ZvuGybSXvbpm2zVNJptlYjsmGOPK2eXGu6huWbG0EceACcCXvlxgz7jAFhXX
         XDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655199; x=1778259999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1/jMMLEpI7VYXMfh+IoS/d8e62Xd13hJ5rETM+Ka3M=;
        b=ANRd8luMvJjWZccoUnsUdzN+CIAetgsFAIbcq4flMfqylIhksxq+V4LePAOAtTBuEk
         8gCfKUWSNCFnh4Xh9kNloBWX+GXtZTbfcbrDX4yJkUjZqbVxrmffYxSrjQT115U+rmTo
         Fm4amQWumg45IXzCj4XLQpv0tksbrQ01gLsdijaKBl0vnzEKldNwB98fyGYqPHOo+XLy
         qFQFFIISZFjdXRDTgBkaoiQJ1Sfg+TRmSueU1tVfmsvFO3TJ7cxZOL7QWj9p8Xk70Uw/
         CLZhwRHMic2fccxQlEpxvMfkWr/oXfJwIOvxPXf6SenLalm9o+TSIR0CWT1f5Zhs90Cg
         s/XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QNpYnOJt8LgPXO9EOdKd9Yxjrs374DRDaVvXak4XeFv33TzrPpgmtHawtESBl4NLlggfGI0Ac6pY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAdl+83WE3m9QjTQzw5d1aCS4K/ufhmHWV2vw6Pr1gutlfog0
	Dnto8CCRFot7tKfaO6+GVKlhhJLbLDi8yrtvtpCEsX+NqruYukwZhqggDiUWf+CjpmFVL32U/Bi
	Fuq2Bq3I/Gv0463jvWy7slE62dlm61Q2HTP1uYCB8Ha+lCulHdsUllXLfYFqcAWw=
X-Gm-Gg: AeBDievywC7mzOD9YHWx+hZfIplpce2ndfZGU275xPtNSOhLFiQjPYqkbRZgUCPNsTc
	Pq/KyVfFfi+jgTNorqQ9pccTWTymVipgae0S5exndek1MRtHahoYkKCfMfeJV+WK9ST5UVXfr8M
	HQQlNAlcZ9me8F4RmDe1YXBoDliSzGLgQcRAGEK2Cn0x9zDNVSti7J87HDWJBSbQbhcO/f/Y1i4
	gFCHkyeMj3mJRdt84QTeoLo2VQvr9bWlndnsDMFc+hRJ+SFNJFe0gL6nNLU9wKE811nDkBDUZzR
	M0QHHtmLJBzDpTJ+f9OtaeYpcj5UCYB4dCU4+I/zmwcjPz8T0qbFWotqOCW5WKzcOdgdJGQen+w
	fKRlRZ+Nf9RF/4a2kDu+faZKXNYS999p9PT+XpBWP/r+wat0hCrsdk8iAvJ4aiOeretcOaVrHxU
	po0DoO3ammSg==
X-Received: by 2002:a05:7300:7490:b0:2c4:4363:3742 with SMTP id 5a478bee46e88-2efb80c0bc1mr118108eec.9.1777655199113;
        Fri, 01 May 2026 10:06:39 -0700 (PDT)
X-Received: by 2002:a05:7300:7490:b0:2c4:4363:3742 with SMTP id 5a478bee46e88-2efb80c0bc1mr118098eec.9.1777655198566;
        Fri, 01 May 2026 10:06:38 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
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
Subject: [PATCH v4 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Fri,  1 May 2026 10:06:28 -0700
Message-Id: <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Br6tB4X5 c=1 sm=1 tr=0 ts=69f4dda0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=un400R04Xmhap_XYEvQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: UmSYDqWgOsB37_DChFOrF-Rr0JMIhwDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX7iWKiG0NS0w3
 wt0Tdg/MW4RtePOBEGlog8SB6aNuY/oRwM/+s0EqyEekTbzlB310wsKKuGgVAsllSOa4GLftL1F
 1Lj4vdqnKN0Pn2SidbhgB276GdUREfSq10kOwnYOHXVW594q8368JD2I178RO7JjUe6zmt4Jls2
 0hjdRvjOr1mBD6cRoxfPdvbsnXq5521d0MMQaW57v/NwLZXcCav6Vj9Pm/1YcJeCPggfTSyETsg
 QjwzVfdAJPZq5q9nF4GsQ5IfNX6DWrxY7aenMDsAkOy9nK7eLeHCRpx6oMZRFpIwyJNcMsc2Oxu
 EyP4s5vBlcCu7zeAntLBpAe7Q9A9CplYEUYLCaJHVnmn9mHotaPraaaPcxxgFrNLuDice7+v7FZ
 PIZXG/6YoxxSsTRGsSUmlaZhuB3MzDKkXsfye7T2Meh36i1R9u8cpalwg0P/eknw54giXfjKG9B
 u45tf7CMe7hln5xiUNA==
X-Proofpoint-GUID: UmSYDqWgOsB37_DChFOrF-Rr0JMIhwDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: B095B4AE4F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36823-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 16 +++++++++
 drivers/usb/misc/qcom_eud.c                | 41 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..a2a4fc5a9915 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,19 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  primary   - Primary USB port
+		  secondary - Secondary USB port
+
+		The attribute is writable only while EUD is disabled.
+		Reading the attribute returns the currently selected
+		USB port.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 926419ca560f..4aa49f0f58c0 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,14 +23,22 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
 
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
@@ -40,6 +48,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +113,40 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
+}
+
+static ssize_t port_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int port;
+
+	port = sysfs_match_string(eud_port_names, buf);
+	if (port < 0)
+		return port;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled) {
+		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
+		return -EBUSY;
+	}
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
-- 
2.34.1


