Return-Path: <linux-usb+bounces-29868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEFC1E146
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 03:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99EAD4057FE
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 02:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64F12EACEE;
	Thu, 30 Oct 2025 02:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="K1r43AMb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D5B2E3387
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761789602; cv=none; b=ER14HXxlcxlaH7h0wjApkdJ8cT9q8WvlVTURAU49pJqKSPE9JDfsipNPwTXwvYG8fvIjpLV3kcMzS2+J0S2l2R4XxAygIX1WUvat9/wz6iWhL4mpZAut/XL7CcljnCP4kGQayEqWMTLMfstuQBNWvcdhzDacHR7euBODIOwDQKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761789602; c=relaxed/simple;
	bh=WCn19iM1Z0MfIjW+rItRIGL8bdfe6BgzVs9U3AbCLZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpHU7EUhU2cEUa1bu3VY0h6W+LtfU3iWH7vbM++IktxPyhm1rxVAIuI6yMbehvZKihT/I1HpL03bl2aMlzrn4qhkco7JadPo0U8184aCka25GmRh+vZ6EeRAdP9xP7km5zXWPKty5kpi5QllDcrqgOOTeDZhbv2HgTQs8pPzdAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=K1r43AMb; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4e88cacc5d9so4370631cf.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 18:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761789598; x=1762394398; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z2NHI+JKle61/F1K6gTmohpSB527P/h9U8G3EyLfGXc=;
        b=K1r43AMby/1As3GK2ps2Xm/J69G2GdXWhudnC9HEO4vbDDsuChofFnnnK42Iw8TfoQ
         cYdxHf986wyLX5UuPB5u9Zo2THUkoWbNF2F3LX6Xy9zu4L6Rx888L8h5SKRSPwXMWGtQ
         LNa7t3BVMWCQSydPGsTaQ8kL2ryXyWuBMlHkbWgVKoPawY6D/Rb7F8qfCdVpEurKxM9N
         hm7ODu8erjm1ePtiH6zDPfQAgkrUxfMpZ/+6UySX6/jJZ+zZUjMfxB2gDfNiDbKnaUH3
         aVwryOnUnhI8krFad+XBiubyFA+9DgPEb7wDNJ1gUmRBtRR5IdHoE2RkusrwiW7PjKBa
         fnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761789598; x=1762394398;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2NHI+JKle61/F1K6gTmohpSB527P/h9U8G3EyLfGXc=;
        b=KDh2Ta+1jJgFQ+iIlppwj4uuayb5PqaK1gKTXJzFc/jVHPvmRGoGBqSpn0rwonN0TZ
         tdAoSvpketIfHU6poai5KavopYb1kuI0UpYFKuOWkP2HYxxEk1sJv5Fw7mybjhWZuB6G
         ZHNkXGmYzjA7Bi22rFIsoneQ+SHCZow7oCwr4ToHn14te3/aAYBOvZvam6a5iYhBIUaz
         nS/HYEjUHN3yB6cxeEyNIZcvTeCPGwUytL6eRr5TxYmeTt6GhCOHnZbLMjfRU/YJixKn
         /Cu+A3SLfvfE6HC4+U9wUfm+FJrIuRnk2pt0n4kPqz+CxcGl1LhCpISKU6FHm9RSwmmp
         39MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFUzWZmpC0eSXnPj2saBJLNde83repycwapb565AYzmSIaD0qeCFlYxwhjlZdZErIkhrXF6GGAEUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXS0P955bUyXL28ZBT2s8wCoMd+6xkAQLE1olmT/iRVeAxp1xL
	DX8stog/vWCjx8spIQhLH5X9Y1Gd45ojHehzUqvsgGE70xbQzR00dpoAgTxAPtTLww==
X-Gm-Gg: ASbGncsdhuYTLL9Bb1gfUfwNAoGdGbC8R6nfaDOLAQhvwW8wwyz+nYx2EbH2U9U5wBW
	FzW7t5h9VwxUCS3WEZhutYagkHf7xGFn3OSko92OvGgsfynu6471rT2xjF1oyv256fL+lYrPZbA
	thgCvupUFJWstWa8cMfeHjljm/QzAuq/8F48pLGlvxAYquNj8Q3bP1H0ZVBqeUNT21GmFVBxK4u
	SNZaA1loAeIC9MeLLpOykv7gCPO0TeduwnrmtN0dWEuSq2PTe/gu+7uBaTxJKUIN8AKAwxIYZvr
	rovXId/5wAT1NB3h6oEibvbG4I+uy8gT3BiRhw3ueXplnLKWf73i6LBwmvjolkzbc+QW+Am4Tgr
	pUCoyMBXGmBNuzOxn8+bdyuLAmJvq8lEOg8w0mB0IIAwDiUgrxYmBmVlcUUF8rDdrU6X8ihXD0j
	skug==
