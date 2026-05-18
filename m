Return-Path: <linux-usb+bounces-37607-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH/BDjcIC2r4/QQAu9opvQ
	(envelope-from <linux-usb+bounces-37607-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:38:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C656CD12
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9543130416E1
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B3B410D27;
	Mon, 18 May 2026 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fipC5N+j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E0410D00
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107794; cv=pass; b=j67E+tR4qI8nixROHZNU5ALemY+XbnvlDNGrXIvUbjs4+jr41F9CpOi7kzBwi8qzx8dpXCfUXW/WP365rCn48u9FvM45JALCLVZhUG4v42+2t5XS94HGc3/J4+odaxrk9hvdmk23Vl9YfsYmFVhQKnz6j8UDSxQzkRvixNXgdrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107794; c=relaxed/simple;
	bh=gzMpNnWGHH/YKGYDad7xeJnZ7Uw/lZmccNbnUgeHMlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpz0ROroHPYUyFGXgeX09D2vNOIreOX0WkwIdfJAS6Bu1JlNLTlDpqN+RufEurHLVL8pAgPQJdUBDidmGbix+itdICXP7EvD8oWqBEQGABb1VZXitZiUUoX3bGEP6UOUDqeF3eOsP+akTeN+G+iuT0ZVEpeIOA/hKgdDvGWiqjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fipC5N+j; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-392445f11c5so24969681fa.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 05:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779107790; cv=none;
        d=google.com; s=arc-20240605;
        b=FW7GwaL/OUHTbBdOJ6ttUZJBCZsyxYEhZv+7UHlIddLihELe4Ucwo62XxiRd5iO1d4
         OFlqlQ7X6AvBSbXGPhmdJ9gqxU9qkQ4eua1Y5iJBP8eG/xMCvvmbaVy2XkRn+ULJcHzd
         jPEeEVUhrusLk1tPsB6vKwFqRu6HEQoOLJq1tec1gxRq/Jkv6/6r/WRQPyBl+ZvJWKuF
         jcxJTQwSeJDUgq4brktcDQ+D/uiHcc8pRTyAngkIboQksWL1Cuw00CIpJu2vPobWxl4q
         sPhv7pGEwhvcFHQvhZR/NtFI9f2PRwZYwccs4Rj9uuaQLetr0PubkGKLW6t4vn7npFdD
         35Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lx1jxWf2HPPr8Z1eNCrPv0H4jxzM8sNknKeen+FycB8=;
        fh=DN19s0ibwwfJeGavrSM1cHit2/YwAmBInLLPIvjttCQ=;
        b=Zl05ptM+L9A0HgKxzF8yRlxaY55xeu1nWl6gydpHNp7GjgyKvujYm/kTCEtdS71lxG
         ax++NU6IzXSZt8umv0upSF7XQYN2l8SA+z8AmSmVHGjAVPx6vkcDUvjHFTxX9S47BDtP
         CR6bbE6qr4vN5PLWysX+sEtm7DjsNx3N4cHUkU2HaUS99ODk9x0vstpKukaDWvBxiWsm
         sIPQ2nflCfXL52AOwjRmdGpSnQeEpx62bfwkUradnvMa+xQLL8zsXDKiaA+a/8RNvgFD
         HeQiFV9NVWGAfwiYwR7iQATHbBB+yQPF0MsYA4FwYUhWP7HiZNl+tMviG9hPyP5oLcMR
         0Fog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779107790; x=1779712590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx1jxWf2HPPr8Z1eNCrPv0H4jxzM8sNknKeen+FycB8=;
        b=fipC5N+j9gnYwuyuF4pnmhhjpial83NDJHZk91BD+UvrYbgW+g+rmsNgs9FMJyFgsW
         HL+gaz0w1+L4iHAAgM0itRBNaYLlawLhRcULkL/NGMewmLWWWZDAigXg8VSmMQYDeMQg
         PvulbXQno7LlkJV3BYjEJMsCHHKko0o4mBIicx0vvEcKtEyw4PO1TKO4LSjy8nwFS/JV
         S+nzkx/uTGMNO4zCZywTS6NFE5H3Crcxxjbg1Bt4Q2YwkJsEajqaCYVCFViFfDcEorA7
         7pOwMxvRVWeBGe3IfHkJPnDTqqmKhpX8XyQw/DNb02PezR7iu6J2mze9xSakVknvmXmz
         CEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107790; x=1779712590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lx1jxWf2HPPr8Z1eNCrPv0H4jxzM8sNknKeen+FycB8=;
        b=BftDkVXK8ehXOVkVuXhBWVhQMGAxNvGYMbRdc0oNkcibNJEzAkbOe8dIPmaFSgBPpJ
         L4BRI8mXellUDihDE4ATxhC9ELwUlT7kIoh7oxWj+P5hlay/BgD18o/EKTsGhIsTFbcv
         95wgdzoLtvmufV1T4ujxObSwBDgiOAFT6E228oXaRUEJyIr5zH9jm74OoIcznt3uxFVS
         Opgy1DvOACz+P/OtcZXWdcpKTEDw+fXecXYWvNcZwc48rQREXze/IiAy5ibRmmkWrGWF
         QuOmcLe3MKHVayyaQeXnVypTvLp9/kmDW/fXZpNPGF5b5pjnlFuOygqN/GlQCy2pGJHK
         XrZQ==
X-Gm-Message-State: AOJu0YwaKuCnX5GQq2yyWjAr6aVPJ/QBHLCHw3ELutJ5gEJbTjlQLZ4e
	z5kaCcEUUgXUuWskOgGPGdjzgelmjWabfq5Aht1qssl2HYmkOW+xwO4O7tYdhMApyx5lD0jtQym
	SKkWkZ4fdsb2ffwRFnzRRU1gaCQ9N7j8=
X-Gm-Gg: Acq92OHcjVV7qafwEXfv9l0jCUE0PPRQN96BgHbdbZ3QLWIwxnTDYjmXF+D5Rs8VCDB
	NrICmvTQB3A6bLiy9Tx4oMjLaj0LKC5rxGhWb2lLhZzYm/vzcEcSb2G5sHCL+vwYx7yvi6Ztntc
	imqmkz1wmxbEEqMujnK2bCdFufI3T0iPkz4B2Fc5f1HyQNWj0Bz038AqwMzoECR9dYMbwGtqq8W
	8AH98MluUujap13gt6neaEUck6jkfIf+acxC+QrnSX04c2PT8qMLhJy7/oayoDH3cx3M+FBt3cF
	+xI5Sdo=
X-Received: by 2002:a2e:bc14:0:b0:38c:c0de:d58f with SMTP id
 38308e7fff4ca-3945b5d49a1mr54763661fa.14.1779107789639; Mon, 18 May 2026
 05:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
 <20260512122719.51338042.michal.pecio@gmail.com> <CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
 <20260512190203.5695eb7f.michal.pecio@gmail.com> <CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
 <20260518084648.00fdc77e.michal.pecio@gmail.com> <CAGwGCQKyRsyRE_HRCNYgBComN-cZU4SW0j-cq3OwqG=-VH4NKA@mail.gmail.com>
In-Reply-To: <CAGwGCQKyRsyRE_HRCNYgBComN-cZU4SW0j-cq3OwqG=-VH4NKA@mail.gmail.com>
From: Anders Thomson <andtho888@gmail.com>
Date: Mon, 18 May 2026 14:36:18 +0200
X-Gm-Features: AVHnY4LEgnAdOW7pSJjKvzhD1a-r02f2E5kAIKySPxvbfYQydxaFTI50a3h-BkY
Message-ID: <CAGwGCQJ6SaB_mLH5DGttVDXHvvNW9zrSnijwYxp2W4d_W40FRw@mail.gmail.com>
Subject: Re: renesas 1912:0014 failures
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8C7C656CD12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37607-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andtho888@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 10:41=E2=80=AFAM Anders Thomson <andtho888@gmail.co=
m> wrote:
>

> > I see you still have the quirk, but it doesn't matter, the chip is
> > stuck and doesn't work either way.
>
> The machine hangs on boot with the quirk. Without quirk i get:
> [    2.293602] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    2.303526] sr 5:0:0:0: Attached scsi CD-ROM sr0
> [    2.303603] sr 5:0:0:0: Attached scsi generic sg4 type 5
> [   28.493779] xhci-pci-renesas 0000:03:00.0: xHCI Host Controller
> [   28.493891] xhci-pci-renesas 0000:03:00.0: new USB bus registered,
> assigned bus number 9
> [   28.499338] xhci-pci-renesas 0000:03:00.0: hcc params 0x014051cf
> hci version 0x100 quirks 0x0000000100000090
>
> Those 28.xxx  renesas lines never show up with the quirk applied. The
> machine works (waiting 10 minutes I get a logs from other kernel
> threads), but the boot process is stopped. By the looks of it, no usb
> probing completes.
>
Some advances, perhaps. I _did_ get (twice) the boot to succeed with
the quirk (still with the 26 sec pause) . Both times was after a full
power cycle (PSU on/off). After a regular I/O Button press during, the
boot stalls. I'll run this a few times more to verify.

