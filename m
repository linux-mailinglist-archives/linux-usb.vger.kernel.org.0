Return-Path: <linux-usb+bounces-33369-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCJAII4Rkmm/qAEAu9opvQ
	(envelope-from <linux-usb+bounces-33369-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 19:33:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35D13F66F
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 19:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B51F30041CB
	for <lists+linux-usb@lfdr.de>; Sun, 15 Feb 2026 18:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C0F2ED164;
	Sun, 15 Feb 2026 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3FD+9wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8BxfA7p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FC6A8D2
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771180427; cv=none; b=YMqF15qZl8SIAQFDGeVRiSo2Vx1sVVuKiDFc5U46WffNtCimObvpCtba6M9JBUuB3WcTubhPbDKPfAeET/Cm47PUhLOsaOYcPjcG960fjeUG+5sKgcb8cVBUTyK9bhV5TPRZY/6UXpu98dBw1DW4OVAPWb1EgXCKWYNJ631zi2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771180427; c=relaxed/simple;
	bh=LX/ssufv7H4B1pIaqUkz464JtS0NxeBXZnCRUc/ndPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPoBesyct3F6WlbS1pOy2cnQtSHQ1FXI9OxKm4pkiDuOKLTusJyVRLLlBV0+15Ag+kymY9n9WOm0BkxyDk7ceAE5y6+AuxgFE7dnHcSDwiOgJAlq3gC/GcQZI+zAHcCSOcZJMGhIgDixy+kZqWbD5kauLPHIo7wKffUeMdZHBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3FD+9wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8BxfA7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F4vlj2997274
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 18:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKmw/VHz5oPlDFwnvc5xcd+xBL/HdYhzMal6dUWmokE=; b=B3FD+9whgRvRX30d
	K3PmaMH3RBlH2QHDLjsfGGvW5UNJSUDsNTeYTQ1pUy0zsDrqzkYIM6Jxyy3s64A0
	U5UesJShdiUp+9F/tGbmEln0Lxrf0FVj9EAQBdl+Avc2h80XEGYgyHt1SVWDcg8H
	jRfCZTXAotCJb3SbPFCIMmN4838C4U/cLAzWtzb/ft+Ms+lRCq3nWM/ZKsgMd8xL
	iN6zBo3jTCgr4HTA3O4RiFFU70pgrYndWqZsz+Xdw6cEgHXQ71N/dPtwiU33rxc2
	Hoyr0XJxwPSomxlj3PI3mPWM8CsorAT0/eI0vgYbcQ1f7yqGji333pCfBbAmchlk
	Cc7ygw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sjpkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 18:33:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6dde310601so1588039a12.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 10:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771180424; x=1771785224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKmw/VHz5oPlDFwnvc5xcd+xBL/HdYhzMal6dUWmokE=;
        b=P8BxfA7pie5ukaQVtiwFZdN97SOQg/+Wd6XckzrRdvDhztDqDTXoejDQiSDJ03ePlb
         CpnjPpeK9VxUI1sVuJVEurLM5+EotR0cy6A/tCnggYBfXDA/oddvmC7PKaECHFzTt3nG
         JvKGPNJleNlFvSUK38iEz2ojn1C2Mi3kn10DRBHHcX6RiwpEiAdzDi6bKep1RVqKVKCY
         vrBXWUbed6PoLcZaQU9Ms2g1QqEjMwtjmQI57UiBL7P0ZhfqGMt1VLqFTE9FIQ0l4PQB
         BOvsduByIlOs59O64dCxwiWsqg+M1Ku1AL1nVzhC8L4IeiuxvQWT2sSPjJ5B+3RavN8I
         3CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771180424; x=1771785224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKmw/VHz5oPlDFwnvc5xcd+xBL/HdYhzMal6dUWmokE=;
        b=mo+Fc9WkhcrYiqiHbohogaUX7UUT6D1ev0Hi02otFQjL0Gvd04uk7PyNeXRba2GmhF
         X/IGwbuYnepcgI84IuSXHdZu+VhMflwzf2jaKAWardncpqDhC94pOz4P+1kdKOlavAuE
         KM/il67dc7L1ryaAaZb3SLT2bcoQ6UhuzBXcnhUP1sXPkyZOcnDCnnnH1OI0C2JgG3a9
         AAmjG1ITy6DFORrhnlKs7ki4y2NYTur3rtPrYet1NQuh59H8V8Fa5W1i2rSijN6vk4cN
         P0WasDAqtG6bvTSc9/Ns7Ezl3qbO6KGx99fEMT6S/+pE/fKRuFsIPnzT1UktUCt/3PnR
         rJTg==
X-Gm-Message-State: AOJu0Yxb+5d1ls/cVOMzAmil6YylM8ZshOZrhOw3zxPZVBsrfmgrIn3l
	CWboKWS+oWcH+rWBRgupVtDQ2aJhO2LgJUqE9cHDy7TyVoRdoDJFKjDlz39kAeqs0KlohV+ot18
	J/t22Rdn66zQWl6IYiphr2ih/Jb+KewY6hp0HRcEz5hlQCQ2DDDQs5pcCG8S4AAI=
X-Gm-Gg: AZuq6aLu1RuW0eM593uHf1mSjs4XE45EBQnbZJGPI7qX2FwOD4Mjp8OXNrag7bXJ7rs
	Ikt01IsIYis7/U2JIE7WNmW4Ds97+7TvgzBeE7a6H7xSDEtdgA9ugAITGB7475e7rRUzEdywWE+
	vCVMqihA5g6+iG8ORW4CI+RGhziZUX/gFQaAygCae+AKm8oLAbyIf4ck8bY5pM82WXzDTQBx6O4
	sOPX5GDweMNSJFZodVO6IZ8TuTl1Aeen7fSylEZaNWqBaNFXdEPd586IELBjGDg8+rlGbq2b+h0
	uPxLTtYvC16gqIHsZsLJloLzdT6WFH/X1NR3EKPHAcoohYIh4hVNDpAbHN8KlBL9voTuKTZdBuQ
	3l2ctwduNwkTd0BK/OBx8KLBkJS+4Y+r2vJZmAgi3ikVRL3di1I2a7z4=
X-Received: by 2002:a05:6a00:80e:b0:81c:5694:c544 with SMTP id d2e1a72fcca58-824c961b678mr7256709b3a.56.1771180424534;
        Sun, 15 Feb 2026 10:33:44 -0800 (PST)
X-Received: by 2002:a05:6a00:80e:b0:81c:5694:c544 with SMTP id d2e1a72fcca58-824c961b678mr7256697b3a.56.1771180424039;
        Sun, 15 Feb 2026 10:33:44 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm9560875b3a.2.2026.02.15.10.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:33:43 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [RFC PATCH 1/2] usb: typec: hd3ss3220: Add wakeup support from system suspend
Date: Mon, 16 Feb 2026 00:03:24 +0530
Message-Id: <20260215183325.3836178-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
References: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NSBTYWx0ZWRfXx8afxg3mZBTo
 FkZpVpe1R8nqyHHHII72EY3+8IXjOyaHt3o41I4Q9WuYtpOcVqe7bJs9lBRIE1cN9H4ceI3I3Gg
 vte+KWNRSXJv6mrUZB6BSk11Av11boddqIj2wFWkr9D0mIKaPPdL2i7JJXl+z4io3iBr9uXbya2
 j3t9gfc2FiuR4pwx0k8tv8JbLVvZ/pKHc9PzQwwTwzKq09K17vED5rvWJJjzdRIpt6YRfpJoP6m
 o2ezzzjLe/LZGZUdge7igX+5tuyk8HIaavsS1mGs3lID9RymAOGXUCdd/wDPmmwv2myHvToMQXx
 cYsejgskEoFhhDKS1/rG8N44EfnIAVeL/No6ZbQTIAX6vvn1u14lwrh8ko9D5ZY3Kime34dm5vT
 naXSWN+Em/F5IXyKaie5OeljGuhvxsmtdHdnX2ZufqrVyPT9WyCjlP1CpGmK9k8gVtL6QYf1dmv
 KYv20FdCFcFh2rK4jZQ==
X-Proofpoint-GUID: DH_UmQYCy1HyikqRmVMnTzwuc8F7_iSN
X-Proofpoint-ORIG-GUID: DH_UmQYCy1HyikqRmVMnTzwuc8F7_iSN
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69921189 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=D50HEyLJ8L71BYmXUZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33369-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D35D13F66F
X-Rspamd-Action: no action

The HD3SS3220's interrupt is disabled during system suspend, so a USB‑C
cable connect/attach event cannot wake the system. This prevents resume
from low‑power modes when the port controller is expected to act as a
wakeup source.

Add wakeup support by:

- Initialize the device as wakeup‑capable.
- Enable the HD3SS3220 IRQ as a wakeup interrupt.
- Add suspend/resume callbacks to enable or disable the IRQ for wakeup
depending on the device's wakeup configuration.

With this, USB‑C cable insertion correctly wakes the system from suspend.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3e39b800e6b5..b56df9349f89 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -501,6 +501,11 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (hd3ss3220->poll)
 		schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
 
+	if (client->irq && device_property_read_bool(hd3ss3220->dev, "wakeup-source")) {
+		device_init_wakeup(&client->dev, true);
+		enable_irq_wake(client->irq);
+	}
+
 	dev_info(&client->dev, "probed revision=0x%x\n", ret);
 
 	return 0;
@@ -525,6 +530,35 @@ static void hd3ss3220_remove(struct i2c_client *client)
 	usb_role_switch_put(hd3ss3220->role_sw);
 }
 
+static int __maybe_unused hd3ss3220_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(client->irq);
+	else
+		disable_irq(client->irq);
+
+	return 0;
+}
+
+static int __maybe_unused hd3ss3220_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(client->irq);
+	else
+		enable_irq(client->irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops hd3ss3220_pm_ops = {
+	.suspend = hd3ss3220_suspend,
+	.resume = hd3ss3220_resume,
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "ti,hd3ss3220"},
 	{}
@@ -535,6 +569,7 @@ static struct i2c_driver hd3ss3220_driver = {
 	.driver = {
 		.name = "hd3ss3220",
 		.of_match_table = dev_ids,
+		.pm	= &hd3ss3220_pm_ops,
 	},
 	.probe = hd3ss3220_probe,
 	.remove = hd3ss3220_remove,
-- 
2.34.1


