Return-Path: <linux-usb+bounces-26798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F5B24B90
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 379E05C014B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 14:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753D12ED145;
	Wed, 13 Aug 2025 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="raUqL9dK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2E2E5B0F
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093552; cv=none; b=a7rw51fWKzTLIajdlGuvUg0bSZjGjT+0ZTzGPAO97Uu66gbXj28m28xmaHThH2u8ciMgHGL7N+9lTKBPqxiJN9VqA1bmlpAB9uRu4FLmvmj1Ot47gblvod0bcjN29DppnAmYEqjpEoaWuzfGi147eFlN480oH6ptqULLmUAMJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093552; c=relaxed/simple;
	bh=UyArUCBuEEvIlRYadHqWiP7PFZhXMSulHrQ4/NqC21g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1ZDWm4M9CI1fuRQ8e9+Z4XD/XRjjkvBALC3UWMRu4qnUC08S75YwCJq4huNBj37C/1CmMwa58bkOPCKWreXku+JqV3bKGq/g7n1qHIlqtZQUDHxxyKAV/hmKtbOqkbCcq7diy9flw7bm8k8QyUMIsIVDPxH5PguReOfoeN24tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=raUqL9dK; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4af027d966eso78795791cf.3
        for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755093549; x=1755698349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0B5+KCwTYeMl+r7+gOvY6gHETkIvCqXubWBUjPQk9aQ=;
        b=raUqL9dKs9BKd8h0G+8u07sFAXtUu19sSJ+UA0xYZowIJ32NkW0S6fqvQEYGi6gwtX
         C07OhuD0HvSyksOS/dgTFupGU7gG+6IltVtiFQY84Oiggik5Z4Ek8NLka0PkdmOXbO36
         K0x4GOo0GYl8jcH18vBFUwrsfcwxh9AbQtM1t+/tpkGcSHcStD3Ct1KeJE4hLp9tZzOa
         9xURkMgHgW++7yUR13blLVeYVkzKyfnTBEni++3oLlgLTrlr/ExSyXXO0LjLqtSEri60
         gGgaaSLofXzXvZeLR4xbGWo7wZFxyNn+bK4hL6UW2hSbSQStH4QJboVDL9e/EuswerDF
         QZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755093549; x=1755698349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B5+KCwTYeMl+r7+gOvY6gHETkIvCqXubWBUjPQk9aQ=;
        b=H32tcN3SYiZ4BJpWjFV7+DdEIPTi7KUQ3QR/YJlWiKZFYgs0JKrK7dTwAa2XcyrxgZ
         EgpY/mMyGZlvSfVm+/XQbfdg8g2RDf2HR8lEtVXm+noQBnzQr9nuun/c9r6WiLTFTb/h
         cX23Iq7NieqViqhvm6g69rY6KAmdSJii4BRoxPEEov9GX8CojWzDyAiuTqUg1kBG7J7O
         3R2QrH7fH0SD+AOklfPjMt8CctAI6P57J64YrhxzpqpzzwdRjV4UNnhUGSoXBBiOhHZ4
         LwvXSRBVNQrkMFjFyKTc4tdYe2UeKNwZJUcO7pRSK9+1eGBCsNfGCEK5FI6xFopNlFaa
         QnFg==
X-Forwarded-Encrypted: i=1; AJvYcCXoOgNiI0xMzwNNxzZ0EpXhuX96Dn/m/PPIx2DAdjoiKAjDdlFGRjCFrV3G4xnrQWTG/GrwHToPCRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfU0mzGO8SbJuyjN6Ehrx9QU+8LrkUHfqWgE0YO4fgawHO402Q
	v+k2ftWCU1n6EfStj8/3UZLLuemEORiMO9RLN5fQKqB2WXSX/pdbd00Z+CGzQwCB5Dr31O6+oL6
	hc7E=
