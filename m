Return-Path: <linux-usb+bounces-18649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFE9F6A7A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 16:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E68A7A5923
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 15:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734DD1C5CDA;
	Wed, 18 Dec 2024 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cLPhWavj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4061F239E
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537189; cv=none; b=l2LW93+MrtstNgsLXpm0axRafk39FofQkFBqOCorlPlsckVPonX9p61cri5AEMJ+/YMgfdCLFAOLBuXnWjRyGmnUzU6kcc3fwSlCyGsFt4NB8+ji5s3BybxibNwMOhH/ZxB6HxXtXBFKFHOW7kTGKhtaUM4Em25bOWeHgWyZpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537189; c=relaxed/simple;
	bh=BnK3wVR9GmW8tGs6cZLrsURMtarGred4qj5H81H6sqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs1e9kEckBb9Q4iuffIszh282kv3LaZ2S7rd3NquVYWEiJ1o3VJA52T9Cu7rm/F8eXQvIFbcGnRrL2uyjalKXLhgz1yeyjDzm2pkiP1pOrcjwPF2cvfHu17ydLWpIH0Hjj4pyhhv8vcd0OOTKJu73ljLMfcYO4oMDzKowcvPuho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cLPhWavj; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b68e73188cso770193985a.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 07:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734537186; x=1735141986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMOV2KSeWDmaAVxI5NOfNysJIN/FRYl6Ew3xZQr7LpQ=;
        b=cLPhWavj+YaaBX3CJaQd/HDpOd+M1euoqMxR9Rq5/WPMCZ1tY8o9AYRFXO0ChEauzb
         4qEYc6t4AFGb8IsKqt1o3/T2u/LYt8lVXdI4dmbmLuFxXSOZiKLtiVFpqhAaTpnBRd0q
         SiukUocZHxxvFYSgQGs7ESn3MnY/WFnjWEeYmpv9808D3czUg5GFdprhXpdX7vLbJl1F
         VBXQATxavXC6q4OZ3wNiIvQH4yPsl7hHWzFkJLPNNgCtCgyDOvH19MxHyvLgoitxXcNA
         uIn+8nPW3a3liKxaccKTRKof5Bm9ZgMlXh4e3kzEO2qb7aEMDgOvWnlA1DorTcjUeOqX
         p5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537186; x=1735141986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMOV2KSeWDmaAVxI5NOfNysJIN/FRYl6Ew3xZQr7LpQ=;
        b=ZJLaCWZSRngY1bOTomNp0mYpVNEexDTt+gWslMLEAf3Z5Frikw9Rq6STQCSKS+oYA0
         CnDKyO5kbV8LRymrK2y/oc3yvs2/NHoncLoZqbEe7yHWarPRLffVQaSJFkWoW4X09h8D
         /pJeDaEddBmB/IVq9rsyghHZpDx9laWq+iExzsFEtYlUfiMbL6EaDIIpEMeAUaX357M/
         //xOIqJ4smUWzBn68LeA8SUHo6lz37NLWKzkZxEOUNCkW0A2j5wufo65ySe+RwMeBWah
         vIN5ybi5xQGhvqWVTK+iRQ7vPk7gePsXdEgUZRgO9HS64EP0qtWl8Aa6un7OAKRq/2qN
         V3/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7pRaFIJ82sFW2IuTvAH0ajM3DWbZ6hvIa02INaAyO3v7f382aTzMKpd+hARKoZlW8VTStkOOvL0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfUV/7OJpw1tSp8nsfrrCfA+Yl7FIBLr1RJ/pSW6gC2Q/bv9r5
	BJghVmzpsPQNoKJ5J9JYD7/+ZYp5NRKPrV4bRCjoB+zNRTpxAW5Sf71jcY9aew==
X-Gm-Gg: ASbGnct0L+WL0cEDNOjZw3dfPnWq1LlghTCBmU5MVtapvOfG4SgYYsB9KEJoHcwZZu9
	8SgH027//wxFqXyoXO30Y4ublrGY0uoi00M2eS6jILo4u8a7lEguhsSc3BJUuRzNhK7GEapHwn5
	a2aIM2n2TyHzJqBxUQq/+70eFSTcitQOPFsgNGhHdRejrZiYhXxE5aGrUAPVMHQ7HmQBI6jhOnZ
	bYtgkPBG4FjNacD+Doh0i65qz4hYA+v3lg5mRu0TcWRte2uLo8m3ibtxsQfbAhQErOtV2YqKQo=
X-Google-Smtp-Source: AGHT+IFGGX03Kfd20xEKu/qFp/fE1GeTEV7IIr2GodHMNusC7rm1+e4VNX/bjgCGnrG8PjOp9zLXsw==
X-Received: by 2002:a05:620a:17aa:b0:7b6:c3e2:45f9 with SMTP id af79cd13be357-7b8638b4bdamr490545885a.48.1734537186265;
        Wed, 18 Dec 2024 07:53:06 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c72fa9sm52123051cf.12.2024.12.18.07.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:53:05 -0800 (PST)
Date: Wed, 18 Dec 2024 10:53:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make_ruc2021@163.com>
Cc: gregkh@linuxfoundation.org, quic_ugoswami@quicinc.com,
	stanley_chang@realtek.com, christophe.jaillet@wanadoo.fr,
	oneukum@suse.com, javier.carrasco@wolfvision.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: fix reference leak in usb_new_device()
Message-ID: <b564bbbb-f931-45d2-8d74-206c250b77f2@rowland.harvard.edu>
References: <20241218071346.2973980-1-make_ruc2021@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218071346.2973980-1-make_ruc2021@163.com>

On Wed, Dec 18, 2024 at 03:13:46PM +0800, Ma Ke wrote:
> When device_add(&udev->dev) succeeds and a later call fails,
> usb_new_device() does not properly call device_del(). As comment of
> device_add() says, 'if device_add() succeeds, you should call
> device_del() when you want to get rid of it. If device_add() has not
> succeeded, use only put_device() to drop the reference count'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9f8b17e643fe ("USB: make usbdevices export their device nodes instead of using a separate class")
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
> Changes in v3:
> - modified the bug description according to the changes of the patch;
> - removed redundant put_device() in patch v2 as suggestions.
> Changes in v2:
> - modified the bug description to make it more clear;
> - added the missed part of the patch.
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hub.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 4b93c0bd1d4b..21ac9b464696 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2663,13 +2663,13 @@ int usb_new_device(struct usb_device *udev)
>  		err = sysfs_create_link(&udev->dev.kobj,
>  				&port_dev->dev.kobj, "port");
>  		if (err)
> -			goto fail;
> +			goto out_del_dev;
>  
>  		err = sysfs_create_link(&port_dev->dev.kobj,
>  				&udev->dev.kobj, "device");
>  		if (err) {
>  			sysfs_remove_link(&udev->dev.kobj, "port");
> -			goto fail;
> +			goto out_del_dev;
>  		}
>  
>  		if (!test_and_set_bit(port1, hub->child_usage_bits))
> @@ -2683,6 +2683,8 @@ int usb_new_device(struct usb_device *udev)
>  	pm_runtime_put_sync_autosuspend(&udev->dev);
>  	return err;
>  
> +out_del_dev:
> +	device_del(&udev->dev);
>  fail:
>  	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
>  	pm_runtime_disable(&udev->dev);
> -- 
> 2.25.1
> 

