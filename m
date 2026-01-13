Return-Path: <linux-usb+bounces-32231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F51D17C37
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8870330069A8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED813389477;
	Tue, 13 Jan 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EWcMNFQW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F9387574
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297761; cv=none; b=CjtKsbfyOTXtsg8+D5ciYmTj7kglbf3A+Py0KKm17iDlL4MTwqDI08ILx5y0OdfDLMOqvGmkoBWdaD8Uou6HAkfT+etx8lXWEfSTjn/N3Cql2gslhFpZrGC50uxunXOrTslude2l8e6sX+LNzU5kS6ISiQVpINKX4xPcExKhBlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297761; c=relaxed/simple;
	bh=rldiau7LJXcOO0Pd+JfsXVEuF+CP8SBS2Jq+Rj28UZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTR9O8+TIldPcOf+YsBnlG/MmXo8wG9nTpwBSp6tvDytgdNfknmTExJrdDd6FA1QDp1yPMKtyHeBkx4G60OiQvQLBzbkOSO4XCJKz2QJnhBqrlMM5ZwBIHTO6VBdb+QM6AHNEKsvkoo+iKrK0ObdPOL+4qI8auVv3p57wUIU4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EWcMNFQW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso42384095e9.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 01:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768297757; x=1768902557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkR4LfU8d2LcPG3/noB2c/VdgPhARHyvnvpu09hPr6M=;
        b=EWcMNFQWokyYQ1jUiWOXeyE8jfBbb6FhKM9F9XRStv1glTWorFRarMFJZPmkKNEO/f
         EkANhkpLx16EK70m5VKLJR+TNiZN9lx6JqlcZw8ELi01L/csvsTEOBh4zdd/AgTsW7Fe
         1fN5FHNTqwnOGa6T7xbsbhe+5bFKNdQvT9fnl+C6nZgqIAbQmKCgZ4uB6607HHJOvfzM
         90Lexj/lYOCeESrOJ59ethuRtgD3pA1fzI6s0EwcSs+scsPiHG4Voa+ftsSuv1KuoixA
         CjE7s15eWR7mP9Al5b7HvrxAUsnqbgI2dU9aJJLXdSYCyq4cjJKg9WE6BgvEoAC2Wieu
         MISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297757; x=1768902557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkR4LfU8d2LcPG3/noB2c/VdgPhARHyvnvpu09hPr6M=;
        b=GfDNKXuipgo8drcQvKPD/m8w2UoVNM4fG8oIttHiNaqv06DFxyz9xJ/WbqENSiedtu
         Wj7JMWLSqHBGQ+hSVQxE4P5uoe6eM9yt0AldxF5qABuHsamKXVD8CNwzsK/eEMSaMqbw
         yBMj0TDN31udcUGX0Hs8U4hDxmsd+jxRDO116CC6v/Z2SSrSLHsB6JslpuGPy0x/Scez
         hy+pcSw6H5YNfc4W287pjle2gpC+hESU3YWpjhHO//VlN6FRtK7jMmFlg3H2+CbYkevE
         twfQM1dpWd2GSGtKeXxsE9qmIKK35xGxlOpJVRQNsbXpqZczJSj9AxGB8+3Hra4DpPYY
         mrkg==
X-Forwarded-Encrypted: i=1; AJvYcCXfnUFgPz4e4YwQe6yHFzWwoEpxKmvTKC+/im3vAXWGF0OxqsPrgCKDFWyAp9rtSDrgaeX5+LZFlgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SCArQ2mE7r2GR9rUvt1bEFkMeTdFmsOIFilXXilDuIUrFrkc
	sDxEVeCx0z52K4b4gN9kgqawsInWdNOCUkXSHSli1QlblS91Bd92dMW0S2BiBZKolJo=
X-Gm-Gg: AY/fxX6pEg7fRXPcg6ZhotbTK2e/woReAAN+RD+hfzeyznLXTTTvfiUn4MPba38x60n
	8NZg1hFFzBEO80MFhb4HuYd3zsPVC3+HHB/3qhxW0FzUvThwAICVDMstQ3ghJzgJ+eKREGRWJ9E
	CXD7CpDXQsHY1ctz1+GxnjY+qAkkMBJpWqxvdbUSj0KynBgFe5KImHkKXyMHum08suyFHnEMD7j
	E/i2cqW0VDbO3pLmyGTbJl0VsxEq2pQrENUIDPejNNoD+UFQXG6J1MEOpcNHEfwSbHi2xkSgo2e
	qcSMGQOAi2ICzSMV+B6SNpzuYwghwV+DXP/yS3irOz5X6rJJva+RYgb+flyr77O8BchJ9QCE582
	Itj3k57dUCoC4Yx5khV1ZXkxLCIkXbAp5gEf8yFhiuSdOYV2NtBm1+zInV7tZ7DotLGRVVlsaSx
	GYBbkYpWMA9MU9MbVNWI6b+gatAEUneofTiFR4GatBEdcieu5VGrL2AF0=
X-Google-Smtp-Source: AGHT+IFljzIApLs6K0urPpIfNVxYXphnQ4IkgtF/Eo8NnIXz1bAxvwl/i9fym1QFfouIdmsnW3s6JQ==
X-Received: by 2002:a05:600c:820f:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d84b32f09mr213986235e9.22.1768297757438;
        Tue, 13 Jan 2026 01:49:17 -0800 (PST)
Received: from ?IPV6:2001:a61:138d:5701:1aab:ab2a:99f8:6c9a? ([2001:a61:138d:5701:1aab:ab2a:99f8:6c9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df90dsm43504596f8f.20.2026.01.13.01.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:49:16 -0800 (PST)
Message-ID: <30e2487e-5738-46bc-95f7-8d0ba3ba9b1a@suse.com>
Date: Tue, 13 Jan 2026 10:49:16 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
To: weipeng <coderlogicwei@gmail.com>,
 syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de, frederic@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de
References: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
 <20260113075210.39425-1-coderlogicwei@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260113075210.39425-1-coderlogicwei@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.01.26 08:52, weipeng wrote:

> @@ -287,9 +311,9 @@ static void i2c_tiny_usb_disconnect(struct usb_interface *interface)
>   {
>   	struct i2c_tiny_usb *dev = usb_get_intfdata(interface);
> 
> -	i2c_del_adapter(&dev->adapter);
>   	usb_set_intfdata(interface, NULL);
> -	i2c_tiny_usb_free(dev);
> +	WRITE_ONCE(dev->disconnected, true);
> +	queue_work(system_long_wq, &dev->release_work);

Hi,

I am sorry, but this fix is looking a bit fishy.
For once what prevents the driver from being unloaded
with a work item queued after disconnect() has run?
How do you make sure that the disconnected flag is ever read?

	Regards
		Oliver



