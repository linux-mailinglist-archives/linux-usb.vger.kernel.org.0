Return-Path: <linux-usb+bounces-36359-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ+QM3Vh5mmavgEAu9opvQ
	(envelope-from <linux-usb+bounces-36359-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 19:25:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C143125D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 19:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE05B300E006
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 17:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7558239D6C8;
	Mon, 20 Apr 2026 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b="KeQAZ+SP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE002FE057
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705833; cv=none; b=JBE3jB6QjnHyCkQS6CKQ3+rBdSb2NqjnVwkqDZ3N6MdwJ+58QgNAmiscFwYbS1LxBhrJxJcYe0wrbRO/wFqzBOlM36daGq0keXQFib1w91F3xtWTXYmgskufJoEGyVJdYRI3irr25+jc9P7d2gO12tW+YvjPByaihJ+9aHdCarE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705833; c=relaxed/simple;
	bh=pvx3CWz+TqQc6WJSltspQ72Rhx6daBmFJ2BQnCBkA9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3CC/jhzB9KXji3XwICkXK89/U45EejhXOBeWcit2gyPK88zZ8Ye8eI4vDUVPoQi5W0NbUDdGiD//4jbAvO70KQGrfHcVhHYfrJefHYouWZlaRFYyTuTzA7foiLAgfbTIiZFmK9ilQGx7ScEwXe+W5DU2yEi0EZcSIjoyeKOFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu; spf=pass smtp.mailfrom=interstellar.eu; dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b=KeQAZ+SP; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interstellar.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interstellar.eu;
	s=protonmail; t=1776705826; x=1776965026;
	bh=WYCawyjvHVblqdq50fKpr98NNV0nEOAvFs9GqNKVKh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KeQAZ+SP9Wshq2OpVFuw/8ItRN1+DoZWIjZ0pJwhCExjGlbUlMBpRT5zRXck8fep2
	 7wqbSpdcXtMBlJLv3dMuLooC/EQgIVrwM0ZMEfY6QiDEYKpthqqML6FFEg/dAnhAzT
	 1OlfTsZ4f6InlOu21mG686Tx48xPG6gEguk7d/Sej85sXUU5UIIKMSt9Jnc9Dll9rA
	 YW7kerV1qs4iZDFYlr7VsZkquSufrFf/j+uf56TKWUqjL2cbsoM5mZPl+Eb1s6bx2h
	 b89vMSxqow4L1tcWng03nC2T3wWKvQ9eccP1DtHkV3ePKWFYYQ+Cf/SSTZoOdzLGWd
	 /GQMyUrKOR0jQ==
X-Pm-Submission-Id: 4fzslh1xGQz2ScWp
From: Francesco Orro <ncesco@interstellar.eu>
To: linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v7] usb: typec: ucsi: acpi: bootstrap PPM on systems with empty _DSM func 2
Date: Mon, 20 Apr 2026 19:23:41 +0200
Message-ID: <20260420172343.84456-1-ncesco@interstellar.eu>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <f3M_fpjtt8FxDqGKcA84vqXmRbKzCBfpCrIK4-jCWvIscER51zkD8qD8FYpz75qZw51rMDRSkUyYlrBvLvdM8CGRY2l8TFVvr4MC1LdTzbc=@interstellar.eu>
References: <f3M_fpjtt8FxDqGKcA84vqXmRbKzCBfpCrIK4-jCWvIscER51zkD8qD8FYpz75qZw51rMDRSkUyYlrBvLvdM8CGRY2l8TFVvr4MC1LdTzbc=@interstellar.eu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[interstellar.eu,quarantine];
	R_DKIM_ALLOW(-0.20)[interstellar.eu:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36359-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ncesco@interstellar.eu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[interstellar.eu:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,interstellar.eu:email,interstellar.eu:dkim,interstellar.eu:mid]
X-Rspamd-Queue-Id: 693C143125D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On HP ZBook Fury G1i 16 inch (BIOS X96 01.03.04) the SSDT16 "UcsiAcpi"
exposes a _DSM function 2 (READ) whose body is empty, so UCSI_VERSION
stays 0x0000 after the read. ucsi_init() treats VERSION=0 as firmware
absent and bails with -ENODEV, so /sys/class/typec is empty and no
alt-mode info reaches userspace.

The PPM is alive: writing UCSI_PPM_RESET through _DSM function 1 (WRITE)
drives RESET_COMPLETE in CCI. We can therefore bootstrap the PPM
explicitly on probe when necessary and, once RESET_COMPLETE is observed,
default VERSION to UCSI 1.2 - which matches the semantics advertised by
the SSDT tables on this platform.

The bootstrap checks CCI first and returns early if RESET_COMPLETE is
already set, to avoid resetting a PPM left in a stable state by
firmware. Note that this early-return path was not exercised on the
tested platform: on cold boot CCI did not have RESET_COMPLETE at probe
time and the PPM_RESET was issued. Consequently, alt-mode state
negotiated during BIOS POST (in this case a Thunderbolt dock's TBT
alt-mode) was disrupted at boot. Linux UCSI core later calls
ucsi_reset_ppm() in ucsi_init() regardless, so the PPM reset on probe
is arguably not the root cause of the disruption, but the patch leaves
the door open to avoid the early reset when firmware does leave the
flag set.

Bootstrap failure is non-fatal: we log a warning and continue. If the
PPM later reaches RESET_COMPLETE asynchronously, read_version() still
recovers via the UCSI_CCI_RESET_COMPLETE check gated by the
needs_bootstrap flag.

The behaviour is gated by DMI because unconditionally issuing a
PPM_RESET on systems whose firmware _does_ populate VERSION correctly
would be aggressive and unjustified. The DMI match starts with HP ZBook
Fury G1i 16 inch; other vendors/models can be added as they are
confirmed.

Tested on HP ZBook Fury G1i 16 inch Mobile Workstation PC with kernel
6.19.13. Before the patch ucsi_acpi probe returns -ENODEV; after the
patch /sys/class/typec/port{0,1,2} appear with partner altmodes
exposed when a USB4/TBT device is connected.

Signed-off-by: Francesco Orro <ncesco@interstellar.eu>
---
Resending: previous send was mangled by quoted-printable encoding.
No content changes.

--- a/drivers/usb/typec/ucsi/ucsi_acpi.c	2026-04-18 10:46:48.000000000 +0200
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c	2026-04-20 17:47:45.529559324 +0200
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/dmi.h>
 
 #include "ucsi.h"
@@ -17,11 +18,15 @@
 #define UCSI_DSM_FUNC_WRITE	1
 #define UCSI_DSM_FUNC_READ	2
 
+#define UCSI_ACPI_BOOTSTRAP_RETRIES	20
+#define UCSI_ACPI_BOOTSTRAP_DELAY_MS	50
+
 struct ucsi_acpi {
 	struct device *dev;
 	struct ucsi *ucsi;
 	void *base;
 	bool check_bogus_event;
+	bool needs_bootstrap;
 	guid_t guid;
 	u64 cmd;
 };
@@ -46,6 +51,7 @@
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
+	u32 cci;
 
 	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
 	if (ret)
@@ -53,6 +59,21 @@
 
 	memcpy(version, ua->base + UCSI_VERSION, sizeof(*version));
 
+	/*
+	 * Some firmwares (observed on HP ZBook Fury 16 G1i, SSDT16
+	 * "UcsiAcpi") leave the VERSION field untouched by _DSM func 2.
+	 * If the PPM has reached RESET_COMPLETE - typically because the
+	 * firmware (or our bootstrap on probe) left it in that state -
+	 * fall back to UCSI 1.2 which matches what those SSDTs advertise.
+	 */
+	if (!*version && ua->needs_bootstrap) {
+		memcpy(&cci, ua->base + UCSI_CCI, sizeof(cci));
+		if (cci & UCSI_CCI_RESET_COMPLETE) {
+			dev_info(ua->dev, "VERSION unpopulated; defaulting to UCSI 1.2 after PPM RESET_COMPLETE\n");
+			*version = UCSI_VERSION_1_2;
+		}
+	}
+
 	return 0;
 }
 
