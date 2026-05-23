Return-Path: <linux-usb+bounces-37975-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5IVcMZHWEWoorQYAu9opvQ
	(envelope-from <linux-usb+bounces-37975-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 18:32:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217055BFD5D
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 18:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 868BF300CC11
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 16:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFD2311C2A;
	Sat, 23 May 2026 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBSVI8jE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465C1096F
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553928; cv=none; b=bwZyC9bV7U+GvqTBf7hm1fpZOEW9REPZUkHvhJdlSwLqZD7o2Xv1NepMzQpaFubnggK0WyjIPNVxoNVeXzPl7zi4SXyUo9H1qioS25eil1920d7565VgmowNHkWamNciGhs3yPUk1w6zJNniweJcVbB0QTnEH5Mxtkj3C9V5x1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553928; c=relaxed/simple;
	bh=pkfLUAiuq5iTQc67qW9+jHq5BY573IqEt4vs/+aBnDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVVMmDEgPSkAlOE0cn6XizbQxnr5QFdubfEdg7/vBWPWGrfUrYEUYwy0uy1dZpEV+Q9ANBW3tHVpEBrdE9eX3ikaSMSzj8pnBuYYAdL6++5cGXtXXvTlfzZ3Lj/eFzjFsyVaE070FGJCL0Y1K/QmkvVl58ZUrNNn57+R/NfvF7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBSVI8jE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-394095009beso71028301fa.3
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779553925; x=1780158725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uJQVqujgvU3BBIgpbqB2Z0HYbll28KxpeDGG8SkSgQ=;
        b=CBSVI8jEqRBiC+4eyZlq0eDuMV7xsfHK5WcQEPRWAU1vH5VGVkfSfWcCBRO3jNeojn
         tagc1Y6dfEiHqTL2KSHwwvc0GwrsdMZRMlSpsNGuTHLaotiZgLTDBAhJWvEABY+i4EXm
         fdFE0Gb4yZs96BzX9U31wnyBxFRSyn/Z0smDEY9YbNUvuGvJKExDf4KSDFCQQ2ePuLQK
         Mdge3dLE+wSFA/HwfYiztZmuoYAJF8oKqWF/qOhYABYb9B7fPyY9pLbR80TbB7MmctVT
         Oe2LdGXy28XvFjlSBuFqsVu62q/NATt5Z51AXvmqqJ/5m3LNc4CHzR+LLXUsht66XYrp
         ESIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779553925; x=1780158725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3uJQVqujgvU3BBIgpbqB2Z0HYbll28KxpeDGG8SkSgQ=;
        b=RVWlfs7wPIMiuvHktojUueUS2Erx8IN99jUtZy6LbC9qhLwKvKdxSlMPXSRJ/b1Jb6
         7+Ia5Wyx5S8qhpbUzuegrXWaMqlrxRlQUGo/v86KdemsVEG0NarxOf92q162MS/6WIpC
         tXoUnaHNr4eaQfwEDDG5gTMEfHruQoK64Ww+Bj0Yo0GtxJc3oEhQD/PhnHyG+dh4eZWK
         oSKueK4tiR/n5m9sCeFaBx1JKKze/m/nC/vcy29kx2tqnPiXLFls3i17rqKVC3A26wQ2
         +8sU3Mf8DTFRtenUkhKSquIpuv9hvq/otwXSRvJ9woXR9TT7AQbQ5MRzEE1aR/K6o1e1
         WKAQ==
X-Gm-Message-State: AOJu0Yzri1nYgI3gUuIEOsbquoNh2ZqNrBWKy1Msu9/dPyfxo+2/2YpB
	LA2kNq+2//2UE8d2fVs6HwszJ7VX0LOLzEPXuyTmF+ALRDywXarUVdd1
X-Gm-Gg: Acq92OG9nI7rO0RrUA27xbJVa5DhNyyNG8PXA9mI4ZaYxQjUEaj45kS59+HQmMARXXi
	+x18FyUeSUtlbYaCZe6s1MWLnx00c1i2PTlxSbq91mGYRcHLH2R/YQOThOyUXWHNolmZVugYVHG
	xZJy+Co2ECKjkSzn4fKvPD/fGAiAkI1dRklnJP/cNcWwFe7bMBZNx/UzWkJ/6POyE6O9GwpFMEr
	GTLpX59uGZgETitQqjNgA+q3ITZUaqEe3YU4gvFp8yKiDt+E7N9HS64Y9cz91bwlhZXgj8iguFu
	JcVGE9xDFwCUGf05r7B8TuG2E5jRnIkRlEonYKTyR+qnkb7d/GW9GnS7dggtYlreJVdZJxDvxzB
	CNyrCnXvRECDbARHOSNNlziUlM6yXNmzoj9S4vwNxb7D9x1TOQXIh0rwWqhTkn9ZOgFNuMnotGO
	zZVgeaJ0suD8lSuNrsCLMX3MSEfAiwYusc
X-Received: by 2002:a05:6512:3041:b0:5a8:88a4:46a5 with SMTP id 2adb3069b0e04-5aa323e2ee8mr2333605e87.40.1779553924594;
        Sat, 23 May 2026 09:32:04 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf945fsm1248073e87.75.2026.05.23.09.32.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 23 May 2026 09:32:03 -0700 (PDT)
Date: Sat, 23 May 2026 18:32:00 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Anders Thomson <andtho888@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: renesas 1912:0014 failures
Message-ID: <20260523183200.344d784f.michal.pecio@gmail.com>
In-Reply-To: <CAGwGCQJ6SaB_mLH5DGttVDXHvvNW9zrSnijwYxp2W4d_W40FRw@mail.gmail.com>
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
	<20260512122719.51338042.michal.pecio@gmail.com>
	<CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
	<20260512190203.5695eb7f.michal.pecio@gmail.com>
	<CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
	<20260518084648.00fdc77e.michal.pecio@gmail.com>
	<CAGwGCQKyRsyRE_HRCNYgBComN-cZU4SW0j-cq3OwqG=-VH4NKA@mail.gmail.com>
	<CAGwGCQJ6SaB_mLH5DGttVDXHvvNW9zrSnijwYxp2W4d_W40FRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37975-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 217055BFD5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 14:36:18 +0200, Anders Thomson wrote:
> On Mon, May 18, 2026 at 10:41=E2=80=AFAM Anders Thomson <andtho888@gmail.=
com> wrote:
> > =20
>=20
> > > I see you still have the quirk, but it doesn't matter, the chip is
> > > stuck and doesn't work either way. =20
> >
> > The machine hangs on boot with the quirk. Without quirk i get:
> > [    2.293602] cdrom: Uniform CD-ROM driver Revision: 3.20
> > [    2.303526] sr 5:0:0:0: Attached scsi CD-ROM sr0
> > [    2.303603] sr 5:0:0:0: Attached scsi generic sg4 type 5
> > [   28.493779] xhci-pci-renesas 0000:03:00.0: xHCI Host Controller
> > [   28.493891] xhci-pci-renesas 0000:03:00.0: new USB bus registered,
> > assigned bus number 9
> > [   28.499338] xhci-pci-renesas 0000:03:00.0: hcc params 0x014051cf
> > hci version 0x100 quirks 0x0000000100000090
> >
> > Those 28.xxx  renesas lines never show up with the quirk applied.
> > The machine works (waiting 10 minutes I get a logs from other kernel
> > threads), but the boot process is stopped. By the looks of it, no
> > usb probing completes.
> > =20
> Some advances, perhaps. I _did_ get (twice) the boot to succeed with
> the quirk (still with the 26 sec pause) . Both times was after a full
> power cycle (PSU on/off). After a regular I/O Button press during, the
> boot stalls. I'll run this a few times more to verify.

xhci_hcd.quirks=3D0x80 should have no effect on anything besides
suspend/resume. If you see differences in boot behavior, it probably
is an effect of suspend/resume cycles performed or attempted during
the previous boot. It seems that the chip gets into some bad state
which requires a power cycle to fix. BTW, do you mean just turning off
the computer, or disconnecting the PSU to remove standby power?

FYI, the quirk performs full xHCI reset during resume and prevents
selectively suspending the chip when all its USB devices are suspended
but the system is running (not going to sleep). It doesn't prevent
suspending when no USB devices are connected at all. And either way,
runtime PM may be turned off, see if this is 'on' or 'auto':

cat /sys/bus/pci/devices/0000:03:00.0/power/control

> After successful boot with quirk, 1st suspend/resume without
> peripherals attached, yielded:
> [...]
>=20
> After the second suspend/resume, we got this:
> [...]
> [ 1697.224087] xhci-pci-renesas 0000:03:00.0: // Reset the HC
> [...]
> [ 1725.214860] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
> [ 1725.214863] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> [ 1725.214875] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> pci_pm_resume returns -110
> [ 1725.214879] xhci-pci-renesas 0000:03:00.0: PM: failed to resume

I have no idea why it works the first time but not the second.
Not what happens if the same is done without the quirk?
Maybe try s2idle ("freeze") instead of S3 sleep? But that doesn't
provide the same power saving on older HW.

Regards,
Michal

