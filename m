Return-Path: <linux-usb+bounces-32435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC81D389C0
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC06730BEDAC
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89B1315D3B;
	Fri, 16 Jan 2026 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrmK+vs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BExXGGcL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2F314D38
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605673; cv=none; b=p193yS/Bqe57iazxeKZlI7XvWD2lYUD5A+y01pSSu3hr+blI6ZA6s6nE2KoOsBom1JG/44yaCD7BSOg5J7nIC6d8U1ZwamCEyQsKu9Lc5gB36NhKuEhj+K/SlczMYAXyWFOP4XQjPKHIgyFW+xDcNmpJZbLd5hvgNXrpnlWByhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605673; c=relaxed/simple;
	bh=xMUCXc+T1mxqitUAHJsbyD7zN0MBtP33MxPyki89jC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kkZOj8kw0vJmpYTzClT+qgU2kaby857kAL4wZ4E8uyrezph+kLhX/zzpyMM5pf8HCdrHliOImHDr1zVjVne3HuJACeR0alUlgSH/QgYK5wXDsxgDkLx0bzLeOjRIxZBTwO5RByTv8aUGfnGyuRzpF/umymQ4SBSHYQTJB2lN9Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrmK+vs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BExXGGcL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDMDP2825268
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X71iaS2pCQJ
	5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=; b=LrmK+vs3pl9QnXnAIzwE/KX3U5R
	AA/wRxhoSRzPD6wqNN+jObeSXQZGlyYn/OgYT5zwMkpoSAemPX9kYS6MVQMxJkDt
	CbxR78LmbWNqDwnAwTrQhMPx8DVnh5LSIy3wzNkFj2C5WmhBuTxNth76Bf+stJhB
	JU9RtacdiB4gxwXJKvKRepiGCMDW8uZJ8vYjaBLaH9CHPC060mv9RYdQy2k+vL5H
	cfgOpj5sCVdevmaZjP6hUPHeVXgL/u3an4+4VgmTEpO2B5rcbvmK6AnevQ4IpKJn
	wzB7FXRiRKgTpIan0iAdARsXcSg8qxBTDUW6doMRQ/M2Z1TRhSgBpUp4YSA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvecrcmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b9786fb51so15704074c88.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605670; x=1769210470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=BExXGGcLoU4IGJvz+n8upaghoqqbtLKh3CajiIGHVSvWpe+64X79LUYZqu1I1mqYJd
         DSgZRBvnNxiMvFEhv+/DVZfxrm68jxJo6kyntkXdpOJR5Cs1fYFZoA3KQkA7C83NRpys
         RSKaoSrjZqLy1dnnIeK4n5p2org0k9YeUwxy/5LV28MUBC8LVMk4vIg3F1WCd/8W4Lv4
         44tOhf13oR53KLK7vE+avWFXcQXMQT4xTvAuwdp3rWaTh+BbxpdDVfMXEir7z7F8JXtC
         8GODSjaz18u0/0JFq1+q8Ivk/3ZPhJFVbisu3SNDubY92FOCj/Sc3T7woOlqYczsUjOz
         sEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605670; x=1769210470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=WCW1EcjLhSBC6b3fWSkocdxYJ5F7t4NVIS98REp1/GaoWud0kJ4eS0YhX0PyeY7WYJ
         d2H2vpVEEShOnuD71JATZaIK/505PaMNjEi8UFlyec9Yp0RWeVGGURyLwbwRU7cLFoqM
         d97tQmgzj8nuoD0Q5uuxMWhwFZLBXeJRpubXm3ENjIj6M1eH4QtGJe3a4Y+Ij4OdqOBn
         KdCwP8xlP5ZW9ocxrMUmaKMYlmjV2rUgzYL/XtGEQQaDima92AYhNFC87VzQYXz9HCMm
         fu0U9rbk4miW4mngkB439g3jnleQPcp51Rggmmw2U9yv8uGftMt2WdAINLxZr9g5gva8
         uquA==