@@ -143,6 +164,56 @@
 	.async_control = ucsi_acpi_async_control
 };
 
+/*
+ * DMI list of systems whose UCSI ACPI firmware does not populate VERSION
+ * from _DSM func 2 (READ). Entries here opt into ucsi_acpi_bootstrap_ppm()
+ * at probe time.
+ */
+static const struct dmi_system_id ucsi_acpi_bootstrap_quirk[] = {
+	{
+		.ident = "HP ZBook Fury G1i 16 inch",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME,
+				  "HP ZBook Fury G1i 16 inch"),
+		},
+	},
+	{ }
+};
+
+/*
+ * Drive PPM_RESET via _DSM WRITE and wait for RESET_COMPLETE, but only if
+ * the firmware hasn't already left the PPM in that state. Skipping the
+ * reset avoids disrupting alt mode state already negotiated by firmware
+ * (e.g. a Thunderbolt dock attached at boot whose TBT alt mode entry
+ * would otherwise be torn down by a fresh PPM reset).
+ */
+static int ucsi_acpi_bootstrap_ppm(struct ucsi_acpi *ua)
+{
+	u64 cmd = UCSI_PPM_RESET;
+	u32 cci;
+	int retries;
+
+	memcpy(&cci, ua->base + UCSI_CCI, sizeof(cci));
+	if (cci & UCSI_CCI_RESET_COMPLETE) {
+		dev_info(ua->dev, "PPM already in RESET_COMPLETE, skipping bootstrap\n");
+		return 0;
+	}
+
+	memcpy(ua->base + UCSI_CONTROL, &cmd, sizeof(cmd));
+	if (ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE))
+		return -EIO;
+
+	for (retries = UCSI_ACPI_BOOTSTRAP_RETRIES; retries > 0; retries--) {
+		msleep(UCSI_ACPI_BOOTSTRAP_DELAY_MS);
+		memcpy(&cci, ua->base + UCSI_CCI, sizeof(cci));
+		if (cci & UCSI_CCI_RESET_COMPLETE)
+			return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
 static const struct dmi_system_id ucsi_acpi_quirks[] = {
 	{
 		.matches = {
@@ -201,6 +272,15 @@
 
 	ua->dev = &pdev->dev;
 
+	if (dmi_check_system(ucsi_acpi_bootstrap_quirk)) {
+		ua->needs_bootstrap = true;
+		ret = ucsi_acpi_bootstrap_ppm(ua);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "PPM bootstrap did not complete (%d); continuing anyway\n",
+				 ret);
+	}
+
 	id = dmi_first_match(ucsi_acpi_quirks);
 	if (id)
 		ops = id->driver_data;

