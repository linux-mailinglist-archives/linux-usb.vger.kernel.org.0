Return-Path: <linux-usb+bounces-38071-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NF1I+znFWqXegcAu9opvQ
	(envelope-from <linux-usb+bounces-38071-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 20:35:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BA75DB68F
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 20:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94F10305FAF5
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 18:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678ED421EF3;
	Tue, 26 May 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6s6i0Nx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOAfKgfF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A071830AAA6
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 18:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820223; cv=none; b=fZElXZokhyduAnC8k0hUeOqlCpdmKzB+5BxTuSt0Z4B+/V596P+h5SUZyRz1ytjxvsi9LiNt22Vu5jKvLPET5Rw4L4Otl5kLmOc89abcv7JAExioNU6N4QAoWNmJOJU9YRPClHhNNpB4yyDk3nI+zLzCwzI1H7mRtwfS0VMxX/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820223; c=relaxed/simple;
	bh=AnERR3aYBMShlbG8W01rgjvYAZLp4HueE8R5yBYjsQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YsxKnQ9+2+hHXVlm+z3jmgGBcjbQ1coaAPkGNq9/UlkfRcRi8bz/ag2JWs+Glq0z6WY8Bs08E+O1x8ofbH8LFNv0e1zYMf1NJS9ulIN/RAOsueKOXZMrBLyVr1c9dta24gQlfykzwGoO9HcroLUBfOppNlnocn3mmabJiYw6/K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6s6i0Nx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOAfKgfF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1Eh12995577
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 18:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TEi2Tq0xC1zN1d24vzrJg3IDr3nxq28YoQs
	nHTaOUJw=; b=E6s6i0NxphHx2lXQdZnGor8QMoy/RQSJ5BuvhZ4AaZGFLy7YJGj
	GLE/aeVYkRDHeyr3BhnmvgpaqSSsMdEUiU+ADKEie8FwpHcs+l8os5jvbRGXa9CK
	yzlVqrIdGji1Pfl3z9a7xsuk+LnTFvDeeGM3xh04xn1B1/gNfdkUrV4+tmNvRAfI
	toSic01aLnAgMukYB604BEh7Pf5BtlWMbc2OmySHBt/4kuSuvUv58t4FND1FrvlO
	GWDDEcFsKDGCTbM4OUp63ABFxx9rFQPbOFN1TvK1qonugpbih9cVQ5dlFuKfMBGr
	UOO6qrqo+pITRg0pIkA6iRDgkxqKcgQz+fw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnsa2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 18:30:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3048abb847eso1156504eec.0
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779820219; x=1780425019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEi2Tq0xC1zN1d24vzrJg3IDr3nxq28YoQsnHTaOUJw=;
        b=KOAfKgfF6dBn6QbAQZpgTJDhixat+Cap7KaAEGIERYdFdgTefCLva/AcMdKJeEtyR+
         BtvsEu1xJbBlsjq6aUHP6xwI3EmvNZHwBD/DGY3uv2NLXUIK8OBmZ/pw/2UsVz0i43ey
         ZHM0EhqKJ8wQetIdLTVyOiC5xRFYc1voCFf8pOBDZeFiu/gzP3he+yxVlsJ/uoXjs+A+
         n/Pc/ZuYqZescROECQkVuDOfsZTQvZFv63pUS0yWSvLVA+hsjf8aTi1rsIhPcaWybNS1
         +kxzflhFF3bZspBDYnW4HLrxnK6lueda0yjrYcguu/5QvWt2qmEJZ+jes/QR1o/bt4Mj
         ZJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820219; x=1780425019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEi2Tq0xC1zN1d24vzrJg3IDr3nxq28YoQsnHTaOUJw=;
        b=XaC+GAEOsqNZU4uoufh72PdyiJ2y/4cswZsBmm9QGy7WiPter7/1C9Igq5qpyqqUze
         xrE6lHF/qGL+F3lssbdI1Dm3unp6bZauBikAx0LuO1Jvg3hpbpEKZAP4ts0tO95FognG
         wYRych0q4j+fJ+wuu2/t82vcLKQ8WPdtarCXuAz7GTH1IpTGOEJBdkZ4R+RMZVHsjWHA
         vI4wxUzhzc+8y9rLIWB2U2T7sHHuWcBeB65dqqnIAd7tJwRPZp8QvX1h2L1saO3kZa9t
         Y8nzHd8W2Mc0eAQExLVpUNK1DCybLFpy3qwvaMBLi2GjdRSISf/LJ8cxItOdXuoQcQ0O
         x5MQ==
X-Gm-Message-State: AOJu0YwiSFu4ROOYQF3Tbzh7uRzkSirjX2YKbdxLbVSqQjdmWe3PPXjw
	Th/P/4DCCs3BZIRjbH/xBcy/siMvMj1b4FS0E/dyl6Hc7O/Dd8BN5XHvUY8O8hzDLOQZPv/JUVx
	rVw0mPsCxfVA3tbMh/6WEdPesmlvgwwJiy9N88XKfaEF0A0ZJMDCWfkq924leJJ8=
X-Gm-Gg: Acq92OElI4VRNIl3ONHQEDTG8CIXZxelBMSM2RHw7z4F0aoLdEvVtGCf+A/mXxTiAUo
	ngQ3RY+UDnBK2SmVdnMKAk6iqEPyqvFPEMs63kvJGHmiHrNR+ozMj9CxdXBHaPXDouKj6rgTGwS
	evUHWUejNDFLsiRK1RLWIHhCEGbYSTU4W5QEXnzjmswTOW5ec3kAZiCEPIzZSXvu556pmV+7FHW
	LxhdbYCGf1BQ9qmECq0Gb3Lefc91MusA4MDzDycBCmEL0Xgtpx3bW6Q9emmIly4g9ZNg/SzeFV6
	HJaeLXBgKiOoDSL/zue7Kp5E/Tnk82AguPuUmBdzPIzImjfeZueagIYoDGWpensrZUCEhY3fzGx
	j4pvAs4GS8kwfJ4nOmK3aPqyvidvKr0O47cUoSfdpJYcXmhYoidyi1tdXVC9T9qIqp5lNTwtBq9
	c=
X-Received: by 2002:a05:7022:3d12:b0:135:3983:2131 with SMTP id a92af1059eb24-136341c8b21mr7896447c88.21.1779820218353;
        Tue, 26 May 2026 11:30:18 -0700 (PDT)
X-Received: by 2002:a05:7022:3d12:b0:135:3983:2131 with SMTP id a92af1059eb24-136341c8b21mr7896429c88.21.1779820217669;
        Tue, 26 May 2026 11:30:17 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366a4011d9sm9045003c88.6.2026.05.26.11.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:30:17 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com
Subject: [PATCH v2] usb: dwc3: avoid probe deferral when USB power supply is not available
Date: Tue, 26 May 2026 11:30:16 -0700
Message-Id: <20260526183016.3501307-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: blO6FDdgIwlNqyK3UrjVRiP47NMtOgHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2MSBTYWx0ZWRfX+2/Tl2bY+lnJ
 Tmspu8c1dGrdfCaYfqN3YhUB1+YFJfK10W+AeXcck8zGJ70Wnhn6vxvXK6KJmIB9oHItopOl6RA
 9mULx3N5pRq5t4PIw0VQOoyW7km8brGzQaXlu2kEHgWyoDLoBpxUayKBgEwVfpruCr6r7P205EF
 dHxpKWv4+x0NGCgNV3gsP4rK5Qu2cQGcNrNMPKKWKjH477Y2NYZTj/CweZWcW9QHsBWG8Mwb5se
 EU7oZbkaBI4lqmd5iaTwaY9MvFEk6Tl0qHj5vzGgogl/G9fWNGuDf+4iGF0dGhDk+gWyxDPEAkl
 IslqTzFQwkrFfg4UfFkeJsIfw6y/A66PXSJqpBjqboTlgsFnktUugiRC3/PPfjbB41R0gqjVTi+
 bQjBsFs78n24Ksb9wyNCZQykgvQowz3xpSF7RWlJnj4vcM8T5+EIvfL4Rv8rtknek1/0uD/MH4c
 Bk6aGkbaSp8Polat7xw==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15e6bb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IQkDn3IUzkMpPxIPlJ0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: blO6FDdgIwlNqyK3UrjVRiP47NMtOgHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260161
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38071-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29BA75DB68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The dwc3 driver currently defers probe if the USB power supply is not yet
registered. On some platforms, even though charging and power supply
functionality is available during normal operation, there may exist
minimal booting modes (such as recovery or diagnostic environments) where
the relevant USB power supply device is not registered. In such cases,
probe deferral prevents USB gadget operation entirely.

USB data functionality for basic operation does not inherently depend on
the power supply framework, which is only required for enforcing VBUS
current control. The configured VBUS current limit is typically enforced
through the charger or PMIC power path. When charging functionality is
unavailable, applying a current limit has no practical effect, reducing
the benefit of strict probe-time enforcement in these environments.

Instead of deferring probe, register a power supply notifier when the
USB power supply is not yet available. Cache the requested VBUS current
limit and apply it once the matching power supply becomes available, as
notified through the registered callback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
Changes in v2:
 - Removed notifier unregistration from the vbus_draw work function to
   avoid a race with remove callback.
 - Added an early psy registration check in the notifier callback.
 - Moved power supply registration check after notifier registration
   in dwc3_get_usb_power_supply() to address the race identified in v1.
 - Link to v1: https://lore.kernel.org/all/20260407232410.4101455-1-elson.serrao@oss.qualcomm.com/
---
 drivers/usb/dwc3/core.c   | 99 +++++++++++++++++++++++++++++++++------
 drivers/usb/dwc3/core.h   |  4 ++
 drivers/usb/dwc3/gadget.c | 10 +++-
 3 files changed, 97 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 65213896de99..c035b5fbfb2f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2192,22 +2192,89 @@ static void dwc3_vbus_draw_work(struct work_struct *work)
 			ret, dwc->current_limit);
 }
 
