Return-Path: <linux-usb+bounces-31528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03479CC5DDA
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 04:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E0DA302A95B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 03:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F29329ACCD;
	Wed, 17 Dec 2025 03:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="j5uemvq+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8B27B34F
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 03:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940829; cv=none; b=Of9DTazX8iCKY92fJ5b6XEvDGjbV2R+zLvcNzBsViQMzVMoeUp1fwFevFd7Aut5cOHGZycNqvpx9p1W3qW0qxDaf9eH3LhcGO8r2yQc8/8QxRi3BAeGfX4/WEZziNg48RQLnpjtw3l+VhpzV5Vc9g3OtW+9SetsenNm2f9SHDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940829; c=relaxed/simple;
	bh=QACzJcfL1VQ4YlSxvvFrONUOh8zfO32TwUYm8JZ3LSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2ujflCBzgQ9ot+EQrEmXkcwhIo8G3vH4ZBtOB4GIIRC0KzlWW0W+fXXDcbzy8k6hYNw4692z4WDlzMPK5IXLT4taG5kpr0hO0dgfo9LoTw0lYO2AMvaZrGh6mr1/UXA4H2xntvR4ADaIzwJNwr2g00Jen4QZToPltvzJFkfFtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=j5uemvq+; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA1E43F66E
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 03:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765940824;
	bh=/WvGs1CRtHxG6LYkK92WqxFN46GI/vd4s/GrJoklmDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=j5uemvq++drmehkDarP/vSKQyYYVQRY4A1/t5naXaO2fX1Ajcn0mCVOND59r6EKsv
	 yHtx6J4p15yHrpDbkazjjQ9Rn7fLltci3VWfkOiUyVdBOUqtQsrT23icQ4N58ICoI4
	 tiQ/wn/ZGRE+W0ZDYra+/G5MbKUnNX0fMLRdrKFvODZuaYTiHfdL0c7oxCm+EsgGWq
	 3m6dcMD59f5tDHHx07zgEOIgBRwJsQb4CTfN3wnmcZE2l50Q50UbrScu6QyCXbbnzJ
	 rL9a/CwJkRc9Jq8KcbFDIFZ/LQo68fZrHbwyk4U3IsbvvBxEFNbgEDA54tSBN/IU85
	 8nq/puIfwV/RrUktN3ebtsgLNqeDDp6SQ3dLW+FzyrMxA+p9jnv5gCJQ68H4t/NAhd
	 xhhlwl1jkA1d+KKr/rSt4xSBcwwx1DOlD0fREsHxTSO2VJewCtXk1mdES4O0NVMnEn
	 FxFjjK/tX1+u79kh/zNbRLB+kxRCKT1b9OYtst4ClF7UPR/ARFzM0Ae6S8v6VvcidQ
	 IS+Tor+8ldqGZZfUTLbDu+0LLQsEUyeJBZq5PW6+bLiVxl0AeEI/OwBAj6/FcxkUAK
	 IpugH20JWmszlCotUtDSUdvWazQytpvM06pA9Nj/lfKVbGMnJsEdlNh4jN+/lVJCn2
	 Jsli0WLP+5kHVqklwnXpJp9s=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b79ff60ed8eso812941266b.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 19:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765940824; x=1766545624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/WvGs1CRtHxG6LYkK92WqxFN46GI/vd4s/GrJoklmDk=;
        b=PnTDunPkLX5ZFqlT5/LGspJf8+dI5oxnNrpAoGUmYpG7t4OlW0a/2vklS+40suTcJg
         AUPGjJswtZr6zwOI7YS35F+eXitZ76YPz2Cp8Ln8dUf2oImPCeDfwJSkKW9mB0Yh9CpW
         ZKoYvJH8GHaIhd4O4ppYgeqALCXsyHr6M2hAyXuSw//J2xi2/8lrCs1GuCumiCyT12By
         XI3ckrhU78aHxrSeBcufq+vet+iRE8kyYa7x4UFRRNrMD7UI00tD5ewVCgkbmittxNVh
         a54tmOPFgt09PIrjkDkNP4Tl9EZ7FlaBt3pBSofJctEnGba+d+zu9OBG0UYer4giZfoK
         E36w==
X-Forwarded-Encrypted: i=1; AJvYcCVHyLrqgKh/+pytUNEozg+J+gMIr8b6sQamemZuqeJ+i+zm496ETc4OEowYlV3+GUTtVVyghdU4kmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu9puhtEwp/DQDRckBBrhVfPmbHwGVaY+kVdG3QUgJcQqlw0Cg
	hjm7+5Nb77+LAzgKhAF2mh3dmzpMPy9pYJENLSaAZ2POHpTERmYbSpHUSsQpEOH4L6twFmcW03R
	jMZwr17JB/9sCQ9i3qf4Mr7jRg72OKncLAMskZjiZHiJV7U0easl8LxeffYRrhLq5/3HK/lhkIg
	sUORIdTUAjGpCZ4IF419MM+YM6S9t8EXv8THv6TFfmXpjFaoc5Mnup
