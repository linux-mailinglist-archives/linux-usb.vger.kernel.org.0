Return-Path: <linux-usb+bounces-38254-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAUtJ6eUHWqmcQkAu9opvQ
	(envelope-from <linux-usb+bounces-38254-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 16:18:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19986620AE3
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 16:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED90D302A887
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 14:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D502B3B8D4A;
	Mon,  1 Jun 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="JpQ9GagG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m32104.qiye.163.com (mail-m32104.qiye.163.com [220.197.32.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4F1A683E;
	Mon,  1 Jun 2026 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323408; cv=none; b=KUNB8xv17c2rsewe12q/omNQlzFsusAVR+7vflo136fmHzZVT+zdCJOdIrNmgcTOM2KYTNoMVn6Ag9coiJI3AtDlRbB+RusTjiyPsue+D2EGU179UbOgrjijk4mFubE2gScYtGuLecIJWPrT/2O3XfVoW6XTlGCs/QW0SpnnNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323408; c=relaxed/simple;
	bh=2Fg43jSv/Kgygwp5Ph2sPTEFMpUzuR5L9FJq4FQihc8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MaDbuQCTzqE8OgEb7e8W+JsYquyim9Il8CD+ZcugoqiMkYNZgtOFbzErKudUT+0FMl62SL3cyWeQ6dAzkm38Abslic7g8yTcE/hcJijR3iASMr1Q5JwTCelPmuiDB26XcZWwhTWcTJ0DdN91IsvWiXxK5HLgLSG2e10ajEIHI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=JpQ9GagG; arc=none smtp.client-ip=220.197.32.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from localhost (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 408c8ec53;
	Mon, 1 Jun 2026 14:19:44 +0800 (GMT+08:00)
Date: Mon, 1 Jun 2026 14:19:39 +0800
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: Alex Shi <seakeel@gmail.com>
Cc: linux-usb@vger.kernel.org, si.yanteng@linux.dev,
 gregkh@linuxfoundation.org, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, doubled@leap-io-kernel.com, alexs@kernel.org
Subject: Re: [PATCH v3] docs/zh_CN: usb: refine translated wording and
 formatting
Message-ID: <20260601141939.000028a6@leap-io-kernel.com>
In-Reply-To: <bf39b996-246a-484f-b4a3-c77f77cca0a3@gmail.com>
References: <2026053149-flaky-shallow-2460@gregkh>
	<20260601033945.555210-1-baikefan@leap-io-kernel.com>
	<bf39b996-246a-484f-b4a3-c77f77cca0a3@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-HM-Tid: 0a9e81d695c403ackunmdb477d771b1cfb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHRodVk5DTkgZTB0aHhlLSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=JpQ9GagGjCG1HAqqYoi+CCz1XeKDx4+v70Vlbf44D7940iF/3+Z/vNPm5IN6W+WXOkHqeFUaNjfrC9/FrBjvnqoOEJsLEvKH1buvDFNNv2HOZyoB4Vko55B18l3ihwwnL/bJqPKJQoi8404k7FtfldAU9eZgFRWt/yWc1DLhGDmhkKdEBZVH9Lq/vgWylXJO3WAMu/hQVJuWRE0xinQ2Ej9DRCXcIetSZQNKbacYHaOZVdpWbQq++7z3JygB93r6pR9rbPyVstVzHLlVYytVbp21MDj6ys9B6M7f4nwH0V+DzFTYe5J4X8Rkb4M9wnFsymPFmXmQ7ohSYeHOwEOWZw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=Q5Q3mhwiSgyK2BUV/e4qgH9RzZlY6A5V9o+JF4FUFJA=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38254-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 19986620AE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 12:00:03 +0800
Alex Shi <seakeel@gmail.com> wrote:

> Hi Kefan,
>=20
> It looks fine.
>=20
> BTW, like any other kernel patches, document patch also requires a
> line length limit of either 80 or 100 English characters per line
> (which corresponds to 40 or 50 Chinese characters). Within the same
> document, you should keep it consistent by using either the
> 80-character or the 100-character limit throughout.
>=20
> You should try your best to align your patch accordingly, as this
> makes it look much cleaner and more readable. To make this easier,
> you can use a text editor with a column indicator (ruler) to help you
> align the text, or you can use the command :set cc=3D80 in Vim to check
> your formatting.
>=20
> Thanks
> Alex

Hi Alex,

Thanks for taking the time to review this patch.

I'll rewrap each translated USB document to maintain a consistent
80-column limit and check for any remaining formatting issues before
sending v4.

Thanks again for the review and the formatting reminder.

Thanks,
Kefan

>=20
> On 2026/6/1 11:39, Kefan Bai wrote:
> > Refine the zh_CN USB translations for clarity and consistency.
> >=20
> > Improve wording, wrapping, and formatting across the translated
> > USB documents.
> >=20
> > Link:https://lore.kernel.org/r/2026053149-flaky-shallow-2460@gregkh
> > Suggested-by: Alex Shi<seakeel@gmail.com>
> > Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> > ---
> > v3:
> > - refine the subject and commit message
> > - add a Link trailer to the cleanup request thread
> > - move revision notes below the cut line
> >=20
> > v2:
> > - replace the obsolete FSF mailing address reference in acm.rst
> > - trim the commit message to satisfy checkpatch
> >=20
> >   Documentation/translations/zh_CN/usb/CREDITS  | 146 ++++---
> >   Documentation/translations/zh_CN/usb/acm.rst  |  62 ++-
> >   .../translations/zh_CN/usb/authorization.rst  |  79 ++--
> >   .../translations/zh_CN/usb/chipidea.rst       |  58 ++-
> >   Documentation/translations/zh_CN/usb/dwc3.rst |  37 +-
> >   Documentation/translations/zh_CN/usb/ehci.rst | 247 +++++-------
> >   .../translations/zh_CN/usb/index.rst          |  18 +-
> >   .../translations/zh_CN/usb/usbmon.rst         | 363
> > ++++++++---------- 8 files changed, 442 insertions(+), 568
> > deletions(-)
> >=20
> > diff --git a/Documentation/translations/zh_CN/usb/CREDITS
> > b/Documentation/translations/zh_CN/usb/CREDITS index
> > c133b1a5daff..a37958d139cc 100644 ---
> > a/Documentation/translations/zh_CN/usb/CREDITS +++
> > b/Documentation/translations/zh_CN/usb/CREDITS @@ -10,12 +10,10 @@
> >   :=E6=A0=A1=E8=AF=91:
> >  =20
> >  =20
> > -=E7=AE=80=E6=98=93 Linux USB =E9=A9=B1=E5=8A=A8=E7=9A=84=E8=87=B4=E8=
=B0=A2=E5=90=8D=E5=8D=95=EF=BC=9A
> > +Simple Linux USB =E9=A9=B1=E5=8A=A8=E9=A1=B9=E7=9B=AE=E8=87=B4=E8=B0=
=A2=E5=90=8D=E5=8D=95=EF=BC=9A
> >  =20
> > -=E4=BB=A5=E4=B8=8B=E4=BA=BA=E5=91=98=E9=83=BD=E4=B8=BA Linux USB =E9=
=A9=B1=E5=8A=A8=E4=BB=A3=E7=A0=81=E4=BD=9C=E5=87=BA=E4=BA=86=E8=B4=A1=E7=8C=
=AE
> > -=EF=BC=88=E6=8C=89=E5=A7=93=E6=B0=8F=E5=AD=97=E6=AF=8D=E9=A1=BA=E5=BA=
=8F=E6=8E=92=E5=88=97=EF=BC=89=E3=80=82=E6=88=91=E7=9B=B8=E4=BF=A1=E8=BF=99=
=E4=BB=BD=E5=90=8D=E5=8D=95=E6=9C=AC=E5=BA=94
> > -=E6=9B=B4=E9=95=BF=E4=B8=80=E4=BA=9B=EF=BC=8C=E4=BD=86=E7=A1=AE=E5=AE=
=9E=E4=B8=8D=E5=AE=B9=E6=98=93=E7=BB=B4=E6=8A=A4=E3=80=82
> > -=E5=A6=82=E9=9C=80=E5=B0=86=E8=87=AA=E5=B7=B1=E5=8A=A0=E5=85=A5=E5=90=
=8D=E5=8D=95=EF=BC=8C=E8=AF=B7=E6=8F=90=E4=BA=A4=E8=A1=A5=E4=B8=81=E3=80=82
> > +=E4=BB=A5=E4=B8=8B=E4=BA=BA=E5=91=98=E9=83=BD=E4=B8=BA Linux USB
> > =E9=A9=B1=E5=8A=A8=E4=BB=A3=E7=A0=81=E4=BD=9C=E5=87=BA=E8=BF=87=E8=B4=
=A1=E7=8C=AE=EF=BC=88=E6=8C=89=E5=A7=93=E6=B0=8F=E5=AD=97=E6=AF=8D=E9=A1=BA=
=E5=BA=8F=E6=8E=92=E5=88=97=EF=BC=89=E3=80=82=E8=BF=99=E4=BB=BD=E5=90=8D
> > +=E5=8D=95=E6=9C=AC=E8=AF=A5=E6=9B=B4=E9=95=BF=EF=BC=8C=E5=8F=AA=E6=98=
=AF=E7=A1=AE=E5=AE=9E=E4=B8=8D=E6=98=93=E7=BB=B4=E6=8A=A4=EF=BC=9B=E5=A6=82=
=E6=9E=9C=E4=BD=A0=E4=B9=9F=E5=BA=94=E5=88=97=E5=90=8D=E5=85=B6=E4=B8=AD=EF=
=BC=8C=E6=AC=A2=E8=BF=8E=E6=8F=90=E4=BA=A4=E8=A1=A5=E4=B8=81=E6=8A=8A=E8=87=
=AA=E5=B7=B1=E5=8A=A0=E4=B8=8A=E3=80=82=20
> >     Georg Acher<acher@informatik.tu-muenchen.de>
> >     David Brownell<dbrownell@users.sourceforge.net>
> > @@ -41,123 +39,123 @@
> >   =E7=89=B9=E5=88=AB=E6=84=9F=E8=B0=A2=EF=BC=9A
> >  =20
> >     Inaky Perez Gonzalez<inaky@peloncho.fis.ucm.es>
> > -  =E6=84=9F=E8=B0=A2=E4=BB=96=E5=8F=91=E8=B5=B7=E4=BA=86 Linux USB =E9=
=A9=B1=E5=8A=A8=E5=BC=80=E5=8F=91=E5=B7=A5=E4=BD=9C=EF=BC=8C=E5=B9=B6=E7=BC=
=96=E5=86=99=E4=BA=86=E4=BD=93=E9=87=8F=E8=BE=83=E5=A4=A7=E7=9A=84 uusbd
> > -  =E9=A9=B1=E5=8A=A8=E4=B8=AD=E7=9A=84=E5=A4=A7=E9=83=A8=E5=88=86=E4=
=BB=A3=E7=A0=81=E3=80=82=E6=88=91=E4=BB=AC=E4=BB=8E=E9=82=A3=E9=A1=B9=E5=B7=
=A5=E4=BD=9C=E4=B8=AD=E5=AD=A6=E5=88=B0=E4=BA=86=E5=BE=88=E5=A4=9A=E3=80=82
> > +  =E6=84=9F=E8=B0=A2=E4=BB=96=E7=89=B5=E5=A4=B4=E5=BC=80=E5=8F=91 Linu=
x USB =E9=A9=B1=E5=8A=A8=EF=BC=8C=E5=B9=B6=E7=BC=96=E5=86=99=E4=BA=86 uusbd
> > =E9=A9=B1=E5=8A=A8=E7=9A=84=E5=A4=A7=E9=83=A8=E5=88=86=E4=BB=A3=E7=A0=
=81=EF=BC=8C=E6=88=91=E4=BB=AC
> > +  =E4=BB=8E=E4=B8=AD=E5=AD=A6=E5=88=B0=E4=BA=86=E5=BE=88=E5=A4=9A=E3=
=80=82
> >  =20
> >     NetBSD =E5=92=8C FreeBSD =E7=9A=84 USB =E5=BC=80=E5=8F=91=E8=80=85=
=E4=BB=AC
> >     =E6=84=9F=E8=B0=A2=E4=BB=96=E4=BB=AC=E5=8A=A0=E5=85=A5 Linux USB =
=E9=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8=EF=BC=8C=E6=8F=90=E4=BE=9B=E5=BB=BA=E8=
=AE=AE=E5=B9=B6=E5=88=86=E4=BA=AB=E5=AE=9E=E7=8E=B0=E7=BB=8F=E9=AA=8C=E3=80=
=82
> >  =20
> > -=E9=99=84=E5=8A=A0=E6=84=9F=E8=B0=A2=EF=BC=9A
> > -
> > =E8=BF=98=E8=A6=81=E6=84=9F=E8=B0=A2=E4=BB=A5=E4=B8=8B=E5=85=AC=E5=8F=
=B8=E4=B8=8E=E4=B8=AA=E4=BA=BA=E5=9C=A8=E7=A1=AC=E4=BB=B6=E3=80=81=E6=94=AF=
=E6=8C=81=E3=80=81=E6=97=B6=E9=97=B4=E6=8A=95=E5=85=A5=E5=92=8C=E5=BC=80=E5=
=8F=91=E6=96=B9=E9=9D=A2=E6=8F=90=E4=BE=9B=E7=9A=84=E6=8D=90=E8=B5=A0=E4=B8=
=8E=E5=B8=AE=E5=8A=A9
> > -  =EF=BC=88=E6=91=98=E8=87=AA Inaky =E9=A9=B1=E5=8A=A8=E5=8E=9F=E5=A7=
=8B=E7=9A=84 THANKS =E6=96=87=E4=BB=B6=EF=BC=89=EF=BC=9A
> > +=E5=8F=A6=E5=A4=96=E8=BF=98=E8=A6=81=E6=84=9F=E8=B0=A2=EF=BC=9A
> >  =20
> > -    =E4=BB=A5=E4=B8=8B=E5=85=AC=E5=8F=B8=E6=9B=BE=E5=B8=AE=E5=8A=A9=E6=
=88=91=E4=BB=AC=E5=BC=80=E5=8F=91 Linux USB / UUSBD=EF=BC=9A
> > +  =E4=BB=A5=E4=B8=8B=E5=85=AC=E5=8F=B8=E5=92=8C=E4=B8=AA=E4=BA=BA=E5=
=9C=A8=E7=A1=AC=E4=BB=B6=E3=80=81=E6=94=AF=E6=8C=81=E3=80=81=E6=97=B6=E9=97=
=B4=E5=92=8C=E5=BC=80=E5=8F=91=E5=B7=A5=E4=BD=9C=E4=B8=8A=E7=BB=99=E4=BA=88=
=E4=BA=86=E5=B8=AE=E5=8A=A9=EF=BC=88=E6=91=98=E8=87=AA
> > Inaky
> > +  =E9=A9=B1=E5=8A=A8=E5=8E=9F=E5=A7=8B=E7=9A=84 THANKS =E6=96=87=E4=BB=
=B6=EF=BC=89=EF=BC=9A
> >  =20
> > -        - 3Com GmbH =E6=8D=90=E8=B5=A0=E4=BA=86=E4=B8=80=E5=8F=B0 ISDN=
 Pro
> > TA=EF=BC=8C=E5=B9=B6=E5=9C=A8=E6=8A=80=E6=9C=AF=E9=97=AE=E9=A2=98=E5=92=
=8C=E6=B5=8B=E8=AF=95=E8=AE=BE=E5=A4=87=E6=96=B9=E9=9D=A2=E4=B8=BA=E6=88=91
> > -          =E6=8F=90=E4=BE=9B=E6=94=AF=E6=8C=81=E3=80=82=E6=B2=A1=E6=83=
=B3=E5=88=B0=E8=83=BD=E5=BE=97=E5=88=B0=E8=BF=99=E4=B9=88=E5=A4=A7=E7=9A=84=
=E5=B8=AE=E5=8A=A9=E3=80=82
> > +    =E4=BB=A5=E4=B8=8B=E5=85=AC=E5=8F=B8=E6=9B=BE=E4=B8=BA Linux USB /=
 UUSBD =E7=9A=84=E5=BC=80=E5=8F=91=E6=8F=90=E4=BE=9B=E5=B8=AE=E5=8A=A9=EF=
=BC=9A
> >  =20
> > -        - USAR Systems =E5=90=91=E6=88=91=E4=BB=AC=E6=8F=90=E4=BE=9B=
=E4=BA=86=E4=BB=96=E4=BB=AC=E5=87=BA=E8=89=B2=E7=9A=84 USB =E8=AF=84=E4=BC=
=B0=E5=A5=97=E4=BB=B6=EF=BC=8C
> > -          =E4=BD=BF=E6=88=91=E4=BB=AC=E8=83=BD=E5=A4=9F=E6=B5=8B=E8=AF=
=95 Linux USB =E9=A9=B1=E5=8A=A8=E5=AF=B9=E6=9C=80=E6=96=B0 USB =E8=A7=84=
=E8=8C=83=E7=9A=84=E7=AC=A6=E5=90=88=E6=80=A7=E3=80=82
> > -          USAR Systems =E8=AE=A4=E8=AF=86=E5=88=B0=E4=BF=9D=E6=8C=81=
=E5=BC=80=E6=94=BE=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E4=B8=8E=E6=97=B6=E4=
=BF=B1=E8=BF=9B=E7=9A=84=E9=87=8D=E8=A6=81=E6=80=A7=EF=BC=8C
> > -          =E5=B9=B6=E4=BB=A5=E7=A1=AC=E4=BB=B6=E6=94=AF=E6=8C=81=E8=BF=
=99=E4=B8=AA=E9=A1=B9=E7=9B=AE=E3=80=82=E6=84=9F=E8=B0=A2=EF=BC=81
> > +        - 3Com GmbH =E6=8D=90=E8=B5=A0=E4=BA=86=E4=B8=80=E5=8F=B0 ISDN=
 Pro
> > TA=EF=BC=8C=E5=B9=B6=E5=9C=A8=E6=8A=80=E6=9C=AF=E9=97=AE=E9=A2=98=E5=92=
=8C=E6=B5=8B=E8=AF=95=E8=AE=BE=E5=A4=87=E6=96=B9=E9=9D=A2=E6=8F=90=E4=BE=9B
> > +          =E4=BA=86=E5=A4=A7=E5=8A=9B=E6=94=AF=E6=8C=81=E3=80=82
> > +
> > +        - USAR Systems =E5=90=91=E6=88=91=E4=BB=AC=E6=8F=90=E4=BE=9B=
=E4=BA=86=E5=87=BA=E8=89=B2=E7=9A=84 USB
> > =E8=AF=84=E4=BC=B0=E5=A5=97=E4=BB=B6=EF=BC=8C=E4=BD=BF=E6=88=91=E4=BB=
=AC=E5=BE=97=E4=BB=A5=E6=B5=8B=E8=AF=95
> > +          Linux USB =E9=A9=B1=E5=8A=A8=E5=AF=B9=E6=9C=80=E6=96=B0 USB =
=E8=A7=84=E8=8C=83=E7=9A=84=E7=AC=A6=E5=90=88=E6=80=A7=E3=80=82USAR Systems
> > =E4=B9=9F=E8=AE=A4=E8=AF=86=E5=88=B0=EF=BC=8C
> > +
> > =E8=AE=A9=E5=BC=80=E6=94=BE=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E8=B7=
=9F=E4=B8=8A=E6=97=B6=E4=BB=A3=E5=BE=88=E9=87=8D=E8=A6=81=EF=BC=8C=E5=9B=A0=
=E6=AD=A4=E4=BB=A5=E7=A1=AC=E4=BB=B6=E6=94=AF=E6=8C=81=E4=BA=86=E8=BF=99=E4=
=B8=AA=E9=A1=B9=E7=9B=AE=EF=BC=8C=E5=9C=A8=E6=AD=A4
> > +          =E8=87=B4=E8=B0=A2=E3=80=82
> >  =20
> >           - =E6=84=9F=E8=B0=A2=E8=8B=B1=E7=89=B9=E5=B0=94=E6=8F=90=E4=
=BE=9B=E7=9A=84=E5=AE=9D=E8=B4=B5=E5=B8=AE=E5=8A=A9=E3=80=82
> >  =20
> >           - =E6=88=91=E4=BB=AC=E4=B8=8E Cherry =E5=90=88=E4=BD=9C=EF=BC=
=8C=E4=BD=BF Linux =E6=88=90=E4=B8=BA=E9=A6=96=E4=B8=AA=E5=86=85=E7=BD=AE U=
SB
> > =E6=94=AF=E6=8C=81=E7=9A=84=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E3=80=
=82 Cherry =E6=98=AF=E5=85=A8=E7=90=83=E6=9C=80=E5=A4=A7=E7=9A=84=E9=94=AE=
=E7=9B=98=E5=88=B6=E9=80=A0=E5=95=86=E4=B9=8B=E4=B8=80=E3=80=82
> >  =20
> > -        - CMD Technology, Inc. =E6=85=B7=E6=85=A8=E6=8D=90=E8=B5=A0=E4=
=BA=86=E4=B8=80=E5=9D=97 CSA-6700 PCI-to-USB
> > -          =E6=8E=A7=E5=88=B6=E5=8D=A1=EF=BC=8C=E7=94=A8=E4=BA=8E=E6=B5=
=8B=E8=AF=95 OHCI =E5=AE=9E=E7=8E=B0=E3=80=82
> > +        - CMD Technology, Inc. =E6=85=B7=E6=85=A8=E6=8D=90=E8=B5=A0=E4=
=BA=86=E4=B8=80=E5=9D=97 CSA-6700 PCI =E8=BD=AC USB
> > =E6=8E=A7=E5=88=B6=E5=8D=A1=EF=BC=8C
> > +          =E7=94=A8=E4=BA=8E=E6=B5=8B=E8=AF=95 OHCI =E5=AE=9E=E7=8E=B0=
=E3=80=82
> >  =20
> > -        - =E7=94=B1=E4=BA=8E=E4=BB=96=E4=BB=AC=E5=AF=B9=E6=88=91=E4=BB=
=AC=E7=9A=84=E6=94=AF=E6=8C=81=EF=BC=8CKeytronic =E5=8F=AF=E4=BB=A5=E6=94=
=BE=E5=BF=83=EF=BC=8C
> > -          =E4=BB=96=E4=BB=AC=E7=9A=84=E9=94=AE=E7=9B=98=E8=83=BD=E5=8D=
=96=E7=BB=99=E8=87=B3=E5=B0=91 300 =E4=B8=87 Linux =E7=94=A8=E6=88=B7=E4=B8=
=AD=E7=9A=84=E4=B8=80=E9=83=A8=E5=88=86=E3=80=82
> > +        - =E6=9C=89=E4=BA=86=E4=BB=96=E4=BB=AC=E7=9A=84=E6=94=AF=E6=8C=
=81=EF=BC=8CKeytronic =E8=87=B3=E5=B0=91=E5=8F=AF=E4=BB=A5=E7=A1=AE=E4=BF=
=A1=EF=BC=8C=E5=85=B6=E9=94=AE=E7=9B=98=E8=83=BD=E5=A4=9F=E9=94=80=E5=94=AE=
=E7=BB=99
> > 300 =E4=B8=87
> > +          Linux =E7=94=A8=E6=88=B7=E4=B8=AD=E7=9A=84=E4=B8=80=E9=83=A8=
=E5=88=86=E3=80=82
> >  =20
> > -        - ing b=C3=BCro h doran [http://www.ibhdoran.com]!
> > -          =E5=9C=A8=E6=AC=A7=E6=B4=B2=EF=BC=8C=E6=83=B3=E7=BB=99=E4=B8=
=BB=E6=9D=BF=E4=B9=B0=E4=B8=80=E4=B8=AA PC =E8=83=8C=E6=9D=BF USB =E8=BF=9E=
=E6=8E=A5=E5=99=A8=E5=87=A0=E4=B9=8E=E6=98=AF=E4=B8=8D=E5=8F=AF=E8=83=BD=E7=
=9A=84
> > -          =EF=BC=88=E6=88=91=E8=87=AA=E5=B7=B1=E5=81=9A=E7=9A=84=E9=82=
=A3=E4=B8=AA=E7=9B=B8=E5=BD=93=E7=B3=9F=E7=B3=95
> > :)=EF=BC=89=E3=80=82=E7=8E=B0=E5=9C=A8=E6=88=91=E7=9F=A5=E9=81=93=E8=AF=
=A5=E5=8E=BB=E5=93=AA=E9=87=8C=E4=B9=B0=E6=BC=82=E4=BA=AE=E7=9A=84 USB
> > -          =E9=85=8D=E4=BB=B6=E4=BA=86=EF=BC=81
> > +        - =E7=89=B9=E5=88=AB=E6=84=9F=E8=B0=A2 ing b=C3=BCro h doran [=
http://www.ibhdoran.com]=E3=80=82
> > +          =E5=9C=A8=E6=AC=A7=E6=B4=B2=EF=BC=8C=E6=83=B3=E7=BB=99=E4=B8=
=BB=E6=9D=BF=E9=85=8D=E4=B8=80=E4=B8=AA PC =E8=83=8C=E6=9D=BF USB
> > =E8=BF=9E=E6=8E=A5=E5=99=A8=E5=87=A0=E4=B9=8E=E6=98=AF=E4=B8=8D=E5=8F=
=AF=E8=83=BD=E7=9A=84=EF=BC=88=E6=88=91=E8=87=AA=E5=B7=B1
> > +          =E5=81=9A=E7=9A=84=E9=82=A3=E4=B8=AA=E6=95=88=E6=9E=9C=E5=B9=
=B6=E4=B8=8D=E5=A5=BD=EF=BC=89=E3=80=82=E7=8E=B0=E5=9C=A8=E6=88=91=E7=9F=A5=
=E9=81=93=E8=AF=A5=E5=8E=BB=E5=93=AA=E9=87=8C=E8=B4=AD=E4=B9=B0=E5=90=88=E9=
=80=82=E7=9A=84 USB
> > =E9=85=8D=E4=BB=B6=E4=BA=86=E3=80=82=20
> >           - Genius Germany =E6=8D=90=E8=B5=A0=E4=BA=86=E4=B8=80=E5=8F=
=AA USB
> > =E9=BC=A0=E6=A0=87=EF=BC=8C=E7=94=A8=E4=BA=8E=E6=B5=8B=E8=AF=95=E9=BC=
=A0=E6=A0=87=E5=90=AF=E5=8A=A8=E5=8D=8F=E8=AE=AE=EF=BC=9B
> > -          =E4=BB=96=E4=BB=AC=E8=BF=98=E6=8D=90=E8=B5=A0=E4=BA=86 F-23 =
=E6=95=B0=E5=AD=97=E6=91=87=E6=9D=86=E5=92=8C NetMouse Pro=E3=80=82=E6=84=
=9F=E8=B0=A2=EF=BC=81
> > +          =E4=BB=96=E4=BB=AC=E8=BF=98=E6=8D=90=E8=B5=A0=E4=BA=86 F-23 =
=E6=95=B0=E5=AD=97=E6=91=87=E6=9D=86=E5=92=8C NetMouse Pro=EF=BC=8C=E5=9C=
=A8=E6=AD=A4=E8=87=B4=E8=B0=A2=E3=80=82
> >  =20
> > -        - AVM GmbH Berlin =E6=94=AF=E6=8C=81=E6=88=91=E4=BB=AC=E5=BC=
=80=E5=8F=91 Linux =E4=B8=8B=E7=9A=84 AVM ISDN
> > Controller B1 USB =E9=A9=B1=E5=8A=A8=E3=80=82
> > -          AVM =E6=98=AF=E9=A2=86=E5=85=88=E7=9A=84 ISDN =E6=8E=A7=E5=
=88=B6=E5=99=A8=E5=88=B6=E9=80=A0=E5=95=86=EF=BC=8C=E5=85=B6=E4=B8=BB=E5=8A=
=A8=E5=BC=8F=E8=AE=BE=E8=AE=A1=E5=AF=B9=E5=8C=85=E6=8B=AC Linux
> > =E5=9C=A8=E5=86=85=E7=9A=84
> > -          =E6=89=80=E6=9C=89=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E5=B9=
=B3=E5=8F=B0=E5=BC=80=E6=94=BE=E3=80=82
> > +        - AVM GmbH Berlin =E6=94=AF=E6=8C=81=E6=88=91=E4=BB=AC=E5=BC=
=80=E5=8F=91 Linux =E4=B8=8B=E7=9A=84 AVM ISDN
> > Controller B1 USB
> > +          =E9=A9=B1=E5=8A=A8=E3=80=82AVM =E6=98=AF=E9=A2=86=E5=85=88=
=E7=9A=84 ISDN
> > =E6=8E=A7=E5=88=B6=E5=99=A8=E5=88=B6=E9=80=A0=E5=95=86=EF=BC=8C=E5=85=
=B6=E5=BC=80=E6=94=BE=E5=BC=8F=E8=AE=BE=E8=AE=A1=E9=80=82=E7=94=A8=E4=BA=8E=
=E5=8C=85=E6=8B=AC
> > +          Linux =E5=9C=A8=E5=86=85=E7=9A=84=E6=89=80=E6=9C=89=E6=93=8D=
=E4=BD=9C=E7=B3=BB=E7=BB=9F=E5=B9=B3=E5=8F=B0=E3=80=82
> >  =20
> > -        - =E9=9D=9E=E5=B8=B8=E6=84=9F=E8=B0=A2 Y-E Data, Inc =E6=8D=90=
=E8=B5=A0=E7=9A=84 FlashBuster-U USB =E8=BD=AF=E9=A9=B1=EF=BC=8C
> > -          =E4=BD=BF=E6=88=91=E4=BB=AC=E8=83=BD=E5=A4=9F=E6=B5=8B=E8=AF=
=95=E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E4=BB=A3=E7=A0=81=E3=80=82
> > +        - =E9=9D=9E=E5=B8=B8=E6=84=9F=E8=B0=A2 Y-E Data, Inc =E6=8D=90=
=E8=B5=A0=E7=9A=84 FlashBuster-U USB
> > =E8=BD=AF=E9=A9=B1=EF=BC=8C=E4=BD=BF=E6=88=91=E4=BB=AC=E8=83=BD=E5=A4=
=9F=E6=B5=8B=E8=AF=95
> > +          =E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E4=BB=A3=E7=A0=81=E3=80=
=82
> >  =20
> >           - =E6=84=9F=E8=B0=A2 Logitech =E6=8D=90=E8=B5=A0=E4=BA=86=E4=
=B8=80=E5=8F=AA=E4=B8=89=E8=BD=B4 USB =E9=BC=A0=E6=A0=87=E3=80=82
> >  =20
> > -          Logitech =E8=B4=9F=E8=B4=A3=E8=AE=BE=E8=AE=A1=E3=80=81=E5=88=
=B6=E9=80=A0=E5=B9=B6=E9=94=80=E5=94=AE=E5=90=84=E7=A7=8D=E4=BA=BA=E6=9C=BA=
=E6=8E=A5=E5=8F=A3=E8=AE=BE=E5=A4=87=EF=BC=8C
> > -
> > =E5=9C=A8=E9=94=AE=E7=9B=98=E3=80=81=E9=BC=A0=E6=A0=87=E3=80=81=E8=BD=
=A8=E8=BF=B9=E7=90=83=E3=80=81=E6=91=84=E5=83=8F=E5=A4=B4=E3=80=81=E6=89=AC=
=E5=A3=B0=E5=99=A8=EF=BC=8C=E4=BB=A5=E5=8F=8A=E9=9D=A2=E5=90=91=E6=B8=B8=E6=
=88=8F=E5=92=8C=E4=B8=93=E4=B8=9A=E7=94=A8=E9=80=94=E7=9A=84
> > -          =E6=8E=A7=E5=88=B6=E8=AE=BE=E5=A4=87=E6=96=B9=E9=9D=A2=E6=8B=
=A5=E6=9C=89=E6=82=A0=E4=B9=85=E5=8E=86=E5=8F=B2=E5=92=8C=E4=B8=B0=E5=AF=8C=
=E7=BB=8F=E9=AA=8C=E3=80=82
> > +          Logitech
> > =E8=B4=9F=E8=B4=A3=E8=AE=BE=E8=AE=A1=E3=80=81=E5=88=B6=E9=80=A0=E5=B9=
=B6=E9=94=80=E5=94=AE=E5=90=84=E7=A7=8D=E4=BA=BA=E6=9C=BA=E6=8E=A5=E5=8F=A3=
=E8=AE=BE=E5=A4=87=EF=BC=8C=E5=9C=A8=E9=94=AE=E7=9B=98=E3=80=81=E9=BC=A0=E6=
=A0=87=E3=80=81=E8=BD=A8=E8=BF=B9=E7=90=83=E3=80=81
> > +
> > =E6=91=84=E5=83=8F=E5=A4=B4=E3=80=81=E6=89=AC=E5=A3=B0=E5=99=A8=EF=BC=
=8C=E4=BB=A5=E5=8F=8A=E9=9D=A2=E5=90=91=E6=B8=B8=E6=88=8F=E5=92=8C=E4=B8=93=
=E4=B8=9A=E7=94=A8=E9=80=94=E7=9A=84=E6=8E=A7=E5=88=B6=E8=AE=BE=E5=A4=87=E6=
=96=B9=E9=9D=A2=E6=8B=A5=E6=9C=89=E6=82=A0=E4=B9=85=E5=8E=86=E5=8F=B2=E5=92=
=8C
> > +          =E4=B8=B0=E5=AF=8C=E7=BB=8F=E9=AA=8C=E3=80=82
> >  =20
> > -          =E4=BD=9C=E4=B8=BA=E8=BF=99=E4=BA=9B=E8=AE=BE=E5=A4=87=E5=B9=
=BF=E4=B8=BA=E4=BA=BA=E7=9F=A5=E7=9A=84=E4=BE=9B=E5=BA=94=E5=95=86=E5=92=8C=
=E9=94=80=E5=94=AE=E5=95=86=EF=BC=8C=E4=BB=96=E4=BB=AC=E6=8D=90=E8=B5=A0=E4=
=BA=86 USB
> > =E9=BC=A0=E6=A0=87=E3=80=81
> > -          =E6=91=87=E6=9D=86=E5=92=8C=E6=89=AB=E6=8F=8F=E4=BB=AA=EF=BC=
=8C=E4=BB=A5=E8=A1=A8=E6=98=8E Linux =E7=9A=84=E9=87=8D=E8=A6=81=E6=80=A7=
=EF=BC=8C=E4=B9=9F=E8=AE=A9 Logitech =E7=9A=84=E5=AE=A2=E6=88=B7
> > -          =E8=83=BD=E5=9C=A8=E8=87=AA=E5=B7=B1=E5=96=9C=E6=AC=A2=E7=9A=
=84=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E4=B8=8A=E8=8E=B7=E5=BE=97=E6=94=AF=
=E6=8C=81=EF=BC=8C=E5=B9=B6=E8=AE=A9=E6=89=80=E6=9C=89 Linux
> > =E7=94=A8=E6=88=B7=E9=83=BD=E8=83=BD=E4=BD=BF=E7=94=A8
> > -          Logitech =E4=BB=A5=E5=8F=8A=E5=85=B6=E4=BB=96 USB =E7=A1=AC=
=E4=BB=B6=E3=80=82
> > +          =E4=BD=9C=E4=B8=BA=E8=BF=99=E4=BA=9B=E8=AE=BE=E5=A4=87=E5=B9=
=BF=E4=B8=BA=E4=BA=BA=E7=9F=A5=E7=9A=84=E4=BE=9B=E5=BA=94=E5=95=86=E5=92=8C=
=E9=94=80=E5=94=AE=E5=95=86=EF=BC=8C=E4=BB=96=E4=BB=AC=E6=8D=90=E8=B5=A0=E4=
=BA=86 USB
> > =E9=BC=A0=E6=A0=87=E3=80=81=E6=91=87=E6=9D=86=E5=92=8C
> > +          =E6=89=AB=E6=8F=8F=E4=BB=AA=EF=BC=8C=E4=BB=A5=E8=A1=A8=E6=98=
=8E Linux =E7=9A=84=E9=87=8D=E8=A6=81=E6=80=A7=EF=BC=8C=E4=B9=9F=E8=AE=A9 L=
ogitech
> > =E7=9A=84=E5=AE=A2=E6=88=B7=E8=83=BD=E5=9C=A8=E8=87=AA=E5=B7=B1=E5=81=
=8F=E7=88=B1=E7=9A=84
> > +          =E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E4=B8=8A=E8=8E=B7=E5=BE=
=97=E6=94=AF=E6=8C=81=EF=BC=8C=E5=B9=B6=E8=AE=A9=E6=89=80=E6=9C=89 Linux =
=E7=94=A8=E6=88=B7=E9=83=BD=E8=83=BD=E4=BD=BF=E7=94=A8 Logitech
> > =E5=8F=8A=E5=85=B6=E4=BB=96
> > +          USB =E7=A1=AC=E4=BB=B6=E3=80=82
> >  =20
> >             Logitech =E4=B9=9F=E6=98=AF 1999 =E5=B9=B4 2 =E6=9C=88 11 =
=E6=97=A5=E7=BB=B4=E4=B9=9F=E7=BA=B3 Linux
> > =E5=A4=A7=E4=BC=9A=E7=9A=84=E5=AE=98=E6=96=B9=E8=B5=9E=E5=8A=A9=E5=95=
=86=EF=BC=8C=E6=88=91=E4=BB=AC=E5=B0=86=E5=9C=A8=E4=BC=9A=E4=B8=8A=E5=B1=95=
=E7=A4=BA Linux USB =E5=B7=A5=E4=BD=9C=E7=9A=84=E6=9C=80=E6=96=B0=E8=BF=9B=
=E5=B1=95=E3=80=82
> >  =20
> > -        - =E6=84=9F=E8=B0=A2 CATC =E6=8F=90=E4=BE=9B USB Inspector=EF=
=BC=8C=E5=B8=AE=E5=8A=A9=E6=88=91=E4=BB=AC=E6=8F=AD=E5=BC=80 UHCI
> > =E5=86=85=E9=83=A8=E5=AE=9E=E7=8E=B0=E4=B8=AD
> > -          =E9=82=A3=E4=BA=9B=E4=B8=8D=E4=B8=BA=E4=BA=BA=E7=9F=A5=E7=9A=
=84=E8=A7=92=E8=90=BD=E3=80=82
> > +        - =E6=84=9F=E8=B0=A2 CATC =E6=8F=90=E4=BE=9B USB Inspector=EF=
=BC=8C=E5=B8=AE=E5=8A=A9=E6=88=91=E4=BB=AC=E7=9C=8B=E5=88=B0 UHCI
> > =E5=86=85=E9=83=A8=E5=AE=9E=E7=8E=B0=E4=B8=AD=E7=9A=84=E9=82=A3=E4=BA=9B
> > +          =E9=9A=90=E7=A7=98=E8=A7=92=E8=90=BD=E3=80=82
> >  =20
> >           - =E6=84=9F=E8=B0=A2 Entrega =E4=B8=BA=E5=BC=80=E5=8F=91=E5=
=B7=A5=E4=BD=9C=E6=8F=90=E4=BE=9B PCI =E8=BD=AC USB
> > =E5=8D=A1=E3=80=81=E9=9B=86=E7=BA=BF=E5=99=A8=E5=92=8C=E8=BD=AC=E6=8D=
=A2=E5=99=A8=E4=BA=A7=E5=93=81=E3=80=82=20
> > -        - =E6=84=9F=E8=B0=A2 ConnectTech =E6=8F=90=E4=BE=9B WhiteHEAT =
USB
> > =E8=BD=AC=E4=B8=B2=E5=8F=A3=E8=BD=AC=E6=8D=A2=E5=99=A8=E4=BB=A5=E5=8F=
=8A=E7=9B=B8=E5=85=B3=E6=96=87=E6=A1=A3=EF=BC=8C
> > -          =E8=AE=A9=E8=BF=99=E4=B8=AA=E9=A9=B1=E5=8A=A8=E5=BE=97=E4=BB=
=A5=E5=86=99=E6=88=90=E3=80=82
> > +        - =E6=84=9F=E8=B0=A2 ConnectTech =E6=8F=90=E4=BE=9B WhiteHEAT =
USB
> > =E8=BD=AC=E4=B8=B2=E5=8F=A3=E8=BD=AC=E6=8D=A2=E5=99=A8=E4=BB=A5=E5=8F=
=8A=E7=9B=B8=E5=85=B3=E6=96=87=E6=A1=A3=EF=BC=8C=E8=AE=A9
> > +          =E8=BF=99=E4=B8=AA=E9=A9=B1=E5=8A=A8=E5=BE=97=E4=BB=A5=E5=86=
=99=E6=88=90=E3=80=82
> >  =20
> > -        - =E6=84=9F=E8=B0=A2 ADMtek =E6=8F=90=E4=BE=9B Pegasus =E5=92=
=8C Pegasus II =E8=AF=84=E4=BC=B0=E6=9D=BF=E3=80=81=E8=A7=84=E6=A0=BC=E8=AF=
=B4=E6=98=8E=EF=BC=8C
> > -          =E4=BB=A5=E5=8F=8A=E9=A9=B1=E5=8A=A8=E5=BC=80=E5=8F=91=E8=BF=
=87=E7=A8=8B=E4=B8=AD=E7=9A=84=E5=AE=9D=E8=B4=B5=E5=BB=BA=E8=AE=AE=E3=80=82
> > +        - =E6=84=9F=E8=B0=A2 ADMtek =E6=8F=90=E4=BE=9B Pegasus =E5=92=
=8C Pegasus II
> > =E8=AF=84=E4=BC=B0=E6=9D=BF=E3=80=81=E8=A7=84=E6=A0=BC=E8=AF=B4=E6=98=
=8E=EF=BC=8C=E4=BB=A5=E5=8F=8A=E9=A9=B1=E5=8A=A8
> > +          =E5=BC=80=E5=8F=91=E8=BF=87=E7=A8=8B=E4=B8=AD=E7=9A=84=E5=AE=
=9D=E8=B4=B5=E5=BB=BA=E8=AE=AE=E3=80=82
> >  =20
> > -    =E5=8F=A6=E5=A4=96=E8=BF=98=E8=A6=81=E6=84=9F=E8=B0=A2=E4=BB=A5=E4=
=B8=8B=E4=B8=AA=E4=BA=BA=EF=BC=88=E5=98=BF=EF=BC=8C=E9=A1=BA=E5=BA=8F=E4=B8=
=8D=E5=88=86=E5=85=88=E5=90=8E :)=EF=BC=89
> > +    =E5=8F=A6=E5=A4=96=E8=BF=98=E8=A6=81=E6=84=9F=E8=B0=A2=E4=BB=A5=E4=
=B8=8B=E4=B8=AA=E4=BA=BA=EF=BC=88=E6=8E=92=E5=90=8D=E4=B8=8D=E5=88=86=E5=85=
=88=E5=90=8E=EF=BC=89=EF=BC=9A
> >  =20
> > -        - Oren Tirosh<orenti@hishome.net>,
> > -          =E4=BB=96=E9=9D=9E=E5=B8=B8=E8=80=90=E5=BF=83=E5=9C=B0=E5=90=
=AC=E6=88=91=E5=94=A0=E5=8F=A8=E5=90=84=E7=A7=8D USB =E7=96=91=E9=97=AE=EF=
=BC=8C=E8=BF=98=E7=BB=99=E4=BA=86=E5=BE=88=E5=A4=9A=E5=BE=88=E9=85=B7=E7=9A=
=84=E6=83=B3=E6=B3=95=E3=80=82
> > +        - Oren Tirosh<orenti@hishome.net>
> > +          =E4=BB=96=E9=9D=9E=E5=B8=B8=E8=80=90=E5=BF=83=E5=9C=B0=E8=A7=
=A3=E7=AD=94=E6=88=91=E5=8F=8D=E5=A4=8D=E6=8F=90=E5=87=BA=E7=9A=84=E5=90=84=
=E7=A7=8D USB
> > =E9=97=AE=E9=A2=98=EF=BC=8C=E5=B9=B6=E6=8F=90=E4=BE=9B=E4=BA=86=E8=AE=
=B8=E5=A4=9A=E6=9C=89=E4=BB=B7=E5=80=BC=E7=9A=84
> > +          =E6=83=B3=E6=B3=95=E3=80=82
> >  =20
> > -        - Jochen Karrer<karrer@wpfd25.physik.uni-wuerzburg.de>,
> > -          =E6=8C=87=E5=87=BA=E4=BA=86=E8=87=B4=E5=91=BD bug=EF=BC=8C=
=E5=B9=B6=E7=BB=99=E5=87=BA=E4=BA=86=E5=AE=9D=E8=B4=B5=E5=BB=BA=E8=AE=AE=E3=
=80=82
> > +        - Jochen Karrer<karrer@wpfd25.physik.uni-wuerzburg.de>
> > +          =E6=8C=87=E5=87=BA=E4=BA=86=E4=B8=A5=E9=87=8D=E9=97=AE=E9=A2=
=98=EF=BC=8C=E5=B9=B6=E7=BB=99=E5=87=BA=E4=BA=86=E5=AE=9D=E8=B4=B5=E5=BB=BA=
=E8=AE=AE=E3=80=82
> >  =20
> > -        - Edmund
> > Humemberger<ed@atnet.at>=EF=BC=8C=E4=BB=96=E5=9C=A8=E5=85=AC=E5=85=B1=
=E5=85=B3=E7=B3=BB=E4=B8=8E=E9=A1=B9=E7=9B=AE=E7=AE=A1=E7=90=86=E6=96=B9=E9=
=9D=A2
> > -          =E4=B8=BA Linux-USB =E9=A1=B9=E7=9B=AE=E4=BB=98=E5=87=BA=E4=
=BA=86=E5=B7=A8=E5=A4=A7=E7=9A=84=E5=8A=AA=E5=8A=9B=E3=80=82
> > +        - Edmund
> > Humemberger<ed@atnet.at>=EF=BC=8C=E4=BB=96=E5=9C=A8=E5=85=AC=E5=85=B1=
=E5=85=B3=E7=B3=BB=E4=B8=8E=E9=A1=B9=E7=9B=AE=E7=AE=A1=E7=90=86=E6=96=B9=E9=
=9D=A2=E4=B8=BA
> > +          Linux-USB =E9=A1=B9=E7=9B=AE=E4=BB=98=E5=87=BA=E4=BA=86=E5=
=B7=A8=E5=A4=A7=E7=9A=84=E5=8A=AA=E5=8A=9B=E3=80=82
> >  =20
> > -        - Alberto Menegazzi<flash@flash.iol.it> =E6=AD=A3=E5=9C=A8=E7=
=9D=80=E6=89=8B=E7=BC=96=E5=86=99 UUSBD
> > =E6=96=87=E6=A1=A3=EF=BC=8C=E5=8A=A0=E6=B2=B9=EF=BC=81
> > +        - Alberto Menegazzi<flash@flash.iol.it> =E6=AD=A3=E5=9C=A8=E7=
=9D=80=E6=89=8B=E7=BC=96=E5=86=99 UUSBD
> > =E6=96=87=E6=A1=A3=E3=80=82=20
> > -        - Ric Klaren<ia_ric@cs.utwente.nl> =E7=BC=96=E5=86=99=E4=BA=86=
=E5=BE=88=E5=A5=BD=E7=9A=84=E5=85=A5=E9=97=A8=E6=96=87=E6=A1=A3=EF=BC=8C
> > -          =E4=B8=8E Alberto =E7=9A=84=E4=BD=9C=E5=93=81=E5=BD=A2=E6=88=
=90=E8=89=AF=E6=80=A7=E7=AB=9E=E4=BA=89=EF=BC=9A=EF=BC=89=E3=80=82
> > +        - Ric Klaren<ia_ric@cs.utwente.nl> =E7=BC=96=E5=86=99=E4=BA=86=
=E5=BE=88=E5=A5=BD=E7=9A=84=E5=85=A5=E9=97=A8=E6=96=87=E6=A1=A3=EF=BC=8C=E4=
=B8=8E
> > +          Alberto =E7=9A=84=E4=BD=9C=E5=93=81=E5=BD=A2=E6=88=90=E4=BA=
=86=E8=89=AF=E6=80=A7=E4=BA=92=E8=A1=A5=E3=80=82
> >  =20
> > -        - Christian
> > Groessler<cpg@aladdin.de>=EF=BC=8C=E6=84=9F=E8=B0=A2=E4=BB=96=E5=9C=A8=
=E9=82=A3=E4=BA=9B=E6=A3=98=E6=89=8B=E7=BB=86=E8=8A=82=E4=B8=8A=E7=9A=84=E5=
=B8=AE=E5=8A=A9=E3=80=82
> > +        - Christian
> > Groessler<cpg@aladdin.de>=EF=BC=8C=E6=84=9F=E8=B0=A2=E4=BB=96=E5=9C=A8=
=E8=AF=B8=E5=A4=9A=E5=A4=8D=E6=9D=82=E7=BB=86=E8=8A=82=E4=B8=8A=E7=9A=84=E5=
=B8=AE=E5=8A=A9=E3=80=82=20
> > -        - Paul MacKerras =E6=94=B9=E8=BF=9B=E4=BA=86 OHCI =E5=AE=9E=E7=
=8E=B0=EF=BC=8C=E6=8E=A8=E5=8A=A8=E4=BA=86=E5=AF=B9 iMac =E7=9A=84=E6=94=AF=
=E6=8C=81=EF=BC=8C
> > -          =E5=B9=B6=E6=8F=90=E4=BE=9B=E4=BA=86=E5=A4=A7=E9=87=8F=E7=9A=
=84=E6=94=B9=E8=BF=9B=E6=84=8F=E8=A7=81=E3=80=82
> > +        - Paul MacKerras =E6=94=B9=E8=BF=9B=E4=BA=86 OHCI =E5=AE=9E=E7=
=8E=B0=EF=BC=8C=E6=8E=A8=E5=8A=A8=E4=BA=86=E5=AF=B9 iMac
> > =E7=9A=84=E6=94=AF=E6=8C=81=EF=BC=8C=E5=B9=B6=E6=8F=90=E4=BE=9B=E4=BA=86
> > +          =E5=A4=A7=E9=87=8F=E7=9A=84=E6=94=B9=E8=BF=9B=E6=84=8F=E8=A7=
=81=E3=80=82
> >  =20
> > -        - Fernando Herrera<fherrera@eurielec.etsit.upm.es>
> > -          =E8=B4=9F=E8=B4=A3=E6=92=B0=E5=86=99=E3=80=81=E7=BB=B4=E6=8A=
=A4=E5=B9=B6=E4=B8=8D=E6=96=AD=E8=A1=A5=E5=85=85=E9=82=A3=E4=BB=BD=E6=9C=9F=
=E5=BE=85=E5=B7=B2=E4=B9=85=E3=80=81=E7=8B=AC=E4=B8=80=E6=97=A0=E4=BA=8C=E5=
=8F=88=E7=B2=BE=E5=BD=A9=E7=9A=84
> > -          UUSBD FAQ=EF=BC=81=E5=A4=AA=E6=A3=92=E4=BA=86=EF=BC=81
> > +        - Fernando Herrera<fherrera@eurielec.etsit.upm.es>
> > =E8=B4=9F=E8=B4=A3=E6=92=B0=E5=86=99=E3=80=81=E7=BB=B4=E6=8A=A4=E5=B9=B6
> > +          =E6=8C=81=E7=BB=AD=E8=A1=A5=E5=85=85=E9=82=A3=E4=BB=BD=E6=9C=
=9F=E5=BE=85=E5=B7=B2=E4=B9=85=E3=80=81=E5=86=85=E5=AE=B9=E7=BF=94=E5=AE=9E=
=E7=9A=84 UUSBD FAQ=E3=80=82
> >  =20
> > -        - Rasca Gmelch<thron@gmx.de> =E9=87=8D=E6=96=B0=E5=90=AF=E7=94=
=A8=E4=BA=86 raw =E9=A9=B1=E5=8A=A8=EF=BC=8C
> > -          =E6=8C=87=E5=87=BA=E4=BA=86=E4=B8=80=E4=BA=9B=E9=94=99=E8=AF=
=AF=EF=BC=8C=E5=B9=B6=E5=90=AF=E5=8A=A8=E4=BA=86 uusbd-utils =E8=BD=AF=E4=
=BB=B6=E5=8C=85=E3=80=82
> > +        - Rasca Gmelch<thron@gmx.de> =E9=87=8D=E6=96=B0=E5=90=AF=E7=94=
=A8=E4=BA=86 raw
> > =E9=A9=B1=E5=8A=A8=EF=BC=8C=E6=8C=87=E5=87=BA=E4=BA=86=E4=B8=80=E4=BA=
=9B=E9=94=99=E8=AF=AF=EF=BC=8C=E5=B9=B6
> > +          =E5=90=AF=E5=8A=A8=E4=BA=86 uusbd-utils =E8=BD=AF=E4=BB=B6=
=E5=8C=85=E3=80=82
> >  =20
> > -        - Peter Dettori<dettori@ozy.dec.com>=EF=BC=8C=E5=83=8F=E7=96=
=AF=E4=BA=86=E4=B8=80=E6=A0=B7=E6=8C=96=E6=8E=98 bug=EF=BC=8C
> > -          =E8=BF=98=E6=8F=90=E5=87=BA=E4=BA=86=E5=BE=88=E5=A4=9A=E5=BE=
=88=E9=85=B7=E7=9A=84=E5=BB=BA=E8=AE=AE=EF=BC=8C=E5=A4=AA=E6=A3=92=E4=BA=86=
=EF=BC=81
> > +        - Peter
> > Dettori<dettori@ozy.dec.com>=EF=BC=8C=E6=8C=81=E7=BB=AD=E5=8F=91=E7=8E=
=B0=E9=97=AE=E9=A2=98=EF=BC=8C=E5=B9=B6=E6=8F=90=E5=87=BA=E4=BA=86=E8=AE=B8=
=E5=A4=9A
> > +          =E6=9C=89=E4=BB=B7=E5=80=BC=E7=9A=84=E5=BB=BA=E8=AE=AE=E3=80=
=82
> >  =20
> > -        - =E8=87=AA=E7=94=B1=E8=BD=AF=E4=BB=B6=E4=B8=8E Linux =E7=A4=
=BE=E5=8C=BA=E7=9A=84=E6=89=80=E6=9C=89=E6=88=90=E5=91=98=EF=BC=8C=E5=8C=85=
=E6=8B=AC FSF=E3=80=81GNU =E9=A1=B9=E7=9B=AE=E3=80=81
> > -          MIT X =E8=81=94=E7=9B=9F=E3=80=81TeX =E7=A4=BE=E5=8C=BA=E7=
=AD=89=E7=AD=89=EF=BC=8C=E8=B0=A2=E8=B0=A2=E4=BD=A0=E4=BB=AC=EF=BC=81
> > +        - =E8=87=AA=E7=94=B1=E8=BD=AF=E4=BB=B6=E4=B8=8E Linux =E7=A4=
=BE=E5=8C=BA=E7=9A=84=E6=89=80=E6=9C=89=E6=88=90=E5=91=98=EF=BC=8C=E5=8C=85=
=E6=8B=AC FSF=E3=80=81GNU =E9=A1=B9=E7=9B=AE=E3=80=81MIT
> > X =E8=81=94=E7=9B=9F=E3=80=81
> > +          TeX =E7=A4=BE=E5=8C=BA=E7=AD=89=EF=BC=8C=E5=9C=A8=E6=AD=A4=
=E4=B8=80=E5=B9=B6=E8=87=B4=E8=B0=A2=E3=80=82
> >  =20
> > -        - =E7=89=B9=E5=88=AB=E6=84=9F=E8=B0=A2 Richard Stallman =E5=88=
=9B=E9=80=A0=E4=BA=86 Emacs=EF=BC=81
> > +        - =E7=89=B9=E5=88=AB=E6=84=9F=E8=B0=A2 Richard Stallman =E5=88=
=9B=E9=80=A0=E4=BA=86 Emacs=E3=80=82
> >  =20
> > -        - =E6=84=9F=E8=B0=A2 linux-usb
> > =E9=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8=E7=9A=84=E6=89=80=E6=9C=89=E6=88=
=90=E5=91=98=EF=BC=8C=E8=AF=BB=E4=BA=86=E9=82=A3=E4=B9=88=E5=A4=9A=E9=82=AE=
=E4=BB=B6=E2=80=94=E2=80=94=E4=B8=8D=E5=BC=80=E7=8E=A9=E7=AC=91=E4=BA=86=EF=
=BC=8C
> > -          =E6=84=9F=E8=B0=A2=E4=BD=A0=E4=BB=AC=E6=8F=90=E5=87=BA=E7=9A=
=84=E6=89=80=E6=9C=89=E5=BB=BA=E8=AE=AE=EF=BC=81
> > +        - =E6=84=9F=E8=B0=A2 linux-usb
> > =E9=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8=E7=9A=84=E6=89=80=E6=9C=89=E6=88=
=90=E5=91=98=E9=98=85=E8=AF=BB=E4=BA=86=E5=A4=A7=E9=87=8F=E9=82=AE=E4=BB=B6=
=EF=BC=8C=E5=B9=B6=E6=8F=90=E5=87=BA=E4=BA=86=E8=AF=B8=E5=A4=9A
> > +          =E5=BB=BA=E8=AE=AE=E3=80=82
> >  =20
> >           - =E6=84=9F=E8=B0=A2 USB Implementers Forum =E6=88=90=E5=91=
=98=E4=BB=AC=E7=9A=84=E5=B8=AE=E5=8A=A9=E4=B8=8E=E6=94=AF=E6=8C=81=E3=80=82
> >  =20
> > -        - Nathan Myers<ncm@cantrip.org>=EF=BC=8C=E6=84=9F=E8=B0=A2=E4=
=BB=96=E7=9A=84=E5=BB=BA=E8=AE=AE=EF=BC=81
> > -          =EF=BC=88=E5=B8=8C=E6=9C=9B=E4=BD=A0=E5=96=9C=E6=AC=A2 Cibel=
es =E7=9A=84=E6=B4=BE=E5=AF=B9=E3=80=82=EF=BC=89
> > +        - Nathan
> > Myers<ncm@cantrip.org>=EF=BC=8C=E6=84=9F=E8=B0=A2=E4=BB=96=E7=9A=84=E5=
=BB=BA=E8=AE=AE=E3=80=82=EF=BC=88=E4=B9=9F=E5=B8=8C=E6=9C=9B=E4=BD=A0=E5=96=
=9C=E6=AC=A2
> > +          Cibeles =E7=9A=84=E6=B4=BE=E5=AF=B9=E3=80=82=EF=BC=89
> >  =20
> > -        - =E6=84=9F=E8=B0=A2 Linus Torvalds =E5=88=9B=E5=BB=BA=E3=80=
=81=E5=BC=80=E5=8F=91=E5=B9=B6=E7=AE=A1=E7=90=86 Linux=E3=80=82
> > +        - =E6=84=9F=E8=B0=A2 Linus Torvalds =E5=88=9B=E7=AB=8B=E3=80=
=81=E5=BC=80=E5=8F=91=E5=B9=B6=E7=BB=B4=E6=8A=A4 Linux=E3=80=82
> >  =20
> >           - Mike Smith=E3=80=81Craig Keithley=E3=80=81Thierry Giron =E5=
=92=8C Janet
> > Schank
> > -          =E6=84=9F=E8=B0=A2=E4=BB=96=E4=BB=AC=E8=AE=A9=E6=88=91=E8=AE=
=A4=E8=AF=86=E5=88=B0=E6=A0=87=E5=87=86 USB =E9=9B=86=E7=BA=BF=E5=99=A8=E5=
=85=B6=E5=AE=9E=E4=B9=9F=E6=B2=A1=E9=82=A3=E4=B9=88=E2=80=9C=E6=A0=87=E5=87=
=86=E2=80=9D=EF=BC=8C
> > -          =E8=BF=99=E6=9C=89=E5=8A=A9=E4=BA=8E=E6=88=91=E4=BB=AC=E5=9C=
=A8=E6=A0=87=E5=87=86=E9=9B=86=E7=BA=BF=E5=99=A8=E9=A9=B1=E5=8A=A8=E4=B8=AD=
=E5=8A=A0=E5=85=A5=E5=8E=82=E5=95=86=E7=89=B9=E5=AE=9A=E7=9A=84=E7=89=B9=E6=
=AE=8A=E5=A4=84=E7=90=86=E3=80=82
> > +          =E6=84=9F=E8=B0=A2=E4=BB=96=E4=BB=AC=E8=AE=A9=E6=88=91=E8=AE=
=A4=E8=AF=86=E5=88=B0=EF=BC=8C=E6=A0=87=E5=87=86 USB
> > =E9=9B=86=E7=BA=BF=E5=99=A8=E5=85=B6=E5=AE=9E=E4=B8=80=E7=82=B9=E4=B9=
=9F=E4=B8=8D=E2=80=9C=E6=A0=87=E5=87=86=E2=80=9D=EF=BC=9B=E4=B9=9F=E6=AD=A3=
=E5=9B=A0
> > +          =E5=A6=82=E6=AD=A4=EF=BC=8C=E6=88=91=E4=BB=AC=E6=89=8D=E8=83=
=BD=E5=9C=A8=E6=A0=87=E5=87=86=E9=9B=86=E7=BA=BF=E5=99=A8=E9=A9=B1=E5=8A=A8=
=E4=B8=AD=E5=8A=A0=E5=85=A5=E5=8E=82=E5=95=86=E7=89=B9=E5=AE=9A=E7=9A=84=E5=
=A4=84=E7=90=86=E3=80=82
> > diff --git a/Documentation/translations/zh_CN/usb/acm.rst
> > b/Documentation/translations/zh_CN/usb/acm.rst index
> > 51d6eb8f5660..b2e35787af45 100644 ---
> > a/Documentation/translations/zh_CN/usb/acm.rst +++
> > b/Documentation/translations/zh_CN/usb/acm.rst @@ -20,33 +20,26 @@
> > Linux ACM =E9=A9=B1=E5=8A=A8 v0.16=20
> >   0. =E5=85=8D=E8=B4=A3=E5=A3=B0=E6=98=8E
> >   ~~~~~~~~~~~
> > -=E6=9C=AC=E7=A8=8B=E5=BA=8F=E6=98=AF=E8=87=AA=E7=94=B1=E8=BD=AF=E4=BB=
=B6=EF=BC=9B=E4=BD=A0=E5=8F=AF=E4=BB=A5=E5=9C=A8=E8=87=AA=E7=94=B1=E8=BD=AF=
=E4=BB=B6=E5=9F=BA=E9=87=91=E4=BC=9A=E5=8F=91=E5=B8=83=E7=9A=84
> > -GNU =E9=80=9A=E7=94=A8=E5=85=AC=E5=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81=E7=
=AC=AC 2 =E7=89=88=EF=BC=8C=E6=88=96=E8=80=85=EF=BC=88=E6=8C=89=E4=BD=A0=E7=
=9A=84=E9=80=89=E6=8B=A9=EF=BC=89
> > -=E4=BB=BB=E4=BD=95=E5=90=8E=E7=BB=AD=E7=89=88=E6=9C=AC=E7=9A=84=E6=9D=
=A1=E6=AC=BE=E4=B8=8B=E9=87=8D=E6=96=B0=E5=8F=91=E5=B8=83=E5=92=8C/=E6=88=
=96=E4=BF=AE=E6=94=B9=E5=AE=83=E3=80=82
> > +=E6=9C=AC=E7=A8=8B=E5=BA=8F=E6=98=AF=E8=87=AA=E7=94=B1=E8=BD=AF=E4=BB=
=B6=EF=BC=9B=E4=BD=A0=E5=8F=AF=E4=BB=A5=E5=9C=A8=E8=87=AA=E7=94=B1=E8=BD=AF=
=E4=BB=B6=E5=9F=BA=E9=87=91=E4=BC=9A=E5=8F=91=E5=B8=83=E7=9A=84 GNU
> > =E9=80=9A=E7=94=A8=E5=85=AC=E5=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81=E7=AC=
=AC 2 =E7=89=88=EF=BC=8C
> > +=E6=88=96=E8=80=85=EF=BC=88=E6=8C=89=E4=BD=A0=E7=9A=84=E9=80=89=E6=8B=
=A9=EF=BC=89=E4=BB=BB=E4=BD=95=E5=90=8E=E7=BB=AD=E7=89=88=E6=9C=AC=E7=9A=84=
=E6=9D=A1=E6=AC=BE=E4=B8=8B=E9=87=8D=E6=96=B0=E5=8F=91=E5=B8=83=E5=92=8C/=
=E6=88=96=E4=BF=AE=E6=94=B9=E5=AE=83=E3=80=82=20
> > -=E5=8F=91=E5=B8=83=E6=9C=AC=E7=A8=8B=E5=BA=8F=E6=98=AF=E5=B8=8C=E6=9C=
=9B=E5=AE=83=E8=83=BD=E5=8F=91=E6=8C=A5=E4=BD=9C=E7=94=A8=EF=BC=8C=E4=BD=86=
=E5=AE=83=E4=B8=8D=E9=99=84=E5=B8=A6=E4=BB=BB=E4=BD=95=E6=8B=85=E4=BF=9D=EF=
=BC=9B
> > -=E7=94=9A=E8=87=B3=E4=B8=8D=E5=8C=85=E6=8B=AC=E5=AF=B9=E9=80=82=E9=94=
=80=E6=80=A7=E6=88=96=E7=89=B9=E5=AE=9A=E7=94=A8=E9=80=94=E9=80=82=E7=94=A8=
=E6=80=A7=E7=9A=84=E9=BB=98=E7=A4=BA=E6=8B=85=E4=BF=9D=E3=80=82
> > -=E8=AF=A6=E6=83=85=E8=A7=81 GNU =E9=80=9A=E7=94=A8=E5=85=AC=E5=85=B1=
=E8=AE=B8=E5=8F=AF=E8=AF=81=E3=80=82
> > +=E5=8F=91=E5=B8=83=E6=9C=AC=E7=A8=8B=E5=BA=8F=E6=98=AF=E5=B8=8C=E6=9C=
=9B=E5=AE=83=E8=83=BD=E5=8F=91=E6=8C=A5=E4=BD=9C=E7=94=A8=EF=BC=8C=E4=BD=86=
=E5=AE=83=E4=B8=8D=E9=99=84=E5=B8=A6=E4=BB=BB=E4=BD=95=E6=8B=85=E4=BF=9D=EF=
=BC=9B=E7=94=9A=E8=87=B3=E4=B8=8D=E5=8C=85=E6=8B=AC=E5=AF=B9=E9=80=82=E9=94=
=80=E6=80=A7=E6=88=96
> > +=E7=89=B9=E5=AE=9A=E7=94=A8=E9=80=94=E9=80=82=E7=94=A8=E6=80=A7=E7=9A=
=84=E9=BB=98=E7=A4=BA=E6=8B=85=E4=BF=9D=E3=80=82=E8=AF=A6=E6=83=85=E8=A7=81=
 GNU =E9=80=9A=E7=94=A8=E5=85=AC=E5=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81=E3=80=
=82
> >  =20
> > -=E4=BD=A0=E5=BA=94=E8=AF=A5=E5=B7=B2=E7=BB=8F=E9=9A=8F=E6=9C=AC=E7=A8=
=8B=E5=BA=8F=E6=94=B6=E5=88=B0=E4=BA=86 GNU =E9=80=9A=E7=94=A8=E5=85=AC=E5=
=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81=E7=9A=84=E5=89=AF=E6=9C=AC=EF=BC=9B
> > -=E5=A6=82=E6=9E=9C=E6=B2=A1=E6=9C=89=EF=BC=8C=E8=AF=B7=E8=87=B4=E4=BF=
=A1=EF=BC=9AFree Software Foundation, Inc., 59
> > -Temple Place, Suite 330, Boston, MA 02111-1307 USA=E3=80=82
> > +=E4=BD=A0=E5=BA=94=E8=AF=A5=E5=B7=B2=E7=BB=8F=E9=9A=8F=E6=9C=AC=E7=A8=
=8B=E5=BA=8F=E6=94=B6=E5=88=B0=E4=BA=86 GNU =E9=80=9A=E7=94=A8=E5=85=AC=E5=
=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81=E7=9A=84=E5=89=AF=E6=9C=AC=EF=BC=9B=E5=A6=
=82=E6=9E=9C=E6=B2=A1=E6=9C=89=EF=BC=8C=E8=AF=B7=E5=8F=82=E8=A7=81
> > +COPYING =E6=96=87=E4=BB=B6=E3=80=82
> >  =20
> > -=E5=A6=82=E9=9C=80=E8=81=94=E7=B3=BB=E4=BD=9C=E8=80=85=EF=BC=8C=E5=8F=
=AF=E5=8F=91=E9=80=81=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E8=87=B3vojtech@s=
use.cz=EF=BC=8C
> > -=E6=88=96=E9=82=AE=E5=AF=84=E8=87=B3=EF=BC=9A
> > -Vojtech Pavlik, Ucitelska 1576, Prague 8,
> > -182 00, Czech Republic=E3=80=82
> > +=E5=A6=82=E9=9C=80=E8=81=94=E7=B3=BB=E4=BD=9C=E8=80=85=EF=BC=8C=E5=8F=
=AF=E5=8F=91=E9=80=81=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E8=87=B3vojtech@s=
use.cz=EF=BC=8C=E6=88=96=E9=82=AE=E5=AF=84=E8=87=B3=EF=BC=9A
> > +Vojtech Pavlik, Ucitelska 1576, Prague 8, 182 00, Czech Republic=E3=80=
=82
> >  =20
> > -=E4=B8=BA=E6=96=B9=E4=BE=BF=E8=B5=B7=E8=A7=81=EF=BC=8C=E8=BD=AF=E4=BB=
=B6=E5=8C=85=E4=B8=AD=E5=B7=B2=E9=99=84=E5=B8=A6 GNU =E9=80=9A=E7=94=A8=E5=
=85=AC=E5=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81
> > -=E7=AC=AC 2 =E7=89=88=EF=BC=9A=E8=A7=81 COPYING =E6=96=87=E4=BB=B6=E3=
=80=82
> > +=E4=B8=BA=E6=96=B9=E4=BE=BF=E8=B5=B7=E8=A7=81=EF=BC=8C=E8=BD=AF=E4=BB=
=B6=E5=8C=85=E4=B8=AD=E5=B7=B2=E9=99=84=E5=B8=A6 GNU =E9=80=9A=E7=94=A8=E5=
=85=AC=E5=85=B1=E8=AE=B8=E5=8F=AF=E8=AF=81=E7=AC=AC 2 =E7=89=88=EF=BC=9A=E8=
=A7=81 COPYING
> > =E6=96=87=E4=BB=B6=E3=80=82=20
> >   1. =E4=BD=BF=E7=94=A8=E6=96=B9=E6=B3=95
> >   ~~~~~~~~~~~
> > -``drivers/usb/class/cdc-acm.c`` =E9=A9=B1=E5=8A=A8=E5=8F=AF=E7=94=A8=
=E4=BA=8E=E7=AC=A6=E5=90=88 USB
> > -=E9=80=9A=E4=BF=A1=E8=AE=BE=E5=A4=87=E7=B1=BB=E6=8A=BD=E8=B1=A1=E6=8E=
=A7=E5=88=B6=E6=A8=A1=E5=9E=8B=EF=BC=88USB CDC ACM=EF=BC=89=E8=A7=84=E8=8C=
=83=E7=9A=84
> > -USB =E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=E5=92=8C USB ISDN =
=E7=BB=88=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E3=80=82
> > +``drivers/usb/class/cdc-acm.c`` =E9=A9=B1=E5=8A=A8=E9=80=82=E7=94=A8=
=E4=BA=8E=E7=AC=A6=E5=90=88 USB
> > =E9=80=9A=E4=BF=A1=E8=AE=BE=E5=A4=87=E7=B1=BB=E6=8A=BD=E8=B1=A1=E6=8E=
=A7=E5=88=B6=E6=A8=A1=E5=9E=8B +=EF=BC=88USB CDC ACM=EF=BC=89=E8=A7=84=E8=
=8C=83=E7=9A=84 USB =E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=E5=92=8C =
USB
> > ISDN =E7=BB=88=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E3=80=82=20
> > -=E8=AE=B8=E5=A4=9A=E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=E6=94=
=AF=E6=8C=81=E6=AD=A4=E9=A9=B1=E5=8A=A8=EF=BC=8C=E4=BB=A5=E4=B8=8B=E6=98=AF=
=E6=88=91=E6=89=80=E7=9F=A5=E9=81=93=E7=9A=84=E4=B8=80=E4=BA=9B=E5=9E=8B=E5=
=8F=B7=EF=BC=9A
> > +=E5=B7=B2=E7=9F=A5=E6=94=AF=E6=8C=81=E8=AF=A5=E9=A9=B1=E5=8A=A8=E7=9A=
=84=E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=E5=8C=85=E6=8B=AC=EF=BC=9A
> >  =20
> >   	- 3Com OfficeConnect 56k
> >   	- 3Com Voice FaxModem Pro
> > @@ -56,17 +49,16 @@ USB =E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=
=E5=92=8C USB ISDN =E7=BB=88=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E3=80=82
> >   	- Compaq 56k FaxModem
> >   	- ELSA Microlink 56k
> >  =20
> > -=E6=88=91=E7=9F=A5=E9=81=93=E6=9C=89=E4=B8=80=E6=AC=BE ISDN =E7=BB=88=
=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E5=8F=AF=E4=BB=A5=E4=B8=8E ACM =E9=A9=
=B1=E5=8A=A8=E4=B8=80=E8=B5=B7=E4=BD=BF=E7=94=A8=EF=BC=9A
> > +=E5=B7=B2=E7=9F=A5=E6=9C=89=E4=B8=80=E6=AC=BE ISDN =E7=BB=88=E7=AB=AF=
=E9=80=82=E9=85=8D=E5=99=A8=E5=8F=AF=E4=BB=A5=E9=85=8D=E5=90=88 ACM =E9=A9=
=B1=E5=8A=A8=E4=BD=BF=E7=94=A8=EF=BC=9A
> >  =20
> >   	- 3Com USR ISDN Pro TA
> >  =20
> > -=E4=B8=80=E4=BA=9B=E6=89=8B=E6=9C=BA=E4=B9=9F=E5=8F=AF=E4=BB=A5=E9=80=
=9A=E8=BF=87 USB =E8=BF=9E=E6=8E=A5=E3=80=82
> > -=E6=88=91=E7=9F=A5=E9=81=93=E4=BB=A5=E4=B8=8B=E6=9C=BA=E5=9E=8B=E5=8F=
=AF=E4=BB=A5=E6=AD=A3=E5=B8=B8=E5=B7=A5=E4=BD=9C=EF=BC=9A
> > +=E4=B8=80=E4=BA=9B=E6=89=8B=E6=9C=BA=E4=B9=9F=E5=8F=AF=E4=BB=A5=E9=80=
=9A=E8=BF=87 USB =E8=BF=9E=E6=8E=A5=EF=BC=8C=E5=B7=B2=E7=9F=A5=E5=8F=AF=E7=
=94=A8=E7=9A=84=E6=9C=BA=E5=9E=8B=E6=9C=89=EF=BC=9A
> >  =20
> >   	- SonyEricsson K800i
> >  =20
> > -=E9=81=97=E6=86=BE=E7=9A=84=E6=98=AF=EF=BC=8C=E8=AE=B8=E5=A4=9A=E8=B0=
=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=E5=92=8C=E5=A4=A7=E5=A4=9A=E6=95=B0=
 ISDN TA
> > -=E9=83=BD=E4=BD=BF=E7=94=A8=E4=B8=93=E6=9C=89=E6=8E=A5=E5=8F=A3=EF=BC=
=8C=E5=9B=A0=E6=AD=A4=E6=97=A0=E6=B3=95=E4=B8=8E=E6=AD=A4=E9=A9=B1=E5=8A=A8=
=E9=85=8D=E5=90=88=E5=B7=A5=E4=BD=9C=E3=80=82
> > +=E9=81=97=E6=86=BE=E7=9A=84=E6=98=AF=EF=BC=8C=E5=BE=88=E5=A4=9A=E8=B0=
=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=E5=92=8C=E5=A4=A7=E5=A4=9A=E6=95=B0=
 ISDN TA
> > =E9=83=BD=E4=BD=BF=E7=94=A8=E4=B8=93=E6=9C=89=E6=8E=A5=E5=8F=A3=EF=BC=
=8C=E5=9B=A0=E6=AD=A4=E6=97=A0=E6=B3=95=E9=85=8D=E5=90=88=E8=AF=A5 +=E9=A9=
=B1=E5=8A=A8=E5=B7=A5=E4=BD=9C=E3=80=82
> >   =E8=B4=AD=E4=B9=B0=E5=89=8D=E8=AF=B7=E5=85=88=E7=A1=AE=E8=AE=A4=E8=AE=
=BE=E5=A4=87=E6=98=AF=E5=90=A6=E7=AC=A6=E5=90=88 ACM =E8=A7=84=E8=8C=83=E3=
=80=82
> >  =20
> >   =E8=A6=81=E4=BD=BF=E7=94=A8=E8=BF=99=E4=BA=9B=E8=B0=83=E5=88=B6=E8=A7=
=A3=E8=B0=83=E5=99=A8=EF=BC=8C=E9=9C=80=E8=A6=81=E5=8A=A0=E8=BD=BD=E4=BB=A5=
=E4=B8=8B=E6=A8=A1=E5=9D=97::
> > @@ -75,15 +67,13 @@ USB =E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=
=E5=92=8C USB ISDN =E7=BB=88=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E3=80=82
> >   	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
> >   	cdc-acm.ko
> >  =20
> > -=E4=B9=8B=E5=90=8E=E5=B0=B1=E5=BA=94=E8=AF=A5=E5=8F=AF=E4=BB=A5=E8=AE=
=BF=E9=97=AE=E8=BF=99=E4=BA=9B=E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=
=E4=BA=86=E3=80=82
> > -=E5=BA=94=E5=BD=93=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8 ``minicom``=E3=
=80=81``ppp`` =E5=92=8C ``mgetty``
> > -=E4=B8=8E=E5=AE=83=E4=BB=AC=E9=80=9A=E4=BF=A1=E3=80=82
> > +=E4=B9=8B=E5=90=8E=E5=B0=B1=E5=BA=94=E8=AF=A5=E8=83=BD=E8=AE=BF=E9=97=
=AE=E8=BF=99=E4=BA=9B=E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=EF=BC=8C=
=E5=B9=B6=E7=94=A8 ``minicom``=E3=80=81``ppp`` =E5=92=8C
> > +``mgetty`` =E4=B8=8E=E5=AE=83=E4=BB=AC=E9=80=9A=E4=BF=A1=E3=80=82
> >  =20
> >   2. =E9=AA=8C=E8=AF=81=E9=A9=B1=E5=8A=A8=E6=98=AF=E5=90=A6=E6=AD=A3=E5=
=B8=B8=E5=B7=A5=E4=BD=9C
> >   ~~~~~~~~~~~~~~~~~~~~~~~
> >  =20
> > -=E7=AC=AC=E4=B8=80=E6=AD=A5=E6=98=AF=E6=A3=80=E6=9F=A5 ``/sys/kernel/d=
ebug/usb/devices``=EF=BC=8C
> > -=E5=85=B6=E5=86=85=E5=AE=B9=E5=BA=94=E8=AF=A5=E7=B1=BB=E4=BC=BC=E5=A6=
=82=E4=B8=8B::
> > +=E7=AC=AC=E4=B8=80=E6=AD=A5=E6=98=AF=E6=9F=A5=E7=9C=8B
> > ``/sys/kernel/debug/usb/devices``=EF=BC=8C=E5=85=B6=E5=86=85=E5=AE=B9=
=E5=BA=94=E5=BD=93=E7=B1=BB=E4=BC=BC=E4=B8=8B=E9=9D=A2=E8=BF=99=E6=A0=B7::=
=20
> >     T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=
=3D12  MxCh=3D
> > 2 B:  Alloc=3D  0/900 us ( 0%), #Int=3D  0, #Iso=3D  0
> > @@ -112,11 +102,10 @@ USB =E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=83=E5=99=A8=
=E5=92=8C USB ISDN =E7=BB=88=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E3=80=82
> >     E:  Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D  0ms
> >     E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D  0ms
> >  =20
> > -=E8=BF=99=E4=B8=89=E8=A1=8C=E7=9A=84=E5=AD=98=E5=9C=A8=E5=BE=88=E5=85=
=B3=E9=94=AE=EF=BC=88=E4=BB=A5=E5=8F=8A ``Cls=3D`` =E5=AD=97=E6=AE=B5=E9=87=
=8C=E5=87=BA=E7=8E=B0=E7=9A=84
> > -``comm`` =E5=92=8C ``data`` =E7=B1=BB=EF=BC=89=EF=BC=9B=E5=AE=83=E8=AF=
=B4=E6=98=8E=E8=BF=99=E6=98=AF=E4=B8=80=E4=B8=AA ACM
> > -=E8=AE=BE=E5=A4=87=E3=80=82``Driver=3Dacm`` =E8=A1=A8=E7=A4=BA=E8=AF=
=A5=E8=AE=BE=E5=A4=87=E6=AD=A3=E5=9C=A8=E4=BD=BF=E7=94=A8 acm =E9=A9=B1=E5=
=8A=A8=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E5=8F=AA=E7=9C=8B=E5=88=B0 ``Cls=3Dff(vend.)``=EF=
=BC=8C=E9=82=A3=E5=B0=B1=E6=97=A0=E8=83=BD=E4=B8=BA=E5=8A=9B=E4=BA=86=EF=BC=
=9A
> > -=E8=BF=99=E8=AF=B4=E6=98=8E=E4=BD=A0=E6=89=8B=E4=B8=8A=E7=9A=84=E8=AE=
=BE=E5=A4=87=E4=BD=BF=E7=94=A8=E7=9A=84=E6=98=AF=E5=8E=82=E5=95=86=E4=B8=93=
=E6=9C=89=E6=8E=A5=E5=8F=A3::
> > +=E5=85=B3=E9=94=AE=E6=98=AF=E7=9C=8B=E8=BF=99=E4=B8=89=E8=A1=8C=EF=BC=
=8C=E5=86=8D=E7=BB=93=E5=90=88 ``Cls=3D`` =E5=AD=97=E6=AE=B5=E9=87=8C=E5=87=
=BA=E7=8E=B0=E7=9A=84 ``comm`` =E5=92=8C ``data``
> > =E7=B1=BB=EF=BC=8C=E5=B0=B1 +=E8=83=BD=E5=88=A4=E6=96=AD=E8=BF=99=E6=98=
=AF=E4=B8=80=E5=8F=B0 ACM =E8=AE=BE=E5=A4=87=E3=80=82``Driver=3Dacm`` =E8=
=A1=A8=E7=A4=BA=E8=AF=A5=E8=AE=BE=E5=A4=87=E6=AD=A3=E5=9C=A8=E4=BD=BF=E7=94=
=A8
> > acm =E9=A9=B1=E5=8A=A8=E3=80=82=E5=A6=82=E6=9E=9C +=E5=8F=AA=E7=9C=8B=
=E5=88=B0
> > ``Cls=3Dff(vend.)``=EF=BC=8C=E9=82=A3=E5=B0=B1=E8=AF=B4=E6=98=8E=E8=BF=
=99=E5=8F=B0=E8=AE=BE=E5=A4=87=E4=BD=BF=E7=94=A8=E7=9A=84=E6=98=AF=E5=8E=82=
=E5=95=86=E4=B8=93=E6=9C=89=E6=8E=A5=E5=8F=A3=EF=BC=8CACM =E9=A9=B1=E5=8A=A8
> > +=E6=97=A0=E6=B3=95=E5=A4=84=E7=90=86::=20
> >       D:  Ver=3D 1.00 Cls=3D02(comm.) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfg=
s=3D  2
> >       I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D02(comm.) Sub=3D02 Prot=3D01
> > Driver=3Dacm @@ -142,6 +131,5 @@ USB =E8=B0=83=E5=88=B6=E8=A7=A3=E8=B0=
=83=E5=99=A8=E5=92=8C USB ISDN
> > =E7=BB=88=E7=AB=AF=E9=80=82=E9=85=8D=E5=99=A8=E3=80=82 usb.c: acm drive=
r claimed interface c7b5f3f8
> >     usb.c: acm driver claimed interface c7691fa0
> >  =20
> > -=E5=A6=82=E6=9E=9C=E4=BB=A5=E4=B8=8A=E9=83=BD=E6=AD=A3=E5=B8=B8=EF=BC=
=8C=E8=AF=B7=E5=90=AF=E5=8A=A8 ``minicom``=EF=BC=8C
> > -=E6=8A=8A=E5=AE=83=E9=85=8D=E7=BD=AE=E4=B8=BA=E8=BF=9E=E6=8E=A5 ``ttyA=
CM`` =E8=AE=BE=E5=A4=87=EF=BC=8C=E7=84=B6=E5=90=8E
> > -=E5=B0=9D=E8=AF=95=E8=BE=93=E5=85=A5 ``at``=E3=80=82=E5=A6=82=E6=9E=9C=
=E8=BF=94=E5=9B=9E ``OK``=EF=BC=8C=E8=AF=B4=E6=98=8E=E4=B8=80=E5=88=87=E5=
=B7=A5=E4=BD=9C=E6=AD=A3=E5=B8=B8=E3=80=82
> > +=E5=A6=82=E6=9E=9C=E8=BF=99=E4=BA=9B=E9=83=BD=E6=AD=A3=E5=B8=B8=EF=BC=
=8C=E8=AF=B7=E5=90=AF=E5=8A=A8 ``minicom``=EF=BC=8C=E6=8A=8A=E5=AE=83=E9=85=
=8D=E7=BD=AE=E4=B8=BA=E8=BF=9E=E6=8E=A5=E5=88=B0 ``ttyACM``
> > =E8=AE=BE=E5=A4=87=EF=BC=8C=E7=84=B6=E5=90=8E +=E5=B0=9D=E8=AF=95=E8=BE=
=93=E5=85=A5 ``at``=E3=80=82=E5=A6=82=E6=9E=9C=E8=BF=94=E5=9B=9E ``OK``=EF=
=BC=8C=E8=AF=B4=E6=98=8E=E9=A9=B1=E5=8A=A8=E5=B7=A5=E4=BD=9C=E6=AD=A3=E5=B8=
=B8=E3=80=82
> > diff --git a/Documentation/translations/zh_CN/usb/authorization.rst
> > b/Documentation/translations/zh_CN/usb/authorization.rst index
> > 2aa311f6b967..e2ff2282bd03 100644 ---
> > a/Documentation/translations/zh_CN/usb/authorization.rst +++
> > b/Documentation/translations/zh_CN/usb/authorization.rst @@ -10,34
> > +10,32 @@ :=E6=A0=A1=E8=AF=91:
> >  =20
> >  =20
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > -=E6=8E=88=E6=9D=83=E6=88=96=E7=A6=81=E6=AD=A2 USB =E8=AE=BE=E5=A4=87=
=E8=BF=9E=E6=8E=A5=E5=88=B0=E7=B3=BB=E7=BB=9F
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +=E5=85=81=E8=AE=B8=E6=88=96=E7=A6=81=E6=AD=A2 USB =E8=AE=BE=E5=A4=87=
=E6=8E=A5=E5=85=A5=E7=B3=BB=E7=BB=9F
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >  =20
> >   =E7=89=88=E6=9D=83 (C) 2007 Inaky Perez-Gonzalez
> >   <inaky@linux.intel.com> =E8=8B=B1=E7=89=B9=E5=B0=94=E5=85=AC=E5=8F=B8
> >  =20
> > -=E6=AD=A4=E5=8A=9F=E8=83=BD=E5=85=81=E8=AE=B8=E4=BD=A0=E6=8E=A7=E5=88=
=B6 USB =E8=AE=BE=E5=A4=87=E6=98=AF=E5=90=A6=E5=8F=AF=E4=BB=A5=E5=9C=A8=E7=
=B3=BB=E7=BB=9F=E4=B8=AD=E4=BD=BF=E7=94=A8=E3=80=82
> > -=E5=80=9F=E5=8A=A9=E5=AE=83=EF=BC=8C=E4=BD=A0=E5=8F=AF=E4=BB=A5=E5=AE=
=8C=E5=85=A8=E9=80=9A=E8=BF=87=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E5=AE=9E=
=E7=8E=B0=E5=AF=B9 USB =E8=AE=BE=E5=A4=87=E7=9A=84=E9=94=81=E5=AE=9A=E3=80=
=82
> > +=E6=9C=89=E4=BA=86=E8=BF=99=E9=A1=B9=E5=8A=9F=E8=83=BD=EF=BC=8C=E4=BD=
=A0=E5=B0=B1=E5=8F=AF=E4=BB=A5=E6=8E=A7=E5=88=B6 USB =E8=AE=BE=E5=A4=87=E6=
=98=AF=E5=90=A6=E5=85=81=E8=AE=B8=E5=9C=A8=E7=B3=BB=E7=BB=9F=E4=B8=AD=E4=BD=
=BF=E7=94=A8=EF=BC=8C=E5=B9=B6=E6=8A=8A USB
> > =E8=AE=BE=E5=A4=87=E9=94=81 +=E5=AE=9A=E6=9C=BA=E5=88=B6=E5=AE=8C=E5=85=
=A8=E6=94=BE=E5=9C=A8=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E5=AE=9E=E7=8E=B0=
=E3=80=82
> >  =20
> > -=E7=9B=AE=E5=89=8D=EF=BC=8C=E5=BD=93=E6=8F=92=E5=85=A5=E4=B8=80=E4=B8=
=AA USB =E8=AE=BE=E5=A4=87=E6=97=B6=EF=BC=8C=E7=B3=BB=E7=BB=9F=E4=BC=9A=E5=
=AF=B9=E5=85=B6=E8=BF=9B=E8=A1=8C=E9=85=8D=E7=BD=AE=EF=BC=8C
> > -=E5=85=B6=E6=8E=A5=E5=8F=A3=E4=BC=9A=E7=AB=8B=E5=8D=B3=E5=90=91=E7=94=
=A8=E6=88=B7=E5=BC=80=E6=94=BE=E3=80=82
> > -=E6=9C=89=E4=BA=86=E8=BF=99=E9=A1=B9=E6=94=B9=E5=8A=A8=EF=BC=8C=E5=8F=
=AA=E6=9C=89=E5=9C=A8 root =E6=8E=88=E6=9D=83=E8=AE=BE=E5=A4=87=E5=AE=8C=E6=
=88=90=E9=85=8D=E7=BD=AE=E5=90=8E=EF=BC=8C
> > -=E8=AE=BE=E5=A4=87=E6=89=8D=E5=8F=AF=E8=A2=AB=E4=BD=BF=E7=94=A8=E3=80=
=82
> > +=E7=9B=AE=E5=89=8D=EF=BC=8CUSB
> > =E8=AE=BE=E5=A4=87=E4=B8=80=E6=8E=A5=E5=85=A5=E7=B3=BB=E7=BB=9F=E5=B0=
=B1=E4=BC=9A=E8=A2=AB=E7=AB=8B=E5=8D=B3=E9=85=8D=E7=BD=AE=EF=BC=8C=E5=85=B6=
=E6=8E=A5=E5=8F=A3=E4=B9=9F=E4=BC=9A=E7=AB=8B=E5=88=BB=E5=90=91=E7=94=A8=E6=
=88=B7=E5=BC=80=E6=94=BE=E3=80=82=E5=BC=95=E5=85=A5
> > +=E8=BF=99=E9=A1=B9=E6=9C=BA=E5=88=B6=E5=90=8E=EF=BC=8C=E5=8F=AA=E6=9C=
=89=E5=9C=A8 root =E6=98=8E=E7=A1=AE=E6=8E=88=E6=9D=83=E5=90=8E=EF=BC=8C=E8=
=AE=BE=E5=A4=87=E6=89=8D=E4=BC=9A=E5=AE=8C=E6=88=90=E9=85=8D=E7=BD=AE=E5=B9=
=B6=E5=85=81=E8=AE=B8=E4=BD=BF=E7=94=A8=E3=80=82=20
> >  =20
> >   =E7=94=A8=E6=B3=95
> >   =3D=3D=3D=3D
> >  =20
> > -=E6=8E=88=E6=9D=83=E8=AE=BE=E5=A4=87=E6=8E=A5=E5=85=A5::
> > +=E6=8E=88=E6=9D=83=E8=AE=BE=E5=A4=87=E6=8E=A5=E5=85=A5=E7=B3=BB=E7=BB=
=9F::
> >  =20
> >   	$ echo 1 > /sys/bus/usb/devices/DEVICE/authorized
> >  =20
> > -=E5=8F=96=E6=B6=88=E5=AF=B9=E8=AE=BE=E5=A4=87=E7=9A=84=E6=8E=88=E6=9D=
=83::
> > +=E5=8F=96=E6=B6=88=E8=AE=BE=E5=A4=87=E6=8E=88=E6=9D=83::
> >  =20
> >   	$ echo 0 > /sys/bus/usb/devices/DEVICE/authorized
> >  =20
> > -=E5=B0=86=E6=96=B0=E8=BF=9E=E6=8E=A5=E5=88=B0 ``hostX`` =E7=9A=84=E8=
=AE=BE=E5=A4=87=E9=BB=98=E8=AE=A4=E8=AE=BE=E4=B8=BA=E6=9C=AA=E6=8E=88=E6=9D=
=83=EF=BC=88=E5=8D=B3=E9=94=81=E5=AE=9A=EF=BC=89::
> > +=E5=B0=86=E8=BF=9E=E6=8E=A5=E5=88=B0 ``hostX`` =E7=9A=84=E6=96=B0=E8=
=AE=BE=E5=A4=87=E9=BB=98=E8=AE=A4=E8=AE=BE=E4=B8=BA=E6=9C=AA=E6=8E=88=E6=9D=
=83=EF=BC=88=E5=8D=B3=E9=94=81=E5=AE=9A=EF=BC=89::
> >  =20
> >   	$ echo 0 > /sys/bus/usb/devices/usbX/authorized_default
> >  =20
> > @@ -45,15 +43,14 @@
> >  =20
> >   	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
> >  =20
> > -=E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E6=89=80=E6=9C=
=89 USB =E8=AE=BE=E5=A4=87=E9=83=BD=E6=98=AF=E6=8E=88=E6=9D=83=E7=9A=84=E3=
=80=82
> > -=E5=90=91 ``authorized_default`` =E5=B1=9E=E6=80=A7=E5=86=99=E5=85=A5 =
``2`` =E4=BC=9A=E4=BD=BF=E5=86=85=E6=A0=B8
> > -=E9=BB=98=E8=AE=A4=E5=8F=AA=E6=8E=88=E6=9D=83=E8=BF=9E=E6=8E=A5=E5=88=
=B0=E5=86=85=E9=83=A8 USB =E7=AB=AF=E5=8F=A3=E7=9A=84=E8=AE=BE=E5=A4=87=E3=
=80=82
> > +=E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E6=89=80=E6=9C=
=89 USB =E8=AE=BE=E5=A4=87=E9=83=BD=E6=98=AF=E6=8E=88=E6=9D=83=E7=9A=84=E3=
=80=82=E5=90=91 ``authorized_default``
> > =E5=B1=9E=E6=80=A7=E5=86=99=E5=85=A5 +``2`` =E4=BC=9A=E4=BD=BF=E5=86=85=
=E6=A0=B8=E9=BB=98=E8=AE=A4=E5=8F=AA=E6=8E=88=E6=9D=83=E8=BF=9E=E6=8E=A5=E5=
=88=B0=E5=86=85=E9=83=A8 USB =E7=AB=AF=E5=8F=A3=E7=9A=84=E8=AE=BE=E5=A4=87=
=E3=80=82
> >  =20
> > -=E7=B3=BB=E7=BB=9F=E9=94=81=E5=AE=9A=E7=A4=BA=E4=BE=8B=EF=BC=88=E6=AF=
=94=E8=BE=83=E7=B2=97=E7=B3=99=EF=BC=89
> > -------------------------
> > +=E7=B3=BB=E7=BB=9F=E9=94=81=E5=AE=9A=E7=A4=BA=E4=BE=8B=EF=BC=88=E7=AE=
=80=E5=8C=96=E7=89=88=EF=BC=89
> > +----------------------
> >  =20
> > -=E5=81=87=E8=AE=BE=E4=BD=A0=E6=83=B3=E5=AE=9E=E7=8E=B0=E4=B8=80=E4=B8=
=AA=E9=94=81=E5=AE=9A=E5=8A=9F=E8=83=BD=EF=BC=8C=E5=8F=AA=E5=85=81=E8=AE=B8=
=E7=B1=BB=E5=9E=8B=E4=B8=BA XYZ =E7=9A=84=E8=AE=BE=E5=A4=87=E6=8E=A5=E5=85=
=A5
> > -=EF=BC=88=E4=BE=8B=E5=A6=82=E6=9F=90=E5=8F=B0=E5=B8=A6=E6=9C=89=E5=A4=
=96=E9=9C=B2 USB =E7=AB=AF=E5=8F=A3=E7=9A=84=E8=87=AA=E5=8A=A9=E6=9C=8D=E5=
=8A=A1=E7=BB=88=E7=AB=AF=EF=BC=89::
> > +=E5=81=87=E8=AE=BE=E4=BD=A0=E6=83=B3=E5=81=9A=E4=B8=80=E4=B8=AA=E9=94=
=81=E5=AE=9A=E6=9C=BA=E5=88=B6=EF=BC=8C=E5=8F=AA=E5=85=81=E8=AE=B8 XYZ
> > =E7=B1=BB=E5=9E=8B=E7=9A=84=E8=AE=BE=E5=A4=87=E6=8E=A5=E5=85=A5=EF=BC=
=88=E4=BE=8B=E5=A6=82=E4=B8=80=E5=8F=B0=E5=B8=A6=E6=9C=89=E5=A4=96=E9=9C=B2=
 USB +=E7=AB=AF=E5=8F=A3=E7=9A=84=E8=87=AA=E5=8A=A9=E7=BB=88=E7=AB=AF=EF=BC=
=89::
> >  =20
> >     =E5=90=AF=E5=8A=A8=E7=B3=BB=E7=BB=9F
> >     rc.local ->
> > @@ -63,21 +60,18 @@
> >         echo 0 > $host/authorized_default
> >      done
> >  =20
> > -=E7=BB=99 udev =E6=8C=82=E4=B8=80=E4=B8=AA=E8=84=9A=E6=9C=AC=EF=BC=8C=
=E7=94=A8=E4=BA=8E=E5=A4=84=E7=90=86=E6=96=B0=E6=8F=92=E5=85=A5=E7=9A=84 US=
B =E8=AE=BE=E5=A4=87::
> > +=E4=B8=BA udev =E9=85=8D=E7=BD=AE=E4=B8=80=E4=B8=AA=E8=84=9A=E6=9C=AC=
=EF=BC=8C=E7=94=A8=E4=BA=8E=E5=A4=84=E7=90=86=E6=96=B0=E6=8F=92=E5=85=A5=E7=
=9A=84 USB =E8=AE=BE=E5=A4=87::
> >  =20
> >    if device_is_my_type $DEV
> >    then
> >      echo 1 > $device_path/authorized
> > - done
> > + fi
> >  =20
> >  =20
> > -``device_is_my_type()`` =E6=89=8D=E6=98=AF=E9=94=81=E5=AE=9A=E6=96=B9=
=E6=A1=88=E7=9C=9F=E6=AD=A3=E8=A7=81=E5=8A=9F=E5=A4=AB=E7=9A=84
> > -=E5=9C=B0=E6=96=B9=E3=80=82=E4=BB=85=E4=BB=85=E6=A3=80=E6=9F=A5 class=
=E3=80=81type =E5=92=8C protocol =E6=98=AF=E5=90=A6=E5=8C=B9=E9=85=8D
> > -=E6=9F=90=E4=B8=AA=E5=80=BC=EF=BC=8C=E6=98=AF=E4=BD=A0=E8=83=BD=E5=81=
=9A=E5=87=BA=E7=9A=84=E6=9C=80=E7=B3=9F=E7=B3=95=E7=9A=84=E5=AE=89=E5=85=A8=
=E9=AA=8C=E8=AF=81=E4=B9=8B=E4=B8=80=EF=BC=9B
> > -=E5=AF=B9=E6=83=B3=E7=BB=95=E8=BF=87=E5=AE=83=E7=9A=84=E4=BA=BA=E6=9D=
=A5=E8=AF=B4=EF=BC=8C=E8=BF=99=E5=8F=8D=E8=80=8C=E6=98=AF=E6=9C=80=E5=AE=B9=
=E6=98=93=E5=88=A9=E7=94=A8=E7=9A=84=E6=96=B9=E6=A1=88=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E4=BD=A0=E9=9C=80=E8=A6=81=E7=9C=9F=E6=AD=A3=E5=AE=
=89=E5=85=A8=E7=9A=84=E5=8A=9E=E6=B3=95=EF=BC=8C=E9=82=A3=E5=B0=B1=E8=AF=A5=
=E4=BD=BF=E7=94=A8=E5=8A=A0=E5=AF=86=E3=80=81
> > -=E8=AF=81=E4=B9=A6=E8=AE=A4=E8=AF=81=E4=B9=8B=E7=B1=BB=E7=9A=84=E6=9C=
=BA=E5=88=B6=E3=80=82=E6=8A=8A USB =E5=AD=98=E5=82=A8=E8=AE=BE=E5=A4=87=E5=
=BD=93=E4=BD=9C
> > -=E2=80=9C=E9=92=A5=E5=8C=99=E2=80=9D=E7=9A=84=E4=B8=80=E4=B8=AA=E7=AE=
=80=E5=8D=95=E4=BE=8B=E5=AD=90=E5=8F=AF=E4=BB=A5=E6=98=AF::
> > +=E9=94=81=E5=AE=9A=E6=96=B9=E6=A1=88=E6=98=AF=E5=90=A6=E5=8F=AF=E9=9D=
=A0=EF=BC=8C=E5=85=B3=E9=94=AE=E5=85=A8=E5=9C=A8 ``device_is_my_type()`` =
=E7=9A=84=E5=AE=9E=E7=8E=B0=E3=80=82=E4=BB=85=E4=BB=85=E6=A3=80=E6=9F=A5
> > +class=E3=80=81type =E5=92=8C protocol
> > =E6=98=AF=E5=90=A6=E5=8C=B9=E9=85=8D=EF=BC=8C=E5=87=A0=E4=B9=8E=E6=98=
=AF=E6=9C=80=E5=B7=AE=E7=9A=84=E4=B8=80=E7=A7=8D=E5=AE=89=E5=85=A8=E6=A0=A1=
=E9=AA=8C=E6=96=B9=E5=BC=8F=EF=BC=9B=E5=AF=B9=E6=83=B3=E7=BB=95=E8=BF=87
> > +=E5=AE=83=E7=9A=84=E4=BA=BA=E6=9D=A5=E8=AF=B4=EF=BC=8C=E8=BF=99=E7=A7=
=8D=E5=81=9A=E6=B3=95=E5=8F=8D=E8=80=8C=E6=9C=80=E5=AE=B9=E6=98=93=E4=BC=AA=
=E9=80=A0=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E7=9C=9F=E8=A6=81=E5=81=9A=E5=
=AE=89=E5=85=A8=E6=8E=A7=E5=88=B6=EF=BC=8C=E5=B0=B1=E8=AF=A5=E4=BD=BF=E7=94=
=A8=E5=8A=A0=E5=AF=86=E3=80=81
> > +=E8=AF=81=E4=B9=A6=E8=AE=A4=E8=AF=81=E4=B9=8B=E7=B1=BB=E7=9A=84=E6=9C=
=BA=E5=88=B6=E3=80=82=E6=8A=8A USB
> > =E5=AD=98=E5=82=A8=E8=AE=BE=E5=A4=87=E5=BD=93=E4=BD=9C=E2=80=9C=E9=92=
=A5=E5=8C=99=E2=80=9D=E7=9A=84=E4=B8=80=E4=B8=AA=E7=AE=80=E5=8D=95=E7=A4=BA=
=E4=BE=8B=E5=8F=AF=E4=BB=A5=E5=86=99=E6=88=90:: function
> > device_is_my_type() {
> > @@ -87,7 +81,7 @@
> >      sum=3D$(md5sum/mntpoint/.signature)
> >      if [ $sum =3D $(cat /etc/lockdown/keysum) ]
> >      then
> > -        echo "We are good, connected"
> > +        echo "=E9=AA=8C=E8=AF=81=E9=80=9A=E8=BF=87=EF=BC=8C=E5=B7=B2=
=E8=BF=9E=E6=8E=A5"
> >           umount /mntpoint
> >           # =E5=86=8D=E5=81=9A=E4=B8=80=E4=BA=9B=E9=A2=9D=E5=A4=96=E5=
=A4=84=E7=90=86=EF=BC=8C=E8=AE=A9=E5=85=B6=E4=BB=96=E4=BA=BA=E4=B9=9F=E8=83=
=BD=E4=BD=BF=E7=94=A8=E5=AE=83
> >      else
> > @@ -96,17 +90,16 @@
> >    }
> >  =20
> >  =20
> > -=E5=BD=93=E7=84=B6=EF=BC=8C=E8=BF=99=E4=B8=AA=E4=BE=8B=E5=AD=90=E5=BE=
=88=E7=B2=97=E7=B3=99=EF=BC=9B=E7=9C=9F=E6=AD=A3=E8=A6=81=E5=81=9A=E7=9A=84=
=E8=AF=9D=EF=BC=8C
> > -=E4=BD=A0=E4=BC=9A=E6=83=B3=E7=94=A8=E5=9F=BA=E4=BA=8E PKI =E7=9A=84=
=E8=AF=81=E4=B9=A6=E6=A0=A1=E9=AA=8C=EF=BC=8C=E8=BF=99=E6=A0=B7=E5=B0=B1=E4=
=B8=8D=E5=BF=85=E4=BE=9D=E8=B5=96
> > -=E5=85=B1=E4=BA=AB=E5=AF=86=E9=92=A5=E4=B9=8B=E7=B1=BB=E7=9A=84=E4=B8=
=9C=E8=A5=BF=E3=80=82=E4=B8=8D=E8=BF=87=E4=BD=A0=E5=BA=94=E8=AF=A5=E5=B7=B2=
=E7=BB=8F=E6=98=8E=E7=99=BD=E6=84=8F=E6=80=9D=E4=BA=86=E3=80=82
> > -=E4=BB=BB=E4=BD=95=E6=8B=BF=E5=88=B0=E8=AE=BE=E5=A4=87=E4=BB=BF=E7=9C=
=9F=E5=B7=A5=E5=85=B7=E5=8C=85=E7=9A=84=E4=BA=BA=E9=83=BD=E8=83=BD=E4=BC=AA=
=E9=80=A0=E6=8F=8F=E8=BF=B0=E7=AC=A6=E5=92=8C=E8=AE=BE=E5=A4=87=E4=BF=A1=E6=
=81=AF=E3=80=82
> > -=E5=88=AB=E4=BF=A1=E8=BF=99=E4=B8=AA=E3=80=82
> > +=E5=BD=93=E7=84=B6=EF=BC=8C=E8=BF=99=E4=B8=AA=E4=BE=8B=E5=AD=90=E4=BB=
=8D=E7=84=B6=E6=AF=94=E8=BE=83=E7=AE=80=E5=8C=96=E3=80=82=E7=9C=9F=E6=AD=A3=
=E8=90=BD=E5=9C=B0=E6=97=B6=EF=BC=8C=E6=9B=B4=E5=90=88=E9=80=82=E7=9A=84=E5=
=81=9A=E6=B3=95=E6=98=AF=E4=BD=BF=E7=94=A8=E5=9F=BA=E4=BA=8E PKI
> > =E7=9A=84=E8=AF=81
> > +=E4=B9=A6=E6=A0=A1=E9=AA=8C=EF=BC=8C=E8=BF=99=E6=A0=B7=E5=B0=B1=E4=B8=
=8D=E5=BF=85=E4=BE=9D=E8=B5=96=E5=85=B1=E4=BA=AB=E5=AF=86=E9=92=A5=E4=B9=8B=
=E7=B1=BB=E7=9A=84=E6=9C=BA=E5=88=B6=E4=BA=86=E3=80=82=E4=B8=8D=E8=BF=87=E6=
=84=8F=E6=80=9D=E5=B7=B2=E7=BB=8F=E5=BE=88=E6=B8=85=E6=A5=9A=EF=BC=9A=E4=BB=
=BB=E4=BD=95=E6=8B=BF=E5=88=B0
> > +=E8=AE=BE=E5=A4=87=E4=BB=BF=E7=9C=9F=E5=B7=A5=E5=85=B7=E5=8C=85=E7=9A=
=84=E4=BA=BA=EF=BC=8C=E9=83=BD=E8=83=BD=E4=BC=AA=E9=80=A0=E6=8F=8F=E8=BF=B0=
=E7=AC=A6=E5=92=8C=E8=AE=BE=E5=A4=87=E4=BF=A1=E6=81=AF=EF=BC=8C=E6=89=80=E4=
=BB=A5=E5=88=AB=E6=8A=8A=E8=BF=99=E7=B1=BB=E6=A3=80=E6=9F=A5=E5=BD=93=E6=88=
=90=E7=9C=9F=E6=AD=A3
> > +=E7=9A=84=E5=AE=89=E5=85=A8=E4=BF=9D=E9=9A=9C=E3=80=82=20
> >   =E6=8E=A5=E5=8F=A3=E6=8E=88=E6=9D=83
> >   --------
> >  =20
> > -=E4=B9=9F=E6=9C=89=E7=B1=BB=E4=BC=BC=E7=9A=84=E6=96=B9=E6=B3=95=E7=94=
=A8=E4=BA=8E=E5=85=81=E8=AE=B8=E6=88=96=E6=8B=92=E7=BB=9D=E7=89=B9=E5=AE=9A=
 USB =E6=8E=A5=E5=8F=A3=E3=80=82
> > -=E8=BF=99=E4=BD=BF=E5=BE=97=E4=BD=A0=E5=8F=AF=E4=BB=A5=E5=8F=AA=E9=98=
=BB=E6=AD=A2=E6=9F=90=E4=B8=AA USB =E8=AE=BE=E5=A4=87=E4=B8=AD=E7=9A=84=E9=
=83=A8=E5=88=86=E6=8E=A5=E5=8F=A3=E3=80=82
> > +=E4=B9=9F=E5=8F=AF=E4=BB=A5=E7=94=A8=E7=B1=BB=E4=BC=BC=E7=9A=84=E6=96=
=B9=E6=B3=95=E5=85=81=E8=AE=B8=E6=88=96=E6=8B=92=E7=BB=9D=E7=89=B9=E5=AE=9A=
=E7=9A=84 USB
> > =E6=8E=A5=E5=8F=A3=E3=80=82=E8=BF=99=E6=A0=B7=E4=B8=80=E6=9D=A5=EF=BC=
=8C=E4=BD=A0=E5=8F=AA=E9=9C=80=E8=A6=81=E9=98=BB=E6=AD=A2=E6=9F=90=E4=B8=AA=
 +USB =E8=AE=BE=E5=A4=87=E4=B8=AD=E7=9A=84=E9=83=A8=E5=88=86=E6=8E=A5=E5=8F=
=A3=E3=80=82
> >  =20
> >   =E6=8E=88=E6=9D=83=E6=8E=A5=E5=8F=A3::
> >  =20
> > @@ -126,14 +119,12 @@
> >  =20
> >   	$ echo 0 >
> > /sys/bus/usb/devices/usbX/interface_authorized_default=20
> > -=E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C
> > -``interface_authorized_default`` =E4=BD=8D=E4=B8=BA ``1``=EF=BC=8C
> > -=E5=9B=A0=E6=AD=A4=E6=89=80=E6=9C=89=E6=8E=A5=E5=8F=A3=E9=BB=98=E8=AE=
=A4=E9=83=BD=E5=A4=84=E4=BA=8E=E5=B7=B2=E6=8E=88=E6=9D=83=E7=8A=B6=E6=80=81=
=E3=80=82
> > +=E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C``interface_auth=
orized_default`` =E4=BD=8D=E4=B8=BA
> > ``1``=EF=BC=8C=E5=9B=A0=E6=AD=A4=E6=89=80=E6=9C=89=E6=8E=A5=E5=8F=A3=E9=
=BB=98=E8=AE=A4 +=E9=83=BD=E4=BC=9A=E5=A4=84=E4=BA=8E=E6=8E=88=E6=9D=83=E7=
=8A=B6=E6=80=81=E3=80=82
> >  =20
> >   =E6=B3=A8=E6=84=8F=EF=BC=9A
> > -  =E5=A6=82=E6=9E=9C=E6=8A=8A=E4=B8=80=E4=B8=AA=E5=85=88=E5=89=8D=E6=
=9C=AA=E6=8E=88=E6=9D=83=E7=9A=84=E6=8E=A5=E5=8F=A3=E6=94=B9=E4=B8=BA=E5=B7=
=B2=E6=8E=88=E6=9D=83=EF=BC=8C
> > -  =E5=88=99=E5=BF=85=E9=A1=BB=E9=80=9A=E8=BF=87=E5=B0=86 ``INTERFACE``=
 =E5=86=99=E5=85=A5 ``/sys/bus/usb/drivers_probe``
> > -  =E6=9D=A5=E6=89=8B=E5=8A=A8=E8=A7=A6=E5=8F=91=E9=A9=B1=E5=8A=A8=E6=
=8E=A2=E6=B5=8B=E3=80=82
> > +  =E5=A6=82=E6=9E=9C=E6=8A=8A=E4=B8=80=E4=B8=AA=E5=85=88=E5=89=8D=E6=
=9C=AA=E6=8E=88=E6=9D=83=E7=9A=84=E6=8E=A5=E5=8F=A3=E6=94=B9=E4=B8=BA=E5=B7=
=B2=E6=8E=88=E6=9D=83=EF=BC=8C=E5=88=99=E5=BF=85=E9=A1=BB=E9=80=9A=E8=BF=87=
=E5=B0=86 ``INTERFACE``
> > =E5=86=99=E5=85=A5
> > +  ``/sys/bus/usb/drivers_probe`` =E6=9D=A5=E6=89=8B=E5=8A=A8=E8=A7=A6=
=E5=8F=91=E9=A9=B1=E5=8A=A8=E6=8E=A2=E6=B5=8B=E3=80=82
> >  =20
> > -=E5=AF=B9=E4=BA=8E=E9=9C=80=E8=A6=81=E5=A4=9A=E4=B8=AA=E6=8E=A5=E5=8F=
=A3=E7=9A=84=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=EF=BC=8C=E5=BA=94=E5=85=88=
=E6=8E=88=E6=9D=83=E6=89=80=E6=9C=89=E5=BF=85=E9=9C=80=E6=8E=A5=E5=8F=A3=EF=
=BC=8C
> > -=E7=84=B6=E5=90=8E=E5=86=8D=E8=A7=A6=E5=8F=91=E9=A9=B1=E5=8A=A8=E6=8E=
=A2=E6=B5=8B=E3=80=82=E8=BF=99=E6=A0=B7=E5=81=9A=E5=8F=AF=E4=BB=A5=E9=81=BF=
=E5=85=8D=E5=89=AF=E4=BD=9C=E7=94=A8=E3=80=82
> > +=E5=AF=B9=E4=BA=8E=E9=9C=80=E8=A6=81=E5=A4=9A=E4=B8=AA=E6=8E=A5=E5=8F=
=A3=E7=9A=84=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=EF=BC=8C=E5=BA=94=E5=85=88=
=E6=8E=88=E6=9D=83=E6=89=80=E6=9C=89=E5=BF=85=E9=9C=80=E6=8E=A5=E5=8F=A3=EF=
=BC=8C=E7=84=B6=E5=90=8E=E5=86=8D=E8=A7=A6=E5=8F=91=E9=A9=B1=E5=8A=A8=E6=8E=
=A2=E6=B5=8B=E3=80=82
> > +=E8=BF=99=E6=A0=B7=E5=81=9A=E5=8F=AF=E4=BB=A5=E9=81=BF=E5=85=8D=E5=89=
=AF=E4=BD=9C=E7=94=A8=E3=80=82
> > diff --git a/Documentation/translations/zh_CN/usb/chipidea.rst
> > b/Documentation/translations/zh_CN/usb/chipidea.rst index
> > ea0dc3043189..011fb16f3350 100644 ---
> > a/Documentation/translations/zh_CN/usb/chipidea.rst +++
> > b/Documentation/translations/zh_CN/usb/chipidea.rst @@ -17,18
> > +17,17 @@ ChipIdea =E9=AB=98=E9=80=9F=E5=8F=8C=E8=A7=92=E8=89=B2=E6=8E=
=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8 1. =E5=A6=82=E4=BD=95=E6=B5=8B=E8=
=AF=95 OTG FSM=EF=BC=88HNP =E5=92=8C
> > SRP=EF=BC=89 ---------------------------------
> >  =20
> > -=E4=B8=8B=E9=9D=A2=E4=BB=A5=E4=B8=A4=E5=9D=97 Freescale i.MX6Q Sabre S=
D =E5=BC=80=E5=8F=91=E6=9D=BF=E4=B8=BA=E4=BE=8B=EF=BC=8C
> > -=E8=AF=B4=E6=98=8E=E5=A6=82=E4=BD=95=E9=80=9A=E8=BF=87 sysfs =E8=BE=93=
=E5=85=A5=E6=96=87=E4=BB=B6=E6=BC=94=E7=A4=BA OTG =E7=9A=84 HNP =E5=92=8C S=
RP =E5=8A=9F=E8=83=BD=E3=80=82
> > +=E4=B8=8B=E9=9D=A2=E4=BB=A5=E4=B8=A4=E5=9D=97 Freescale i.MX6Q Sabre S=
D =E5=BC=80=E5=8F=91=E6=9D=BF=E4=B8=BA=E4=BE=8B=EF=BC=8C=E6=BC=94=E7=A4=BA=
=E5=A6=82=E4=BD=95=E9=80=9A=E8=BF=87
> > sysfs =E5=B1=9E=E6=80=A7 +=E6=B5=8B=E8=AF=95 OTG =E7=9A=84 HNP =E5=92=
=8C SRP =E5=8A=9F=E8=83=BD=E3=80=82
> >  =20
> > -1.1 =E5=A6=82=E4=BD=95=E4=BD=BF=E8=83=BD OTG FSM
> > +1.1 =E5=A6=82=E4=BD=95=E5=90=AF=E7=94=A8 OTG FSM
> >   --------------------
> >  =20
> >   1.1.1 =E5=9C=A8 ``menuconfig`` =E4=B8=AD=E9=80=89=E6=8B=A9
> > ``CONFIG_USB_OTG_FSM``=EF=BC=8C=E5=B9=B6=E9=87=8D=E6=96=B0=E7=BC=96=E8=
=AF=91=E5=86=85=E6=A0=B8
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=20
> > -=E9=87=8D=E6=96=B0=E6=9E=84=E5=BB=BA=E5=86=85=E6=A0=B8=E9=95=9C=E5=83=
=8F=E5=92=8C=E6=A8=A1=E5=9D=97=E3=80=82=E5=A6=82=E6=9E=9C=E6=83=B3=E6=9F=A5=
=E7=9C=8B OTG FSM =E7=9A=84
> > -=E4=B8=80=E4=BA=9B=E5=86=85=E9=83=A8=E5=8F=98=E9=87=8F=EF=BC=8C=E5=8F=
=AF=E4=BB=A5=E6=8C=82=E8=BD=BD ``debugfs``=EF=BC=9B=E5=85=B6=E4=B8=AD=E6=9C=
=89=E4=B8=A4=E4=B8=AA=E6=96=87=E4=BB=B6
> > -=E5=8F=AF=E4=BB=A5=E6=98=BE=E7=A4=BA OTG FSM =E5=8F=98=E9=87=8F=E4=BB=
=A5=E5=8F=8A=E9=83=A8=E5=88=86=E6=8E=A7=E5=88=B6=E5=99=A8=E5=AF=84=E5=AD=98=
=E5=99=A8=E7=9A=84=E5=80=BC::
> > +=E9=87=8D=E6=96=B0=E6=9E=84=E5=BB=BA=E5=86=85=E6=A0=B8=E9=95=9C=E5=83=
=8F=E5=92=8C=E6=A8=A1=E5=9D=97=E3=80=82=E5=A6=82=E6=9E=9C=E6=83=B3=E6=9F=A5=
=E7=9C=8B OTG FSM =E7=9A=84=E5=86=85=E9=83=A8=E5=8F=98=E9=87=8F=EF=BC=8C=E5=
=8F=AF=E4=BB=A5=E6=8C=82=E8=BD=BD
> > +``debugfs``=EF=BC=9B=E5=85=B6=E4=B8=AD=E6=9C=89=E4=B8=A4=E4=B8=AA=E6=
=96=87=E4=BB=B6=EF=BC=8C=E5=88=86=E5=88=AB=E6=98=BE=E7=A4=BA OTG FSM
> > =E7=9A=84=E5=8F=98=E9=87=8F=E5=92=8C=E9=83=A8=E5=88=86=E6=8E=A7=E5=88=
=B6=E5=99=A8=E5=AF=84=E5=AD=98=E5=99=A8=E5=80=BC::=20
> >   	cat /sys/kernel/debug/ci_hdrc.0/otg
> >   	cat /sys/kernel/debug/ci_hdrc.0/registers
> > @@ -44,11 +43,10 @@ ChipIdea =E9=AB=98=E9=80=9F=E5=8F=8C=E8=A7=92=E8=89=
=B2=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8
> >   1.2 =E6=B5=8B=E8=AF=95=E6=AD=A5=E9=AA=A4
> >   ------------
> >  =20
> > -1) =E7=BB=99=E4=B8=A4=E5=9D=97 Freescale i.MX6Q Sabre SD =E5=BC=80=E5=
=8F=91=E6=9D=BF=E4=B8=8A=E7=94=B5=EF=BC=8C
> > -   =E5=B9=B6=E5=8A=A0=E8=BD=BD gadget =E7=B1=BB=E9=A9=B1=E5=8A=A8=EF=
=BC=88=E4=BE=8B=E5=A6=82 ``g_mass_storage``=EF=BC=89=E3=80=82
> > +1) =E7=BB=99=E4=B8=A4=E5=9D=97 Freescale i.MX6Q Sabre SD =E5=BC=80=E5=
=8F=91=E6=9D=BF=E4=B8=8A=E7=94=B5=EF=BC=8C=E5=B9=B6=E5=8A=A0=E8=BD=BD gadget
> > =E7=B1=BB=E9=A9=B1=E5=8A=A8=EF=BC=88=E4=BE=8B=E5=A6=82
> > +   ``g_mass_storage``=EF=BC=89=E3=80=82
> >  =20
> > -2) =E7=94=A8 USB =E7=BA=BF=E8=BF=9E=E6=8E=A5=E4=B8=A4=E5=9D=97=E5=BC=
=80=E5=8F=91=E6=9D=BF=EF=BC=9A
> > -   =E4=B8=80=E7=AB=AF=E6=98=AF micro A =E6=8F=92=E5=A4=B4=EF=BC=8C=E5=
=8F=A6=E4=B8=80=E7=AB=AF=E6=98=AF micro B =E6=8F=92=E5=A4=B4=E3=80=82
> > +2) =E7=94=A8 USB =E7=BA=BF=E8=BF=9E=E6=8E=A5=E4=B8=A4=E5=9D=97=E5=BC=
=80=E5=8F=91=E6=9D=BF=EF=BC=9A=E4=B8=80=E7=AB=AF=E6=98=AF micro A =E6=8F=92=
=E5=A4=B4=EF=BC=8C=E5=8F=A6=E4=B8=80=E7=AB=AF=E6=98=AF micro B
> > =E6=8F=92=E5=A4=B4=E3=80=82=20
> >      =E6=8F=92=E5=85=A5 micro A =E6=8F=92=E5=A4=B4=E7=9A=84=E4=B8=80=E7=
=AB=AF=E6=98=AF A =E8=AE=BE=E5=A4=87=EF=BC=8C=E5=AE=83=E5=BA=94=E6=9E=9A=E4=
=B8=BE=E5=8F=A6=E4=B8=80=E7=AB=AF=E7=9A=84 B =E8=AE=BE=E5=A4=87=E3=80=82
> >  =20
> > @@ -66,32 +64,28 @@ ChipIdea =E9=AB=98=E9=80=9F=E5=8F=8C=E8=A7=92=E8=89=
=B2=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8
> >  =20
> >   	echo 0 >
> > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req=20
> > -   =E6=88=96=E8=80=85=EF=BC=8C=E9=80=9A=E8=BF=87=E5=BC=95=E5=85=A5 HNP=
 =E8=BD=AE=E8=AF=A2=EF=BC=8CB =E7=AB=AF=E4=B8=BB=E6=9C=BA=E5=8F=AF=E4=BB=A5=
=E7=9F=A5=E9=81=93
> > -   A =E7=AB=AF=E5=A4=96=E8=AE=BE=E5=B8=8C=E6=9C=9B=E5=88=87=E6=8D=A2=
=E4=B8=BA=E4=B8=BB=E6=9C=BA=E8=A7=92=E8=89=B2=EF=BC=8C=E5=9B=A0=E6=AD=A4=E8=
=BF=99=E6=AC=A1=E8=A7=92=E8=89=B2=E5=88=87=E6=8D=A2
> > -   =E4=B9=9F=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87 A =E7=AB=AF=E5=A4=96=
=E8=AE=BE=E5=93=8D=E5=BA=94 B =E7=AB=AF=E4=B8=BB=E6=9C=BA=E7=9A=84=E8=BD=AE=
=E8=AF=A2=EF=BC=8C
> > -   =E5=9C=A8 A =E4=BE=A7=E8=A7=A6=E5=8F=91=E3=80=82
> > -   =E8=BF=99=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E5=9C=A8 A =E8=AE=BE=
=E5=A4=87=E4=B8=8A=E6=89=A7=E8=A1=8C=E4=B8=8B=E9=9D=A2=E7=9A=84=E5=91=BD=E4=
=BB=A4=E6=9D=A5=E5=AE=8C=E6=88=90::
> > +   =E6=88=96=E8=80=85=EF=BC=8C=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=80=9F=E5=
=8A=A9 HNP =E8=BD=AE=E8=AF=A2=EF=BC=8C=E8=AE=A9 B =E7=AB=AF=E4=B8=BB=E6=9C=
=BA=E7=9F=A5=E9=81=93 A
> > =E7=AB=AF=E5=A4=96=E8=AE=BE=E5=B8=8C=E6=9C=9B=E5=88=87=E5=9B=9E=E4=B8=
=BB=E6=9C=BA=E8=A7=92=E8=89=B2=E3=80=82
> > +   =E5=9B=A0=E6=AD=A4=EF=BC=8C=E8=BF=99=E6=AC=A1=E5=88=87=E6=8D=A2=E4=
=B9=9F=E5=8F=AF=E4=BB=A5=E7=94=B1 A =E4=BE=A7=E8=A7=A6=E5=8F=91=EF=BC=8C=E4=
=B9=9F=E5=B0=B1=E6=98=AF=E7=94=B1 A =E7=AB=AF=E5=A4=96=E8=AE=BE=E5=93=8D=E5=
=BA=94 B
> > =E7=AB=AF=E4=B8=BB=E6=9C=BA=E7=9A=84=E8=BD=AE=E8=AF=A2
> > +   =E6=9D=A5=E5=AE=8C=E6=88=90=E3=80=82=E5=8F=AF=E5=9C=A8 A =E8=AE=BE=
=E5=A4=87=E4=B8=8A=E6=89=A7=E8=A1=8C=E4=B8=8B=E9=9D=A2=E7=9A=84=E5=91=BD=E4=
=BB=A4::
> >  =20
> >   	echo 1 >
> > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req=20
> >      A =E8=AE=BE=E5=A4=87=E5=BA=94=E5=88=87=E5=9B=9E=E4=B8=BB=E6=9C=BA=
=E8=A7=92=E8=89=B2=E5=B9=B6=E6=9E=9A=E4=B8=BE B =E8=AE=BE=E5=A4=87=E3=80=82
> >  =20
> > -5) =E6=8B=94=E6=8E=89 B =E8=AE=BE=E5=A4=87=EF=BC=88=E6=8B=94=E6=8E=89 =
micro B =E6=8F=92=E5=A4=B4=EF=BC=89=EF=BC=8C
> > -   =E5=B9=B6=E5=9C=A8 10 =E7=A7=92=E5=86=85=E9=87=8D=E6=96=B0=E6=8F=92=
=E5=85=A5=EF=BC=9B
> > +5) =E6=8B=94=E6=8E=89 B =E8=AE=BE=E5=A4=87=EF=BC=88=E6=8B=94=E6=8E=89 =
micro B =E6=8F=92=E5=A4=B4=EF=BC=89=EF=BC=8C=E5=B9=B6=E5=9C=A8 10 =E7=A7=92=
=E5=86=85=E9=87=8D=E6=96=B0=E6=8F=92=E5=85=A5=E3=80=82
> >      A =E8=AE=BE=E5=A4=87=E5=BA=94=E9=87=8D=E6=96=B0=E6=9E=9A=E4=B8=BE =
B =E8=AE=BE=E5=A4=87=E3=80=82
> >  =20
> > -6) =E6=8B=94=E6=8E=89 B =E8=AE=BE=E5=A4=87=EF=BC=88=E6=8B=94=E6=8E=89 =
micro B =E6=8F=92=E5=A4=B4=EF=BC=89=EF=BC=8C
> > -   =E5=B9=B6=E5=9C=A8 10 =E7=A7=92=E5=90=8E=E9=87=8D=E6=96=B0=E6=8F=92=
=E5=85=A5=EF=BC=9B
> > +6) =E6=8B=94=E6=8E=89 B =E8=AE=BE=E5=A4=87=EF=BC=88=E6=8B=94=E6=8E=89 =
micro B =E6=8F=92=E5=A4=B4=EF=BC=89=EF=BC=8C=E5=B9=B6=E5=9C=A8 10 =E7=A7=92=
=E5=90=8E=E9=87=8D=E6=96=B0=E6=8F=92=E5=85=A5=E3=80=82
> >      A =E8=AE=BE=E5=A4=87=E4=B8=8D=E5=BA=94=E9=87=8D=E6=96=B0=E6=9E=9A=
=E4=B8=BE B =E8=AE=BE=E5=A4=87=E3=80=82
> >  =20
> > -   =E5=A6=82=E6=9E=9C A =E8=AE=BE=E5=A4=87=E5=B8=8C=E6=9C=9B=E4=BD=BF=
=E7=94=A8=E6=80=BB=E7=BA=BF=EF=BC=9A
> > +   =E5=A6=82=E6=9E=9C A =E8=AE=BE=E5=A4=87=E8=BF=98=E6=83=B3=E7=BB=A7=
=E7=BB=AD=E4=BD=BF=E7=94=A8=E6=80=BB=E7=BA=BF=EF=BC=9A
> >  =20
> >      =E5=9C=A8 A =E8=AE=BE=E5=A4=87=E4=B8=8A=E6=89=A7=E8=A1=8C::
> >  =20
> >   	echo 0 >
> > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop echo 1 >
> > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req=20
> > -   =E5=A6=82=E6=9E=9C B =E8=AE=BE=E5=A4=87=E5=B8=8C=E6=9C=9B=E4=BD=BF=
=E7=94=A8=E6=80=BB=E7=BA=BF=EF=BC=9A
> > +   =E5=A6=82=E6=9E=9C B =E8=AE=BE=E5=A4=87=E6=83=B3=E4=BD=BF=E7=94=A8=
=E6=80=BB=E7=BA=BF=EF=BC=9A
> >  =20
> >      =E5=9C=A8 B =E8=AE=BE=E5=A4=87=E4=B8=8A=E6=89=A7=E8=A1=8C::
> >  =20
> > @@ -111,40 +105,38 @@ ChipIdea =E9=AB=98=E9=80=9F=E5=8F=8C=E8=A7=92=E8=
=89=B2=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8
> >  =20
> >   	echo 1 >
> > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req=20
> > -   A =E8=AE=BE=E5=A4=87=E5=BA=94=E6=81=A2=E5=A4=8D USB =E6=80=BB=E7=BA=
=BF=E5=B9=B6=E6=9E=9A=E4=B8=BE B =E8=AE=BE=E5=A4=87=E3=80=82
> > +   A =E8=AE=BE=E5=A4=87=E5=BA=94=E6=81=A2=E5=A4=8D USB =E6=80=BB=E7=BA=
=BF=EF=BC=8C=E5=B9=B6=E6=9E=9A=E4=B8=BE B =E8=AE=BE=E5=A4=87=E3=80=82
> >  =20
> >   1.3 =E5=8F=82=E8=80=83=E6=96=87=E6=A1=A3
> >   ------------
> > -=E3=80=8AOn-The-Go and Embedded Host Supplement
> > -to the USB Revision 2.0 Specification
> > +=E3=80=8AOn-The-Go and Embedded Host Supplement to the USB Revision 2.0
> > Specification July 27, 2012 Revision 2.0 version 1.1a=E3=80=8B
> >  =20
> >   2. =E5=A6=82=E4=BD=95=E5=B0=86 USB =E7=94=A8=E4=BD=9C=E7=B3=BB=E7=BB=
=9F=E5=94=A4=E9=86=92=E6=BA=90
> >   ----------------------------
> > -=E4=B8=8B=E9=9D=A2=E6=98=AF=E5=9C=A8 i.MX6 =E5=B9=B3=E5=8F=B0=E4=B8=8A=
=E6=8A=8A USB =E7=94=A8=E4=BD=9C=E7=B3=BB=E7=BB=9F=E5=94=A4=E9=86=92=E6=BA=
=90=E7=9A=84=E7=A4=BA=E4=BE=8B=E3=80=82
> > +=E4=B8=8B=E9=9D=A2=E7=BB=99=E5=87=BA=E5=9C=A8 i.MX6 =E5=B9=B3=E5=8F=B0=
=E4=B8=8A=E5=B0=86 USB =E7=94=A8=E4=BD=9C=E7=B3=BB=E7=BB=9F=E5=94=A4=E9=86=
=92=E6=BA=90=E7=9A=84=E7=A4=BA=E4=BE=8B=E3=80=82
> >  =20
> > -2.1 =E4=BD=BF=E8=83=BD=E6=A0=B8=E5=BF=83=E6=8E=A7=E5=88=B6=E5=99=A8=E7=
=9A=84=E5=94=A4=E9=86=92=E5=8A=9F=E8=83=BD::
> > +2.1 =E5=90=AF=E7=94=A8=E6=A0=B8=E5=BF=83=E6=8E=A7=E5=88=B6=E5=99=A8=E7=
=9A=84=E5=94=A4=E9=86=92=E5=8A=9F=E8=83=BD::
> >  =20
> >   	echo enabled >
> > /sys/bus/platform/devices/ci_hdrc.0/power/wakeup=20
> > -2.2 =E4=BD=BF=E8=83=BD glue =E5=B1=82=E7=9A=84=E5=94=A4=E9=86=92=E5=8A=
=9F=E8=83=BD::
> > +2.2 =E5=90=AF=E7=94=A8 glue =E5=B1=82=E7=9A=84=E5=94=A4=E9=86=92=E5=8A=
=9F=E8=83=BD::
> >  =20
> >   	echo enabled >
> > /sys/bus/platform/devices/2184000.usb/power/wakeup=20
> > -2.3 =E4=BD=BF=E8=83=BD PHY =E7=9A=84=E5=94=A4=E9=86=92=E5=8A=9F=E8=83=
=BD=EF=BC=88=E5=8F=AF=E9=80=89=EF=BC=89::
> > +2.3 =E5=90=AF=E7=94=A8 PHY =E7=9A=84=E5=94=A4=E9=86=92=E5=8A=9F=E8=83=
=BD=EF=BC=88=E5=8F=AF=E9=80=89=EF=BC=89::
> >  =20
> >   	echo enabled >
> > /sys/bus/platform/devices/20c9000.usbphy/power/wakeup=20
> > -2.4 =E4=BD=BF=E8=83=BD=E6=A0=B9=E9=9B=86=E7=BA=BF=E5=99=A8=E7=9A=84=E5=
=94=A4=E9=86=92=E5=8A=9F=E8=83=BD::
> > +2.4 =E5=90=AF=E7=94=A8=E6=A0=B9=E9=9B=86=E7=BA=BF=E5=99=A8=E7=9A=84=E5=
=94=A4=E9=86=92=E5=8A=9F=E8=83=BD::
> >  =20
> >   	echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
> >  =20
> > -2.5 =E4=BD=BF=E8=83=BD=E7=9B=B8=E5=85=B3=E8=AE=BE=E5=A4=87=E7=9A=84=E5=
=94=A4=E9=86=92=E5=8A=9F=E8=83=BD::
> > +2.5 =E5=90=AF=E7=94=A8=E7=9B=B8=E5=85=B3=E8=AE=BE=E5=A4=87=E7=9A=84=E5=
=94=A4=E9=86=92=E5=8A=9F=E8=83=BD::
> >  =20
> >   	echo enabled > /sys/bus/usb/devices/1-1/power/wakeup
> >  =20
> > -=E5=A6=82=E6=9E=9C=E7=B3=BB=E7=BB=9F=E5=8F=AA=E6=9C=89=E4=B8=80=E4=B8=
=AA USB =E7=AB=AF=E5=8F=A3=EF=BC=8C
> > -=E8=80=8C=E4=BD=A0=E5=B8=8C=E6=9C=9B=E5=9C=A8=E8=AF=A5=E7=AB=AF=E5=8F=
=A3=E4=B8=8A=E5=90=AF=E7=94=A8 USB =E5=94=A4=E9=86=92=E5=8A=9F=E8=83=BD=EF=
=BC=8C
> > -=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8=E4=B8=8B=E9=9D=A2=E7=9A=84=E8=84=
=9A=E6=9C=AC::
> > +=E5=A6=82=E6=9E=9C=E7=B3=BB=E7=BB=9F=E5=8F=AA=E6=9C=89=E4=B8=80=E4=B8=
=AA USB =E7=AB=AF=E5=8F=A3=EF=BC=8C=E8=80=8C=E4=BD=A0=E5=B8=8C=E6=9C=9B=E5=
=9C=A8=E8=AF=A5=E7=AB=AF=E5=8F=A3=E4=B8=8A=E5=90=AF=E7=94=A8 USB
> > =E5=94=A4=E9=86=92=E5=8A=9F=E8=83=BD=EF=BC=8C=E5=8F=AF=E4=BB=A5=E4=BD=
=BF=E7=94=A8 +=E4=B8=8B=E9=9D=A2=E7=9A=84=E8=84=9A=E6=9C=AC::
> >  =20
> >   	for i in $(find /sys -name wakeup | grep usb);do echo
> > enabled > $i;done; diff --git
> > a/Documentation/translations/zh_CN/usb/dwc3.rst
> > b/Documentation/translations/zh_CN/usb/dwc3.rst index
> > 3468ce50c5ba..9584cbbf6d03 100644 ---
> > a/Documentation/translations/zh_CN/usb/dwc3.rst +++
> > b/Documentation/translations/zh_CN/usb/dwc3.rst @@ -18,46 +18,43 @@
> > DWC3 =E9=A9=B1=E5=8A=A8=E5=BE=85=E5=8A=9E ~~~~
> >  =20
> > -=E9=98=85=E8=AF=BB=E6=97=B6=E5=A6=82=E6=9E=9C=E6=83=B3=E9=A1=BA=E6=89=
=8B=E8=AE=A4=E9=A2=86=E7=82=B9=E4=BB=BB=E5=8A=A1=EF=BC=8C=E5=8F=AF=E4=BB=A5=
=E4=BB=8E=E4=B8=8B=E9=9D=A2=E6=8C=91=E4=B8=80=E9=A1=B9 :)
> > +=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=84=BF=E6=84=8F=E6=8E=A5=E6=89=8B=E5=85=
=B6=E4=B8=AD=E4=B8=80=E9=A1=B9=E4=BB=BB=E5=8A=A1=EF=BC=8C=E5=8F=AF=E4=BB=A5=
=E4=BB=8E=E4=B8=8B=E9=9D=A2=E9=80=89=E6=8B=A9=EF=BC=9A
> >  =20
> >   - =E5=B0=86=E4=B8=AD=E6=96=AD=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F=E6=
=94=B9=E4=B8=BA=E6=AF=8F=E4=B8=AA=E7=AB=AF=E7=82=B9=E5=90=84=E8=87=AA=E4=BD=
=BF=E7=94=A8=E7=BA=BF=E7=A8=8B=E5=8C=96 IRQ
> >  =20
> > -  =E4=BA=8B=E5=AE=9E=E8=AF=81=E6=98=8E=EF=BC=8C=E6=9C=89=E4=BA=9B DWC3=
 =E5=91=BD=E4=BB=A4=E5=A4=A7=E7=BA=A6=E9=9C=80=E8=A6=81 ``~1 ms`` =E6=89=8D=
=E8=83=BD=E5=AE=8C=E6=88=90=E3=80=82
> > -  =E5=BD=93=E5=89=8D=E4=BB=A3=E7=A0=81=E4=BC=9A=E4=B8=80=E7=9B=B4=E8=
=87=AA=E6=97=8B=E7=AD=89=E5=BE=85=E5=91=BD=E4=BB=A4=E5=AE=8C=E6=88=90=EF=BC=
=8C=E8=BF=99=E7=A7=8D=E8=AE=BE=E8=AE=A1=E5=B9=B6=E4=B8=8D=E5=A5=BD=E3=80=82
> > +  =E5=AE=9E=E8=B7=B5=E8=A1=A8=E6=98=8E=EF=BC=8C=E6=9F=90=E4=BA=9B DWC3=
 =E5=91=BD=E4=BB=A4=E5=A4=A7=E7=BA=A6=E9=9C=80=E8=A6=81 ``~1 ms``
> > =E6=89=8D=E8=83=BD=E5=AE=8C=E6=88=90=E3=80=82=E5=BD=93=E5=89=8D=E4=BB=
=A3=E7=A0=81=E4=BC=9A=E4=B8=80=E7=9B=B4=E8=87=AA=E6=97=8B
> > +  =E7=AD=89=E5=BE=85=E5=91=BD=E4=BB=A4=E5=AE=8C=E6=88=90=EF=BC=8C=E8=
=BF=99=E5=B9=B6=E4=B8=8D=E6=98=AF=E5=A5=BD=E5=8A=9E=E6=B3=95=E3=80=82
> >  =20
> >     =E5=AE=9E=E7=8E=B0=E6=80=9D=E8=B7=AF=EF=BC=9A
> >  =20
> > -  - DWC =E6=A0=B8=E5=BF=83=E5=AE=9E=E7=8E=B0=E4=BA=86=E4=B8=80=E4=B8=
=AA=E6=8C=89=E7=AB=AF=E7=82=B9=E5=AF=B9=E4=B8=AD=E6=96=AD=E8=BF=9B=E8=A1=8C=
=E8=A7=A3=E5=A4=8D=E7=94=A8=E7=9A=84 IRQ =E6=8E=A7=E5=88=B6=E5=99=A8=E3=80=
=82
> > -    =E4=B8=AD=E6=96=AD=E5=8F=B7=E5=9C=A8=E6=8E=A2=E6=B5=8B=EF=BC=88``p=
robe``=EF=BC=89=E9=98=B6=E6=AE=B5=E5=88=86=E9=85=8D=EF=BC=8C=E5=B9=B6=E5=BD=
=92=E5=B1=9E=E4=BA=8E=E8=AF=A5=E8=AE=BE=E5=A4=87=E3=80=82
> > -    =E5=A6=82=E6=9E=9C=E7=A1=AC=E4=BB=B6=E9=80=9A=E8=BF=87 ``MSI`` =E4=
=B8=BA=E6=AF=8F=E4=B8=AA=E7=AB=AF=E7=82=B9=E6=8F=90=E4=BE=9B=E7=8B=AC=E7=AB=
=8B=E4=B8=AD=E6=96=AD=EF=BC=8C
> > -    =E9=82=A3=E4=B9=88=E8=BF=99=E4=B8=AA=E2=80=9C=E8=99=9A=E6=8B=9F=E2=
=80=9DIRQ =E6=8E=A7=E5=88=B6=E5=99=A8=E5=B0=B1=E5=8F=AF=E4=BB=A5=E8=A2=AB=
=E7=9C=9F=E5=AE=9E=E7=9A=84=E7=AB=AF=E7=82=B9=E4=B8=AD=E6=96=AD=E5=8F=96=E4=
=BB=A3=E3=80=82
> > +  - DWC =E6=A0=B8=E5=BF=83=E5=AE=9E=E7=8E=B0=E4=BA=86=E4=B8=80=E4=B8=
=AA=E6=8C=89=E7=AB=AF=E7=82=B9=E5=88=86=E5=8F=91=E4=B8=AD=E6=96=AD=E7=9A=84=
 IRQ =E6=8E=A7=E5=88=B6=E5=99=A8=E3=80=82=E4=B8=AD=E6=96=AD=E5=8F=B7=E5=9C=
=A8=E6=8E=A2=E6=B5=8B
> > +    =EF=BC=88``probe``=EF=BC=89=E9=98=B6=E6=AE=B5=E5=88=86=E9=85=8D=EF=
=BC=8C=E5=B9=B6=E5=BD=92=E5=B1=9E=E4=BA=8E=E8=AF=A5=E8=AE=BE=E5=A4=87=E3=80=
=82=E5=A6=82=E6=9E=9C=E7=A1=AC=E4=BB=B6=E9=80=9A=E8=BF=87 ``MSI``
> > =E4=B8=BA=E6=AF=8F=E4=B8=AA
> > +    =E7=AB=AF=E7=82=B9=E6=8F=90=E4=BE=9B=E7=8B=AC=E7=AB=8B=E4=B8=AD=E6=
=96=AD=EF=BC=8C=E9=82=A3=E4=B9=88=E8=BF=99=E4=B8=AA=E2=80=9C=E8=99=9A=E6=8B=
=9F=E2=80=9DIRQ
> > =E6=8E=A7=E5=88=B6=E5=99=A8=E5=B0=B1=E5=8F=AF=E4=BB=A5=E8=A2=AB=E7=9C=
=9F=E5=AE=9E=E7=9A=84=E7=AB=AF=E7=82=B9=E4=B8=AD=E6=96=AD
> > +    =E5=8F=96=E4=BB=A3=E3=80=82
> >  =20
> > -  - =E5=9C=A8=E8=B0=83=E7=94=A8 ``usb_ep_enable()`` =E6=97=B6=E8=AF=B7=
=E6=B1=82=E5=B9=B6=E5=88=86=E9=85=8D=E4=B8=AD=E6=96=AD=E8=B5=84=E6=BA=90=EF=
=BC=8C
> > -    =E5=9C=A8=E8=B0=83=E7=94=A8 ``usb_ep_disable()`` =E6=97=B6=E9=87=
=8A=E6=94=BE=E4=B8=AD=E6=96=AD=E8=B5=84=E6=BA=90=E3=80=82
> > -    =E6=9C=80=E5=9D=8F=E6=83=85=E5=86=B5=E4=B8=8B=E9=9C=80=E8=A6=81 32=
 =E4=B8=AA=E4=B8=AD=E6=96=AD=EF=BC=8C=E6=9C=80=E5=B0=91=E6=98=AF ``ep0/1`` =
=E7=9A=84=E4=B8=A4=E4=B8=AA=E4=B8=AD=E6=96=AD=E3=80=82
> > +  - =E5=9C=A8=E8=B0=83=E7=94=A8 ``usb_ep_enable()`` =E6=97=B6=E8=AF=B7=
=E6=B1=82=E5=B9=B6=E5=88=86=E9=85=8D=E4=B8=AD=E6=96=AD=E8=B5=84=E6=BA=90=EF=
=BC=8C=E5=9C=A8=E8=B0=83=E7=94=A8
> > +    ``usb_ep_disable()`` =E6=97=B6=E9=87=8A=E6=94=BE=E4=B8=AD=E6=96=AD=
=E8=B5=84=E6=BA=90=E3=80=82=E6=9C=80=E5=9D=8F=E6=83=85=E5=86=B5=E4=B8=8B=E9=
=9C=80=E8=A6=81 32
> > =E4=B8=AA=E4=B8=AD=E6=96=AD=EF=BC=8C=E6=9C=80=E5=B0=91=E6=98=AF
> > +    ``ep0/1`` =E7=9A=84=E4=B8=A4=E4=B8=AA=E4=B8=AD=E6=96=AD=E3=80=82
> >     - ``dwc3_send_gadget_ep_cmd()`` =E5=B0=86=E5=9C=A8
> > ``wait_for_completion_timeout()`` =E4=B8=AD=E4=BC=91=E7=9C=A0=EF=BC=8C=
=E7=9B=B4=E5=88=B0=E5=91=BD=E4=BB=A4=E5=AE=8C=E6=88=90=E3=80=82
> >     - =E4=B8=AD=E6=96=AD=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F=E5=88=86=
=E4=B8=BA=E4=BB=A5=E4=B8=8B=E5=87=A0=E4=B8=AA=E9=83=A8=E5=88=86=EF=BC=9A
> >  =20
> >       - =E8=AE=BE=E5=A4=87=E7=BA=A7=E4=B8=BB=E4=B8=AD=E6=96=AD=E5=A4=84=
=E7=90=86=E7=A8=8B=E5=BA=8F
> > -      =E9=81=8D=E5=8E=86=E6=AF=8F=E4=B8=AA=E4=BA=8B=E4=BB=B6=EF=BC=8C=
=E5=B9=B6=E5=AF=B9=E5=85=B6=E8=B0=83=E7=94=A8 ``generic_handle_irq()``=E3=
=80=82
> > -      =E4=BB=8E ``generic_handle_irq()``
> > =E8=BF=94=E5=9B=9E=E5=90=8E=EF=BC=8C=E7=A1=AE=E8=AE=A4=E4=BA=8B=E4=BB=
=B6=E8=AE=A1=E6=95=B0=E5=99=A8=EF=BC=8C=E4=BD=BF=E4=B8=AD=E6=96=AD=E6=9C=80=
=E7=BB=88=E6=B6=88=E5=A4=B1=E3=80=82
> > +      =E9=81=8D=E5=8E=86=E6=AF=8F=E4=B8=AA=E4=BA=8B=E4=BB=B6=EF=BC=8C=
=E5=B9=B6=E8=B0=83=E7=94=A8 ``generic_handle_irq()``
> > =E5=A4=84=E7=90=86=E3=80=82=E8=BF=94=E5=9B=9E=E5=90=8E=E5=86=8D=E7=A1=
=AE=E8=AE=A4
> > +      =E4=BA=8B=E4=BB=B6=E8=AE=A1=E6=95=B0=E5=99=A8=EF=BC=8C=E8=AE=A9=
=E4=B8=AD=E6=96=AD=E6=9C=80=E7=BB=88=E6=B6=88=E5=A4=B1=E3=80=82
> >  =20
> >       - =E8=AE=BE=E5=A4=87=E7=BA=A7=E7=BA=BF=E7=A8=8B=E5=8C=96=E5=A4=84=
=E7=90=86=E7=A8=8B=E5=BA=8F
> >         =E6=97=A0=E3=80=82
> >  =20
> >       - =E7=AB=AF=E7=82=B9=E4=B8=AD=E6=96=AD=E7=9A=84=E4=B8=BB=E5=A4=84=
=E7=90=86=E7=A8=8B=E5=BA=8F
> > -      =E8=AF=BB=E5=8F=96=E4=BA=8B=E4=BB=B6=E5=B9=B6=E5=B0=BD=E9=87=8F=
=E5=A4=84=E7=90=86=E5=AE=83=E3=80=82=E5=87=A1=E6=98=AF=E9=9C=80=E8=A6=81=E7=
=9D=A1=E7=9C=A0=E7=9A=84=E6=93=8D=E4=BD=9C=E9=83=BD=E4=BA=A4=E7=BB=99=E7=BA=
=BF=E7=A8=8B=E5=A4=84=E7=90=86=E3=80=82
> > -      =E4=BA=8B=E4=BB=B6=E4=BF=9D=E5=AD=98=E5=9C=A8=E6=AF=8F=E4=B8=AA=
=E7=AB=AF=E7=82=B9=E7=9A=84=E6=95=B0=E6=8D=AE=E7=BB=93=E6=9E=84=E4=B8=AD=E3=
=80=82
> > -      =E8=BF=98=E8=A6=81=E6=B3=A8=E6=84=8F=EF=BC=8C=E4=B8=80=E6=97=A6=
=E6=8A=8A=E6=9F=90=E9=A1=B9=E5=B7=A5=E4=BD=9C=E4=BA=A4=E7=BB=99=E7=BA=BF=E7=
=A8=8B=E5=A4=84=E7=90=86=EF=BC=8C
> > -      =E5=B0=B1=E4=B8=8D=E8=A6=81=E5=86=8D=E5=9C=A8=E4=B8=BB=E5=A4=84=
=E7=90=86=E7=A8=8B=E5=BA=8F=E9=87=8C=E5=A4=84=E7=90=86=E5=AE=83=EF=BC=8C
> > -      =E4=BB=A5=E5=85=8D=E5=87=BA=E7=8E=B0=E4=BC=98=E5=85=88=E7=BA=A7=
=E5=8F=8D=E8=BD=AC=E4=B9=8B=E7=B1=BB=E7=9A=84=E9=97=AE=E9=A2=98=E3=80=82
> > +
> > =E8=AF=BB=E5=8F=96=E4=BA=8B=E4=BB=B6=E5=B9=B6=E5=B0=BD=E9=87=8F=E5=A4=
=84=E7=90=86=EF=BC=9B=E5=87=A1=E6=98=AF=E9=9C=80=E8=A6=81=E7=9D=A1=E7=9C=A0=
=E7=9A=84=E6=93=8D=E4=BD=9C=E9=83=BD=E4=BA=A4=E7=BB=99=E7=BA=BF=E7=A8=8B=E5=
=A4=84=E7=90=86=E3=80=82=E4=BA=8B=E4=BB=B6=E4=BF=9D=E5=AD=98=E5=9C=A8
> > +
> > =E6=AF=8F=E4=B8=AA=E7=AB=AF=E7=82=B9=E7=9A=84=E6=95=B0=E6=8D=AE=E7=BB=
=93=E6=9E=84=E4=B8=AD=E3=80=82=E4=B8=80=E6=97=A6=E6=9F=90=E9=A1=B9=E5=B7=A5=
=E4=BD=9C=E5=B7=B2=E7=BB=8F=E4=BA=A4=E7=BB=99=E7=BA=BF=E7=A8=8B=E5=A4=84=E7=
=90=86=EF=BC=8C=E4=B8=BB=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F=E9=87=8C=E5=B0=
=B1
> > +      =E4=B8=8D=E8=A6=81=E5=86=8D=E7=A2=B0=E5=AE=83=EF=BC=8C=E4=BB=A5=
=E5=85=8D=E5=87=BA=E7=8E=B0=E4=BC=98=E5=85=88=E7=BA=A7=E5=8F=8D=E8=BD=AC=E4=
=B9=8B=E7=B1=BB=E7=9A=84=E9=97=AE=E9=A2=98=E3=80=82
> >  =20
> >       - =E7=AB=AF=E7=82=B9=E4=B8=AD=E6=96=AD=E7=9A=84=E7=BA=BF=E7=A8=8B=
=E5=8C=96=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F
> >         =E5=A4=84=E7=90=86=E5=89=A9=E4=BD=99=E7=9A=84=E7=AB=AF=E7=82=B9=
=E5=B7=A5=E4=BD=9C=EF=BC=8C=E8=BF=99=E4=BA=9B=E5=B7=A5=E4=BD=9C=E5=8F=AF=E8=
=83=BD=E4=BC=9A=E7=9D=A1=E7=9C=A0=EF=BC=8C=E4=BE=8B=E5=A6=82=E7=AD=89=E5=BE=
=85=E5=91=BD=E4=BB=A4=E5=AE=8C=E6=88=90=E3=80=82
> >  =20
> > -  =E5=BB=B6=E8=BF=9F:
> > +  =E5=BB=B6=E8=BF=9F=EF=BC=9A
> >  =20
> > -   =E4=B8=8D=E5=BA=94=E5=A2=9E=E5=8A=A0=E5=BB=B6=E8=BF=9F=EF=BC=8C=E5=
=9B=A0=E4=B8=BA=E4=B8=AD=E6=96=AD=E7=BA=BF=E7=A8=8B=E5=85=B7=E6=9C=89=E8=BE=
=83=E9=AB=98=E4=BC=98=E5=85=88=E7=BA=A7=EF=BC=8C
> > -   =E4=BC=9A=E5=9C=A8=E6=99=AE=E9=80=9A=E7=94=A8=E6=88=B7=E6=80=81=E4=
=BB=BB=E5=8A=A1=E4=B9=8B=E5=89=8D=E8=BF=90=E8=A1=8C
> > +
> > =E4=B8=8D=E5=BA=94=E5=A2=9E=E5=8A=A0=E9=A2=9D=E5=A4=96=E5=BB=B6=E8=BF=
=9F=EF=BC=8C=E5=9B=A0=E4=B8=BA=E4=B8=AD=E6=96=AD=E7=BA=BF=E7=A8=8B=E4=BC=98=
=E5=85=88=E7=BA=A7=E8=BE=83=E9=AB=98=EF=BC=8C=E4=BC=9A=E5=9C=A8=E6=99=AE=E9=
=80=9A=E7=94=A8=E6=88=B7=E4=BB=BB=E5=8A=A1=E4=B9=8B=E5=89=8D=E8=BF=90=E8=A1=
=8C=EF=BC=88=E9=99=A4=E9=9D=9E=E7=94=A8=E6=88=B7=E6=9B=B4=E6=94=B9=E4=BA=86=
=E8=B0=83=E5=BA=A6=E4=BC=98=E5=85=88=E7=BA=A7=EF=BC=89=E3=80=82
> > diff --git a/Documentation/translations/zh_CN/usb/ehci.rst
> > b/Documentation/translations/zh_CN/usb/ehci.rst index
> > e05e493a30d3..c4c52303b13e 100644 ---
> > a/Documentation/translations/zh_CN/usb/ehci.rst +++
> > b/Documentation/translations/zh_CN/usb/ehci.rst @@ -14,45 +14,37 @@
> >   EHCI =E9=A9=B1=E5=8A=A8
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > -2002=E5=B9=B412=E6=9C=8827=E6=97=A5
> > +2002 =E5=B9=B4 12 =E6=9C=88 27 =E6=97=A5
> >  =20
> > -EHCI =E9=A9=B1=E5=8A=A8=E7=94=A8=E4=BA=8E=E9=80=9A=E8=BF=87=E6=94=AF=
=E6=8C=81 USB 2.0 =E7=9A=84=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8
> > -=E7=A1=AC=E4=BB=B6=E4=B8=8E=E9=AB=98=E9=80=9F USB 2.0 =E8=AE=BE=E5=A4=
=87=E9=80=9A=E4=BF=A1=E3=80=82USB 2.0 =E5=85=BC=E5=AE=B9
> > -USB 1.1 =E6=A0=87=E5=87=86=EF=BC=8C=E5=AE=83=E5=AE=9A=E4=B9=89=E4=BA=
=86=E4=B8=89=E7=A7=8D=E4=BC=A0=E8=BE=93=E9=80=9F=E7=8E=87=EF=BC=9A
> > +EHCI =E9=A9=B1=E5=8A=A8=E7=94=A8=E4=BA=8E=E5=80=9F=E5=8A=A9=E6=94=AF=
=E6=8C=81 USB 2.0 =E7=9A=84=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8=EF=
=BC=8C=E4=B8=8E=E9=AB=98=E9=80=9F USB 2.0
> > =E8=AE=BE=E5=A4=87=E9=80=9A=E4=BF=A1=E3=80=82USB +2.0 =E5=90=91=E4=B8=
=8B=E5=85=BC=E5=AE=B9 USB 1.1=EF=BC=8C=E5=B9=B6=E5=AE=9A=E4=B9=89=E4=BA=86=
=E4=B8=89=E7=A7=8D=E4=BC=A0=E8=BE=93=E9=80=9F=E7=8E=87=EF=BC=9A
> >  =20
> >       - =E2=80=9C=E9=AB=98=E9=80=9F=E2=80=9D=EF=BC=88High Speed=EF=BC=
=89480 Mbit/sec=EF=BC=8860 MByte/sec=EF=BC=89
> >       - =E2=80=9C=E5=85=A8=E9=80=9F=E2=80=9D=EF=BC=88Full Speed=EF=BC=
=8912 Mbit/sec=EF=BC=881.5 MByte/sec=EF=BC=89
> >       - =E2=80=9C=E4=BD=8E=E9=80=9F=E2=80=9D=EF=BC=88Low Speed=EF=BC=89=
1.5 Mbit/sec
> >  =20
> > -USB 1.1 =E4=BB=85=E6=94=AF=E6=8C=81=E5=85=A8=E9=80=9F=E4=B8=8E=E4=BD=
=8E=E9=80=9F=E3=80=82
> > -=E9=AB=98=E9=80=9F=E8=AE=BE=E5=A4=87=E5=8F=AF=E4=BB=A5=E5=9C=A8 USB 1.=
1 =E7=B3=BB=E7=BB=9F=E4=B8=8A=E4=BD=BF=E7=94=A8=EF=BC=8C
> > -=E4=BD=86=E9=80=9F=E5=BA=A6=E4=BC=9A=E9=99=8D=E5=88=B0 USB 1.1 =E7=9A=
=84=E9=80=9F=E7=8E=87=E3=80=82
> > +USB 1.1 =E4=BB=85=E6=94=AF=E6=8C=81=E5=85=A8=E9=80=9F=E4=B8=8E=E4=BD=
=8E=E9=80=9F=E3=80=82=E9=AB=98=E9=80=9F=E8=AE=BE=E5=A4=87=E5=8F=AF=E4=BB=A5=
=E5=9C=A8 USB 1.1
> > =E7=B3=BB=E7=BB=9F=E4=B8=8A=E4=BD=BF=E7=94=A8=EF=BC=8C=E4=BD=86=E9=80=
=9F=E5=BA=A6=E4=BC=9A +=E9=99=8D=E5=88=B0 USB 1.1 =E7=9A=84=E9=80=9F=E7=8E=
=87=E3=80=82
> >  =20
> > -USB 1.1 =E8=AE=BE=E5=A4=87=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=9C=A8 USB 2.0=
 =E7=B3=BB=E7=BB=9F=E4=B8=8A=E4=BD=BF=E7=94=A8=E3=80=82=E5=BD=93=E5=AE=83=
=E4=BB=AC
> > -=E6=8F=92=E5=85=A5 EHCI =E6=8E=A7=E5=88=B6=E5=99=A8=E6=97=B6=EF=BC=8C=
=E4=BC=9A=E8=A2=AB=E4=BA=A4=E7=94=B1 USB 1.1 =E7=9A=84=E4=BC=B4=E9=9A=8F
> > -=EF=BC=88companion=EF=BC=89=E6=8E=A7=E5=88=B6=E5=99=A8=E5=A4=84=E7=90=
=86=EF=BC=8C=E8=AF=A5=E6=8E=A7=E5=88=B6=E5=99=A8=E9=80=9A=E5=B8=B8=E6=98=AF=
 OHCI =E6=88=96 UHCI=E3=80=82
> > +USB 1.1 =E8=AE=BE=E5=A4=87=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=9C=A8 USB 2.0=
 =E7=B3=BB=E7=BB=9F=E4=B8=8A=E4=BD=BF=E7=94=A8=E3=80=82=E5=BD=93=E5=AE=83=
=E4=BB=AC=E6=8F=92=E5=85=A5 EHCI
> > =E6=8E=A7=E5=88=B6=E5=99=A8=E6=97=B6=EF=BC=8C=E4=BC=9A=E4=BA=A4=E7=BB=
=99 +USB 1.1
> > =E7=9A=84=E4=BC=B4=E9=9A=8F=EF=BC=88companion=EF=BC=89=E6=8E=A7=E5=88=
=B6=E5=99=A8=E5=A4=84=E7=90=86=EF=BC=8C=E8=AF=A5=E6=8E=A7=E5=88=B6=E5=99=A8=
=E9=80=9A=E5=B8=B8=E6=98=AF OHCI =E6=88=96 UHCI=E3=80=82=20
> > -=E5=BD=93 USB 1.1 =E8=AE=BE=E5=A4=87=E6=8F=92=E5=85=A5 USB 2.0 =E9=9B=
=86=E7=BA=BF=E5=99=A8=E6=97=B6=EF=BC=8C=E5=AE=83=E4=BB=AC=E9=80=9A=E8=BF=87
> > -=E9=9B=86=E7=BA=BF=E5=99=A8=E4=B8=AD=E7=9A=84=E4=BA=8B=E5=8A=A1=E8=BD=
=AC=E6=8D=A2=E5=99=A8=EF=BC=88Transaction Translator=EF=BC=8CTT=EF=BC=89
> > -=E4=B8=8E EHCI =E6=8E=A7=E5=88=B6=E5=99=A8=E4=BA=A4=E4=BA=92=EF=BC=8C=
=E8=AF=A5=E8=BD=AC=E6=8D=A2=E5=99=A8=E5=B0=86=E4=BD=8E=E9=80=9F=E6=88=96=E5=
=85=A8=E9=80=9F=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E4=B8=BA
> > -=E9=AB=98=E9=80=9F=E5=88=86=E5=89=B2=E4=BA=8B=E5=8A=A1=EF=BC=8C=E4=BB=
=8E=E8=80=8C=E9=81=BF=E5=85=8D=E6=B5=AA=E8=B4=B9=E4=BC=A0=E8=BE=93=E5=B8=A6=
=E5=AE=BD=E3=80=82
> > +=E5=BD=93 USB 1.1 =E8=AE=BE=E5=A4=87=E6=8F=92=E5=85=A5 USB 2.0
> > =E9=9B=86=E7=BA=BF=E5=99=A8=E6=97=B6=EF=BC=8C=E5=AE=83=E4=BB=AC=E4=BC=
=9A=E9=80=9A=E8=BF=87=E9=9B=86=E7=BA=BF=E5=99=A8=E9=87=8C=E7=9A=84=E4=BA=8B=
=E5=8A=A1=E8=BD=AC=E6=8D=A2=E5=99=A8 +=EF=BC=88Transaction
> > Translator=EF=BC=8CTT=EF=BC=89=E4=B8=8E EHCI =E6=8E=A7=E5=88=B6=E5=99=
=A8=E9=80=9A=E4=BF=A1=E3=80=82=E8=AF=A5=E8=BD=AC=E6=8D=A2=E5=99=A8=E4=BC=9A=
=E6=8A=8A=E4=BD=8E=E9=80=9F=E6=88=96=E5=85=A8
> > +=E9=80=9F=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E4=B8=BA=E9=AB=98=E9=80=
=9F=E5=88=86=E5=89=B2=E4=BA=8B=E5=8A=A1=EF=BC=8C=E4=BB=8E=E8=80=8C=E9=81=BF=
=E5=85=8D=E6=B5=AA=E8=B4=B9=E4=BC=A0=E8=BE=93=E5=B8=A6=E5=AE=BD=E3=80=82=20
> > -=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=
=8C=E8=AF=A5=E9=A9=B1=E5=8A=A8=E5=B7=B2=E5=9C=A8=E4=BB=A5=E4=B8=8B EHCI =E5=
=AE=9E=E7=8E=B0=E4=B8=8A=E6=88=90=E5=8A=9F=E8=BF=90=E8=A1=8C
> > -=EF=BC=88=E6=8C=89=E5=AD=97=E6=AF=8D=E9=A1=BA=E5=BA=8F=EF=BC=89=EF=BC=
=9AIntel=E3=80=81NEC=E3=80=81Philips =E5=92=8C VIA=E3=80=82
> > -=E5=85=B6=E4=BB=96=E4=BE=9B=E5=BA=94=E5=95=86=E7=9A=84 EHCI =E5=AE=9E=
=E7=8E=B0=E6=AD=A3=E5=9C=A8=E9=99=86=E7=BB=AD=E9=97=AE=E4=B8=96=EF=BC=9B
> > -=E9=A2=84=E8=AE=A1=E8=AF=A5=E9=A9=B1=E5=8A=A8=E5=9C=A8=E8=BF=99=E4=BA=
=9B=E5=AE=9E=E7=8E=B0=E4=B8=8A=E4=B9=9F=E5=8F=AF=E6=AD=A3=E5=B8=B8=E8=BF=90=
=E8=A1=8C=E3=80=82
> > +=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=
=8C=E8=AF=A5=E9=A9=B1=E5=8A=A8=E5=B7=B2=E5=9C=A8=E4=BB=A5=E4=B8=8B EHCI =E5=
=AE=9E=E7=8E=B0=E4=B8=8A=E6=88=90=E5=8A=9F=E8=BF=90=E8=A1=8C=EF=BC=88=E6=8C=
=89=E5=AD=97=E6=AF=8D=E9=A1=BA=E5=BA=8F=EF=BC=89=EF=BC=9A
> > +Intel=E3=80=81NEC=E3=80=81Philips =E5=92=8C VIA=E3=80=82=E9=9A=8F=E7=
=9D=80=E5=85=B6=E4=BB=96=E4=BE=9B=E5=BA=94=E5=95=86=E7=9A=84 EHCI
> > =E5=AE=9E=E7=8E=B0=E9=99=86=E7=BB=AD=E9=97=AE=E4=B8=96=EF=BC=8C=E9=A2=
=84=E8=AE=A1=E8=AF=A5 +=E9=A9=B1=E5=8A=A8=E5=9C=A8=E9=82=A3=E4=BA=9B=E5=AE=
=9E=E7=8E=B0=E4=B8=8A=E4=B9=9F=E8=83=BD=E6=AD=A3=E5=B8=B8=E8=BF=90=E8=A1=8C=
=E3=80=82
> >  =20
> > -=E8=87=AA 2001 =E5=B9=B4=E5=B9=B4=E4=B8=AD=E8=B5=B7=EF=BC=8Cusb-storag=
e =E8=AE=BE=E5=A4=87=E5=B0=B1=E5=B7=B2=E5=8F=AF=E7=94=A8
> > -=EF=BC=88=E5=9C=A8 2.4 =E7=89=88=E8=AF=A5=E9=A9=B1=E5=8A=A8=E4=B8=8A=
=E9=80=9F=E5=BA=A6=E7=9B=B8=E5=BD=93=E4=B8=8D=E9=94=99=EF=BC=89=EF=BC=8C
> > -=E9=9B=86=E7=BA=BF=E5=99=A8=E5=88=99=E7=9B=B4=E5=88=B0 2001 =E5=B9=B4=
=E5=BA=95=E6=89=8D=E5=BC=80=E5=A7=8B=E5=8F=AF=E7=94=A8=EF=BC=8C=E8=80=8C=E5=
=85=B6=E4=BB=96=E7=B1=BB=E5=9E=8B=E7=9A=84=E9=AB=98=E9=80=9F=E8=AE=BE=E5=A4=
=87
> > -=E4=BC=BC=E4=B9=8E=E8=A6=81=E7=AD=89=E5=88=B0=E6=9B=B4=E5=A4=9A=E7=B3=
=BB=E7=BB=9F=E5=86=85=E7=BD=AE USB 2.0 =E5=90=8E=E6=89=8D=E4=BC=9A=E5=87=BA=
=E7=8E=B0=E3=80=82
> > -=E8=BF=99=E7=B1=BB=E6=96=B0=E7=B3=BB=E7=BB=9F=E4=BB=8E 2002 =E5=B9=B4=
=E5=88=9D=E5=BC=80=E5=A7=8B=E4=B8=8A=E5=B8=82=EF=BC=8C
> > -=E5=B9=B6=E5=9C=A8 2002 =E5=B9=B4=E4=B8=8B=E5=8D=8A=E5=B9=B4=E5=8F=98=
=E5=BE=97=E6=9B=B4=E5=8A=A0=E5=B8=B8=E8=A7=81=E3=80=82
> > +=E8=87=AA 2001 =E5=B9=B4=E5=B9=B4=E4=B8=AD=E8=B5=B7=EF=BC=8Cusb-storag=
e =E8=AE=BE=E5=A4=87=E5=B0=B1=E5=B7=B2=E5=8F=AF=E7=94=A8=EF=BC=88=E5=9C=A8 =
2.4
> > =E7=89=88=E8=AF=A5=E9=A9=B1=E5=8A=A8=E4=B8=8A=E9=80=9F=E5=BA=A6=E8=A1=
=A8=E7=8E=B0=E7=9B=B8=E5=BD=93 +=E4=B8=8D=E9=94=99=EF=BC=89=EF=BC=8C=E9=9B=
=86=E7=BA=BF=E5=99=A8=E5=88=99=E7=9B=B4=E5=88=B0 2001
> > =E5=B9=B4=E5=BA=95=E6=89=8D=E5=BC=80=E5=A7=8B=E5=8F=AF=E7=94=A8=E3=80=
=82=E5=85=B6=E4=BB=96=E7=B1=BB=E5=9E=8B=E7=9A=84=E9=AB=98=E9=80=9F=E8=AE=BE=
=E5=A4=87=E4=BC=BC=E4=B9=8E=E8=A6=81=E7=AD=89=E5=88=B0 +=E6=9B=B4=E5=A4=9A=
=E7=B3=BB=E7=BB=9F=E5=86=85=E7=BD=AE USB 2.0
> > =E5=90=8E=E6=89=8D=E4=BC=9A=E5=87=BA=E7=8E=B0=E3=80=82=E8=BF=99=E7=B1=
=BB=E6=96=B0=E7=B3=BB=E7=BB=9F=E4=BB=8E 2002 =E5=B9=B4=E5=88=9D=E5=BC=80=E5=
=A7=8B=E4=B8=8A=E5=B8=82=EF=BC=8C=E5=B9=B6=E5=9C=A8 +2002
> > =E5=B9=B4=E4=B8=8B=E5=8D=8A=E5=B9=B4=E5=8F=98=E5=BE=97=E6=9B=B4=E5=8A=
=A0=E5=B8=B8=E8=A7=81=E3=80=82=20
> > -=E6=B3=A8=E6=84=8F=EF=BC=8CUSB 2.0 =E6=94=AF=E6=8C=81=E5=B9=B6=E4=B8=
=8D=E5=8F=AA=E6=98=AF EHCI =E6=9C=AC=E8=BA=AB=E3=80=82
> > -=E5=AE=83=E8=BF=98=E9=9C=80=E8=A6=81=E5=AF=B9 Linux-USB =E6=A0=B8=E5=
=BF=83 API =E4=BD=9C=E5=87=BA=E5=85=B6=E4=BB=96=E4=BF=AE=E6=94=B9=EF=BC=8C
> > -=E5=8C=85=E6=8B=AC hub =E9=A9=B1=E5=8A=A8=EF=BC=9B=E4=B8=8D=E8=BF=87=
=E8=BF=99=E4=BA=9B=E4=BF=AE=E6=94=B9=E5=B9=B6=E4=B8=8D=E9=9C=80=E8=A6=81=E7=
=9C=9F=E6=AD=A3=E6=94=B9=E5=8F=98
> > -=E6=9A=B4=E9=9C=B2=E7=BB=99 USB =E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=
=E7=9A=84=E5=9F=BA=E6=9C=AC ``usbcore`` API=E3=80=82
> > +=E6=B3=A8=E6=84=8F=EF=BC=8CUSB 2.0 =E7=9A=84=E6=94=AF=E6=8C=81=E5=B9=
=B6=E4=B8=8D=E5=8F=AA=E9=9D=A0 EHCI =E6=9C=AC=E8=BA=AB=E3=80=82=E5=AE=83=E8=
=BF=98=E9=9C=80=E8=A6=81=E5=AF=B9 Linux-USB =E6=A0=B8=E5=BF=83
> > API +=E5=81=9A=E5=85=B6=E4=BB=96=E4=BF=AE=E6=94=B9=EF=BC=8C=E5=8C=85=E6=
=8B=AC hub =E9=A9=B1=E5=8A=A8=EF=BC=9B=E4=B8=8D=E8=BF=87=E8=BF=99=E4=BA=9B=
=E4=BF=AE=E6=94=B9=E5=B9=B6=E4=B8=8D=E9=9C=80=E8=A6=81=E7=9C=9F=E6=AD=A3=E6=
=94=B9=E5=8F=98=E5=90=91 USB
> > =E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8 +=E6=9A=B4=E9=9C=B2=E7=9A=84=E5=9F=
=BA=E6=9C=AC ``usbcore`` API=E3=80=82
> >  =20
> >   - David Brownell
> >     <dbrownell@users.sourceforge.net>
> > @@ -61,58 +53,46 @@ USB 1.1 =E8=AE=BE=E5=A4=87=E4=B9=9F=E5=8F=AF=E4=BB=
=A5=E5=9C=A8 USB 2.0 =E7=B3=BB=E7=BB=9F=E4=B8=8A=E4=BD=BF=E7=94=A8=E3=80=82=
=E5=BD=93=E5=AE=83=E4=BB=AC
> >   =E5=8A=9F=E8=83=BD
> >   =3D=3D=3D=3D
> >  =20
> > -=E8=AF=A5=E9=A9=B1=E5=8A=A8=E4=BC=9A=E5=AE=9A=E6=9C=9F=E5=9C=A8 x86 =
=E7=A1=AC=E4=BB=B6=E4=B8=8A=E8=BF=9B=E8=A1=8C=E6=B5=8B=E8=AF=95=EF=BC=8C
> > -=E4=B9=9F=E5=B7=B2=E5=9C=A8 PPC =E7=A1=AC=E4=BB=B6=E4=B8=8A=E4=BD=BF=
=E7=94=A8=EF=BC=8C=E5=9B=A0=E6=AD=A4=E5=A4=A7=E5=B0=8F=E7=AB=AF=E9=97=AE=E9=
=A2=98=E5=BA=94=E5=BD=93=E5=B7=B2=E7=BB=8F=E8=A7=A3=E5=86=B3=E3=80=82
> > -=E5=9B=A0=E6=AD=A4=E5=8F=AF=E4=BB=A5=E8=AE=A4=E4=B8=BA=EF=BC=8C=E5=AE=
=83=E5=B7=B2=E7=BB=8F=E5=A4=84=E7=90=86=E5=A5=BD=E4=BA=86=E6=89=80=E6=9C=89=
=E5=BF=85=E8=A6=81=E7=9A=84 PCI =E7=BB=86=E8=8A=82=EF=BC=8C
> > -=E6=89=80=E4=BB=A5=E5=8D=B3=E4=BE=BF=E5=9C=A8 DMA =E6=98=A0=E5=B0=84=
=E6=9C=89=E4=BA=9B=E7=89=B9=E6=AE=8A=E7=9A=84=E7=B3=BB=E7=BB=9F=E4=B8=8A=EF=
=BC=8C
> > -I/O =E4=B9=9F=E5=BA=94=E8=83=BD=E6=AD=A3=E5=B8=B8=E8=BF=90=E8=A1=8C=E3=
=80=82
> > +=E8=AF=A5=E9=A9=B1=E5=8A=A8=E9=95=BF=E6=9C=9F=E5=9C=A8 x86 =E7=A1=AC=
=E4=BB=B6=E4=B8=8A=E6=8E=A5=E5=8F=97=E6=B5=8B=E8=AF=95=EF=BC=8C=E4=B9=9F=E5=
=9C=A8 PPC
> > =E5=B9=B3=E5=8F=B0=E4=B8=8A=E4=BD=BF=E7=94=A8=E8=BF=87=EF=BC=8C=E5=9B=
=A0=E6=AD=A4=E5=A4=A7=E5=B0=8F=E7=AB=AF=E9=97=AE=E9=A2=98=E5=BA=94 +=E8=AF=
=A5=E9=83=BD=E5=B7=B2=E8=A7=A3=E5=86=B3=E3=80=82=E5=86=8D=E5=8A=A0=E4=B8=8A=
=E5=90=84=E7=A7=8D=E5=BF=85=E8=A6=81=E7=9A=84 PCI
> > =E7=BB=86=E8=8A=82=E9=83=BD=E5=B7=B2=E5=A4=84=E7=90=86=E5=A6=A5=E5=BD=
=93=EF=BC=8C=E5=8D=B3=E4=BE=BF=E5=9C=A8 DMA =E6=98=A0=E5=B0=84=E8=BE=83=E7=
=89=B9 +=E6=AE=8A=E7=9A=84=E7=B3=BB=E7=BB=9F=E4=B8=8A=EF=BC=8CI/O
> > =E4=B9=9F=E5=BA=94=E8=83=BD=E6=AD=A3=E5=B8=B8=E5=B7=A5=E4=BD=9C=E3=80=
=82=20
> >   =E4=BC=A0=E8=BE=93=E7=B1=BB=E5=9E=8B
> >   --------
> >  =20
> > -=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=
=8C=E8=AF=A5=E9=A9=B1=E5=8A=A8=E5=BA=94=E5=BD=93=E5=B7=B2=E7=BB=8F=E8=83=BD=
=E5=A4=9F=E5=BE=88=E5=A5=BD=E5=9C=B0=E5=A4=84=E7=90=86
> > -=E6=89=80=E6=9C=89=E6=8E=A7=E5=88=B6=E4=BC=A0=E8=BE=93=E3=80=81=E6=89=
=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E5=92=8C=E4=B8=AD=E6=96=AD=E4=BC=A0=E8=BE=93=
=EF=BC=8C
> > -=E5=8C=85=E6=8B=AC=E9=80=9A=E8=BF=87 USB 2.0 =E9=9B=86=E7=BA=BF=E5=99=
=A8=E4=B8=AD=E7=9A=84=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E5=99=A8
> > -=E4=B8=8E USB 1.1 =E8=AE=BE=E5=A4=87=E9=80=9A=E4=BF=A1=EF=BC=9B=E4=BD=
=86=E4=BB=8D=E5=8F=AF=E8=83=BD=E5=AD=98=E5=9C=A8 bug=E3=80=82
> > +=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=
=8C=E8=AF=A5=E9=A9=B1=E5=8A=A8=E5=BA=94=E5=BD=93=E5=B7=B2=E7=BB=8F=E8=83=BD=
=E5=A4=9F=E7=A8=B3=E5=AE=9A=E5=A4=84=E7=90=86=E6=89=80=E6=9C=89=E6=8E=A7=E5=
=88=B6=E4=BC=A0=E8=BE=93=E3=80=81=E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E5=92=
=8C=E4=B8=AD=E6=96=AD=E4=BC=A0
> > +=E8=BE=93=EF=BC=8C=E5=8C=85=E6=8B=AC=E7=BB=8F=E7=94=B1 USB 2.0 =E9=9B=
=86=E7=BA=BF=E5=99=A8=E9=87=8C=E7=9A=84=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=
=E5=99=A8=E8=AE=BF=E9=97=AE USB 1.1
> > =E8=AE=BE=E5=A4=87=EF=BC=9B=E4=B8=8D=E8=BF=87=E4=BB=8D=E5=8F=AF=E8=83=
=BD +=E5=AD=98=E5=9C=A8 bug=E3=80=82
> >  =20
> > -=E9=AB=98=E9=80=9F=E7=AD=89=E6=97=B6=EF=BC=88ISO=EF=BC=89=E4=BC=A0=E8=
=BE=93=E6=94=AF=E6=8C=81=E4=B9=9F=E5=B7=B2=E5=8F=AF=E7=94=A8=EF=BC=8C=E4=BD=
=86=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=8C
> > -=E8=BF=98=E6=B2=A1=E6=9C=89 Linux =E9=A9=B1=E5=8A=A8=E4=BD=BF=E7=94=A8=
=E8=BF=99=E9=A1=B9=E6=94=AF=E6=8C=81=E3=80=82
> > +=E9=AB=98=E9=80=9F=E7=AD=89=E6=97=B6=EF=BC=88ISO=EF=BC=89=E4=BC=A0=E8=
=BE=93=E6=94=AF=E6=8C=81=E4=B9=9F=E5=B7=B2=E5=8F=AF=E7=94=A8=EF=BC=8C=E4=B8=
=8D=E8=BF=87=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=
=EF=BC=8C=E8=BF=98=E6=B2=A1=E6=9C=89 Linux
> > =E9=A9=B1=E5=8A=A8=E7=9C=9F +=E6=AD=A3=E4=BD=BF=E7=94=A8=E5=AE=83=E3=80=
=82
> >  =20
> > -=E7=9B=AE=E5=89=8D=E5=B0=9A=E4=B8=8D=E6=94=AF=E6=8C=81=E9=80=9A=E8=BF=
=87=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E5=99=A8=E5=AE=9E=E7=8E=B0=E5=85=A8=
=E9=80=9F=E7=AD=89=E6=97=B6=E4=BC=A0=E8=BE=93=E3=80=82
> > -=E9=9C=80=E8=A6=81=E6=B3=A8=E6=84=8F=EF=BC=8CISO =E4=BC=A0=E8=BE=93=E7=
=9A=84 split transaction =E6=94=AF=E6=8C=81
> > -=E4=B8=8E=E9=AB=98=E9=80=9F ISO =E4=BC=A0=E8=BE=93=E5=87=A0=E4=B9=8E=
=E6=97=A0=E6=B3=95=E5=85=B1=E7=94=A8=E4=BB=A3=E7=A0=81=EF=BC=8C
> > -=E5=9B=A0=E4=B8=BA EHCI =E7=94=A8=E4=B8=8D=E5=90=8C=E7=9A=84=E6=95=B0=
=E6=8D=AE=E7=BB=93=E6=9E=84=E8=A1=A8=E7=A4=BA=E5=AE=83=E4=BB=AC=E3=80=82
> > -=E5=9B=A0=E6=AD=A4=EF=BC=8C=E7=9B=AE=E5=89=8D=E5=A4=A7=E5=A4=9A=E6=95=
=B0 USB =E9=9F=B3=E9=A2=91=E5=92=8C=E8=A7=86=E9=A2=91=E8=AE=BE=E5=A4=87
> > -=E8=BF=98=E4=B8=8D=E8=83=BD=E9=80=9A=E8=BF=87=E9=AB=98=E9=80=9F=E6=80=
=BB=E7=BA=BF=E8=BF=9E=E6=8E=A5=E4=BD=BF=E7=94=A8=E3=80=82
> > +=E7=9B=AE=E5=89=8D=E5=B0=9A=E4=B8=8D=E6=94=AF=E6=8C=81=E9=80=9A=E8=BF=
=87=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E5=99=A8=E5=AE=9E=E7=8E=B0=E5=85=A8=
=E9=80=9F=E7=AD=89=E6=97=B6=E4=BC=A0=E8=BE=93=E3=80=82=E9=9C=80=E8=A6=81=E6=
=B3=A8=E6=84=8F=EF=BC=8CISO
> > =E4=BC=A0=E8=BE=93=E7=9A=84=E5=88=86=E5=89=B2 +=E4=BA=8B=E5=8A=A1=E6=94=
=AF=E6=8C=81=E4=B8=8E=E9=AB=98=E9=80=9F ISO =E4=BC=A0=E8=BE=93=E5=87=A0=E4=
=B9=8E=E6=97=A0=E6=B3=95=E5=85=B1=E7=94=A8=E4=BB=A3=E7=A0=81=EF=BC=8C=E5=9B=
=A0=E4=B8=BA EHCI
> > =E7=94=A8=E4=B8=8D=E5=90=8C=E7=9A=84=E6=95=B0=E6=8D=AE=E7=BB=93=E6=9E=
=84=E8=A1=A8=E7=A4=BA +=E5=AE=83=E4=BB=AC=E3=80=82=E5=9B=A0=E6=AD=A4=EF=BC=
=8C=E7=9B=AE=E5=89=8D=E5=A4=A7=E5=A4=9A=E6=95=B0 USB
> > =E9=9F=B3=E9=A2=91=E5=92=8C=E8=A7=86=E9=A2=91=E8=AE=BE=E5=A4=87=E8=BF=
=98=E6=97=A0=E6=B3=95=E5=9C=A8=E9=AB=98=E9=80=9F=E6=80=BB=E7=BA=BF=E4=B8=8A=
=E4=BD=BF=E7=94=A8=E3=80=82=20
> >   =E9=A9=B1=E5=8A=A8=E8=A1=8C=E4=B8=BA
> >   --------
> >  =20
> > -=E6=89=80=E6=9C=89=E7=B1=BB=E5=9E=8B=E7=9A=84=E4=BC=A0=E8=BE=93=E9=83=
=BD=E5=8F=AF=E4=BB=A5=E6=8E=92=E9=98=9F=E3=80=82
> > -=E8=BF=99=E6=84=8F=E5=91=B3=E7=9D=80=E6=9D=A5=E8=87=AA=E4=B8=80=E4=B8=
=AA=E6=8E=A5=E5=8F=A3=E9=A9=B1=E5=8A=A8=E7=9A=84=E6=8E=A7=E5=88=B6=E4=BC=A0=
=E8=BE=93
> > -=EF=BC=88=E6=88=96=E9=80=9A=E8=BF=87 usbfs =E5=8F=91=E5=87=BA=E7=9A=84=
=E6=8E=A7=E5=88=B6=E4=BC=A0=E8=BE=93=EF=BC=89=E4=B8=8D=E4=BC=9A=E5=B9=B2=E6=
=89=B0
> > -=E5=8F=A6=E4=B8=80=E4=B8=AA=E9=A9=B1=E5=8A=A8=E7=9A=84=E6=8E=A7=E5=88=
=B6=E4=BC=A0=E8=BE=93=EF=BC=8C=E8=80=8C=E4=B8=94=E4=B8=AD=E6=96=AD=E4=BC=A0=
=E8=BE=93=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8 1 =E5=B8=A7=E7=9A=84=E5=91=A8=
=E6=9C=9F=EF=BC=8C
> > -=E8=80=8C=E4=B8=8D=E5=BF=85=E6=8B=85=E5=BF=83=E4=B8=AD=E6=96=AD=E5=A4=
=84=E7=90=86=E5=BC=80=E9=94=80=E5=AF=BC=E8=87=B4=E7=9A=84=E6=95=B0=E6=8D=AE=
=E4=B8=A2=E5=A4=B1=E3=80=82
> > +=E6=89=80=E6=9C=89=E7=B1=BB=E5=9E=8B=E7=9A=84=E4=BC=A0=E8=BE=93=E9=83=
=BD=E5=8F=AF=E4=BB=A5=E6=8E=92=E9=98=9F=E6=8F=90=E4=BA=A4=E3=80=82=E8=BF=99=
=E6=84=8F=E5=91=B3=E7=9D=80=E6=9F=90=E4=B8=AA=E6=8E=A5=E5=8F=A3=E9=A9=B1=E5=
=8A=A8=E5=8F=91=E5=87=BA=E7=9A=84=E6=8E=A7=E5=88=B6=E4=BC=A0=E8=BE=93=EF=BC=
=88=E6=88=96=E7=BB=8F=E7=94=B1
> > +usbfs =E6=8F=90=E4=BA=A4=E7=9A=84=E6=8E=A7=E5=88=B6=E4=BC=A0=E8=BE=93=
=EF=BC=89=E4=B8=8D=E4=BC=9A=E5=B9=B2=E6=89=B0=E5=85=B6=E4=BB=96=E9=A9=B1=E5=
=8A=A8=E7=9A=84=E6=8E=A7=E5=88=B6=E4=BC=A0=E8=BE=93=EF=BC=8C=E8=80=8C=E4=B8=
=AD=E6=96=AD=E4=BC=A0=E8=BE=93=E5=8F=AF=E4=BB=A5=E6=8C=89
> > 1 =E5=B8=A7 +=E5=91=A8=E6=9C=9F=E8=BF=90=E8=A1=8C=EF=BC=8C=E4=B8=8D=E5=
=BF=85=E6=8B=85=E5=BF=83=E4=B8=AD=E6=96=AD=E5=A4=84=E7=90=86=E5=BC=80=E9=94=
=80=E5=AF=BC=E8=87=B4=E6=95=B0=E6=8D=AE=E4=B8=A2=E5=A4=B1=E3=80=82
> >  =20
> >  =20
> > -EHCI =E6=A0=B9=E9=9B=86=E7=BA=BF=E5=99=A8=E4=BB=A3=E7=A0=81=E4=BC=9A=
=E5=B0=86 USB 1.1 =E8=AE=BE=E5=A4=87=E7=A7=BB=E4=BA=A4=E7=BB=99=E5=85=B6=E4=
=BC=B4=E9=9A=8F=E6=8E=A7=E5=88=B6=E5=99=A8=E3=80=82
> > -=E8=AF=A5=E9=A9=B1=E5=8A=A8=E4=B8=8D=E9=9C=80=E8=A6=81=E4=BA=86=E8=A7=
=A3=E9=82=A3=E4=BA=9B=E9=A9=B1=E5=8A=A8=E7=9A=84=E4=BB=BB=E4=BD=95=E7=BB=86=
=E8=8A=82=EF=BC=9B
> > -=E4=B8=80=E4=B8=AA=E5=8E=9F=E6=9C=AC=E5=B0=B1=E8=83=BD=E6=AD=A3=E5=B8=
=B8=E5=B7=A5=E4=BD=9C=E7=9A=84 OHCI =E6=88=96 UHCI =E9=A9=B1=E5=8A=A8=EF=BC=
=8C
> > -=E5=B9=B6=E4=B8=8D=E4=BC=9A=E5=9B=A0=E4=B8=BA EHCI =E9=A9=B1=E5=8A=A8=
=E4=B9=9F=E5=AD=98=E5=9C=A8=E8=80=8C=E9=9C=80=E8=A6=81=E6=9B=B4=E6=94=B9=E3=
=80=82
> > +EHCI =E6=A0=B9=E9=9B=86=E7=BA=BF=E5=99=A8=E4=BB=A3=E7=A0=81=E4=BC=9A=
=E5=B0=86 USB 1.1
> > =E8=AE=BE=E5=A4=87=E4=BA=A4=E7=BB=99=E5=85=B6=E4=BC=B4=E9=9A=8F=E6=8E=
=A7=E5=88=B6=E5=99=A8=E5=A4=84=E7=90=86=E3=80=82=E8=AF=A5=E9=A9=B1=E5=8A=A8=
=E6=97=A0=E9=9C=80=E4=BA=86=E8=A7=A3
> > +=E9=82=A3=E4=BA=9B=E9=A9=B1=E5=8A=A8=E7=9A=84=E4=BB=BB=E4=BD=95=E7=BB=
=86=E8=8A=82=EF=BC=9B=E4=B8=80=E4=B8=AA=E5=8E=9F=E6=9C=AC=E5=B0=B1=E8=83=BD=
=E6=AD=A3=E5=B8=B8=E5=B7=A5=E4=BD=9C=E7=9A=84 OHCI =E6=88=96 UHCI
> > =E9=A9=B1=E5=8A=A8=EF=BC=8C=E4=B9=9F=E4=B8=8D=E4=BC=9A=E5=9B=A0=E4=B8=
=BA +EHCI =E9=A9=B1=E5=8A=A8=E5=AD=98=E5=9C=A8=E8=80=8C=E9=9C=80=E8=A6=81=
=E4=BF=AE=E6=94=B9=E3=80=82=20
> > -=E7=94=B5=E6=BA=90=E7=AE=A1=E7=90=86=E6=96=B9=E9=9D=A2=E8=BF=98=E6=9C=
=89=E4=B8=80=E4=BA=9B=E9=97=AE=E9=A2=98=EF=BC=9B
> > -=E5=BD=93=E5=89=8D=E6=8C=82=E8=B5=B7/=E6=81=A2=E5=A4=8D=E7=9A=84=E8=A1=
=8C=E4=B8=BA=E8=BF=98=E4=B8=8D=E5=AE=8C=E5=85=A8=E6=AD=A3=E7=A1=AE=E3=80=82
> > +=E7=94=B5=E6=BA=90=E7=AE=A1=E7=90=86=E6=96=B9=E9=9D=A2=E4=BB=8D=E6=9C=
=89=E4=B8=80=E4=BA=9B=E9=97=AE=E9=A2=98=EF=BC=9B=E5=BD=93=E5=89=8D=E6=8C=82=
=E8=B5=B7/=E6=81=A2=E5=A4=8D=E8=A1=8C=E4=B8=BA=E8=BF=98=E4=B8=8D=E5=AE=8C=
=E5=85=A8=E6=AD=A3=E7=A1=AE=E3=80=82
> >  =20
> > -=E6=AD=A4=E5=A4=96=EF=BC=8C=E5=9C=A8=E8=B0=83=E5=BA=A6=E5=91=A8=E6=9C=
=9F=E6=80=A7=E4=BA=8B=E5=8A=A1
> > -=EF=BC=88=E4=B8=AD=E6=96=AD=E5=92=8C=E7=AD=89=E6=97=B6=E4=BC=A0=E8=BE=
=93=EF=BC=89=E6=97=B6=E8=BF=98=E9=87=87=E5=8F=96=E4=BA=86=E4=B8=80=E4=BA=9B=
=E7=AE=80=E5=8C=96=E5=A4=84=E7=90=86=E3=80=82
> > -=E8=BF=99=E4=BA=9B=E7=AE=80=E5=8C=96=E4=BC=9A=E9=99=90=E5=88=B6=E5=8F=
=AF=E8=B0=83=E5=BA=A6=E7=9A=84=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BA=8B=E5=8A=A1=
=E6=95=B0=E9=87=8F=EF=BC=8C
> > -=E5=B9=B6=E4=B8=94=E6=97=A0=E6=B3=95=E4=BD=BF=E7=94=A8=E5=B0=8F=E4=BA=
=8E=E4=B8=80=E5=B8=A7=E7=9A=84=E8=BD=AE=E8=AF=A2=E9=97=B4=E9=9A=94=E3=80=82
> > +=E6=AD=A4=E5=A4=96=EF=BC=8C=E5=9C=A8=E8=B0=83=E5=BA=A6=E5=91=A8=E6=9C=
=9F=E6=80=A7=E4=BA=8B=E5=8A=A1=EF=BC=88=E4=B8=AD=E6=96=AD=E5=92=8C=E7=AD=89=
=E6=97=B6=E4=BC=A0=E8=BE=93=EF=BC=89=E6=97=B6=E8=BF=98=E9=87=87=E5=8F=96=E4=
=BA=86=E4=B8=80=E4=BA=9B=E7=AE=80=E5=8C=96=E5=A4=84=E7=90=86=E3=80=82=E8=BF=
=99=E4=BA=9B
> > +=E7=AE=80=E5=8C=96=E4=BC=9A=E9=99=90=E5=88=B6=E5=8F=AF=E8=B0=83=E5=BA=
=A6=E7=9A=84=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BA=8B=E5=8A=A1=E6=95=B0=E9=87=8F=
=EF=BC=8C=E5=B9=B6=E4=B8=94=E6=97=A0=E6=B3=95=E4=BD=BF=E7=94=A8=E5=B0=8F=E4=
=BA=8E=E4=B8=80=E5=B8=A7=E7=9A=84=E8=BD=AE=E8=AF=A2=E9=97=B4=E9=9A=94=E3=80=
=82
> >  =20
> >   =E4=BD=BF=E7=94=A8=E6=96=B9=E5=BC=8F
> >   =3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > -=E5=81=87=E8=AE=BE=E6=9C=89=E4=B8=80=E4=B8=AA EHCI =E6=8E=A7=E5=88=B6=
=E5=99=A8=EF=BC=88=E4=BD=8D=E4=BA=8E PCI =E5=8D=A1=E6=88=96=E4=B8=BB=E6=9D=
=BF=E4=B8=8A=EF=BC=89=EF=BC=8C
> > -=E5=B9=B6=E4=B8=94=E5=B7=B2=E5=B0=86=E6=AD=A4=E9=A9=B1=E5=8A=A8=E7=BC=
=96=E8=AF=91=E4=B8=BA=E6=A8=A1=E5=9D=97=EF=BC=8C=E5=8F=AF=E8=BF=99=E6=A0=B7=
=E5=8A=A0=E8=BD=BD::
> > +=E5=81=87=E8=AE=BE=E7=B3=BB=E7=BB=9F=E4=B8=AD=E6=9C=89=E4=B8=80=E4=B8=
=AA EHCI =E6=8E=A7=E5=88=B6=E5=99=A8=EF=BC=88=E4=BD=8D=E4=BA=8E PCI
> > =E5=8D=A1=E6=88=96=E4=B8=BB=E6=9D=BF=E4=B8=8A=EF=BC=89=EF=BC=8C=E5=B9=
=B6=E4=B8=94=E6=AD=A4=E9=A9=B1=E5=8A=A8=E6=98=AF=E4=BB=A5=E6=A8=A1=E5=9D=97=
=E5=BD=A2 +=E5=BC=8F=E7=BC=96=E8=AF=91=E7=9A=84=EF=BC=8C=E9=82=A3=E4=B9=88=
=E5=8F=AF=E4=BB=A5=E8=BF=99=E6=A0=B7=E5=8A=A0=E8=BD=BD::
> >  =20
> >       # modprobe ehci-hcd
> >  =20
> > @@ -120,27 +100,24 @@ EHCI =E6=A0=B9=E9=9B=86=E7=BA=BF=E5=99=A8=E4=BB=
=A3=E7=A0=81=E4=BC=9A=E5=B0=86 USB 1.1
> > =E8=AE=BE=E5=A4=87=E7=A7=BB=E4=BA=A4=E7=BB=99=E5=85=B6=E4=BC=B4=E9=9A=
=8F=E6=8E=A7=E5=88=B6=E5=99=A8=E3=80=82=20
> >       # rmmod ehci-hcd
> >  =20
> > -=E8=BF=98=E5=BA=94=E5=8A=A0=E8=BD=BD=E4=B8=80=E4=B8=AA=E4=BC=B4=E9=9A=
=8F=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8=EF=BC=8C
> > -=E4=BE=8B=E5=A6=82 ``ohci-hcd`` =E6=88=96 ``uhci-hcd``=E3=80=82
> > -=E5=A6=82=E6=9E=9C EHCI =E9=A9=B1=E5=8A=A8=E5=87=BA=E7=8E=B0=E4=BB=BB=
=E4=BD=95=E9=97=AE=E9=A2=98=EF=BC=8C=E5=8F=AA=E9=9C=80=E5=8D=B8=E8=BD=BD=E5=
=AE=83=E7=9A=84=E6=A8=A1=E5=9D=97=EF=BC=8C
> > -=E9=9A=8F=E5=90=8E=E8=AF=A5=E4=BC=B4=E9=9A=8F=E6=8E=A7=E5=88=B6=E5=99=
=A8=E9=A9=B1=E5=8A=A8=E5=B0=B1=E4=BC=9A=E6=8E=A5=E6=89=8B
> > -=E6=AD=A4=E5=89=8D=E7=94=B1 EHCI =E9=A9=B1=E5=8A=A8=E5=A4=84=E7=90=86=
=E7=9A=84=E6=89=80=E6=9C=89=E8=AE=BE=E5=A4=87
> > -=EF=BC=88=E4=BD=86=E9=80=9F=E5=BA=A6=E4=BC=9A=E9=99=8D=E4=BD=8E=EF=BC=
=89=E3=80=82
> > +=E8=BF=98=E5=BA=94=E5=8A=A0=E8=BD=BD=E4=B8=80=E4=B8=AA=E4=BC=B4=E9=9A=
=8F=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8=EF=BC=8C=E4=BE=8B=E5=A6=82=
 ``ohci-hcd`` =E6=88=96
> > ``uhci-hcd``=E3=80=82=E5=A6=82=E6=9E=9C EHCI
> > +=E9=A9=B1=E5=8A=A8=E5=87=BA=E4=BA=86=E9=97=AE=E9=A2=98=EF=BC=8C=E5=8F=
=AA=E8=A6=81=E5=8D=B8=E8=BD=BD=E5=AE=83=E7=9A=84=E6=A8=A1=E5=9D=97=EF=BC=8C=
=E4=BC=B4=E9=9A=8F=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8=E5=B0=B1=E4=
=BC=9A=E6=8E=A5=E7=AE=A1=E6=AD=A4=E5=89=8D=E7=94=B1 EHCI
> > =E9=A9=B1=E5=8A=A8=E5=A4=84 +=E7=90=86=E7=9A=84=E5=85=A8=E9=83=A8=E8=AE=
=BE=E5=A4=87=EF=BC=88=E5=8F=AA=E6=98=AF=E9=80=9F=E5=BA=A6=E4=BC=9A=E9=99=8D=
=E4=BD=8E=EF=BC=89=E3=80=82=20
> >   =E6=A8=A1=E5=9D=97=E5=8F=82=E6=95=B0=EF=BC=88=E4=BC=A0=E7=BB=99 ``mod=
probe``=EF=BC=89=E5=8C=85=E6=8B=AC=EF=BC=9A
> >  =20
> >       log2_irq_thresh=EF=BC=88=E9=BB=98=E8=AE=A4=E5=80=BC 0=EF=BC=89=EF=
=BC=9A
> > -        =E9=BB=98=E8=AE=A4=E4=B8=AD=E6=96=AD=E5=BB=B6=E8=BF=9F=E7=9A=
=84 log2 =E5=80=BC=EF=BC=8C=E5=8D=95=E4=BD=8D=E6=98=AF=E5=BE=AE=E5=B8=A7=E3=
=80=82=E9=BB=98=E8=AE=A4=E5=80=BC 0 =E8=A1=A8=E7=A4=BA 1 =E4=B8=AA=E5=BE=AE=
=E5=B8=A7
> > -        =EF=BC=88125 =E5=BE=AE=E7=A7=92=EF=BC=89=E3=80=82=E6=9C=80=E5=
=A4=A7=E5=80=BC 6 =E8=A1=A8=E7=A4=BA 2^6 =3D 64 =E4=B8=AA=E5=BE=AE=E5=B8=A7=
=E3=80=82
> > +        =E9=BB=98=E8=AE=A4=E4=B8=AD=E6=96=AD=E5=BB=B6=E8=BF=9F=E7=9A=
=84 log2 =E5=80=BC=EF=BC=8C=E5=8D=95=E4=BD=8D=E4=B8=BA=E5=BE=AE=E5=B8=A7=E3=
=80=82=E9=BB=98=E8=AE=A4=E5=80=BC 0 =E8=A1=A8=E7=A4=BA 1 =E4=B8=AA=E5=BE=AE=
=E5=B8=A7
> > +        =EF=BC=88125 =E5=BE=AE=E7=A7=92=EF=BC=89=EF=BC=8C=E6=9C=80=E5=
=A4=A7=E5=80=BC 6 =E8=A1=A8=E7=A4=BA 2^6 =3D 64 =E4=B8=AA=E5=BE=AE=E5=B8=A7=
=E3=80=82
> >           =E8=AF=A5=E5=80=BC=E6=8E=A7=E5=88=B6 EHCI =E6=8E=A7=E5=88=B6=
=E5=99=A8=E5=8F=91=E5=87=BA=E4=B8=AD=E6=96=AD=E7=9A=84=E9=A2=91=E7=8E=87=E3=
=80=82
> >  =20
> > -=E5=A6=82=E6=9E=9C=E5=9C=A8 2.5 =E5=86=85=E6=A0=B8=E4=B8=8A=E4=BD=BF=
=E7=94=A8=E6=AD=A4=E9=A9=B1=E5=8A=A8=EF=BC=8C=E5=B9=B6=E4=B8=94=E5=90=AF=E7=
=94=A8=E4=BA=86 USB =E8=B0=83=E8=AF=95=E6=94=AF=E6=8C=81=EF=BC=8C
> > -=E5=88=99=E4=BC=9A=E5=9C=A8=E4=BB=BB=E4=B8=80 EHCI =E6=8E=A7=E5=88=B6=
=E5=99=A8=E7=9A=84 ``sysfs`` =E7=9B=AE=E5=BD=95=E4=B8=AD=E7=9C=8B=E5=88=B0=
=E4=B8=89=E4=B8=AA=E6=96=87=E4=BB=B6=EF=BC=9A
> > +=E5=A6=82=E6=9E=9C=E4=BD=A0=E5=9C=A8 2.5 =E5=86=85=E6=A0=B8=E4=B8=8A=
=E4=BD=BF=E7=94=A8=E6=AD=A4=E9=A9=B1=E5=8A=A8=EF=BC=8C=E5=B9=B6=E4=B8=94=E5=
=90=AF=E7=94=A8=E4=BA=86 USB =E8=B0=83=E8=AF=95=E6=94=AF=E6=8C=81=EF=BC=8C=
=E9=82=A3=E4=B9=88=E4=BB=BB=E4=B8=80
> > EHCI =E6=8E=A7 +=E5=88=B6=E5=99=A8=E5=AF=B9=E5=BA=94=E7=9A=84 ``sysfs``=
 =E7=9B=AE=E5=BD=95=E4=B8=8B=E9=83=BD=E4=BC=9A=E7=9C=8B=E5=88=B0=E4=B8=89=
=E4=B8=AA=E6=96=87=E4=BB=B6=EF=BC=9A
> >  =20
> >       ``async``
> >           =E8=BD=AC=E5=82=A8=E5=BC=82=E6=AD=A5=E8=B0=83=E5=BA=A6=EF=BC=
=8C=E7=94=A8=E4=BA=8E=E6=8E=A7=E5=88=B6=E4=BC=A0=E8=BE=93=E5=92=8C=E6=89=B9=
=E9=87=8F=E4=BC=A0=E8=BE=93=E3=80=82=E5=AE=83=E4=BC=9A=E6=98=BE=E7=A4=BA=E6=
=AF=8F=E4=B8=AA=E6=B4=BB=E5=8A=A8=E7=9A=84
> > ``qh`` =E4=BB=A5=E5=8F=8A=E5=BE=85=E5=A4=84=E7=90=86=E7=9A=84 ``qtd``=
=EF=BC=8C=E9=80=9A=E5=B8=B8=E6=AF=8F=E4=B8=AA ``urb`` =E5=AF=B9=E5=BA=94=E4=
=B8=80=E4=B8=AA ``qtd``=E3=80=82
> > -        =EF=BC=88=E5=8F=AF=E4=BB=A5=E5=9C=A8 ``usb-storage`` =E5=81=9A=
=E7=A3=81=E7=9B=98 I/O
> > =E6=97=B6=E7=9C=8B=E5=AE=83=EF=BC=9B=E9=A1=BA=E4=BE=BF=E8=A7=82=E5=AF=
=9F=E8=AF=B7=E6=B1=82=E9=98=9F=E5=88=97=EF=BC=81=EF=BC=89
> > +        =EF=BC=88=E5=8F=AF=E4=BB=A5=E5=9C=A8 ``usb-storage`` =E6=89=A7=
=E8=A1=8C=E7=A3=81=E7=9B=98 I/O
> > =E6=97=B6=E6=9F=A5=E7=9C=8B=EF=BC=9B=E4=B9=9F=E5=8F=AF=E9=A1=BA=E4=BE=
=BF=E8=A7=82=E5=AF=9F=E8=AF=B7=E6=B1=82=E9=98=9F=E5=88=97=E3=80=82=EF=BC=89=
=20
> >       ``periodic``
> >           =E8=BD=AC=E5=82=A8=E5=91=A8=E6=9C=9F=E6=80=A7=E8=B0=83=E5=BA=
=A6=EF=BC=8C=E7=94=A8=E4=BA=8E=E4=B8=AD=E6=96=AD=E4=BC=A0=E8=BE=93=E5=92=8C=
=E7=AD=89=E6=97=B6=E4=BC=A0=E8=BE=93=E3=80=82=E4=B8=8D=E6=98=BE=E7=A4=BA ``=
qtd``=E3=80=82
> > @@ -151,111 +128,81 @@ EHCI =E6=A0=B9=E9=9B=86=E7=BA=BF=E5=99=A8=E4=BB=
=A3=E7=A0=81=E4=BC=9A=E5=B0=86 USB 1.1
> > =E8=AE=BE=E5=A4=87=E7=A7=BB=E4=BA=A4=E7=BB=99=E5=85=B6=E4=BC=B4=E9=9A=
=8F=E6=8E=A7=E5=88=B6=E5=99=A8=E3=80=82=E8=BF=99=E4=BA=9B=E6=96=87=E4=BB=B6=
=E7=9A=84=E5=86=85=E5=AE=B9=E6=9C=89=E5=8A=A9=E4=BA=8E=E5=AE=9A=E4=BD=8D=E9=
=A9=B1=E5=8A=A8=E9=97=AE=E9=A2=98=E3=80=82
> >  =20
> >  =20
> > -=E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E9=80=9A=E5=B8=B8=E4=B8=8D=E9=9C=
=80=E8=A6=81=E5=85=B3=E5=BF=83=E8=87=AA=E5=B7=B1=E6=98=AF=E5=90=A6=E8=BF=90=
=E8=A1=8C=E5=9C=A8 EHCI =E4=B9=8B=E4=B8=8A=EF=BC=8C
> > -=E4=BD=86=E5=AE=83=E4=BB=AC=E5=8F=AF=E8=83=BD=E6=83=B3=E6=A3=80=E6=9F=
=A5
> > -``usb_device->speed =3D=3D USB_SPEED_HIGH``=E3=80=82
> > -=E9=AB=98=E9=80=9F=E8=AE=BE=E5=A4=87=E8=83=BD=E5=81=9A=E5=88=B0=E5=85=
=A8=E9=80=9F=EF=BC=88=E6=88=96=E4=BD=8E=E9=80=9F=EF=BC=89=E8=AE=BE=E5=A4=87=
=E5=81=9A=E4=B8=8D=E5=88=B0=E7=9A=84=E4=BA=8B=EF=BC=8C
> > -=E4=BE=8B=E5=A6=82=E9=AB=98=E5=B8=A6=E5=AE=BD=E7=9A=84=E5=91=A8=E6=9C=
=9F=E6=80=A7=E4=BC=A0=E8=BE=93=EF=BC=88=E4=B8=AD=E6=96=AD=E6=88=96 ISO =E4=
=BC=A0=E8=BE=93=EF=BC=89=E3=80=82
> > -=E5=8F=A6=E5=A4=96=EF=BC=8C=E8=AE=BE=E5=A4=87=E6=8F=8F=E8=BF=B0=E7=AC=
=A6=E4=B8=AD=E7=9A=84=E6=9F=90=E4=BA=9B=E5=80=BC
> > -=EF=BC=88=E4=BE=8B=E5=A6=82=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=A0=E8=BE=
=93=E7=9A=84=E8=BD=AE=E8=AF=A2=E9=97=B4=E9=9A=94=EF=BC=89
> > -=E5=9C=A8=E9=AB=98=E9=80=9F=E6=A8=A1=E5=BC=8F=E4=B8=8B=E4=BD=BF=E7=94=
=A8=E4=B8=8D=E5=90=8C=E7=9A=84=E7=BC=96=E7=A0=81=E6=96=B9=E5=BC=8F=E3=80=82
> > +=E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E9=80=9A=E5=B8=B8=E4=B8=8D=E9=9C=
=80=E8=A6=81=E5=85=B3=E5=BF=83=E8=87=AA=E5=B7=B1=E6=98=AF=E5=90=A6=E8=BF=90=
=E8=A1=8C=E5=9C=A8 EHCI =E4=B9=8B=E4=B8=8A=EF=BC=8C=E4=BD=86=E6=9C=89=E6=97=
=B6=E5=8F=AF=E8=83=BD=E4=BC=9A=E6=83=B3=E6=A3=80=E6=9F=A5
> > +``usb_device->speed =3D=3D
> > USB_SPEED_HIGH``=E3=80=82=E9=AB=98=E9=80=9F=E8=AE=BE=E5=A4=87=E8=83=BD=
=E5=81=9A=E5=88=B0=E5=85=A8=E9=80=9F=EF=BC=88=E6=88=96=E4=BD=8E=E9=80=9F=EF=
=BC=89=E8=AE=BE=E5=A4=87
> > +=E5=81=9A=E4=B8=8D=E5=88=B0=E7=9A=84=E4=BA=8B=EF=BC=8C=E4=BE=8B=E5=A6=
=82=E9=AB=98=E5=B8=A6=E5=AE=BD=E7=9A=84=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=A0=
=E8=BE=93=EF=BC=88=E4=B8=AD=E6=96=AD=E6=88=96 ISO
> > =E4=BC=A0=E8=BE=93=EF=BC=89=E3=80=82=E5=8F=A6=E5=A4=96=EF=BC=8C=E8=AE=
=BE=E5=A4=87=E6=8F=8F=E8=BF=B0=E7=AC=A6
> > +=E4=B8=AD=E7=9A=84=E6=9F=90=E4=BA=9B=E5=80=BC=EF=BC=88=E4=BE=8B=E5=A6=
=82=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=A0=E8=BE=93=E7=9A=84=E8=BD=AE=E8=AF=A2=
=E9=97=B4=E9=9A=94=EF=BC=89=E5=9C=A8=E9=AB=98=E9=80=9F=E6=A8=A1=E5=BC=8F=E4=
=B8=8B=E4=BD=BF=E7=94=A8=E4=B8=8D=E5=90=8C=E7=9A=84=E7=BC=96=E7=A0=81=E6=96=
=B9=E5=BC=8F=E3=80=82
> > -=E4=B8=8D=E8=BF=87=EF=BC=8C=E4=B8=80=E5=AE=9A=E8=A6=81=E8=AE=A9=E8=AE=
=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E7=BB=8F=E8=BF=87 USB 2.0 =E9=9B=86=E7=BA=BF=
=E5=99=A8=E7=9A=84=E6=B5=8B=E8=AF=95=E3=80=82 -
> > =E5=BD=93=E4=BD=BF=E7=94=A8=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E5=99=
=A8=E6=97=B6=EF=BC=8C=E8=BF=99=E4=BA=9B=E9=9B=86=E7=BA=BF=E5=99=A8=E6=8A=A5=
=E5=91=8A=E6=9F=90=E4=BA=9B=E6=95=85=E9=9A=9C -
> > =EF=BC=88=E4=BE=8B=E5=A6=82=E6=96=AD=E5=BC=80=E8=BF=9E=E6=8E=A5=EF=BC=
=89=E7=9A=84=E6=96=B9=E5=BC=8F=E4=BC=9A=E4=B8=8D=E5=90=8C=EF=BC=9B -=E5=B7=
=B2=E7=BB=8F=E8=A7=81=E8=BF=87=E4=B8=80=E4=BA=9B=E9=A9=B1=E5=8A=A8=E5=9C=A8=
=E9=81=87=E5=88=B0=E4=B8=8E OHCI =E6=88=96
> > UHCI -=E6=89=80=E6=8A=A5=E5=91=8A=E7=9A=84=E4=B8=8D=E5=90=8C=E6=95=85=
=E9=9A=9C=E6=97=B6=E8=A1=A8=E7=8E=B0=E4=B8=8D=E4=BD=B3=E3=80=82
> > +=E4=B8=8D=E8=BF=87=EF=BC=8C=E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E4=B8=
=80=E5=AE=9A=E8=A6=81=E5=9C=A8 USB 2.0
> > =E9=9B=86=E7=BA=BF=E5=99=A8=E5=90=8E=E9=9D=A2=E6=B5=8B=E4=B8=80=E9=81=
=8D=E3=80=82=E4=BD=BF=E7=94=A8=E4=BA=8B=E5=8A=A1=E8=BD=AC=E6=8D=A2=E5=99=A8=
=E6=97=B6=EF=BC=8C=E8=BF=99=E4=BA=9B
> > +=E9=9B=86=E7=BA=BF=E5=99=A8=E6=8A=A5=E5=91=8A=E6=9F=90=E4=BA=9B=E6=95=
=85=E9=9A=9C=EF=BC=88=E4=BE=8B=E5=A6=82=E6=96=AD=E5=BC=80=E8=BF=9E=E6=8E=A5=
=EF=BC=89=E7=9A=84=E6=96=B9=E5=BC=8F=E4=BC=9A=E6=9C=89=E6=89=80=E4=B8=8D=E5=
=90=8C=EF=BC=9B=E5=B7=B2=E7=BB=8F=E8=A7=81=E8=BF=87=E4=B8=80=E4=BA=9B=E9=A9=
=B1=E5=8A=A8=E5=9C=A8
> > +=E9=81=87=E5=88=B0=E4=B8=8E OHCI =E6=88=96 UHCI =E4=B8=8D=E5=90=8C=E7=
=9A=84=E6=95=85=E9=9A=9C=E6=97=B6=E8=A1=A8=E7=8E=B0=E4=B8=8D=E4=BD=B3=E3=80=
=82=20
> >   =E6=80=A7=E8=83=BD
> >   =3D=3D=3D=3D
> >  =20
> > -USB 2.0 =E5=90=9E=E5=90=90=E9=87=8F=E4=B8=BB=E8=A6=81=E5=8F=97=E4=B8=
=A4=E4=B8=AA=E5=9B=A0=E7=B4=A0=E5=88=B6=E7=BA=A6=EF=BC=9A
> > -=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8=E5=A4=84=E7=90=86=E8=AF=
=B7=E6=B1=82=E7=9A=84=E9=80=9F=E5=BA=A6=EF=BC=8C=E4=BB=A5=E5=8F=8A=E8=AE=BE=
=E5=A4=87=E5=93=8D=E5=BA=94=E8=BF=99=E4=BA=9B=E8=AF=B7=E6=B1=82=E7=9A=84=E9=
=80=9F=E5=BA=A6=E3=80=82
> > -480 Mbit/sec =E7=9A=84=E2=80=9C=E5=8E=9F=E5=A7=8B=E4=BC=A0=E8=BE=93=E7=
=8E=87=E2=80=9D=E5=AF=B9=E6=89=80=E6=9C=89=E8=AE=BE=E5=A4=87=E9=83=BD=E6=88=
=90=E7=AB=8B=EF=BC=8C
> > -=E4=BD=86=E6=80=BB=E5=90=9E=E5=90=90=E9=87=8F=E8=BF=98=E4=BC=9A=E5=8F=
=97=E5=88=B0=E8=AF=B8=E5=A6=82=E5=8D=95=E4=B8=AA=E9=AB=98=E9=80=9F=E5=8C=85=
=E4=B9=8B=E9=97=B4=E7=9A=84=E5=BB=B6=E8=BF=9F=E3=80=81
> > -=E9=A9=B1=E5=8A=A8=E6=98=AF=E5=90=A6=E8=B6=B3=E5=A4=9F=E8=81=AA=E6=98=
=8E=EF=BC=8C=E4=BB=A5=E5=8F=8A=E7=B3=BB=E7=BB=9F=E6=95=B4=E4=BD=93=E8=B4=9F=
=E8=BD=BD=E7=AD=89=E5=9B=A0=E7=B4=A0=E7=9A=84=E5=BD=B1=E5=93=8D=E3=80=82
> > -=E5=BB=B6=E8=BF=9F=E4=B9=9F=E6=98=AF=E6=80=A7=E8=83=BD=E8=80=83=E9=87=
=8F=E5=9B=A0=E7=B4=A0=E3=80=82
> > +USB 2.0
> > =E7=9A=84=E5=90=9E=E5=90=90=E9=87=8F=E4=B8=BB=E8=A6=81=E5=8F=97=E4=B8=
=A4=E4=B8=AA=E5=9B=A0=E7=B4=A0=E5=88=B6=E7=BA=A6=EF=BC=9A=E4=B8=BB=E6=9C=BA=
=E6=8E=A7=E5=88=B6=E5=99=A8=E5=A4=84=E7=90=86=E8=AF=B7=E6=B1=82=E7=9A=84=E9=
=80=9F=E5=BA=A6=EF=BC=8C=E4=BB=A5=E5=8F=8A=E8=AE=BE=E5=A4=87=E5=93=8D
> > +=E5=BA=94=E8=BF=99=E4=BA=9B=E8=AF=B7=E6=B1=82=E7=9A=84=E9=80=9F=E5=BA=
=A6=E3=80=82480 Mbit/sec
> > =E7=9A=84=E2=80=9C=E5=8E=9F=E5=A7=8B=E4=BC=A0=E8=BE=93=E7=8E=87=E2=80=
=9D=E5=AF=B9=E6=89=80=E6=9C=89=E8=AE=BE=E5=A4=87=E9=83=BD=E4=B8=80=E6=A0=B7=
=EF=BC=8C=E4=BD=86=E6=95=B4=E4=BD=93=E5=90=9E
> > +=E5=90=90=E9=87=8F=E8=BF=98=E4=BC=9A=E5=8F=97=E5=88=B0=E8=AF=B8=E5=A6=
=82=E9=AB=98=E9=80=9F=E5=8C=85=E4=B9=8B=E9=97=B4=E7=9A=84=E9=97=B4=E9=9A=94=
=E3=80=81=E9=A9=B1=E5=8A=A8=E5=AE=9E=E7=8E=B0=E6=98=AF=E5=90=A6=E8=B6=B3=E5=
=A4=9F=E9=AB=98=E6=95=88=E4=BB=A5=E5=8F=8A=E7=B3=BB=E7=BB=9F=E6=80=BB=E4=BD=
=93=E8=B4=9F=E8=BD=BD=E7=AD=89
> > +=E5=9B=A0=E7=B4=A0=E5=BD=B1=E5=93=8D=E3=80=82=E5=BB=B6=E8=BF=9F=E5=90=
=8C=E6=A0=B7=E6=98=AF=E9=9C=80=E8=A6=81=E8=80=83=E8=99=91=E7=9A=84=E6=80=A7=
=E8=83=BD=E6=8C=87=E6=A0=87=E3=80=82 -
> > =E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E6=9C=80=E5=B8=B8=E7=94=A8=E4=BA=
=8E=E5=85=B3=E6=B3=A8=E5=90=9E=E5=90=90=E9=87=8F=E7=9A=84=E5=9C=BA=E6=99=AF=
=E3=80=82 -=E9=9C=80=E8=A6=81=E8=AE=B0=E4=BD=8F=E7=9A=84=E6=98=AF=EF=BC=8C=
=E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E6=80=BB=E6=98=AF=E4=BB=A5
> > 512 =E5=AD=97=E8=8A=82=E5=8C=85=E4=B8=BA=E5=8D=95=E4=BD=8D=EF=BC=8C -=
=E8=80=8C=E4=B8=80=E4=B8=AA USB 2.0 =E5=BE=AE=E5=B8=A7=E4=B8=AD=E6=9C=80=E5=
=A4=9A=E5=8F=AA=E8=83=BD=E5=AE=B9=E7=BA=B3 13
> > =E4=B8=AA=E8=BF=99=E6=A0=B7=E7=9A=84=E5=8C=85=E3=80=82 -8 =E4=B8=AA USB=
 2.0 =E5=BE=AE=E5=B8=A7=E6=9E=84=E6=88=90=E4=B8=80=E4=B8=AA USB 1.1 =E5=B8=
=A7=EF=BC=9B
> > -=E4=B8=80=E4=B8=AA=E5=BE=AE=E5=B8=A7=E7=9A=84=E6=97=B6=E9=95=BF=E6=98=
=AF 1 =E6=AF=AB=E7=A7=92 / 8 =3D 125 =E5=BE=AE=E7=A7=92=E3=80=82
> > +=E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E9=80=9A=E5=B8=B8=E7=94=A8=E4=BA=
=8E=E7=9C=8B=E9=87=8D=E5=90=9E=E5=90=90=E9=87=8F=E7=9A=84=E5=9C=BA=E6=99=AF=
=E3=80=82=E9=9C=80=E8=A6=81=E8=AE=B0=E4=BD=8F=E7=9A=84=E6=98=AF=EF=BC=8C=E6=
=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E6=80=BB=E6=98=AF=E4=BB=A5 512
> > =E5=AD=97=E8=8A=82=E5=8C=85 +=E4=B8=BA=E5=8D=95=E4=BD=8D=EF=BC=8C=E8=80=
=8C=E4=B8=80=E4=B8=AA USB 2.0 =E5=BE=AE=E5=B8=A7=E4=B8=AD=E6=9C=80=E5=A4=9A=
=E5=8F=AA=E8=83=BD=E5=AE=B9=E7=BA=B3 13 =E4=B8=AA=E8=BF=99=E6=A0=B7=E7=9A=
=84=E5=8C=85=E3=80=828
> > =E4=B8=AA USB 2.0 =E5=BE=AE +=E5=B8=A7=E6=9E=84=E6=88=90=E4=B8=80=E4=B8=
=AA USB 1.1 =E5=B8=A7=EF=BC=8C=E5=9B=A0=E6=AD=A4=E4=B8=80=E4=B8=AA=E5=BE=AE=
=E5=B8=A7=E7=9A=84=E6=97=B6=E9=95=BF=E5=B0=B1=E6=98=AF 125
> > =E5=BE=AE=E7=A7=92=E3=80=82=20
> > -=E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=8F=AA=E8=A6=81=E7=A1=AC=E4=BB=B6=E5=92=
=8C=E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E8=BD=AF=E4=BB=B6=E9=83=BD=E5=85=81=
=E8=AE=B8=EF=BC=8C
> > -=E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E5=8F=AF=E6=8F=90=E4=BE=9B=E8=B6=
=85=E8=BF=87 50 MByte/sec =E7=9A=84=E5=B8=A6=E5=AE=BD=E3=80=82
> > -=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=A0=E8=BE=93=E6=A8=A1=E5=BC=8F=EF=BC=
=88=E7=AD=89=E6=97=B6=E5=92=8C=E4=B8=AD=E6=96=AD=EF=BC=89=E5=85=81=E8=AE=B8=
=E4=BD=BF=E7=94=A8=E6=9B=B4=E5=A4=A7=E7=9A=84=E5=8C=85=E5=A4=A7=E5=B0=8F=EF=
=BC=8C
> > -=E4=BB=8E=E8=80=8C=E5=8F=AF=E4=BB=A5=E9=80=BC=E8=BF=91=E6=89=80=E5=AE=
=A3=E7=A7=B0=E7=9A=84 480 Mbit/sec =E4=BC=A0=E8=BE=93=E7=8E=87=E3=80=82
> > +=E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=8F=AA=E8=A6=81=E7=A1=AC=E4=BB=B6=E5=92=
=8C=E9=A9=B1=E5=8A=A8=E5=AE=9E=E7=8E=B0=E9=83=BD=E8=B6=B3=E5=A4=9F=E6=88=90=
=E7=86=9F=EF=BC=8C=E6=89=B9=E9=87=8F=E4=BC=A0=E8=BE=93=E5=B0=B1=E5=8F=AF=E4=
=BB=A5=E6=8F=90=E4=BE=9B 50
> > MByte/sec =E4=BB=A5=E4=B8=8A
> > +=E7=9A=84=E5=B8=A6=E5=AE=BD=E3=80=82=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=
=A0=E8=BE=93=E6=A8=A1=E5=BC=8F=EF=BC=88=E7=AD=89=E6=97=B6=E5=92=8C=E4=B8=AD=
=E6=96=AD=EF=BC=89=E5=85=81=E8=AE=B8=E4=BD=BF=E7=94=A8=E6=9B=B4=E5=A4=A7=E7=
=9A=84=E5=8C=85=E5=A4=A7=E5=B0=8F=EF=BC=8C=E4=BB=8E=E8=80=8C=E5=8F=AF=E4=BB=
=A5=E9=80=BC=E8=BF=91=E6=89=80
> > +=E5=AE=A3=E7=A7=B0=E7=9A=84 480 Mbit/sec =E4=BC=A0=E8=BE=93=E7=8E=87=
=E3=80=82=20
> >   =E7=A1=AC=E4=BB=B6=E6=80=A7=E8=83=BD
> >   --------
> >  =20
> > -=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=
=8C=E5=8D=95=E4=B8=AA USB 2.0 =E8=AE=BE=E5=A4=87=E7=9A=84=E6=9C=80=E5=A4=A7=
=E4=BC=A0=E8=BE=93=E9=80=9F=E7=8E=87
> > -=E9=80=9A=E5=B8=B8=E7=BA=A6=E4=B8=BA 20 MByte/sec=E3=80=82
> > -=E8=BF=99=E5=BD=93=E7=84=B6=E4=BC=9A=E9=9A=8F=E7=9D=80=E6=97=B6=E9=97=
=B4=E6=94=B9=E5=8F=98=EF=BC=9A=E4=B8=80=E4=BA=9B=E8=AE=BE=E5=A4=87=E7=8E=B0=
=E5=9C=A8=E6=9B=B4=E5=BF=AB=EF=BC=8C=E4=B8=80=E4=BA=9B=E6=9B=B4=E6=85=A2=E3=
=80=82
> > +=E6=88=AA=E8=87=B3=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=
=8C=E5=8D=95=E4=B8=AA USB 2.0 =E8=AE=BE=E5=A4=87=E7=9A=84=E6=9C=80=E5=A4=A7=
=E4=BC=A0=E8=BE=93=E9=80=9F=E7=8E=87=E9=80=9A=E5=B8=B8=E7=BA=A6=E4=B8=BA 20
> > MByte/sec=E3=80=82
> > +=E8=BF=99=E7=A7=8D=E6=83=85=E5=86=B5=E5=BD=93=E7=84=B6=E4=BC=9A=E9=9A=
=8F=E6=97=B6=E9=97=B4=E5=8F=98=E5=8C=96=EF=BC=9A=E6=9C=89=E4=BA=9B=E8=AE=BE=
=E5=A4=87=E7=8E=B0=E5=9C=A8=E6=9B=B4=E5=BF=AB=EF=BC=8C=E6=9C=89=E4=BA=9B=E5=
=88=99=E6=9B=B4=E6=85=A2=E3=80=82=20
> > -=E7=AC=AC=E4=B8=80=E4=BB=A3 NEC EHCI =E5=AE=9E=E7=8E=B0=E4=BC=BC=E4=B9=
=8E=E5=AD=98=E5=9C=A8
> > -=E5=A4=A7=E7=BA=A6 28 MByte/sec =E7=9A=84=E7=A1=AC=E4=BB=B6=E7=93=B6=
=E9=A2=88=E3=80=82
> > -=E8=99=BD=E7=84=B6=E8=BF=99=E5=AF=B9=E5=8D=95=E4=B8=AA 20 MByte/sec =
=E7=9A=84=E8=AE=BE=E5=A4=87=E6=98=BE=E7=84=B6=E5=B7=B2=E7=BB=8F=E5=A4=9F=E7=
=94=A8=EF=BC=8C
> > -=E4=BD=86=E6=8A=8A=E4=B8=89=E4=B8=AA=E8=BF=99=E6=A0=B7=E7=9A=84=E8=AE=
=BE=E5=A4=87=E6=8C=82=E5=88=B0=E5=90=8C=E4=B8=80=E6=80=BB=E7=BA=BF=E4=B8=8A=
=EF=BC=8C
> > -=E5=B9=B6=E4=B8=8D=E8=83=BD=E5=BE=97=E5=88=B0 60 MByte/sec=E3=80=82
> > -=E9=97=AE=E9=A2=98=E4=BC=BC=E4=B9=8E=E5=9C=A8=E4=BA=8E=E6=8E=A7=E5=88=
=B6=E5=99=A8=E7=A1=AC=E4=BB=B6=E6=97=A0=E6=B3=95=E5=B9=B6=E5=8F=91=E8=BF=9B=
=E8=A1=8C USB =E4=B8=8E PCI =E8=AE=BF=E9=97=AE=EF=BC=8C
> > -=E5=9B=A0=E6=AD=A4=E5=AE=83=E6=AF=8F=E4=B8=AA=E5=BE=AE=E5=B8=A7=E5=8F=
=AA=E4=BC=9A=E5=B0=9D=E8=AF=95 6 =E6=AC=A1=EF=BC=88=E4=B9=9F=E8=AE=B8=E6=98=
=AF 7 =E6=AC=A1=EF=BC=89
> > -USB =E4=BA=8B=E5=8A=A1=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF 13 =E6=AC=
=A1=E3=80=82
> > -=EF=BC=88=E5=AF=B9=E4=B8=80=E4=B8=AA=E6=AF=94=E5=85=B6=E4=BB=96=E4=BA=
=A7=E5=93=81=E6=97=A9=E4=B8=8A=E5=B8=82=E4=B8=80=E5=B9=B4=E7=9A=84=E8=8A=AF=
=E7=89=87=E6=9D=A5=E8=AF=B4=EF=BC=8C
> > -=E8=BF=99=E6=98=AF=E4=B8=AA=E5=90=88=E7=90=86=E7=9A=84=E5=A6=A5=E5=8D=
=8F=EF=BC=81=EF=BC=89
> > +=E7=AC=AC=E4=B8=80=E4=BB=A3 NEC EHCI =E5=AE=9E=E7=8E=B0=E4=BC=BC=E4=B9=
=8E=E5=AD=98=E5=9C=A8=E5=A4=A7=E7=BA=A6 28 MByte/sec
> > =E7=9A=84=E7=A1=AC=E4=BB=B6=E7=93=B6=E9=A2=88=E3=80=82=E8=99=BD=E7=84=
=B6=E8=BF=99=E5=AF=B9=E5=8D=95=E4=B8=AA +20 MByte/sec
> > =E7=9A=84=E8=AE=BE=E5=A4=87=E6=98=BE=E7=84=B6=E5=B7=B2=E7=BB=8F=E5=A4=
=9F=E7=94=A8=EF=BC=8C=E4=BD=86=E6=8A=8A=E4=B8=89=E4=B8=AA=E8=BF=99=E6=A0=B7=
=E7=9A=84=E8=AE=BE=E5=A4=87=E6=8C=82=E5=88=B0=E5=90=8C=E4=B8=80=E6=80=BB=E7=
=BA=BF=E4=B8=8A=EF=BC=8C=E5=B9=B6=E4=B8=8D +=E8=83=BD=E5=BE=97=E5=88=B0
> > 60 MByte/sec=E3=80=82=E9=97=AE=E9=A2=98=E4=BC=BC=E4=B9=8E=E5=9C=A8=E4=
=BA=8E=E6=8E=A7=E5=88=B6=E5=99=A8=E7=A1=AC=E4=BB=B6=E6=97=A0=E6=B3=95=E5=B9=
=B6=E5=8F=91=E8=BF=9B=E8=A1=8C USB =E4=B8=8E PCI =E8=AE=BF=E9=97=AE=EF=BC=8C
> > +=E5=9B=A0=E6=AD=A4=E5=AE=83=E6=AF=8F=E4=B8=AA=E5=BE=AE=E5=B8=A7=E5=8F=
=AA=E4=BC=9A=E5=B0=9D=E8=AF=95 6 =E6=AC=A1=EF=BC=88=E4=B9=9F=E8=AE=B8=E6=98=
=AF 7 =E6=AC=A1=EF=BC=89USB =E4=BA=8B=E5=8A=A1=EF=BC=8C=E8=80=8C=E4=B8=8D=
=E6=98=AF 13 =E6=AC=A1=E3=80=82
> > +=EF=BC=88=E5=AF=B9=E4=B8=80=E6=AC=BE=E6=AF=94=E5=85=B6=E4=BB=96=E4=BA=
=A7=E5=93=81=E6=97=A9=E4=B8=8A=E5=B8=82=E4=B8=80=E5=B9=B4=E7=9A=84=E8=8A=AF=
=E7=89=87=E6=9D=A5=E8=AF=B4=EF=BC=8C=E8=BF=99=E6=A0=B7=E7=9A=84=E5=8F=96=E8=
=88=8D=E4=B9=9F=E7=AE=97=E5=90=88=E7=90=86=E3=80=82=EF=BC=89=20
> >  =20
> > -=E9=A2=84=E8=AE=A1=E8=BE=83=E6=96=B0=E7=9A=84=E5=AE=9E=E7=8E=B0=E4=BC=
=9A=E5=9C=A8=E8=BF=99=E6=96=B9=E9=9D=A2=E5=81=9A=E5=BE=97=E6=9B=B4=E5=A5=BD=
=EF=BC=8C
> > -=E9=80=9A=E8=BF=87=E6=8A=95=E5=85=A5=E6=9B=B4=E5=A4=9A=E8=8A=AF=E7=89=
=87=E9=9D=A2=E7=A7=AF=E6=9D=A5=E8=A7=A3=E5=86=B3=E8=BF=99=E4=B8=AA=E9=97=AE=
=E9=A2=98=EF=BC=8C
> > -=E4=BD=BF=E6=96=B0=E7=9A=84=E4=B8=BB=E6=9D=BF=E8=8A=AF=E7=89=87=E7=BB=
=84=E6=9B=B4=E6=8E=A5=E8=BF=91 60 MByte/sec =E7=9A=84=E7=9B=AE=E6=A0=87=E3=
=80=82
> > -=E8=BF=99=E6=97=A2=E5=8C=85=E6=8B=AC NEC =E7=9A=84=E6=9B=B4=E6=96=B0=
=E5=AE=9E=E7=8E=B0=EF=BC=8C=E4=B9=9F=E5=8C=85=E6=8B=AC=E5=85=B6=E4=BB=96=E5=
=8E=82=E5=95=86=E7=9A=84=E8=8A=AF=E7=89=87=E3=80=82
> > +=E9=A2=84=E8=AE=A1=E8=BE=83=E6=96=B0=E7=9A=84=E5=AE=9E=E7=8E=B0=E4=BC=
=9A=E5=9C=A8=E8=BF=99=E6=96=B9=E9=9D=A2=E5=81=9A=E5=BE=97=E6=9B=B4=E5=A5=BD=
=EF=BC=8C=E9=80=9A=E8=BF=87=E6=8A=95=E5=85=A5=E6=9B=B4=E5=A4=9A=E8=8A=AF=E7=
=89=87=E9=9D=A2=E7=A7=AF=E6=9D=A5=E8=A7=A3=E5=86=B3=E8=BF=99=E4=B8=AA=E9=97=
=AE=E9=A2=98=EF=BC=8C
> > +=E4=BD=BF=E6=96=B0=E7=9A=84=E4=B8=BB=E6=9D=BF=E8=8A=AF=E7=89=87=E7=BB=
=84=E6=9B=B4=E6=8E=A5=E8=BF=91 60 MByte/sec =E7=9A=84=E7=9B=AE=E6=A0=87=E3=
=80=82=E8=BF=99=E6=97=A2=E5=8C=85=E6=8B=AC NEC
> > =E7=9A=84=E6=9B=B4=E6=96=B0=E5=AE=9E=E7=8E=B0=EF=BC=8C=E4=B9=9F +=E5=8C=
=85=E6=8B=AC=E5=85=B6=E4=BB=96=E5=8E=82=E5=95=86=E7=9A=84=E8=8A=AF=E7=89=87=
=E3=80=82
> >  =20
> >  =20
> > -=E4=B8=BB=E6=9C=BA=E4=BB=8E EHCI =E6=8E=A7=E5=88=B6=E5=99=A8=E6=94=B6=
=E5=88=B0=E2=80=9C=E8=AF=B7=E6=B1=82=E5=B7=B2=E5=AE=8C=E6=88=90=E2=80=9D=E4=
=B8=AD=E6=96=AD=E7=9A=84=E6=9C=80=E5=B0=8F=E5=BB=B6=E8=BF=9F
> > -=E4=B8=BA=E4=B8=80=E4=B8=AA=E5=BE=AE=E5=B8=A7=EF=BC=88125 =E5=BE=AE=E7=
=A7=92=EF=BC=89=E3=80=82=E8=AF=A5=E5=BB=B6=E8=BF=9F=E5=8F=AF=E4=BB=A5=E8=B0=
=83=E8=8A=82=EF=BC=9B
> > -=E9=A9=B1=E5=8A=A8=E6=8F=90=E4=BE=9B=E4=BA=86=E4=B8=80=E4=B8=AA=E6=A8=
=A1=E5=9D=97=E9=80=89=E9=A1=B9=E3=80=82=E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=
=E4=B8=8B=EF=BC=8C
> > -``ehci-hcd`` =E4=BD=BF=E7=94=A8=E6=9C=80=E5=B0=8F=E5=BB=B6=E8=BF=9F=EF=
=BC=8C=E8=BF=99=E6=84=8F=E5=91=B3=E7=9D=80=E5=BD=93=E5=8F=91=E5=87=BA=E4=B8=
=80=E4=B8=AA=E6=8E=A7=E5=88=B6
> > -=E6=88=96=E6=89=B9=E9=87=8F=E8=AF=B7=E6=B1=82=E6=97=B6=EF=BC=8C=E9=80=
=9A=E5=B8=B8=E5=8F=AF=E4=BB=A5=E5=9C=A8=E4=B8=8D=E5=88=B0 250 =E5=BE=AE=E7=
=A7=92=E5=86=85=E5=BE=97=E7=9F=A5=E5=AE=83=E5=B7=B2=E5=AE=8C=E6=88=90
> > -=EF=BC=88=E5=85=B7=E4=BD=93=E5=8F=96=E5=86=B3=E4=BA=8E=E4=BC=A0=E8=BE=
=93=E5=A4=A7=E5=B0=8F=EF=BC=89=E3=80=82
> > +=E4=B8=BB=E6=9C=BA=E4=BB=8E EHCI =E6=8E=A7=E5=88=B6=E5=99=A8=E6=94=B6=
=E5=88=B0=E2=80=9C=E8=AF=B7=E6=B1=82=E5=B7=B2=E5=AE=8C=E6=88=90=E2=80=9D=E4=
=B8=AD=E6=96=AD=E7=9A=84=E6=9C=80=E5=B0=8F=E5=BB=B6=E8=BF=9F=E4=B8=BA=E4=B8=
=80=E4=B8=AA=E5=BE=AE=E5=B8=A7
> > +=EF=BC=88125 =E5=BE=AE=E7=A7=92=EF=BC=89=E3=80=82=E8=AF=A5=E5=BB=B6=E8=
=BF=9F=E5=8F=AF=E4=BB=A5=E8=B0=83=E8=8A=82=EF=BC=9B=E9=A9=B1=E5=8A=A8=E6=8F=
=90=E4=BE=9B=E4=BA=86=E4=B8=80=E4=B8=AA=E6=A8=A1=E5=9D=97=E9=80=89=E9=A1=B9=
=E3=80=82
> > +=E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C``ehci-hcd``
> > =E4=BD=BF=E7=94=A8=E6=9C=80=E5=B0=8F=E5=BB=B6=E8=BF=9F=EF=BC=8C=E8=BF=
=99=E6=84=8F=E5=91=B3=E7=9D=80=E5=8F=91=E5=87=BA=E6=8E=A7=E5=88=B6=E6=88=96=
=E6=89=B9=E9=87=8F=E8=AF=B7=E6=B1=82=E5=90=8E=EF=BC=8C=E9=80=9A +=E5=B8=B8=
=E4=B8=8D=E5=88=B0 250
> > =E5=BE=AE=E7=A7=92=E5=B0=B1=E8=83=BD=E5=BE=97=E7=9F=A5=E5=AE=83=E5=B7=
=B2=E7=BB=8F=E5=AE=8C=E6=88=90=EF=BC=88=E5=85=B7=E4=BD=93=E5=8F=96=E5=86=B3=
=E4=BA=8E=E4=BC=A0=E8=BE=93=E5=A4=A7=E5=B0=8F=EF=BC=89=E3=80=82=20
> >   =E8=BD=AF=E4=BB=B6=E6=80=A7=E8=83=BD
> >   --------
> >  =20
> > -=E5=8D=B3=E4=BE=BF=E5=8F=AA=E6=98=AF=E8=A6=81=E8=BE=BE=E5=88=B0 20 MBy=
te/sec =E7=9A=84=E4=BC=A0=E8=BE=93=E9=80=9F=E7=8E=87=EF=BC=8C
> > -Linux-USB =E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E4=B9=9F=E5=BF=85=E9=A1=
=BB=E8=AE=A9 EHCI =E9=98=9F=E5=88=97=E5=A7=8B=E7=BB=88=E4=BF=9D=E6=8C=81=E6=
=BB=A1=E8=BD=BD=E3=80=82
> > -=E8=BF=99=E6=84=8F=E5=91=B3=E7=9D=80=E8=A6=81=E5=8F=91=E5=87=BA=E8=BE=
=83=E5=A4=A7=E7=9A=84=E8=AF=B7=E6=B1=82=EF=BC=8C
> > -=E6=88=96=E8=80=85=E5=9C=A8=E9=9C=80=E8=A6=81=E5=8F=91=E5=87=BA=E4=B8=
=80=E8=BF=9E=E4=B8=B2=E5=B0=8F=E8=AF=B7=E6=B1=82=E6=97=B6=E4=BD=BF=E7=94=A8=
=E6=89=B9=E9=87=8F=E8=AF=B7=E6=B1=82=E6=8E=92=E9=98=9F=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E9=A9=B1=E5=8A=A8=E6=9C=AA=E5=81=9A=E5=88=B0=E8=BF=
=99=E4=B8=80=E7=82=B9=EF=BC=8C=E9=82=A3=E4=B9=88=E4=BC=9A=E7=9B=B4=E6=8E=A5=
=E4=BB=8E=E6=80=A7=E8=83=BD=E7=BB=93=E6=9E=9C=E4=B8=8A=E8=A1=A8=E7=8E=B0=E5=
=87=BA=E6=9D=A5=E3=80=82
> > +=E5=8D=B3=E4=BE=BF=E5=8F=AA=E6=98=AF=E8=A6=81=E8=BE=BE=E5=88=B0 20 MBy=
te/sec =E7=9A=84=E4=BC=A0=E8=BE=93=E9=80=9F=E7=8E=87=EF=BC=8CLinux-USB =E8=
=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E4=B9=9F=E5=BF=85=E9=A1=BB=E8=AE=A9
> > EHCI
> > +=E9=98=9F=E5=88=97=E5=A7=8B=E7=BB=88=E4=BF=9D=E6=8C=81=E6=BB=A1=E8=BD=
=BD=E3=80=82=E8=BF=99=E6=84=8F=E5=91=B3=E7=9D=80=E8=A6=81=E5=8F=91=E5=87=BA=
=E8=BE=83=E5=A4=A7=E7=9A=84=E8=AF=B7=E6=B1=82=EF=BC=8C=E6=88=96=E8=80=85=E5=
=9C=A8=E9=9C=80=E8=A6=81=E5=8F=91=E5=87=BA=E4=B8=80=E8=BF=9E=E4=B8=B2=E5=B0=
=8F=E8=AF=B7=E6=B1=82
> > +=E6=97=B6=E4=BD=BF=E7=94=A8=E6=89=B9=E9=87=8F=E8=AF=B7=E6=B1=82=E6=8E=
=92=E9=98=9F=E3=80=82=E5=A6=82=E6=9E=9C=E9=A9=B1=E5=8A=A8=E5=81=9A=E4=B8=8D=
=E5=88=B0=E8=BF=99=E4=B8=80=E7=82=B9=EF=BC=8C=E6=80=A7=E8=83=BD=E5=B0=B1=E4=
=BC=9A=E6=98=8E=E6=98=BE=E5=8F=97=E5=BD=B1=E5=93=8D=E3=80=82=20
> >  =20
> > -=E5=9C=A8=E5=85=B8=E5=9E=8B=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E4=BD=
=BF=E7=94=A8 ``usb_bulk_msg()``
> > -=E4=BB=A5 4 KB =E5=9D=97=E5=BE=AA=E7=8E=AF=E5=86=99=E5=87=BA=EF=BC=8C
> > -=E4=BC=9A=E6=B5=AA=E8=B4=B9=E8=B6=85=E8=BF=87=E4=B8=80=E5=8D=8A=E7=9A=
=84 USB 2.0 =E5=B8=A6=E5=AE=BD=E3=80=82
> > -I/O =E5=AE=8C=E6=88=90=E4=B8=8E=E9=A9=B1=E5=8A=A8=E5=8F=91=E5=87=BA=E4=
=B8=8B=E4=B8=80=E6=AC=A1=E8=AF=B7=E6=B1=82=E4=B9=8B=E9=97=B4=E7=9A=84=E5=BB=
=B6=E8=BF=9F=EF=BC=8C
> > -=E9=80=9A=E5=B8=B8=E4=BC=9A=E6=AF=94=E4=B8=80=E6=AC=A1 I/O =E6=9C=AC=
=E8=BA=AB=E8=80=97=E6=97=B6=E6=9B=B4=E9=95=BF=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E5=90=8C=E6=A0=B7=E7=9A=84=E5=BE=AA=E7=8E=AF=E6=94=
=B9=E7=94=A8 16 KB =E5=9D=97=EF=BC=8C=E4=BC=9A=E5=A5=BD=E4=B8=80=E4=BA=9B=
=EF=BC=9B
> > -=E8=8B=A5=E4=BD=BF=E7=94=A8=E4=B8=80=E8=BF=9E=E4=B8=B2 128 KB =E5=9D=
=97=EF=BC=8C=E5=88=99=E6=B5=AA=E8=B4=B9=E4=BC=9A=E5=B0=91=E5=BE=97=E5=A4=9A=
=E3=80=82
> > +=E5=9C=A8=E5=85=B8=E5=9E=8B=E5=9C=BA=E6=99=AF=E4=B8=8B=EF=BC=8C=E5=A6=
=82=E6=9E=9C=E4=BD=BF=E7=94=A8 ``usb_bulk_msg()`` =E4=BB=A5 4 KB
> > =E5=9D=97=E5=BE=AA=E7=8E=AF=E5=86=99=E5=87=BA=EF=BC=8C=E4=BC=9A=E6=B5=
=AA=E8=B4=B9=E8=B6=85=E8=BF=87 +=E4=B8=80=E5=8D=8A=E7=9A=84 USB 2.0 =E5=B8=
=A6=E5=AE=BD=E3=80=82I/O
> > =E5=AE=8C=E6=88=90=E4=B8=8E=E9=A9=B1=E5=8A=A8=E5=8F=91=E5=87=BA=E4=B8=
=8B=E4=B8=80=E6=AC=A1=E8=AF=B7=E6=B1=82=E4=B9=8B=E9=97=B4=E7=9A=84=E7=A9=BA=
=E6=A1=A3=EF=BC=8C=E5=BE=80=E5=BE=80=E6=AF=94=E4=B8=80=E6=AC=A1 +I/O
> > =E6=9C=AC=E8=BA=AB=E8=80=97=E6=97=B6=E8=BF=98=E9=95=BF=E3=80=82=E5=A6=
=82=E6=9E=9C=E5=90=8C=E6=A0=B7=E7=9A=84=E5=BE=AA=E7=8E=AF=E6=94=B9=E7=94=A8=
 16 KB
> > =E5=9D=97=EF=BC=8C=E6=83=85=E5=86=B5=E4=BC=9A=E5=A5=BD=E4=B8=80=E4=BA=
=9B=EF=BC=9B=E8=8B=A5=E4=BD=BF=E7=94=A8=E4=B8=80=E8=BF=9E=E4=B8=B2 +128 KB =
=E5=9D=97=EF=BC=8C=E5=88=99=E6=B5=AA=E8=B4=B9=E4=BC=9A=E5=B0=91=E5=BE=97=E5=
=A4=9A=E3=80=82=20
> > +=E4=BD=86=E4=B8=8E=E5=85=B6=E4=BE=9D=E8=B5=96=E8=BF=99=E4=B9=88=E5=A4=
=A7=E7=9A=84 I/O =E7=BC=93=E5=86=B2=E5=8C=BA=E6=9D=A5=E6=8F=90=E5=8D=87=E5=
=90=8C=E6=AD=A5 I/O
> > =E7=9A=84=E6=95=88=E7=8E=87=EF=BC=8C=E4=B8=8D=E5=A6=82=E7=9B=B4=E6=8E=
=A5=E5=90=91=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8
> > +=E6=8E=92=E9=98=9F=E6=8F=90=E4=BA=A4=E5=A4=9A=E4=B8=AA=EF=BC=88=E6=89=
=B9=E9=87=8F=EF=BC=89=E8=AF=B7=E6=B1=82=EF=BC=8C=E7=84=B6=E5=90=8E=E7=AD=89=
=E5=BE=85=E5=AE=83=E4=BB=AC=E5=85=A8=E9=83=A8=E5=AE=8C=E6=88=90=EF=BC=88=E6=
=88=96=E5=9C=A8=E5=87=BA=E9=94=99=E6=97=B6=E5=8F=96=E6=B6=88=EF=BC=89=E3=80=
=82=E8=BF=99=E7=A7=8D
> > +URB =E6=8E=92=E9=98=9F=E6=96=B9=E5=BC=8F=E5=AF=B9=E6=89=80=E6=9C=89 US=
B 1.1 =E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8=E5=90=
=8C=E6=A0=B7=E9=80=82=E7=94=A8=E3=80=82=20
> > -=E4=BD=86=E4=B8=8E=E5=85=B6=E4=BE=9D=E8=B5=96=E8=BF=99=E4=B9=88=E5=A4=
=A7=E7=9A=84 I/O =E7=BC=93=E5=86=B2=E5=8C=BA=E6=9D=A5=E8=AE=A9=E5=90=8C=E6=
=AD=A5 I/O =E9=AB=98=E6=95=88=EF=BC=8C
> > -=E4=B8=8D=E5=A6=82=E7=9B=B4=E6=8E=A5=E5=90=91=E4=B8=BB=E6=9C=BA=E6=8E=
=A7=E5=88=B6=E5=99=A8=E6=8E=92=E5=85=A5=E5=A4=9A=E4=B8=AA=EF=BC=88=E6=89=B9=
=E9=87=8F=EF=BC=89=E8=AF=B7=E6=B1=82=EF=BC=8C
> > -=E7=84=B6=E5=90=8E=E7=AD=89=E5=BE=85=E5=AE=83=E4=BB=AC=E5=85=A8=E9=83=
=A8=E5=AE=8C=E6=88=90=EF=BC=88=E6=88=96=E5=9C=A8=E5=87=BA=E9=94=99=E6=97=B6=
=E5=8F=96=E6=B6=88=EF=BC=89=E3=80=82
> > -=E8=BF=99=E7=A7=8D URB =E6=8E=92=E9=98=9F=E6=96=B9=E5=BC=8F=E5=AF=B9=
=E6=89=80=E6=9C=89 USB 1.1
> > -=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=A8=E4=B9=
=9F=E5=90=8C=E6=A0=B7=E9=80=82=E7=94=A8=E3=80=82
> >  =20
> > -
> > -=E5=9C=A8 Linux 2.5 =E5=86=85=E6=A0=B8=E4=B8=AD=EF=BC=8C=E5=AE=9A=E4=
=B9=89=E4=BA=86=E6=96=B0=E7=9A=84 ``usb_sg_*()`` API=EF=BC=9B
> > -=E5=AE=83=E4=BB=AC=E4=BC=9A=E6=8A=8A scatterlist =E4=B8=AD=E7=9A=84=E6=
=89=80=E6=9C=89=E7=BC=93=E5=86=B2=E5=8C=BA=E9=83=BD=E6=8E=92=E5=85=A5=E9=98=
=9F=E5=88=97=E3=80=82
> > -=E5=AE=83=E4=BB=AC=E8=BF=98=E4=BD=BF=E7=94=A8 scatterlist =E7=9A=84 DM=
A =E6=98=A0=E5=B0=84
> > -=EF=BC=88=E5=85=B6=E4=B8=AD=E5=8F=AF=E8=83=BD=E5=BA=94=E7=94=A8 IOMMU=
=EF=BC=89=E5=B9=B6=E5=87=8F=E5=B0=91=E4=B8=AD=E6=96=AD=E6=AC=A1=E6=95=B0=EF=
=BC=8C
> > -=E8=BF=99=E4=BA=9B=E9=83=BD=E6=9C=89=E5=8A=A9=E4=BA=8E=E8=AE=A9=E9=AB=
=98=E9=80=9F=E4=BC=A0=E8=BE=93=E5=B0=BD=E5=8F=AF=E8=83=BD=E5=BF=AB=E5=9C=B0=
=E8=BF=90=E8=A1=8C=E3=80=82
> > +=E5=9C=A8 Linux 2.5 =E5=86=85=E6=A0=B8=E4=B8=AD=EF=BC=8C=E5=AE=9A=E4=
=B9=89=E4=BA=86=E6=96=B0=E7=9A=84 ``usb_sg_*()`` API=EF=BC=9B=E5=AE=83=E4=
=BB=AC=E4=BC=9A=E6=8A=8A
> > scatterlist +=E4=B8=AD=E7=9A=84=E6=89=80=E6=9C=89=E7=BC=93=E5=86=B2=E5=
=8C=BA=E9=83=BD=E6=8E=92=E5=85=A5=E9=98=9F=E5=88=97=E3=80=82=E5=AE=83=E4=BB=
=AC=E8=BF=98=E4=BD=BF=E7=94=A8 scatterlist =E7=9A=84
> > DMA =E6=98=A0=E5=B0=84=EF=BC=88=E5=85=B6=E4=B8=AD=E5=8F=AF=E8=83=BD +=
=E5=BA=94=E7=94=A8
> > IOMMU=EF=BC=89=E5=B9=B6=E5=87=8F=E5=B0=91=E4=B8=AD=E6=96=AD=E6=AC=A1=E6=
=95=B0=EF=BC=8C=E8=BF=99=E4=BA=9B=E9=83=BD=E6=9C=89=E5=8A=A9=E4=BA=8E=E8=AE=
=A9=E9=AB=98=E9=80=9F=E4=BC=A0=E8=BE=93=E5=B0=BD=E5=8F=AF=E8=83=BD=E5=BF=AB=
=E5=9C=B0=E8=BF=90=E8=A1=8C=E3=80=82=20
> >   =E5=BE=85=E5=8A=9E=EF=BC=9A
> >      =E4=B8=AD=E6=96=AD=E4=BC=A0=E8=BE=93=E5=92=8C=E7=AD=89=E6=97=B6=EF=
=BC=88ISO=EF=BC=89=E4=BC=A0=E8=BE=93=E7=9A=84=E6=80=A7=E8=83=BD=E9=97=AE=E9=
=A2=98=E3=80=82
> > -
> > =E8=BF=99=E4=BA=9B=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=A0=E8=BE=93=E9=83=
=BD=E6=98=AF=E5=AE=8C=E5=85=A8=E8=B0=83=E5=BA=A6=E7=9A=84=EF=BC=8C=E5=9B=A0=
=E6=AD=A4=EF=BC=8C=E4=B8=BB=E8=A6=81=E9=97=AE=E9=A2=98=E5=8F=AF=E8=83=BD=E5=
=9C=A8=E4=BA=8E=E5=A6=82=E4=BD=95=E8=A7=A6=E5=8F=91=E9=AB=98=E5=B8=A6=E5=AE=
=BD=E6=A8=A1=E5=BC=8F=E3=80=82
> > +
> > =E8=BF=99=E4=BA=9B=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BC=A0=E8=BE=93=E9=83=
=BD=E6=98=AF=E5=AE=8C=E5=85=A8=E8=B0=83=E5=BA=A6=E7=9A=84=EF=BC=8C=E5=9B=A0=
=E6=AD=A4=E4=B8=BB=E8=A6=81=E9=97=AE=E9=A2=98=E5=8F=AF=E8=83=BD=E5=9C=A8=E4=
=BA=8E=E5=A6=82=E4=BD=95=E8=A7=A6=E5=8F=91=E9=AB=98=E5=B8=A6=E5=AE=BD=E6=A8=
=A1=E5=BC=8F=E3=80=82=20
> >   =E5=BE=85=E5=8A=9E=EF=BC=9A
> > -   =E9=80=9A=E8=BF=87 ``sysfs`` =E4=B8=AD=E7=9A=84 ``uframe_periodic_m=
ax`` =E5=8F=82=E6=95=B0=EF=BC=8C
> > -   =E5=8F=AF=E4=BB=A5=E5=88=86=E9=85=8D=E8=B6=85=E8=BF=87=E6=A0=87=E5=
=87=86 80% =E7=9A=84=E5=91=A8=E6=9C=9F=E6=80=A7=E5=B8=A6=E5=AE=BD=E3=80=82
> > +   =E9=80=9A=E8=BF=87 ``sysfs`` =E4=B8=AD=E7=9A=84 ``uframe_periodic_m=
ax``
> > =E5=8F=82=E6=95=B0=EF=BC=8C=E5=8F=AF=E4=BB=A5=E5=88=86=E9=85=8D=E8=B6=
=85=E8=BF=87=E6=A0=87=E5=87=86
> > +   80% =E7=9A=84=E5=91=A8=E6=9C=9F=E6=80=A7=E5=B8=A6=E5=AE=BD=E3=80=82
> >      =E5=90=8E=E7=BB=AD=E5=B0=86=E5=AF=B9=E6=AD=A4=E8=BF=9B=E8=A1=8C=E8=
=AF=B4=E6=98=8E=E3=80=82
> > diff --git a/Documentation/translations/zh_CN/usb/index.rst
> > b/Documentation/translations/zh_CN/usb/index.rst index
> > eb5aca0c13ec..df99814c6497 100644 ---
> > a/Documentation/translations/zh_CN/usb/index.rst +++
> > b/Documentation/translations/zh_CN/usb/index.rst @@ -1,4 +1,14 @@
> >   .. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. only:: subproject and latex
> > +
> > +   .. raw:: latex
> > +
> > +      \renewcommand{\thesection}{}
> > +      \renewcommand{\thesubsection}{}
> > +      \kerneldocCJKon
> > +      \kerneldocBeginSC{
> > +
> >   .. include:: ../disclaimer-zh_CN.rst
> >  =20
> >   :Original: Documentation/usb/index.rst
> > @@ -24,7 +34,7 @@ USB =E6=94=AF=E6=8C=81
> >       ehci
> >       usbmon
> >  =20
> > -Todolist:
> > +=E5=BE=85=E7=BF=BB=E8=AF=91=E6=96=87=E6=A1=A3=EF=BC=9A
> >  =20
> >   * functionfs
> >   * functionfs-desc
> > @@ -52,3 +62,9 @@ Todolist:
> >      =3D=3D=3D=3D
> >  =20
> >      * :ref:`genindex`
> > +
> > +.. only:: subproject and latex
> > +
> > +   .. raw:: latex
> > +
> > +      }\kerneldocEndSC
> > diff --git a/Documentation/translations/zh_CN/usb/usbmon.rst
> > b/Documentation/translations/zh_CN/usb/usbmon.rst index
> > 11b6d5b59dce..bbfcbf875e26 100644 ---
> > a/Documentation/translations/zh_CN/usb/usbmon.rst +++
> > b/Documentation/translations/zh_CN/usb/usbmon.rst @@ -16,67 +16,56
> > @@ usbmon=20
> >   =E7=AE=80=E4=BB=8B
> >   =3D=3D=3D=3D
> > -=E5=B0=8F=E5=86=99=E5=BD=A2=E5=BC=8F=E7=9A=84 ``usbmon`` =E6=8C=87=E7=
=9A=84=E6=98=AF=E5=86=85=E6=A0=B8=E4=B8=AD=E7=9A=84=E4=B8=80=E9=A1=B9=E5=8A=
=9F=E8=83=BD=EF=BC=8C
> > -=E7=94=A8=E4=BA=8E=E6=94=B6=E9=9B=86 USB =E6=80=BB=E7=BA=BF=E4=B8=8A=
=E7=9A=84 I/O =E8=B7=9F=E8=B8=AA=E4=BF=A1=E6=81=AF=E3=80=82=E5=AE=83=E7=B1=
=BB=E4=BC=BC=E4=BA=8E=E7=BD=91=E7=BB=9C=E7=9B=91=E6=8E=A7=E5=B7=A5=E5=85=B7
> > -``tcpdump(1)`` =E6=88=96 Ethereal =E6=89=80=E4=BD=BF=E7=94=A8=E7=9A=84=
=E6=95=B0=E6=8D=AE=E5=8C=85=E5=A5=97=E6=8E=A5=E5=AD=97=E3=80=82
> > -=E7=B1=BB=E4=BC=BC=E5=9C=B0=EF=BC=8C=E4=BA=BA=E4=BB=AC=E5=B8=8C=E6=9C=
=9B=E4=BD=BF=E7=94=A8 usbdump =E6=88=96 USBMon
> > -=EF=BC=88=E9=A6=96=E5=AD=97=E6=AF=8D=E5=A4=A7=E5=86=99=EF=BC=89=E4=B9=
=8B=E7=B1=BB=E7=9A=84=E5=B7=A5=E5=85=B7=E6=9D=A5=E6=A3=80=E6=9F=A5
> > -usbmon =E7=94=9F=E6=88=90=E7=9A=84=E5=8E=9F=E5=A7=8B=E8=B7=9F=E8=B8=AA=
=E6=95=B0=E6=8D=AE=E3=80=82
> > -
> > -usbmon =E6=8A=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=90=84=E4=B8=AA=E5=A4=96=
=E8=AE=BE=E9=A9=B1=E5=8A=A8
> > -=E5=90=91=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8=E9=A9=B1=E5=8A=
=A8=EF=BC=88HCD=EF=BC=89=E5=8F=91=E5=87=BA=E7=9A=84=E8=AF=B7=E6=B1=82=E3=80=
=82
> > -=E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=A6=82=E6=9E=9C HCD =E6=9C=AC=E8=BA=AB=
=E6=9C=89 bug=EF=BC=8C=E9=82=A3=E4=B9=88 usbmon =E6=8A=A5=E5=91=8A=E7=9A=84=
=E8=B7=9F=E8=B8=AA=E4=BF=A1=E6=81=AF
> > -=E5=8F=AF=E8=83=BD=E6=97=A0=E6=B3=95=E7=B2=BE=E7=A1=AE=E5=AF=B9=E5=BA=
=94=E5=AE=9E=E9=99=85=E7=9A=84=E6=80=BB=E7=BA=BF=E4=BA=8B=E5=8A=A1=E3=80=82
> > -=E8=BF=99=E5=92=8C tcpdump =E7=9A=84=E6=83=85=E5=86=B5=E6=98=AF=E4=B8=
=80=E6=A0=B7=E7=9A=84=E3=80=82
> > -
> > -=E7=9B=AE=E5=89=8D=E5=AE=9E=E7=8E=B0=E4=BA=86=E4=B8=A4=E7=A7=8D API: `=
`text`` =E5=92=8C ``binary``=E3=80=82
> > -=E4=BA=8C=E8=BF=9B=E5=88=B6 API =E9=80=9A=E8=BF=87 ``/dev`` =E5=91=BD=
=E5=90=8D=E7=A9=BA=E9=97=B4=E4=B8=AD=E7=9A=84=E5=AD=97=E7=AC=A6=E8=AE=BE=E5=
=A4=87=E6=8F=90=E4=BE=9B=EF=BC=8C
> > -=E5=B9=B6=E4=B8=94=E5=B1=9E=E4=BA=8E ABI=E3=80=82=E6=96=87=E6=9C=AC AP=
I =E8=87=AA=E5=86=85=E6=A0=B8 2.6.35 =E8=B5=B7=E5=B7=B2=E5=BA=9F=E5=BC=83=
=EF=BC=8C
> > -=E4=BD=86=E4=B8=BA=E4=BA=86=E6=96=B9=E4=BE=BF=E4=BB=8D=E7=84=B6=E5=8F=
=AF=E7=94=A8=E3=80=82
> > +=E5=B0=8F=E5=86=99=E7=9A=84 ``usbmon`` =E6=8C=87=E7=9A=84=E6=98=AF=E5=
=86=85=E6=A0=B8=E4=B8=AD=E7=9A=84=E4=B8=80=E9=A1=B9=E5=8A=9F=E8=83=BD=EF=BC=
=8C=E7=94=A8=E4=BA=8E=E6=94=B6=E9=9B=86 USB =E6=80=BB=E7=BA=BF=E4=B8=8A=E7=
=9A=84
> > I/O =E8=B7=9F=E8=B8=AA +=E4=BF=A1=E6=81=AF=E3=80=82=E5=AE=83=E7=B1=BB=
=E4=BC=BC=E4=BA=8E=E7=BD=91=E7=BB=9C=E7=9B=91=E6=8E=A7=E5=B7=A5=E5=85=B7 ``=
tcpdump(1)`` =E6=88=96 Ethereal
> > =E4=BD=BF=E7=94=A8=E7=9A=84=E6=95=B0=E6=8D=AE=E5=8C=85=E5=A5=97=E6=8E=
=A5 +=E5=AD=97=E3=80=82=E9=80=9A=E5=B8=B8=E4=BC=9A=E7=94=A8 usbdump =E6=88=
=96
> > USBMon=EF=BC=88=E9=A6=96=E5=AD=97=E6=AF=8D=E5=A4=A7=E5=86=99=EF=BC=89=
=E4=B9=8B=E7=B1=BB=E7=9A=84=E5=B7=A5=E5=85=B7=E6=9D=A5=E6=9F=A5=E7=9C=8B us=
bmon =E7=94=9F=E6=88=90 +=E7=9A=84=E5=8E=9F=E5=A7=8B=E8=B7=9F=E8=B8=AA=E6=
=95=B0=E6=8D=AE=E3=80=82
> > +
> > +usbmon
> > =E8=AE=B0=E5=BD=95=E7=9A=84=E6=98=AF=E5=90=84=E4=B8=AA=E8=AE=BE=E5=A4=
=87=E9=A9=B1=E5=8A=A8=E5=90=91=E4=B8=BB=E6=9C=BA=E6=8E=A7=E5=88=B6=E5=99=A8=
=E9=A9=B1=E5=8A=A8=EF=BC=88HCD=EF=BC=89=E5=8F=91=E5=87=BA=E7=9A=84=E8=AF=B7=
=E6=B1=82=E3=80=82=E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=A6=82=E6=9E=9C
> > +HCD =E8=87=AA=E8=BA=AB=E6=9C=89 bug=EF=BC=8Cusbmon
> > =E8=BE=93=E5=87=BA=E7=9A=84=E8=B7=9F=E8=B8=AA=E4=BF=A1=E6=81=AF=E5=B0=
=B1=E6=9C=AA=E5=BF=85=E8=83=BD=E5=92=8C=E7=9C=9F=E5=AE=9E=E7=9A=84=E6=80=BB=
=E7=BA=BF=E4=BA=8B=E5=8A=A1=E4=B8=80=E4=B8=80=E5=AF=B9=E5=BA=94=E3=80=82 +=
=E8=BF=99=E5=92=8C tcpdump
> > =E7=9A=84=E6=83=85=E5=86=B5=E7=B1=BB=E4=BC=BC=E3=80=82 + +=E7=9B=AE=E5=
=89=8D=E5=AE=9E=E7=8E=B0=E4=BA=86=E4=B8=A4=E7=A7=8D API=EF=BC=9A``text`` =
=E5=92=8C ``binary``=E3=80=82=E4=BA=8C=E8=BF=9B=E5=88=B6
> > API =E9=80=9A=E8=BF=87 ``/dev`` =E4=B8=8B=E7=9A=84 +=E5=AD=97=E7=AC=A6=
=E8=AE=BE=E5=A4=87=E6=8F=90=E4=BE=9B=EF=BC=8C=E6=98=AF ABI =E7=9A=84=E4=B8=
=80=E9=83=A8=E5=88=86=E3=80=82=E6=96=87=E6=9C=AC API
> > =E8=87=AA=E5=86=85=E6=A0=B8 2.6.35 =E8=B5=B7=E5=B7=B2=E5=BA=9F=E5=BC=83=
=EF=BC=8C=E4=BD=86=E4=B8=BA=E4=BA=86 +=E5=85=BC=E5=AE=B9=E5=92=8C=E4=BD=BF=
=E7=94=A8=E6=96=B9=E4=BE=BF=EF=BC=8C=E8=87=B3=E4=BB=8A=E4=BB=8D=E7=84=B6=E4=
=BF=9D=E7=95=99=E3=80=82
> >  =20
> >   =E5=A6=82=E4=BD=95=E4=BD=BF=E7=94=A8 usbmon =E6=94=B6=E9=9B=86=E5=8E=
=9F=E5=A7=8B=E6=96=87=E6=9C=AC=E8=B7=9F=E8=B8=AA=E4=BF=A1=E6=81=AF
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > -=E4=B8=8E=E6=95=B0=E6=8D=AE=E5=8C=85=E5=A5=97=E6=8E=A5=E5=AD=97=E4=B8=
=8D=E5=90=8C=EF=BC=8Cusbmon =E6=8F=90=E4=BE=9B=E4=BA=86=E4=B8=80=E7=A7=8D=
=E6=8E=A5=E5=8F=A3=EF=BC=8C
> > -=E5=8F=AF=E4=BB=A5=E8=BE=93=E5=87=BA=E6=96=87=E6=9C=AC=E6=A0=BC=E5=BC=
=8F=E7=9A=84=E8=B7=9F=E8=B8=AA=E4=BF=A1=E6=81=AF=E3=80=82=E8=BF=99=E6=A0=B7=
=E5=81=9A=E6=9C=89=E4=B8=A4=E4=B8=AA=E7=9B=AE=E7=9A=84=EF=BC=9A
> > -=E7=AC=AC=E4=B8=80=EF=BC=8C=E5=9C=A8=E6=9B=B4=E5=AE=8C=E5=96=84=E7=9A=
=84=E6=A0=BC=E5=BC=8F=E6=9C=80=E7=BB=88=E7=A1=AE=E5=AE=9A=E4=B9=8B=E5=89=8D=
=EF=BC=8C
> > -=E5=AE=83=E4=BD=9C=E4=B8=BA=E5=B7=A5=E5=85=B7=E9=97=B4=E9=80=9A=E7=94=
=A8=E7=9A=84=E8=B7=9F=E8=B8=AA=E4=BA=A4=E6=8D=A2=E6=A0=BC=E5=BC=8F=EF=BC=9B
> > -=E7=AC=AC=E4=BA=8C=EF=BC=8C=E5=9C=A8=E4=B8=8D=E4=BD=BF=E7=94=A8=E5=B7=
=A5=E5=85=B7=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E4=BA=BA=E4=BB=AC=
=E4=B9=9F=E5=8F=AF=E4=BB=A5=E7=9B=B4=E6=8E=A5=E9=98=85=E8=AF=BB=E8=BF=99=E4=
=BA=9B=E4=BF=A1=E6=81=AF=E3=80=82
> > +=E4=B8=8E=E6=95=B0=E6=8D=AE=E5=8C=85=E5=A5=97=E6=8E=A5=E5=AD=97=E4=B8=
=8D=E5=90=8C=EF=BC=8Cusbmon
> > =E8=BF=98=E6=8F=90=E4=BE=9B=E4=BA=86=E4=B8=80=E4=B8=AA=E8=BE=93=E5=87=
=BA=E6=96=87=E6=9C=AC=E6=A0=BC=E5=BC=8F=E8=B7=9F=E8=B8=AA=E4=BF=A1=E6=81=AF=
=E7=9A=84=E6=8E=A5=E5=8F=A3=E3=80=82=E8=BF=99=E6=A0=B7
> > +=E5=81=9A=E4=B8=BB=E8=A6=81=E6=9C=89=E4=B8=A4=E4=B8=AA=E7=9B=AE=E7=9A=
=84=EF=BC=9A=E4=B8=80=E6=98=AF=E5=9C=A8=E6=9B=B4=E5=AE=8C=E5=96=84=E7=9A=84=
=E6=A0=BC=E5=BC=8F=E6=9C=80=E7=BB=88=E7=A1=AE=E5=AE=9A=E4=B9=8B=E5=89=8D=EF=
=BC=8C=E5=B0=86=E5=85=B6=E4=BD=9C=E4=B8=BA=E5=B7=A5=E5=85=B7=E9=97=B4=E9=80=
=9A=E7=94=A8=E7=9A=84=E8=B7=9F
> > +=E8=B8=AA=E4=BA=A4=E6=8D=A2=E6=A0=BC=E5=BC=8F=EF=BC=9B=E4=BA=8C=E6=98=
=AF=E5=9C=A8=E6=B2=A1=E6=9C=89=E5=B7=A5=E5=85=B7=E6=97=B6=E4=B9=9F=E8=83=BD=
=E7=9B=B4=E6=8E=A5=E9=98=85=E8=AF=BB=E8=BF=99=E4=BA=9B=E4=BF=A1=E6=81=AF=E3=
=80=82=20
> > -=E8=A6=81=E6=94=B6=E9=9B=86=E5=8E=9F=E5=A7=8B=E6=96=87=E6=9C=AC=E8=B7=
=9F=E8=B8=AA=E4=BF=A1=E6=81=AF=EF=BC=8C=E8=AF=B7=E6=8C=89=E4=BB=A5=E4=B8=8B=
=E6=AD=A5=E9=AA=A4=E8=BF=9B=E8=A1=8C=E6=93=8D=E4=BD=9C=E3=80=82
> > +=E8=A6=81=E6=94=B6=E9=9B=86=E5=8E=9F=E5=A7=8B=E6=96=87=E6=9C=AC=E8=B7=
=9F=E8=B8=AA=E4=BF=A1=E6=81=AF=EF=BC=8C=E6=8C=89=E4=B8=8B=E9=9D=A2=E7=9A=84=
=E6=AD=A5=E9=AA=A4=E5=81=9A=E5=8D=B3=E5=8F=AF=E3=80=82
> >  =20
> >   1. =E5=87=86=E5=A4=87
> >   -------
> >  =20
> > -=E6=8C=82=E8=BD=BD debugfs=EF=BC=88=E5=86=85=E6=A0=B8=E9=85=8D=E7=BD=
=AE=E4=B8=AD=E5=BF=85=E9=A1=BB=E5=90=AF=E7=94=A8=E5=AE=83=EF=BC=89=EF=BC=8C=
=E5=B9=B6=E5=8A=A0=E8=BD=BD usbmon =E6=A8=A1=E5=9D=97
> > -=EF=BC=88=E5=A6=82=E6=9E=9C=E5=AE=83=E6=98=AF=E4=BD=9C=E4=B8=BA=E6=A8=
=A1=E5=9D=97=E6=9E=84=E5=BB=BA=E7=9A=84=EF=BC=89=E3=80=82=E5=A6=82=E6=9E=9C=
 usbmon =E5=B7=B2=E7=BB=8F=E7=BC=96=E5=85=A5=E5=86=85=E6=A0=B8=EF=BC=8C
> > -=E9=82=A3=E4=B9=88=E7=AC=AC=E4=BA=8C=E6=AD=A5=E5=8F=AF=E4=BB=A5=E7=9C=
=81=E7=95=A5=E3=80=82
> > +=E6=8C=82=E8=BD=BD debugfs=EF=BC=88=E5=86=85=E6=A0=B8=E9=85=8D=E7=BD=
=AE=E9=87=8C=E5=BF=85=E9=A1=BB=E5=90=AF=E7=94=A8=E5=AE=83=EF=BC=89=EF=BC=8C=
=E5=B9=B6=E5=8A=A0=E8=BD=BD usbmon
> > =E6=A8=A1=E5=9D=97=EF=BC=88=E5=A6=82=E6=9E=9C=E5=AE=83=E6=98=AF=E4=BB=
=A5=E6=A8=A1=E5=9D=97 +=E6=96=B9=E5=BC=8F=E6=9E=84=E5=BB=BA=E7=9A=84=EF=BC=
=89=E3=80=82=E5=A6=82=E6=9E=9C usbmon
> > =E5=B7=B2=E7=BB=8F=E7=BC=96=E8=AF=91=E8=BF=9B=E5=86=85=E6=A0=B8=EF=BC=
=8C=E8=BF=99=E4=B8=80=E6=AD=A5=E5=B0=B1=E5=8F=AF=E4=BB=A5=E7=9C=81=E7=95=A5=
=E3=80=82=20
> >   =E5=91=BD=E4=BB=A4=E7=A4=BA=E4=BE=8B::
> >  =20
> > -    # mount -t debugfs none_debugs /sys/kernel/debug
> > +    # mount -t debugfs none /sys/kernel/debug
> >       # modprobe usbmon
> >       #
> >  =20
> > -=E7=A1=AE=E8=AE=A4=E6=80=BB=E7=BA=BF=E5=A5=97=E6=8E=A5=E5=AD=97=E6=98=
=AF=E5=90=A6=E5=AD=98=E5=9C=A8::
> > +=E7=A1=AE=E8=AE=A4 ``usbmon`` =E7=9B=AE=E5=BD=95=E4=B8=8B=E6=98=AF=E5=
=90=A6=E6=9C=89=E8=BF=99=E4=BA=9B=E6=9D=A1=E7=9B=AE::
> >  =20
> >       # ls /sys/kernel/debug/usb/usbmon
> >       0s  0u  1s  1t  1u  2s  2t  2u  3s  3t  3u  4s  4t  4u
> >       #
> >  =20
> > -=E7=8E=B0=E5=9C=A8=EF=BC=8C=E4=BD=A0=E5=8F=AF=E4=BB=A5=E9=80=89=E6=8B=
=A9=E4=BD=BF=E7=94=A8 ``0u`` =E6=8D=95=E8=8E=B7=E6=89=80=E6=9C=89=E6=80=BB=
=E7=BA=BF=E4=B8=8A=E7=9A=84=E6=95=B0=E6=8D=AE=E5=8C=85=EF=BC=8C
> > -=E5=B9=B6=E8=B7=B3=E5=88=B0=E7=AC=AC 3 =E6=AD=A5=EF=BC=9B
> > -=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=85=88=E6=8C=89=E7=AC=AC 2 =E6=AD=A5=E6=
=89=BE=E5=88=B0=E7=9B=AE=E6=A0=87=E8=AE=BE=E5=A4=87=E6=89=80=E5=9C=A8=E7=9A=
=84=E6=80=BB=E7=BA=BF=E3=80=82
> > -=E8=BF=99=E6=A0=B7=E5=8F=AF=E4=BB=A5=E8=BF=87=E6=BB=A4=E6=8E=89=E9=82=
=A3=E4=BA=9B=E6=8C=81=E7=BB=AD=E8=BE=93=E5=87=BA=E6=95=B0=E6=8D=AE=E7=9A=84=
=E7=83=A6=E4=BA=BA=E8=AE=BE=E5=A4=87=E3=80=82
> > +=E7=8E=B0=E5=9C=A8=EF=BC=8C=E4=BD=A0=E5=8F=AF=E4=BB=A5=E7=9B=B4=E6=8E=
=A5=E7=94=A8 ``0u`` =E6=8D=95=E8=8E=B7=E6=89=80=E6=9C=89=E6=80=BB=E7=BA=BF=
=E4=B8=8A=E7=9A=84=E6=95=B0=E6=8D=AE=E5=8C=85=EF=BC=8C=E7=84=B6=E5=90=8E=E8=
=B7=B3=E5=88=B0=E7=AC=AC 3
> > =E6=AD=A5=EF=BC=9B=E4=B9=9F=E5=8F=AF +=E4=BB=A5=E5=85=88=E6=8C=89=E7=AC=
=AC 2
> > =E6=AD=A5=E6=89=BE=E5=87=BA=E7=9B=AE=E6=A0=87=E8=AE=BE=E5=A4=87=E6=89=
=80=E5=9C=A8=E7=9A=84=E6=80=BB=E7=BA=BF=E3=80=82=E8=BF=99=E6=A0=B7=E5=8F=AF=
=E4=BB=A5=E6=8A=8A=E9=82=A3=E4=BA=9B=E6=8C=81=E7=BB=AD=E4=BA=A7=E7=94=9F=E6=
=B5=81=E9=87=8F=E7=9A=84=E8=AE=BE=E5=A4=87=E8=BF=87 +=E6=BB=A4=E6=8E=89=E3=
=80=82
> >  =20
> >   2. =E6=9F=A5=E6=89=BE=E7=9B=AE=E6=A0=87=E8=AE=BE=E5=A4=87=E8=BF=9E=E6=
=8E=A5=E7=9A=84=E6=98=AF=E5=93=AA=E6=9D=A1=E6=80=BB=E7=BA=BF
> >   -------------------------------
> >  =20
> > -=E8=BF=90=E8=A1=8C ``cat /sys/kernel/debug/usb/devices``=EF=BC=8C
> > -=E6=89=BE=E5=88=B0=E5=AF=B9=E5=BA=94=E8=AE=BE=E5=A4=87=E7=9A=84 T =E8=
=A1=8C=E3=80=82=E9=80=9A=E5=B8=B8=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E5=8E=
=82=E5=95=86=E5=AD=97=E7=AC=A6=E4=B8=B2=E6=9D=A5=E6=9F=A5=E6=89=BE=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E6=9C=89=E8=AE=B8=E5=A4=9A=E7=B1=BB=E4=BC=BC=E8=AE=
=BE=E5=A4=87=EF=BC=8C=E5=8F=AF=E4=BB=A5=E6=8B=94=E6=8E=89=E5=85=B6=E4=B8=AD=
=E4=B8=80=E4=B8=AA=EF=BC=8C
> > -=E5=86=8D=E6=AF=94=E8=BE=83=E5=89=8D=E5=90=8E=E4=B8=A4=E6=AC=A1 ``/sys=
/kernel/debug/usb/devices``
> > -=E7=9A=84=E8=BE=93=E5=87=BA=E3=80=82T =E8=A1=8C=E9=87=8C=E4=BC=9A=E5=
=8C=85=E5=90=AB=E6=80=BB=E7=BA=BF=E7=BC=96=E5=8F=B7=E3=80=82
> > +=E8=BF=90=E8=A1=8C ``cat /sys/kernel/debug/usb/devices``=EF=BC=8C=E6=
=89=BE=E5=88=B0=E5=AF=B9=E5=BA=94=E8=AE=BE=E5=A4=87=E7=9A=84 T
> > =E8=A1=8C=E3=80=82=E9=80=9A=E5=B8=B8=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87
> > +=E5=8E=82=E5=95=86=E5=AD=97=E7=AC=A6=E4=B8=B2=E6=9D=A5=E6=9F=A5=E6=89=
=BE=E3=80=82=E5=A6=82=E6=9E=9C=E6=9C=89=E5=BE=88=E5=A4=9A=E7=9B=B8=E4=BC=BC=
=E8=AE=BE=E5=A4=87=EF=BC=8C=E5=8F=AF=E4=BB=A5=E6=8B=94=E6=8E=89=E5=85=B6=E4=
=B8=AD=E4=B8=80=E4=B8=AA=EF=BC=8C=E5=86=8D=E6=AF=94=E8=BE=83=E5=89=8D=E5=90=
=8E=E4=B8=A4=E6=AC=A1
> > +``/sys/kernel/debug/usb/devices`` =E7=9A=84=E8=BE=93=E5=87=BA=E3=80=82=
T =E8=A1=8C=E9=87=8C=E4=BC=9A=E5=8C=85=E5=90=AB=E6=80=BB=E7=BA=BF=E7=BC=96=
=E5=8F=B7=E3=80=82=20
> >   =E7=A4=BA=E4=BE=8B::
> >  =20
> > @@ -86,8 +75,8 @@ usbmon =E6=8A=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=90=84=
=E4=B8=AA=E5=A4=96=E8=AE=BE=E9=A9=B1=E5=8A=A8
> >     S:  Manufacturer=3DATEN
> >     S:  Product=3DUC100KM V2.00
> >  =20
> > -``Bus=3D03`` =E8=A1=A8=E7=A4=BA=E5=AE=83=E4=BD=8D=E4=BA=8E 3 =E5=8F=B7=
=E6=80=BB=E7=BA=BF=E4=B8=8A=E3=80=82=E6=88=96=E8=80=85=EF=BC=8C
> > -=E4=B9=9F=E5=8F=AF=E4=BB=A5=E6=9F=A5=E7=9C=8B ``lsusb`` =E7=9A=84=E8=
=BE=93=E5=87=BA=EF=BC=8C=E5=B9=B6=E4=BB=8E=E5=AF=B9=E5=BA=94=E8=A1=8C=E5=BE=
=97=E5=88=B0=E6=80=BB=E7=BA=BF=E7=BC=96=E5=8F=B7=E3=80=82
> > +``Bus=3D03`` =E8=A1=A8=E7=A4=BA=E5=AE=83=E4=BD=8D=E4=BA=8E 3 =E5=8F=B7=
=E6=80=BB=E7=BA=BF=E4=B8=8A=E3=80=82=E6=88=96=E8=80=85=EF=BC=8C=E4=B9=9F=E5=
=8F=AF=E4=BB=A5=E6=9F=A5=E7=9C=8B ``lsusb``
> > =E7=9A=84=E8=BE=93=E5=87=BA=EF=BC=8C=E5=B9=B6=E4=BB=8E +=E5=AF=B9=E5=BA=
=94=E6=9D=A1=E7=9B=AE=E9=87=8C=E6=89=BE=E5=88=B0=E6=80=BB=E7=BA=BF=E7=BC=96=
=E5=8F=B7=E3=80=82
> >  =20
> >   =E7=A4=BA=E4=BE=8B=E5=A6=82=E4=B8=8B::
> >  =20
> > @@ -97,133 +86,108 @@ usbmon =E6=8A=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=90=
=84=E4=B8=AA=E5=A4=96=E8=AE=BE=E9=A9=B1=E5=8A=A8
> >   3. =E5=90=AF=E5=8A=A8 cat =E5=91=BD=E4=BB=A4
> >   ----------------
> >  =20
> > -=E5=A6=82=E6=9E=9C=E5=8F=AA=E7=9B=91=E5=90=AC=E5=8D=95=E6=9D=A1=E6=80=
=BB=E7=BA=BF=EF=BC=8C=E5=8F=AF=E6=89=A7=E8=A1=8C::
> > +=E5=A6=82=E6=9E=9C=E5=8F=AA=E7=9B=91=E5=90=AC=E5=8D=95=E6=9D=A1=E6=80=
=BB=E7=BA=BF=EF=BC=8C=E6=89=A7=E8=A1=8C::
> >  =20
> >       # cat /sys/kernel/debug/usb/usbmon/3u > /tmp/1.mon.out
> >  =20
> > -=E5=90=A6=E5=88=99=EF=BC=8C=E5=A6=82=E6=9E=9C=E8=A6=81=E7=9B=91=E5=90=
=AC=E6=89=80=E6=9C=89=E6=80=BB=E7=BA=BF=EF=BC=8C=E5=88=99=E6=89=A7=E8=A1=8C=
::
> > +=E5=90=A6=E5=88=99=EF=BC=8C=E5=A6=82=E6=9E=9C=E8=A6=81=E7=9B=91=E5=90=
=AC=E6=89=80=E6=9C=89=E6=80=BB=E7=BA=BF=EF=BC=8C=E6=89=A7=E8=A1=8C::
> >  =20
> >       # cat /sys/kernel/debug/usb/usbmon/0u > /tmp/1.mon.out
> >  =20
> > -=E6=AD=A4=E8=BF=9B=E7=A8=8B=E4=BC=9A=E4=B8=80=E7=9B=B4=E8=AF=BB=E5=8F=
=96=EF=BC=8C=E7=9B=B4=E5=88=B0=E8=A2=AB=E7=BB=88=E6=AD=A2=E3=80=82
> > -=E7=94=B1=E4=BA=8E=E8=BE=93=E5=87=BA=E9=80=9A=E5=B8=B8=E4=BC=9A=E5=BE=
=88=E9=95=BF=EF=BC=8C=E5=9B=A0=E6=AD=A4=E6=9B=B4=E6=8E=A8=E8=8D=90=E5=B0=86=
=E8=BE=93=E5=87=BA=E9=87=8D=E5=AE=9A=E5=90=91=E5=88=B0=E6=9F=90=E4=B8=AA=E4=
=BD=8D=E7=BD=AE=E3=80=82
> > +=E8=BF=99=E4=B8=AA=E8=BF=9B=E7=A8=8B=E4=BC=9A=E4=B8=80=E7=9B=B4=E8=BF=
=90=E8=A1=8C=E5=88=B0=E8=A2=AB=E7=BB=88=E6=AD=A2=E4=B8=BA=E6=AD=A2=E3=80=82=
=E7=94=B1=E4=BA=8E=E8=BE=93=E5=87=BA=E9=80=9A=E5=B8=B8=E4=BC=9A=E5=BE=88=E9=
=95=BF=EF=BC=8C=E6=9C=80=E5=A5=BD=E6=8A=8A=E5=AE=83=E9=87=8D=E5=AE=9A=E5=90=
=91=E5=88=B0=E6=96=87=E4=BB=B6
> > +=E6=88=96=E5=85=B6=E4=BB=96=E4=BD=8D=E7=BD=AE=E3=80=82
> >  =20
> >  =20
> >   4. =E5=9C=A8 USB =E6=80=BB=E7=BA=BF=E4=B8=8A=E6=89=A7=E8=A1=8C=E6=9C=
=9F=E6=9C=9B=E7=9A=84=E6=93=8D=E4=BD=9C
> >   ------------------------------
> >  =20
> > -=E6=AD=A4=E5=A4=84=E9=9C=80=E8=A6=81=E6=89=A7=E8=A1=8C=E4=B8=80=E4=BA=
=9B=E4=BC=9A=E4=BA=A7=E7=94=9F USB =E6=B5=81=E9=87=8F=E7=9A=84=E5=8A=A8=E4=
=BD=9C=EF=BC=8C
> > -=E6=AF=94=E5=A6=82=E6=8F=92=E5=85=A5 U =E7=9B=98=E3=80=81=E6=8B=B7=E8=
=B4=9D=E6=96=87=E4=BB=B6=E3=80=81=E6=93=8D=E4=BD=9C=E6=91=84=E5=83=8F=E5=A4=
=B4=E7=AD=89=E3=80=82
> > +=E8=BF=99=E9=87=8C=E5=81=9A=E4=B8=80=E4=BA=9B=E4=BC=9A=E4=BA=A7=E7=94=
=9F USB =E6=B5=81=E9=87=8F=E7=9A=84=E6=93=8D=E4=BD=9C=E5=8D=B3=E5=8F=AF=EF=
=BC=8C=E6=AF=94=E5=A6=82=E6=8F=92=E5=85=A5 U
> > =E7=9B=98=E3=80=81=E6=8B=B7=E8=B4=9D=E6=96=87=E4=BB=B6=E3=80=81=E6=93=
=8D=E4=BD=9C=E6=91=84=E5=83=8F=E5=A4=B4 +=E7=AD=89=E3=80=82
> >  =20
> >  =20
> >   5. =E5=81=9C=E6=AD=A2 cat
> >   -----------
> >  =20
> > -=E8=BF=99=E4=B8=80=E6=AD=A5=E9=80=9A=E5=B8=B8=E9=80=9A=E8=BF=87=E9=94=
=AE=E7=9B=98=E4=B8=AD=E6=96=AD=EF=BC=88Control-C=EF=BC=89=E5=AE=8C=E6=88=90=
=E3=80=82
> > +=E8=BF=99=E4=B8=80=E6=AD=A5=E9=80=9A=E5=B8=B8=E6=8C=89=E4=B8=8B=E9=94=
=AE=E7=9B=98=E4=B8=AD=E6=96=AD=EF=BC=88Control-C=EF=BC=89=E5=8D=B3=E5=8F=AF=
=E5=AE=8C=E6=88=90=E3=80=82
> >  =20
> > -=E6=AD=A4=E6=97=B6=E8=BE=93=E5=87=BA=E6=96=87=E4=BB=B6=EF=BC=88=E6=9C=
=AC=E4=BE=8B=E4=B8=AD=E4=B8=BA ``/tmp/1.mon.out``=EF=BC=89
> > -=E5=8F=AF=E4=BB=A5=E4=BF=9D=E5=AD=98=E3=80=81=E9=80=9A=E8=BF=87=E7=94=
=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E5=8F=91=E9=80=81=EF=BC=8C=E6=88=96=E4=BD=BF=
=E7=94=A8=E6=96=87=E6=9C=AC=E7=BC=96=E8=BE=91=E5=99=A8=E6=9F=A5=E7=9C=8B=E3=
=80=82
> > -=E5=A6=82=E6=9E=9C=E4=BD=BF=E7=94=A8=E6=9C=80=E5=90=8E=E4=B8=80=E7=A7=
=8D=E6=96=B9=E5=BC=8F=EF=BC=8C=E8=AF=B7=E7=A1=AE=E4=BF=9D=E6=96=87=E4=BB=B6=
=E4=B8=8D=E4=BC=9A=E5=A4=A7=E5=88=B0=E7=BC=96=E8=BE=91=E5=99=A8=E6=97=A0=E6=
=B3=95=E6=89=93=E5=BC=80=E3=80=82
> > +=E6=AD=A4=E6=97=B6=EF=BC=8C=E8=BE=93=E5=87=BA=E6=96=87=E4=BB=B6=EF=BC=
=88=E6=9C=AC=E4=BE=8B=E4=B8=AD=E4=B8=BA
> > ``/tmp/1.mon.out``=EF=BC=89=E5=8F=AF=E4=BB=A5=E4=BF=9D=E5=AD=98=E4=B8=
=8B=E6=9D=A5=EF=BC=8C=E9=80=9A=E8=BF=87=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=
=E5=8F=91
> > +=E9=80=81=EF=BC=8C=E4=B9=9F=E5=8F=AF=E4=BB=A5=E7=94=A8=E6=96=87=E6=9C=
=AC=E7=BC=96=E8=BE=91=E5=99=A8=E6=9F=A5=E7=9C=8B=E3=80=82=E5=A6=82=E6=9E=9C=
=E8=A6=81=E7=94=A8=E6=96=87=E6=9C=AC=E7=BC=96=E8=BE=91=E5=99=A8=E6=9F=A5=E7=
=9C=8B=EF=BC=8C=E8=AF=B7=E7=A1=AE=E4=BF=9D=E6=96=87=E4=BB=B6=E5=A4=A7=E5=B0=
=8F=E4=B8=8D=E4=BC=9A
> > +=E5=A4=A7=E5=88=B0=E7=BC=96=E8=BE=91=E5=99=A8=E6=97=A0=E6=B3=95=E5=A4=
=84=E7=90=86=E3=80=82=20
> >  =20
> >   =E5=8E=9F=E5=A7=8B=E6=96=87=E6=9C=AC=E6=95=B0=E6=8D=AE=E6=A0=BC=E5=BC=
=8F
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > -=E7=9B=AE=E5=89=8D=E6=94=AF=E6=8C=81=E4=B8=A4=E7=A7=8D=E6=A0=BC=E5=BC=
=8F=EF=BC=9A=E5=8E=9F=E5=A7=8B=E6=A0=BC=E5=BC=8F=EF=BC=8C=E4=B9=9F=E5=B0=B1=
=E6=98=AF ``1t`` =E6=A0=BC=E5=BC=8F=EF=BC=8C
> > -=E4=BB=A5=E5=8F=8A ``1u`` =E6=A0=BC=E5=BC=8F=E3=80=82``1t`` =E6=A0=BC=
=E5=BC=8F=E5=9C=A8=E5=86=85=E6=A0=B8 2.6.21 =E4=B8=AD=E5=B7=B2=E8=A2=AB=E5=
=BA=9F=E5=BC=83=E3=80=82
> > -``1u`` =E6=A0=BC=E5=BC=8F=E5=A2=9E=E5=8A=A0=E4=BA=86=E4=B8=80=E4=BA=9B=
=E5=AD=97=E6=AE=B5=EF=BC=8C=E4=BE=8B=E5=A6=82 ISO =E5=B8=A7=E6=8F=8F=E8=BF=
=B0=E7=AC=A6=E3=80=81
> > -``interval`` =E7=AD=89=E3=80=82=E5=AE=83=E7=94=9F=E6=88=90=E7=9A=84=E8=
=A1=8C=E4=BC=9A=E7=A8=8D=E9=95=BF=E4=B8=80=E4=BA=9B=EF=BC=8C
> > -=E4=BD=86=E5=9C=A8=E5=85=B6=E4=BB=96=E6=96=B9=E9=9D=A2=E6=98=AF ``1t``=
 =E6=A0=BC=E5=BC=8F=E7=9A=84=E5=AE=8C=E6=95=B4=E8=B6=85=E9=9B=86=E3=80=82
> > -
> > -=E5=A6=82=E6=9E=9C=E7=A8=8B=E5=BA=8F=E9=9C=80=E8=A6=81=E5=8C=BA=E5=88=
=86=E4=B8=8A=E8=BF=B0=E4=B8=A4=E7=A7=8D=E6=A0=BC=E5=BC=8F=EF=BC=8C
> > -=E5=8F=AF=E4=BB=A5=E6=9F=A5=E7=9C=8B ``address`` =E5=AD=97=E6=AE=B5=EF=
=BC=88=E8=A7=81=E4=B8=8B=E6=96=87=EF=BC=89=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E5=85=B6=E4=B8=AD=E6=9C=89=E4=B8=A4=E4=B8=AA=E5=86=
=92=E5=8F=B7=EF=BC=8C=E5=B0=B1=E6=98=AF ``1t`` =E6=A0=BC=E5=BC=8F=EF=BC=9B
> > -=E5=90=A6=E5=88=99=E6=98=AF ``1u`` =E6=A0=BC=E5=BC=8F=E3=80=82
> > -
> > -=E4=BB=BB=E4=BD=95=E6=96=87=E6=9C=AC=E6=A0=BC=E5=BC=8F=E7=9A=84=E6=95=
=B0=E6=8D=AE=E7=94=B1=E4=B8=80=E7=B3=BB=E5=88=97=E4=BA=8B=E4=BB=B6=E7=BB=84=
=E6=88=90=EF=BC=8C
> > -=E5=A6=82 URB =E6=8F=90=E4=BA=A4=E3=80=81URB =E5=9B=9E=E8=B0=83=E3=80=
=81=E6=8F=90=E4=BA=A4=E9=94=99=E8=AF=AF=E7=AD=89=E3=80=82
> > -=E6=AF=8F=E4=B8=AA=E4=BA=8B=E4=BB=B6=E5=AF=B9=E5=BA=94=E5=8D=95=E7=8B=
=AC=E7=9A=84=E4=B8=80=E8=A1=8C=E6=96=87=E6=9C=AC=EF=BC=8C
> > -=E7=94=B1=E4=BD=BF=E7=94=A8=E7=A9=BA=E7=99=BD=E7=AC=A6=E9=97=B4=E9=9A=
=94=E7=9A=84=E8=8B=A5=E5=B9=B2=E5=AD=97=E6=AE=B5=E7=BB=84=E6=88=90=E3=80=82
> > -=E5=AD=97=E6=AE=B5=E7=9A=84=E6=95=B0=E9=87=8F=E4=B8=8E=E4=BD=8D=E7=BD=
=AE=E5=8F=AF=E8=83=BD=E5=8F=96=E5=86=B3=E4=BA=8E=E4=BA=8B=E4=BB=B6=E7=B1=BB=
=E5=9E=8B=EF=BC=8C
> > -=E4=BD=86=E4=BB=A5=E4=B8=8B=E5=AD=97=E6=AE=B5=E5=AF=B9=E6=89=80=E6=9C=
=89=E7=B1=BB=E5=9E=8B=E9=83=BD=E9=80=9A=E7=94=A8=EF=BC=9A
> > -
> > -=E4=B8=8B=E9=9D=A2=E6=8C=89=E4=BB=8E=E5=B7=A6=E5=88=B0=E5=8F=B3=E7=9A=
=84=E9=A1=BA=E5=BA=8F=E5=88=97=E5=87=BA=E8=BF=99=E4=BA=9B=E5=85=B1=E6=9C=89=
=E5=AD=97=E6=AE=B5=EF=BC=9A
> > -
> > -- URB Tag=E3=80=82=E7=94=A8=E4=BA=8E=E6=A0=87=E8=AF=86 URB=EF=BC=8C=E9=
=80=9A=E5=B8=B8=E6=98=AF URB =E7=BB=93=E6=9E=84=E4=BD=93=E5=9C=A8=E5=86=85=
=E6=A0=B8=E4=B8=AD=E7=9A=84=E5=9C=B0=E5=9D=80
> > -  =EF=BC=88=E4=BB=A5=E5=8D=81=E5=85=AD=E8=BF=9B=E5=88=B6=E8=A1=A8=E7=
=A4=BA=EF=BC=89=EF=BC=8C
> > -  =E4=BD=86=E4=B9=9F=E5=8F=AF=E8=83=BD=E6=98=AF=E5=BA=8F=E5=8F=B7=E6=
=88=96=E5=85=B6=E4=BB=96=E5=90=88=E7=90=86=E7=9A=84=E5=94=AF=E4=B8=80=E5=AD=
=97=E7=AC=A6=E4=B8=B2=E3=80=82
> > -
> > -- =E6=97=B6=E9=97=B4=E6=88=B3=EF=BC=88=E5=BE=AE=E7=A7=92=EF=BC=89=EF=
=BC=8C=E5=8D=81=E8=BF=9B=E5=88=B6=E6=95=B0=E5=AD=97=E3=80=82
> > -  =E6=97=B6=E9=97=B4=E6=88=B3=E7=9A=84=E7=B2=BE=E5=BA=A6=E5=8F=96=E5=
=86=B3=E4=BA=8E=E5=8F=AF=E7=94=A8=E6=97=B6=E9=92=9F=EF=BC=8C
> > -  =E5=9B=A0=E6=AD=A4=E5=8F=AF=E8=83=BD=E8=BF=9C=E5=B7=AE=E4=BA=8E
> > -  1 =E5=BE=AE=E7=A7=92=EF=BC=88=E4=BE=8B=E5=A6=82=E5=AE=9E=E7=8E=B0=E4=
=BD=BF=E7=94=A8=E7=9A=84=E6=98=AF jiffies=EF=BC=89=E3=80=82
> > -
> > -- =E4=BA=8B=E4=BB=B6=E7=B1=BB=E5=9E=8B=E3=80=82=E5=AE=83=E8=A1=A8=E7=
=A4=BA=E7=9A=84=E6=98=AF=E4=BA=8B=E4=BB=B6=E7=9A=84=E6=A0=BC=E5=BC=8F=EF=BC=
=8C=E8=80=8C=E4=B8=8D=E6=98=AF URB =E7=9A=84=E7=B1=BB=E5=9E=8B=E3=80=82
> > -  =E5=8F=AF=E7=94=A8=E5=80=BC=E4=B8=BA=EF=BC=9A``S`` =E8=A1=A8=E7=A4=
=BA=E6=8F=90=E4=BA=A4=EF=BC=8C``C`` =E8=A1=A8=E7=A4=BA=E5=9B=9E=E8=B0=83=EF=
=BC=8C``E`` =E8=A1=A8=E7=A4=BA=E6=8F=90=E4=BA=A4=E9=94=99=E8=AF=AF=E3=80=82
> > -
> > -- ``Address`` =E5=AD=97=E6=AE=B5=EF=BC=88=E4=BB=A5=E5=89=8D=E7=A7=B0=
=E4=BD=9C ``pipe``=EF=BC=89=E3=80=82
> > -  =E5=AE=83=E5=8C=85=E5=90=AB=E5=9B=9B=E4=B8=AA=E7=94=B1=E5=86=92=E5=
=8F=B7=E5=88=86=E9=9A=94=E7=9A=84=E5=AD=97=E6=AE=B5=EF=BC=9A
> > -  URB =E7=B1=BB=E5=9E=8B=E5=8F=8A=E6=96=B9=E5=90=91=E3=80=81=E6=80=BB=
=E7=BA=BF=E5=8F=B7=E3=80=81=E8=AE=BE=E5=A4=87=E5=9C=B0=E5=9D=80=E5=92=8C=E7=
=AB=AF=E7=82=B9=E5=8F=B7=E3=80=82=E7=B1=BB=E5=9E=8B=E4=B8=8E=E6=96=B9=E5=90=
=91=E7=9A=84=E7=BC=96=E7=A0=81=E5=A6=82=E4=B8=8B=EF=BC=9A
> > -
> > -    =3D=3D =3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -    Ci Co   =E6=8E=A7=E5=88=B6=E8=BE=93=E5=85=A5=E5=92=8C=E8=BE=93=E5=
=87=BA
> > -    Zi Zo   =E7=AD=89=E6=97=B6=E8=BE=93=E5=85=A5=E5=92=8C=E8=BE=93=E5=
=87=BA
> > -    Ii Io   =E4=B8=AD=E6=96=AD=E8=BE=93=E5=85=A5=E5=92=8C=E8=BE=93=E5=
=87=BA
> > -    Bi Bo   =E6=89=B9=E9=87=8F=E8=BE=93=E5=85=A5=E5=92=8C=E8=BE=93=E5=
=87=BA
> > -    =3D=3D =3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -  =E6=80=BB=E7=BA=BF=E5=8F=B7=E3=80=81=E8=AE=BE=E5=A4=87=E5=9C=B0=E5=
=9D=80=E5=92=8C=E7=AB=AF=E7=82=B9=E5=8F=B7=E4=BD=BF=E7=94=A8=E5=8D=81=E8=BF=
=9B=E5=88=B6=EF=BC=8C=E4=BD=86=E5=8F=AF=E8=83=BD=E6=9C=89=E5=89=8D=E5=AF=BC=
=E9=9B=B6=E3=80=82
> > -
> > -- URB =E7=8A=B6=E6=80=81=E5=AD=97=E6=AE=B5=E3=80=82=E8=BF=99=E4=B8=AA=
=E5=AD=97=E6=AE=B5=E8=A6=81=E4=B9=88=E6=98=AF=E4=B8=80=E4=B8=AA=E5=AD=97=E6=
=AF=8D=EF=BC=8C
> > -  =E8=A6=81=E4=B9=88=E6=98=AF=E5=87=A0=E4=B8=AA=E7=94=B1=E5=86=92=E5=
=8F=B7=E5=88=86=E9=9A=94=E7=9A=84=E6=95=B0=E5=AD=97=EF=BC=9A
> > -  URB =E7=8A=B6=E6=80=81=E3=80=81``interval``=E3=80=81``start frame`` =
=E5=92=8C ``error count``=E3=80=82
> > -  =E4=B8=8E ``address`` =E5=AD=97=E6=AE=B5=E4=B8=8D=E5=90=8C=EF=BC=8C=
=E9=99=A4=E4=BA=86=E7=8A=B6=E6=80=81=E5=A4=96=EF=BC=8C=E5=85=B6=E4=BD=99=E5=
=AD=97=E6=AE=B5=E9=83=BD=E6=98=AF=E5=8F=AF=E9=80=89=E7=9A=84=E3=80=82
> > -  ``interval`` =E5=8F=AA=E4=BC=9A=E4=B8=BA=E4=B8=AD=E6=96=AD=E5=92=8C=
=E7=AD=89=E6=97=B6 URB =E6=89=93=E5=8D=B0=EF=BC=9B``start frame`` =E5=8F=AA=
=E4=BC=9A=E4=B8=BA
> > -  =E7=AD=89=E6=97=B6 URB =E6=89=93=E5=8D=B0=EF=BC=9B=E9=94=99=E8=AF=AF=
=E8=AE=A1=E6=95=B0=E5=8F=AA=E4=BC=9A=E5=9C=A8=E7=AD=89=E6=97=B6=E5=9B=9E=E8=
=B0=83=E4=BA=8B=E4=BB=B6=E4=B8=AD=E6=89=93=E5=8D=B0=E3=80=82
> > -
> > -  =E7=8A=B6=E6=80=81=E5=AD=97=E6=AE=B5=E6=98=AF=E4=B8=80=E4=B8=AA=E5=
=8D=81=E8=BF=9B=E5=88=B6=E6=95=B0=E5=AD=97=EF=BC=8C=E6=9C=89=E6=97=B6=E4=B8=
=BA=E8=B4=9F=E6=95=B0=EF=BC=8C
> > -  =E5=AF=B9=E5=BA=94 URB =E7=9A=84 ``status`` =E5=AD=97=E6=AE=B5=E3=80=
=82
> > -  =E5=AF=B9=E4=BA=8E=E6=8F=90=E4=BA=A4=E4=BA=8B=E4=BB=B6=EF=BC=8C=E8=
=BF=99=E4=B8=AA=E5=AD=97=E6=AE=B5=E6=9C=AC=E8=BA=AB=E6=B2=A1=E6=9C=89=E5=AE=
=9E=E9=99=85=E6=84=8F=E4=B9=89=EF=BC=8C
> > -  =E4=BD=86=E4=B8=BA=E4=BA=86=E4=BE=BF=E4=BA=8E=E8=84=9A=E6=9C=AC=E8=
=A7=A3=E6=9E=90=EF=BC=8C=E5=AE=83=E4=BB=8D=E7=84=B6=E5=AD=98=E5=9C=A8=E3=80=
=82
> > -  =E5=BD=93=E5=8F=91=E7=94=9F=E9=94=99=E8=AF=AF=E6=97=B6=EF=BC=8C=E8=
=AF=A5=E5=AD=97=E6=AE=B5=E5=8C=85=E5=90=AB=E9=94=99=E8=AF=AF=E7=A0=81=E3=80=
=82
> > -
> > -  =E5=9C=A8=E6=8F=90=E4=BA=A4=E6=8E=A7=E5=88=B6=E5=8C=85=E6=97=B6=EF=
=BC=8C=E8=BF=99=E4=B8=AA=E5=AD=97=E6=AE=B5=E5=8C=85=E5=90=AB=E7=9A=84=E6=98=
=AF ``Setup Tag``=EF=BC=8C
> > -  =E8=80=8C=E4=B8=8D=E6=98=AF=E4=B8=80=E7=BB=84=E6=95=B0=E5=AD=97=E3=
=80=82
> > -  =E5=88=A4=E6=96=AD ``Setup Tag`` =E6=98=AF=E5=90=A6=E5=AD=98=E5=9C=
=A8=E5=BE=88=E5=AE=B9=E6=98=93=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=AE=83=E4=BB=8E=
=E6=9D=A5=E4=B8=8D=E6=98=AF=E6=95=B0=E5=AD=97=E3=80=82
> > -  =E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=A6=82=E6=9E=9C=E8=84=9A=E6=9C=AC=E5=
=9C=A8=E8=BF=99=E4=B8=AA=E5=AD=97=E6=AE=B5=E9=87=8C=E5=8F=91=E7=8E=B0=E7=9A=
=84=E6=98=AF=E4=B8=80=E7=BB=84=E6=95=B0=E5=AD=97=EF=BC=8C
> > -  =E5=B0=B1=E4=BC=9A=E7=BB=A7=E7=BB=AD=E8=AF=BB=E5=8F=96=E6=95=B0=E6=
=8D=AE=E9=95=BF=E5=BA=A6=EF=BC=88=E7=AD=89=E6=97=B6 URB =E9=99=A4=E5=A4=96=
=EF=BC=89=E3=80=82
> > -  =E5=A6=82=E6=9E=9C=E5=8F=91=E7=8E=B0=E7=9A=84=E6=98=AF=E5=85=B6=E4=
=BB=96=E5=86=85=E5=AE=B9=EF=BC=8C=E6=AF=94=E5=A6=82=E4=B8=80=E4=B8=AA=E5=AD=
=97=E6=AF=8D=EF=BC=8C
> > -  =E9=82=A3=E4=B9=88=E8=84=9A=E6=9C=AC=E4=BC=9A=E5=85=88=E8=AF=BB=E5=
=8F=96 ``Setup`` =E5=8C=85=EF=BC=8C=E5=86=8D=E8=AF=BB=E5=8F=96=E6=95=B0=E6=
=8D=AE=E9=95=BF=E5=BA=A6=E6=88=96=E7=AD=89=E6=97=B6=E6=8F=8F=E8=BF=B0=E7=AC=
=A6=E3=80=82
> > -
> > -- ``Setup`` =E5=8C=85=E7=94=B1 5 =E4=B8=AA=E5=AD=97=E6=AE=B5=E7=BB=84=
=E6=88=90=EF=BC=9A
> > -  ``bmRequestType``=E3=80=81``bRequest``=E3=80=81``wValue``=E3=80=81
> > -  ``wIndex`` =E5=92=8C ``wLength``=E3=80=82=E8=BF=99=E4=BA=9B=E5=AD=97=
=E6=AE=B5=E7=94=B1 USB 2.0 =E8=A7=84=E8=8C=83=E5=AE=9A=E4=B9=89=E3=80=82
> > -  =E5=A6=82=E6=9E=9C ``Setup Tag`` =E4=B8=BA ``s``=EF=BC=8C=E5=B0=B1=
=E5=8F=AF=E4=BB=A5=E5=AE=89=E5=85=A8=E5=9C=B0=E8=A7=A3=E7=A0=81=E8=BF=99=E4=
=BA=9B=E5=AD=97=E6=AE=B5=E3=80=82
> > -  =E5=90=A6=E5=88=99=EF=BC=8C=E8=AF=B4=E6=98=8E Setup
> > =E5=8C=85=E8=99=BD=E7=84=B6=E5=AD=98=E5=9C=A8=EF=BC=8C=E4=BD=86=E5=B9=
=B6=E6=9C=AA=E8=A2=AB=E6=8D=95=E8=8E=B7=EF=BC=8C=E6=AD=A4=E6=97=B6=E5=90=84=
=E5=AD=97=E6=AE=B5=E4=B8=AD=E4=BC=9A=E5=A1=AB=E5=85=A5=E5=8D=A0=E4=BD=8D=E5=
=86=85=E5=AE=B9=E3=80=82
> > +=E7=9B=AE=E5=89=8D=E6=94=AF=E6=8C=81=E4=B8=A4=E7=A7=8D=E6=A0=BC=E5=BC=
=8F=EF=BC=9A=E5=8E=9F=E5=A7=8B=E7=9A=84 ``1t`` =E6=A0=BC=E5=BC=8F=E5=92=8C =
``1u`` =E6=A0=BC=E5=BC=8F=E3=80=82``1t``
> > =E6=A0=BC=E5=BC=8F=E5=9C=A8=E5=86=85=E6=A0=B8 +2.6.21 =E4=B8=AD=E5=B7=
=B2=E8=A2=AB=E5=BA=9F=E5=BC=83=E3=80=82``1u`` =E6=A0=BC=E5=BC=8F=E5=A2=9E=
=E5=8A=A0=E4=BA=86=E4=B8=80=E4=BA=9B=E5=AD=97=E6=AE=B5=EF=BC=8C=E4=BE=8B=E5=
=A6=82 ISO
> > =E5=B8=A7=E6=8F=8F=E8=BF=B0=E7=AC=A6=E5=92=8C +``interval``=E3=80=82=E5=
=AE=83=E7=94=9F=E6=88=90=E7=9A=84=E8=A1=8C=E4=BC=9A=E7=A8=8D=E9=95=BF=E4=B8=
=80=E4=BA=9B=EF=BC=8C=E4=BD=86=E9=99=A4=E6=AD=A4=E4=B9=8B=E5=A4=96=EF=BC=8C=
=E5=AE=83=E6=98=AF
> > ``1t`` =E6=A0=BC=E5=BC=8F=E7=9A=84=E5=AE=8C=E6=95=B4 +=E8=B6=85=E9=9B=
=86=E3=80=82 +
> > +=E5=A6=82=E6=9E=9C=E7=A8=8B=E5=BA=8F=E9=9C=80=E8=A6=81=E5=8C=BA=E5=88=
=86=E4=B8=8A=E8=BF=B0=E4=B8=A4=E7=A7=8D=E6=A0=BC=E5=BC=8F=EF=BC=8C=E5=8F=AF=
=E4=BB=A5=E6=9F=A5=E7=9C=8B ``address``
> > =E5=AD=97=E6=AE=B5=EF=BC=88=E8=A7=81=E4=B8=8B=E6=96=87=EF=BC=89=E3=80=
=82=E5=A6=82=E6=9E=9C +=E5=85=B6=E4=B8=AD=E6=9C=89=E4=B8=A4=E4=B8=AA=E5=86=
=92=E5=8F=B7=EF=BC=8C=E5=B0=B1=E6=98=AF ``1t`` =E6=A0=BC=E5=BC=8F=EF=BC=9B=
=E5=90=A6=E5=88=99=E6=98=AF
> > ``1u`` =E6=A0=BC=E5=BC=8F=E3=80=82 +
> > +=E4=BB=BB=E4=BD=95=E6=96=87=E6=9C=AC=E6=A0=BC=E5=BC=8F=E7=9A=84=E6=95=
=B0=E6=8D=AE=E9=83=BD=E7=94=B1=E4=B8=80=E7=B3=BB=E5=88=97=E4=BA=8B=E4=BB=B6=
=E6=9E=84=E6=88=90=EF=BC=8C=E4=BE=8B=E5=A6=82 URB =E6=8F=90=E4=BA=A4=E3=80=
=81URB
> > =E5=9B=9E=E8=B0=83=E5=92=8C=E6=8F=90=E4=BA=A4=E9=94=99
> > +=E8=AF=AF=E3=80=82=E6=AF=8F=E4=B8=AA=E4=BA=8B=E4=BB=B6=E5=8D=A0=E4=B8=
=80=E8=A1=8C=EF=BC=8C=E7=94=B1=E8=8B=A5=E5=B9=B2=E4=BB=A5=E7=A9=BA=E7=99=BD=
=E7=AC=A6=E5=88=86=E9=9A=94=E7=9A=84=E5=AD=97=E6=AE=B5=E7=BB=84=E6=88=90=E3=
=80=82=E5=AD=97=E6=AE=B5=E6=95=B0=E9=87=8F=E5=92=8C=E4=BD=8D=E7=BD=AE=E4=BC=
=9A=E9=9A=8F=E4=BA=8B=E4=BB=B6
> > +=E7=B1=BB=E5=9E=8B=E5=8F=98=E5=8C=96=EF=BC=8C=E4=BD=86=E4=B8=8B=E9=9D=
=A2=E8=BF=99=E4=BA=9B=E5=AD=97=E6=AE=B5=E5=AF=B9=E6=89=80=E6=9C=89=E7=B1=BB=
=E5=9E=8B=E9=83=BD=E9=80=9A=E7=94=A8=EF=BC=9A +
> > +=E4=B8=8B=E9=9D=A2=E6=8C=89=E4=BB=8E=E5=B7=A6=E5=88=B0=E5=8F=B3=E7=9A=
=84=E9=A1=BA=E5=BA=8F=E8=AF=B4=E6=98=8E=E8=BF=99=E4=BA=9B=E9=80=9A=E7=94=A8=
=E5=AD=97=E6=AE=B5=EF=BC=9A
> > +
> > +- URB =E6=A0=87=E8=AF=86=EF=BC=88URB Tag=EF=BC=89=E3=80=82=E7=94=A8=E4=
=BA=8E=E6=A0=87=E8=AF=86 URB=EF=BC=8C=E9=80=9A=E5=B8=B8=E6=98=AF URB
> > =E7=BB=93=E6=9E=84=E4=BD=93=E5=9C=A8=E5=86=85=E6=A0=B8=E4=B8=AD=E7=9A=
=84=E5=9C=B0=E5=9D=80
> > +  =EF=BC=88=E5=8D=81=E5=85=AD=E8=BF=9B=E5=88=B6=EF=BC=89=EF=BC=8C=E4=
=B9=9F=E5=8F=AF=E8=83=BD=E6=98=AF=E5=BA=8F=E5=8F=B7=E6=88=96=E5=85=B6=E4=BB=
=96=E8=B6=B3=E4=BB=A5=E5=94=AF=E4=B8=80=E6=A0=87=E8=AF=86 URB =E7=9A=84=E5=
=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82
> > +
> > +-
> > =E6=97=B6=E9=97=B4=E6=88=B3=EF=BC=88=E5=BE=AE=E7=A7=92=EF=BC=89=EF=BC=
=8C=E5=8D=81=E8=BF=9B=E5=88=B6=E6=95=B0=E5=AD=97=E3=80=82=E6=97=B6=E9=97=B4=
=E6=88=B3=E7=9A=84=E7=B2=BE=E5=BA=A6=E5=8F=96=E5=86=B3=E4=BA=8E=E5=8F=AF=E7=
=94=A8=E6=97=B6=E9=92=9F=EF=BC=8C=E6=89=80=E4=BB=A5=E5=8F=AF=E8=83=BD=E8=BF=
=9C=E4=BD=8E=E4=BA=8E
> > +  1 =E5=BE=AE=E7=A7=92=EF=BC=88=E4=BE=8B=E5=A6=82=E5=AE=9E=E7=8E=B0=E4=
=BD=BF=E7=94=A8 jiffies =E6=97=B6=EF=BC=89=E3=80=82
> > +
> > +- =E4=BA=8B=E4=BB=B6=E7=B1=BB=E5=9E=8B=E3=80=82=E5=AE=83=E8=A1=A8=E7=
=A4=BA=E7=9A=84=E6=98=AF=E8=BF=99=E4=B8=80=E8=A1=8C=E4=BA=8B=E4=BB=B6=E7=9A=
=84=E6=A0=BC=E5=BC=8F=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF URB
> > =E7=9A=84=E7=B1=BB=E5=9E=8B=E3=80=82=E5=8F=AF=E7=94=A8=E5=80=BC=E4=B8=
=BA=EF=BC=9A
> > +  ``S`` =E8=A1=A8=E7=A4=BA=E6=8F=90=E4=BA=A4=EF=BC=8C``C`` =E8=A1=A8=
=E7=A4=BA=E5=9B=9E=E8=B0=83=EF=BC=8C``E`` =E8=A1=A8=E7=A4=BA=E6=8F=90=E4=BA=
=A4=E9=94=99=E8=AF=AF=E3=80=82
> > +
> > +- ``Address`` =E5=AD=97=E6=AE=B5=EF=BC=88=E4=BB=A5=E5=89=8D=E7=A7=B0=
=E4=B8=BA
> > ``pipe``=EF=BC=89=E3=80=82=E5=AE=83=E5=8C=85=E5=90=AB=E5=9B=9B=E4=B8=AA=
=E7=94=B1=E5=86=92=E5=8F=B7=E5=88=86=E9=9A=94=E7=9A=84=E5=AD=97=E6=AE=B5=EF=
=BC=9AURB
> > +  =E7=B1=BB=E5=9E=8B=E5=8F=8A=E6=96=B9=E5=90=91=E3=80=81=E6=80=BB=E7=
=BA=BF=E5=8F=B7=E3=80=81=E8=AE=BE=E5=A4=87=E5=9C=B0=E5=9D=80=E5=92=8C=E7=AB=
=AF=E7=82=B9=E5=8F=B7=E3=80=82=E7=B1=BB=E5=9E=8B=E4=B8=8E=E6=96=B9=E5=90=91=
=E7=9A=84=E7=BC=96=E7=A0=81=E5=A6=82=E4=B8=8B=EF=BC=9A
> > +
> > +  - ``Ci`` / ``Co``=EF=BC=9A=E6=8E=A7=E5=88=B6=E8=BE=93=E5=85=A5 / =E8=
=BE=93=E5=87=BA
> > +  - ``Zi`` / ``Zo``=EF=BC=9A=E7=AD=89=E6=97=B6=E8=BE=93=E5=85=A5 / =E8=
=BE=93=E5=87=BA
> > +  - ``Ii`` / ``Io``=EF=BC=9A=E4=B8=AD=E6=96=AD=E8=BE=93=E5=85=A5 / =E8=
=BE=93=E5=87=BA
> > +  - ``Bi`` / ``Bo``=EF=BC=9A=E6=89=B9=E9=87=8F=E8=BE=93=E5=85=A5 / =E8=
=BE=93=E5=87=BA
> > +
> > +
> > =E6=80=BB=E7=BA=BF=E5=8F=B7=E3=80=81=E8=AE=BE=E5=A4=87=E5=9C=B0=E5=9D=
=80=E5=92=8C=E7=AB=AF=E7=82=B9=E5=8F=B7=E9=83=BD=E6=98=AF=E5=8D=81=E8=BF=9B=
=E5=88=B6=E6=95=B0=EF=BC=8C=E4=BD=86=E5=8F=AF=E8=83=BD=E6=9C=89=E5=89=8D=E5=
=AF=BC=E9=9B=B6=EF=BC=8C=E6=96=B9=E4=BE=BF=E4=BA=BA=E9=98=85=E8=AF=BB=E3=80=
=82 +
> > +- URB
> > =E7=8A=B6=E6=80=81=E5=AD=97=E6=AE=B5=E3=80=82=E8=BF=99=E4=B8=AA=E5=AD=
=97=E6=AE=B5=E8=A6=81=E4=B9=88=E6=98=AF=E4=B8=80=E4=B8=AA=E5=AD=97=E6=AF=8D=
=EF=BC=8C=E8=A6=81=E4=B9=88=E6=98=AF=E5=87=A0=E4=B8=AA=E7=94=A8=E5=86=92=E5=
=8F=B7=E5=88=86=E9=9A=94=E7=9A=84=E6=95=B0=E5=AD=97=EF=BC=8C=E4=BE=9D=E6=AC=
=A1
> > +  =E8=A1=A8=E7=A4=BA URB =E7=8A=B6=E6=80=81=E3=80=81``interval``=E3=80=
=81``start frame`` =E5=92=8C ``error
> > count``=E3=80=82=E4=B8=8E
> > +  ``address`` =E5=AD=97=E6=AE=B5=E4=B8=8D=E5=90=8C=EF=BC=8C=E9=99=A4=
=E7=8A=B6=E6=80=81=E5=A4=96=EF=BC=8C=E5=85=B6=E4=BD=99=E5=AD=97=E6=AE=B5=E9=
=83=BD=E5=8F=AF=E8=83=BD=E7=9C=81=E7=95=A5=E3=80=82``interval``
> > =E5=8F=AA=E4=BC=9A=E5=9C=A8
> > +  =E4=B8=AD=E6=96=AD=E5=92=8C=E7=AD=89=E6=97=B6 URB =E4=B8=AD=E6=89=93=
=E5=8D=B0=EF=BC=9B``start frame`` =E5=8F=AA=E4=BC=9A=E5=9C=A8=E7=AD=89=E6=
=97=B6 URB
> > =E4=B8=AD=E6=89=93=E5=8D=B0=EF=BC=9B=E9=94=99=E8=AF=AF=E8=AE=A1=E6=95=
=B0=E5=8F=AA
> > +  =E4=BC=9A=E5=9C=A8=E7=AD=89=E6=97=B6=E5=9B=9E=E8=B0=83=E4=BA=8B=E4=
=BB=B6=E4=B8=AD=E6=89=93=E5=8D=B0=E3=80=82
> > +
> > +  =E7=8A=B6=E6=80=81=E5=AD=97=E6=AE=B5=E6=98=AF=E4=B8=80=E4=B8=AA=E5=
=8D=81=E8=BF=9B=E5=88=B6=E6=95=B0=EF=BC=8C=E6=9C=89=E6=97=B6=E4=B8=BA=E8=B4=
=9F=E6=95=B0=EF=BC=8C=E5=AF=B9=E5=BA=94 URB =E7=9A=84 ``status``
> > =E5=AD=97=E6=AE=B5=E3=80=82=E5=AF=B9=E4=BA=8E=E6=8F=90
> > +
> > =E4=BA=A4=E4=BA=8B=E4=BB=B6=EF=BC=8C=E8=BF=99=E4=B8=AA=E5=AD=97=E6=AE=
=B5=E6=9C=AC=E8=BA=AB=E5=B9=B6=E6=97=A0=E5=AE=9E=E9=99=85=E8=AF=AD=E4=B9=89=
=EF=BC=8C=E4=BD=86=E4=B8=BA=E4=BA=86=E4=BE=BF=E4=BA=8E=E8=84=9A=E6=9C=AC=E8=
=A7=A3=E6=9E=90=E4=BB=8D=E4=BC=9A=E4=BF=9D=E7=95=99=E3=80=82=E5=8F=91=E7=94=
=9F=E9=94=99=E8=AF=AF
> > +  =E6=97=B6=EF=BC=8C=E8=BF=99=E9=87=8C=E5=A1=AB=E7=9A=84=E6=98=AF=E9=
=94=99=E8=AF=AF=E7=A0=81=E3=80=82
> > +
> > +  =E5=A6=82=E6=9E=9C=E6=98=AF=E6=8E=A7=E5=88=B6=E5=8C=85=E7=9A=84=E6=
=8F=90=E4=BA=A4=E4=BA=8B=E4=BB=B6=EF=BC=8C=E8=BF=99=E4=B8=AA=E5=AD=97=E6=AE=
=B5=E9=87=8C=E6=94=BE=E7=9A=84=E4=B8=8D=E6=98=AF=E4=B8=80=E7=BB=84=E6=95=B0=
=E5=AD=97=EF=BC=8C=E8=80=8C=E6=98=AF ``Setup
> > Tag``=E3=80=82
> > +  =E8=BF=99=E5=BE=88=E5=AE=B9=E6=98=93=E5=88=86=E8=BE=A8=EF=BC=8C=E5=
=9B=A0=E4=B8=BA ``Setup Tag``
> > =E6=B0=B8=E8=BF=9C=E4=B8=8D=E6=98=AF=E6=95=B0=E5=AD=97=E3=80=82=E6=89=
=80=E4=BB=A5=E8=84=9A=E6=9C=AC=E5=A6=82=E6=9E=9C=E5=9C=A8=E8=BF=99=E9=87=8C=
=E8=AF=BB=E5=88=B0=E4=B8=80
> > +  =E7=BB=84=E6=95=B0=E5=AD=97=EF=BC=8C=E5=B0=B1=E4=BC=9A=E7=BB=A7=E7=
=BB=AD=E8=AF=BB=E5=8F=96=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=EF=BC=88=E7=AD=
=89=E6=97=B6 URB
> > =E9=99=A4=E5=A4=96=EF=BC=89=EF=BC=9B=E5=A6=82=E6=9E=9C=E8=AF=BB=E5=88=
=B0=E7=9A=84=E6=98=AF=E5=AD=97=E6=AF=8D=E4=B9=8B=E7=B1=BB=E7=9A=84=E5=86=85
> > +  =E5=AE=B9=EF=BC=8C=E5=B0=B1=E8=A6=81=E5=85=88=E8=AF=BB=E5=8F=96 ``Se=
tup`` =E5=8C=85=EF=BC=8C=E5=86=8D=E8=AF=BB=E5=8F=96=E6=95=B0=E6=8D=AE=E9=95=
=BF=E5=BA=A6=E6=88=96=E7=AD=89=E6=97=B6=E6=8F=8F=E8=BF=B0=E7=AC=A6=E3=80=82
> > +
> > +- ``Setup`` =E5=8C=85=E7=94=B1 5
> > =E4=B8=AA=E5=AD=97=E6=AE=B5=E7=BB=84=E6=88=90=EF=BC=9A``bmRequestType``=
=E3=80=81``bRequest``=E3=80=81``wValue``=E3=80=81
> > +  ``wIndex`` =E5=92=8C ``wLength``=E3=80=82=E8=BF=99=E4=BA=9B=E5=AD=97=
=E6=AE=B5=E7=94=B1 USB 2.0 =E8=A7=84=E8=8C=83=E5=AE=9A=E4=B9=89=E3=80=82=E5=
=A6=82=E6=9E=9C
> > ``Setup Tag``
> > +  =E6=98=AF ``s``=EF=BC=8C=E5=B0=B1=E5=8F=AF=E4=BB=A5=E5=AE=89=E5=85=
=A8=E8=A7=A3=E7=A0=81=E8=BF=99=E4=BA=9B=E5=AD=97=E6=AE=B5=E3=80=82=E5=90=A6=
=E5=88=99=EF=BC=8C=E8=AF=B4=E6=98=8E Setup
> > =E5=8C=85=E8=99=BD=E7=84=B6=E5=AD=98=E5=9C=A8=EF=BC=8C=E4=BD=86=E5=B9=
=B6=E6=9C=AA=E8=A2=AB
> > +  =E6=8D=95=E8=8E=B7=EF=BC=8C=E6=AD=A4=E6=97=B6=E5=90=84=E5=AD=97=E6=
=AE=B5=E4=B8=AD=E4=BC=9A=E5=A1=AB=E5=85=A5=E5=8D=A0=E4=BD=8D=E5=86=85=E5=AE=
=B9=E3=80=82
> >  =20
> >   - =E7=AD=89=E6=97=B6=E4=BC=A0=E8=BE=93=E5=B8=A7=E6=8F=8F=E8=BF=B0=E7=
=AC=A6=E7=9A=84=E6=95=B0=E9=87=8F=E5=8F=8A=E5=85=B6=E5=86=85=E5=AE=B9=EF=BC=
=9A
> > -  =E5=A6=82=E6=9E=9C=E4=B8=80=E4=B8=AA=E7=AD=89=E6=97=B6=E4=BC=A0=E8=
=BE=93=E4=BA=8B=E4=BB=B6=E5=B8=A6=E6=9C=89=E4=B8=80=E7=BB=84=E6=8F=8F=E8=BF=
=B0=E7=AC=A6=EF=BC=8C=E9=A6=96=E5=85=88=E6=89=93=E5=8D=B0=E8=AF=A5 URB
> > =E4=B8=AD=E6=8F=8F=E8=BF=B0=E7=AC=A6=E7=9A=84=E6=80=BB=E6=95=B0=EF=BC=8C
> > -  =E7=84=B6=E5=90=8E=E4=B8=BA=E6=AF=8F=E4=B8=AA=E6=8F=8F=E8=BF=B0=E7=
=AC=A6=E6=89=93=E5=8D=B0=E4=B8=80=E4=B8=AA=E5=AD=97=E6=AE=B5=EF=BC=8C=E6=9C=
=80=E5=A4=9A=E6=89=93=E5=8D=B0 5 =E4=B8=AA=E5=AD=97=E6=AE=B5=E3=80=82
> > -  =E6=AF=8F=E4=B8=AA=E5=AD=97=E6=AE=B5=E7=94=B1=E4=B8=89=E4=B8=AA=E7=
=94=A8=E5=86=92=E5=8F=B7=E5=88=86=E9=9A=94=E7=9A=84=E5=8D=81=E8=BF=9B=E5=88=
=B6=E6=95=B0=E5=AD=97=E7=BB=84=E6=88=90=EF=BC=8C
> > -  =E5=88=86=E5=88=AB=E8=A1=A8=E7=A4=BA=E7=8A=B6=E6=80=81=EF=BC=88statu=
s=EF=BC=89=E3=80=81=E5=81=8F=E7=A7=BB=EF=BC=88offset=EF=BC=89=E5=92=8C=E9=
=95=BF=E5=BA=A6=EF=BC=88length=EF=BC=89=E3=80=82
> > -  =E5=AF=B9=E4=BA=8E=E6=8F=90=E4=BA=A4=EF=BC=88submission=EF=BC=89=EF=
=BC=8C=E6=8A=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=88=9D=E5=A7=8B=E9=95=BF=E5=BA=
=A6=EF=BC=9B
> > -  =E5=AF=B9=E4=BA=8E=E5=9B=9E=E8=B0=83=EF=BC=88callback=EF=BC=89=EF=BC=
=8C=E6=8A=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=AE=9E=E9=99=85=E9=95=BF=E5=BA=A6=
=E3=80=82
> > +  =E5=A6=82=E6=9E=9C=E6=9F=90=E4=B8=AA=E7=AD=89=E6=97=B6=E4=BC=A0=E8=
=BE=93=E4=BA=8B=E4=BB=B6=E5=B8=A6=E6=9C=89=E6=8F=8F=E8=BF=B0=E7=AC=A6=EF=BC=
=8C=E4=BC=9A=E5=85=88=E6=89=93=E5=8D=B0=E8=AF=A5 URB
> > =E7=9A=84=E6=8F=8F=E8=BF=B0=E7=AC=A6=E6=80=BB=E6=95=B0=EF=BC=8C=E5=86=
=8D=E4=B8=BA=E6=AF=8F=E4=B8=AA=E6=8F=8F
> > +  =E8=BF=B0=E7=AC=A6=E6=89=93=E5=8D=B0=E4=B8=80=E4=B8=AA=E5=AD=97=E6=
=AE=B5=EF=BC=8C=E6=9C=80=E5=A4=9A 5
> > =E4=B8=AA=E3=80=82=E6=AF=8F=E4=B8=AA=E5=AD=97=E6=AE=B5=E7=94=B1=E4=B8=
=89=E4=B8=AA=E7=94=A8=E5=86=92=E5=8F=B7=E5=88=86=E9=9A=94=E7=9A=84=E5=8D=81=
=E8=BF=9B=E5=88=B6=E6=95=B0=E7=BB=84=E6=88=90=EF=BC=8C=E4=BE=9D
> > +
> > =E6=AC=A1=E8=A1=A8=E7=A4=BA=E7=8A=B6=E6=80=81=EF=BC=88status=EF=BC=89=
=E3=80=81=E5=81=8F=E7=A7=BB=EF=BC=88offset=EF=BC=89=E5=92=8C=E9=95=BF=E5=BA=
=A6=EF=BC=88length=EF=BC=89=E3=80=82=E5=AF=B9=E4=BA=8E=E6=8F=90=E4=BA=A4=E4=
=BA=8B=E4=BB=B6=EF=BC=8C=E6=8A=A5
> > +  =E5=91=8A=E7=9A=84=E6=98=AF=E5=88=9D=E5=A7=8B=E9=95=BF=E5=BA=A6=EF=
=BC=9B=E5=AF=B9=E4=BA=8E=E5=9B=9E=E8=B0=83=E4=BA=8B=E4=BB=B6=EF=BC=8C=E6=8A=
=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=AE=9E=E9=99=85=E9=95=BF=E5=BA=A6=E3=80=82
> >  =20
> > -- =E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=EF=BC=9A
> > -  =E5=AF=B9=E4=BA=8E=E6=8F=90=E4=BA=A4=EF=BC=8C=E8=A1=A8=E7=A4=BA=E8=
=AF=B7=E6=B1=82=E7=9A=84=E9=95=BF=E5=BA=A6=EF=BC=9B=E5=AF=B9=E4=BA=8E=E5=9B=
=9E=E8=B0=83=EF=BC=8C=E8=A1=A8=E7=A4=BA=E5=AE=9E=E9=99=85=E4=BC=A0=E8=BE=93=
=E7=9A=84=E9=95=BF=E5=BA=A6=E3=80=82
> > +-
> > =E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=EF=BC=9A=E5=AF=B9=E4=BA=8E=E6=8F=
=90=E4=BA=A4=EF=BC=8C=E8=A1=A8=E7=A4=BA=E8=AF=B7=E6=B1=82=E7=9A=84=E9=95=BF=
=E5=BA=A6=EF=BC=9B=E5=AF=B9=E4=BA=8E=E5=9B=9E=E8=B0=83=EF=BC=8C=E8=A1=A8=E7=
=A4=BA=E5=AE=9E=E9=99=85=E4=BC=A0=E8=BE=93=E7=9A=84=E9=95=BF=E5=BA=A6=E3=80=
=82=20
> > -- =E6=95=B0=E6=8D=AE=E6=A0=87=E7=AD=BE=EF=BC=9A
> > -  =E5=8D=B3=E4=BD=BF=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E9=9D=9E=E9=
=9B=B6=EF=BC=8Cusbmon =E4=B9=9F=E4=B8=8D=E4=B8=80=E5=AE=9A=E4=BC=9A=E6=8D=
=95=E8=8E=B7=E6=95=B0=E6=8D=AE=E3=80=82
> > -  =E4=BB=85=E5=BD=93=E6=A0=87=E7=AD=BE=E4=B8=BA ``=3D`` =E6=97=B6=EF=
=BC=8C=E6=89=8D=E4=BC=9A=E6=9C=89=E6=95=B0=E6=8D=AE=E5=AD=97=E6=AE=B5=E3=80=
=82
> > +- =E6=95=B0=E6=8D=AE=E6=A0=87=E7=AD=BE=EF=BC=9A=E5=8D=B3=E4=BD=BF=E6=
=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E9=9D=9E=E9=9B=B6=EF=BC=8Cusbmon =E4=B9=
=9F=E4=B8=8D=E4=B8=80=E5=AE=9A=E4=BC=9A=E6=8D=95=E8=8E=B7=E6=95=B0=E6=8D=AE=
=E3=80=82=E5=8F=AA=E6=9C=89=E6=A0=87=E7=AD=BE=E4=B8=BA
> > +  ``=3D`` =E6=97=B6=EF=BC=8C=E6=89=8D=E4=BC=9A=E6=9C=89=E6=95=B0=E6=8D=
=AE=E5=AD=97=E6=AE=B5=E3=80=82
> >  =20
> > -- =E6=95=B0=E6=8D=AE=E5=AD=97=E6=AE=B5=EF=BC=9A
> > -  =E4=BB=A5=E5=A4=A7=E7=AB=AF=E5=8D=81=E5=85=AD=E8=BF=9B=E5=88=B6=E6=
=A0=BC=E5=BC=8F=E6=98=BE=E7=A4=BA=E3=80=82=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=BF=
=99=E4=BA=9B=E5=B9=B6=E4=B8=8D=E6=98=AF=E7=9C=9F=E6=AD=A3=E7=9A=84=E6=9C=BA=
=E5=99=A8=E5=AD=97=EF=BC=8C
> > -  =E8=80=8C=E5=8F=AA=E6=98=AF=E6=8A=8A=E5=AD=97=E8=8A=82=E6=B5=81=E6=
=8B=86=E6=88=90=E8=8B=A5=E5=B9=B2=E2=80=9C=E5=AD=97=E2=80=9D=E4=BB=A5=E4=BE=
=BF=E9=98=85=E8=AF=BB=E3=80=82=E5=9B=A0=E6=AD=A4=E6=9C=80=E5=90=8E=E4=B8=80=
=E4=B8=AA=E5=AD=97=E5=8F=AF=E8=83=BD=E5=8F=AA=E5=8C=85=E5=90=AB
> > -  1 =E5=88=B0 4 =E4=B8=AA=E5=AD=97=E8=8A=82=E3=80=82
> > -  =E6=94=B6=E9=9B=86=E7=9A=84=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E6=
=98=AF=E6=9C=89=E9=99=90=E7=9A=84=EF=BC=8C=E5=8F=AF=E8=83=BD=E5=B0=8F=E4=BA=
=8E=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E5=AD=97=E6=AE=B5=E4=B8=AD=E6=8A=A5=
=E5=91=8A=E7=9A=84=E5=80=BC=E3=80=82
> > -
> > =E5=9B=A0=E4=B8=BA=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E5=AD=97=E6=AE=
=B5=E5=8F=AA=E7=BB=9F=E8=AE=A1=E5=AE=9E=E9=99=85=E6=8E=A5=E6=94=B6=E5=88=B0=
=E7=9A=84=E5=AD=97=E8=8A=82=EF=BC=8C=E8=80=8C=E6=95=B0=E6=8D=AE=E5=AD=97=E6=
=AE=B5=E5=8C=85=E5=90=AB=E6=95=B4=E4=B8=AA=E4=BC=A0=E8=BE=93=E7=BC=93=E5=86=
=B2=E5=8C=BA=EF=BC=8C
> > -  =E6=89=80=E4=BB=A5=EF=BC=8C=E5=9C=A8=E7=AD=89=E6=97=B6=E8=BE=93=E5=
=85=A5=EF=BC=88Zi=EF=BC=89=E5=AE=8C=E6=88=90=E4=B8=94=E7=BC=93=E5=86=B2=E5=
=8C=BA=E4=B8=AD=E6=8E=A5=E6=94=B6=E5=88=B0=E7=9A=84=E6=95=B0=E6=8D=AE=E7=A8=
=80=E7=96=8F=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C
> > -  =E6=94=B6=E9=9B=86=E7=9A=84=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E5=
=8F=AF=E8=83=BD=E5=A4=A7=E4=BA=8E=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E5=AD=
=97=E6=AE=B5=E7=9A=84=E5=80=BC=E3=80=82
> > +-
> > =E6=95=B0=E6=8D=AE=E5=AD=97=E6=AE=B5=EF=BC=9A=E4=BB=A5=E5=A4=A7=E7=AB=
=AF=E5=8D=81=E5=85=AD=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E6=98=BE=E7=A4=BA=
=E3=80=82=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=BF=99=E4=BA=9B=E5=B9=B6=E4=B8=8D=E6=
=98=AF=E7=9C=9F=E6=AD=A3=E7=9A=84=E6=9C=BA=E5=99=A8=E5=AD=97=EF=BC=8C=E5=8F=
=AA=E6=98=AF=E4=B8=BA
> > +  =E4=BA=86=E4=BE=BF=E4=BA=8E=E9=98=85=E8=AF=BB=EF=BC=8C=E6=8A=8A=E5=
=AD=97=E8=8A=82=E6=B5=81=E6=8C=89=E2=80=9C=E5=AD=97=E2=80=9D=E5=88=86=E7=BB=
=84=E6=98=BE=E7=A4=BA=E3=80=82=E5=9B=A0=E6=AD=A4=E6=9C=80=E5=90=8E=E4=B8=80=
=E4=B8=AA=E5=AD=97=E5=8F=AF=E8=83=BD=E5=8F=AA=E5=8C=85=E5=90=AB 1
> > =E5=88=B0 4 =E4=B8=AA
> > +
> > =E5=AD=97=E8=8A=82=E3=80=82=E6=8D=95=E8=8E=B7=E7=9A=84=E6=95=B0=E6=8D=
=AE=E9=95=BF=E5=BA=A6=E6=98=AF=E6=9C=89=E9=99=90=E7=9A=84=EF=BC=8C=E5=8F=AF=
=E8=83=BD=E5=B0=8F=E4=BA=8E=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E5=AD=97=E6=
=AE=B5=E4=B8=AD=E6=8A=A5=E5=91=8A=E7=9A=84=E5=80=BC=E3=80=82=E5=AF=B9=E4=BA=
=8E=E7=AD=89=E6=97=B6
> > +
> > =E8=BE=93=E5=85=A5=EF=BC=88Zi=EF=BC=89=E5=AE=8C=E6=88=90=E4=BA=8B=E4=BB=
=B6=EF=BC=8C=E5=A6=82=E6=9E=9C=E7=BC=93=E5=86=B2=E5=8C=BA=E9=87=8C=E7=9A=84=
=E6=8E=A5=E6=94=B6=E6=95=B0=E6=8D=AE=E6=AF=94=E8=BE=83=E7=A8=80=E7=96=8F=EF=
=BC=8C=E6=8D=95=E8=8E=B7=E6=95=B0=E6=8D=AE=E7=9A=84=E9=95=BF=E5=BA=A6=E7=94=
=9A=E8=87=B3
> > +
> > =E5=8F=AF=E8=83=BD=E5=A4=A7=E4=BA=8E=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=
=A6=E5=AD=97=E6=AE=B5=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=90=8E=E8=80=85=E5=8F=AA=
=E7=BB=9F=E8=AE=A1=E5=AE=9E=E9=99=85=E6=8E=A5=E6=94=B6=E5=88=B0=E7=9A=84=E5=
=AD=97=E8=8A=82=EF=BC=8C=E8=80=8C=E6=95=B0=E6=8D=AE=E5=AD=97=E6=AE=B5=E5=B1=
=95=E7=A4=BA=E7=9A=84
> > +  =E6=98=AF=E6=95=B4=E4=B8=AA=E4=BC=A0=E8=BE=93=E7=BC=93=E5=86=B2=E5=
=8C=BA=E3=80=82
> >  =20
> >  =20
> >  =20
> > @@ -234,18 +198,16 @@ usbmon =E6=8A=A5=E5=91=8A=E7=9A=84=E6=98=AF=E5=90=
=84=E4=B8=AA=E5=A4=96=E8=AE=BE=E9=A9=B1=E5=8A=A8
> >       d5ea89a0 3575914555 SCi:1:001:0 s a3 00 0000 0003 0004 4 <
> >       d5ea89a0 3575914560 CCi:1:001:0 0 4 =3D 01050000
> >  =20
> > -=E5=90=91=E5=9C=B0=E5=9D=80=E4=B8=BA 5 =E7=9A=84=E5=AD=98=E5=82=A8=E8=
=AE=BE=E5=A4=87=E5=8F=91=E9=80=81
> > -31 =E5=AD=97=E8=8A=82 Bulk =E5=8C=85=E8=A3=85=E7=9A=84 SCSI =E5=91=BD=
=E4=BB=A4 ``0x28``
> > -=EF=BC=88``READ_10``=EF=BC=89=E7=9A=84=E8=BE=93=E5=87=BA=E6=89=B9=E9=
=87=8F=E4=BC=A0=E8=BE=93::
> > +=E5=90=91=E5=9C=B0=E5=9D=80=E4=B8=BA 5 =E7=9A=84=E5=AD=98=E5=82=A8=E8=
=AE=BE=E5=A4=87=E5=8F=91=E9=80=81=E4=B8=80=E4=B8=AA=E8=BE=93=E5=87=BA=E6=89=
=B9=E9=87=8F=E4=BC=A0=E8=BE=93=EF=BC=8C=E5=85=B6=E4=B8=AD 31 =E5=AD=97=E8=
=8A=82=E7=9A=84 Bulk
> > =E5=B0=81=E8=A3=85=E7=94=A8=E4=BA=8E=E6=89=BF +=E8=BD=BD SCSI =E5=91=BD=
=E4=BB=A4 ``0x28``=EF=BC=88``READ_10``=EF=BC=89::
> >  =20
> >       dd65f0e8 4128379752 SBo:1:005:2 -115 31 =3D 55534243 ad000000
> > 00800000 80010a28 20000000 20000040 00000000 000000 dd65f0e8
> > 4128379808 CBo:1:005:2 0 31 >=20
> >   =E5=8E=9F=E5=A7=8B=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=B8=
=8E API
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -API =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=
=96=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=
=8B=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=
=E9=80=92=E3=80=82
> > -=E6=AF=8F=E4=B8=AA=E4=BA=8B=E4=BB=B6=E9=83=BD=E9=80=9A=E8=BF=87=E4=B8=
=8B=E9=9D=A2=E7=9A=84=E7=BB=93=E6=9E=84=E5=8F=91=E9=80=81
> > -=EF=BC=88=E8=BF=99=E4=B8=AA=E5=90=8D=E5=AD=97=E6=98=AF=E4=B8=BA=E4=BA=
=86=E5=8F=99=E8=BF=B0=E6=96=B9=E4=BE=BF=E8=80=8C=E8=99=9A=E6=9E=84=E7=9A=84=
=EF=BC=89::
> > +API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92=E3=80=82=E6=AF=8F=E4=B8=AA=E4=BA=8B=E4=BB=B6=E9=83=BD=E9=80=9A=E8=BF=
=87
> > +=E4=B8=8B=E9=9D=A2=E7=9A=84=E7=BB=93=E6=9E=84=E5=8F=91=E9=80=81=EF=BC=
=88=E8=BF=99=E4=B8=AA=E7=BB=93=E6=9E=84=E5=90=8D=E5=8F=AA=E6=98=AF=E4=B8=BA=
=E4=BA=86=E5=8F=99=E8=BF=B0=E6=96=B9=E4=BE=BF=E8=80=8C=E8=99=9A=E6=9E=84=E7=
=9A=84=EF=BC=89::=20
> >  =20
> >     struct usbmon_packet {
> > @@ -275,29 +237,22 @@ API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92 unsigned int
> > ndesc;	/* 60: =E5=AE=9E=E9=99=85 ISO =E6=8F=8F=E8=BF=B0=E7=AC=A6=E6=95=
=B0=E9=87=8F */ };
> > 		/* 64 =E6=80=BB=E9=95=BF=E5=BA=A6 */=20
> > -=E5=8F=AF=E4=BB=A5=E7=94=A8 ``read(2)``=E3=80=81``ioctl(2)``=EF=BC=8C
> > -=E6=88=96=E8=80=85=E9=80=9A=E8=BF=87 ``mmap`` =E8=AE=BF=E9=97=AE=E7=BC=
=93=E5=86=B2=E5=8C=BA=EF=BC=8C
> > -=E4=BB=8E=E5=AD=97=E7=AC=A6=E8=AE=BE=E5=A4=87=E6=8E=A5=E6=94=B6=E8=BF=
=99=E4=BA=9B=E4=BA=8B=E4=BB=B6=E3=80=82
> > -=E4=B8=8D=E8=BF=87=EF=BC=8C=E5=87=BA=E4=BA=8E=E5=85=BC=E5=AE=B9=E6=80=
=A7=E5=8E=9F=E5=9B=A0=EF=BC=8C``read(2)``
> > -=E5=8F=AA=E8=BF=94=E5=9B=9E=E5=89=8D 48 =E4=B8=AA=E5=AD=97=E8=8A=82=E3=
=80=82
> > +=E5=8F=AF=E4=BB=A5=E7=94=A8 ``read(2)``=E3=80=81``ioctl(2)``=EF=BC=8C=
=E6=88=96=E8=80=85=E9=80=9A=E8=BF=87 ``mmap``
> > =E8=AE=BF=E9=97=AE=E7=BC=93=E5=86=B2=E5=8C=BA=EF=BC=8C=E4=BB=8E=E5=AD=
=97=E7=AC=A6=E8=AE=BE
> > +=E5=A4=87=E6=8E=A5=E6=94=B6=E8=BF=99=E4=BA=9B=E4=BA=8B=E4=BB=B6=E3=80=
=82=E4=B8=8D=E8=BF=87=EF=BC=8C=E5=87=BA=E4=BA=8E=E5=85=BC=E5=AE=B9=E6=80=A7=
=E5=8E=9F=E5=9B=A0=EF=BC=8C``read(2)`` =E5=8F=AA=E8=BF=94=E5=9B=9E=E5=89=8D=
 48
> > =E4=B8=AA=E5=AD=97=E8=8A=82=E3=80=82 -=E5=AD=97=E7=AC=A6=E8=AE=BE=E5=A4=
=87=E9=80=9A=E5=B8=B8=E5=91=BD=E5=90=8D=E4=B8=BA ``/dev/usbmonN``=EF=BC=8C
> > -=E5=85=B6=E4=B8=AD ``N`` =E6=98=AF USB =E6=80=BB=E7=BA=BF=E5=8F=B7=E3=
=80=82
> > -=E7=BC=96=E5=8F=B7=E4=B8=BA=E9=9B=B6=E7=9A=84=E8=AE=BE=E5=A4=87=EF=BC=
=88``/dev/usbmon0``=EF=BC=89=E6=AF=94=E8=BE=83=E7=89=B9=E6=AE=8A=EF=BC=8C
> > -=E8=A1=A8=E7=A4=BA=E2=80=9C=E6=89=80=E6=9C=89=E6=80=BB=E7=BA=BF=E2=80=
=9D=E3=80=82
> > -=E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8C=E5=85=B7=E4=BD=93=E5=91=BD=E5=90=
=8D=E7=AD=96=E7=95=A5=E7=94=B1 Linux =E5=8F=91=E8=A1=8C=E7=89=88=E5=86=B3=
=E5=AE=9A=E3=80=82
> > +=E5=AD=97=E7=AC=A6=E8=AE=BE=E5=A4=87=E9=80=9A=E5=B8=B8=E5=91=BD=E5=90=
=8D=E4=B8=BA ``/dev/usbmonN``=EF=BC=8C=E5=85=B6=E4=B8=AD ``N`` =E6=98=AF USB
> > =E6=80=BB=E7=BA=BF=E5=8F=B7=E3=80=82=E7=BC=96=E5=8F=B7=E4=B8=BA=E9=9B=
=B6=E7=9A=84
> > +=E8=AE=BE=E5=A4=87=EF=BC=88``/dev/usbmon0``=EF=BC=89=E6=AF=94=E8=BE=83=
=E7=89=B9=E6=AE=8A=EF=BC=8C=E8=A1=A8=E7=A4=BA=E2=80=9C=E6=89=80=E6=9C=89=E6=
=80=BB=E7=BA=BF=E2=80=9D=E3=80=82=E5=85=B7=E4=BD=93=E5=91=BD=E5=90=8D=E7=AD=
=96=E7=95=A5=E7=94=B1
> > Linux +=E5=8F=91=E8=A1=8C=E7=89=88=E5=86=B3=E5=AE=9A=E3=80=82=20
> > -=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=89=8B=E5=8A=A8=E5=88=9B=E5=BB=BA ``/dev=
/usbmon0``=EF=BC=8C
> > -=E8=AF=B7=E7=A1=AE=E4=BF=9D=E5=AE=83=E5=BD=92 root =E6=89=80=E6=9C=89=
=EF=BC=8C=E5=B9=B6=E4=B8=94=E6=9D=83=E9=99=90=E4=B8=BA ``0600``=E3=80=82
> > -=E5=90=A6=E5=88=99=EF=BC=8C=E9=9D=9E=E7=89=B9=E6=9D=83=E7=94=A8=E6=88=
=B7=E5=B0=86=E8=83=BD=E5=A4=9F=E7=AA=83=E5=90=AC=E9=94=AE=E7=9B=98=E6=B5=81=
=E9=87=8F=E3=80=82
> > +=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=89=8B=E5=8A=A8=E5=88=9B=E5=BB=BA ``/dev=
/usbmon0``=EF=BC=8C=E8=AF=B7=E7=A1=AE=E4=BF=9D=E5=AE=83=E5=BD=92 root =E6=
=89=80=E6=9C=89=EF=BC=8C=E5=B9=B6=E4=B8=94=E6=9D=83=E9=99=90=E4=B8=BA
> > ``0600``=E3=80=82 +=E5=90=A6=E5=88=99=EF=BC=8C=E9=9D=9E=E7=89=B9=E6=9D=
=83=E7=94=A8=E6=88=B7=E5=B0=B1=E8=83=BD=E7=AA=83=E5=90=AC=E9=94=AE=E7=9B=98=
=E8=BE=93=E5=85=A5=E6=B5=81=E9=87=8F=E3=80=82
> >  =20
> >   =E4=BB=A5=E4=B8=8B ``MON_IOC_MAGIC`` =E4=B8=BA ``0x92`` =E7=9A=84 ioc=
tl =E8=B0=83=E7=94=A8=E5=8F=AF=E7=94=A8=EF=BC=9A
> >  =20
> >   ``MON_IOCQ_URB_LEN``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA ``_IO(MON_IO=
C_MAGIC, 1)``
> >  =20
> > -=E8=AF=A5=E8=B0=83=E7=94=A8=E8=BF=94=E5=9B=9E=E4=B8=8B=E4=B8=80=E4=B8=
=AA=E4=BA=8B=E4=BB=B6=E7=9A=84=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E3=80=82
> > -=E6=B3=A8=E6=84=8F=E5=A4=A7=E5=A4=9A=E6=95=B0=E4=BA=8B=E4=BB=B6=E4=B8=
=8D=E5=8C=85=E5=90=AB=E6=95=B0=E6=8D=AE=EF=BC=8C
> > -=E5=9B=A0=E6=AD=A4=E5=A6=82=E6=9E=9C=E8=AF=A5=E8=B0=83=E7=94=A8=E8=BF=
=94=E5=9B=9E=E9=9B=B6=EF=BC=8C=E5=B9=B6=E4=B8=8D=E6=84=8F=E5=91=B3=E7=9D=80=
=E6=B2=A1=E6=9C=89=E4=BA=8B=E4=BB=B6=E3=80=82
> > +=E8=AF=A5=E8=B0=83=E7=94=A8=E8=BF=94=E5=9B=9E=E4=B8=8B=E4=B8=80=E4=B8=
=AA=E4=BA=8B=E4=BB=B6=E7=9A=84=E6=95=B0=E6=8D=AE=E9=95=BF=E5=BA=A6=E3=80=82=
=E6=B3=A8=E6=84=8F=E5=A4=A7=E5=A4=9A=E6=95=B0=E4=BA=8B=E4=BB=B6=E4=B8=8D=E5=
=8C=85=E5=90=AB=E6=95=B0=E6=8D=AE=EF=BC=8C=E5=9B=A0=E6=AD=A4=E5=A6=82=E6=9E=
=9C=E5=AE=83=E8=BF=94=E5=9B=9E
> > +=E9=9B=B6=EF=BC=8C=E5=B9=B6=E4=B8=8D=E6=84=8F=E5=91=B3=E7=9D=80=E6=B2=
=A1=E6=9C=89=E4=BA=8B=E4=BB=B6=E3=80=82
> >  =20
> >   ``MON_IOCG_STATS``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA
> >   ``_IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)``
> > @@ -309,31 +264,28 @@ API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92 u32 dropped;
> >     };
> >  =20
> > -=E6=88=90=E5=91=98 ``queued`` =E8=A1=A8=E7=A4=BA=E5=BD=93=E5=89=8D=E7=
=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E5=B7=B2=E7=BB=8F=E6=8E=92=E9=98=9F=E7=9A=
=84=E4=BA=8B=E4=BB=B6=E6=95=B0=E9=87=8F=EF=BC=8C
> > -=E8=80=8C=E4=B8=8D=E6=98=AF=E8=87=AA=E4=B8=8A=E6=AC=A1=E9=87=8D=E7=BD=
=AE=E4=BB=A5=E6=9D=A5=E5=A4=84=E7=90=86=E8=BF=87=E7=9A=84=E4=BA=8B=E4=BB=B6=
=E6=95=B0=E9=87=8F=E3=80=82
> > +=E6=88=90=E5=91=98 ``queued``
> > =E8=A1=A8=E7=A4=BA=E5=BD=93=E5=89=8D=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=
=AD=E5=B7=B2=E7=BB=8F=E6=8E=92=E9=98=9F=E7=9A=84=E4=BA=8B=E4=BB=B6=E6=95=B0=
=E9=87=8F=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E8=87=AA=E4=B8=8A=E6=AC=A1=E9=
=87=8D=E7=BD=AE=E4=BB=A5=E6=9D=A5
> > +=E5=A4=84=E7=90=86=E8=BF=87=E7=9A=84=E4=BA=8B=E4=BB=B6=E6=95=B0=E9=87=
=8F=E3=80=82=20
> > -=E6=88=90=E5=91=98 ``dropped`` =E8=A1=A8=E7=A4=BA=E8=87=AA=E4=B8=8A=E6=
=AC=A1=E8=B0=83=E7=94=A8
> > -``MON_IOCG_STATS`` =E4=BB=A5=E6=9D=A5=E4=B8=A2=E5=A4=B1=E7=9A=84=E4=BA=
=8B=E4=BB=B6=E6=95=B0=E9=87=8F=E3=80=82
> > +=E6=88=90=E5=91=98 ``dropped`` =E8=A1=A8=E7=A4=BA=E8=87=AA=E4=B8=8A=E6=
=AC=A1=E8=B0=83=E7=94=A8 ``MON_IOCG_STATS``
> > =E4=BB=A5=E6=9D=A5=E4=B8=A2=E5=A4=B1=E7=9A=84=E4=BA=8B=E4=BB=B6=E6=95=
=B0=E9=87=8F=E3=80=82=20
> >   ``MON_IOCT_RING_SIZE``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA ``_IO(MON_=
IOC_MAGIC, 4)``
> >  =20
> > -=E6=AD=A4=E8=B0=83=E7=94=A8=E8=AE=BE=E7=BD=AE=E7=BC=93=E5=86=B2=E5=8C=
=BA=E5=A4=A7=E5=B0=8F=E3=80=82=E5=8F=82=E6=95=B0=E4=B8=BA=E4=BB=A5=E5=AD=97=
=E8=8A=82=E4=B8=BA=E5=8D=95=E4=BD=8D=E7=9A=84=E7=BC=93=E5=86=B2=E5=8C=BA=E5=
=A4=A7=E5=B0=8F=E3=80=82
> > -=E5=A4=A7=E5=B0=8F=E5=8F=AF=E8=83=BD=E4=BC=9A=E5=90=91=E4=B8=8B=E5=8F=
=96=E6=95=B4=E5=88=B0=E4=B8=8B=E4=B8=80=E4=B8=AA=E5=9D=97=EF=BC=88=E6=88=96=
=E9=A1=B5=EF=BC=89=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E8=AF=B7=E6=B1=82=E7=9A=84=E5=A4=A7=E5=B0=8F=E8=B6=
=85=E5=87=BA=E8=AF=A5=E5=86=85=E6=A0=B8=E7=9A=84 [=E6=9C=AA=E6=8C=87=E5=AE=
=9A] =E8=8C=83=E5=9B=B4=EF=BC=8C
> > -=E5=88=99=E8=B0=83=E7=94=A8=E4=BC=9A=E5=A4=B1=E8=B4=A5=E5=B9=B6=E8=BF=
=94=E5=9B=9E ``-EINVAL``=E3=80=82
> > +=E6=AD=A4=E8=B0=83=E7=94=A8=E8=AE=BE=E7=BD=AE=E7=BC=93=E5=86=B2=E5=8C=
=BA=E5=A4=A7=E5=B0=8F=E3=80=82=E5=8F=82=E6=95=B0=E6=98=AF=E4=BB=A5=E5=AD=97=
=E8=8A=82=E4=B8=BA=E5=8D=95=E4=BD=8D=E7=9A=84=E7=BC=93=E5=86=B2=E5=8C=BA=E5=
=A4=A7=E5=B0=8F=E3=80=82=E5=A4=A7=E5=B0=8F=E5=8F=AF=E8=83=BD=E4=BC=9A=E5=90=
=91=E4=B8=8B=E5=8F=96=E6=95=B4
> > +=E5=88=B0=E4=B8=8B=E4=B8=80=E4=B8=AA=E5=9D=97=EF=BC=88=E6=88=96=E9=A1=
=B5=EF=BC=89=E3=80=82=E5=A6=82=E6=9E=9C=E8=AF=B7=E6=B1=82=E7=9A=84=E5=A4=A7=
=E5=B0=8F=E8=B6=85=E5=87=BA=E5=BD=93=E5=89=8D=E5=86=85=E6=A0=B8=E5=85=81=E8=
=AE=B8=E7=9A=84=E8=8C=83=E5=9B=B4=EF=BC=8C=E5=88=99=E8=B0=83=E7=94=A8=E4=BC=
=9A=E5=A4=B1=E8=B4=A5=E5=B9=B6
> > +=E8=BF=94=E5=9B=9E ``-EINVAL``=E3=80=82
> >  =20
> >   ``MON_IOCQ_RING_SIZE``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA ``_IO(MON_=
IOC_MAGIC, 5)``
> >  =20
> >   =E8=AF=A5=E8=B0=83=E7=94=A8=E8=BF=94=E5=9B=9E=E7=BC=93=E5=86=B2=E5=8C=
=BA=E5=BD=93=E5=89=8D=E5=A4=A7=E5=B0=8F=EF=BC=88=E4=BB=A5=E5=AD=97=E8=8A=82=
=E4=B8=BA=E5=8D=95=E4=BD=8D=EF=BC=89=E3=80=82
> >  =20
> > -``MON_IOCX_GET``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA
> > -``_IOW(MON_IOC_MAGIC, 6, struct mon_get_arg)``
> > -``MON_IOCX_GETX``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA
> > -``_IOW(MON_IOC_MAGIC, 10, struct mon_get_arg)``
> > +``MON_IOCX_GET`` =E5=92=8C ``MON_IOCX_GETX`` =E7=9A=84=E5=AE=9A=E4=B9=
=89=E5=88=86=E5=88=AB=E5=A6=82=E4=B8=8B=EF=BC=9A
> > +
> > +- ``MON_IOCX_GET``=EF=BC=9A``_IOW(MON_IOC_MAGIC, 6, struct mon_get_arg=
)``
> > +- ``MON_IOCX_GETX``=EF=BC=9A``_IOW(MON_IOC_MAGIC, 10, struct
> > mon_get_arg)``=20
> > -=E5=A6=82=E6=9E=9C=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=
=AD=E6=B2=A1=E6=9C=89=E4=BA=8B=E4=BB=B6=EF=BC=8C
> > -=E8=BF=99=E4=BA=9B=E8=B0=83=E7=94=A8=E5=B0=B1=E4=BC=9A=E4=B8=80=E7=9B=
=B4=E7=AD=89=E5=BE=85=EF=BC=8C=E7=9B=B4=E5=88=B0=E6=9C=89=E4=BA=8B=E4=BB=B6=
=E5=88=B0=E8=BE=BE=EF=BC=8C
> > -=E7=84=B6=E5=90=8E=E8=BF=94=E5=9B=9E=E7=AC=AC=E4=B8=80=E4=B8=AA=E4=BA=
=8B=E4=BB=B6=E3=80=82
> > +=E5=A6=82=E6=9E=9C=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=
=AD=E6=B2=A1=E6=9C=89=E4=BA=8B=E4=BB=B6=EF=BC=8C=E8=BF=99=E4=BA=9B=E8=B0=83=
=E7=94=A8=E5=B0=B1=E4=BC=9A=E4=B8=80=E7=9B=B4=E7=AD=89=E5=BE=85=EF=BC=8C=E7=
=9B=B4=E5=88=B0=E6=9C=89=E4=BA=8B=E4=BB=B6=E5=88=B0=E8=BE=BE=EF=BC=8C=E7=84=
=B6=E5=90=8E=E8=BF=94=E5=9B=9E
> > +=E7=AC=AC=E4=B8=80=E4=B8=AA=E4=BA=8B=E4=BB=B6=E3=80=82
> >   =E5=8F=82=E6=95=B0=E6=98=AF=E6=8C=87=E5=90=91=E4=BB=A5=E4=B8=8B=E7=BB=
=93=E6=9E=84=E7=9A=84=E6=8C=87=E9=92=88::
> >  =20
> >     struct mon_get_arg {
> > @@ -343,20 +295,18 @@ API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92 };
> >  =20
> >  =20
> > -=E8=B0=83=E7=94=A8=E5=89=8D=EF=BC=8C=E5=BA=94=E5=A1=AB=E5=A5=BD ``hdr`=
`=E3=80=81``data`` =E5=92=8C ``alloc``=E3=80=82
> > -=E8=B0=83=E7=94=A8=E8=BF=94=E5=9B=9E=E5=90=8E=EF=BC=8C``hdr`` =E6=8C=
=87=E5=90=91=E7=9A=84=E5=8C=BA=E5=9F=9F=E4=B8=AD=E5=8C=85=E5=90=AB=E4=B8=8B=
=E4=B8=80=E4=B8=AA=E4=BA=8B=E4=BB=B6=E7=9A=84=E7=BB=93=E6=9E=84=EF=BC=9B
> > -=E5=A6=82=E6=9E=9C=E5=AD=98=E5=9C=A8=E6=95=B0=E6=8D=AE=EF=BC=8C=E9=82=
=A3=E4=B9=88=E6=95=B0=E6=8D=AE=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E4=B9=9F=
=E4=BC=9A=E5=8C=85=E5=90=AB=E7=9B=B8=E5=BA=94=E6=95=B0=E6=8D=AE=E3=80=82
> > -=E8=AF=A5=E4=BA=8B=E4=BB=B6=E4=BC=9A=E4=BB=8E=E5=86=85=E6=A0=B8=E7=BC=
=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E7=A7=BB=E9=99=A4=E3=80=82
> > +=E8=B0=83=E7=94=A8=E5=89=8D=EF=BC=8C=E5=BA=94=E5=A1=AB=E5=A5=BD ``hdr`=
`=E3=80=81``data`` =E5=92=8C ``alloc``=E3=80=82=E8=B0=83=E7=94=A8=E8=BF=94=
=E5=9B=9E=E5=90=8E=EF=BC=8C``hdr``
> > =E6=8C=87=E5=90=91=E7=9A=84
> > +=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=E4=B8=AD=E4=BC=9A=E5=86=99=E5=85=
=A5=E4=B8=8B=E4=B8=80=E4=B8=AA=E4=BA=8B=E4=BB=B6=E7=9A=84=E7=BB=93=E6=9E=84=
=EF=BC=9B=E5=A6=82=E6=9E=9C=E5=AD=98=E5=9C=A8=E6=95=B0=E6=8D=AE=EF=BC=8C=E6=
=95=B0=E6=8D=AE=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E4=B9=9F=E4=BC=9A=E5=A1=
=AB=E5=85=A5=E7=9B=B8=E5=BA=94
> > +=E5=86=85=E5=AE=B9=E3=80=82=E8=AF=A5=E4=BA=8B=E4=BB=B6=E4=BC=9A=E4=BB=
=8E=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E7=A7=BB=E9=99=A4=
=E3=80=82=20
> > -``MON_IOCX_GET`` =E4=BC=9A=E5=B0=86 48 =E5=AD=97=E8=8A=82=E7=9A=84=E6=
=95=B0=E6=8D=AE=E5=A4=8D=E5=88=B6=E5=88=B0 ``hdr`` =E5=8C=BA=E5=9F=9F=EF=BC=
=8C
> > -``MON_IOCX_GETX`` =E4=BC=9A=E5=A4=8D=E5=88=B6 64 =E5=AD=97=E8=8A=82=E3=
=80=82
> > +``MON_IOCX_GET`` =E4=BC=9A=E5=B0=86 48 =E5=AD=97=E8=8A=82=E7=9A=84=E6=
=95=B0=E6=8D=AE=E5=A4=8D=E5=88=B6=E5=88=B0 ``hdr``
> > =E5=8C=BA=E5=9F=9F=EF=BC=8C``MON_IOCX_GETX`` +=E4=BC=9A=E5=A4=8D=E5=88=
=B6 64 =E5=AD=97=E8=8A=82=E3=80=82
> >  =20
> >   ``MON_IOCX_MFETCH``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA
> >   ``_IOWR(MON_IOC_MAGIC, 7, struct mon_mfetch_arg)``
> >  =20
> > -=E5=BD=93=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E9=80=9A=E8=BF=87 ``mmap=
(2)`` =E8=AE=BF=E9=97=AE=E7=BC=93=E5=86=B2=E5=8C=BA=E6=97=B6=EF=BC=8C
> > -=E4=B8=BB=E8=A6=81=E4=BD=BF=E7=94=A8=E8=BF=99=E4=B8=AA ioctl=E3=80=82
> > -=E5=85=B6=E5=8F=82=E6=95=B0=E6=98=AF=E6=8C=87=E5=90=91=E4=BB=A5=E4=B8=
=8B=E7=BB=93=E6=9E=84=E7=9A=84=E6=8C=87=E9=92=88::
> > +=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E9=80=9A=E8=BF=87 ``mmap(2)`` =E8=
=AE=BF=E9=97=AE=E7=BC=93=E5=86=B2=E5=8C=BA=E6=97=B6=EF=BC=8C=E4=B8=BB=E8=A6=
=81=E4=BD=BF=E7=94=A8=E8=BF=99=E4=B8=AA
> > ioctl=E3=80=82=E5=85=B6=E5=8F=82=E6=95=B0=E6=98=AF=E6=8C=87=E5=90=91 +=
=E4=BB=A5=E4=B8=8B=E7=BB=93=E6=9E=84=E7=9A=84=E6=8C=87=E9=92=88::
> >  =20
> >     struct mon_mfetch_arg {
> >   	uint32_t *offvec;	/* =E8=8E=B7=E5=8F=96=E7=9A=84=E4=BA=8B=E4=BB=B6=
=E5=81=8F=E7=A7=BB=E5=90=91=E9=87=8F */
> > @@ -365,41 +315,36 @@ API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92 };
> >  =20
> >  =20
> > -=E8=AF=A5 ioctl =E7=9A=84=E6=93=8D=E4=BD=9C=E5=88=86=E4=B8=BA=E4=B8=89=
=E4=B8=AA=E9=98=B6=E6=AE=B5=EF=BC=9A
> > +=E8=BF=99=E4=B8=AA ioctl =E7=9A=84=E6=B5=81=E7=A8=8B=E5=88=86=E4=B8=BA=
=E4=B8=89=E4=B8=AA=E9=98=B6=E6=AE=B5=EF=BC=9A
> >  =20
> > -=E9=A6=96=E5=85=88=EF=BC=8C=E4=BB=8E=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=
=B2=E5=8C=BA=E7=A7=BB=E9=99=A4=E5=B9=B6=E4=B8=A2=E5=BC=83=E6=9C=80=E5=A4=9A=
 ``nflush`` =E4=B8=AA=E4=BA=8B=E4=BB=B6=E3=80=82
> > -=E5=AE=9E=E9=99=85=E4=B8=A2=E5=BC=83=E7=9A=84=E4=BA=8B=E4=BB=B6=E6=95=
=B0=E9=87=8F=E4=BC=9A=E5=86=99=E5=9B=9E ``nflush``=E3=80=82
> > +=E9=A6=96=E5=85=88=EF=BC=8C=E4=BB=8E=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=
=B2=E5=8C=BA=E7=A7=BB=E9=99=A4=E5=B9=B6=E4=B8=A2=E5=BC=83=E6=9C=80=E5=A4=9A=
 ``nflush``
> > =E4=B8=AA=E4=BA=8B=E4=BB=B6=E3=80=82=E5=AE=9E=E9=99=85=E4=B8=A2=E5=BC=
=83=E7=9A=84=E4=BA=8B=E4=BB=B6=E6=95=B0=E9=87=8F=E4=BC=9A +=E5=86=99=E5=9B=
=9E ``nflush``=E3=80=82
> >  =20
> > -=E5=85=B6=E6=AC=A1=EF=BC=8C=E9=99=A4=E9=9D=9E=E4=BC=AA=E8=AE=BE=E5=A4=
=87=E4=BB=A5 ``O_NONBLOCK`` =E6=89=93=E5=BC=80=EF=BC=8C=E5=90=A6=E5=88=99=
=E4=BC=9A=E4=B8=80=E7=9B=B4=E7=AD=89=E5=BE=85=EF=BC=8C
> > -=E7=9B=B4=E5=88=B0=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E5=87=BA=E7=8E=
=B0=E4=BA=8B=E4=BB=B6=E3=80=82
> > +=E5=85=B6=E6=AC=A1=EF=BC=8C=E9=99=A4=E9=9D=9E=E8=AE=BE=E5=A4=87=E4=BB=
=A5 ``O_NONBLOCK``
> > =E6=89=93=E5=BC=80=EF=BC=8C=E5=90=A6=E5=88=99=E4=BC=9A=E4=B8=80=E7=9B=
=B4=E7=AD=89=E5=BE=85=EF=BC=8C=E7=9B=B4=E5=88=B0=E7=BC=93=E5=86=B2=E5=8C=BA=
=E4=B8=AD=E5=87=BA=E7=8E=B0 +=E4=BA=8B=E4=BB=B6=E3=80=82
> >  =20
> > -=E7=AC=AC=E4=B8=89=EF=BC=8C=E5=B0=86=E6=9C=80=E5=A4=9A ``nfetch`` =E4=
=B8=AA=E5=81=8F=E7=A7=BB=E9=87=8F=E6=8F=90=E5=8F=96=E5=88=B0 mmap
> > -=E7=BC=93=E5=86=B2=E5=8C=BA=EF=BC=8C=E5=B9=B6=E5=AD=98=E5=85=A5 ``offv=
ec`` =E4=B8=AD=E3=80=82
> > -=E5=AE=9E=E9=99=85=E6=8F=90=E5=8F=96=E5=88=B0=E7=9A=84=E4=BA=8B=E4=BB=
=B6=E5=81=8F=E7=A7=BB=E6=95=B0=E9=87=8F=E4=BC=9A=E5=AD=98=E5=9B=9E ``nfetch=
``=E3=80=82
> > +=E7=AC=AC=E4=B8=89=EF=BC=8C=E5=B0=86=E6=9C=80=E5=A4=9A ``nfetch`` =E4=
=B8=AA=E5=81=8F=E7=A7=BB=E9=87=8F=E6=8F=90=E5=8F=96=E5=88=B0 mmap =E7=BC=93=
=E5=86=B2=E5=8C=BA=EF=BC=8C=E5=B9=B6=E5=AD=98=E5=85=A5
> > ``offvec`` =E4=B8=AD=E3=80=82 +=E5=AE=9E=E9=99=85=E6=8F=90=E5=8F=96=E5=
=88=B0=E7=9A=84=E4=BA=8B=E4=BB=B6=E5=81=8F=E7=A7=BB=E6=95=B0=E9=87=8F=E4=BC=
=9A=E5=86=99=E5=9B=9E ``nfetch``=E3=80=82
> >  =20
> >   ``MON_IOCH_MFLUSH``=EF=BC=8C=E5=AE=9A=E4=B9=89=E4=B8=BA ``_IO(MON_IOC=
_MAGIC, 8)``
> >  =20
> > -=E6=AD=A4=E8=B0=83=E7=94=A8=E4=BB=8E=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=
=B2=E5=8C=BA=E7=A7=BB=E9=99=A4=E8=8B=A5=E5=B9=B2=E4=BA=8B=E4=BB=B6=E3=80=82
> > -=E5=85=B6=E5=8F=82=E6=95=B0=E4=B8=BA=E8=A6=81=E7=A7=BB=E9=99=A4=E7=9A=
=84=E4=BA=8B=E4=BB=B6=E6=95=B0=E9=87=8F=E3=80=82
> > -=E5=A6=82=E6=9E=9C=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E7=9A=84=E4=BA=
=8B=E4=BB=B6=E5=B0=91=E4=BA=8E=E8=AF=B7=E6=B1=82=E6=95=B0=E9=87=8F=EF=BC=8C
> > -=E5=88=99=E7=A7=BB=E9=99=A4=E6=89=80=E6=9C=89=E4=BA=8B=E4=BB=B6=EF=BC=
=8C=E4=B8=94=E4=B8=8D=E6=8A=A5=E5=91=8A=E9=94=99=E8=AF=AF=E3=80=82
> > -=E5=BD=93=E6=B2=A1=E6=9C=89=E4=BA=8B=E4=BB=B6=E6=97=B6=E4=B9=9F=E5=8F=
=AF=E4=BD=BF=E7=94=A8=E3=80=82
> > +=E6=AD=A4=E8=B0=83=E7=94=A8=E4=BB=8E=E5=86=85=E6=A0=B8=E7=BC=93=E5=86=
=B2=E5=8C=BA=E7=A7=BB=E9=99=A4=E8=8B=A5=E5=B9=B2=E4=BA=8B=E4=BB=B6=E3=80=82=
=E5=85=B6=E5=8F=82=E6=95=B0=E6=98=AF=E8=A6=81=E7=A7=BB=E9=99=A4=E7=9A=84=E4=
=BA=8B=E4=BB=B6=E6=95=B0=E9=87=8F=E3=80=82=E5=A6=82=E6=9E=9C=E7=BC=93=E5=86=
=B2=E5=8C=BA=E4=B8=AD=E7=9A=84
> > +=E4=BA=8B=E4=BB=B6=E5=B0=91=E4=BA=8E=E8=AF=B7=E6=B1=82=E6=95=B0=E9=87=
=8F=EF=BC=8C=E5=88=99=E7=A7=BB=E9=99=A4=E5=85=A8=E9=83=A8=E7=8E=B0=E6=9C=89=
=E4=BA=8B=E4=BB=B6=EF=BC=8C=E4=B8=94=E4=B8=8D=E6=8A=A5=E5=91=8A=E9=94=99=E8=
=AF=AF=E3=80=82=E5=8D=B3=E4=BD=BF=E5=BD=93=E5=89=8D=E6=B2=A1=E6=9C=89=E4=BA=
=8B=E4=BB=B6=EF=BC=8C=E4=B9=9F
> > +=E5=8F=AF=E4=BB=A5=E8=B0=83=E7=94=A8=E3=80=82
> >  =20
> >   ``FIONBIO``
> >  =20
> >   =E5=A6=82=E6=9E=9C=E6=9C=89=E9=9C=80=E8=A6=81=EF=BC=8C=E5=B0=86=E6=9D=
=A5=E5=8F=AF=E8=83=BD=E4=BC=9A=E5=AE=9E=E7=8E=B0 ``FIONBIO`` ioctl=E3=80=82
> >  =20
> > -=E9=99=A4=E4=BA=86 ``ioctl(2)`` =E5=92=8C ``read(2)`` =E4=B9=8B=E5=A4=
=96=EF=BC=8C
> > -=E4=BA=8C=E8=BF=9B=E5=88=B6 API =E7=9A=84=E7=89=B9=E6=AE=8A=E6=96=87=
=E4=BB=B6=E4=B9=9F=E5=8F=AF=E4=BB=A5=E7=94=A8 ``select(2)`` =E5=92=8C
> > -``poll(2)`` =E8=BD=AE=E8=AF=A2=E3=80=82
> > -=E4=BD=86 ``lseek(2)`` =E4=B8=8D=E8=B5=B7=E4=BD=9C=E7=94=A8=E3=80=82
> > +=E9=99=A4=E4=BA=86 ``ioctl(2)`` =E5=92=8C ``read(2)`` =E4=B9=8B=E5=A4=
=96=EF=BC=8C=E4=BA=8C=E8=BF=9B=E5=88=B6 API
> > =E5=AF=B9=E5=BA=94=E7=9A=84=E7=89=B9=E6=AE=8A=E6=96=87=E4=BB=B6=E8=BF=
=98=E5=8F=AF=E4=BB=A5=E7=94=A8 +``select(2)`` =E5=92=8C ``poll(2)`` =E8=BD=
=AE=E8=AF=A2=EF=BC=8C=E4=BD=86
> > ``lseek(2)`` =E4=B8=8D=E5=8F=AF=E7=94=A8=E3=80=82=20
> >   * =E4=BA=8C=E8=BF=9B=E5=88=B6 API =E7=9A=84=E5=86=85=E6=A0=B8=E7=BC=
=93=E5=86=B2=E5=8C=BA=E5=86=85=E5=AD=98=E6=98=A0=E5=B0=84=E8=AE=BF=E9=97=AE
> >  =20
> > -=E5=9F=BA=E6=9C=AC=E6=80=9D=E6=83=B3=E5=BE=88=E7=AE=80=E5=8D=95=EF=BC=
=9A
> > +=E5=9F=BA=E6=9C=AC=E6=80=9D=E8=B7=AF=E5=BE=88=E7=AE=80=E5=8D=95=EF=BC=
=9A
> >  =20
> > -=E5=87=86=E5=A4=87=E6=97=B6=EF=BC=8C=E5=85=88=E8=8E=B7=E5=8F=96=E5=BD=
=93=E5=89=8D=E5=A4=A7=E5=B0=8F=EF=BC=8C=E5=86=8D=E7=94=A8 ``mmap(2)`` =E6=
=98=A0=E5=B0=84=E7=BC=93=E5=86=B2=E5=8C=BA=E3=80=82
> > -=E7=84=B6=E5=90=8E=E6=89=A7=E8=A1=8C=E7=B1=BB=E4=BC=BC=E4=B8=8B=E9=9D=
=A2=E4=BC=AA=E4=BB=A3=E7=A0=81=E7=9A=84=E5=BE=AA=E7=8E=AF::
> > +=E5=87=86=E5=A4=87=E6=97=B6=EF=BC=8C=E5=85=88=E6=9F=A5=E8=AF=A2=E5=BD=
=93=E5=89=8D=E5=A4=A7=E5=B0=8F=EF=BC=8C=E5=86=8D=E7=94=A8 ``mmap(2)``
> > =E6=98=A0=E5=B0=84=E7=BC=93=E5=86=B2=E5=8C=BA=E3=80=82=E4=B9=8B=E5=90=
=8E=E8=BF=90=E8=A1=8C=E4=B8=8E=E4=B8=8B=E9=9D=A2=E4=BC=AA=E4=BB=A3=E7=A0=81=
 +=E7=B1=BB=E4=BC=BC=E7=9A=84=E5=BE=AA=E7=8E=AF::
> >  =20
> >      struct mon_mfetch_arg fetch;
> >      struct usbmon_packet *hdr;
> > @@ -411,7 +356,7 @@ API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92 ioctl(fd,
> > MON_IOCX_MFETCH, &fetch);   // =E5=90=8C=E6=97=B6=E5=A4=84=E7=90=86=E9=
=94=99=E8=AF=AF nflush =3D fetch.nfetch;
> >      // =E5=AE=8C=E6=88=90=E5=90=8E=E8=A6=81=E5=88=B7=E6=96=B0=E8=BF=99=
=E4=B9=88=E5=A4=9A=E5=8C=85 for (i =3D 0; i < nflush; i++) {
> > -         hdr =3D (struct ubsmon_packet *) &mmap_area[vec[i]];
> > +         hdr =3D (struct usbmon_packet *) &mmap_area[vec[i]];
> >            if (hdr->type =3D=3D '@')     // =E5=A1=AB=E5=85=85=E5=8C=85
> >               continue;
> >            caddr_t data =3D &mmap_area[vec[i]] + 64;
> > @@ -421,7 +366,7 @@ API
> > =E7=9A=84=E6=95=B4=E4=BD=93=E6=9E=B6=E6=9E=84=E4=B8=8E=E5=89=8D=E6=96=
=87=E5=A4=A7=E4=BD=93=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=8F=AA=E6=98=AF=E4=BA=8B=
=E4=BB=B6=E4=BB=A5=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=A0=BC=E5=BC=8F=E4=BC=A0=E9=
=80=92=20
> >  =20
> >  =20
> > -=E5=9B=A0=E6=AD=A4=EF=BC=8C=E4=B8=BB=E8=A6=81=E6=80=9D=E6=83=B3=E6=98=
=AF=E6=AF=8F N =E4=B8=AA=E4=BA=8B=E4=BB=B6=E5=8F=AA=E6=89=A7=E8=A1=8C=E4=B8=
=80=E6=AC=A1 ioctl=E3=80=82
> > +=E5=9B=A0=E6=AD=A4=EF=BC=8C=E8=BF=99=E9=87=8C=E7=9A=84=E6=A0=B8=E5=BF=
=83=E6=80=9D=E8=B7=AF=E5=B0=B1=E6=98=AF=E6=AF=8F N =E4=B8=AA=E4=BA=8B=E4=BB=
=B6=E5=8F=AA=E6=89=A7=E8=A1=8C=E4=B8=80=E6=AC=A1 ioctl=E3=80=82
> >  =20
> > -=E8=99=BD=E7=84=B6=E7=BC=93=E5=86=B2=E5=8C=BA=E6=98=AF=E7=8E=AF=E5=BD=
=A2=E7=9A=84=EF=BC=8C=E4=BD=86=E8=BF=94=E5=9B=9E=E7=9A=84=E5=A4=B4=E5=92=8C=
=E6=95=B0=E6=8D=AE=E4=B8=8D=E4=BC=9A=E8=B7=A8=E8=B6=8A=E7=BC=93=E5=86=B2=E5=
=8C=BA=E6=9C=AB=E7=AB=AF=EF=BC=8C
> > -=E5=9B=A0=E6=AD=A4=E4=B8=8A=E9=9D=A2=E7=9A=84=E4=BC=AA=E4=BB=A3=E7=A0=
=81=E6=97=A0=E9=9C=80=E4=BB=BB=E4=BD=95=E5=90=88=E5=B9=B6=E6=93=8D=E4=BD=9C=
=E3=80=82
> > +=E8=99=BD=E7=84=B6=E7=BC=93=E5=86=B2=E5=8C=BA=E6=98=AF=E7=8E=AF=E5=BD=
=A2=E7=9A=84=EF=BC=8C=E4=BD=86=E8=BF=94=E5=9B=9E=E7=9A=84=E5=A4=B4=E9=83=A8=
=E5=92=8C=E6=95=B0=E6=8D=AE=E4=B8=8D=E4=BC=9A=E8=B7=A8=E8=B6=8A=E7=BC=93=E5=
=86=B2=E5=8C=BA=E6=9C=AB=E7=AB=AF=EF=BC=8C=E5=9B=A0=E6=AD=A4=E4=B8=8A=E9=9D=
=A2=E7=9A=84=E4=BC=AA=E4=BB=A3
> > +=E7=A0=81=E6=97=A0=E9=9C=80=E5=81=9A=E4=BB=BB=E4=BD=95=E6=8B=BC=E6=8E=
=A5=E3=80=82
> > -- 2.34.1
> >=20
>=20
>=20
>=20