After successful boot with quirk, 1st suspend/resume without
peripherals attached, yielded:
[ 1057.321336] CPU3 is up
[ 1057.324889] ACPI: PM: Waking up from system sleep state S3
[ 1057.327299] usb usb2: root hub lost power or was reset
[ 1057.327321] usb usb4: root hub lost power or was reset
[ 1057.327387] usb usb5: root hub lost power or was reset
[ 1057.327406] usb usb6: root hub lost power or was reset
[ 1057.327455] usb usb7: root hub lost power or was reset
[ 1057.327484] usb usb8: root hub lost power or was reset
[ 1057.327587] usb usb9: root hub lost power or was reset
[ 1057.327589] usb usb10: root hub lost power or was reset
[ 1057.327592] xhci-pci-renesas 0000:03:00.0: Stop HCD
[ 1057.327599] xhci-pci-renesas 0000:03:00.0: // Halt the HC
[ 1057.327613] xhci-pci-renesas 0000:03:00.0: // Reset the HC
[ 1057.332908] xhci-pci-renesas 0000:03:00.0: Wait for controller to
be ready for doorbell rings
[ 1057.332958] xhci-pci-renesas 0000:03:00.0: // Disabling event ring inter=
rupts
[ 1057.332967] xhci-pci-renesas 0000:03:00.0: cleaning up memory
[ 1057.332984] xhci-pci-renesas 0000:03:00.0: Freed interrupters
[ 1057.332986] xhci-pci-renesas 0000:03:00.0: Freed command ring
[ 1057.332992] xhci-pci-renesas 0000:03:00.0: Freed segment pool
[ 1057.332993] xhci-pci-renesas 0000:03:00.0: Freed device context pool
[ 1057.332995] xhci-pci-renesas 0000:03:00.0: Freed small stream array pool
[ 1057.332997] xhci-pci-renesas 0000:03:00.0: Freed xhci port bw array pool
[ 1057.332999] xhci-pci-renesas 0000:03:00.0: Freed medium stream array poo=
l
[ 1057.333129] xhci-pci-renesas 0000:03:00.0: xhci_stop completed - status =
=3D 1
[ 1057.333131] xhci-pci-renesas 0000:03:00.0: Initialize the xhci_hcd
[ 1057.333133] xhci-pci-renesas 0000:03:00.0: Starting xhci_init
[ 1057.333137] xhci-pci-renesas 0000:03:00.0: HCD page size set to 4K
[ 1057.333141] xhci-pci-renesas 0000:03:00.0: Device context base
array address =3D 0x0x0000000002275000 (DMA), 0000000027fc954c (virt)
[ 1057.333148] xhci-pci-renesas 0000:03:00.0: Allocated command ring
at 000000002ad20c16
[ 1057.333150] xhci-pci-renesas 0000:03:00.0: First segment DMA is
0x0x0000000002279000
[ 1057.333152] xhci-pci-renesas 0000:03:00.0: Allocating primary event ring
[ 1057.333159] xhci-pci-renesas 0000:03:00.0: Allocating 4 scratchpad buffe=
rs
[ 1057.333194] xhci-pci-renesas 0000:03:00.0: Ext Cap
00000000f9dfb55c, port offset =3D 1, count =3D 4, revision =3D 0x3
[ 1057.333204] xhci-pci-renesas 0000:03:00.0: Ext Cap
00000000a5235153, port offset =3D 5, count =3D 4, revision =3D 0x2
[ 1057.333206] xhci-pci-renesas 0000:03:00.0: Found 4 USB 2.0 ports
and 4 USB 3.0 ports.
[ 1057.333209] xhci-pci-renesas 0000:03:00.0: xHC can handle at most
32 device slots
[ 1057.333217] xhci-pci-renesas 0000:03:00.0: Setting Max device slots
reg =3D 0x20
[ 1057.333232] xhci-pci-renesas 0000:03:00.0: Setting command ring
address to 0x2279001
[ 1057.333237] xhci-pci-renesas 0000:03:00.0: Doorbell array is
located at offset 0x800 from cap regs base addr
[ 1057.333247] xhci-pci-renesas 0000:03:00.0: // Write event ring
dequeue pointer, preserving EHB bit
[ 1057.333249] xhci-pci-renesas 0000:03:00.0: Finished xhci_init
[ 1057.333251] xhci-pci-renesas 0000:03:00.0: Start the primary HCD
[ 1057.333253] xhci-pci-renesas 0000:03:00.0: xhci_run
[ 1057.333263] xhci-pci-renesas 0000:03:00.0: ERST deq =3D 64'h2278000
[ 1057.333267] xhci-pci-renesas 0000:03:00.0: Finished xhci_run for main hc=
d
[ 1057.333415] xhci-pci-renesas 0000:03:00.0: Start the secondary HCD
[ 1057.333417] xhci-pci-renesas 0000:03:00.0: Enable interrupts
[ 1057.333426] xhci-pci-renesas 0000:03:00.0: Enable primary interrupter
[ 1057.333435] xhci-pci-renesas 0000:03:00.0: // Turn on HC, cmd =3D 0x5.
[ 1057.336587] xhci-pci-renesas 0000:03:00.0: xhci_resume: starting
usb9 port polling.
[ 1057.336611] xhci-pci-renesas 0000:03:00.0: xhci_hub_status_data:
stopping usb9 port polling
[ 1057.336644] xhci-pci-renesas 0000:03:00.0: set port power 9-1 ON,
portsc: 0x2a0
[ 1057.336654] xhci-pci-renesas 0000:03:00.0: set port power 10-1 ON,
portsc: 0x2a0
[ 1057.336675] xhci-pci-renesas 0000:03:00.0: set port power 10-2 ON,
portsc: 0x2a0
[ 1057.336683] xhci-pci-renesas 0000:03:00.0: set port power 9-2 ON,
portsc: 0x2a0
[ 1057.336698] xhci-pci-renesas 0000:03:00.0: set port power 10-3 ON,
portsc: 0x2a0
[ 1057.336707] xhci-pci-renesas 0000:03:00.0: set port power 9-3 ON,
portsc: 0x2a0
[ 1057.336722] xhci-pci-renesas 0000:03:00.0: set port power 10-4 ON,
portsc: 0x2a0
[ 1057.336731] xhci-pci-renesas 0000:03:00.0: set port power 9-4 ON,
portsc: 0x2a0
[ 1057.357444] xhci-pci-renesas 0000:03:00.0: Get port status 9-1
read: 0x2a0, return 0x100
[ 1057.357460] xhci-pci-renesas 0000:03:00.0: Get port status 9-2
read: 0x2a0, return 0x100
[ 1057.357473] xhci-pci-renesas 0000:03:00.0: Get port status 9-3
read: 0x2a0, return 0x100
[ 1057.357485] xhci-pci-renesas 0000:03:00.0: Get port status 9-4
read: 0x2a0, return 0x100
[ 1057.389904] r8169 0000:02:00.0 enp2s0: Link is Down
[ 1057.443447] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
read: 0x2a0, return 0x2a0
[ 1057.443465] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
read: 0x2a0, return 0x2a0
[ 1057.443478] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
read: 0x2a0, return 0x2a0
[ 1057.443491] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
read: 0x2a0, return 0x2a0
[ 1057.445180] OOM killer enabled.
[ 1057.445221] Restarting tasks: Starting
[ 1057.445387] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-1 status  =3D 0xe0002a0
[ 1057.445422] xhci-pci-renesas 0000:03:00.0: xhci_hub_status_data:
stopping usb9 port polling
[ 1057.445498] Restarting tasks: Done
[ 1057.445597] random: crng reseeded on system resumption
[ 1057.445844] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-2 status  =3D 0xe0002a0
[ 1057.445920] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-3 status  =3D 0xe0002a0
[ 1057.445939] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-4 status  =3D 0xe0002a0
[ 1057.449379] PM: suspend exit
[ 1057.472455] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
read: 0x2a0, return 0x2a0
[ 1057.472485] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
read: 0x2a0, return 0x2a0
[ 1057.472496] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
read: 0x2a0, return 0x2a0
[ 1057.472505] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
read: 0x2a0, return 0x2a0
[ 1057.648805] ata2: SATA link down (SStatus 0 SControl 300)
[ 1057.675671] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-1 status  =3D 0xe0002a0
[ 1057.675702] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-2 status  =3D 0xe0002a0
[ 1057.675727] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-3 status  =3D 0xe0002a0
[ 1057.675750] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-4 status  =3D 0xe0002a0
[ 1057.702449] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
read: 0x2a0, return 0x2a0
[ 1057.702473] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
read: 0x2a0, return 0x2a0
[ 1057.702489] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
read: 0x2a0, return 0x2a0
[ 1057.702505] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
read: 0x2a0, return 0x2a0
[ 1057.907650] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-1 status  =3D 0xe0002a0
[ 1057.907685] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-2 status  =3D 0xe0002a0
[ 1057.907710] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-3 status  =3D 0xe0002a0
[ 1057.907734] xhci-pci-renesas 0000:03:00.0: set port remote wake
mask, actual port 10-4 status  =3D 0xe0002a0
[ 1057.907788] xhci-pci-renesas 0000:03:00.0: xhci_hub_status_data:
stopping usb10 port polling
[ 1057.963448] xhci-pci-renesas 0000:03:00.0: xhci_hub_status_data:
stopping usb10 port polling