X-Gm-Gg: AY/fxX4+h7l6pCcQwP6ljRBnFnjBqEdrOqVDF7nnQNrYWHyatygW9fUdzbkyuCxEkHH
	EJSmFc9rNeIMVtMyPflXCzOxGOW6NOFuNG3jfDt2+lkZUc6gOuTeYSGNtwXPdALx8loB4YMEMKp
	3mWoNGchGYV+Ye/9mOylI1fC687ovhHPahcQYLCVMJbWchj77SozVdQJZSEyaTe/GMlxk=
X-Received: by 2002:a17:907:e111:b0:b7f:bc1b:2121 with SMTP id a640c23a62f3a-b7fbc1b2166mr990719366b.25.1765940824328;
        Tue, 16 Dec 2025 19:07:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkKz1wP6iJzBVX0H8fhjLI3c+dW05bU+XFJl7pecepaRYhLOFmOtbNVwIddQKVLml8tf0byTtXzNg615jwUYY=
X-Received: by 2002:a17:907:e111:b0:b7f:bc1b:2121 with SMTP id
 a640c23a62f3a-b7fbc1b2166mr990718366b.25.1765940823909; Tue, 16 Dec 2025
 19:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com> <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com> <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com> <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
In-Reply-To: <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Wed, 17 Dec 2025 11:06:52 +0800
X-Gm-Features: AQt7F2p3E4VLWBennp0pGKq4huMBTUQCWFqXaUAOczrQbafd-GHNryOCnK7cDgM
Message-ID: <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sanath.S@amd.com, 
	"Lin, Wayne" <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mario Limonciello <mario.limonciello@amd.com> =E6=96=BC 2025=E5=B9=B412=E6=
=9C=8812=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:40=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 12/12/25 6:39 AM, Mika Westerberg wrote:
> > Hi,
> >
> > On Fri, Dec 12, 2025 at 12:10:24PM +0800, Chia-Lin Kao (AceLan) wrote:
> >> Hi Mika,
> >>
> >> On Wed, Dec 10, 2025 at 03:42:21PM -0600, Mario Limonciello wrote:
> >>> +Wayne
> >>>
> >>> Here is the full thread since you're being added in late.
> >>>
> >>> https://lore.kernel.org/linux-usb/20251209054141.1975982-1-acelan.kao=
@canonical.com/
> >>>
> >>> On 12/10/25 1:41 AM, Mika Westerberg wrote:
> >>>> Hi,
> >>>>
> >>>> On Wed, Dec 10, 2025 at 11:15:25AM +0800, Chia-Lin Kao (AceLan) wrot=
e:
> >>>>>> We should understand the issue better. This is Intel Goshen Ridge =
based
> >>>>>> monitor which I'm pretty sure does not require additional quirks, =
at least
> >>>>>> I have not heard any issues like this. I suspect this is combinati=
on of the
> >>>>>> AMD and Intel hardware that is causing the issue.
> >>>>> Actually, we encountered the same issue on Intel machine, too.
> >>>>> Here is the log captured by my ex-colleague, and at that time he us=
ed
> >>>>> 6.16-rc4 drmtip kernel and should have reported this issue somewher=
e.
> >>>>> https://paste.ubuntu.com/p/bJkBTdYMp6/
> >>>>>
> >>>>> The log combines with drm debug log, and becomes too large to be
> >>>>> pasted on the pastebin, so I removed some unrelated lines between 4=
4s
> >>>>> ~ 335s.
> >>>>
> >>>> Okay I see similar unplug there:
> >>>>
> >>>> [  337.429646] [374] thunderbolt:tb_handle_dp_bandwidth_request:2752=
: thunderbolt 0000:00:0d.2: 0:5: handling bandwidth allocation request, ret=
ry 0
> >>>> ...
> >>>> [  337.430291] [165] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 00=
00:00:0d.2: acking hot unplug event on 0:1
> >>>>
> >>>> We had an issue with MST monitors but that resulted unplug of the DP=
 OUT
