Return-Path: <linux-usb+bounces-29862-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC591C1DED4
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 01:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 747574E4D49
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 00:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3B71F91F6;
	Thu, 30 Oct 2025 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Htscf4vp"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BA1FC1D
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761784623; cv=none; b=bq2GN7fHBrfmeozis0zh9aaYTmqzdr5PgGvmgaUeMLN4L+twW4T9Oc3qWD0igxgCkqsLRG3TviwxMClG/uOuiHBjV1KAza+fpLx5LJzf/P3Jj1AMxZXc5bJ9LYZByjfqkbDVhvSimgxYqvoC2bco1k1T2ttbnV+UXBMnYHhd/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761784623; c=relaxed/simple;
	bh=vc+Z4vwJmfybJI6vUwSlj+i4Y37gu+pDm/b5oN1SdWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWypuXKY91lqnjZWuOEnjQXhp+s/RBnbh+cmVi5+obHcp/akw5mJ5DYf1P+GjZ5f9X1RbpIdta4Y0t+DQz07kOsWnlINYnrGXnHPn6WhfvfASATGN81d1zFD9IB+Qrast5+H40+zjsdqKJIzqlJd9H/XIWUSaJva1kgYB060BwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Htscf4vp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761784621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpdMkLEBxAzGgTMAiZJaINSdgkvujrmbEy562gQUFuo=;
	b=Htscf4vpdFyO/dzdebeJFx2i/JvgGXeRDAuxbd5TUoUfwC/RGRK3jqhG1MFIVPa9f22dG8
	Tfw66Mrte3UDcF3I1jrQhk7oWwdL+EjeeDr7xX5pD+YIoy1w1lMqkfu1Z+6veb11BdWYFf
	y0ISxK0hNNVvFqvxaK4ZWTRydJEI+ZE=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-xuqGjuaqO3GQInHOp3mbYQ-1; Wed, 29 Oct 2025 20:36:57 -0400
X-MC-Unique: xuqGjuaqO3GQInHOp3mbYQ-1
X-Mimecast-MFC-AGG-ID: xuqGjuaqO3GQInHOp3mbYQ_1761784617
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-430db5635d6so6847605ab.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 17:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761784616; x=1762389416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpdMkLEBxAzGgTMAiZJaINSdgkvujrmbEy562gQUFuo=;
        b=t+GWcwt5WbIY5PPw/KkFeoNlPlSRD92n9rjgo1Z119FsZigIckOjKua0+QX2EqHydN
         hOMGDZndv/iOIpB8khZ944OGmwsC9wkCqdzVRhpZEGlUfqQioMe4PMZTp1MWNJUP1Edu
         Z3BAOyvQis0JYh8Z2QaAmHW5tTRtMofZaLvDy0lu9VE1Xo6StVhEgP9xdYZYCLBZTHxB
         /ZsXvgbTd8kG/zEdx5AbaRHRnujJF5x9sz/llQf5p0cMtjj02PAVnmk0UqweT2UqHgI4
         aIgG0h/H1ovT9tiOZOqupnkKOEyqUGc2JZvz+pEz5vM2I6Le0qpv35f53qTavd0PuX7H
         zQCg==
X-Forwarded-Encrypted: i=1; AJvYcCUdVK2exT5gMwmlyPXG3YqOKVVmnso4ecfGm+g9ojHLx7NGIstPobwXBDAPy3QwGWkT9ZcNDjzOfK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPIjYugTl8hfpgz9eETSByFWsXwDQCZvHUUdVqPLs2/gZZZhk
	f0lkQdURXlLhuRN8nmfgfN6vupmGqZ7c93IRiAVHZDcRzCFhCdqYH4Hr7vz5ESuPte/Fp8XWHKT
	5ooF2YXykvhE0hOJuq215VvaEEPXM+OueXEWdfd3geDwqao19BHa7UoXsmSXL/gJlgejR+RmVTU
	jrlWfUxQ7f0ed5zRFlmMPzcWLSWrHpeSYBTXEL
X-Gm-Gg: ASbGncu9LtSIkk5o0Cqo8kKL+jLaeoKRGWzlr33iUbcNL3H6zmumxYIEadGcOYsHUQX
	CpzIYu9CODnNMrDG/oXv5O9o57lzyWpSDdxwnF4KCfimE2V7Du45hNeyyU7CREZ3zUcejQO5Ofu
	3vno32OE9gJzuY3SrQjL82YHflbyz+tHHTPVt1KqTYNvVSQW7xtZGvilR1+B4suEJmhrWnfHoap
	5k+m/OHZsHwSikH
X-Received: by 2002:a92:cdab:0:b0:42f:9eb7:759b with SMTP id e9e14a558f8ab-432f9044dffmr57158595ab.28.1761784616649;
        Wed, 29 Oct 2025 17:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZuijjJOo7FLk3K/tPaprJFeBWImzkLs7KAevx4fRe2hGV4YYIEo0lHTFjE0zedcBVsWSD7uSDSINEiDu/904=
X-Received: by 2002:a92:cdab:0:b0:42f:9eb7:759b with SMTP id
 e9e14a558f8ab-432f9044dffmr57158385ab.28.1761784616273; Wed, 29 Oct 2025
 17:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029191414.410442-1-desnesn@redhat.com> <20251029191414.410442-2-desnesn@redhat.com>
 <2ecf4eac-8a8b-4aef-a307-5217726ea3d4@rowland.harvard.edu>
In-Reply-To: <2ecf4eac-8a8b-4aef-a307-5217726ea3d4@rowland.harvard.edu>
From: Desnes Nunes <desnesn@redhat.com>
Date: Wed, 29 Oct 2025 21:36:45 -0300
X-Gm-Features: AWmQ_bkf3Zl0zsrq7ig32Ls3dqm_dQGASmfXfNZq2huLPMng2uafO8z-59mTHrg
Message-ID: <CACaw+ez+bUOx_J4uywLKd8cxU2yzE4napZ6_fpVbk1VqNhdrxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: storage: Fix memory leak in USB bulk transport
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alan,

On Wed, Oct 29, 2025 at 6:49=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, Oct 29, 2025 at 04:14:13PM -0300, Desnes Nunes wrote:
> > A kernel memory leak was identified by the 'ioctl_sg01' test from Linux
> > Test Project (LTP). The following bytes were maily observed: 0x53425355=
.
> >
> > When USB storage devices incorrectly skip the data phase with status da=
ta,
> > the code extracts/validates the CSW from the sg buffer, but fails to cl=
ear
> > it afterwards. This leaves status protocol data in srb's transfer buffe=
r,
> > such as the US_BULK_CS_SIGN 'USBS' signature observed here. Thus, this
> > leads to USB protocols leaks to user space through SCSI generic (/dev/s=
g*)
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
> > Fixes: a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in sg_build_in=
direct()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/usb/storage/transport.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/tran=
sport.c
> > index 1aa1bd26c81f..8e9f6459e197 100644
> > --- a/drivers/usb/storage/transport.c
> > +++ b/drivers/usb/storage/transport.c
> > @@ -1200,7 +1200,17 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *sr=
b, struct us_data *us)
> >                                               US_BULK_CS_WRAP_LEN &&
> >                                       bcs->Signature =3D=3D
> >                                               cpu_to_le32(US_BULK_CS_SI=
GN)) {
> > +                             unsigned char buf[US_BULK_CS_WRAP_LEN];
>
> You don't have to define another buffer here.  bcs is still available
> and it is exactly the right size.
>
> Alan Stern

Sure - will send a v2 using bcs instead of the new buffer.

Thanks for the review.

--=20
Desnes Nunes


