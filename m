Return-Path: <linux-usb+bounces-37585-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJT3MVHaCmoA8wQAu9opvQ
	(envelope-from <linux-usb+bounces-37585-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:22:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F221B569938
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74886304704C
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003C23E5594;
	Mon, 18 May 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="gqUkJ+Pj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B63E3146
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095941; cv=none; b=jlrqAN8oI3OVdIeNBt05eRcjssFj9ZsYopPUz5rS96wI6AbT3JvdS1z1UJMdW+aymP2eg8EY0tkzFibwXIcOHhcB68HAEwnAPHYt9gHPzR1qO00bVaGrj1mLRw+10L4qNem/8InCS26aU73bt13XXFFYhT7NBE4TeXy+vvcVQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095941; c=relaxed/simple;
	bh=f/dSgibT8KvEXPmuAwCKh+9fty5IMG3gQFDEWnkedhg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bo/cYMVeirK27GwSbpb9RInMBrYnCBxfpODuOcy8OQVNleFn4zVBRbehOVxdUqGLLhksPvii+1tQWyVGipXA1FlFB1//bsh3aqmiPJAoJASZ0R4yZnAT2rO1l59WgQtp6JkwTZ2ILDisgYxHRzzFcmtZTgi428BwQsdWsfukdUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=gqUkJ+Pj; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1779095936;
	bh=0xIC587eU99hBfkhpGjvhEkLQJobTcVlEZs/7KP5eAE=; l=1826;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gqUkJ+PjowMHUTPaEcc4foyCnPwBMwV27GUp2q9VRUxmvS7Cm85mWDAIVJTay+1q3
	 O8nLy61tVRECey11QHRgVyjQ+CWSKw/Xv9G0+p7x2/d+PzMeUa81vAnkcgNcESiy6h
	 UNyhORGM/CNEI9V0QghCxDARkTYZ85QUtw8jum8Fyk4Ou6uTsuY72FaVD6u7go8ESB
	 26sv9M9oBGc9pDnW9FBNi2Mzixiqogpc2jehZ3u86PiwJkMJOJfJOM6/aBIboZ3f5N
	 /fXijBtoaqgFoKn85gPMcCa3GswtFl+oRME11ezOqTYrs/sLgLTSo5pqvBT+LJ7Nr7
	 e++/3Ayp2VBuw==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227027:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 18 May 2026 17:18:56 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 18 May
 2026 17:18:56 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 18 May 2026 17:18:56 +0800
From: <cy_huang@richtek.com>
To: <linux-usb@vger.kernel.org>
CC: <badhri@google.com>, <heikki.krogerus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <lucas_tsai@richtek.com>,
	<cy_huang@richtek.com>, <ren_chen@richtek.com>, <kevin_hung@richtek.com>
Subject: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
Date: Mon, 18 May 2026 17:15:14 +0800
Message-ID: <20260518091513.3277975-5-cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260518091513.3277975-2-cy_huang@richtek.com>
References: <20260518091513.3277975-2-cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: F221B569938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[richtek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[richtek.com:s=richtek];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37585-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[cy_huang@richtek.com,linux-usb@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[richtek.com:+];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lucas Tsai <lucas_tsai@richtek.com>

Add low power mode support,
add the op to enter and exit low power mode,
this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,
while disabling VBUS detection and PD BMC
but keeping CC detection and not affecting DRP toggling.

Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 4b3e4e22a82e..48d6a6823ab9 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -20,6 +20,7 @@
 
 #define RT1711H_PHYCTRL1	0x80
 #define RT1711H_PHYCTRL2	0x81
+#define RT1711H_BMCCTRL		0x90
 
 #define RT1711H_RTCTRL4		0x93
 /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0.75V */
@@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
 	return 0;
 }
 
+static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
+				       struct tcpci_data *tdata, bool enable)
+{
+	int ret;
+	struct rt1711h_chip *chip = tdata_to_rt1711h(tdata);
+
+	ret = rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x07);
+	if (ret < 0)
+		dev_err(chip->dev, "%s lpm fail(%d)\n",
+			enable ? "enter" : "exit", ret);
+}
+
 static irqreturn_t rt1711h_irq(int irq, void *dev_id)
 {
 	int ret;
@@ -336,6 +349,7 @@ static int rt1711h_probe(struct i2c_client *client)
 	chip->data.set_vbus = rt1711h_set_vbus;
 	chip->data.set_vconn = rt1711h_set_vconn;
 	chip->data.start_drp_toggling = rt1711h_start_drp_toggling;
+	chip->data.set_low_power_mode = rt1711h_set_low_power_mode;
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
-- 
2.43.0