-static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
+static int dwc3_psy_notifier(struct notifier_block *nb,
+			     unsigned long event, void *data)
 {
-	struct power_supply *usb_psy;
-	const char *usb_psy_name;
+	struct dwc3 *dwc = container_of(nb, struct dwc3, psy_nb);
+	struct power_supply *psy = data;
+	unsigned long flags;
+
+	if (dwc->usb_psy)
+		return NOTIFY_DONE;
+
+	if (strcmp(psy->desc->name, dwc->usb_psy_name) != 0)
+		return NOTIFY_DONE;
+
+	/* Explicitly get the reference for this psy */
+	psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!psy)
+		return NOTIFY_DONE;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * The USB power_supply may already be set. This can happen if notifier
+	 * callbacks for the USB power_supply race, or if a previous notifier
+	 * callback has already successfully fetched and associated the instance.
+	 * In such cases, release the newly acquired reference and ignore
+	 * subsequent notifications until the notifier is unregistered.
+	 */
+	if (dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		power_supply_put(psy);
+		return NOTIFY_DONE;
+	}
+
+	dwc->usb_psy = psy;
+	if (dwc->current_limit != UINT_MAX)
+		schedule_work(&dwc->vbus_draw_work);
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_get_usb_power_supply(struct dwc3 *dwc)
+{
+	struct power_supply *psy;
+	unsigned long flags;
 	int ret;
 
-	ret = device_property_read_string(dwc->dev, "usb-psy-name", &usb_psy_name);
+	ret = device_property_read_string(dwc->dev, "usb-psy-name", &dwc->usb_psy_name);
 	if (ret < 0)
-		return NULL;
-
-	usb_psy = power_supply_get_by_name(usb_psy_name);
-	if (!usb_psy)
-		return ERR_PTR(-EPROBE_DEFER);
+		return;
 
 	INIT_WORK(&dwc->vbus_draw_work, dwc3_vbus_draw_work);
-	return usb_psy;
+
+	dwc->current_limit = UINT_MAX;
+	dwc->psy_nb.notifier_call = dwc3_psy_notifier;
+	ret = power_supply_reg_notifier(&dwc->psy_nb);
+	if (ret) {
+		dev_err(dwc->dev, "Failed to register power supply notifier: %d\n", ret);
+		dwc->psy_nb.notifier_call = NULL;
+		return;
+	}
+
+	psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (!psy)
+		return;
+
+	/* Unregister the notifier now that we have the power supply */
+	power_supply_unreg_notifier(&dwc->psy_nb);
+	dwc->psy_nb.notifier_call = NULL;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	/*
+	 * It is possible that the notifier callback ran before we reached here
+	 * and successfully fetched the power supply. In that case we need to
+	 * release the above reference.
+	 */
+	if (dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		power_supply_put(psy);
+		return;
+	}
+
+	dwc->usb_psy = psy;
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 int dwc3_core_probe(const struct dwc3_probe_data *data)
@@ -2255,9 +2322,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	dwc3_get_software_properties(dwc, &data->properties);
 
-	dwc->usb_psy = dwc3_get_usb_power_supply(dwc);
-	if (IS_ERR(dwc->usb_psy))
-		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
+	spin_lock_init(&dwc->lock);
+
+	dwc3_get_usb_power_supply(dwc);
 
 	if (!data->ignore_clocks_and_resets) {
 		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
@@ -2309,7 +2376,6 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 		dwc->num_usb3_ports = 1;
 	}
 
-	spin_lock_init(&dwc->lock);
 	mutex_init(&dwc->mutex);
 
 	pm_runtime_get_noresume(dev);
@@ -2377,6 +2443,8 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 err_assert_reset:
 	reset_control_assert(dwc->reset);
 err_put_psy:
+	if (dwc->psy_nb.notifier_call)
+		power_supply_unreg_notifier(&dwc->psy_nb);
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 
@@ -2433,6 +2501,9 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
 	dwc3_free_event_buffers(dwc);
 
+	if (dwc->psy_nb.notifier_call)
+		power_supply_unreg_notifier(&dwc->psy_nb);
+
 	if (dwc->usb_psy) {
 		cancel_work_sync(&dwc->vbus_draw_work);
 		power_supply_put(dwc->usb_psy);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..4854cfdbc64a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1059,6 +1059,8 @@ struct dwc3_glue_ops {
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
+ * @usb_psy_name: name of the USB power supply
+ * @psy_nb: power supply notifier block
  * @vbus_draw_work: Work to set the vbus drawing limit
  * @current_limit: How much current to draw from vbus, in milliAmperes.
  * @usb2_phy: pointer to USB2 PHY
@@ -1251,6 +1253,8 @@ struct dwc3 {
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
+	const char		*usb_psy_name;
+	struct notifier_block	psy_nb;
 	struct work_struct	vbus_draw_work;
 	unsigned int		current_limit;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3d4ca68e584c..303598048e9a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3124,15 +3124,21 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	unsigned long		flags;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
 
-	if (!dwc->usb_psy)
+	spin_lock_irqsave(&dwc->lock, flags);
+	dwc->current_limit = mA;
+	if (!dwc->usb_psy) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		dev_dbg(dwc->dev, "Stored VBUS draw: %u mA (power supply not ready)\n", mA);
 		return -EOPNOTSUPP;
+	}
 
-	dwc->current_limit = mA;
 	schedule_work(&dwc->vbus_draw_work);
+	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	return 0;
 }
-- 
2.34.1


