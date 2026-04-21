Return-Path: <linux-usb+bounces-36389-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PMrOoJc52l87AEAu9opvQ
	(envelope-from <linux-usb+bounces-36389-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 13:16:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B24439FF5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 13:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EBBF300D1FA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 11:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126F23AE187;
	Tue, 21 Apr 2026 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noex.uk header.i=@noex.uk header.b="Dfh0d5j5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6292E38839E
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770173; cv=none; b=MZP9H8pZCZpT025fwmdTBSVmN2AZ6RYCt8ygyFEEfwFZQYFd9lag6qZN5qX7GkZSvOVePL8VWgJ7qQz41qUYq/bR9x3EgZoGPRZau0JNL3OohD8qPCMttCVJ4Szv7CziFw2gzbO/goNBNKcmZsQWzSiOM+B3y56Z7j5KMdET4P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770173; c=relaxed/simple;
	bh=G6FgijXRo0j781KC8tGHQlUBjaxnfkZ9NbTKMXxtEpo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gkKAbs0d8xeD+d+8nTglaZqEqUJ2yAAxhqSUHdrOR8yGvzcmujPc3NzolUlD51KdUiuASmByA1LTRisb2ByOzTzMM5cep2J+PmUIV3sd8UPWVPlHCznNQ1jLHj+VW317ErWy+o2vbUJLNAWST4oRJoUhDlkApWPkoEtIZLU3MrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noex.uk; spf=pass smtp.mailfrom=noex.uk; dkim=pass (2048-bit key) header.d=noex.uk header.i=@noex.uk header.b=Dfh0d5j5; arc=none smtp.client-ip=185.70.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noex.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noex.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noex.uk;
	s=protonmail; t=1776770161; x=1777029361;
	bh=mSZNWZXT5Ox03neWn8NCjpzV5+wr1e4oDJ0fs3PO+ys=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Dfh0d5j5UF5Dbb9WiBFHZH+XpsS7sHaDvjrT+PrWcGGmYK7SebgkUyKXaHDyFYYo8
	 Sag4fgT7TJ9ypZJJuHPkcpv35hPesMY8Fv5ts2yFPOfRBk33dcm/uKeDWhACKIDoYv
	 gcrO8xRbKO3m3ZVB7/IHXNw5yTCbeyz/vYxb7d4FDqhebphBrdugs5Jbyv0+QFDzKp
	 JCLM3HmLIoyx7OGB80/7Q6E0r6sP4QbC9Lh/krmbQ5XhbN+UJxWOYGJUxl3cE3/AXt
	 JQ+w/6Eo9Fas4wWPHuiBV47wHsdaKQJu4pnVd6MMJeD+QKtIRgNjYtTGoGGIgu8RxO
	 6r96InNJGvY/w==
Date: Tue, 21 Apr 2026 11:15:56 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Daniel Dev <daniel.dev@noex.uk>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [BUG] ucsi_acpi: Fails to bind on USBC000 devices, version=0 in NVS blocks probe
Message-ID: <b1Wn_eFvTFShGbd970WWl4CWhge_6P2x7Wb6rab3QHNlE4OJ4p__O-QN3B6I-308ftr5oV5Zr7vywA0vdvmtNw6E0YJnVM2ek_5DcFnkXB0=@noex.uk>
Feedback-ID: 193547545:user:proton
X-Pm-Message-ID: b99624bf625dbef1f77c2b3e489ecb5e11324b9a
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
	DMARC_POLICY_ALLOW(-0.50)[noex.uk,quarantine];
	R_DKIM_ALLOW(-0.20)[noex.uk:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[noex.uk:+];
	TAGGED_FROM(0.00)[bounces-36389-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.dev@noex.uk,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67B24439FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello everyone,

I am reporting two related issues in ucsi_acpi that prevent it from binding=
 on Lenovo ThinkPad T14 Gen 2a (AMD) platforms. The result is that /sys/cla=
ss/typec/ is empty and USB-C display hotplug is non-functional unless a man=
ual workaround is applied.

Hardware:
- Machine: Lenovo ThinkPad T14 Gen 2a (20XLS10M00)
- CPU: AMD Ryzen 7 PRO 5850U
- Kernel: 6.19.12-200.fc43.x86_64 (Reproduced on 6.19.12, 6.19.9, and 6.18.=
19)
- Distros tested: Fedora 43, CachyOS (Arch-based), Arch and Kubuntu (Debian=
-based)

---

### Bug 1: HID Mismatch (USBC000 vs PNP0CA0)
The ACPI device uses "USBC000" as its primary HID, with "PNP0CA0" as a Comp=
atible ID (CID).
```bash
$ cat /sys/bus/platform/devices/USBC000:00/modalias
acpi:USBC000:PNP0CA0:
```
Because ucsi_acpi only matches on PNP0CA0, the ACPI bus does not automatica=
lly bind the driver. Adding USBC000 to the acpi_device_id table is required=
 for automatic discovery on these platforms.

---

### Bug 2: UCSI NVS Version =3D 0x0000 blocks probe
Even when forced to bind (via driver_override), the probe fails because the=
 BIOS does not populate the VERSION field in the UCSI ACPI NVS region at ru=
ntime.

Actual probe failure log:
```text
Apr 21 11:29:37 fedora kernel: platform USBC000:00: bus: 'platform': __driv=
er_probe_device: matched device with driver ucsi_acpi
Apr 21 11:29:37 fedora kernel: platform USBC000:00: bus: 'platform': really=
_probe: probing driver ucsi_acpi with device
Apr 21 11:29:39 fedora kernel: ucsi_acpi USBC000:00: probe with driver ucsi=
_acpi rejects match -19
```

Actual Raw NVS Dump (from UCSI region 0xCBC37000):
```text
Apr 21 11:41:28 fedora kernel: ucsi_peek: version=3D0x0000 cci=3D0x00000002
Apr 21 11:41:28 fedora kernel: ucsi_peek: raw NVS dump:
                                 +00: 00 00 00 00 02 00 00 00 00 00 00 00 0=
0 00 00 00
                                 +10: 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00
                                 +20: 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00
```

---

### Verification of Fix
Manually patching the NVS version field to 0x0100 before probing allows the=
 driver to initialize correctly. This proves the EC firmware is functional =
and the version check is the only blocker.

Logs after patching VERSION to 0x0100:
```text
Apr 21 11:41:28 fedora kernel: ucsi_peek: patching VERSION 0x0000 -> 0x0100
Apr 21 11:41:28 fedora kernel: ucsi_peek: VERSION readback =3D 0x0100
...
Apr 21 11:42:02 fedora kernel: platform USBC000:00: bus: 'platform': really=
_probe: probing driver ucsi_acpi with device
Apr 21 11:42:03 fedora kernel: ucsi_acpi USBC000:00: Registered UCSI interf=
ace with version 1.0.0
Apr 21 11:42:03 fedora kernel: ucsi_acpi USBC000:00: driver: 'ucsi_acpi': d=
river_bound: bound to device
```

---

### Suggested Fixes
1. Add USBC000 to ucsi_acpi_match:
   ```c
   static const struct acpi_device_id ucsi_acpi_match[] =3D {
       { "PNP0CA0", 0 },
       { "USBC000", 0 },
       { },
   };
   ```
2. Handle Version 0 during Probe:
   Modify ucsi_acpi_probe to treat version =3D=3D 0 as a trigger to send PP=
M_RESET (to wake the EC) rather than returning -ENODEV.

Thank you for your time,
Daniel

