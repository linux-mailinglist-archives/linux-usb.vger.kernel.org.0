Return-Path: <linux-usb+bounces-36356-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CFDApNP5mkDuwEAu9opvQ
	(envelope-from <linux-usb+bounces-36356-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:08:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F61F42F126
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2D3230193A3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 16:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9539233F8AA;
	Mon, 20 Apr 2026 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b="IcpExihj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986FE33F8DC
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701163; cv=none; b=L0CbR99GiUwcYigzFXc19dmzUm+9j2nm/q+3XEl15e5i1E3h4IgyOMfMPGlI8fNw9IRtV8T0QaMSmQPnoNMmV8CfQsXqhPusCZ821niwtgcq4u2rKwDmW3P5++dGGnm8qO0DGQ24p5ucl224aUP+m18cj36cCRFPTzMH0Qziyuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701163; c=relaxed/simple;
	bh=m2yrgZ+1T+kFsqRQ/yPG5e7DgRfKsW70ZTavdz6GA/g=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kRVPA8Sfr5yyiPzwfbXet6esk67jBwpvSumdhpo1NiFXNgK9HpZN52RJGXIUCIloi+pP44tgcnAI3wu9s391JmL07601So7lRdcXRFdV4hEyFC17ZuYKJk8iGQK5kvwm6P7vWhBOhQ6SdXozgY5JxC66hjMETzswxj7Z6FZaUlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu; spf=pass smtp.mailfrom=interstellar.eu; dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b=IcpExihj; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interstellar.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interstellar.eu;
	s=protonmail; t=1776701151; x=1776960351;
	bh=jebkYzdSz31Bqr4cEKYtAXqOHBZEOv115eVkMx1FALM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IcpExihj0N7ahHsIWMuVXgX72CLqjvWBnbeyQih5E2GpdeCp2/AT0T2hwdHfN+hEt
	 EsEJK4ZVODRGkzCpPakBTfK8MSobpknTlo8HM6fDOmPtsj8Ms0hHbcI9tFQT9JrOf1
	 ZkhMVyt4H8fX3yEwzyg7KCrbB9L67hZ2Fkqt+w7nf0JstrnmNML6eO7ZBOsrlOgSNR
	 TA28ivdVh2l9bSiczFP4JGRGH+9AQh2Z8/yhAGjMrcZAFgVQV82SNCxcHO9qbKZw/e
	 XyATN/NkgHzH8QyVHQH+RmYRPz6O+sOZwOhVqeMsopZhrho0RQ0fR4S5kdHbqGfJ/+
	 burj8Q80FU64A==
Date: Mon, 20 Apr 2026 16:05:47 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Francesco Orro <ncesco@interstellar.eu>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>
Subject: [RFC PATCH] usb: typec: ucsi: acpi: bootstrap PPM on HP systems with empty _DSM func 2
Message-ID: <f3M_fpjtt8FxDqGKcA84vqXmRbKzCBfpCrIK4-jCWvIscER51zkD8qD8FYpz75qZw51rMDRSkUyYlrBvLvdM8CGRY2l8TFVvr4MC1LdTzbc=@interstellar.eu>
Feedback-ID: 1431670:user:proton
X-Pm-Message-ID: f0c84b443de638f1e3d3714080a0c5a2562ed590
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[interstellar.eu,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[interstellar.eu:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36356-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ncesco@interstellar.eu,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[interstellar.eu:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[interstellar.eu:email,interstellar.eu:dkim,interstellar.eu:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F61F42F126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

The attached RFC patch lets ucsi_acpi probe successfully on HP ZBook
Fury G1i 16 inch (and likely other HP workstations shipping the same
"UcsiAcpi" SSDT), where _DSM func 2 (READ) is a stub and UCSI_VERSION
stays 0. Details in the commit message below.

Main open question for the list: is there a known-good pattern for
ucsi_acpi drivers to avoid disrupting alt-mode state already negotiated
by BIOS? On cold boot with a Thunderbolt dock attached, the PPM_RESET
issued by this patch - and later by Linux UCSI core in ucsi_init() -
tears down the TBT alt-mode the BIOS had set up, and the DP tunnel to
the dock dies until the user physically replugs. My local workaround
is to late-load ucsi_acpi via a systemd service after the thunderbolt
driver has adopted the tunnels, but that feels like papering over a
design assumption I am missing.

Tested on one machine only. Happy to refine the patch if the direction
is acceptable.

Regards,
Francesco Orro

---

From: Francesco Orro <ncesco@interstellar.eu>
Date: Mon, 20 Apr 2026 16:40:00 +0200
Subject: [PATCH v7] usb: typec: ucsi: acpi: bootstrap PPM on systems with e=
mpty _DSM func 2

On HP ZBook Fury G1i 16 inch (BIOS X96 01.03.04) the SSDT16 "UcsiAcpi"
exposes a _DSM function 2 (READ) whose body is empty, so UCSI_VERSION
stays 0x0000 after the read. ucsi_init() treats VERSION=3D0 as firmware
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
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c=092026-04-18 10:46:48.000000000 +0=
200
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c=092026-04-20 17:47:45.529559324 +0=
200
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/dmi.h>
=20
 #include "ucsi.h"
@@ -17,11 +18,15 @@
 #define UCSI_DSM_FUNC_WRITE=091
 #define UCSI_DSM_FUNC_READ=092
=20
+#define UCSI_ACPI_BOOTSTRAP_RETRIES=0920
+#define UCSI_ACPI_BOOTSTRAP_DELAY_MS=0950
+
 struct ucsi_acpi {
 =09struct device *dev;
 =09struct ucsi *ucsi;
 =09void *base;
 =09bool check_bogus_event;
+=09bool needs_bootstrap;
 =09guid_t guid;
 =09u64 cmd;
 };
@@ -46,6 +51,7 @@
 {
 =09struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
 =09int ret;
+=09u32 cci;
=20
 =09ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
 =09if (ret)
@@ -53,6 +59,21 @@
=20
 =09memcpy(version, ua->base + UCSI_VERSION, sizeof(*version));
=20
+=09/*
+=09 * Some firmwares (observed on HP ZBook Fury 16 G1i, SSDT16
+=09 * "UcsiAcpi") leave the VERSION field untouched by _DSM func 2.
+=09 * If the PPM has reached RESET_COMPLETE - typically because the
+=09 * firmware (or our bootstrap on probe) left it in that state -
+=09 * fall back to UCSI 1.2 which matches what those SSDTs advertise.
+=09 */
+=09if (!*version && ua->needs_bootstrap) {
+=09=09memcpy(&cci, ua->base + UCSI_CCI, sizeof(cci));
+=09=09if (cci & UCSI_CCI_RESET_COMPLETE) {
+=09=09=09dev_info(ua->dev, "VERSION unpopulated; defaulting to UCSI 1.2 af=
ter PPM RESET_COMPLETE\n");
+=09=09=09*version =3D UCSI_VERSION_1_2;
+=09=09}
+=09}
+
 =09return 0;
 }
=20
@@ -143,6 +164,56 @@
 =09.async_control =3D ucsi_acpi_async_control
 };
=20
+/*
+ * DMI list of systems whose UCSI ACPI firmware does not populate VERSION
+ * from _DSM func 2 (READ). Entries here opt into ucsi_acpi_bootstrap_ppm(=
)
+ * at probe time.
+ */
+static const struct dmi_system_id ucsi_acpi_bootstrap_quirk[] =3D {
+=09{
+=09=09.ident =3D "HP ZBook Fury G1i 16 inch",
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME,
+=09=09=09=09  "HP ZBook Fury G1i 16 inch"),
+=09=09},
+=09},
+=09{ }
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
+=09u64 cmd =3D UCSI_PPM_RESET;
+=09u32 cci;
+=09int retries;
+
+=09memcpy(&cci, ua->base + UCSI_CCI, sizeof(cci));
+=09if (cci & UCSI_CCI_RESET_COMPLETE) {
+=09=09dev_info(ua->dev, "PPM already in RESET_COMPLETE, skipping bootstrap=
\n");
+=09=09return 0;
+=09}
+
+=09memcpy(ua->base + UCSI_CONTROL, &cmd, sizeof(cmd));
+=09if (ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE))
+=09=09return -EIO;
+
+=09for (retries =3D UCSI_ACPI_BOOTSTRAP_RETRIES; retries > 0; retries--) {
+=09=09msleep(UCSI_ACPI_BOOTSTRAP_DELAY_MS);
+=09=09memcpy(&cci, ua->base + UCSI_CCI, sizeof(cci));
+=09=09if (cci & UCSI_CCI_RESET_COMPLETE)
+=09=09=09return 0;
+=09}
+
+=09return -ETIMEDOUT;
+}
+
 static const struct dmi_system_id ucsi_acpi_quirks[] =3D {
 =09{
 =09=09.matches =3D {
@@ -201,6 +272,15 @@
=20
 =09ua->dev =3D &pdev->dev;
=20
+=09if (dmi_check_system(ucsi_acpi_bootstrap_quirk)) {
+=09=09ua->needs_bootstrap =3D true;
+=09=09ret =3D ucsi_acpi_bootstrap_ppm(ua);
+=09=09if (ret)
+=09=09=09dev_warn(&pdev->dev,
+=09=09=09=09 "PPM bootstrap did not complete (%d); continuing anyway\n",
+=09=09=09=09 ret);
+=09}
+
 =09id =3D dmi_first_match(ucsi_acpi_quirks);
 =09if (id)
 =09=09ops =3D id->driver_data;


