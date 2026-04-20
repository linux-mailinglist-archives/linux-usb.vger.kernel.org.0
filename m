Return-Path: <linux-usb+bounces-36355-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M7hEDZP5mngugEAu9opvQ
	(envelope-from <linux-usb+bounces-36355-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:07:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D136D42F025
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F5A63031A14
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46AF2E093A;
	Mon, 20 Apr 2026 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b="fGXYTsrm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFFE280CD2
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701072; cv=none; b=UBbb+Jqgs1J71S9kKox6tJhzxADitFutUyui+0NPIv9BvrYRWk+iN0ZptJsCTL672h5ifH7+TXAT5PMrtnkQexVKvpgfth4iBCKHa9NyWYwL7t9fMw8tLYja/HX5l0ntfgIDcNDYp4VLaGYKCXWEMZunDEAZTv5NmU3aDtY6904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701072; c=relaxed/simple;
	bh=D+uthKO5yNy8cGkuiOO6o0SwUWTBGOoB7KbCAn5yCSI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FT6yuuGhauAERVbapYXblm6KJq0l6HLcZ6uG0feTVtjJyGXaDgrB6JckwG1j1JhBGLaqT5qh7+TclUMeK12WGcjeG9YKN1pzv1iVLW5+/0fabY2jcpZPQJWw0VIJIhAm/bOX0N/S5AikHZ1C0lK8yBAAd6NXikSHDZ/tnq6fXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu; spf=pass smtp.mailfrom=interstellar.eu; dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b=fGXYTsrm; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interstellar.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interstellar.eu;
	s=protonmail; t=1776701051; x=1776960251;
	bh=EHD+jNGmtCIwewdl2slSqoZLTvzslQVmqjzLxGpvjH8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fGXYTsrmNcjgrAt9o9YXSIxZ3IEHaB82H7BSSoqNGns7HAbtkskRbOYlItfiWA6zD
	 fHxIuGcEZHhmaajLBAY5dhwuLePD2p/e2X7FPmJu1HhmcyPIngoirZNf4ruGiENa4y
	 biE60iqbRNxMzIzSyqLwcn9wgAN5y9r/o8R++np6RlVlhK/Gxz/9I2hDeHJOUatETZ
	 mFTeaDZOTpn5/pH6oddAgbDmnaOXq7nbM6KBlLwu3dvkOa24iTJFPdRgm4UryYXTiZ
	 T1ZMnRf4kf6gWlqcaG+hRVmYZsQEPOaB9rCroSawwIbd+ALjWGezrOUhr/Wpnd2z7R
	 8ropNTyJGLixg==
Date: Mon, 20 Apr 2026 16:04:02 +0000
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Francesco Orro <ncesco@interstellar.eu>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: DP routing from iGPU to discrete Barlow Ridge TB5 on HP ZBook Fury G1i
Message-ID: <pCmilDgt3Xijjdzu7H1d30dzm8IJbXFnle3yQ5nSR1Pj-snchn5xNpcq9Gb7hlh5bnsA3Efnm9cOR_VKi9RyxcRJxHlrqTW7WRPG36UgY5Q=@interstellar.eu>
Feedback-ID: 1431670:user:proton
X-Pm-Message-ID: a6fec4719cc597c7f6e7f78b765ddbf4c1ff23ad
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
	R_DKIM_ALLOW(-0.20)[interstellar.eu:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36355-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ncesco@interstellar.eu,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[interstellar.eu:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,interstellar.eu:dkim,interstellar.eu:mid]
X-Rspamd-Queue-Id: D136D42F025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Setup:
  HP ZBook Fury G1i 16 inch, BIOS X96 01.03.04
  Intel Arrow Lake-HX + Nvidia RTX PRO 1000 Blackwell (hybrid graphics)
  Kernel 6.19.13

The laptop exposes Thunderbolt 5 on both the integrated MTL iTBT (right
USB-C, domain0, 00:0d.2) and a discrete Intel Barlow Ridge (left USB-C,
domain1, 00:06.1 -> 05:00.0).

- Right port: i915 drives a DP tunnel over the iTBT host without issues.
- Left port: no i915 connector ever sees the external monitor. The TB
  driver allocates a DP tunnel on demand but DPRX reads time out, no DP
  source is feeding the Barlow DP_IN adapter.
- With nvidia-drm.modeset=3D1, a DP-MST connector on the Nvidia DRM device
  sees the monitor via the left port (EDID readable, modes negotiated).
  The path Nvidia -> Barlow DP_IN is functional.

Current hypothesis: on this board the discrete Barlow Ridge DP_IN is
either hardwired to a Nvidia output or behind a firmware-programmed mux
that BIOS latches to Nvidia at POST and is not exposed to the OS. i915
would therefore have no path to drive the left ports, by design.

Tests done that did not surface an OS-visible lever:
- i2cdetect across all SMBus/i801 busses: no DP mux/retimer at plausible
  addresses (0x60-0x7F).
- DSDT/SSDT dump (iasl -d): no Device/Method referring to DP routing,
  DPMUX, retimer programming, or dock display source selection.
- HP WMI + /sys/devices/virtual/firmware-attributes/hp-bioscfg attribute
  enumeration: nothing switching dock display source. "Graphics"
  attribute only offers Hybrid/Discrete.
- PCI config dump of Barlow Ridge: standard USB4 NHI, no vendor-specific
  capability hinting at source selection.
- acpi.no_usb4_osc kernel param (locally patched) to opt out of OSC USB4
  native support: no change in i915 visibility of the dock.

Is there any known way to route an Intel DDI output to a PCIe-attached
Barlow Ridge DP_IN adapter, or is this strictly a design where the dGPU
is the only valid DP source for the discrete TB controller on this class
of HP workstations?

Happy to share the DSDT dump, lspci -vvv, full dmesg, or run any test.

Regards,
Francesco Orro

