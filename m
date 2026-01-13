Return-Path: <linux-usb+bounces-32300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2FD1B315
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 21:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE49B305380D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 20:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038443876D4;
	Tue, 13 Jan 2026 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T/kmzgRf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A0234D3AD
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768335799; cv=none; b=e1di5wrcjhtAg1mWm0zl2CW669bj9mYwj8yzM7gi9m/xhF8ycYPbR9p+4G28Wjmv0GSXkChviohuWPfUoUXk33avaca2g8lu8x0+QJHbiN+sqdaGeCejpXAi72PIJqArUeNkaZL6HjrMlT0K6q3zwfDvGZoS2SRMFo7yxQBL49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768335799; c=relaxed/simple;
	bh=OzuQ6iWjzoYV77KDRUSGerU/496Kc4rlMMYENR9wF3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FElH8PkPk8ithRppr0gNQHyt3f2AyrYetuwwDEKVsk2q+cXha7fGRhyVJ4/qfmd/tFvp1F1vQHsW4J+l0+2ZAEUq45Gs2DJWpdGsLhee0J0Ug2YTzEj3aOez3aheMJOBptUElpq6yOZtqh++ss4eBzCvawtX+U988dx0VM8c1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T/kmzgRf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso73040275e9.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 12:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768335796; x=1768940596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8uUTB1SVA3MIzVmUio8rFNP+sCwhx9nt26BkyDd1XI=;
        b=T/kmzgRfMOMDkluUzaiTFwReEiFtEAKcouSRkvh1QUjVM+XEN/7qblJIfzbbpiJVew
         yRkGPLpARu4nfUK6xqeYzRQHKl41tunf4ozmUS6INdvyZntSSFXdq2LewfPiuF7DJ74J
         Yjou8cX5/7MU8wT1n9CMmBEwiOcLkcENUnoq6csE1ZernVI6IuNPfyimp4JGz5wT1Q7X
         yvyng8MYTS7slP+8JUZdtmxhAhxfeBseE2ordQemvjpf68avZxjWapUwJhTOlYAXRoiv
         uTIwkwFcjbYt8yk9SoyGodCrGXnmg56VrRsxOQyjvL0f8CeC9eAZhMGicv97iQ6zlEda
         +VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768335796; x=1768940596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8uUTB1SVA3MIzVmUio8rFNP+sCwhx9nt26BkyDd1XI=;
        b=lUx7db/50YJ4+K/UTY4AKZp9C0ooKIkOd+BLC3Ui4gN3eZ0VtpyT+LMZVgjEUZfceS
         OVqJzQ8PvmrppQWB0AAmkLw3hrmH4G/FukBU5M86GRUHET9GWowKjbH6Tf9qG5spzFmR
         Aj7q03W740be2xuflTY89iQ9KZReBELKjdfj+2qgzw+qaPWAC3BHBLuCr2SZhCyKC6aw
         GGvRFreAl6DyM/wfTMDrYae3IEJi6uAXFcA3Tny4bVByO5drIO4z04JymcmXuDAedMbS
         G0VKvtauWHYTHhvuXtBqzMAp/lyn12jAmNHMWwbEvHlRBgNM9Nz7/WiYa2ZtgZaQJPDa
         LQag==
X-Forwarded-Encrypted: i=1; AJvYcCU0oi1iottCnY2dV2Fmg39nVCz41v/v0pgEPb3FPiN+w444XRspfSK5hKfVmkSd/bBjGK/ib7TUy/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqeCtI3ulAwTR8mlyvxyls4ToAtjq9IgwWeNQhHsJ7A+z/C+f
	qhSnxwzfJ/peHGOyH95+OsCNnKGETysGsvO7km3DBDhhmJVslx+pEtSjjbYbbTqJVFMSt92Mxug
	kK0+rNEI=
X-Gm-Gg: AY/fxX4N8tWs5i4tg9Zx/Prgi1n4ABXtLwrjHf6QPWfiYWCjrvr+93YTc6N+tcrxwr4
	SmGnNlFrldgL4nJ4NnZbD3mCLwNohCgYgVFctcdULak7DTtvzH8Kr05bhsyceKB2ch3MJgBi13v
	U1idLifGsaNI2jpwHcYdrQpLUJwsyLk7BoP/UMXHfpuA1+18nTUT9k4GNOvlxtrE7G0wJkQAb+N
	jSgRIPu0nUTW8j9pvtigvSwxkCRVih8sXfUom9KHIOwiCHcWXDmG1psq3lHyN01iSQ9Ggid+Zos
	2AYQLgsnz1y+3LbzdeAVWcoFTVHeqBQj0No5FLcrjDkEL6zsdD+DP5chgNts77Ym9TPXEGpDjx8
	QDdsBdlPyxNL7za9KlMkccoir3Ybr6FNGM3tnCNIjZjWYDcM5vMAtLN9AXPM5d4nY3R+h5Av17X
	oyd+gUP0v8gK4JcqFuvwTMDKSkKZjTlEFGDkoJjfrQeo5L7ojZalxYNQo=
X-Received: by 2002:a05:600c:3acb:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-47ee33214c4mr3686195e9.12.1768335796432;
        Tue, 13 Jan 2026 12:23:16 -0800 (PST)
Received: from ?IPV6:2001:a61:138d:5701:1aab:ab2a:99f8:6c9a? ([2001:a61:138d:5701:1aab:ab2a:99f8:6c9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edb26792fsm47371495e9.14.2026.01.13.12.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 12:23:15 -0800 (PST)
Message-ID: <a53fa501-dff1-4732-92c1-fab8e66ef886@suse.com>
Date: Tue, 13 Jan 2026 21:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
To: weipeng <coderlogicwei@gmail.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de
References: <6963d09e.050a0220.eaf7.0070.GAE@google.com>
 <20260113154748.341096-1-coderlogicwei@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260113154748.341096-1-coderlogicwei@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.01.26 16:47, weipeng wrote:
   
> @@ -287,9 +321,12 @@ static void i2c_tiny_usb_disconnect(struct usb_interface *interface)
>   {
>   	struct i2c_tiny_usb *dev = usb_get_intfdata(interface);
>   
> -	i2c_del_adapter(&dev->adapter);
> +	mutex_lock(&dev->usb_lock);
>   	usb_set_intfdata(interface, NULL);
> -	i2c_tiny_usb_free(dev);
> +	dev->disconnected = true;
> +	mutex_unlock(&dev->usb_lock);
> +
> +	queue_work(system_long_wq, &dev->release_work);
>   
>   	dev_dbg(&interface->dev, "disconnected\n");
>   }

what prevents the following sequence:

i2c_tiny_usb_disconnect() -> module unload -> i2c_tiny_usb_release()

As far as I can tell, this can happen and you'd execute already
freed memory.

	Regards
		Oliver


