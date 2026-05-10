Return-Path: <linux-usb+bounces-37205-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOLHAnqyAGryLgEAu9opvQ
	(envelope-from <linux-usb+bounces-37205-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 18:29:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46C5051B7
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 18:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B912A3008092
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 16:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6553AEF2F;
	Sun, 10 May 2026 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCznN+1t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8F3AF66F
	for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778430581; cv=pass; b=ht4INN4pf5Q0RwlM7N1ATvvH2bxco8Jov8/N3tPF2ACIadFenyzFV/J6D5k+91Qz0jPyLKAhWHTCs87D9zBCJqzS0ZD8Ob634CZ4f/8n7sDH0ohkijArCB95a26xukTZX/GOpYrUkWgdes3fxHuLTOpb8RcGvX1lmpvSuEbcMOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778430581; c=relaxed/simple;
	bh=UGs8aA11lVFqqqhKtPCkS5ejuguCLgaBlqk6xbFQkRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRbE+SkI0x+PLi6E4BdAr1JlDS9llte6RVRJhU1KG70PgYBKtiWNdF1anYeNPDR4l1FoUtnY3HZnq4YSs/89efgQ3ZaBPfurit1EgqzLsU32B5zaG8xRGHOdHxop8F0nin+jLo7e6x1q73BVUDterFw99pWSJ3umPxOOhVCTpH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCznN+1t; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ee9ec26edaso432847885a.2
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 09:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778430578; cv=none;
        d=google.com; s=arc-20240605;
        b=gBs4ebLwcD3Q9XuF6HptMo/GnywnIbx+nVau6dvXCzkYT64GLLzbB4Vr6KS7RVBtEy
         a08gbcJIuQGRvR6sfIVZo0PmS3YCBHlUdRZe6/zznzLxiEG8YpaoGnGtWWga41NSZyes
         Z7D1gBfYXSSzb2xhT6aITzjAwjzikiwsacafVdYiJpXnQ5GgliGjyxHkPjYgjmA9G5Jr
         v9XaW2Fqg4mp2T0mrw52K4s9ePxKE7RHqGy/3LtK/+a5XkfUyvbVOtCrg7QXUGXn9UmP
         dwYSlE6qwQb9EQvCF8Uq+nnf4r8Hndlq7oB0DMg9NIPnBElNviqhf1X7accdwzJgP+g0
         U4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wz5mLHBJa2vwcSiFBsx9uTGWl9tpxHvgDiH4xPrJzvE=;
        fh=oGZB+fAxv3AmVqbpiw6ECejp+zM9/E6xPnWpMntTYL8=;
        b=UiXbwJ45YlpBNHge0OAdTEJG+WwXEX68t24w5B+TwGNHh94HAgirGM1BfrSYHKDMFb
         BWOon9dgoERYtfPpJg1+jgsPvzgOg24Kl8oGUHP+yN0Vq0ldp8l7bwYymxW5sLw7OxzR
         gItpfIEsdaxdGN0SaEbJrZwrHVhYKppb0U4g8KTgIaEd6xR5ax5DSdpRVTx+hehEIFyA
         Vjp/Mna1fgYPzfNQ74YEN+Md6KNZTGvghv4j/xAjCmF4I0wtFv9DvwXH2qfkttQ1ojyY
         v/j73oB0DK4b23zDmteTUv7Ccsg+4PRylIBt7MArxUwU41DO1UBkc3qMTmf0ruPic3Se
         oVUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778430578; x=1779035378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wz5mLHBJa2vwcSiFBsx9uTGWl9tpxHvgDiH4xPrJzvE=;
        b=CCznN+1tYSS8cTXaA7PU+1RoOIlbnjhin9b6pfy5czOBevFSx6sNowlL4oYkwy+ewR
         qe+AsBhoueE1wK+1vJtFRugNOR3M0oChyiFWcDmWjxTXww8Kh6zHm/PuGS/m1qV3psmp
         XaYqTcesbbXTmnR0BDtGQpCbbvhxFFLIruTV3mAb2BCeg+k7s3uW6JKT4xdV69AujXGw
         c0r41H4pwnsm0QZVXlEBrw6OtEoFrmrrBhrddbWg9081erO5kuG2IFOrvmBjmpJcxxVr
         RWXunEpOYWOxuNgcrkprsvL+HO8QE9hBZMt/Rv/hrWkdCxMXnNyp2nabHdne2SXz55Zo
         zmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778430578; x=1779035378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wz5mLHBJa2vwcSiFBsx9uTGWl9tpxHvgDiH4xPrJzvE=;
        b=OrBKGFIVL7mec3fJ4Do3mnlPxZsf1zqm8EezrMcgtBHdOs4PqbaAyR+soSF3+8KImO
         iCfJRTTV4yJraLDhtlxcLAG0FUWXyzT7qLgxZj2yU5VVRqLddRfPupF5medlwwKh4vW6
         8nCukud3VcytxmqwyTgd5uTnDhAjlbaQeAqgwnbqn4yfefC4upssPw+AmYDhtHUDjoga
         mVtec5z4s5Hl26v1LYWPkJkMKkxmvpFllSnQe6xa0SjjoMuoYgJun9FKRj1kKFQf8OEy
         Oe3mJsa0RiFg8+zhJAA46NCth8LNpzHR4UN0G9EC5GHrt8qNWLz67ha1nkrodhNVonnG
         nQRA==
X-Gm-Message-State: AOJu0YzJDslxdLDIU2s2/lwEpR+ZYK7+gpAKtXnZF99Em+43Jk4uLmhp
	zL42W+xOa+uE/mBCJY/mVqy/y2WkmbW5CL1yhQBF6keP6dexZXCuErO54uHQs5tpqcCkXSVFk4y
	lgPFA7uGPVLhDB/QGkkb2o9qd1VZOk0AZ1Jmx
X-Gm-Gg: Acq92OHy6rDX9J8E1E5LUVWM1pnjnNvDsxKUxHkXo3XVuTsEv+N/ZNca848iB0wqc3Q
	8uAjFRdScUodvLdtwtnQ2qtRfXc1J7Nm1JV+w8rvcEjZPckkA/pz8VLRvSyeUz5zbSw1DuGDeiK
	E/K/0EnaVHtsBktk432e06NUdLxPv5FV/SdEZvDXWfPa80UPkD27FpvTKqOzP0G4QurCtIhAIBR
	X92DFtVDHw28gnFr4tE0Yf+Xnw9ZHJTnH7X73iPJ0y2ALRBDNHm4MuzAkNs7bSdvuIvAFbOZiZd
	z/29Llf+/1Ds6FJyJnRV9ajht6JLoPi4Nj6C0w==
X-Received: by 2002:a05:620a:2283:b0:905:f3df:7fd2 with SMTP id
 af79cd13be357-905f3df84a6mr1947069385a.44.1778430577857; Sun, 10 May 2026
 09:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com>
In-Reply-To: <20260509180603.6f67c9d8.michal.pecio@gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sun, 10 May 2026 17:29:26 +0100
X-Gm-Features: AVHnY4I_MH-n7pTskbqX_BCzWrcG_TXNbkiAD0XSElLO-f_HUacxwvxdC8c9fB0
Message-ID: <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6F46C5051B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-37205-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinalderson@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

Two answers, plus a hypothesis:

1. The timing is during suspend in every single failure I have logs for.
I went back through 7 weeks of persistent journals and pulled the
context around every "HC died" event. All 9 failures show the same
sequence:

  xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint command
  xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume dead
  xhci_hcd 0000:0f:00.0: HC died; cleaning up
  PM: suspend devices took 5.5--6.1 seconds      <-- elevated
  amdgpu 0000:03:00.0: MODE1 reset
  ACPI: PM: Preparing to enter system sleep state S3

So it's reliably during suspend, before S3 entry, and the elevated
"suspend devices took" matches the 5s xHCI stop-endpoint timeout. A
clean suspend on the same boot takes ~0.46s.

2. No BIOS upgrade. ASUS PRIME B650-PLUS BIOS version 3263 dated
2025-06-09 across every boot from 2026-03-02 to 2026-05-08 (42 boots).

3. Re "any new USB device": yes, and it correlates exactly. A 4-port
USB hub appeared on bus 1 (controller 0c:00.0, AMD 600 Series USB 3.2)
on 2026-03-16, with a USB mass-storage device behind it on port 4. It's
the hub built into a new monitor I added around then. Per-boot
presence:

  2026-03-02 to 2026-03-16: NO hub, NO flash drive, ~12 6.17.1
                            suspends, 0 failures
  2026-03-16+:              hub + flash drive present
  2026-03-22 to 2026-03-28: 7.0-rc4 with hub present, 13 suspends,
                            0 failures
  2026-03-28+:              7.0-rc5+, failures begin
  2026-04-18 to 2026-04-25: 6.17.1 (retry, with hub still present),
                            10 suspends, 2 failures -- same kernel
                            that was clean in March

The hub is on a different xHCI from the one that dies (0c:00.0 vs
0f:00.0), but they're sibling controllers on the same AMD SoC, so
shared power/ACPI domains seem plausible.

Even with the hub identified as the trigger, I think there are still
two kernel-side issues worth flagging:

(a) Recovery: when the stop-endpoint timeout hits, 0f:00.0 is marked
"HC died" and never comes back without a manual PCI remove+rescan.
The other controller on the same machine recovers itself on resume:

  xhci_hcd 0000:0c:00.0: xHC error in resume, USBSTS 0x401, Reinit

There doesn't seem to be an equivalent recovery path for the
suspend-time stop-endpoint timeout on 0f:00.0.

Regards,
Martin


On Sat, May 9, 2026 at 5:06=E2=80=AFPM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Sat, 9 May 2026 15:51:03 +0100, Martin Alderson wrote:
> > Hi, still experiencing this on 7.0.2. I tried to pull the logs
> > together to get to the bottom of this (I've tried a few different
> > kernels)
> >
> > Kernel                          Suspends   xHCI 0f:00.0 deaths   Rate
> > ------------------------------  --------   -------------------   -----
> > 6.17.1-300.fc43 (March)             ~12             0             0%
> > 6.18.16-200.fc43                     10             0             0%
> > 6.19.7/8-200.fc43                     5             0             0%
> > 7.0-rc4   (build 260320)             13             0             0%
> > 7.0-rc5   (build 260328)              7             2            ~28%
> > 7.0-rc6   (build 260401)             10             4             40%
> > 7.0-rc7   (build 260409)              7             2            ~28%
> > 7.0.0-261.vanilla.fc43                7             2            ~28%
> > 6.17.1-300.fc43 (April, retry)       10             2             20%
> >  <-- same bug, stable kernel
>
> Looks like it's not a regression then, but not sure what else may have
> caused it.
>
> Any new USB device that wasn't connected before?
> Perhaps a BIOS upgrade?
>
> > 7.0.1-262.vanilla.fc43                7             2            ~28%
> > 7.0.2-300.vanilla.fc44                6             4            ~66%
> >
> >
> > May 09 15:29:37 fedora kernel: Freezing user space processes completed
> > (elapsed 0.001 seconds)
> > May 09 15:29:37 fedora kernel: OOM killer disabled.
> > May 09 15:29:37 fedora kernel: Freezing remaining freezable tasks
> > May 09 15:29:37 fedora kernel: Freezing remaining freezable tasks
> > completed (elapsed 0.001 seconds)
> > May 09 15:29:37 fedora kernel: printk: Suspending console(s) (use
> > no_console_suspend to debug)
> > May 09 15:29:37 fedora kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cac=
he
> > May 09 15:29:37 fedora kernel: serial 00:01: disabled
> > May 09 15:29:37 fedora kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cac=
he
> > May 09 15:29:37 fedora kernel: ata1.00: Entering standby power mode
> > May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI host not
> > responding to stop endpoint command
> > May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI host
> > controller not responding, assume dead
> > May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: HC died; cleaning=
 up
> > May 09 15:29:37 fedora kernel: PM: suspend devices took 5.758 seconds
>
> That's not resume, it's during suspend. Are other logs also like that?
>
> Regards,
> Michal