X-Google-Smtp-Source: AGHT+IH+TV6RMeAIWWxN5dWDK8nDnwa8KRVgo55fY3RxQYJF0+8j4+ggyy4srfUSmRt7u00GArjcJg==
X-Received: by 2002:a05:622a:22aa:b0:4ec:fafd:7605 with SMTP id d75a77b69052e-4ed2236368amr17970891cf.60.1761789598508;
        Wed, 29 Oct 2025 18:59:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba3858f1esm105935391cf.29.2025.10.29.18.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 18:59:57 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:59:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/2] usb: storage: rearrange triple nested CSW data phase
 check
Message-ID: <a8f5302d-ed93-4b2f-a706-e7e2646986a3@rowland.harvard.edu>
References: <20251029191414.410442-1-desnesn@redhat.com>
 <20251029191414.410442-3-desnesn@redhat.com>
 <27c07b90-f4ef-462b-8b6d-46afd4301912@rowland.harvard.edu>
 <CACaw+eyo4Yc0=Ak=RWsozDVMzGHaZhW6SBHJUWFqRb6gPzWS8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACaw+eyo4Yc0=Ak=RWsozDVMzGHaZhW6SBHJUWFqRb6gPzWS8Q@mail.gmail.com>

On Wed, Oct 29, 2025 at 09:39:36PM -0300, Desnes Nunes wrote:
> Hello Alan,
> 
> On Wed, Oct 29, 2025 at 6:54 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Wed, Oct 29, 2025 at 04:14:14PM -0300, Desnes Nunes wrote:
> > > This rearranges the triple nested CSW data phase if clause, in order to
> > > make usb_stor_Bulk_transport() code more readlable. No functional change.
> > >
> > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > ---
> > >  drivers/usb/storage/transport.c | 21 ++++++++++-----------
> > >  1 file changed, 10 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> > > index 96b81cf6adc7..3f2e1df5ad1e 100644
> > > --- a/drivers/usb/storage/transport.c
> > > +++ b/drivers/usb/storage/transport.c
> > > @@ -1188,18 +1188,17 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
> > >                * check whether it really is a CSW.
> > >                */
> > >               if (result == USB_STOR_XFER_SHORT &&
> > > -                             srb->sc_data_direction == DMA_FROM_DEVICE &&
> > > -                             transfer_length - scsi_get_resid(srb) ==
> > > -                                     US_BULK_CS_WRAP_LEN) {
> > > +                 srb->sc_data_direction == DMA_FROM_DEVICE &&
> > > +                 transfer_length - scsi_get_resid(srb) == US_BULK_CS_WRAP_LEN) {
> >
> > This change has nothing to do with the subject of the patch.  Please
> > leave the code the way it was.
> >
> > >                       struct scatterlist *sg = NULL;
> > > -                     unsigned int offset = 0;
> > > -
> > > -                     if (usb_stor_access_xfer_buf((unsigned char *) bcs,
> > > -                                     US_BULK_CS_WRAP_LEN, srb, &sg,
> > > -                                     &offset, FROM_XFER_BUF) ==
> > > -                                             US_BULK_CS_WRAP_LEN &&
> > > -                                     bcs->Signature ==
> > > -                                             cpu_to_le32(US_BULK_CS_SIGN)) {
> > > +                     unsigned int offset = 0, buflen = 0;
> >
> > It seems silly to initialize buflen to 0 when the very next statement is
> > going to overwrite that value.
> >
> > Also, "buflen" is not a good name for this variable, because the
> > variable does not contain the length of a buffer.  Rather, it will
> > contain the amount of data that got transferred by the
> > usb_stor_access_xfer_buf() routine.  The following "if" statement then
> > tests whether that amount is equal to the buffer length.
> >
> > Alan Stern
> 
> I tried to borrow some code from usb storage protocol, but after these
> observations I do agree it is not a good name here.
> Nonetheless, I will drop this patch from v2 as requested.

I didn't mean that the entire patch should be dropped, just the changes 
to the indentation of the first few lines.

As for the variable name, num_written or something like that would be 
preferable to buflen.  You can make up something better, or you can drop 
the entire patch -- your choice.

Alan Stern

