Return-Path: <linux-usb+bounces-36223-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDAHLmWS3WkLfwkAu9opvQ
	(envelope-from <linux-usb+bounces-36223-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:03:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0143F4BBB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E010F308F70E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 01:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC562874E1;
	Tue, 14 Apr 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianwowk.com header.i=@adrianwowk.com header.b="f0RtSb1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87F28136F
	for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2026 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128462; cv=none; b=oUXU1Mxb2kLbj85wJRYh/k4MtG8laBeM8qPAFW7upwGXVNuoq4kBLKlwXnDbIK0PwFXi4mLjXlx08K2xQqlf8A6BCdzOzPWIE1YcVALTDSgkNfLqF0PcocmDsWgH8HteeLH2c4n5PmawF3pIooVqH2g6PsMR3fDWe38CX9KiNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128462; c=relaxed/simple;
	bh=MgxPj4jbaCxLE5wuCvLBNE8qYKkQXxzozDehyHqvTog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMZHup1BZiFoiw8pRAB9rwQkn2spWzDbCveiftS9JQONRDScbrogKLxYPZOhWX7cik+PMAR/O4N82omyuH3rnPX4ERf65CyGR6TsRWyOMg8SaCrGXAM6o3Fw0wFA9UKBekboO9NWLawny6/XtIubECy5mTMQBLLy9zYN5hHGU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianwowk.com; spf=pass smtp.mailfrom=adrianwowk.com; dkim=pass (2048-bit key) header.d=adrianwowk.com header.i=@adrianwowk.com header.b=f0RtSb1N; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianwowk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adrianwowk.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbccb6ae20so2594331a34.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianwowk.com; s=google; t=1776128460; x=1776733260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiJj2U0dcApG4g4r33MMQF3Km4Fw6Tmwa9t2KLhofNk=;
        b=f0RtSb1N0L9+22g91GKBsSIzbYo48+SosaRqOc+6iCPMUEaKba1SYQQLLBjljFt5pT
         Pmgb+MLSgvPl+Sj6lL/8xtu7Oe0B9ceKAGfKGQRb9Cg4JzgmCbcgPoHih94b6HCVQUd0
         JokmvBTI4d1/+YI9hqoiA11zppaQHK3yzUSJ8DWlROHWBmQl87oX/MZ5WD7r4L+HWAaM
         cjN+uYZLXjyGdYUgCfqqvnmkH+sHmw2voDSsEq+fveU4k01sDroICI5irE4lCx4DGGBT
         +PXtkkSARTvmoJHe7RnaK7eDH7CK9BYbUD2rJ505dEKEZxQJSTP4+CyJ+jLGNs31DVZD
         6GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776128460; x=1776733260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiJj2U0dcApG4g4r33MMQF3Km4Fw6Tmwa9t2KLhofNk=;
        b=beb9Y9oukS87zB3XvavEDtHdbrQ77Oa1etvzvwzQfJwh9b2Om286GFhKy/avL+ayVP
         TPxqmz2iQesdhqb9pJCmph1GrNnDi3Qwx7Wwbsru7z/PNLcpct3Rk1QqRdxpvZgp+Sc7
         eUvxwP/QPPrISVO7YvRCccBsxGcw5ztxGfQPrhhcwYDNjPj6oIEOsIG3opFthO3BmhOC
         FHKuLgkIJsLd4La4JC5fYBLaZ2GrTZq0SWIxHOoNiVCe/uSnGCh53wD9kuykaAZSijfz
         m2p7foRRT6zyhiNWiE0auB0wYxIdH6AIMrXFY9BNlb7QXFvwLadl3JCcvBClAv9G9WPo
         AmiA==
X-Forwarded-Encrypted: i=1; AFNElJ+gyEjR0DYTn3hSdZ610h1TtaWNx7/zVifEsr0Ks6UVUElTF6VcJdA3vuppNU8kx1FAOTTK8B+PPpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5u1C/Xeh+sanxRfTvz905R2Hk7zlx+oBSQYuxD0iJz9knIs8A
	f/HFZB0ahQFvSSXvShMyJVf/wy2sJmraKoNQqALmGUxiYak/D2pWa7l8YmN8/WdtOBE=
X-Gm-Gg: AeBDietzzJ1F/hhYIb3vV+XQYa+BPmJwWG5cMdwilVC5vGxrrNEIFqNLZrMAGDCVqZP
	01p7kNzwNidtcCrBdQyp9Q+/XcEJSpjNVCJRnvFDdXVSKYkDYt6/17H7FW5n2Qqv8a0ZuwsOybW
	YuwBpAB3rlb1d+rAnu7Nv3D8Y+aaHkrQizmiffBZLeumsSN5qJK0Mcse/HrUF7xxJyki0UAjO/P
	BkwgFzWR4vWNz18IqTkuE5YFGQuGrnaNryi7DNdcV47oBUb3RzP7qGB/pNIft91NqQ88KaKgTqt
	Fem+fB1uF/FX+Y0uKZGEeVvbU7bGy6pOKlEpvVa7hMIedPuI/RGkhAra5tjD3gwyqHvJLEi+jDb
	AD8lwzxKExcjO0W/pjGBYCXhoUac6T565mSgac5+pYfgaG3imdXOQ13GVApEOCa1tPrXro9hTP1
	8VffcFseQ8SwRPQIUv38lWCEaF8/Lu2DkGW+yIw0vKAA==
X-Received: by 2002:a05:6830:67cf:b0:7d9:ad90:573c with SMTP id 46e09a7af769-7dc27ed0496mr8826936a34.17.1776128460417;
        Mon, 13 Apr 2026 18:01:00 -0700 (PDT)
Received: from linux-dev ([12.26.11.218])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc269d3255sm9964556a34.25.2026.04.13.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:00:59 -0700 (PDT)
From: Adrian Wowk <dev@adrianwowk.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org
Cc: i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Wowk <dev@adrianwowk.com>
Subject: [PATCH 1/2] usbip: vhci_hcd: fix NULL deref in status_show_vhci
Date: Mon, 13 Apr 2026 20:00:49 -0500
Message-ID: <20260414010050.158064-2-dev@adrianwowk.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414010050.158064-1-dev@adrianwowk.com>
References: <20260414010050.158064-1-dev@adrianwowk.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[adrianwowk.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-36223-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[adrianwowk.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dev@adrianwowk.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[adrianwowk.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,adrianwowk.com:dkim,adrianwowk.com:email,adrianwowk.com:mid]
X-Rspamd-Queue-Id: 1F0143F4BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

platform_get_drvdata() can return NULL if a VHCI host controller's
probe failed (e.g. due to USB bus number exhaustion). status_show_vhci()
checked for a NULL pdev but not for a NULL hcd returned by
platform_get_drvdata(). Passing NULL to hcd_to_vhci_hcd() does not
return NULL - it returns a pointer offset of 0x260, causing a NULL
pointer dereference when that value is subsequently dereferenced.

Add a NULL check on hcd before calling hcd_to_vhci_hcd(). Move
status_show_not_ready() above status_show_vhci() to make it callable
from the new error path without a forward declaration.

Signed-off-by: Adrian Wowk <dev@adrianwowk.com>
---
 drivers/usb/usbip/vhci_sysfs.c | 52 +++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index d5865460e82..336fb4d92c6 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -59,6 +59,29 @@ static void port_show_vhci(char **out, int hub, int port, struct vhci_device *vd
 	*out += sprintf(*out, "\n");
 }
 
+static ssize_t status_show_not_ready(int pdev_nr, char *out)
+{
+	char *s = out;
+	int i = 0;
+
+	for (i = 0; i < VHCI_HC_PORTS; i++) {
+		out += sprintf(out, "hs  %04u %03u ",
+				    (pdev_nr * VHCI_PORTS) + i,
+				    VDEV_ST_NOTASSIGNED);
+		out += sprintf(out, "000 00000000 0000000000000000 0-0");
+		out += sprintf(out, "\n");
+	}
+
+	for (i = 0; i < VHCI_HC_PORTS; i++) {
+		out += sprintf(out, "ss  %04u %03u ",
+				    (pdev_nr * VHCI_PORTS) + VHCI_HC_PORTS + i,
+				    VDEV_ST_NOTASSIGNED);
+		out += sprintf(out, "000 00000000 0000000000000000 0-0");
+		out += sprintf(out, "\n");
+	}
+	return out - s;
+}
+
 /* Sysfs entry to show port status */
 static ssize_t status_show_vhci(int pdev_nr, char *out)
 {
@@ -76,6 +99,12 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	}
 
 	hcd = platform_get_drvdata(pdev);
+
+	if (!hcd) {
+		usbip_dbg_vhci_sysfs("show status error (hcd is NULL)\n");
+		return status_show_not_ready(pdev_nr, out);
+	}
+
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
@@ -104,29 +133,6 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	return out - s;
 }
 
-static ssize_t status_show_not_ready(int pdev_nr, char *out)
-{
-	char *s = out;
-	int i = 0;
-
-	for (i = 0; i < VHCI_HC_PORTS; i++) {
-		out += sprintf(out, "hs  %04u %03u ",
-				    (pdev_nr * VHCI_PORTS) + i,
-				    VDEV_ST_NOTASSIGNED);
-		out += sprintf(out, "000 00000000 0000000000000000 0-0");
-		out += sprintf(out, "\n");
-	}
-
-	for (i = 0; i < VHCI_HC_PORTS; i++) {
-		out += sprintf(out, "ss  %04u %03u ",
-				    (pdev_nr * VHCI_PORTS) + VHCI_HC_PORTS + i,
-				    VDEV_ST_NOTASSIGNED);
-		out += sprintf(out, "000 00000000 0000000000000000 0-0");
-		out += sprintf(out, "\n");
-	}
-	return out - s;
-}
-
 static int status_name_to_id(const char *name)
 {
 	char *c;
-- 
2.53.0


