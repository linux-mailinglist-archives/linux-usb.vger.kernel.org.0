Return-Path: <linux-usb+bounces-29860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E78C1D869
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 22:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E9E44246E3
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 21:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A612F12CF;
	Wed, 29 Oct 2025 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o9cQesmw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A82EC56D
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 21:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774871; cv=none; b=fj+tr9EQcbwml2OdBULHeHQzJPIjIqqytBd//TaFEE1qKd7VgQ60x9dB1oaZ5WSRN7Ivrb3DTNFqMSUt9ww1YpIdCA/OgBXSDXX8Wna8rqy6YkYm7zlTCqVxuInaorYeX6EAop5tA0frf+Q74Tiyz7QzYBrhPAr7egxBLtbZO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774871; c=relaxed/simple;
	bh=cIwGmoG6KP+sY1YSTmMMxTqL53Jo8SKq/654DLCBB+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRObLWW6fv3puxZY1Gh1JpO7wCB3K2txEYS6fRGS0XPEJMo62SOSHgDi20nHhs0DZCsDRlvPPr2ca4tkkcjfRlg1RqSA5WFd0Y+nCdpFFMWHgvufryzkNakbRWMF9x81pZUjECKgyEbNMNJ/ots18GO/UZbna9wyMq4lMQdOf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o9cQesmw; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8909f01bd00so38335785a.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 14:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761774869; x=1762379669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lau32vXxFs5By0zcyxNZ3NthUAuasdtB8eW1riZ0p7g=;
        b=o9cQesmwplCNn52/m3jiDMjyLi4L2bfgHH1dL19oak5IKT307Lhqu4CE8yBlWc/auZ
         dsjNUyjrBN/AxrhXBpBYqDRE4EipC/r7/d9QQfQuy8jmSwEWVslo10gHIcjULuA7WhFq
         955ZmpbVdaDKw+6xR42FqtZfwDvHBdsVxa5qRVytwdU+75ClmRj3SK7rMKM5B2/r5gRv
         Uz1bdcVDbDdgFf7mPSXdbdwjRWRkoejz4fAMV1qrOCTy0+RKhWuu9/w7NgjzHoKmOkJ7
         CtdBIBarjPsISp1+KVbNSZKqkJcvlEmGSHoUENZwnZPOUrS1XNraZ6oZJMYVYjwMMPlD
         wBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761774869; x=1762379669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lau32vXxFs5By0zcyxNZ3NthUAuasdtB8eW1riZ0p7g=;
        b=Ac29FP8TZY1jorve48IV12J/3iw5V41iPMsvQwJmoSUe4ldORXejGLyfz0YNkd0jDy
         0YcxpM+SB4XOeH0R82PQhfbF3o0JBCdE/v3/FhEjgrnbDw2GEckA9ybdW8HGDXUMZOTI
         TyoYJpbSvw8BViPCcRk6MoiStdhyfDRiAlLMjRXtkSCHd6M8WoNvcMSFmJbF900nYGXr
         nG8sGgr4pvCnrS3dG3zrJTuSLfZN3wWqnvXMGpnSvyNoRq480GLK0UDA0VKZpNkWf8Qr
         nKC94iZrqaWcd9Xd/xHmjrqqLwnPOfA3t6kZ5ut+fbnAqM0WXmi2YsB4/eYOQ8/J4M4+
         Ji8w==
X-Forwarded-Encrypted: i=1; AJvYcCUBgNg+rdik2fEEBjKXrDqTsrtxYJkecJ76y5pVgmefY3/zJjMtnx78SSgwcEb6dfHPsHTKkDqD+8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YywH3y3k4XiFuUPKgGZ1oCqi760wBtLWVIZY07fWr/8hd2HbPgE
	1WN1PE3lLmMZ+vuQFGX3BU+auWVIsAf+RqPyVwvB8sr6CYafH5akbyfJztpsg4C4JujgOVfOVTJ
	JiCQ=
