Return-Path: <linux-usb+bounces-29010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54062BC423E
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 11:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079F83AD069
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 09:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCEA19ABD8;
	Wed,  8 Oct 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpBDtdFb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEFA222562
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759915101; cv=none; b=MhSdPYEBgRD1FGqOX87W1tXzPn7vwgIy06EtfnN096p2L8t/2I+gDK1XpUnnqwOqb9dsYBBVbhoBSEeuIhvmadD5hZZ9QPSd/cLt8nnykrkyoDOOUDmBOyNzgzjMbQCy67/oLvomk4GuAnSGC9PhzWCZHaSzrERtaiW60jwbFJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759915101; c=relaxed/simple;
	bh=HgNn1Mz2SeEJpSgZkGi62AGWX9NvOF6md6McsEYafwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mesV0mRi32UTItfOWjAFLvi0YQLyY1772m2Y9BBxYgoDZVgtxr0bCm7OLS79c0gAmd3LkjqWAdynYFDYeNLrnDRpruFirFzTLKCK15+D2pKQC+YrieTQw42RzJXhrItcPcdXndiJG+VEUPUhHGVClYJi7UgIJoNFnoWSqFqrvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpBDtdFb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-336b9473529so596164a91.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759915098; x=1760519898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqbFdBVtU4szZ2U5HL5SQhfsSnt8HPJcEkcZrpgwekw=;
        b=hpBDtdFbmDzSmSdPZDuh7QsT2vuA4zP6/b83nz8s6sqOrKteStjfXOQXLC5IspNpW6
         JWRpz5ejle+N8I+b60bvWv1ubj3w2n0m+E14y5pdlaLHoqUse3PhqGRjH9xEN91tI5QF
         zuSA+XGVKU+MVxFICC5ANgaGNnwpVPVj070P1uiR0uI+wX3E6jDgZ3ivrvjUHPh38H2D
         Q/ysje0ZwNDmpJA+clxq9fZuCwEH8oISR5UOGGRrhmT339M3mZ2/mn14s7IXHtuOdpxb
         YoeygDZwN8r1piYVha9JhGAC13HWgb1a/Im3RB7ljbS4CND9gTTGnQWBB4+lFQeK4MZr
         +hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759915098; x=1760519898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqbFdBVtU4szZ2U5HL5SQhfsSnt8HPJcEkcZrpgwekw=;
        b=SMb0Cfd+5JK6oPTNx9BnOOP4/izYFayjGyHa/TiOxhMelnW3LzEHIZ5b/YRcRbSw66
         b1kQKzrRzdzni8vWeu96MbXB7+kca86t4tRsoucF9KUOJZ/WANO2Y6C2FHSLvzWG3BOA
         gxCAexhTsycG0vGEIneWfMsvDs5N8yR7JofoRrI/q9vppxB9nZwE5QUrpWeStYABMKzv
         qlMKFhLjZjZs1TwqkWrxtsPxF5jH7qGxFKbJMfJtFHmz8SYZdJiMSPraG+FdqZ32Y4WC
         eYNxTkjo4EGguGRMKVnbyMSswvldh5aemALDjJHbfbYHnXm53FNAFs99r3FD5S/in7q8
         eZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVDLDbG699rGNzvM7frrDhEdevB0EK+zYRAS9flwT8+TBiRHWXL9qMyHErROI/yFsWt2dc9ZCF0vJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymtDzHhQzTGIfotd6+ZYM6M7l1Y1PFzZfgnGFg2XwcnyVYphan
	ViQqc8QJa1GTQA/TuYSlpJL51j7aHwmxkpV3x3/SxnFvEONXGYhNjAm2Wje8NfNppd8=
X-Gm-Gg: ASbGnctrRLsXHNhn/nb8xejOOJ4u+Uiojr9MES4VVnLD6xF/3GBWPrEDyuo0X2T5mlO
	Sd8F7f9h81ZN8rrq4tkQK2wGRAmR0fRP64qX0SE5gTn2Z8L8ap1Idm2QTb+oO2aXJObBXYGqXU+
	yeFwGvkF5ZB93tlChcCDJAyQpwwIBbo5Xrcg/0FA5MwAdROmwYkEkPPCZlu/FythIWLJJkfYVCf
	MWmUgIQa5xsvaH784TzOk7nt1HC1yJ4Vy7pC9pzlt6RIBZdbL77jBkLY49c9mQw98C0+TvNxc4f
	incmVgUmLq10YMLYubGagOQuqZkSxWI8nobIPbHtKIzIvEhnqZAndpw64v4k13DXCjwdi4I1EY0
	nv55FCfTiSpIrVRYm7t7bT0Ssq9OPlXDoABAMC4+vbnvzgYs3
