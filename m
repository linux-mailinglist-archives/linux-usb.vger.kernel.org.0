Return-Path: <linux-usb+bounces-29933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D3C2336E
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 04:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08D564F1519
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 03:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04705284883;
	Fri, 31 Oct 2025 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwTB+qTV"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739C283C93
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 03:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761882737; cv=none; b=K0bkBpIiX4QKYcTW59L+kYh5vQaaO+8sO5nMY/4drVHXrrNnYWc9BxViTsiJNmQShXpUGL2aucJw2PpmTPea3kFF06/48cdof3yc7B01mF63gs7QOW1jPjkvEx/4BcSaN8hoVVX/Ps6u4UgPcD4SHpbQ5Zl4Ir9OaIbTc4rzbVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761882737; c=relaxed/simple;
	bh=tpBH4WqLZ/UhvLppO8BpS9NvMHSs57XS4kkO0So3Joc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7ITrv2uCI9Fs9rvC9Ztza5eVkvp03TaGtepc+OiioqTh15mOPMEp9qVcV1pteXyfRARx3zaFa4hTBg24i2gxvV5J6Vtn81LEY8VRDF3Y9PEz7cuumlFLFQgD2rG5ok3GH8aUEgPd1c5kHT2ghnBfvtpgd6gmEx9936lR8WDIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwTB+qTV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761882734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T33GakBQ5UDJA1Jm0FIA4c9NYfmlY9OCvzmbavseX0g=;
	b=MwTB+qTVyT/uFE9S9aALqemBD6yJEW/JPFKlWtZvLGdF0IUMA2xoWMJMgkBZJpYzn4Zrge
	5nxXsZnp7exlJi2SwcEZJsQqe1Rfd9UDTtroho8CahAt42CulLBdkmLIbp+IwJ4Sw+Ng7U
	XYwC5c18mnvWr3t26Azy/5UKpXEAFaA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-cq5Kl0q6OYOtuT-t002VDw-1; Thu, 30 Oct 2025 23:52:13 -0400
X-MC-Unique: cq5Kl0q6OYOtuT-t002VDw-1
X-Mimecast-MFC-AGG-ID: cq5Kl0q6OYOtuT-t002VDw_1761882732
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-94109728fadso221358839f.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 20:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761882732; x=1762487532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T33GakBQ5UDJA1Jm0FIA4c9NYfmlY9OCvzmbavseX0g=;
        b=ckMmocHPhjL+vGy+u0A7XTth4LT/BgqESxtjNbgrZEg/m/Jrrukff1y4bQ1gX95+AD
         WNthfnA4xMwqfZRWcpHykCtsqsD0tJ/HJlsIM/v/Q9+QV1PICrMbwXWhIP0o1FBpxGIC
         B55gO7RBO23lN8A1BugdWsRYW7mwW6pzpFPDGJNcm12iIEHlw5An7K7qn+OzdnNs8Q8+
         MOOxqE728aJsI75GvNvaTMQrcStQTEU4z76e8U9OcoaisOvEY54O73gJVzh+4dPapExU
         LIhThUJJvCDif5qOkzI0+Q0JguwpAZuHFjEoMqszkttbTT4+8XX69Yy3WYSOmsr1HbJi
         EW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3JF6NzlVO/sPS89wLQ/Lvs6T9fxxIcR1UhQZnzSEYHWnMdc8zl+kbczMCzqZw7BtAVDW6Vf++T58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64grjD+pqO/23GADPq6yEa7CtMqP6xWgS/d9Ab0sb5UKyvXd4
	pWgKbV8TVnXUJx1z18kF8IuLxdKXOElVVsTN7DWRfxea4QdMY2K6f4ZfasMTy65lL1e/Y66Vjqe
	JLEUVBZjkH0wj62mPVdyhgQuIUnRkw19uiWtpWiujr3YYo6hINPkReNDHviD6EVcHkyQq9xvHpT
	K9hws5wgOE30PJNAiN0LsXeRz/qh8KncHN7I+D
X-Gm-Gg: ASbGncsflfEbIBjYHRJ9pW2zDQn42/83C3uAJPaPD8ylSiMo0XQMUOX4naLB0+Vru+v
	WFtisMBkmVSpccM8MWMB8LIjgK38C6QsOxg8Q0vVBHJZD+as+aTjxFIi1IxFlrB/0UuDkZKBSw1
	fImiyLvcJy/9wo7Q/Y31sPfESss+BR3TyqTlHesvCJ2xElIMconliMufr9V/kDZKyr7dwHQ0yg3
	yY1iDSBajrhT8/o
X-Received: by 2002:a05:6e02:168d:b0:430:a38c:b767 with SMTP id e9e14a558f8ab-4330d2074e9mr39276755ab.18.1761882732340;
        Thu, 30 Oct 2025 20:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM0mguF4E4vj4qqamw49fFeKIMF7ghlly4N+TPPxD9oj784mjEzmTSyeiNt+w4nDbflu/q+bm0ewx97PFavBU=
