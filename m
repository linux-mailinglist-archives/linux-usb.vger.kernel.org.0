Return-Path: <linux-usb+bounces-36584-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJMzEroM8GmiNgEAu9opvQ
	(envelope-from <linux-usb+bounces-36584-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 03:26:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA1547C5F8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 03:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F52C304CE94
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 01:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F312D3725;
	Tue, 28 Apr 2026 01:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0gPTeXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D032D46C0
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 01:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777339511; cv=none; b=rp2IZpk1jkqzTWCi6VIlMWbUzQ85iB1Xyop+zV37qlfT1mBKtngc6y4SitsMLB8hg9Qtd+F6nPOkdOfR2Ib52wgQ5lVppDtDqfxflGufmkBG/Fv9+guoQMGMFQ/LMm3AmOYg/KJiMBX0sYz7aICJu3kvLEgZSazDHzbAmxrOK5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777339511; c=relaxed/simple;
	bh=Bl0hCh4MdtCkj63VbmrLWtQzeSfvNH+VVoblS/Ga3Tg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=PHYXIXuCX8R1HZiCvRHOggMPb43re60fSKuXPTrEluTi0af0pQfMz7TGozwHbc6wJpM4xpwdXfyATxndKHgXuUiLakxHzrXIwv6xes+/6765ZqdHaFMifcGhUKPwIEaOFMRY+438ZEUCOOazI27DOLEJ8AyDX8694murxtNF2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0gPTeXB; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so6728744b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777339509; x=1777944309; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mamo0FLNi7WiEY2jT/4k8eFvgLCXwt5uRv39pxs5jJw=;
        b=Y0gPTeXB0royEhPJr8y7DoFzxWTT6j0Pp//kXDgde5ikRhUZSdVNiTiYe9ROi/1PZW
         CUWESbbiNu0dsqSuowQtat6JOuuqILGrssP/IZ1wQxcFdgLEU9v7R7QJx9Qcjqrjn3uE
         T26VD4+vPg/L8TZctoj0hCV2WbMZcqqznlWIxWMmXTwcXh0IItPQxo3YhphCvr1mpK62
         GzSMs65GJMYYHLNLJJByqHgom6S30prZ2Tk8dqPmlg8bCtpoaY6qDpubu9XMYPmMOqte
         AJ3WZaGYP4G4IOkSjrZqgUAj/CgnkTJiVib+BQMu3AMd1mD0Spykvj1hNnFUG797VhkS
         Q43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777339509; x=1777944309;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mamo0FLNi7WiEY2jT/4k8eFvgLCXwt5uRv39pxs5jJw=;
        b=pcQi2NwvDIQyVVrTAA+1H/NvDxMW1bCS4CTlb/0jgi9qdGWhhxobJjY1j4VQr22zYr
         JAZuQ59aVM0ccoNp+njq0yP99DE7ha8mfw3uj+/LCA83GQ0loUZLkd39RZo1uZ+EGmxf
         hQ43aIXSUPBkcYj8qO8qRaArWwcKG10ps/hTgOOtjd9rRfadfoFSRNWRQiLbUOwLoI8R
         OU2e9yx2d/tDkc7g1JFKjI0Sw8+vOg1xYtH6pdYzRsY2PoTKR6j8uLOGqjUdSK2sK0P0
         KlbSBF0i/wRJn4PIaBw2MSaaoP0bOV9W8yWNuBBOULUgY7bM3k5BEL9ZO2Q4M+u9HeyH
         D/fQ==
X-Gm-Message-State: AOJu0YxA4fy2Ev5BmrpK/UmqFb7ZfpUulov76NaSMhHtW7A1WD6PrPsm
	bqi5z8H+n3ACBQv4lr1CyE87TJiM05Im+xRZBggtuWpDJ2tVeVQbXqB3
X-Gm-Gg: AeBDiesHXrm6xpxqeUFPMXMm9lz3lUPR2t3Q+cm6Qc0iM/pQ0xQhnx+WvQnu80YaMvd
	V9z2jMIsFYfZbdvROFU854rWVqz+euqSa+V2iMeLLTJDUOajZnESNvrgGU3R/cQTwQGIB7PiJXZ
	H73uHoqj0DNrBnVTgkKmWRgjRyUK5ZNMNCHRwtfzXjmvSePAfg4EmddfPqxL2IxQZvD39Xc4yKK
	RfXwtRVX5fcIxNUXd31Vwrt6PdnV6gOIpFNeACDU2mmu7L0je2NtTYJnBpLddbPjQd/rdoWjz+2
	drCbO7ZIBXzaBkbHfS5ECLbTBHHC5FFI4FflUq/iY3XqpgXmJnKb1K9mjfk/r5h7Ijv4XLXSsDu
	jCcW2znK0redQOnwl0cn/PDowmnf9bO4rTtRc8lEqBHxtfZ43jeEZB0S/3XkRf5o1nC0xOoV1R1
	kcbVMs+r9fHkntoavHjwR4H/L6qNOabITQU+7BcAvhqR6G2V0eyCxXj7aMbUwdFH44Ph51gxCSq
	FbXPwtnX6k/V0Q805wB
X-Received: by 2002:a05:6a00:398f:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-834ddc8e628mr829024b3a.43.1777339509350;
        Mon, 27 Apr 2026 18:25:09 -0700 (PDT)
Received: from smtpclient.apple (lib-03-subnet-130.rdns.cenic.net. [205.154.246.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf3121esm707878b3a.38.2026.04.27.18.25.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 18:25:09 -0700 (PDT)
From: Brent Page <brentfpage@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: =?utf-8?Q?TT_budgeting_for_EHCI=3B_accommodate_1023-byte_full-spe?=
 =?utf-8?Q?ed_isochronous=E2=80=93in_endpoints?=
Message-Id: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
Date: Mon, 27 Apr 2026 18:24:58 -0700
Cc: linux-usb@vger.kernel.org
To: stern@rowland.harvard.edu
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Queue-Id: 9DA1547C5F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-36584-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url]

Hello,

I recently encountered the ENOSPC error mentioned here =
(https://lkml.org/lkml/2013/2/19/482) when trying to communicate with a =
full-speed peripheral with one isochronous=E2=80=93in endpoint with a =
wMaxPacketSize of 1023.  N.b., that patch was reverted =
(https://lkml.org/lkml/2013/6/18/458).  I think it should be tried again =
with a different approach.  Namely, I propose multiplying the =
max_tt_usecs values in ehci-sched.c by the worst-case bit-stuffing =
multiplier, 7/6, making them
- max_tt_usecs[] =3D { 125, 125, 125, 125, 125, 125, 30, 0 };
+ max_tt_usecs[] =3D { 145, 145, 145, 145, 145, 145, 35, 0 };
After I make this simple change, along with a few other 125->145 =
substitutions in ehci-sched.c, my linux tablet is able to establish a =
steady data link with my 1023-byte-endpoint peripheral.
Obviously, 145 us is longer than a microframe, so this best-case budget =
will often not reflect the times when transactions occur.  But, this =
situation is consistent with the best-case budget in section 11.18.1 of =
the USB-2 spec, in which 1157 data-bytes are scheduled to occur as =
though no bit-stuffing necessary (i.e., the 188 bytes =3D 12 =
megabits/second * (1 byte/8 bits)* 0.125 ms that can run on the =
full-speed bus in a microframe are all taken taken be data-bytes).  So, =
after the patch, max_tt_usecs is the same as the spec's best-case budget =
but is just scaled by (125 us / 188 bytes) =3D 1/(12 megabits/s) and by =
the 7/6 bit-stuffing multiplier to reflect the fact that the scheduling =
code works in bit-stuffing-inclusive bus-time instead of data-bytes.
To try to further dispel concerns stemming from 145 > 125, I'll point =
out that, if a given microframe is budgeted close to 145 us of TT time =
using the calculations in ehci-sched.c, it will sometimes be the case =
that the associated transactions take less than 125 us, so they will run =
successfully within the microframe.  In particular, this will happen if =
the transactions require very little bit stuffing.

Previous EHCI scheduling work has also noted that obeying the spec =
entails the possibility of overcommitting the TT.  See the comments =
below from https://marc.info/?l=3Dlinux-usb-devel&m=3D115933214319141&w=3D=
4

+/* Because EHCI cannot issue ssplits in uframe 7 and USB 2.0 does not
+   allow ssplits in uframe 6, EHCI can only generate an efficient FS
+   frame by scheduling according to best-case (not worst-case) bit
+   stuffing.  Thus we purposely 'overcommit' the FS frame budget
+   within the buffering ability of the TT to buffer, and within the
+   limits of the 90/10 rule.  The TT will catch up in the microframes
+   where we cannot issue start splits.
+*/

"/* Scheduling through a TT is done by byte counting, not usec
+	  counting.  Because we cannot issue a FS/LS start split in
+	  uFrame 6 or 7, the only way to get anywhere near a full 90%
+	  of a FS frame for periodic transactions is to 'overcommit'
+	  the FS scheduling of each microframe [when considered by
+	  usecs needed for the transfer].  This is not actually
+	  overcommitting as the TT will buffer the 'excess' from any
+	  uFrame and schedule it to transmit in a later uFrame. USB
+	  2.0 11.18.4: "Scheduling of split transactions is done by
+	  the host (typically in software) based on a best-case
+	  estimate of how the full-/low-speed transacitons can be run
+	  on the downstream facing bus." */"

From,
Brent Page=

