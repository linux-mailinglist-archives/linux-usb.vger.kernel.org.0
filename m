Return-Path: <linux-usb+bounces-37626-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNgmCmJbC2oCGAUAu9opvQ
	(envelope-from <linux-usb+bounces-37626-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:33:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5685724DA
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED5EA301C89D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6537384CD8;
	Mon, 18 May 2026 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD+GMXIP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBED380FF2
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128675; cv=none; b=tWjyuEgJquLCTqk3ERZR5/MEIpscX30KNK8gKsRJno73BqboFKT+QhBx/zVdC7s50DRnXiVVB9RmmCkgOG9bJWTtHBNhSy+eT/XWKpOE9pTmp+w1k6x7BpZEY7tbtQcEp37Kw34hv3kEYAYsA+a6VunYMJxWuzSNGCu4vgHCFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128675; c=relaxed/simple;
	bh=WJmRHJQ9YtbYvKKlnL/HrVyVH7N31USOdatDQxmtHFo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PEByUIi0CKmpIucYQgIN9c5VtZQpYzDt6cDz8Z8YJnPjSP25PjwxIuLAs1P947AkCDdQYP+P4iuRdpskArTJvGmGpFN0qROGJPtpHMD1Y56qfdVxYqN3FR7p1ITgpFzsF52Y4eLWOpfwH36IXaLbDzqMZ65KGuq8RKgEVoH3E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD+GMXIP; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-134fe980658so3346219c88.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128672; x=1779733472; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLP6B9LplIrEwv8kNSSS0Aocax23uqoTOdVkE3QwPcA=;
        b=ZD+GMXIPcTHVz0UOi5gCiUZIjFgenDRNFw1GOXyaQPrlb3H2qrHPWDY9TTA4AdDW9X
         vqXZmXsNlhMU0wWCmYHC5cJy3/u4x/hHTqKMStNd5ZMaXt6AgsNVjl9OCOS8O4P++2h0
         RH/QCYTcZcJ1oOwM2Bx10AOFJGO0yZtERYAMNDfzF/m+XDBLl2WLoIku9AnnppbIUwdQ
         yJOS0vNQ3CXM0Ju1l5p8AIZcLnCLFk7DouRtRKrOz3Bhvw8UXz8trHkmCsnGL27KD9G6
         3VkvJjPMwbkO/2oM1cEHh5JVOfSCdmo++uMoligCQ79mWin1En+K7lxOBIMeA7+9dA59
         yhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128672; x=1779733472;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLP6B9LplIrEwv8kNSSS0Aocax23uqoTOdVkE3QwPcA=;
        b=We6CF2+azDiNerPD3RfIxced6Z9PBzxG59wHE/Q3enACm9iR6L/TwP8z3GzDeNQTkk
         BTHwO+nmhtQtKCI9xZfv3tYnBIbTKYYkaGFci8WnmEkSaxA/k7/t9J9GwAFxuf9cZbgo
         bkS0RW9DVlv1g5Q3SinS06hPwVW3ylzU/D5TCv13WIVwqPBbWpQhIGVErIHB8eS8E1KZ
         WI2nJcwSirr6V0JKQ3F4IJGgMQxO1l0WqTZWj/3wvp8oT7d6F4fFu4Rh3VDAiKApm7Ij
         5JY5q7R9Fy6S4AaSv1NfPIj9eDav9MprMTUJ/ticOQY8NFXCfWpMeGsXFVLJBINyZKVG
         jJKg==
X-Gm-Message-State: AOJu0YzxnrPjedT0rxkpUekN9ZUcstqCD+PFfjBMQVkgbLmdzyZDlX7o
	5f5epr7fm0d/HrDvEc8gN5KD2KzcPeMoWUre1vZrW68IWVyOTKh5IdW/5fzO7FOt
X-Gm-Gg: Acq92OFtslePXciWzoHRzHe6G3IdoGaVWUgwoFR9FAH4Erv11533cOpGaaYIwH9it8G
	Ds1wRsUvh8dk9nMML3QNkKbXt3p8mLrOF9q3IqJ/1mhKZN20TSnF2ouhmf/eCHYQV0dE6ZIdmJH
	UpvQ19omfEHlQWEUAyAetDxghgXdDNrcakmWcln42x5Ri5WHQlL5bkzDabQFHRN1bxwzmRDvTe3
	nKWkyND5dIOPW3TfRP+QhhUJaWBeeIH/3LP/bOUV4eWTOxaCmWJs/QPKVA+qf0ZGJqA8Ah0yMms
	z4KC1XC1a2OFVPrTzTvGEWXIy1DEGo8ZhRglZ+4VHlJWZjzO6yDUnB9SnpUGf/+Hp5GZVEe10Po
	ZUG8cAJBjw0s39pjWNQ5Zz1BXNxH7+qlYq52taPiFIfSBZwwdtoRL3di+vCILstfyFY9rfQnv8l
	cRIagG8v+ktkiquKhqgr7nRzqx1wdIWeG2obLv29/bvyFZjtY=
X-Received: by 2002:a05:7300:a286:b0:2e2:d94d:6188 with SMTP id 5a478bee46e88-3039816dcddmr6722794eec.7.1779128672108;
        Mon, 18 May 2026 11:24:32 -0700 (PDT)
Received: from smtpclient.apple ([2601:644:601:140:6c6c:eafb:5a54:50e2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm20187705c88.2.2026.05.18.11.24.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2026 11:24:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
From: Brent Page <brentfpage@gmail.com>
In-Reply-To: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
Date: Mon, 18 May 2026 11:24:20 -0700
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C69D317-184B-470E-87E9-4337547C78DD@gmail.com>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
To: linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37626-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3A5685724DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This revision is necessary in sitd_link_urb:
<         sitd_patch(ehci, stream, sitd, sched, i);
---
>         if(stream->ps.c_mask2 && (stream->ps.period!=3D1)) {
>             packet =3D i/2;
>         } else {
>             packet =3D i;
>         }
>         sitd_patch(ehci, stream, sitd, sched, packet);
I didn't catch this before because I haven't yet tested the patch on a =
ps.period!=3D1 peripheral.
For such peripherals, I think some more logic will also have to be added =
to sitd_complete to=20
ensure that=20
if ((urb_index + 1) !=3D urb->number_of_packets)
doesn't evaluate to true twice for the same urb (specifically for both =
sitds of the urb's last
sitd pair)

> On May 17, 2026, at 11:42=E2=80=AFPM, Brent Page =
<brentfpage@gmail.com> wrote:
>=20
> This is a follow-up on=20
> https://lore.kernel.org/linux-usb/
> B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com/T/#u.
> The goal is to accommodate 1023-byte-endpoint full-speed =
isochronous-in
> transactions on a USB2 bus.
>=20
> One of the main changes is
> - max_tt_usecs[] =3D { 125, 125, 125, 125, 125, 125, 30, 0 };
> + max_tt_usecs[] =3D { 145, 145, 145, 145, 145, 145, 35, 0 };
> To repeat for documentation's sake, "145 us is longer than a =
microframe, so
> this best-case budget will often not reflect the times when =
transactions occur.
> But, this situation is consistent with the best-case budget in section =
11.18.1
> of the USB-2 spec, in which 1157 data-bytes are scheduled to occur as =
though no
> bit-stuffing is necessary (i.e., the 188 bytes =3D 12 megabits/second =
* (1 byte/8
> bits)* 0.125 ms that can run on the full-speed bus in a microframe are =
all
> taken taken be data-bytes).  So, after the patch, max_tt_usecs is the =
same as
> the spec's best-case budget but is just scaled by (125 us / 188 bytes) =
=3D 1/(12
> megabits/s) and by the 7/6 bit-stuffing multiplier to reflect the fact =
that the
> scheduling code works in bit-stuffing-inclusive bus-time instead of
> data-bytes."  However, as pointed out in the linked email chain, =
because
> ehci-sched.c currently doesn't allow frame-hopping CSPLITS (a CSPLIT =
for a
> given transaction that gets executed in the H-frame following the =
H-frame in
> which the transaction was initiated), "it doesn't support 1023 byte =
packets at
> all. 1023/188=3D5.4 and if worst case bit stuffing factor is 7/6 then =
up to 6.3
> uframes of transfer time. Completion in [HuFrame 6 or 7] and CSPLIT =
required in
> [HuFrame 0 of the next frame]." So, this patch also adds support for
> frame-hopping CSPLITS.  Per EHCI-1.0 4.12.3.3.2.1, the sitd containing =
such
> CSPLITS must have a backpointer to the sitd of the previous frame.
>=20
> The main cases to handle in the backpointer code are period=3D=3D(1 =
frame) and
> period!=3D(1 frame), where period is specifically derived from the =
bInterval of
> the endpoint.
>=20
> Say there's a 3-packet urb for the endpoint (urb0, with labels td0_#) =
in the
> pipeline and another gets added (urb1, with labels td1_#).  The result =
is (the
> nodes below are sitds, and "td" stands for "transaction descriptor") =
...
> if period=3D=3D(1 frame):
> |-----|   |-----|   |-----|   |-----|   |-----|   |-----|
> |td0_0|-->|td0_1|-->|td0_2|-->|td1_0|-->|td1_1|-->|td1_2|
> |-----|<  |-----|<  |-----|<  |-----|<  |-----|<  |-----|
>       |    |    |   |     |   |     |   |     |   |=20
>       |----|    |---|     |---|     |---|     |---|
>=20
> where time increases from left to right, and the lines/arrows on the =
bottom
> represent backpointer relationships.  Also, all sitds are initialized =
in the Do
> Complete Split state except for the very first in a stream.=20
>=20
> Including a backpointer from the first sitd of urb1 to the last sitd =
of urb0
> (as done here) is not certainly the 'correct' way to handle urb =
boundaries. An
> alternative strategy would be to add an additional sitd, td0_3, to =
urb0 after
> td0_2 that just contains CSPLITS for td0_2. However, td0_3 would have =
to be in
> the same frame as td1_0 (the first sitd of urb1).  It's possible that =
the
> HC supports having two sitds for one endpoint in one frame, but it
> seems unusual enough that it could produce issues, hence why I avoid =
this
> alternative strategy. Also, the adopted strategy is simpler to code =
=E2=80=93 the only
> distinctive sitd is the very first in a stream.
>=20
> if period!=3D(1 frame):
> |-----|   |-----|   |-----|   |-----|   |-----|   |-----|  =20
> |td0_0|-->|td0_1|-->|td0_2|-->|td0_3|-->|td0_4|-->|td0_5|-->
> |-----|<  |-----|   |-----|<  |-----|   |-----|<  |-----| cont.
>       |    |              |    |              |    |     below
>       |----|              |----|              |----|      =20
>=20
>   |-----|   |-----|   |-----|   |-----|   |-----|   |-----|  =20
> -->|td1_0|-->|td1_1|-->|td1_2|-->|td1_3|-->|td1_4|-->|td1_5|
>   |-----|<  |-----|   |-----|<  |-----|   |-----|<  |-----|  =20
>          |    |              |    |              |    |      =20
>          |----|              |----|              |----|      =20
> where the second sitd in each pair is positioned one frame after the =
first sitd
> of the pair, gets initialized in the Do Complete Split state, contains =
CSPLITS
> for the transfer that was started in the first sitd of the pair, and =
has no
> SSPLITS.
>=20
>=20
> I also want to make sure I understand something that line ~2197 of the =
patched
> ehci-sched.c:=20
>    sitd_before =3D list_last_entry(&sched->td_list, struct ehci_sitd, =
sitd_list);
> is based on.  Namely, in the current code, am I correct that
> insertion of a new urb's sitds into the endpoint's td_list looks like:=20=

>=20
> td_list initially (say it's loaded up with a 3-packet urb)
> |-----|   |-----|   |-----|
> |td0_0|-->|td0_1|-->|td0_2|
> |-----|   |-----|   |-----|
>=20
> line 2090 in the genuine kernel code:
> (executed three times for a new 3-packet urb)
> list_add(&sitd->sitd_list, &iso_sched->td_list);=20
>=20
> |-----|   |-----|   |-----|   |-----|   |-----|   |-----|
> |td0_0|-->|     |-->|     |-->|     |-->|td0_1|-->|td0_2|
> |-----|   |-----|   |-----|   |-----|   |-----|   |-----|
>=20
> ?
>=20
> The following later lines in stid_link_urb (again genuine kernel code) =
then put
> these new sitds in their proper place I think:
> 2177  sitd =3D list_entry(iso_sched->td_list.next,
> 2178    struct ehci_itd, sitd_list);
> 2179  list_move_tail(&sitd->sitd_list, &stream->td_list);=20
>=20
> Lastly, I'm still a bit confused by this comment in ehci-sched.c:
> /* special case for isoc transfers larger than 125us:
> * the first and each subsequent fully used uframe
> * must be empty, so as to not illegally delay
> * already scheduled transactions
> */
> To me, the main issue is that the adopted "carryover" approach to =
budgeting
> doesn't take into account the fact that the TT processes the =
transactions
> sequentially (at least according to all the footprints shown in the =
figs. in
> EHCI1 and USB2) and doesn't, e.g., do part of transaction 1, switch to
> transaction 2, then go back to transaction 1.  This most obviously is
> problematic for long transactions, hence ehci-sched.c handling this =
case
> separately.
> I make a point of bringing this up because, given the inflation of the
> max_tt_usecs values in the patch, it is actually the case that a newly =
budgeted
> endpoint may "delay already scheduled transactions". For example, say =
there's a
> transaction budgeted for HuFrame 1 with tt_usecs=3D2 us and a new =
device gets
> plugged in that requires up to tt_usecs=3D140 us per transaction.  The =
new device
> will also get budgeted for HuFrame 1.  Then, the device's transactions =
that
> actually do take >125 us (due to unfavorable bit stuffing =
requirements) will
> delay the 2 us transaction (it's maybe worth pointing out that this =
relies on
> the fact that sitd_link in ehci-sched.c puts the newer sitds first in =
the
> periodic queue for each uframe).  I don't think there's anything =
"illegal"
> about this though.
>=20
> ---
> drivers/usb/host/ehci-sched.c | 132 ++++++++++++++++++++++++++--------
> drivers/usb/host/ehci.h       |   5 +-
> 2 files changed, 106 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/usb/host/ehci-sched.c =
b/drivers/usb/host/ehci-sched.c
> index a241337c9..7c2f2125d 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -285,13 +285,13 @@ static void compute_tt_budget(u8 =
budget_table[EHCI_BANDWIDTH_SIZE],
>  for (uf =3D ps->phase_uf; uf < 8; ++uf) {
>  x +=3D budget_line[uf];
> - /* Each microframe lasts 125 us */
> - if (x <=3D 125) {
> + /* Cumulative tt_usecs can be as large as 145 us */
> + if (x <=3D 145) {
>  budget_line[uf] =3D x;
>  break;
>  }
> - budget_line[uf] =3D 125;
> - x -=3D 125;
> + budget_line[uf] =3D 145;
> + x -=3D 145;
>  }
>  }
>  }
> @@ -313,7 +313,13 @@ static int __maybe_unused same_tt(struct =
usb_device *dev1,
> #ifdef CONFIG_USB_EHCI_TT_NEWSCHED
>  static const unsigned char
> -max_tt_usecs[] =3D { 125, 125, 125, 125, 125, 125, 30, 0 };
> +/*
> + * tt_usecs includes worst-case bit stuffing time, so the =
transactions
> + * (complete and/or partial) budgeted for a given 125 us uframe can =
have a
> + * cumulative tt_usecs as large as 145 us and still possibly fit into =
the
> + * uframe.
> +*/
> +max_tt_usecs[] =3D { 145, 145, 145, 145, 145, 145, 35, 0 };
>  /* carryover low/fullspeed bandwidth that crosses uframe boundries */
> static inline void carryover_tt_bandwidth(unsigned short tt_usecs[8])
> @@ -378,13 +384,13 @@ static int tt_available(
>  if (max_tt_usecs[uframe] <=3D tt_usecs[uframe])
>  return 0;
> - /* special case for isoc transfers larger than 125us:
> + /* special case for isoc transfers larger than max_tt_usecs:
>  * the first and each subsequent fully used uframe
>  * must be empty, so as to not illegally delay
>  * already scheduled transactions
>  */
> - if (usecs > 125) {
> - int ufs =3D (usecs / 125);
> + if (usecs > 145) {
> + int ufs =3D (usecs / 145);
>   for (i =3D uframe; i < (uframe + ufs) && i < 8; i++)
>  if (tt_usecs[i] > 0)
> @@ -1388,19 +1394,40 @@ sitd_slot_ok(
>  struct ehci_tt *tt
> )
> {
> - unsigned mask, tmp;
> + unsigned mask, c_mask2, tmp;
>  unsigned frame, uf;
>   mask =3D stream->ps.cs_mask << (uframe & 7);
> +    c_mask2 =3D mask >> 16;
> +    mask =3D mask & 0xffff;
> +    if((c_mask2 & 1) && (c_mask2 & 1<<1) && (c_mask2 & 1<<2)) {
> +        /* if BuFrame6 is the last uframe in which a transaction is =
budgeted,
> +         * the transaction will initially be configured to have =
CSPLITS in
> +         * BuFrame7 as well as BuFrames 0 and 1 of the following =
frame
> +         * (HuFrames 0,1,2) */
> +        /* below: usb2 spec 11.18.4.3.c paragraph 2 */
> +        if(mask & 1) {
> +            c_mask2 =3D 1;=20
> +        } else {
> +            c_mask2 =3D (1<<2)-1;
> +        }
> +    } else if ((c_mask2 & 1) && (c_mask2 & 1<<1)) {
> +        /* if BuFrame5 is the last uframe in which a transaction is =
budgeted,
> +         * the transaction will initially be configured to have =
CSPLITS in
> +         * BuFrames 6 and 7 as well as BuFrame 0 of the following =
frame
> +         * (HuFrames 7,0,1) */
> +        /* below: usb2 spec 11.18.4.3.c paragraph 1 */
> +        if(mask & 1) {
> +            c_mask2 =3D 1;=20
> +        }
> +    }
> +    if((c_mask2 & mask & 1<<1))
> +        return 0; /* ehci1 4.12.3.1 */
>   /* for OUT, don't wrap SSPLIT into H-microframe 7 */
>  if (((stream->ps.cs_mask & 0xff) << (uframe & 7)) >=3D (1 << 7))
>  return 0;
> - /* for IN, don't wrap CSPLIT into the next frame */
> - if (mask & ~0xffff)
> - return 0;
> -
>  /* check bandwidth */
>  uframe &=3D stream->ps.bw_uperiod - 1;
>  frame =3D uframe >> 3;
> @@ -1450,8 +1477,10 @@ sitd_slot_ok(
>  uframe +=3D stream->ps.bw_uperiod;
>  } while (uframe < EHCI_BANDWIDTH_SIZE);
> - stream->ps.cs_mask <<=3D uframe & 7;
> + stream->ps.cs_mask =3D mask;
> + stream->ps.c_mask2 =3D c_mask2;
>  stream->splits =3D cpu_to_hc32(ehci, stream->ps.cs_mask);
> + stream->c_splits2 =3D cpu_to_hc32(ehci, stream->ps.c_mask2);
>  return 1;
> }
> @@ -2049,13 +2078,13 @@ sitd_urb_transaction(
>   /* allocate/init sITDs */
>  spin_lock_irqsave(&ehci->lock, flags);
> - for (i =3D 0; i < urb->number_of_packets; i++) {
> -
> - /* NOTE:  for now, we don't try to handle wraparound cases
> - * for IN (using sitd->hw_backpointer, like a FSTN), which
> - * means we never need two sitds for full speed packets.
> - */
> -
> + for (i =3D 0; i < 2 * urb->number_of_packets; i++) {
> +        /* use 2 * number_of_packets to accommodate frame-hopping =
CSPLITS. if
> +         * there are no such CSPLITS OR if the packet interval is 1 =
frame
> +         * (meaning frame-hopping CSPLITS don't require an extra =
sitd, ehci
> +         * spec 1.0 4.12.3.4), then more sitds than needed are =
allocated by
> +         * this loop.  Excess sitds are added to the free list later
> +         */
>  /*
>  * Use siTDs from the free list, but not siTDs that may
>  * still be in use by the hardware.
> @@ -2107,12 +2136,24 @@ sitd_patch(
> {
>  struct ehci_iso_packet *uf =3D &iso_sched->packet[index];
>  u64 bufp;
> +    __hc32      transaction;
>   sitd->hw_next =3D EHCI_LIST_END(ehci);
>  sitd->hw_fullspeed_ep =3D stream->address;
> - sitd->hw_uframe =3D stream->splits;
> - sitd->hw_results =3D uf->transaction;
> - sitd->hw_backpointer =3D EHCI_LIST_END(ehci);
> + sitd->hw_backpointer =3D cpu_to_hc32(ehci, =
sitd->backpointer_sitd_dma);=20
> +    transaction =3D uf->transaction;
> +
> +    if(sitd->backpointer_sitd_dma=3D=3D1) { /* null backpointer */
> +        sitd->hw_uframe=3Dstream->splits;
> +    } else {
> +        if(stream->ps.period=3D=3D1) {
> +            sitd->hw_uframe=3Dstream->splits|stream->c_splits2;
> +        } else  {
> +            sitd->hw_uframe=3Dstream->c_splits2;
> +        }
> +        transaction |=3D SITD_STS_STS; /* start in Do Complete Split =
mode, ehci1 4.12.3.3.2.1*/
> +    }
> + sitd->hw_results =3D transaction;
>   bufp =3D uf->bufp;
>  sitd->hw_buf[0] =3D cpu_to_hc32(ehci, bufp);
> @@ -2149,13 +2190,19 @@ static void sitd_link_urb(
>  unsigned next_uframe;
>  struct ehci_iso_sched *sched =3D urb->hcpriv;
>  struct ehci_sitd *sitd;
> + struct ehci_sitd *sitd_before;
>   next_uframe =3D stream->next_uframe;
> - if (list_empty(&stream->td_list))
> + if (list_empty(&stream->td_list)) {
>  /* usbfs ignores TT bandwidth */
>  ehci_to_hcd(ehci)->self.bandwidth_allocated
>  +=3D stream->bandwidth;
> +        sitd_before =3D NULL;
> +    } else {
> +        sitd_before =3D list_last_entry(&sched->td_list,
> +                struct ehci_sitd, sitd_list);
> +    }
>   if (ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs =3D=3D 0) {
>  if (ehci->amd_pll_fix =3D=3D 1)
> @@ -2165,9 +2212,9 @@ static void sitd_link_urb(
>  ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs++;
>   /* fill sITDs frame by frame */
> - for (packet =3D sched->first_packet, sitd =3D NULL;
> - packet < urb->number_of_packets;
> - packet++) {
> + for (int i =3D sched->first_packet, sitd =3D NULL;
> + i < 2 * urb->number_of_packets;
> + i++) {
>   /* ASSERT:  we have all necessary sitds */
>  BUG_ON(list_empty(&sched->td_list));
> @@ -2176,15 +2223,40 @@ static void sitd_link_urb(
>   sitd =3D list_entry(sched->td_list.next,
>  struct ehci_sitd, sitd_list);
> +        =
if((i>=3Durb->number_of_packets)&&((stream->ps.period=3D=3D1)||(!(stream->=
ps.c_mask2)))) {
> +            /*=20
> +             * no frame-hopping CSPLITS OR the period is 1, so such =
CSPLITS are
> +             * put into the sitd for the next transfer ; in both =
cases
> +             * #sitds=3D#transfers, so move the surplus sitd to the =
free list
> +             */
> +            list_move_tail(&sitd->sitd_list, &stream->free_list);
> +            continue;
> +        }
> +        if(stream->ps.c_mask2 && !list_empty(&stream->td_list) &&
> +                ((stream->ps.period=3D=3D1)||(i%2=3D=3D1)) ) {
> +            sitd->backpointer_sitd_dma =3D sitd_before->sitd_dma;
> +        } else {
> +            sitd->backpointer_sitd_dma =3D 1;
> +        }
>  list_move_tail(&sitd->sitd_list, &stream->td_list);
>  sitd->stream =3D stream;
>  sitd->urb =3D urb;
> - sitd_patch(ehci, stream, sitd, sched, packet);
> + sitd_patch(ehci, stream, sitd, sched, i);
>  sitd_link(ehci, (next_uframe >> 3) & (ehci->periodic_size - 1),
>  sitd);
> - next_uframe +=3D stream->uperiod;
> +        if(stream->ps.c_mask2 && (stream->ps.period!=3D1)) {
> +            if((i%2)=3D=3D0) {
> +                /* next sitd only has frame-hopping CSPLITS */
> +                next_uframe +=3D 8;
> +            } else if ((i%2)=3D=3D1) {
> +                next_uframe +=3D stream->uperiod - 8;
> +            }
> +        } else {
> +            next_uframe +=3D stream->uperiod;
> +        }
> +        sitd_before =3D sitd;
>  }
>  stream->next_uframe =3D next_uframe & (mod - 1);
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index d7a3c8d13..c1c006bd3 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -51,6 +51,7 @@ struct ehci_per_sched {
>  struct list_head ps_list; /* node on ehci_tt's ps_list */
>  u16 tt_usecs; /* time on the FS/LS bus */
>  u16 cs_mask; /* C-mask and S-mask bytes */
> + u8 c_mask2; /* C-mask for frame-crossing TT-iso transfer */
>  u16 period; /* actual period in frames */
>  u16 phase; /* actual phase, frame part */
>  u8 bw_phase; /* same, for bandwidth
> @@ -489,7 +490,8 @@ struct ehci_iso_stream {
>  /* output of (re)scheduling */
>  struct ehci_per_sched ps; /* scheduling info */
>  unsigned next_uframe;
> - __hc32 splits;
> + __hc32 splits; /* C-mask and S-mask */
> + __hc32 c_splits2; /* C-mask for frame-hopping CSPLITS */
>   /* the rest is derived from the endpoint descriptor,
>  * including the extra info for hw_bufp[0..2]
> @@ -579,6 +581,7 @@ struct ehci_sitd {
>   /* the rest is HCD-private */
>  dma_addr_t sitd_dma;
> + dma_addr_t backpointer_sitd_dma;
>  union ehci_shadow sitd_next; /* ptr to periodic q entry */
>   struct urb *urb;
> --=20
> 2.39.5
>=20