X-Gm-Gg: ASbGnctFklTcycWgiFI0iu9NfzD1Xs4ocxe0KhO7KVs/lhSel0khYw/BPu/BtYHN243
	zUM+FQsWGbRIkhZr28vz8jvzh9Q1QMX8i9dG15m3bCVAKXucAP/YwgR83dT5ufS5g9xmLvVLMwx
	5MDk6HEnpEdR4eYWscNR62IxKGWe3hCSqCPcFnVWEzYve9bTEPtChgnpEO+t2EvruwBcZJj+7+V
	mmcD7gS1H4r9cYRM5ATK1sdMD/MXOpQZq1ZsC8UsjtQJsZoyA8Oh573yeuz/c80blKwQJjTVqYu
	I4Vx8xyeMTeRuLtyWwS+94nSpRlaX4wobP6DC0gHgFhLznrXSaZGQGbFW4XRq7Dw6JT5q/RTH2s
	Ugr3/8yQy3YS/BzN4IwgXYKhnd+/dmP+zKIkM2rwRuAtnb304yV5ramQxU5MYNAghQz6iB2qgqr
	Avyb0w7KiB0JZg
X-Google-Smtp-Source: AGHT+IFhpGghbcCzXrdXqfDNrNwYDxBhx91ExXwPj2DoT8qHmF03AdvGiT0F44YF42NAfT9ELHtvoQ==
X-Received: by 2002:a05:620a:31aa:b0:892:63c8:2861 with SMTP id af79cd13be357-8a8edcffa9bmr699189085a.40.1761774868744;
        Wed, 29 Oct 2025 14:54:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25e8685fsm1135234785a.50.2025.10.29.14.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:54:28 -0700 (PDT)
Date: Wed, 29 Oct 2025 17:54:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/2] usb: storage: rearrange triple nested CSW data phase
 check
Message-ID: <27c07b90-f4ef-462b-8b6d-46afd4301912@rowland.harvard.edu>
References: <20251029191414.410442-1-desnesn@redhat.com>
 <20251029191414.410442-3-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029191414.410442-3-desnesn@redhat.com>

On Wed, Oct 29, 2025 at 04:14:14PM -0300, Desnes Nunes wrote:
> This rearranges the triple nested CSW data phase if clause, in order to
> make usb_stor_Bulk_transport() code more readlable. No functional change.
> 
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/usb/storage/transport.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 96b81cf6adc7..3f2e1df5ad1e 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -1188,18 +1188,17 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
>  		 * check whether it really is a CSW.
>  		 */
>  		if (result == USB_STOR_XFER_SHORT &&
> -				srb->sc_data_direction == DMA_FROM_DEVICE &&
> -				transfer_length - scsi_get_resid(srb) ==
> -					US_BULK_CS_WRAP_LEN) {
> +		    srb->sc_data_direction == DMA_FROM_DEVICE &&
> +		    transfer_length - scsi_get_resid(srb) == US_BULK_CS_WRAP_LEN) {

This change has nothing to do with the subject of the patch.  Please 
leave the code the way it was.

>  			struct scatterlist *sg = NULL;
> -			unsigned int offset = 0;
> -
> -			if (usb_stor_access_xfer_buf((unsigned char *) bcs,
> -					US_BULK_CS_WRAP_LEN, srb, &sg,
> -					&offset, FROM_XFER_BUF) ==
> -						US_BULK_CS_WRAP_LEN &&
> -					bcs->Signature ==
> -						cpu_to_le32(US_BULK_CS_SIGN)) {
> +			unsigned int offset = 0, buflen = 0;

It seems silly to initialize buflen to 0 when the very next statement is 
going to overwrite that value.

Also, "buflen" is not a good name for this variable, because the 
variable does not contain the length of a buffer.  Rather, it will 
contain the amount of data that got transferred by the 
usb_stor_access_xfer_buf() routine.  The following "if" statement then 
tests whether that amount is equal to the buffer length.

Alan Stern

> +
> +			buflen = usb_stor_access_xfer_buf((unsigned char *) bcs,
> +						US_BULK_CS_WRAP_LEN, srb, &sg,
> +						&offset, FROM_XFER_BUF);
> +
> +			if (buflen == US_BULK_CS_WRAP_LEN &&
> +			    bcs->Signature == cpu_to_le32(US_BULK_CS_SIGN)) {
>  				unsigned char buf[US_BULK_CS_WRAP_LEN];
>  
>  				sg = NULL;
> -- 
> 2.50.1
> 

