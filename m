Return-Path: <linux-usb+bounces-26800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A948AB24B67
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C3E67BA3EA
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 13:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C4D2EB5D3;
	Wed, 13 Aug 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hX1tM0qX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198B26A1B6
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093651; cv=none; b=eJH2kT49NNbRC3IsjTDazHU3laJ7vDBXk2XvAG+PIQ1fz8OzV/+rLHHmoZR3bWLQp3EjJUkRzALMPAUyA1RlQxb8k6Na4ToyygpeLMX1xsdFAE2PZ5hfkJzaAYXSBnx77Q6F2XjvbisoW+AG6cWyUAmS7BLoww9K5E2cor0AFn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093651; c=relaxed/simple;
	bh=UsGW5uN88QfodskVKu0bk/zEoPGB6z7yLng9J3kJqoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRx2+89uq+VPGYR6gSSYBdEHul1d4sYs1pq4DqFsLtvvgHmcrFKeAzjDa5LEYuiFySpK6tWng68gPtgCSdsZsgyMEedVAkFF3n5HTMlodLrIvGDoKhXFpYFtZ41ygMoekmq6VkzJaKt0hCg30Czg8RSLgN1d8jSGTPYlenhZJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hX1tM0qX; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b104fd2bcfso2314501cf.0
        for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755093649; x=1755698449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc31v2yJfn5lC70LsWzHpGyS8F15AJd43KPnoZNTig0=;
        b=hX1tM0qX1hpfCCM0ATyINtwaAKyg9z8ABBa1fyJQNUPuBTDUYVEbWTKjA4rwf2bji/
         elvxo47HWeTZOH+HoEjfOMDVfNhe1C4Am+3HnpAQp+7DcI4tD+2o8+Nc5lTuMY9bPeyR
         pdSleUu2Y3/zgYNClEQfKG1ZKlU1QnKne5FTrwk+GzqFES7j4XX484g/XVzOO3Rz2Vyl
         VAGwkfezdSaFmaFimZVAK0iEEF6vpLlEbNKfHjUQY3xQmkI18cjdfwZ2Ou7oJ55GZJYk
         bv/C7N8h1BCFxAxZiHvtvBOgcFwZk1Zl1FYe80QobZY8GzF9kELr6s+xn/fsO4jaYgAs
         waQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755093649; x=1755698449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc31v2yJfn5lC70LsWzHpGyS8F15AJd43KPnoZNTig0=;
        b=fdmH6+te/mb1EaDQFv/NP/yCQxi6IrKXLu4AM93H24tT18nmva4wfvbjzJHBaT+MyM
         zr0kj6+K1n9wLg/YFtGPGu/yiVlULIRL4di3gs2xa7ubqLCKWVURU+D0X1YDtHS05r6p
         eJ/1N6euxLkvNIypn3pwdW0KDb311NQJ/CQ5lSiaLSzd9ji3/BzhItbGZuKbdyHoaILg
         QQRXBozcIWwQ4SbMzhmE8bhh/+nFBQbd/0RaZ51tVuFOxpssh2JgEiQ4SfAz0XYPTlrB
         PzuYNEdJY0cS+2qQ/VQ87I6vIApYJZp4+FwuCn42yIi/4xMEOCsw3c2ZJKp2aYGA6xIb
         oQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDgJEz+b3KP4KcunULzukYTCQSbno2s/S0z52aPEOIfXiUguOYKPyPknAe0RfaTR8OkU8AUydIs2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMy2uQrMGDzstZmqQkgpmi/9ey0cmjHRzGrwVJsZjbgEqFaKNM
	w/ficoSyQQEic9pOaKShOTuszhakjg30ou/eW18nea8LORH6aaTzsp6P44wDwg4VFw==
X-Gm-Gg: ASbGnctCRYud8ebDtweG44kLceZqFuup0iZGyIsReBPLG89Glynq/CfGbnpj2LQ1YSk
	RhUGX5bzV/lLt/SCdoNXSDsCuXO54JjjKE2qGU9Pt64J24hhqWlEEaoA4IPYah6txQTGyitDOlQ
	ck3YDA+dG7/XxnyF33Inofe6Xx7iYh7OOIA5yzbsAWESYSN0jXzN522RguGfd/bYOfUJVmPSZY7
	bB8rcW1K4s54aNtikM1nBAJORsGjnKohBDg39v5dlMGfaNZqFhgm5UfdVlhgelZxYxgMa5ckqR0
	rdiiZVcXPADa3tNluiVlYOC7KxY0FiN+6oEUJXBP/89mB7mwQjxEUEM8d6J3d9oOon4JdifhuKU
	Elu3Q3L6gKcSYPnxyzee0swWBRJ8fV7QpcPld1Gs/
X-Google-Smtp-Source: AGHT+IEfhlGUyZwjmFmc8w/5qnUy1OjJjl63ruLaNjye3n5HyB1AIXAaAwqg8IppikZVDelkkPlPTA==
X-Received: by 2002:a05:622a:4818:b0:4b0:be3b:d40 with SMTP id d75a77b69052e-4b0fc86fa65mr41526931cf.40.1755093648934;
        Wed, 13 Aug 2025 07:00:48 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b1080bbf35sm933301cf.15.2025.08.13.07.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 07:00:48 -0700 (PDT)
Date: Wed, 13 Aug 2025 10:00:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	wwang <wei_wang@realsil.com.cn>, stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: storage: realtek_cr: Use correct byte order for
 bcs->Residue
Message-ID: <5c190936-7c9a-4577-87c2-f79975725787@rowland.harvard.edu>
References: <20250813101249.158270-2-thorsten.blum@linux.dev>
 <20250813101249.158270-6-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813101249.158270-6-thorsten.blum@linux.dev>

On Wed, Aug 13, 2025 at 12:12:51PM +0200, Thorsten Blum wrote:
> Since 'bcs->Residue' has the data type '__le32', we must convert it to
> the correct byte order of the CPU using this driver when assigning it to
> the local variable 'residue'.
> 
> Cc: stable@vger.kernel.org
> Fixes: 50a6cb932d5c ("USB: usb_storage: add ums-realtek driver")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/usb/storage/realtek_cr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> index 8a4d7c0f2662..758258a569a6 100644
> --- a/drivers/usb/storage/realtek_cr.c
> +++ b/drivers/usb/storage/realtek_cr.c
> @@ -253,7 +253,7 @@ static int rts51x_bulk_transport(struct us_data *us, u8 lun,
>  		return USB_STOR_TRANSPORT_ERROR;
>  	}
>  
> -	residue = bcs->Residue;
> +	residue = le32_to_cpu(bcs->Residue);
>  	if (bcs->Tag != us->tag)
>  		return USB_STOR_TRANSPORT_ERROR;
>  

Acked-by: Alan Stern <stern@rowland.harvard.edu>

