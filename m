Return-Path: <linux-usb+bounces-37582-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K4hFe3QCmru8QQAu9opvQ
	(envelope-from <linux-usb+bounces-37582-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:42:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C8569078
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B01B0300C58F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 08:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538FC3E2AD5;
	Mon, 18 May 2026 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB6gSVWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FAC3E121A
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093698; cv=pass; b=poX6RD4wlS52k+T72bRaqlBU4waU8tdyIUNJw6cyxrfGaFHuS127T6y4o6PE7kMLquU/Zv73O7YU/3Dxu99l1d1MEOlmQ0jjkdcHlbT00NDclvEKAQqG4Uhx+31MKkuG06UtbtIswWMakN1BLH9D7de1yrvuO86r9ZCCmC06PQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093698; c=relaxed/simple;
	bh=OEeBuM2geI8k9VDeShg+CBoWPAm6ZOz7U4Do6PQeKJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNjj5hB/eTytJxXQa+T+jdDJlyVKEI7x4mFc28WLUaJ6izEAJeCz9rgJkzZpaI/Ywyux7LcmBBxUqOm37MkycJAwp2yOHfFOYw2vO+vq+Uhp0B3PDwdgIe31taFoFhLkx9l+i1pVwG3FfqTvmURYF0gCv14EgVEQ190vQvLh5X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB6gSVWy; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39556b00a85so19114171fa.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 01:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779093695; cv=none;
        d=google.com; s=arc-20240605;
        b=X54EHIm6U7XgBVzDXUzoSb4kV1EljadpVC0ERltdEnQWPJBBvg3YSkmLCl5lDaDMTB
         vCpk+UPu4R7AXMXk15SKC9Mz3KTPtTouT1Y/dx0cG5LZGR+lMiKGkpUXFrB5QXvH/AuK
         LYqfA6AM6UbbF0QCbH0VqIrVQXNb9mNHlztiGXvigli10lcdODfQzfz8bKMSMK2bK7+n
         lPIL4RpNQCbbWZJZ0Cb8AiojIWumgC5gGlIRFZT2RDX+ikB/oqwJzex/2dp72V90WHj7
         F+NqHoTUjuYM9SLeS6xZze23BcA5vnTvT/qlAb4CyO8O6k1+uZBJkGRGhR9sjB6hj/7W
         6Dhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKnU3D4N886VKwg6I/DtlPHc3UecmhrAC8tjca7evEA=;
        fh=DN19s0ibwwfJeGavrSM1cHit2/YwAmBInLLPIvjttCQ=;
        b=LilhgYfTTkrWR9PZdtYvvlY2ec8lbcdW07nn6uJUWVlDBu4lfOVuFZjwe6lb4ksXiL
         27qaBSBK6WPsY0zlA+GAkwyPi3FC6fAo/RoAAPrOdR+Rj0wSP8dosQFusSWH80Ew49Er
         KIO8WzpEtOzrbEXpewrGQ2m+O9IguZTLB5GdYLGWEfXMdKz6Sr0XoFjJplUaP0/NUXUq
         o5FaFcQiEginmz28/c8ZB7DrErlnX/B0mQ0K4FD337FUj24q7B6vfQdRjarnldqS4k6g
         5FvKorkZ+ofsHJpEdne7PY86BCsG+w5o5+g6K9ENDBklLFCGQUmao76ZxPcvBxwcac4/
         vH5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779093695; x=1779698495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKnU3D4N886VKwg6I/DtlPHc3UecmhrAC8tjca7evEA=;
        b=NB6gSVWyaKMXyeatoaEZ7AeXaHeDRb5lA+jqcI6VmXXHrdRF8mEMIC3PJSea7BHVZ8
         8QRduL+nxRIvQ6GMxPQi3cXcOk1MKjIhUGG5xIFUUHOElBLjE/bRGYQ9Cwk8ZOz5EOHL
         eqsha7Oc1R3/cr19ERyl/XsVF0ZPO+LGZH112vIZctVjfL0JfJGSroVO49ZrOZKHVjBC
         Kj6ESHlSQawAdJSbYzSvfFB+75KJVDjvUYmHWEaGeIOoyKoBRFfr8jBLa9YvDJI+16XF
         DmjPY+uofjaeRdWe2BrWdt3Eg6WP9ZTAI88A6kMghrFWiFkJh1JFh2h7o0ntIJ2KADx2
         vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093695; x=1779698495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dKnU3D4N886VKwg6I/DtlPHc3UecmhrAC8tjca7evEA=;
        b=pm0jVa0GnwLZ1g8h7v3fGaCchwbLruiq3wSD+v8cm+aGgFZPMibpEFWgssam/bgDAm
         rL8QDBTzDj7ZdrzcKusmBpYacURr+pcH1y/PFjGK6HRHQRNX25tZwoi3/ALkKKpJGktr
         wD2YQaXrE12yv3HpvNJBbyVozATsf42DSg7HfdhcTlLiz8BkwRr+XrVKzbGFb9T1DoHl
         TmmYSw8Y+275qyPshS5QDtHOzxEA5nJ5rrvOtGyT7dTl7UvMSKSOEg5KnfBax3VNYXox
         ybwiPL2OQmIIrrKKWxIPlILqS3ffcDvhj6A2n+02oiXy/a+V2zdBpw3tdwJKjFPFnzjb
         QTLA==
X-Gm-Message-State: AOJu0YwNzzANq7np5tZt43aoi4P74LznF/gxmGp4DpN94MJqSIhhpAkB
	NJBkh3GiQdY6hbqffssa23tXhBkCbIwamAjMup64KxJwtGRFUBzbI37ElW0WTUDwU9Ar8cnqyAp
	NMxginz9pQ/iErtl6axcdXDG2V0MLgGKbulCY
X-Gm-Gg: Acq92OF+CE+iYjPojzwEQ4w4GKb46pfdjy6vA5aO2F8dkTvZKrfx59xnFkitCU2pi4u
	omZA0cB5yAS1ixs/+ZaYeIHQhfALxDC2HylreDZ6k/b0hc7lwS7qTNJE/pFV989YysIKwl8qTTJ
	k6n4Qx6NQeuna07JcerCkbgN1+1ttZwDH3kPp+ARqVScANRM8EisAW/ojQlNbOOzTVgDQUf5Mjf
	cX872MM3KgU0IC/kqr2kdSNZ86XYeLSG16/3Skq+5pLOytwvQKa2d+cds5MdwW2UOdXOTvmunfp
	U9fKaS4=
X-Received: by 2002:a2e:9645:0:b0:393:ba06:158f with SMTP id
 38308e7fff4ca-39561d877e1mr37464701fa.16.1779093695144; Mon, 18 May 2026
 01:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
 <20260512122719.51338042.michal.pecio@gmail.com> <CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
 <20260512190203.5695eb7f.michal.pecio@gmail.com> <CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
 <20260518084648.00fdc77e.michal.pecio@gmail.com>
In-Reply-To: <20260518084648.00fdc77e.michal.pecio@gmail.com>
From: Anders Thomson <andtho888@gmail.com>
Date: Mon, 18 May 2026 10:41:23 +0200
X-Gm-Features: AVHnY4JxkjvmAmrNGr6wzCRDJSb8YjI50s3iYqcEPvYQp2LY6II4DfPAeIKbJVk
Message-ID: <CAGwGCQKyRsyRE_HRCNYgBComN-cZU4SW0j-cq3OwqG=-VH4NKA@mail.gmail.com>
Subject: Re: renesas 1912:0014 failures
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AB1C8569078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37582-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andtho888@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,28.xxx:url]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 8:46=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Wed, 13 May 2026 00:34:02 +0200, Anders Thomson wrote:
> > Here we go:
> > [  469.798260] PM: suspend entry (deep)
> > [  470.046476] Filesystems sync: 0.248 seconds
> > [  470.048616] Freezing user space processes
> > [  470.049453] Freezing user space processes completed (elapsed 0.000 s=
econds)
> > [  470.049499] OOM killer disabled.
> > [  470.049536] Freezing remaining freezable tasks
> > [  470.050449] Freezing remaining freezable tasks completed (elapsed
> > 0.000 seconds)
> > [  470.050516] printk: Suspending console(s) (use no_console_suspend to=
 debug)
