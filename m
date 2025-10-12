Return-Path: <linux-usb+bounces-29171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE3BCFF76
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 07:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A99F3BEDCD
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 05:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57A11DE2BD;
	Sun, 12 Oct 2025 05:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY+VYcCr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D019834BA34
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 05:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760246556; cv=none; b=jPfE5gL4sKD8Lwbc8FTjE53dEweNpnuXCaosopEeLPzNxeryKCM+SvkHbe7PlfBCO75qmW4zO0PJzUyMTcco9TubF8lDx28n7vezFjbPEhzWJ7yFW82t1b9dYg8RDbzq34dS9TKxrSqmwuIlClyoLFsxe2vMJpGZOQvEBQtbkDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760246556; c=relaxed/simple;
	bh=G0Ii5FTNhuSbwBq0B5pj2vYcfqonjc2rbBcQ+bhdZ1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4GehZ9Dv73vYpkDSADS6V1J9a1xPVTTctB2VTj55xVoNSq0vTVandEqmuI3nRVlTSfhVp9mt2OtIHIJpRxpaOIYx2V1sOT+9B6uYwaS32UEhLW3A2uawDo5FkF5O+LkgwIP04hvbWRKQj2DLU0CqGoRnixWsW4P/yXLJebzQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY+VYcCr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3352018e051so3891431a91.0
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 22:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760246554; x=1760851354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x31I62lq72Ny0BjIQEjLDEFfOWB8TqZkuoAQ+72I56E=;
        b=NY+VYcCr7pZFlQCDS3Tt3ggTaAbanHG0XY2dOLfekP9Icfm3LdosRvkjsKTaaARFia
         zfBHxEirJ+wzY6MsTABnF9RmjrfYizi+zw6gLlPzrjQ8tlHF6eQGAzkGxm4B6ZSKMvsl
         OJwrUso+OHkTT0rlmG8F2f1Pbqylb5U3sthg5DMAS4MnLbBuNJXsIldVZTvHhZzx/lxJ
         VhEAiI9k4So4qXQ4S4FLOAoeUFKbBFYTupl0noOiqZ/zuGclxbpWmpVmMCDJ0KRtl7s+
         44AvHgGHLLIdRMLTcr4Ry3sOwu2r/gm34tCCRk6gqQ2C7ADqEeBKg1GX0OCwHjkUbXj4
         iDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760246554; x=1760851354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x31I62lq72Ny0BjIQEjLDEFfOWB8TqZkuoAQ+72I56E=;
        b=Y+ri5XFkST+3A3Yu6+0rS3iffImDaBNssDHI24vgMwJPjttwLIM8cSeh9QpnCHL2cO
         0Mjzc2gsPaSXmRIKDeJ5anvcoQHCMGtCSXmWOZOD0iw3sdQ2/XSJsslwW7I+SE78PWnL
         W4CkJkvJsOQNjs/EwzZxYXbPm7VsmNAf9mI8dmN9+bJ/pxx1xrPzbNsJmCEUZaWTwdMd
         lV+rwwexKIrnUERfobxjY9MDq8jFzR0+VogH6Y2AkIn5J6BvhOhAbRkPu6ayiEeq9HEJ
         my7h0S5jF7B5DnRcct/mA5VtNPfSHCswxbtBlNbP9pwrU0UOzYcehpn/Zp2td6/U2Wjx
         mY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhrkwCzIJVz6HgC0NBBhxxi++vnx9qp4WAb9vltmkjLZYDOXNEQUrdAJiZGKwS2Qp/E4qsTKZBClw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/QTG8TRvMO5pX4pGCzTG3KjdsC2Gpv9KmGP8O7Zg3l3OEMD0
	0/cKCuAIJHWunwLwmibYP9J/s65emFJBBeihaetluIpt2OaVVLIwxRPy
