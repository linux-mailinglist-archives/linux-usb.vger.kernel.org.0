Return-Path: <linux-usb+bounces-29898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809FC206B5
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 14:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F121189770A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 13:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D70A1A9FAB;
	Thu, 30 Oct 2025 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="brtcNT/N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1EF29CE9
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832367; cv=none; b=CWHFSIiGuEjf/Xgm7BJG77GONoNEaE3djI0bYcqALT0u1yLWjErrGiF72jn3MfGau1M37oEdVx42Ha/LXKsu02UjP0a7511rMXO9xrsFm43Ujj9lI01IaZGlOvrcObScW7zZW4quUbd+X8mh5sZBm4H9G6OyfaMBTMcmwVJvYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832367; c=relaxed/simple;
	bh=E0QzcfXWoHUOsdT7rTZMfrR6XAKnU1jfAvZvjyvtedM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np0eJEmLM2ol+PT5+il4PzNlzydGlKVAXClv1g5fs6BsR0Bjr9MqWYwCGQkjmeEdwtip7SQLI+SLlX7PZzoM27hPqQayOGpRqWaFK4tvLRj+NYgD4bCa4OzFRISlXvZjMWG5ERCCQyQdremLusnirCXWa9/euvuLrfbogymhtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=brtcNT/N; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-791fd6bffbaso13306986d6.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761832364; x=1762437164; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wZtXAAGFprMo/ZTBKrYhrAoxG1/dNAQ0A/mVgWIzjac=;
        b=brtcNT/NxXYdiSEB1Wn7wSJNpyipf5djLcgZBSai7tO5JhZyia+IOpHDIw+7N3MsmY
         L7vdh8rVYQ1IL1tCAgCUUwv9Y2auDEOIblynJh/miJqqMZtr0Wj7ZUaOFXBALdL7QqdB
         554WBqnBnuypDKYW45KvQWt9Q4V/bbmesIkHQkc68kSYNas+VEO3FBVLjTL3EOTKLex9
         eTLraYYcjuUNhFqG3oIipJgISFLitV3LjamJSKyHDS+HKHR/4Dpq64jsvNJ9VHcuR+99
         +Kdvt5ObEYoJXciQZUy3FYB+k7+UHs+FLXOtZmWFSVv39jx3zu+QO7Wo2eh4VC5l9zSf
         nOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832364; x=1762437164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZtXAAGFprMo/ZTBKrYhrAoxG1/dNAQ0A/mVgWIzjac=;
        b=cfzpTQ4BZhTI35+bEvEG3E0uFFKCpnxM5mUc/GdauGUpQ8QNnJBltbekq5Uzk9KTFc
         9VuvlW51g4C6uJad43IrIuk/o9wrk/iGapP9JfJUODJ4giglwANB6UXM5yctItNVaVgc
         3Bp+7vIk69WpL3geozAzh+gW6aAsltO7KlmC2Ims1omCAdNHrr6fi9epEXaC6Gtsp6z3
         otbAJvd8zaDLjJXQi0196fMzMSySCYUKoHOQzHjzoaGNgYiEK+PvBIPckwPP1aCyT/US
         d4xclyjWgnMJU7CZiu6xADfiGkj1178owI1Ug/U9NzKNpNzpSCeLoHt2LI7bJVCpZ/Oe
         yUDA==
X-Forwarded-Encrypted: i=1; AJvYcCVNedvFee6uft48bOIIfz3Hx2D2b424gMpfAjIT/2NH5MnTthdHNXdVjagNC1ti73WNneKAFwgDWCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHGtshCg36XQ4uJrj8IN5Y9uTVe5w5gUhyZp30vMGpguWhhCb
	lsdwnD752Ph0U9AqO/p3iTaUBqUhTNcV8phjCSEfzGtrqC7sLScW9mouyK+djp55gw==
X-Gm-Gg: ASbGncvgi9ksD7Os3/iGGXWuYsdSkyqdsIvOSmcyb9jcntzrJAC2la1+D0w0uwQFB+H
	ujrSw/siNklE430osj8zRsX4G4E/yLWsXJZ1/UEQaHl0E3CEC2qZFqBeHz9hRdIAPxD/AdUJvg9
	UW6QtpZbWng1UwxccyQUNJiFH960ALSQDzn+nMe9AxdFmdY+XKh4ZPluc+aEVZen3ElGMZzun91
	eVlC5qBM+eQkVtaoSXhbGBCtHC+0ilzBak/qgBz9LRsnBxv5r6Tg5zPRrreHZSPbUZfYmqKZlVh
	4p6tjpkHyVtmq43qwjY2iyIR3lEoAtpEteGHe/nadG5ovLC8tjrsUf8gJGn8JknDHirjzOKKgCY
	KHPDwuDaIEu8HFmUGqPEBA0+4Zmgoy3BDHERyzJz4smREiNsAfJTBW8aF6sr6QLkLnioXiCyieN
	eqMTIpocB5Kbegll+fXkE=