After the second suspend/resume, we got this:

[ 1695.841292] PM: suspend entry (deep)
[ 1696.015699] Filesystems sync: 0.174 seconds
[ 1696.016530] Freezing user space processes
[ 1696.017206] Freezing user space processes completed (elapsed 0.000 secon=
ds)
[ 1696.017251] OOM killer disabled.
[ 1696.017289] Freezing remaining freezable tasks
[ 1696.018205] Freezing remaining freezable tasks completed (elapsed
0.000 seconds)
[ 1696.018275] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[ 1696.023467] xhci-pci-renesas 0000:03:00.0: Get port status 9-1
read: 0x2a0, return 0x100
[ 1696.023494] xhci-pci-renesas 0000:03:00.0: Get port status 9-2
read: 0x2a0, return 0x100
[ 1696.023505] xhci-pci-renesas 0000:03:00.0: Get port status 9-3
read: 0x2a0, return 0x100
[ 1696.023515] xhci-pci-renesas 0000:03:00.0: Get port status 9-4
read: 0x2a0, return 0x100
[ 1696.047191] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
read: 0x2a0, return 0x2a0
[ 1696.047209] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
read: 0x2a0, return 0x2a0
[ 1696.047224] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
read: 0x2a0, return 0x2a0
[ 1696.047237] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
read: 0x2a0, return 0x2a0
[ 1696.048846] sd 7:0:0:0: [sdf] Synchronizing SCSI cache
[ 1696.048995] xhci-pci-renesas 0000:03:00.0: config port 10-1 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049179] xhci-pci-renesas 0000:03:00.0: config port 10-2 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049188] xhci-pci-renesas 0000:03:00.0: config port 10-3 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049195] xhci-pci-renesas 0000:03:00.0: config port 10-4 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049302] xhci-pci-renesas 0000:03:00.0: config port 9-1 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049308] xhci-pci-renesas 0000:03:00.0: config port 9-2 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049314] xhci-pci-renesas 0000:03:00.0: config port 9-3 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049321] xhci-pci-renesas 0000:03:00.0: config port 9-4 wake
bits, portsc: 0x2a0, write: 0x202a0
[ 1696.049323] xhci-pci-renesas 0000:03:00.0: xhci_suspend: stopping
usb9 port polling.
[ 1696.049433] r8169 0000:02:00.0 enp2s0: Link is Down
[ 1696.059820] xhci-pci-renesas 0000:03:00.0: Setting command ring
address to 0x2279001
[ 1696.062191] sd 3:0:0:0: [sdd] Synchronizing SCSI cache
[ 1696.063214] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 1696.063248] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
[ 1696.063457] ata1.00: Entering standby power mode
[ 1696.063722] ata3.00: Entering standby power mode
[ 1696.066204] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[ 1696.441672] ata4.00: Entering standby power mode
[ 1697.174324] ACPI: PM: Preparing to enter system sleep state S3
[ 1697.174519] ACPI: PM: Saving platform NVS memory
[ 1697.174753] Disabling non-boot CPUs ...
[ 1697.176350] smpboot: CPU 3 is now offline
[ 1697.178481] smpboot: CPU 2 is now offline
[ 1697.180591] smpboot: CPU 1 is now offline
[ 1697.187535] ACPI: PM: Low-level resume complete
[ 1697.187562] ACPI: PM: Restoring platform NVS memory
[ 1697.188011] Enabling non-boot CPUs ...
[ 1697.188054] smpboot: Booting Node 0 Processor 1 APIC 0x1
[ 1697.198800] CPU1 is up
[ 1697.198829] smpboot: Booting Node 0 Processor 2 APIC 0x2
[ 1697.208029] CPU2 is up
[ 1697.208052] smpboot: Booting Node 0 Processor 3 APIC 0x3
[ 1697.217860] CPU3 is up
[ 1697.221248] ACPI: PM: Waking up from system sleep state S3
[ 1697.223806] usb usb2: root hub lost power or was reset
[ 1697.223828] usb usb4: root hub lost power or was reset
[ 1697.223894] usb usb5: root hub lost power or was reset
[ 1697.223914] usb usb6: root hub lost power or was reset
[ 1697.223952] usb usb7: root hub lost power or was reset
[ 1697.223979] usb usb8: root hub lost power or was reset
[ 1697.224069] usb usb9: root hub lost power or was reset
[ 1697.224070] usb usb10: root hub lost power or was reset
[ 1697.224073] xhci-pci-renesas 0000:03:00.0: Stop HCD
[ 1697.224075] xhci-pci-renesas 0000:03:00.0: // Halt the HC
[ 1697.224087] xhci-pci-renesas 0000:03:00.0: // Reset the HC
[ 1697.548223] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 1697.548260] ata5: SATA link down (SStatus 0 SControl 300)
[ 1697.549400] ata2: SATA link down (SStatus 0 SControl 300)
[ 1698.095163] ata6.00: configured for UDMA/33
[ 1702.593051] ata4: link is slow to respond, please be patient (ready=3D0)
[ 1703.059049] ata3: link is slow to respond, please be patient (ready=3D0)
[ 1703.112051] ata1: link is slow to respond, please be patient (ready=3D0)
[ 1703.523047] ata2: link is slow to respond, please be patient (ready=3D0)
[ 1705.544059] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1705.550387] sd 2:0:0:0: [sdc] Starting disk
[ 1705.552417] ata3.00: configured for UDMA/133
[ 1705.652075] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1705.652799] sd 0:0:0:0: [sda] Starting disk
[ 1705.653552] ata1.00: configured for UDMA/133
[ 1706.373048] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1708.237896] sd 3:0:0:0: [sdd] Starting disk
[ 1708.241270] ata4.00: configured for UDMA/133
[ 1710.319031] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1710.332338] ata2.00: configured for UDMA/133
[ 1718.229968] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[ 1718.229971] rcu:     1-...0: (1 GPs behind)
idle=3D171c/1/0x4000000000000000 softirq=3D3787/3788 fqs=3D5036
[ 1718.229975] rcu:     (detected by 3, t=3D21002 jiffies, g=3D7661, q=3D20=
 ncpus=3D4)
