Return-Path: <linux-usb+bounces-29124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEEBBCDBB8
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 17:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB2B4240B5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B2A2F7AD2;
	Fri, 10 Oct 2025 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CnzScavg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CA72F39D6
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108829; cv=none; b=N9pNZQlcPqCiQILYkMrQZ8udTn8KMmmzHdysg44MADlIRhvgMKFoMrdET6J6GB7iV+lwaAFiH5YHlbrvzSBa0ZduN8vUTqxoxGesIJGopYGBdoLyvbj6FG+Y7CR5jLGzTvgRt0IV1RNlkBlM4kBhp90vRgrc+b2ruzDiDsfQmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108829; c=relaxed/simple;
	bh=aHC4ANyZ3LMwNKpn6FQcAywDOuvSgUJCR8PG3sjk6M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4bTNr7kYt5r1wP6C9guibBcef0xOXETtKpxewOOXHegPVR0kUbBsiVOJy6xlSm31bpmr1W3tiOkB+Ju6nc0FIg1TLAcsR/7OfET6l5aMDERowrSNUGco08NoCI+WKwE4LWN4WItKrcgDYVDSblCQd963IsS6bhBVpIstaG6LpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CnzScavg; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8572d7b2457so270062485a.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760108827; x=1760713627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AD2u7ohEYHBoAEOZPmocWQoPo/nelW9L2mrB8kmYU98=;
        b=CnzScavgIjnfiUOAqr5vzpHaNywbnehfLbhCOuXG6Vmfu+zZYWUwb7An1cnLwPZ08X
         LvwbNfNf5pIVXTtuQF/FT5+S2rFt7GyIZLzkmyS21bHTIYXaTkjENPdAACz2vNrBQ2gi
         5tn3Khj8bfCRUi/L6Rk9rtAFJPva8v7OmYHk+Dgu4814MM8fapsIClL8vPZK7xD7bBx5
         8i04Vdr6nB1r9haQgDLMB1thjwmBcHw7oVeCmN+4WgJxhLlKv9ick0E/LTd47kriQekt
         UJCw+OjTaFCrXSE7TkJnQKz3OnziVjrqzx1qeeYFKa8E4Gl35V66N3qNYvNh1P/S9o8C
         HZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108827; x=1760713627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD2u7ohEYHBoAEOZPmocWQoPo/nelW9L2mrB8kmYU98=;
        b=jeUAPmni47QgnUFM+E6FHYNC72ACnjWqZdXP9rg25a1jzN8U3lt5UdhMMz2xVTgl7i
         kWmTJ+1lgk71QInPRrIk004hqI2rtKY4j8omwKnjl5ulUhYjk437G90xuLCK4PfFqUX2
         BqlMBsc5NcEUZL55MSJn2BNmyybc4XXk+MVjsmFKQo/R9poCt4qY2MjLFbLycLlGjEiu
         31qKgdM20mLTd3tOMrQJ6mMW8J1qoZckYX3+YrvpkEPwYMcDw7IL6jLB7WM6wAvD/Tuv
         mLt19dpAEDAJ3VdeY+sdmg5Nn4dg4MKWevp0Y75hIZttrHhXx/cpgBWFDncoKCdFu6Ej
         vcKg==
X-Forwarded-Encrypted: i=1; AJvYcCXjbtMyJ+CxT0RjRZWoeulSKRpMqjh3jRmls+ARxJ0SwNNtfRAvXd5vfqHbddyqsKAiyQW1cmSKgOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe2Pq85VUX+5bNsqr7up8sgogDY6US/fH/Yy6OcqnmbrM/xZW0
	q5Sa2wdK41zGdoepXNOTDUX9UOO7ComcEOTTm6VErMV1yLluVfJyVuZCw3M5lAbjPA==
X-Gm-Gg: ASbGnctJFSPmx8XRBKMQr4Z0v8kv+6FPtkvft1NBD1GfEqzOblMTlOJvO5zZFRBye0e
	I+P9G2cKMUzYOzYbFrbcnGBLQeU+r7uPVDBklDDhn7tKp56y8NeyurMxC0dqPIC7xS+qffx5UXt
	DhiVrlBUkNEjK7zXOOYdxYbKA7/Bljw5A80H6M3q11kF/GTbFMTHokuLgGfojLBa9yyKCFmPief
	9pCcr4+etvlHGXY0/cfUFJ5KoUHIB+UM2bYNBdN6L8GGgpgYXDT9tTR5bm/AEHJqAHldrjA+MGD
	htDQO0RRmtrHVyoKJc4C8uINgHgzTkA6raoB6FQf25SWMMppRvZ350znpHALDztlRCMGiGZVKXR
	uadRisXJZqOSKE+W7AfLwdMOVZ6p8z6gBMUJBjYwOtYc3vSarCw==
X-Google-Smtp-Source: AGHT+IFAEGEgtUrpdU08FiR9G+QV54PfZuPzw7W1eHOOAE/rDwQhKramJtlnuSAJaqIdqgSTrZy9Yw==
X-Received: by 2002:a05:620a:1a04:b0:849:c282:d507 with SMTP id af79cd13be357-8836f56fee1mr1366005185a.42.1760108826717;
        Fri, 10 Oct 2025 08:07:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::de67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d8ec4sm424231985a.9.2025.10.10.08.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:07:06 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:07:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] usb: Implement proper subclass protocol translation
Message-ID: <2d7cd968-3365-4f9f-aa88-d953809bf0ce@rowland.harvard.edu>
References: <20251010113003.22863-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010113003.22863-1-i.shihao.999@gmail.com>

On Fri, Oct 10, 2025 at 05:00:03PM +0530, Shi Hao wrote:
> Proper protocol translation for old legacy  usb devices.
> 
> Earlier protocol translation was insufficient for old usb devices
> which was padding all subclasses  such as USB_SC_RBC, USB_SC_SCSI
> and USB_SC_CYP_ATACB cmd_len to 6 byte value and because It wasn't
> complete It had a FIXME comment stating to fix the protocol transl
> -ation for those legacy usb devices.
> 
> As a result implement proper protocol translation as per their op
> code.In addition to   the old default value 6  those old legacy
> usb-device subclasses needed cmd_len value  to 10, 12 , and 16
> byte also .

The spacing in this text is strange -- double spaces in random places, 
no space following the first '.' in the last paragraph, and an extra 
space before the second '.'.  Also, strange capitalization of the word 
"It" in two places.

> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---

Overall the patch is in pretty good shape.  However...

>  drivers/usb/storage/transport.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..4820b45d2a32 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -718,12 +718,25 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
> 
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
> 
> -		/* FIXME: we must do the protocol translation here */
> +		/* Protocol translation per scsi opcode group */

This comment should be different.  The "per scsi opcode group" will be 
mentioned in another comment a few lines later; it's not needed here as 
well.

>  		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> -				us->subclass == USB_SC_CYP_ATACB)
> -			srb->cmd_len = 6;
> -		else
> +		    us->subclass == USB_SC_CYP_ATACB) {

Please don't change the existing indentation.

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

And you could add a comment here explaining that the other protocols use 
a fixed value for the command length.

>  			srb->cmd_len = 12;
> +		}
> 
>  		/* issue the auto-sense command */
>  		scsi_set_resid(srb, 0);
> --
> 2.51.0
> 

