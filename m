Return-Path: <linux-usb+bounces-29166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BFBCF9FD
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 19:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50F8D407C3D
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 17:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26E028136B;
	Sat, 11 Oct 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AnN36suW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB006280CC8
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202313; cv=none; b=RwaPnegvVgom54kD7qUCttEK4Pb3ctV3PiSQzmfmz4PGxEvmlMC34RxDMkmZ0ow8jlT5K5UbbuBJWgrwr9V+XOGgqmV304yNls5S4lCMhpdTKxF1gz6wT75FQU62JQVSL/SRV/Uo9yfpmPhhUXTgI7eQeuTZ6tGm8o2Y16Aze9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202313; c=relaxed/simple;
	bh=ctfQN7+coD3u+XNx9wKDk6nMSZzUu5aGltLc1h1zarg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6l0Dy9Fm+rdx2ReL//iZYLLU/PScmsAdbp72txggPEq8YSowW47JJxectYzEhz7DD3UA+fAjWngqxiFR/KcbmxYo9zMBTkrM+Seh443He+aflaNo8Jd8lCqlhapPFZwqpuIodCRfQUdQmha6GzQZYkxDYMra1kfrsTUcFcOrWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AnN36suW; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7ea50f94045so43767136d6.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760202310; x=1760807110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmkxqb+RvodjnG7+mVoNmS8Vb5X5J0ViteszBxQAPb4=;
        b=AnN36suW8Q2VRTri8G1tvgCWkiSSJMdtGyjZEUHaM4Irrp+qL/PDIbB5avrUEGQeyP
         qj8nRnHR9x7Hg2h2akTTyUnxlKLNvc8ofabgojP6y18OdWeD4kuAx17kfrIFWI5leK6e
         0FKMS0dkWyMDzOhzAh9S59mnWRb96QGcd0bmqGMBVUjGePWG/G1gB8xp9S/krg2abu7T
         HJ4OYOWZnwAjUmRcQj156yiwBhZKa1N6ewVfxv0Tmj3qW4wYyy61tI5d4sPRm0pt0wWo
         cbDjT2gohW4qSfs1MRYRa2iEbah3L93eOlpOyaCh23xM6/2go1WdP0YLov342hnWIlzW
         5xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760202310; x=1760807110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmkxqb+RvodjnG7+mVoNmS8Vb5X5J0ViteszBxQAPb4=;
        b=pGuFznIL8oNCZpsrX6UsGupcOF2wO7TqZVKVWVwcjg51UAPg3AqwdDyxXxCy/rCN6d
         URth2QbYwtcPwdHWqhJnYo/+E5msnJKv1jM985DxV6JUFUvpfmAdhUZqEnHA9m0E2JfG
         sMVhOCI1FGjr1YNPis/eQxVxfnZc14nAJ8BRUQYPTHbtB8dLjWvF/fbX7B04JSFUjRci
         s3RGA6yDpv/EVSKF81UJL2ZnJFOPkPED5eR2Qg/KYvxunP3LTiqFSbaLZVU2vw/mWDR1
         J8GLB9Amqmi+dZ1Cf0rRraB+xgrSEE5FpnEz+MKLCFj7HVLrX1ZfJoMiNvZoTeVLzlS9
         BrmA==
X-Forwarded-Encrypted: i=1; AJvYcCUIs13DW4Mi4WXAjgBHD11BqO/2rjYumE6Nmq/iGGf/L+XHSj1q67rYERqOehIOml6b48cEBgTRFzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5diyhMt2cYBTMNt+QuQiGv1TESckz9NgjRgCxRBCUL93c5xpz
	IkYI/7+5loYS6AuLNIbAHk1ETv65y56OiUVJxepoocVxFp+cj2tUz1TBSMBh54xO5A==
