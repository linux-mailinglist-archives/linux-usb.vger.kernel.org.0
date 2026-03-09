Return-Path: <linux-usb+bounces-34358-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBpELQwvr2mWPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34358-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:35:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D623240E31
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5AF930D2D57
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BEC41B356;
	Mon,  9 Mar 2026 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXD56n7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ylx/nzZr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233636C0CA
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088425; cv=none; b=es6V/Ewnj9b6OKlAVIOx1lYL5b3j9v5cg8x2+AQ/zfaMbLyn+GflE7n1ITthaikoZzI7EvNmd4SZhMrC7iA3W3I2n3EomddBKYl9dMkyrKqMc/8GVKtVNViZAxH3adMLChf2tHvwkQvYkKE7kkQBm0f86Thn4QzxFc5TzRU5iME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088425; c=relaxed/simple;
	bh=xMUCXc+T1mxqitUAHJsbyD7zN0MBtP33MxPyki89jC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ocDBB+9gV0UsiN6TpfXOYf3V5ggFPzgkyok5Hewt624TWW7T6yY1UdcW69HAKtOvCD1NqJYaCC7kzpTCcDJ2mOGidGFZqcCz4DQnVM7dpUVhjluzmORFKa2fB6x5AAjYP/7L7owUUfIBE3CyBsJpaI/PYnZ0GZP8qH0PKTI+yXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXD56n7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ylx/nzZr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBnv2296308
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X71iaS2pCQJ
	5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=; b=gXD56n7Vltq1K63b/yIvvsdXdTe
	wXrivOOGduoNWvIEzfy1D+wHWr88P2cUE2hQFEHWWOdh0POHnVLlm2tagvKSYyXx
	KysRy2+Z66iOyureCLTI0AVkQ9JFoKDw8v7Vsj+mOi6BaQ1BTOV/WvS7wXBqAl2c
	TGERFdPwkr9XKwev0Id50LrABQdGIP0dl9rup0NjHTBNgBf/reTF7+Kcyr/0QRHF
	hqqWMKJ02rQPQKkf46/PflBO4kpgMJhX2QHd4uFox9AyrySEjBA7mO2AKzVHjuKp
	WDejcFiKaJhUEIwILZAo/baju8Mcnk/6o7MV2uIBud+XEVQ9mJSkvaR1uIQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1ddq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:43 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d73fe3f986so17482215a34.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088422; x=1773693222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=Ylx/nzZr5An7A4NqV5k7V/7DlEklPxHyvYtG0AD9+7dcERIQXgk97pUr3RlMRBV36M
         4tNFH8zBCQ4cMO89Bch1/mKtVn6UbfF86gPt4KZepUIJPp/Z5qELeyCMxpN0M3hOnG59
         71RQEUy/Sybwj6GO169k/Ln1llaYmR6XOPrXSDvVm7vwn+006J9A6lDoZusYcKfDLVTm
         9rR2u527A5IvdRLvjWHgx7ifLTK86TfImh/oZEGmA7adgXZDiP1Bn8jdWU9KL9EDyaBs
         kLWwl4IepVA6907IW/e1VeJaqPxhvYTHWFqq3sgd6kVvNJxl9HC291yZiR9JZvLHJssJ
         d7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088422; x=1773693222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=E7QlxIPTGgWW176JEkdwXYmbc+aJ2okLaJEyxonG+traFv7Od6XRg/TDSeWednpZvy
         YEmJkA98LGSWVDZPX93EQPqmdVvxg5nkpbqaneHlpkgV++UR472g7anJl5WwYnl6z+Dw
         3EwnmYI05Cu+sMb8zN4e5Pw3IaOnlUsVsTjY/rTjRJBcHg1F+aoOA01EkvcTNYOXGDjL
         vourUXUMuUm+cjC01TCKWtz+nb/WJHw04qAX1gWUzFMX5lk0wqwgfgnZ3tKhehQdNsBr
         SbU6qfKGUT205jl4evcVKND9gGVBl4O++Rv2CxqCejpLq5Uq/3Grcozg2qnShFuNQVjO
         CD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMn3JczreWkS3f9m+YyF2Kry1O1d9DSBywhtSvNbL95NbGoVRgWkYtcigN2ID0+DQSxcS5tZYtZ/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynj9zHjTeDXhUaus41J7y7q39+No0TuPSl745kfS6HLl8HGH0e
	NXWHlkLKoz8h0NpJgurnnFNs1ePW6cS02qrEgU9VquTzXCOsNbUL8FOvvwiHKzp50G6PR1Kxu1a
	zguYAEoFPSu1pimgXqnt/g6B28QQv9eGn8MqaWwhCkFu1TshDbwMFEaDgxwjPB/0=
