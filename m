Return-Path: <linux-usb+bounces-15167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CC97ACDF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 10:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED6E1F25AF3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 08:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16BC158D6A;
	Tue, 17 Sep 2024 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SRauZwM4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E01411C8
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726562006; cv=none; b=YCFCBr+h+3MEij1dyJsjSQhtevVkIYTM5B2wfT5xKTLzw23O9UsNak+Spze9jb31SPNyA+gRcxmiR5FfZyqf/xf9Esup0rRt3ET59gx7WC99Lg+5dRzb1DUmS5DV1NGrXg11Hw9z5jgIngXQx88wIpE7a6mEbpaDg3htn19+Gt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726562006; c=relaxed/simple;
	bh=iE2Wv0+cvG+2aZXxRAF3RlJ75YbC/cTAt9RJEO8/fHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbCRRlAHsxxrxA16N/HHzt4IcviqFs2DgG3Q2SjKdbCFEFQn0AQXejZxAVdHq1dBOZ22DUNWM94LAc61dWO7WHvwRy3xnyQR9by13AKU7tYiugnmPMgfFlQiNoCzdhhncSW2XU/1/zYXlWqUrTSryZvvP2mMMEQXKmajfAJOQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SRauZwM4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374bb08d011so3039572f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726562003; x=1727166803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uaZq80rKA8PR8arvgj14dSjlnVlXU4VT+sLVAjweGL4=;
        b=SRauZwM42G6Xa00/XBZ2NeTSacSd+kn0+obCBNuVj1l+QpZQDISie/gcfB92flBvl1
         Q2eETmWFBLopQtl5CEOo2H3lkxuITkkd8+/6n8GBIc4U7xA/uVDT1rm+auvJZgyOdYco
         F6RXDyJY6gdzNVmjmtk054YdVuOy4cqLoTgiTinOETQoD1PqH9cx6/YZMSqhSeHMYZQ5
         co0/NZINcqxy8cfbO+qsvaTeOmPCAEQsUdPvQEJexPGRSU4fgWghggPj93vB1a3njphT
         zUkxi5tvCel2dT6UYNMFNL+ox86NQouy4/8L9Jf061BYCwyH3Rt88whvXG722rgMo3ap
         3WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726562003; x=1727166803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaZq80rKA8PR8arvgj14dSjlnVlXU4VT+sLVAjweGL4=;
        b=Q6ClfVoLAALT/Wp2tV+3L23chC+9aE3HpbVPKtSzuXHoH8Zda18YYYH3EHgcePE3Vp
         frkjp8iPpWm/AVODcVjRQ8GmKYy3/ay8YqwVRbONBZGksBL7TRpXoqSzZNDJWa7ndWe0
         DUP+d3EU0UgCboaWrqhLiEAoL6dHTyVCQ1x/tS1JdwgCt5ktB4uKMrZY+NdczZdy6on3
         E4BPOyD43nQ7dw5GrkjdFYkAhzjJNu95wlgsVwFNI82UiWe61ymclGRryLaJTCMGH1Tw
         JHnnCeH6KaLqAU3AHl7Ra98IkP7HLOpQsaeTBJs0rpFmEZSwypUaljqSq3QRjnjkK2C9
         KgHA==
X-Forwarded-Encrypted: i=1; AJvYcCX0DLj/vmPP0mG28MXxozjq8LVZzXNKJNsH0xkUz8xf4dlR+TTQCPbNudk02/nm1gmjxOo8NtBvEqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAcpR9LKZMz2ufUZkXHSIYhDrEIuM3yPrZBrqHL/RRSUPBoux
	lsSdmDnFyW6k9uLcqRjo7RMpR0PzGvRr3BBXe/pk++ihaXbFKyLbWv3/wUsASpc=
X-Google-Smtp-Source: AGHT+IE18tMydtbEAct5RuY9jItVP08eE6+B7i44g5FEd+bUiIHVt16rsPdFoWrSWWWG6HoY9IImXA==
X-Received: by 2002:a5d:4983:0:b0:374:c1f9:ea79 with SMTP id ffacd0b85a97d-378c2cd5e5fmr10660845f8f.5.1726562002356;
        Tue, 17 Sep 2024 01:33:22 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ed:c201:b884:edfc:abaf:1cf4? ([2001:a61:13ed:c201:b884:edfc:abaf:1cf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780e14fsm8894819f8f.117.2024.09.17.01.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 01:33:22 -0700 (PDT)
Message-ID: <c96e95c2-aa59-4ef0-b211-c1cea71519ea@suse.com>
Date: Tue, 17 Sep 2024 10:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: use mutex_lock in iowarrior_read()
To: Jeongjun Park <aha310510@gmail.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, colin.i.king@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240916040629.28750-1-aha310510@gmail.com>
 <2024091648-excusable-unfilled-83de@gregkh>
 <15bc0f3a-5433-43e0-b0b0-8b9c26dec165@suse.com>
 <CAO9qdTHrbG-aWetpM_e7zHUhrwPD=7uCHPbWSMoorgnwjKEOmA@mail.gmail.com>
 <bf971924-9d91-40a3-a4c2-5b518e2ce2fd@suse.com>
 <CAO9qdTHWfYv8u-gJqGkuG_OSdkU9c=qZSnEbE+zCYWG5bT6r+Q@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAO9qdTHWfYv8u-gJqGkuG_OSdkU9c=qZSnEbE+zCYWG5bT6r+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.24 08:23, Jeongjun Park wrote:
> Oliver Neukum <oneukum@suse.com> wrote:

> Okay. But O_NONBLOCK flag check already exists, and I don't know
> if we need to branch separately to mutex_trylock just because O_NONBLOCK
> flag exists. I think mutex_lock_interruptible is enough.

It will still block.

> And the point of locking is too late. I think it would be more appropriate to
> read file->private_data and then lock it right away.

You are right. dev->present should be checked under the lock only.

> I think this patch is a more appropriate patch:
> 
> ---
>   drivers/usb/misc/iowarrior.c | 41 +++++++++++++++++++++++++++---------
>   1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
> index 6d28467ce352..6fb4ecebbc15 100644
> --- a/drivers/usb/misc/iowarrior.c
> +++ b/drivers/usb/misc/iowarrior.c
> @@ -277,28 +277,40 @@ static ssize_t iowarrior_read(struct file *file,
> char __user *buffer,
>      struct iowarrior *dev;
>      int read_idx;
>      int offset;
> +   int retval = 0;
> 
>      dev = file->private_data;
> 
> +   if (mutex_lock_interruptible(&dev->mutex)) {

This blocks. To quote the man page:

        O_NONBLOCK or O_NDELAY
               When  possible,  the file is opened in nonblocking mode.
		Neither the open() nor any subsequent I/O operations on the file descriptor which is
               returned will cause the calling process to wait.

          

[..]
> +unlock_exit:
> +   mutex_unlock(&dev->mutex);
> +exit:
> +   return retval;

The rest looks good to me.

	Regards
		Oliver