X-Google-Smtp-Source: AGHT+IHvPD1HDWobEO9/K7p303S8d75PBvpopWWJuuTKLjyjKjmBOYPS+Bb+U4mCULT1RA5s84pgjg==
X-Received: by 2002:a05:620a:7001:b0:8a6:9a1a:922b with SMTP id af79cd13be357-8a8e4ff0aafmr902035485a.42.1761832364045;
        Thu, 30 Oct 2025 06:52:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f252b1a66sm1249016485a.26.2025.10.30.06.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:52:42 -0700 (PDT)
Date: Thu, 30 Oct 2025 09:52:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: storage: Fix memory leak in USB bulk transport
Message-ID: <808ef203-528f-480b-8049-8e3ca4687867@rowland.harvard.edu>
References: <20251029191414.410442-1-desnesn@redhat.com>
 <20251029191414.410442-2-desnesn@redhat.com>
 <2ecf4eac-8a8b-4aef-a307-5217726ea3d4@rowland.harvard.edu>
 <CACaw+ez+bUOx_J4uywLKd8cxU2yzE4napZ6_fpVbk1VqNhdrxg@mail.gmail.com>
 <CACaw+exbuvEom3i_KHqhgEwvoMoDarKKR8eqG1GH=_TGkxNpGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACaw+exbuvEom3i_KHqhgEwvoMoDarKKR8eqG1GH=_TGkxNpGA@mail.gmail.com>

On Thu, Oct 30, 2025 at 01:42:43AM -0300, Desnes Nunes wrote:
> Hello Alan,
> 
> On Wed, Oct 29, 2025 at 9:36 PM Desnes Nunes <desnesn@redhat.com> wrote:
> >
> > Hello Alan,
> >
> > On Wed, Oct 29, 2025 at 6:49 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Wed, Oct 29, 2025 at 04:14:13PM -0300, Desnes Nunes wrote:
> > > > A kernel memory leak was identified by the 'ioctl_sg01' test from Linux
> > > > Test Project (LTP). The following bytes were maily observed: 0x53425355.
> > > >
> > > > When USB storage devices incorrectly skip the data phase with status data,
> > > > the code extracts/validates the CSW from the sg buffer, but fails to clear
> > > > it afterwards. This leaves status protocol data in srb's transfer buffer,
> > > > such as the US_BULK_CS_SIGN 'USBS' signature observed here. Thus, this
> > > > leads to USB protocols leaks to user space through SCSI generic (/dev/sg*)
> > > > interfaces, such as the one seen here when the LTP test requested 512 KiB.
> > > >
> > > > Fix the leak by zeroing the CSW data in srb's transfer buffer immediately
> > > > after the validation of devices that skip data phase.
> > > >
> > > > Note: Differently from CVE-2018-1000204, which fixed a big leak by zero-
> > > > ing pages at allocation time, this leak occurs after allocation, when USB
> > > > protocol data is written to already-allocated sg pages.
> > > >
> > > > Fixes: a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in sg_build_indirect()")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > > ---
> > > >  drivers/usb/storage/transport.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> > > > index 1aa1bd26c81f..8e9f6459e197 100644
> > > > --- a/drivers/usb/storage/transport.c
> > > > +++ b/drivers/usb/storage/transport.c
> > > > @@ -1200,7 +1200,17 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
> > > >                                               US_BULK_CS_WRAP_LEN &&
> > > >                                       bcs->Signature ==
> > > >                                               cpu_to_le32(US_BULK_CS_SIGN)) {
> > > > +                             unsigned char buf[US_BULK_CS_WRAP_LEN];
> > >
> > > You don't have to define another buffer here.  bcs is still available
> > > and it is exactly the right size.
> > >
> > > Alan Stern
> >
> > Sure - will send a v2 using bcs instead of the new buffer.
> 
> Actually, my original strategy to avoid the leak was copying a new
> zeroed buf over srb's transfer_buffer, as soon as the skipped data
> phase was identified.
> 
> It is true that the cs wrapper is the right size, but bcs at this
> point contains validated CSW data, which is needed later in the code
> when handling the skipped_data_phase of the device.
> 
> I think zeroing 13 bytes of bcs at this point, instead of creating a
> new buffer, would delete USB protocol information that is necessary
> later in usb_stor_Bulk_transport().
> 
> Can you please elaborate on how I can zero srb's transfer buffer using
> bcs, but without zeroing bcs?
> I may be missing something.

You're right -- I completely missed the fact that bcs gets used later.  
All right, ignore that criticism; the patch is fine.

Alan Stern