X-Gm-Gg: ATEYQzwdHAGc8dLcwUR/pJkMG0QH3Sj9ctUAHIbjv/TkL8OnTmmwQuU076/i5dZ1Nvd
	SbMS1MuoUKNWcOuMCI+NOFaYyO3J2DspiO7WdOH1i0xciZD6D7jR8iRpJf9X34kk0Ov+ZxhorNQ
	rmPKH1pLLO6YF1td5jdooFNhH8eDIE/seS0U6yWXUBbzwe6/5q20TuT90c1KeXIderwJJzWirRU
	W0QMbrw5dTMOeRknA1tIQZXj/OPi7oEOP5h18+sy/3GSY0XanaP725B63REZh9TaUICOWKtETkT
	/1dWcELubznF1SDY4QyNYB65x3Vasiit7Rx5p6YsJBpjzsVnzA6PEFSwfCz1XK1ISsC19lHkWUF
	MbesAg/OUycv30PEOXPc1krm7kT50lY/RGm4rfWwkLq6ayOGvFDATEay/0PWzphGz//nsi2o/DN
	c=
X-Received: by 2002:a05:6830:3987:b0:7cf:d05f:3e57 with SMTP id 46e09a7af769-7d727028e32mr8409076a34.25.1773088422012;
        Mon, 09 Mar 2026 13:33:42 -0700 (PDT)
X-Received: by 2002:a05:6830:3987:b0:7cf:d05f:3e57 with SMTP id 46e09a7af769-7d727028e32mr8409048a34.25.1773088421620;
        Mon, 09 Mar 2026 13:33:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:41 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Mon,  9 Mar 2026 13:33:29 -0700
Message-Id: <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX+4/yk+iXo9js
 8ZZvN1yTX/wa9DpjcxqaD1CKrJPkjFiIw8sSm7gWhaHo0KXhTnYCnijvFKKQMuKRSUpgbrMuAct
 JH0rVsEFSoXd9MlThxH+xpytjzUaVOFW5D9c20LiTN9sWr19RaC/yz8MGQFHTCwhxXsTtJ+eWiI
 PnPMmjuu4yk/OwU7oWlzr+inPmcUmNL3Gpx+9i2sAmgotGZeU0zsRoz7XrqYHgqkyzzh0jnHxYQ
 Qt6BotcOkIzbHR48SY3+vsDOYWi2Jp97UO6XB378vLe2jEYrmJIIRTAxujaO4/ip76JR8OAi5iY
 NtyAxSahE0Ffjt3v5XfsbS6BpIgtVvmNZM632aYjKFzJxH+uEtnIvm7YHBGiyh0rdG1PZrVkypw
 ItybrEZ7kK3CTHYLZORLgDbj7i3kDwZ1wIoVQSEIzgL3h6zLqHmmUw/r+EYmezrHKT6QhU7IEnE
 Flf1+3Zl5WfICtxlLnw==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af2ea7 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=un400R04Xmhap_XYEvQA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: p0p1BTUReh5l8eeFbUWx2LhN4ATrJE2Y
X-Proofpoint-ORIG-GUID: p0p1BTUReh5l8eeFbUWx2LhN4ATrJE2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 1D623240E31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34358-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