X-Gm-Gg: ASbGncvV7gCU8Op82aF45geoKdKyu0dGUrih4o7FXlJJMtPg5XirAdoYYbkroP7vHWl
	JQtpqAVjt+MSQPqMs7I4+0FB8LjGFuCY508cWDxxU0vX2ofhD1crb53zjjyTEJIVQGTynoQUG99
	8cxUV9Mi2z1++N/GX6ZHDwSNw9uM7FjSrUF0Gn4arLypDnh/iN1EFhZllNnGUuKz1YSK2mD/Voe
	o28WISIvyZAwlOAXP2VA/RJJ17DDchR/PEAyjHQmGiMGwpMihc6p63CK7+zAGPxu3kTKjbqEO5c
	ri7I/N6ZR2KDE7bp4edTOA5hx6nM/WvFjeNpnNCfBMXtVjGq9ujhYGyvq8sEk43G5oiO1Juwcg7
	cg9zFRQ4wBJdgDEj9iTinH3X/7ynHqpNPDepGrNdX
X-Google-Smtp-Source: AGHT+IHZODkc4jzSWrqtqZtNxnDMwJERZ/GvfOq+a9y3R1/suPMIsQbPisFwEAObfdCNGLSA18i/vg==
X-Received: by 2002:a05:622a:4107:b0:4b0:6703:db95 with SMTP id d75a77b69052e-4b0fc687c82mr34072551cf.9.1755093548792;
        Wed, 13 Aug 2025 06:59:08 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0a41a2ab2sm95720401cf.18.2025.08.13.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:59:08 -0700 (PDT)
Date: Wed, 13 Aug 2025 09:59:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [usb-storage] [PATCH 1/3] usb: storage: realtek_cr: Improve
 function parameter data types
Message-ID: <a6deb8d0-dc8e-4d4a-94d2-ed2617091eef@rowland.harvard.edu>
References: <20250813101249.158270-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813101249.158270-2-thorsten.blum@linux.dev>

On Wed, Aug 13, 2025 at 12:12:47PM +0200, Thorsten Blum wrote:
> In rts51x_bulk_transport() and rts51x_read_status(), change the function
> parameters 'buf_len' and 'len' from 'int' to 'unsigned int' because
> their values cannot be negative.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/usb/storage/realtek_cr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> index 7dea28c2b8ee..d2c3e3a39693 100644
> --- a/drivers/usb/storage/realtek_cr.c
> +++ b/drivers/usb/storage/realtek_cr.c
> @@ -199,7 +199,8 @@ static const struct us_unusual_dev realtek_cr_unusual_dev_list[] = {
>  #undef UNUSUAL_DEV
>  
>  static int rts51x_bulk_transport(struct us_data *us, u8 lun,
> -				 u8 *cmd, int cmd_len, u8 *buf, int buf_len,
> +				 u8 *cmd, int cmd_len, u8 *buf,
> +				 unsigned int buf_len,
>  				 enum dma_data_direction dir, int *act_len)
>  {
>  	struct bulk_cb_wrap *bcb = (struct bulk_cb_wrap *)us->iobuf;
> @@ -417,7 +418,7 @@ static int rts51x_write_mem(struct us_data *us, u16 addr, u8 *data, u16 len)
>  }
>  
>  static int rts51x_read_status(struct us_data *us,
> -			      u8 lun, u8 *status, int len, int *actlen)
> +			      u8 lun, u8 *status, unsigned int len, int *actlen)
>  {
>  	int retval;
>  	u8 cmnd[12] = { 0 };

I just looked through the original source file.  What about 
rts51x_bulk_transport_special()?  Shouldn't its buf_len parameter also 
be unsigned?

For that matter, what about cmd_len in both routines?

And have you checked the corresponding values in all the other 
usb-storage subdrivers?

As you can see, worrying about the difference between signed and 
unsigned values, when it doesn't really matter, quickly leads to a 
morass.

Alan Stern