X-Forwarded-Encrypted: i=1; AJvYcCVDaCZ2e6eDKu/l+1StZkWmewE+mFpBYvS0lPJtFvG+txGqmty4c6Lf3ADwuLtjtxMQByyXdyDv1J4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5fkAAtK+tdFg1Egh3gO188wnkmXVCdzXqScN7VVO7QoYWgLe
	wn82zQnJyFBu5nMTfsRmhNjQ7xwMVbNxsuRN2KFjavUUIa/46aTpW6d3/KNLVvLhDPgqrqxRgM0
	rrc2NWmi8RjuzQ2ZsFULQf1pWfsSxLOGqrQU4sDUBaryvh7PAJ0zEvgGhW7TKkw0=
X-Gm-Gg: AY/fxX5prbg8z31o8IPup9YZKo9ggGyt0rNeuUXIVizTulvP8rNPFK2UkjCZxj7O90w
	xeOvMXo31CX6lxJAZgnJk9Cl3jYm9As+mS2LnNwVbGdsgz5AuJKTYWZ6smKbWjiBaYoGVs5UdqR
	MWNLvT4fyhCU/yOL7O7XQ4DqZKVa+/NfNJ5/2yOz+nuRtyFOO1V7nHvYPwUEmnqfhA07nBw13qZ
	csfWx1smSwWdtQeULf/cPtsgu/R65mrKJjsy8KEPydIllVnkaz5nM3AJbA2w02DXyh70TOsSi0x
	cvLh55YU89ZhlPmyKbwkscLPtX4TNiWaj2EiQvb8tgjPpbuRu7nJLaVbxHA9JC1RqWrUAMUbssC
	GY7JShQ5M5pcF59ZK3XYnLz0kI9ot/onJMaSXcOxEex585np18BudXwxAEGDQrpM=
X-Received: by 2002:a05:7022:4189:b0:11b:9386:8262 with SMTP id a92af1059eb24-1244a7a547emr3764387c88.47.1768605669569;
        Fri, 16 Jan 2026 15:21:09 -0800 (PST)
X-Received: by 2002:a05:7022:4189:b0:11b:9386:8262 with SMTP id a92af1059eb24-1244a7a547emr3764373c88.47.1768605669044;
        Fri, 16 Jan 2026 15:21:09 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:08 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Fri, 16 Jan 2026 15:20:59 -0800
Message-Id: <20260116232106.2234978-3-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: EbhXbSbIZIsPMZcmkjK61L41AqwBwKm2
X-Proofpoint-ORIG-GUID: EbhXbSbIZIsPMZcmkjK61L41AqwBwKm2
X-Authority-Analysis: v=2.4 cv=L4YQguT8 c=1 sm=1 tr=0 ts=696ac7e6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=un400R04Xmhap_XYEvQA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX7JZbx0ko8/Fl
 4CJC8sbnZhzv56LzhVWMlsDKzH3FgADM1tcVARLHlYWttPqzQl6N14WBkJTP2UJc8W8FVW8KKvS
 hB8uJAEdLmk4sTtPaetJUE3Ve4CdLbvcb7WrAelr835Jv4emfi9AgM2tU30O1IGoD776j5x+fJd
 4k9phEFj9XA3TGxC5fhF84OHiBkKOIH3mDLj7jW2vwWc4XFcXxiDB3FgCI8xxAlte3vAbLJ7PQm
 YCT9CJFmCYl/M/8z1iPCVM56G7U+AENHWG56bhvi/Bo+q6SiKQxX87HlbSSM8sl5qT73BKSuN3V
 /RjCv+j/GnnVTHatAIRgSwH2j219IjVBRbnaB+8SYXw4JhytatcatFij2z+MCZwE0fC0XbwsUSf
 icS8ykxMEngkKUe8L7nEpVDYsuF4JSUUM9sz61fH8RI+oQQZPRQVzrBPQyP3WeqkPwMZBl9icdw
 JP8HYO5tw4yoiPSHDYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
 drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..67223f73ee60 100644
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
+		  0 - Primary USB port
+		  1 - Secondary USB port
+
+		The attribute is writable only while EUD is disabled.
+		Reading the attribute returns the currently selected
+		USB port number.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 926419ca560f..1a136f8f1ae5 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,8 +23,11 @@
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
@@ -40,6 +43,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +108,47 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", chip->port_idx);
+}
+
+static ssize_t port_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	u8 port;
+	int ret;
+
+	ret = kstrtou8(buf, 0, &port);
+	if (ret)
+		return ret;
+
+	/* Only port 0 and port 1 are valid */
+	if (port >= EUD_MAX_PORTS)
+		return -EINVAL;
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


