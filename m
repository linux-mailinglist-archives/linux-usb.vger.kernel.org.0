Return-Path: <linux-usb+bounces-14500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D596896B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 16:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085301C21B01
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 14:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8A620FABF;
	Mon,  2 Sep 2024 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW5aVe84"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F519E992
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285961; cv=none; b=tiU6zqEHrjxHZe4OfZZpa3ObOAnhA1RHF5XJnNKDYdCq193TaNvvvKEi+fcnyRCosCJkX+SfwDPmAYm3x5wOl2vt5grs7dOttO8p7EX9eK0KOUAPIk2FETifRv9fuqmfvKNTKmIHy6lvhy4TVAHFtbnJ7g88hYqbSgGIpIHtbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285961; c=relaxed/simple;
	bh=zfJCUqA1hoHWukIBHD7+RAN8K1h3ZAkSFJQGIXq5nqU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kppEZu4dwWKbIeuRqH248vRbidNxh70VkHLbqyym9hu/LRCvx3nc+JqO3ol1U6TqYRvL1fxDHB336T1Tbt4SodnF1bpFiry4/F0ocI4y0gVaDVH/EzKLg7/IacCVoZYkcwUY+O99AaegPtt+edXn4C5jAxnCY5Auflz/j5qAfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW5aVe84; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53346132365so5268031e87.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Sep 2024 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725285957; x=1725890757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BitjawRJLCcOmodRH/YNVxjVhtn6A+RcW/JdUPCnL4s=;
        b=LW5aVe84D12GjD3fMyJWWRSzDPkHgdkBKoBhOx7IqolSZElXcBs8BIy4BZ7KgA+xSU
         XXn73cMsk/LG//zRd38eMjVkr0bSrpsurSSp21eElktEP/61zLH01IPQhWFyGTeYG2nJ
         tFWqG4Sj4KwbbuJLLxfaNsc6tQmk+SF9yFVY4zgJ6Gy6etWlBEQxN7fNUBZQV41kY47H
         AjTAKoa4Mt6Co9VRP4l4/YorfpU2aboMNN6SOM6E5p9hfUODB1xvaGiGrUjFYemkXuPO
         XXRDclVfR3xWtIraQVKZXR1rAU1TBOlXsx/LF/AtqXXaIdltgnH4CBsQMgbi+5J09mWK
         WWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285957; x=1725890757;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BitjawRJLCcOmodRH/YNVxjVhtn6A+RcW/JdUPCnL4s=;
        b=G+JgkIAXmmc0wfLbOl75NK0/E43Y/Iqm4smIWud2+JNXnBffK4873dIoHW2Saatvdx
         3FfqGxZOh8z6fnvf1ahvXyFiSblYM89IDCUy9Dee10kpfcGuGN+xZ2EUVfNM0sKi+kJ7
         j1wOJuGeauQmDVmVg0jFoSJCQk66wJDHRo11CNRETVhF68eJTqnkYFZem4bH8vaIJ9of
         RaVRqsrPSr1az6KPdx5jfZlTncE5MRJtGRg1O+f2UEy6ALfAPY4/DUXYIRbnj+dZR9jC
         34AdSP9njmy4lULa9pZ4SuNdNHLNg3MCMDpLzpSTOy5b/WeOE2Hx+UPXiCnfMZlJ6o64
         DFJQ==
X-Gm-Message-State: AOJu0YzaH1wNZVTaFBcsJQwqi5TIQKUrm2LzCXDkCi9z4pdN6JQgZcry
	EDjNVM7P6+ZGVKROF/4TfuujxVEuW44xbCKJpAhRe5bmLDDQrMkm+ecI/w==
X-Google-Smtp-Source: AGHT+IGsir5FiasYmQ+Z1Kk5bdZ9iL6feWwg+6V65n1/8hE4bmNq8HQxGPYeiw/vuU8qtTthWwU9Og==
X-Received: by 2002:a05:6512:b98:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-53546ba89efmr7211369e87.54.1725285957130;
        Mon, 02 Sep 2024 07:05:57 -0700 (PDT)
Received: from [192.168.1.105] ([178.176.79.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079b83asm1632371e87.40.2024.09.02.07.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 07:05:56 -0700 (PDT)
Subject: Re: [PATCH -next] usb: f_mass_storage: Make use of the helper macro
 kthread_run()
To: Hongbo Li <lihongbo22@huawei.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20240902133024.3089400-1-lihongbo22@huawei.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <3b404347-dee0-6dfc-9fac-ec4abedb13f1@gmail.com>
Date: Mon, 2 Sep 2024 17:05:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240902133024.3089400-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/2/24 4:30 PM, Hongbo Li wrote:

> Repalce kthread_create/wake_up_process() with kthread_run()

   Replace. :-)

> to simplify the code.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

[...]

MBR, Sergey

