Return-Path: <linux-usb+bounces-33710-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCLgKrl/n2mrcQQAu9opvQ
	(envelope-from <linux-usb+bounces-33710-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 00:03:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF5819E904
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 00:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A72C3039CBB
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 23:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC14637472D;
	Wed, 25 Feb 2026 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6rsCwWv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCE36F40A
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772060596; cv=none; b=c2yVeO53FpnGSOOMTqNl1wQOgDg8PjTnH30+7KR0qSQwGUULZ9QMeo+vbpayhc+y+xH6y4nj9JAfT1C3z10aaqjlt7I5RKI5c+ZIA4MIjZUZd5BanczXI70He1wWZLMF10xdB6ddNJcoAMA41/xKE8ylU4lrdDKPIt3moCwqJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772060596; c=relaxed/simple;
	bh=o5n/8BHSPhocJAqu5vlmj7hY0mJzh+/WfyTOqEAoVWg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jhJxbnW/ufMYUJVxP8EREm9yCDIPzt5wPTvxz6C83Cd81xtKUfb6k/trxUiwYtwuUH2AXMjKj709ifmlVKKYv0INejwopXhFvLU8+rP5cPDUR4D8ekK+TE2XIC9Nh2pMfV7d1j1phZxJWo5mBanuJ/+s7qCqP/R2jfA1HLFHEYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6rsCwWv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1448C116D0
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 23:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772060595;
	bh=o5n/8BHSPhocJAqu5vlmj7hY0mJzh+/WfyTOqEAoVWg=;
	h=From:To:Subject:Date:From;
	b=t6rsCwWvf8C+A854JmC2OOWsIrsTKofcjn7xj6l0vXq9yjJkZSudMsZslfdlCTPtj
	 b0tgi5k5gAGpZKC+VB3y6USI4U337pcMhE4AFgG2YUC8WUR8+FQ6e0mPsEZS+zrU5+
	 T43LMRDqezQc8flY1YKFzVdJ8alJWT58MCEPPmVWaPf6IuGWo2ZZ1SmG59YrFl6AgF
	 cB/Rqheea5b1RqmP4DzVkf316z+/VO+oZUnH+1Ndq5kL7WIbvvo1pwZZ4N7VPQ09Td
	 3PM4sZNMoUmK3NZ3koa3Igj+/5sITE8mRZHmSVfGnX60aggaY0dwIJe5lRZO+rR6Hn
	 /xDX2CNu6RZxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BFABFC3279F; Wed, 25 Feb 2026 23:03:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221142] New: ucsi_acpi actively breaks USB-C PD charging on
 Lenovo Legion Pro 7 (Arrow Lake)
Date: Wed, 25 Feb 2026 23:03:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alex@alstergee.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221142-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33710-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DFF5819E904
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221142

            Bug ID: 221142
           Summary: ucsi_acpi actively breaks USB-C PD charging on Lenovo
                    Legion Pro 7 (Arrow Lake)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: alex@alstergee.com
        Regression: No

The ucsi_acpi driver actively interferes with USB-C Power Delivery negotiat=
ion
on the Lenovo Legion Pro 7 16IAX10H (83F5, Intel Arrow Lake, BIOS Q7CN44WW).
Blacklisting ucsi_acpi completely fixes the issue =E2=80=94 the EC's PD con=
troller
negotiates correctly on its own.

SYSTEM:
- Lenovo Legion Pro 7 16IAX10H (product ID 83F5)
- Intel Core Ultra 9 275HX (Arrow Lake)
- BIOS Q7CN44WW (Nov 2025, latest available)
- Kernel 6.18.0

SYMPTOMS WITH ucsi_acpi LOADED:
- USB-C PD chargers connect briefly then drop after 1-3 minutes
- voltage_now always reads 0 in /sys/class/power_supply/ucsi-source-psy-*/
- usb_power_delivery_revision on partner reports 0.0 (should be 3.0)
- No source-capabilities PDO objects ever appear in sysfs
- GET_PDOS appears to return empty data from the EC
- GET_CONNECTOR_STATUS returns incomplete RDO
- Some chargers never establish a PD contract at all (Shargeek 100W: only 1=
.4W)
- Failed PD negotiations wedge the UCSI PPM =E2=80=94 requires full reboot =
to recover
- ACPI workqueue warnings: "acpi_os_execute_deferred hogged CPU for >10000u=
s"

RESULTS WITH ucsi_acpi BLACKLISTED:
- Shargeek 100W: 1.4W =E2=86=92 40-55W (full PD negotiation at proper volta=
ge)
- Anker 65W: 5W =E2=86=92 expected full power
- Barrel jack 330W: unaffected (70W, bypasses USB-C)

The EC's PD controller handles negotiation correctly without OS involvement.
The ucsi_acpi driver queries the broken UCSI mailbox and interferes with wh=
at
would otherwise be a working PD contract.

This is the same class of Lenovo EC firmware bug as:
- ThinkPad T14 Gen 5: https://github.com/fwupd/firmware-lenovo/issues/521
  (Lenovo internal ticket LO-4169 =E2=80=94 EC returns static/dummy RDO)
- Framework Laptop 16: PDOs read as 0x00000000 despite successful PD
negotiation

RELATED KERNEL PATCHES:
- Benson Leung, Dec 2025: Fix voltage_now/current_now for non-PD sources
  https://lkml.org/lkml/2025/12/8/912
- Benson Leung, Dec 2025: Fix voltage/current max for non-Fixed PDOs
  https://lkml.org/lkml/2025/12/8/913 (commit 6811e0a08bdc)
  (These fix reporting but don't address the EC returning empty PDO data)

PROPOSED FIX:
The kernel could add a quirk for Lenovo platforms where the UCSI PPM is kno=
wn
to return broken PDO data, either:
1. Skip GET_PDOS calls on affected platforms (let EC handle PD autonomously)
2. Add a module parameter to make ucsi_acpi passive/read-only
3. Detect empty GET_PDOS responses and back off instead of interfering

WORKAROUND:
echo "blacklist ucsi_acpi" > /etc/modprobe.d/blacklist-ucsi.conf

STEPS TO REPRODUCE:
1. Boot Lenovo Legion Pro 7 16IAX10H with kernel 6.18
2. Plug in any USB-C PD charger
3. Observe charging starts briefly then drops (BAT0/status =E2=86=92 Discha=
rging)
4. Check /sys/class/power_supply/ucsi-source-psy-*/voltage_now =E2=86=92 al=
ways 0
5. Blacklist ucsi_acpi, reboot, plug charger =E2=86=92 charges at full PD p=
ower

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

