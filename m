Return-Path: <linux-usb+bounces-32872-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNy8FgbheWm50gEAu9opvQ
	(envelope-from <linux-usb+bounces-32872-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:12:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69359F48F
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AAF73046057
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BD52D7DE2;
	Wed, 28 Jan 2026 10:08:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0D92D0635;
	Wed, 28 Jan 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594915; cv=none; b=k7wVYwHewWB0oXTr3OAxiiOwCHjymsSxNXhhFv4ArNLW9amd4B+nHE7qMEDeTPsDcDMEY7v+vw4ROsu/PEyHqtZh1PP0vm6/g+fIAkATVxwCj+ovJNvDUgyk/kBj/OnUIgSV0Ded2rMgur+l7NCdBEuvFAFOCWN3cQ+eJwIk7+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594915; c=relaxed/simple;
	bh=NdDvQ/m+Y9IR+y6MhFsDvRxo8Wwp0HCQ9nZJH/dB6WU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p3Q3aCGbVs9DGFO01OR2SGUtKWYUylDh62IoiYcQlUWbLw3M0HWbfTnM/hiK26STiLFOlqOgbFmu2UvGbyK1v6KlOLhJSdqauph+eDshJQCphWC54WTmK8inwhiyVjuiUJ9YVYODDOtidWTTjFiMtNMX2RCXAtj3+1CTjPe0ecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: n1XkukmyScC/sDSaMWRLTg==
X-CSE-MsgGUID: p8c8qgOUTCSwNRRgTO4SFg==
X-IronPort-AV: E=Sophos;i="6.21,258,1763395200"; 
   d="scan'208";a="139522659"
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Longfang Liu <liulongfang@huawei.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
	<guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
	<mahongwei3@xiaomi.com>, Dayu Jiang <jiangdayu@xiaomi.com>
Subject: [PATCH v2] usb: xhci: add xhci_halt() for HCE Handling
Date: Wed, 28 Jan 2026 18:07:46 +0800
Message-ID: <20260128100746.561626-1-jiangdayu@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BJ-MBX13.mioffice.cn (10.237.8.133) To BJ-MBX03.mioffice.cn
 (10.237.8.123)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[xiaomi.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiangdayu@xiaomi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32872-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B69359F48F
X-Rspamd-Action: no action

The xHCI controller reports a Host Controller Error (HCE) in UAS Storage
Device plug/unplug scenarios on Android devices, which is checked in
xhci_irq() function and causes an interrupt storm (since the interrupt
isn’t cleared), leading to severe system-level faults.

When the xHCI controller reports HCE in the interrupt handler, the driver
currently only logs a warning and continues execution. However, HCE
indicates a critical hardware failure that requires the controller to be
halted. This ensures the controller is in a consistent state and prevents
further operations on failed hardware.

The change is made in xhci_irq() function where STS_HCE status is
checked, mirroring the existing error handling pattern used for
STS_FATAL errors.

Fixes: 2a25e66d676df ("xhci: print warning when HCE was set")
Signed-off-by: Dayu Jiang <jiangdayu@xiaomi.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..1cbefee3c4ca 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3195,6 +3195,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 
 	if (status & STS_HCE) {
 		xhci_warn(xhci, "WARNING: Host Controller Error\n");
+		xhci_halt(xhci);
 		goto out;
 	}
 
-- 
2.34.1