X-Received: by 2002:a05:6e02:168d:b0:430:a38c:b767 with SMTP id
 e9e14a558f8ab-4330d2074e9mr39276565ab.18.1761882731977; Thu, 30 Oct 2025
 20:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030214833.44904-1-desnesn@redhat.com> <b2ec533d-9f87-4d65-a20f-99488ffe56e9@rowland.harvard.edu>
In-Reply-To: <b2ec533d-9f87-4d65-a20f-99488ffe56e9@rowland.harvard.edu>
From: Desnes Nunes <desnesn@redhat.com>
Date: Fri, 31 Oct 2025 00:52:00 -0300
X-Gm-Features: AWmQ_bl1Y_eJoHIkPYXYYbP9d2aBucY5Y0A17DvuLdmMVlIYjUWj86ahJqMQHyU
Message-ID: <CACaw+ex5xpE8H6GMTc6gSQZ2iASkkw1CAe1ATOx9BCzenP39fg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: storage: Fix memory leak in USB bulk transport
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alan,

On Thu, Oct 30, 2025 at 10:48=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, Oct 30, 2025 at 06:48:33PM -0300, Desnes Nunes wrote:
> > A kernel memory leak was identified by the 'ioctl_sg01' test from Linux
> > Test Project (LTP). The following bytes were mainly observed: 0x5342535=
5.
> >
> > When USB storage devices incorrectly skip the data phase with status da=
ta,
> > the code extracts/validates the CSW from the sg buffer, but fails to cl=
ear
> > it afterwards. This leaves status protocol data in srb's transfer buffe=
r,
> > such as the US_BULK_CS_SIGN 'USBS' signature observed here. Thus, this =
can
> > lead to USB protocols leaks to user space through SCSI generic (/dev/sg=
*)
> > interfaces, such as the one seen here when the LTP test requested 512 K=
iB.
> >
> > Fix the leak by zeroing the CSW data in srb's transfer buffer immediate=
ly
> > after the validation of devices that skip data phase.
> >
> > Note: Differently from CVE-2018-1000204, which fixed a big leak by zero=
-
> > ing pages at allocation time, this leak occurs after allocation, when U=
SB
> > protocol data is written to already-allocated sg pages.
> >
> > v2: Use the same code style found on usb_stor_Bulk_transport()
>
> Minor nit: The version information is supposed to go below the "---"
> line.  It's not really part of the patch; when people in the future see
> this patch in the git history, they won't care how many previous
> versions it went through or what the changes were.

Noted and thanks for letting me know!

> > Fixes: a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in sg_build_in=
direct()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/usb/storage/transport.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/tran=
sport.c
> > index 1aa1bd26c81f..ee6b89f7f9ac 100644
> > --- a/drivers/usb/storage/transport.c
> > +++ b/drivers/usb/storage/transport.c
> > @@ -1200,7 +1200,19 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *sr=
b, struct us_data *us)
> >                                               US_BULK_CS_WRAP_LEN &&
> >                                       bcs->Signature =3D=3D
> >                                               cpu_to_le32(US_BULK_CS_SI=
GN)) {
> > +                             unsigned char buf[US_BULK_CS_WRAP_LEN];
> > +
> > +                             sg =3D NULL;
> > +                             offset =3D 0;
> > +                             memset(buf, 0, US_BULK_CS_WRAP_LEN);
> >                               usb_stor_dbg(us, "Device skipped data pha=
se\n");
>
> Another nit: Logically the comment belongs before the three new lines,
> because it notes that there was a problem whereas the new lines are part
> of the scheme to then mitigate the problem.  It might also be worthwhile
> to add a comment explaining the reason for overwriting the CSW data,
> namely, to avoid leaking protocol information to userspace.  This point
> is not immediately obvious.

Agree that it makes more sense to move the dbg comment before the declarati=
ons.
Also concur that a comment about the fix of this leak is good to have
in the code.

> > +
> > +                             if (usb_stor_access_xfer_buf(buf,
> > +                                             US_BULK_CS_WRAP_LEN, srb,=
 &sg,
> > +                                             &offset, TO_XFER_BUF) !=
=3D
> > +                                                     US_BULK_CS_WRAP_L=
EN)
>
> Yet another nit: Don't people recommend using sizeof(buf) instead of
> US_BULK_CS_WRAP_LEN in places like these?  Particularly in memset()?

I wanted to make clear the size I was zeroing it, but it is literally
a few lines above. Will change it to sizeof(buf).

>
> > +                                     usb_stor_dbg(us, "Failed to clear=
 CSW data\n");
> > +
> >                               scsi_set_resid(srb, transfer_length);
> >                               goto skipped_data_phase;
> >                       }
>
> Regardless of the nits:
>
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
>
> Alan Stern

v3 under the '---' is a charm!

Thanks for the review Alan.

Desnes Nunes