> > [  470.051839] xhci-pci-renesas 0000:03:00.0: Get port status 9-1
> > read: 0x2a0, return 0x100
> > [  470.051866] xhci-pci-renesas 0000:03:00.0: Get port status 9-2
> > read: 0x2a0, return 0x100
> > [  470.051876] xhci-pci-renesas 0000:03:00.0: Get port status 9-3
> > read: 0x2a0, return 0x100
> > [  470.051886] xhci-pci-renesas 0000:03:00.0: Get port status 9-4
> > read: 0x2a0, return 0x100
> > [  470.077248] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
> > read: 0x2a0, return 0x2a0
> > [  470.077264] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
> > read: 0x2a0, return 0x2a0
> > [  470.077276] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
> > read: 0x2a0, return 0x2a0
> > [  470.077292] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
> > read: 0x2a0, return 0x2a0
> > [  470.077501] sd 7:0:0:0: [sdf] Synchronizing SCSI cache
> > [  470.077635] xhci-pci-renesas 0000:03:00.0: config port 10-1 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077818] xhci-pci-renesas 0000:03:00.0: config port 10-2 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077825] xhci-pci-renesas 0000:03:00.0: config port 10-3 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077833] xhci-pci-renesas 0000:03:00.0: config port 10-4 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077842] xhci-pci-renesas 0000:03:00.0: config port 9-1 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077847] xhci-pci-renesas 0000:03:00.0: config port 9-2 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077852] xhci-pci-renesas 0000:03:00.0: config port 9-3 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077856] xhci-pci-renesas 0000:03:00.0: config port 9-4 wake
> > bits, portsc: 0x2a0, write: 0x202a0
> > [  470.077859] xhci-pci-renesas 0000:03:00.0: xhci_suspend: stopping
> > usb9 port polling.
> > [  470.078452] r8169 0000:02:00.0 enp2s0: Link is Down
> > [  470.083228] xhci-pci-renesas 0000:03:00.0: Setting command ring
> > address to 0x2476001
>
> This looks like normal suspend, no indication that the chip failed
> to halt or otherwise appeared nonresponsive.
>
> > [  470.085447] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> > [  470.085685] ata1.00: Entering standby power mode
> > [  470.089467] sd 3:0:0:0: [sdd] Synchronizing SCSI cache
> > [  470.089471] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
> > [  470.089498] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
> > [  470.089976] ata3.00: Entering standby power mode
> > [  471.185801] ata4.00: Entering standby power mode
> > [  471.923516] ACPI: PM: Preparing to enter system sleep state S3
> > [  471.923767] ACPI: PM: Saving platform NVS memory
> > [  471.924004] Disabling non-boot CPUs ...
> > [  471.925486] smpboot: CPU 3 is now offline
> > [  471.927750] smpboot: CPU 2 is now offline
> > [  471.930012] smpboot: CPU 1 is now offline
> > [  471.937302] ACPI: PM: Low-level resume complete
> > [  471.937330] ACPI: PM: Restoring platform NVS memory
> > [  471.937770] Enabling non-boot CPUs ...
> > [  471.937814] smpboot: Booting Node 0 Processor 1 APIC 0x1
> > [  471.948497] CPU1 is up
> > [  471.948526] smpboot: Booting Node 0 Processor 2 APIC 0x2
> > [  471.958206] CPU2 is up
> > [  471.958233] smpboot: Booting Node 0 Processor 3 APIC 0x3
> > [  471.967051] CPU3 is up
> > [  471.970459] ACPI: PM: Waking up from system sleep state S3
> > [  471.973104] usb usb2: root hub lost power or was reset
> > [  471.973129] usb usb4: root hub lost power or was reset
> > [  471.973229] usb usb5: root hub lost power or was reset
> > [  471.973248] usb usb6: root hub lost power or was reset
> > [  471.973325] usb usb7: root hub lost power or was reset
> > [  471.973345] usb usb8: root hub lost power or was reset
> > [  471.973735] hpet: Lost 1253 RTC interrupts
> > [  471.973898] usb usb9: root hub lost power or was reset
> > [  471.973901] usb usb10: root hub lost power or was reset
> > [  471.973904] xhci-pci-renesas 0000:03:00.0: Stop HCD
> > [  471.973906] xhci-pci-renesas 0000:03:00.0: // Halt the HC
> > [  471.973917] xhci-pci-renesas 0000:03:00.0: // Reset the HC
> > [  500.363392] hpet: Lost 1815 RTC interrupts
> > [  500.363631] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -11=
0!
> > [  500.363635] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> > [  500.363715] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> > pci_pm_resume returns -110
> > [  500.363725] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
> > async: error -110
>
> I see you still have the quirk, but it doesn't matter, the chip is
> stuck and doesn't work either way.

The machine hangs on boot with the quirk. Without quirk i get:
[    2.293602] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.303526] sr 5:0:0:0: Attached scsi CD-ROM sr0
[    2.303603] sr 5:0:0:0: Attached scsi generic sg4 type 5
[   28.493779] xhci-pci-renesas 0000:03:00.0: xHCI Host Controller
[   28.493891] xhci-pci-renesas 0000:03:00.0: new USB bus registered,
assigned bus number 9
[   28.499338] xhci-pci-renesas 0000:03:00.0: hcc params 0x014051cf
hci version 0x100 quirks 0x0000000100000090

Those 28.xxx  renesas lines never show up with the quirk applied. The
machine works (waiting 10 minutes I get a logs from other kernel
threads), but the boot process is stopped. By the looks of it, no usb
probing completes.

> I don't know what causes this, looks like a low level problem - in HW
> or possibly the PCI layer. Maybe Mathias will have other ideas, but
> I'm not sure that USB subsystem can do anything about it.

It is a pcie 1x card, with no external (molex) power supply, if that helps.

Regards
Anders

