Return-Path: <linux-usb+bounces-38208-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NBjNTfqHGpWUAkAu9opvQ
	(envelope-from <linux-usb+bounces-38208-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 04:11:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616C618BE8
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 04:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B83C6303A242
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 02:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A31222565;
	Mon,  1 Jun 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lwvnKEPY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7013D51E;
	Mon,  1 Jun 2026 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780279812; cv=none; b=oVMt+1uooUhWmwcqCQQX7BfR/NFt/xopcPCj9rBHI5XX/fwYLljuwkDKgSeuah6rl0aDsvXYth8N/dm/gJ4l6GZ1A7hwBoBBX6RDdFDcBnLX/s5h2uQNBeDE1IvgLZ2OcdhLLjMw5hyIAEFgEnI2bdOjuqj9+YZxI+Vfu8I+cGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780279812; c=relaxed/simple;
	bh=euiShFjVVbrkv1i5iF7e2jggKmpECluLntzpDzTrTe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUQVzKSo/WJrOTGCaVteS0QqT/bb+dCPdsqtFCTK5uLtgtNWwgkslWYrxSMqKjzZ4k4uI38DdVKxHrAMCes0z9cAgY0IFKrQpP/cDMtThWlppiOHXRpDD3Eoc2W0kJzIA0WBUYRXpaYwm1+/TlRZfzV2w2sQ4u/7Z79GL5OhqAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lwvnKEPY; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780279727;
	bh=CwFwxf8zM2T5o8UKShrhEjITs1Xj7eFPf/+p81NK9Zw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lwvnKEPYaXvmTiEzWrbVACYg0Wmoy6vsF/nffn1Nq+4HbMlm07a1OI899UuREaXmi
	 GBVE48JnGSLIigOUG0PQXQGGdQQhkBddRcSovg8u/hOJ7K1Y0++VX1vK9BM7uQVK1r
	 ESMFAdsvD6gjrJfXsecErf4PVX229eBguMaUBk18=
X-QQ-mid: esmtpgz12t1780279710tc40d83af
X-QQ-Originating-IP: +/V2faMnvlfvf97Euc6+9Ldh/RXlSs3QliKoaxr5qSU=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Jun 2026 10:08:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8607277306187307924
EX-QQ-RecipientCnt: 7
From: Xu Rao <raoxu@uniontech.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] usbip: fix vhci attach sockfd sscanf format
Date: Mon,  1 Jun 2026 10:08:27 +0800
Message-ID: <12E8F88218AC463F+20260601020827.3894279-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NJvWNRsNVoV4VMM3V5bAdPqpO4BQJADBqcGmvaKCVjpuUKd2ALLKHLUR
	jtG6XXV+CwmaZZ0+Tvh4YV7fAoLtg1McLYdP9xGpun8iOuI5WAxKeAlEigUaguUKjuQiCvu
	8DSCbqRadRpPrsrRKUapnWwyomkSxUS7aCijD031hBIKNBSXQST6QDf3a71yZ9cUwxcIVkW
	UvLWDPQ+HdoI7ii6k8hteMCKHgIj37ScQF5/OkP81l2KFJGHbWjAuQMsWS3b0la/kjEfbwZ
	57jWtWTuLUwhjJguXZ3S60iwjkuoQsMltfj8ltF3P4Rk0zrqhEzctn4zjWxWMagnS1lFRN8
	VS6SMNxo3vZQBM97NfknanqjLdUug1N4FAZqvstdHlnrJhDzLLb0y6laKyE+wMttcYcEMW2
	2HZlHqN89ygpDlbLWzv44GM5N3YupTmC4H1ZXrS/gT6CbG0dFWFfJe1gItroGkcrvDB14gk
	688cNYGRZyu35F63lS2PhBMPAP3UR2QR/uoJ+DQC44Kf0iq7iANbbvIQ+pCWOr5qW5JNiWT
	GxzFob3GmGuVo6tVp2+kQy5kyP98iyIqfXX9La4yGQivrH8c9au4omrt71bGdqHKo15BLqG
	x4aair3waX47QWKhsiW+aBakNf+AydNCdldadMl2E8gejSIposbz+AVo2vuK15b0zcKD8K9
	tWr8CUUHM8x+TuXNQVkk9wkCmuFb1LijqvwiPQW1P7PfTgCpT+KubOdi6emlMNWVDlHBFEc
	LwR5MpTsVfnQC/uXnE3dm9yJQxWEh0Vn5GrwYHEW+vrR2DJyOvKiF5KnSm6aLSKAGoRbAK9
	Xufp8YRxT2djc3YEupVo+zJrlAtY7sIvoNuAmHHf00kpRFti9IFKSIm8Py+NdITafg/2n+d
	wmiIU0Q1CgX8PitSVEXLRZkYC0Bhxe2Abiqc+P+lG2zgC7RBSepPToUCZkcJcNrkl9NUHib
	YRav9khuhcLlQx8eLApLbIhPQ4vo4/Rf/YRZV5oiNbSLFhzXJ+Sb46Ng1OacOYJT5Wy8=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-38208-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,uniontech.com:mid,uniontech.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3616C618BE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vhci attach sysfs store callback parses the socket
descriptor into an int, but the sscanf() format uses %u.
Use %d so the conversion specifier matches the destination
type.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/usbip/vhci_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index 5bc8c47788d4..3cc4008397cb 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -327,7 +327,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	 * @devid: unique device identifier in a remote host
 	 * @speed: usb device speed in a remote host
 	 */
-	if (sscanf(buf, "%u %u %u %u", &port, &sockfd, &devid, &speed) != 4)
+	if (sscanf(buf, "%u %d %u %u", &port, &sockfd, &devid, &speed) != 4)
 		return -EINVAL;
 	pdev_nr = port_to_pdev_nr(port);
 	rhport = port_to_rhport(port);
--
2.50.1


