Return-Path: <linux-usb+bounces-10428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D608CCE18
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 10:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0F31F217F0
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2024 08:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B927CF39;
	Thu, 23 May 2024 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eQrOMy2/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1AE13CA89
	for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716452291; cv=none; b=C3yDzzLwUvaDJkp+WiXTCbgo2Jt0j0m5q8GZbDx5SsioW2DDYfF7bmuU+5afBxBfJd8mMRKAFAe2POkTV8iBoSfV5OB+6LB0nmo58kjVI+am2ZDCsP+SNt6Fe8waXnuJLBdVWoivOSUmV7dwWTAE4UKIJ2bU9E7zfFZZ4Hj61E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716452291; c=relaxed/simple;
	bh=2KTk0vFDTtEskeGWDlVvZUG9LfaG410pCuPrRVCCZ7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fI2UvcvI+YF8jgmM/N7K3fee9bGKU13UKPO9GdZMw1nEaZs5I/XDt59DXtH2FGRp/scUNMIheYT/khmcZT/elYxkTVkohGc/5yLvCXhoAV8AyreKtcKrVvqOm+f6ImGo8GhZbtmSKq3eUPYC/0o9bbykNWBjcUjVFsvLBTSVIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eQrOMy2/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-572af0b12b8so10973632a12.2
        for <linux-usb@vger.kernel.org>; Thu, 23 May 2024 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716452287; x=1717057087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21lU/wOObW9nHRj3Ls7LD5UYrlZfeNZ8c3JM7X95WyY=;
        b=eQrOMy2/E2lxM0Zp+aSbKFGDd/hxKIVYn1uSGJFnYDoQjKh434t6OBYAr/T04UoxYw
         vE53M6tbtpeIBeK7N7eYayHYI4u3IHi86iFpZN7b5N3WTdVuUgYgGWsXVxKOVONr0FrS
         wuCf7vIiG5V/NkH+67Qb4Z980V0t63onPU9+02gH3rtglQrpxMxs9IoBJRHwIBR8GUCU
         XKthEpZxDAvoKraJsUywebdFSas0crtA0oezv7AUofxdVP3aJ/lVKjkN8KnmoEqV5xNL
         NRsDNkWa9iqORkPkIy2KWMxARpdIgWnejGtgcFVaRkqgzKrUwQEpQAa8uuW3USnNGLAO
         jSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452287; x=1717057087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21lU/wOObW9nHRj3Ls7LD5UYrlZfeNZ8c3JM7X95WyY=;
        b=jZBwqM0gJ6veyq9Jyt4kwBskhQDYwpEEGLO5H51J3JssaGKgcxPNjDskTJIzPGM78x
         SkpRHO1Zwnsc7B6mSKcoCaPcoCjL5W2w4UFIUNsp5hDrGfN6b1Uoyd1KQsf5U81267Xb
         6OJL5yFnrQ8+R6Z9DPqDs3cGMPv1udT3OkxQU7c59PXdv2+ieP4fuUlDkX5No7/FEpD/
         LCqKSOlBLCwsAymIHBKnMhSa3YPNUL8MDkfcgk4mQtk//4EFeNzinC4/cGVoySoa/cNd
         IWobwRhk4g0wl13VcQc1pBqOKzm5/UQVBbg/wSc6GcL6lxSRPO+UIqQ1PWI8Nvsrlf8i
         ajjA==
X-Gm-Message-State: AOJu0YxYf1NYLvBtwq1Jby9uSmPMQC0h6UU10hM/VlNUBGOx5FMdBj+Q
	vAZaNK9kNYahbmBd5uYdiReUvHf6wpGY6auycEzNpea0MxA2f2A4A8Y7Dx4XX0s=
X-Google-Smtp-Source: AGHT+IHe+teHQABE5Mik2uPAaKR/j5ry4BDHhUfTX+msAC0v/2NUn5aVNWy8rF5dBb9ysWTD2wEmIQ==
X-Received: by 2002:a05:6402:35c2:b0:578:341f:86b8 with SMTP id 4fb4d7f45d1cf-578341f8744mr2826677a12.38.1716452287314;
        Thu, 23 May 2024 01:18:07 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:e8eb:4d8f:8770:df82? ([2001:a61:139b:bf01:e8eb:4d8f:8770:df82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5784898d04bsm451835a12.61.2024.05.23.01.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 01:18:07 -0700 (PDT)
Message-ID: <a218cac3-9d9d-4ac9-8ea3-0ea9822b2261@suse.com>
Date: Thu, 23 May 2024 10:18:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Check whether divisor is non-zero before division
To: Shichao Lai <shichaorai@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, xingwei lee <xrivendell7@gmail.com>,
 yue sun <samsun1006219@gmail.com>
References: <20240523072242.787164-1-shichaorai@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240523072242.787164-1-shichaorai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.05.24 09:22, Shichao Lai wrote:

Hi,

> Since uzonesize may be zero, so a judgement for non-zero is nessesary.
> 
> Reported-by: xingwei lee <xrivendell7@gmail.com>
> Reported-by: yue sun <samsun1006219@gmail.com>
> Signed-off-by: Shichao Lai <shichaorai@gmail.com>
> ---
>   drivers/usb/storage/alauda.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index 115f05a6201a..db075a8c03cb 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -947,6 +947,8 @@ static int alauda_read_data(struct us_data *us, unsigned long address,
>   	sg = NULL;
>   
>   	while (sectors > 0) {
> +		if (!uzonesize)
> +			return USB_STOR_TRANSPORT_ERROR;

May I point out that uzonesize does not change in this function?
There is no need to retest within the loop.

>   		unsigned int zone = lba / uzonesize; /* integer division */
>   		unsigned int lba_offset = lba - (zone * uzonesize);
>   		unsigned int pages;

Secondly, alauda_write_lba() has the same issue.
You also need to check in alauda_write_data().

	Regards
		Oliver