[ 1718.229979] Sending NMI from CPU 3 to CPUs 1:
[ 1718.229984] NMI backtrace for cpu 1
[ 1718.229988] CPU: 1 UID: 0 PID: 801 Comm: kworker/u17:2 Tainted: G S
                 7.0.3 #6 PREEMPT(full)
[ 1718.229992] Tainted: [S]=3DCPU_OUT_OF_SPEC
[ 1718.229993] Hardware name: HP-Pavilion FJ422AA-UUW
a6551.sc/Benicia, BIOS 5.32    10/23/2008
[ 1718.229995] Workqueue: async async_run_entry_fn
[ 1718.230003] RIP: 0010:delay_tsc+0x2e/0xa0
[ 1718.230007] Code: ff 05 56 b7 50 01 65 44 8b 0d 52 b7 50 01 0f ae
e8 0f 31 48 c1 e2 20 48 89 d7 48 09 c7 eb 21 65 ff 0d 36 b7 50 01 74
57 f3 90 <65> ff 05 2b b7 50 01 65 8b 35 28 b7 50 01 41 39 f1 75 28 41
89 f1
[ 1718.230010] RSP: 0000:ffff9dd300c97d10 EFLAGS: 00000083
[ 1718.230012] RAX: 0000000bf64c6add RBX: 0000000094c8677a RCX: 00000000000=
00002
[ 1718.230014] RDX: 0000000000000321 RSI: 0000000000000001 RDI: 0000000bf64=
c67bc
[ 1718.230015] RBP: 0000000000989680 R08: 0000000000000960 R09: 00000000000=
00001
[ 1718.230016] R10: 00000000ffffe000 R11: 0000000000000000 R12: 00000000000=
00000
[ 1718.230018] R13: 0000000000000002 R14: ffff9dd300316020 R15: 00000000000=
00001
[ 1718.230019] FS:  0000000000000000(0000) GS:ffff98c1466c5000(0000)
knlGS:0000000000000000
[ 1718.230021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1718.230022] CR2: 0000000000000000 CR3: 0000000005dc8000 CR4: 00000000000=
026f0
[ 1718.230024] Call Trace:
[ 1718.230027]  <TASK>
[ 1718.230028]  xhci_handshake+0x6e/0xc0
[ 1718.230034]  xhci_reset+0x65/0x110
[ 1718.230036]  xhci_resume+0x146/0x710
[ 1718.230039]  resume_common+0x8b/0x110
[ 1718.230043]  ? __pfx_pci_pm_resume+0x10/0x10
[ 1718.230046]  dpm_run_callback+0x4b/0x170
[ 1718.230050]  device_resume+0x158/0x250
[ 1718.230052]  async_resume+0x14/0x20
[ 1718.230054]  async_run_entry_fn+0x29/0x130
[ 1718.230058]  process_one_work+0x163/0x370
[ 1718.230062]  worker_thread+0x18f/0x300
[ 1718.230065]  ? __pfx_worker_thread+0x10/0x10
[ 1718.230068]  kthread+0xda/0x110
[ 1718.230072]  ? __pfx_kthread+0x10/0x10
[ 1718.230075]  ret_from_fork+0x1af/0x2b0
[ 1718.230078]  ? __pfx_kthread+0x10/0x10
[ 1718.230081]  ret_from_fork_asm+0x1a/0x30
[ 1718.230086]  </TASK>
[ 1718.758984] rcu: INFO: rcu_preempt detected expedited stalls on
CPUs/tasks: { 1-...D } 21306 jiffies s: 489 root: 0x2/.
[ 1718.758991] rcu: blocking rcu_node structures (internal RCU debug):
[ 1718.758993] Sending NMI from CPU 0 to CPUs 1:
[ 1718.758997] NMI backtrace for cpu 1
[ 1718.758999] CPU: 1 UID: 0 PID: 801 Comm: kworker/u17:2 Tainted: G S
                 7.0.3 #6 PREEMPT(full)