X-Gm-Gg: ASbGncuzJG+dPhc6KJ21XlJvHCx8CQscPLNKqXMvuuf/N1PTexLGN7nldob62RKMJeh
	Hi6Im//s6d32BjXg0qnQtEBbsKGcH74v7NqxaW9jOZg1RDdRpIrZPBy9AAbn/5o5efGYQylH1j9
	oc8DYernKLfe0mHZyK/ZWE6Fafhbf7vaDC+MUAfSDUv4arCI9q9Rs6E1gju0Fob3gklw+bZHo/a
	JPIC4VXMK8MWD9EiT6lqUwGNIb3t6TniN4jp3BD6zPf8zZe0C8d6LaKnj+HuttrpKzUiuJ3Wv03
	q8y7fWifswM6ZTGyPZ490n/O1jbGX7N4Ntf6GVds0EY1rNKxZL2E3sYcN/ypqlw6wRjD2nnlNiX
	7VXKDTPPmmMVGUJZQX5v92gC9m7nQ3LCsp7jJ2vuqRksXNuXnGA==
X-Google-Smtp-Source: AGHT+IGsR3empBr6xBiExYrff1qyxcwv9HMThJ3cC0XhiI/xESaeBXhB1z1nnV9Rm8tZT1QPXnml2A==
X-Received: by 2002:a05:622a:4a14:b0:4e4:d72d:69b2 with SMTP id d75a77b69052e-4e6eb037d06mr225009811cf.24.1760202310418;
        Sat, 11 Oct 2025 10:05:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::de67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706dd9727sm40755431cf.44.2025.10.11.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 10:05:09 -0700 (PDT)
Date: Sat, 11 Oct 2025 13:05:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2] usb: implement proper subclass protocol translation
Message-ID: <3b6a43c5-6724-4940-b5b2-cadb5ebbb26d@rowland.harvard.edu>
References: <20251011093937.19434-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011093937.19434-1-i.shihao.999@gmail.com>

On Sat, Oct 11, 2025 at 03:09:37PM +0530, Shi Hao wrote:
> Proper protocol translation for old legacy usb devices
> to set proper cmd_value.
> 
> Earlier protocol translation was insufficient for old usb devices
> which was padding all subclasses such as USB_SC_RBC, USB_SC_SCSI
> and USB_SC_CYP_ATACB cmd_len to 6 byte value and because it wasn't
> complete it had a FIXME comment stating to fix the protocol transl
> -ation for those legacy usb devices.
> 
> As a result implement proper protocol translation as per their op
> code. In addition to the old default value 6 those old legacy
> usb-device subclasses needed cmd_len value to 10, 12, and 16
> byte also.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> 
> ---

I'm sorry that you went through all this work, but it turns out that 
this is almost totally unnecessary.  I should have realized this 
earlier, but I didn't check the context of the patch until now.

At the place where you're changing the code, we know that srb->cmnd[0] 
is always going to be REQUEST_SENSE = 0x03 (read the scsi_eh_prep_cmnd() 
routine in drivers/scsi/scsi_error.c).  And we also know that 
srb->cmnd_len will be set to 6, so there's no need to set it to 6 again.

All that this code needs to do is set srb->cmnd_len to 12 for the 
special subclasses.  Nothing else.  I'm not even sure what the FIXME 
is referring to.

Alan Stern

> changes v2:
> - Update protocol translation comment
> - Add comment for non-legacy subclasses
> ---
>  drivers/usb/storage/transport.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..edbada636f6c 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -718,12 +718,26 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
> 
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
> 
> -		/* FIXME: we must do the protocol translation here */
> +		/* Handle usb subclass protocol translation */
>  		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> -				us->subclass == USB_SC_CYP_ATACB)
> -			srb->cmd_len = 6;
> -		else
> +		    us->subclass == USB_SC_CYP_ATACB) {
> +			/* Determine cmd_len based on scsi opcode group */
> +			if (srb->cmnd[0] <= 0x1F)
> +				srb->cmd_len = 6;
> +			else if (srb->cmnd[0] <= 0x7F)
> +				srb->cmd_len = 10;
> +			else if (srb->cmnd[0] <= 0x9F)
> +				srb->cmd_len = 16;
> +			else if (srb->cmnd[0] <= 0xBF)
> +				srb->cmd_len = 12;
> +			else if (srb->cmnd[0] <= 0xDF)
> +				srb->cmd_len = 16;
> +			else
> +				srb->cmd_len = 6;
> +		} else {
> +			/* Use fixed value for non-legacy subclasses */
>  			srb->cmd_len = 12;
> +		}
> 
>  		/* issue the auto-sense command */
>  		scsi_set_resid(srb, 0);
> --
> 2.51.0
> 