X-Gm-Gg: ASbGncvIB0dkLw5i3Z2nAWhHTfnqHhj1Jx94A6/KFH5+mTW51ep3jJp+va31r5HxBoE
	yZETCsdrrE0YeC0w23Cp+mh6QG5ixX5bI4znSX3vxTrkVSzEgNF6wi5wE5CCvMgeOP8jrkdB14q
	0EDnKzwMuoFtZuCofrhX4TwJGR1xyBQt0MWqUKcEK3oBsu9G3Qcrh5ImSmE9iFdIVPN/igrgw5T
	T6KsP9exnuc6F73I9OxcQk3ysy+iTxQuvtdGDkFf6vQ2dz9DrRvPODDVFlIVUeQiUtehH+1ceT9
	GzqKqdSXrKNMWwI8zd+QE92zy9a+Uax6ORiti8N78YQ/A1zz/t2X52IEExT66VCs7PFSCtIgsm+
	7KWjMvzP8jEqrAojLfiH1qGUJZWBJElqrkNT4I0a48Yg=
X-Google-Smtp-Source: AGHT+IHeq4LXwx7qZ0o4aq61cilUi66eaU04opXyh+6uIa9gi19yCYNFBykCbrrBhbJPQAmdAkH1Mg==
X-Received: by 2002:a17:90b:3b86:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-33b51106a99mr25192285a91.5.1760246554029;
        Sat, 11 Oct 2025 22:22:34 -0700 (PDT)
Received: from fedora ([2401:4900:1f33:e96a:c19b:e072:99ec:fbea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cc0dsm8175701a91.9.2025.10.11.22.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 22:22:33 -0700 (PDT)
Date: Sun, 12 Oct 2025 10:52:28 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, stern@rowland.harvard.edu
Subject: Re: [PATCH v2] usb: implement proper subclass protocol translation
Message-ID: <aOs7FNie4boeW-vw@fedora>
References: <20251011093937.19434-1-i.shihao.999@gmail.com>
 <3b6a43c5-6724-4940-b5b2-cadb5ebbb26d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b6a43c5-6724-4940-b5b2-cadb5ebbb26d@rowland.harvard.edu>

 
> I'm sorry that you went through all this work, but it turns out that 
> this is almost totally unnecessary.  I should have realized this 
> earlier, but I didn't check the context of the patch until now.
> 
> At the place where you're changing the code, we know that srb->cmnd[0] 
> is always going to be REQUEST_SENSE = 0x03 (read the scsi_eh_prep_cmnd() 
> routine in drivers/scsi/scsi_error.c).  And we also know that 
> srb->cmnd_len will be set to 6, so there's no need to set it to 6 again.
> 
> All that this code needs to do is set srb->cmnd_len to 12 for the 
> special subclasses.  Nothing else.  I'm not even sure what the FIXME 
> is referring to.
> 
> Alan Stern
> 
> > -		/* FIXME: we must do the protocol translation here */
> > +		/* Handle usb subclass protocol translation */
> >  		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> > -				us->subclass == USB_SC_CYP_ATACB)
> > -			srb->cmd_len = 6;
> > -		else
> > +		    us->subclass == USB_SC_CYP_ATACB) {
> > +			/* Determine cmd_len based on scsi opcode group */
> > +			if (srb->cmnd[0] <= 0x1F)
> > +				srb->cmd_len = 6;
> > +			else if (srb->cmnd[0] <= 0x7F)
> > +				srb->cmd_len = 10;
> > +			else if (srb->cmnd[0] <= 0x9F)
> > +				srb->cmd_len = 16;
> > +			else if (srb->cmnd[0] <= 0xBF)
> > +				srb->cmd_len = 12;
> > +			else if (srb->cmnd[0] <= 0xDF)
> > +				srb->cmd_len = 16;
> > +			else
> > +				srb->cmd_len = 6;
> > +		} else {
> > +			/* Use fixed value for non-legacy subclasses */
> >  			srb->cmd_len = 12;
> > +		}

Hi alan ,

Well alan thanks for the review . Thank you so much for 
giving your percious time to this matter . I am just a newbie
in the kernel and i was just trying to learn things just to be a
kernel hacker your review has taught me how to submit a good 
commit and write code that is acceptable to the kernel .Thanks 
both greg  and you for reviewing my work . Thank you so much 
looking forward to submit  bug fixes :) . 


thanks 
shihao