[ 1718.759002] Tainted: [S]=3DCPU_OUT_OF_SPEC
[ 1718.759003] Hardware name: HP-Pavilion FJ422AA-UUW
a6551.sc/Benicia, BIOS 5.32    10/23/2008
[ 1718.759004] Workqueue: async async_run_entry_fn
[ 1718.759007] RIP: 0010:xhci_handshake+0x51/0xc0
[ 1718.759010] Code: fa 8b 07 89 f1 49 89 fe 41 89 f5 21 c1 41 39 cc
75 22 eb 3c f3 90 48 81 eb e9 03 00 00 48 89 da 48 c1 ea 3f 44 21 fa
41 8b 06 <44> 89 e9 21 c1 44 39 e1 74 1c 83 f8 ff 74 2d 84 d2 75 3d bf
c7 10
[ 1718.759012] RSP: 0000:ffff9dd300c97d18 EFLAGS: 00000046
[ 1718.759014] RAX: 0000000000000002 RBX: 00000000898430c3 RCX: 00000000000=
00002
[ 1718.759015] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000c41f=
90e71
[ 1718.759016] RBP: 0000000000989680 R08: 0000000000000960 R09: 00000000000=
00001
[ 1718.759018] R10: 00000000ffffe000 R11: 0000000000000000 R12: 00000000000=
00000
[ 1718.759019] R13: 0000000000000002 R14: ffff9dd300316020 R15: 00000000000=
00001
[ 1718.759020] FS:  0000000000000000(0000) GS:ffff98c1466c5000(0000)
knlGS:0000000000000000
[ 1718.759022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1718.759024] CR2: 0000000000000000 CR3: 0000000005dc8000 CR4: 00000000000=
026f0
[ 1718.759025] Call Trace:
[ 1718.759026]  <TASK>
[ 1718.759027]  xhci_reset+0x65/0x110
[ 1718.759029]  xhci_resume+0x146/0x710
[ 1718.759032]  resume_common+0x8b/0x110
[ 1718.759035]  ? __pfx_pci_pm_resume+0x10/0x10
[ 1718.759037]  dpm_run_callback+0x4b/0x170
[ 1718.759040]  device_resume+0x158/0x250
[ 1718.759042]  async_resume+0x14/0x20
[ 1718.759044]  async_run_entry_fn+0x29/0x130
[ 1718.759048]  process_one_work+0x163/0x370
[ 1718.759050]  worker_thread+0x18f/0x300
[ 1718.759053]  ? __pfx_worker_thread+0x10/0x10
[ 1718.759056]  kthread+0xda/0x110
[ 1718.759059]  ? __pfx_kthread+0x10/0x10
[ 1718.759062]  ret_from_fork+0x1af/0x2b0
[ 1718.759065]  ? __pfx_kthread+0x10/0x10
[ 1718.759068]  ret_from_fork_asm+0x1a/0x30
[ 1718.759072]  </TASK>
[ 1725.214850] clocksource: Long readout interval, skipping watchdog
check: cs_nsec: 27695782517 wd_nsec: 27695786524
[ 1725.214860] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
[ 1725.214863] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
[ 1725.214875] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
pci_pm_resume returns -110
[ 1725.214879] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
async: error -110
[ 1725.217115] r8169 0000:02:00.0 enp2s0: Link is Down
[ 1725.240097] sd 1:0:0:0: [sdb] Starting disk
[ 1725.253882] OOM killer enabled.
[ 1725.253932] Restarting tasks: Starting
[ 1725.254172] Restarting tasks: Done
[ 1725.254251] random: crng reseeded on system resumption
[ 1725.254860] PM: suspend exit
[ 1727.460670] r8169 0000:02:00.0 enp2s0: Link is Up - 1Gbps/Full -
flow control rx/tx
[ 2004.214804] kworker/u17:31 (678) used greatest stack depth: 12248 bytes =
left

I hope that sheds some light on things.

Br,
Anders