X-Google-Smtp-Source: AGHT+IHohfZeX6xzQ8VpYdC3//ne3+VRagNXXpoxSeIPaO8KoCcJx8DDlsWrhSwxJzGQUSmIGTksGw==
X-Received: by 2002:a17:90b:5803:b0:335:29a7:70c9 with SMTP id 98e67ed59e1d1-339edac6870mr8434184a91.15.1759915098449;
        Wed, 08 Oct 2025 02:18:18 -0700 (PDT)
Received: from fedora ([2401:4900:1f33:9812:931e:863e:d27d:1170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510ff683sm2655869a91.8.2025.10.08.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:18:18 -0700 (PDT)
Date: Wed, 8 Oct 2025 14:48:12 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v5] usb-storage: Simplify protocol translation
Message-ID: <aOYsQ8EGBUOebDDi@fedora>
References: <857a1b63-83d9-402b-a9cd-8aca0616c517@rowland.harvard.edu>
 <20251008070420.8302-1-i.shihao.999@gmail.com>
 <2025100836-uncombed-blaming-b77a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025100836-uncombed-blaming-b77a@gregkh>

On Wed, Oct 08, 2025 at 09:31:59AM +0200, Greg KH wrote:
> On Wed, Oct 08, 2025 at 12:34:20PM +0530, Shi Hao wrote:
> > Simplify protocol translation for usb subclasses.
> > 
> > As suggested by Alan Stern  to remove the switch case labels  with
> > 'default'  or keep the  previous  if statements  instead of the switch
> > cases and advised  reasonable value when cmnd[0] >= 0xe0 .
> > 
> > keep  those usb subclasses to default and simplify logic removing
> > switch cases and set 6 as a reasonable value when cmnd[0] >= 0xe0
> > which fallbacks  to value 6 which is old cmd_len for those subclasses.
> > 
> > Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> > 
> > ---
> > 
> > changes v5:
> > - Reformulate as  v5  of original patch series
> > - No code changes ,clarified versioning history
> > 
> > changes v4:
> > - Simplify  protocol translation logic
> > - Set reasonable default when cmnd[0] >= 0xE0
> > - Remove switch-case statement
> > 
> > changes v3:
> > - Wrap  commit message lines properly
> > - Improve commit description
> > - fix  checkpatch.pl script errors
> > 
> > changes v2:
> > - Update subject commit message
> > - fix  checkpatch.pl warnings
> > - match from: and sign-off: name
> > ---
> >  drivers/usb/storage/transport.c | 21 +++++++--------------
> >  1 file changed, 7 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> > index 4d01f70f39ac..14cc608052d9 100644
> > --- a/drivers/usb/storage/transport.c
> > +++ b/drivers/usb/storage/transport.c
> > @@ -719,17 +719,9 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
> >  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
> >  
> >  		/* Protocol translation per scsi opcode group */
> > -		switch (us->subclass) {
> > -		case USB_SC_UFI:
> > -		case USB_SC_8020:
> > -		case USB_SC_8070:
> > -		case USB_SC_QIC:
> > -			srb->cmd_len = 12;
> > -			break;
> > -		/* Determine cmd_len based on scsi opcode group */
> > -		case USB_SC_RBC:
> > -		case USB_SC_SCSI:
> > -		case USB_SC_CYP_ATACB:
> > +		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> > +				us->subclass == USB_SC_CYP_ATACB) {
> > +		/* Determine cmd_len based on SCSI opcode group */
> 
> Always remember to run scripts/checkpatch.pl before sending changes out
> to others :(
> 
> thanks,
> 
> greg k-h


Hi greg ,

Thanks for the reminder. I ran scripts/checkpatch.pl --strict on
drivers/usb/storage/transport.c and all checkpatch.pl has been
resolved .If i need to make another patch for this new change
please let me know .Once again thanks Alan stern and greg k-h
for reviewing and giving your precious time .

Thanks shihao

