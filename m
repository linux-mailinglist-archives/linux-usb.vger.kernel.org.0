Return-Path: <linux-usb+bounces-33703-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAy6CkgOn2neYgQAu9opvQ
	(envelope-from <linux-usb+bounces-33703-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 15:59:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB4199187
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 15:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 347263156FAD
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 14:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E683D3D03;
	Wed, 25 Feb 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lVLdtp21"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0153ACEFF
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031211; cv=none; b=jNrF24dWUE75E4ISg0GUH6JyydvN9W/iOTrN5zyOr3xEYJVnC0GUY0qXKhqQdM0+23I8F2rqt7g5wkdgKcuGy4xNiWLveqemBVeu/8p6hfG/SuKzoqJWIIxOK0HUXgNijr+0KV1UMAcfNXOGCpiF4dznZ73o/J0OtCmUfS6aCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031211; c=relaxed/simple;
	bh=6kNgeyuBZajQsFDMUhGW6zOMR3rchfPUVj1xKcXQLf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEqaXMlkw8UDhLJjHkxhe7YNfdoV3Av9uyjZ6QVvinWgZSmmtKKZltl53fp+IjAgIE1klj0Cooy8cmavU6Qk80J/1Yn6X9++h+V+yfGeqbJSCrxI/NH2EucQkMBTxCcV1TiN7XwBJ2XunpRMg1ZDDXyFXx/EsNGJBUvqrEjuJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lVLdtp21; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8cb3dfb3461so695820185a.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772031209; x=1772636009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SDK6fCqK6k8Fv/zIABBQJzLNv0jujOcvJbY32NbFnpE=;
        b=lVLdtp21zp0mCqzMy2doRMo8FnIMvXao7DzAGEp9SxiWXzquJFy5CmR/qBh0j3de8Y
         6mT9LBOL2hFYX6OP+dg1NPYEmxG9DcpxWeUS/e6JvrROOQn9pZFiWur/V3VSqofXhr02
         I8FPd1QLJurVpU3lWPpzb4R4W4XXrrDNADHHRfEEHoY9SR3/Ll1fbBen31aKSXcdzGGd
         JZQ95VB5hEEJDRrE3g5aJjAjDa99AppWu399o/CKDgHEzqkiFu6+zwwFg1tOkkgUTT/x
         nSFhOK4Nt5n8c2mBBRvW5PkwSrWJgG20nMtVMlHuja8VjDmtUlbZbv40Q3WakoQymsdK
         aCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031209; x=1772636009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDK6fCqK6k8Fv/zIABBQJzLNv0jujOcvJbY32NbFnpE=;
        b=Am1HxXcTbC2ycSl663iHtWbOm/fdsT9X48ioJvI5HkR+ZRJTSvkwgSkyvYvYj+h0xB
         5I3mONdLWsTVrVjQwjyL2l8Rt9ux/5OibhzJAxLVaCW2cGirG3QzV4IHCINbZ+n8W403
         Pi31exjujyl3hgGWIiquRQUqe6+Uk/TeHLMtasUs7ixJAEuycZXpZxyA179AHqfTMLmX
         DnoB7xNlsIdVwhD9B+JGrzTH5QQQXpqR7nPIFmMf+2DKLF4xh0N6Hu8oW+dpk6pkN29t
         sKf+NyhF1fKkGx1BQNghNC0m5WSa/glO5d80SjZ95o8/Oezx9Ba0xfFJ+JRsQklXPfmx
         TT8g==
X-Forwarded-Encrypted: i=1; AJvYcCXl7POKfhTuIEiHdcaT4LQl39oIz94GUiHvq7hQABl69XbWTEhj6qEgrE0Tyzh8ScYiGJaM7Hic18w=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWbkx43TVqpFdA4B4gAniKFJX46EX8vnmXCJEJPg81GZfwEUR
	RFt/pYfVYOKyINaF2FTAe7pYSivoIOnsLx4ZB9YXnmCEvJtNv29oTLXCRYsMCRQsCg==
X-Gm-Gg: ATEYQzwk+xsHzPtJsADfro3Fb43ncNEq+/rqhpENVpHRev8jdOldAd4UDp7VUTBjdMl
	mqr3AhB9AbZatOqZKeu+IcMakocbA7trOdE4MmkclVTDKWFR+a7Pk8zgL528uQH2oBjq/9vD+Gr
	0XRv+LNA+RvC494z2lP4J0E0KqhO77xjzR9R1YlhGcH7gaJavSgcEZf5MspIwBRdjF7Kv8B4+KH
	mZx4XbGu081C4+MMOAoXBPdYXaOSFQxBA6tSVRIZguWIfLmRxrdEKeZZO7QcHuqaZAWL1DUOrob
	A8hbROxRkN2e2wiZkJqL0moNdfGBsbEvYXNkiLMGVAdq7Tvkfucbk57MzU7Up5IN/YtqufOwixt
	68L5gt/Nf1TQnEEvtplCXW2CFrDvB2UzkMQ9nGBQ58+zNC83VeSlEfHiiTJ0/VNa8D16UyxXy1V
	9U7/FPJ9sO81A6z9+wSr4sRWqWiupZcIzeMiYjYiuxIehb5lzQFXj4
X-Received: by 2002:a05:620a:f0d:b0:8cb:5c90:dd7a with SMTP id af79cd13be357-8cb8ca134a3mr1950882185a.36.1772031208861;
        Wed, 25 Feb 2026 06:53:28 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691060sm117986476d6.10.2026.02.25.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:53:28 -0800 (PST)
Date: Wed, 25 Feb 2026 09:53:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>, Yuping Luo <Yuping.Luo@csr.com>,
	Felipe Balbi <balbi@ti.com>, Michal Nazarewicz <mina86@mina86.com>,
	Barry Song <baohua@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: Fix potential integer
 overflow in check_command_size_in_blocks()
Message-ID: <a29010d4-2833-4876-a0a6-af919e9fff6c@rowland.harvard.edu>
References: <20260225114957.1094146-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225114957.1094146-2-eeodqql09@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,dartmouth.edu,wanadoo.fr,kernel.org,csr.com,ti.com,mina86.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33703-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FBB4199187
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:49:58AM -0500, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `check_command_size_in_blocks()` function calculates the data size
> in bytes by left shifting `common->data_size_from_cmnd` by the block
> size (`common->curlun->blkbits`). However, it does not validate whether
> this shift operation will cause an integer overflow.
> 
> Initially, the block size is set up in `fsg_lun_open()` , and the
> `common->data_size_from_cmnd` is set up in `do_scsi_command()`. During
> initialization, there is no integer overflow check for the interaction
> between two variables.
> 
> So if a malicious USB host sends a SCSI READ or WRITE command
> requesting a large amount of data (`common->data_size_from_cmnd`), the
> left shift operation can wrap around. This results in a truncated data
> size, which can bypass boundary checks and potentially lead to memory
> corruption or out-of-bounds accesses.
> 
> Fix this by ensuring that `common->data_size_from_cmnd` is not greater
> than `(U32_MAX >> common->curlun->blkbits)` before performing the shift.
> 
> Fixes: 144974e7f9e3 ("usb: gadget: mass_storage: support multi-luns with different logic block size")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---

Good catch.

>  drivers/usb/gadget/function/f_mass_storage.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 6af96e2b44eb..12e7ef2e074e 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -1853,8 +1853,18 @@ static int check_command_size_in_blocks(struct fsg_common *common,
>  		int cmnd_size, enum data_direction data_dir,
>  		unsigned int mask, int needs_medium, const char *name)
>  {
> -	if (common->curlun)
> -		common->data_size_from_cmnd <<= common->curlun->blkbits;
> +	unsigned int blkbits;
> +
> +	if (common->curlun) {
> +		blkbits = common->curlun->blkbits;
> +		if (cmnd_size > 10 &&

I would remove this test.  The check is valid even when cmnd_size is 6, 
and doing the test and conditional branch probably takes more time than 
you would save by avoiding the shift and comparison below.

Otherwise this is fine.

Alan Stern

> +			common->data_size_from_cmnd > (U32_MAX >> blkbits)) {
> +			common->phase_error = 1;
> +			return -EINVAL;
> +		}
> +		common->data_size_from_cmnd <<= blkbits;
> +	}
> +
>  	return check_command(common, cmnd_size, data_dir,
>  			mask, needs_medium, name);
>  }
> -- 
> 2.43.0