> >>>> not link going down. That was fixed with:
> >>>>
> >>>>     9cb15478916e ("drm/i915/dp_mst: Work around Thunderbolt sink dis=
connect after SINK_COUNT_ESI read")
> >>>>
> >>>> If you have Intel hardware still there it would be good if you could=
 try
> >>>> and provide trace from that as well.
> >> I tried the latest mainline kernel, d358e5254674, which should include=
 the commit you
> >> mentioned, but no luck.
> >>
> >> I put all the logs here for better reference
> >> https://people.canonical.com/~acelan/bugs/tbt_call_trace/
> >>
> >> Here is how I get the log
> >> ```
> >> $ cat debug
> >> #!/bin/sh
> >>
> >> . ~/.cargo/env
> >> sudo ~/.cargo/bin/tbtrace enable
> >> sleep 10 # plug in the monitor
> >> sudo ~/.cargo/bin/tbtrace disable
> >> sudo ~/.cargo/bin/tbtrace dump -vv > trace.out
> >> sudo dmesg > dmesg.out
> >> ./tbtools/scripts/merge-logs.py dmesg.out trace.out > merged.out
> >> ```
> >>
> >> And here is the log
> >> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_=
6.18.0-d358e5254674+.out
> >
> > Thanks!
> >
> > It shows that right before the unplug the driver is still enumerating
> > retimers:
> >
> > [   39.812733] tb_tx Read Request Domain 0 Route 3 Adapter 1 / Lane
> >                 0x00/---- 0x00000000 0b00000000 00000000 00000000 00000=
000 .... Route String High
> >                 0x01/---- 0x00000003 0b00000000 00000000 00000000 00000=
011 .... Route String Low
> >                 0x02/---- 0x02082091 0b00000010 00001000 00100000 10010=
001 ....
> >                   [00:12]       0x91 Address
> >                   [13:18]        0x1 Read Size
> >                   [19:24]        0x1 Adapter Num
> >                   [25:26]        0x1 Configuration Space (CS) =E2=86=92=
 Adapter Configuration Space
> >                   [27:28]        0x0 Sequence Number (SN)
> > [   39.813005] tb_rx Read Response Domain 0 Route 3 Adapter 1 / Lane
> >                 0x00/---- 0x80000000 0b10000000 00000000 00000000 00000=
000 .... Route String High
> >                 0x01/---- 0x00000003 0b00000000 00000000 00000000 00000=
011 .... Route String Low
> >                 0x02/---- 0x02082091 0b00000010 00001000 00100000 10010=
001 ....
> >                   [00:12]       0x91 Address
> >                   [13:18]        0x1 Read Size
> >                   [19:24]        0x1 Adapter Num
> >                   [25:26]        0x1 Configuration Space (CS) =E2=86=92=
 Adapter Configuration Space
> >                   [27:28]        0x0 Sequence Number (SN)
> >                 0x03/0091 0x81620408 0b10000001 01100010 00000100 00001=
000 .b.. PORT_CS_1
> >                   [00:07]        0x8 Address
> >                   [08:15]        0x4 Length
> >                   [16:18]        0x2 Target
> >                   [20:23]        0x6 Re-timer Index
> >                   [24:24]        0x1 WnR
> >                   [25:25]        0x0 No Response (NR)
> >                   [26:26]        0x0 Result Code (RC)
> >                   [31:31]        0x1 Pending (PND)
> > [   39.814180] tb_tx Read Request Domain 0 Route 3 Adapter 1 / Lane
> >                 0x00/---- 0x00000000 0b00000000 00000000 00000000 00000=
000 .... Route String High
> >                 0x01/---- 0x00000003 0b00000000 00000000 00000000 00000=
011 .... Route String Low
> >                 0x02/---- 0x02082091 0b00000010 00001000 00100000 10010=
001 ....
> >                   [00:12]       0x91 Address
> >                   [13:18]        0x1 Read Size
> >                   [19:24]        0x1 Adapter Num
> >                   [25:26]        0x1 Configuration Space (CS) =E2=86=92=
 Adapter Configuration Space
> >                   [27:28]        0x0 Sequence Number (SN)
> > [   39.815193] tb_event Hot Plug Event Packet Domain 0 Route 0 Adapter =
3 / Lane
> >                 0x00/---- 0x80000000 0b10000000 00000000 00000000 00000=
000 .... Route String High
> >                 0x01/---- 0x00000000 0b00000000 00000000 00000000 00000=
000 .... Route String Low
> >                 0x02/---- 0x80000003 0b10000000 00000000 00000000 00000=
011 ....
> >                   [00:05]        0x3 Adapter Num
> >                   [31:31]        0x1 UPG
> > [   39.815196] [2821] thunderbolt 0000:00:0d.2: acking hot unplug event=
 on 0:3
> >
> > By default it does not access retimers beyond the Type-C connector. I
> > wonder if you have CONFIG_USB4_DEBUGFS_MARGINING set in your kernel
> > .config? And if yes can you disable that and try again.
Sorry, it looks like I got some troubles with my MTA, some emails are
not sent out correctly.

I've rebuilt the kernel without CONFIG_USB4_DEBUGFS_MARGINING, and
here is the log
There is a tbt storage daisy-chained after the tbt monitor, it's
easier to reproduce this issue.
https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.=
0-d358e5254674+.2.out

And this one is only the tbt monitor plugged.
https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.=
0-d358e5254674+.3.out

>
> If this does end up being the reason - maybe we should make this really
> noisy in logs and/or taint the kernel.

