Return-Path: <linux-usb+bounces-36493-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BpwOPbZ7mkPygAAu9opvQ
	(envelope-from <linux-usb+bounces-36493-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 05:37:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708046C67B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 05:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10231301AF50
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 03:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556AA35E95A;
	Mon, 27 Apr 2026 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B31AOFzW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBB0246768
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 03:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261012; cv=pass; b=D7ojWGuhfOnBkhhEUEyDquPDCftd3xNSXJHrX1iHZj4oMKXbbGo/CGac8cr6zg1VCp6B0p7D+dc1J6+sfJzp51qiZOeROeFUNIJAZr5tbERPi3N36pBXm/sfcS+tb/AFB4wmp/pw8YkL8I5swtuGJFPqraEr0TU5zGy9TDS+SoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261012; c=relaxed/simple;
	bh=JNYWHSAS0mM07/xHVV9vWFww5l2zghr0xV/B25olxTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyIC+kXS5F8c1OZe2aLrQDlD4q/AuricKHxFNi6918CAlaSWunhB46joGwLPUHdfghZGsEDtrkShAVsX2w+Fe/f10m1itO1PeDzv8G1zysaV2HcwW6ptbH8q3KRPOAN8SxCJOZ7T8POJl7U4Yln4aamGra6hm/VVsTtr6BofW40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B31AOFzW; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79ab5fd969aso107030727b3.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Apr 2026 20:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777261011; cv=none;
        d=google.com; s=arc-20240605;
        b=WJCVy84vXTgn6xQ7OjX6RtvSM+qZby5NF5fKwhi/OFLJ4ZvkJ7eBECMwiZ8ymQ4nkg
         RHxTp1jsATSZ35eBVcQ9Yr1FdeGfImSSOOExmoRYwfu/Ea2KZ67lumhug8x9QNtfR2zP
         nFJvlhYGhk+IAqw4qJm2CNYcnSr2b5dRwCleGDtfteiC073PW0ycjUMhbTameWA4tzrn
         cyvE3mb737Gf8d29Eg25meBO/1mmBObHwDqcU9cYSZM4KdfGTK0gvFxFA+fRzOk7wcfQ
         YCNEnYnle0+jVikARdMj2ruyfbhcnfm5IGSDJ0PcIUo1nEgYZAMm7APNcdF5tTrnmROK
         NbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wGoIypBZ500KSDL4768d32gumk3PfTA+lWz+Ayaw11s=;
        fh=kmxxZtidsjgy6yfXCItXjxYwJopnyhLzCImGwaShWOA=;
        b=C9ts7a0ApFQbMoQ0mGfFWWDSRRMw1DeFAQ1pGpltqzjhjoub5kcRE177J25PqAZCA7
         huEbFxSfkBhS33PEFk5HFS8Ah/+HZTh45pT3zxz4KwuOrC5PG8fTMGIgtT4yMvbV0gCr
         OR+AG0sbwW8J3ZYB1c/PnwvNc3fkNl98JJDhJv2akzsTMgO/JqcSf+6CtvAthasXDaI9
         cclyTnm4RBV5cIH3jmDyGzfb/0Qn1mGP1yyyLUuARcnVTtCgS7hfKa5rCeKEWYOonyFw
         S8zYvONjgbsVabbOX50ZMAYl5U5WESk+YKYtkutWHWk1ksJ6ArLS+Fe0NWxqd+oRGhuk
         lDIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261011; x=1777865811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGoIypBZ500KSDL4768d32gumk3PfTA+lWz+Ayaw11s=;
        b=B31AOFzWGb5PXoHepDMdPT+jSF9CD2m+2FmOpA3rmLm2593t969TEoF6Mt03LTiJ6Q
         UUOI0/wvavyVoOfAafGnccRw7J87RACdxe1j3GwAEPh44S8E4IeWdn4EAYrGymuxzx7y
         0pmGIULWwANn/MVnrTQ6eNT0UNJCsIGqrUiRiajY5MDNd07ZXIt6z92WVCRC/vM7WV2B
         QVKisKZirTjbxUvS27ltuOup/Nk6sA1uIN1BmBp5TWb4RnpL8dusFkK/eNDFwh9bvyMX
         R3SwaLxeALWcEPXBK3YrR24HyR2uYgmi/x2mQzDzx6HctjEC4Y0Oz4BdbaLTCZ5TbOmZ
         WXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261011; x=1777865811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wGoIypBZ500KSDL4768d32gumk3PfTA+lWz+Ayaw11s=;
        b=LTwE+aGkGaPdXACqS4J4R13/S0H9/OCQSFF8hkhsIcZUedJM/u3hOKdPZF17ZrjJ3K
         hFMRFjJWnrkasUzsVhICJobcwq2hN3sxcNrFjoB/xVv4f/wX07+rB3slj7mQ4yF/PmeO
         z8hlo01/Use9HKa80QLsfqDa1yV0iqiSGORMa3CqcgQLD/soufmhpRpdWTvK6gC56PS8
         t3thUxeHqaoEl3jd1+K9zcFaNp1du111lYUwPJPUUPPC0Ug32onVUeSxW4hYt0M/oEP2
         um/hfJH177ITr6ihfb2iPJV5nlGg3otIEiUkAcZFrRU1htF5Qj4Nb/BURtARS2D7yFEM
         f3FA==
X-Gm-Message-State: AOJu0YwRNs2sfxk+MdJqZ1qYfunK/djEJC8Lto2LmKb8LveTvZzpAkTX
	Mbpsf8c1grvf3FJDRIr6eQkpvifycgm4ybhIL8WpvyzKhZuf98wIl7tXAHUh+63i+sqcfJaey96
	Ak/iXi/AlieanMv33xacqrUXhHlnGa7Q=
X-Gm-Gg: AeBDietHm2O/YOuF2yxtGznvx9K9MgAR5rdP+owdGN7bhkjhce04TmYlTdrRwG82EhQ
	H+x2DGkqwY/a/J/ogLvDmx6uCJ/VVxx0ADWtHxaEy5ApEwoGsvGNaUjYcvKlZ/WMyr7sxwINanO
	GVaowRS85T3+hDOpbq1rbi5TZR8zhrkE7NnS/TaEidyC/3IE2NyqURa20HVt3aeX5mE6d+y/DSD
	M2lcF2QNrOw8CAKNElW5ERxXtoVP9UoFoYnlSYo2QVZLjH1fKve/nK5rutNNKvmzdinmcKzTNXk
	iOawAlMrx2ULIIgOIJ4r
X-Received: by 2002:a05:690c:e04e:b0:7b7:5f48:d9ae with SMTP id
 00721157ae682-7b9ecfb3437mr333099797b3.24.1777261010653; Sun, 26 Apr 2026
 20:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGp+u1atc_x1o18+Jk+0N+rWnN_RzmWYDAXT=H+oq8jwNdqLEg@mail.gmail.com>
 <2026042444-freeing-consumer-468b@gregkh>
In-Reply-To: <2026042444-freeing-consumer-468b@gregkh>
From: Ginger <ginger.jzllee@gmail.com>
Date: Mon, 27 Apr 2026 11:36:39 +0800
X-Gm-Features: AQROBzAaxy2E2r_C3iftV6peE9eZz6BI7C79D1yXAof_tho0XcKbTgpmgJK0fO4
Message-ID: <CAGp+u1ZZBxLDV3LN0vWH5Smvdm3oosZLT7xyeLy4=ebkv8ZcWg@mail.gmail.com>
Subject: Re: [bug report] Potential order bug in 'drivers/usb/misc/yurex.c',
 mainly in 'yurex_disconnect()'
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4708046C67B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36493-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Thank you for the prompt response. The patch draft is attached below.
Would it be enough to send the patch to you, or should I draft it into
a different email?

Thanks.

Best regards,
Ginger

---------------------------------------------------------------------------=
-


[PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev() and
 usb_set_intfdata()

In yurex_disconnect(), usb_set_intfdata(interface, NULL) was called
before usb_deregister_dev(interface, &yurex_class).  This opens a race
window with usb_open() in the USB core:

  T0 (yurex_disconnect)               T1 (usb_open)
  --------------------------           -------------------------
  usb_set_intfdata(iface, NULL) [t0]
                                       fops =3D usb_minors[minor]  [t1]
                                       /* fops still valid here */
  usb_deregister_dev()
    usb_minors[minor] =3D NULL   [t2]
                                       file->f_op->open(inode, file)
                                         yurex_open()
                                           dev =3D usb_get_intfdata() [t3]
                                           /* dev is NULL! */

Fix the race by calling usb_deregister_dev() first, which removes the
device from usb_minors[] before the interface data pointer is cleared.

Reported-by: Ginger <ginger.jzllee@gmail.com>
---
 drivers/usb/misc/yurex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
index 6d03e689850a..b5484ab77e91 100644
--- a/drivers/usb/misc/yurex.c
+++ b/drivers/usb/misc/yurex.c
@@ -310,11 +310,12 @@ static void yurex_disconnect(struct
usb_interface *interface)
    int minor =3D interface->minor;

    dev =3D usb_get_intfdata(interface);
-   usb_set_intfdata(interface, NULL);

    /* give back our minor */
    usb_deregister_dev(interface, &yurex_class);

+   usb_set_intfdata(interface, NULL);
+
    /* prevent more I/O from starting */
    usb_poison_urb(dev->urb);
    usb_poison_urb(dev->cntl_urb);
---

On Fri, Apr 24, 2026 at 11:06=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Apr 24, 2026 at 11:01:04PM +0800, Ginger wrote:
> > Dear Linux kernel maintainers,
> >
> > My research-based static analyzer found a potential orderbug within
> > the 'drivers/usb/misc' subsystem, more specifically, in
> > 'drivers/usb/misc/yurex.c'.
> >
> > Kernel version: long-term kernel v6.18.9
> >
> > Potential concurrent triggering executions:
> > T0:
> > yurex_disconnect
> >     --> usb_set_intfdata(interface, NULL); [t0]
> >     --> usb_deregister_dev(interface, &yurex_class);
> >          --> usb_minors[intf->minor] =3D NULL; [t2]
> > T1:
> > usb_open
> >    --> new_fops =3D fops_get(usb_minors[iminor(inode)]); [t1]
> >    --> err =3D file->f_op->open(inode, file);
> >        --> ...
> >        --> yurex_open
> >              --> dev =3D usb_get_intfdata(interface); [t3]
> >
> > In T0, the interface is nullified before its get deregistered. Thus,
> > it is possible for T1 to still get the usb dev and access it via the
> > interface, which, however, has been already nullified.
> > The concurrent buggy order is t0 -> t1 -> t2 -> t3.
>
> Great, can you send a patch to fix this?
>
> thanks,
>
> greg k-h

