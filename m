Return-Path: <linux-usb+bounces-19616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F48A18DE5
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 09:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F8CB3A9167
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEE32045BC;
	Wed, 22 Jan 2025 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P52U263b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDEF4EB38;
	Wed, 22 Jan 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737536202; cv=none; b=nhM1scXAV86eSD5jPmgx9+xJx5/R29cvy16iqc3iEuDwwdm1yGsPkf1t/3vyEYMj8TqzARbojXj5zpI0YOhi3NPpIspwofl+xxRyyPMIUmUISaPxMufyct0ct9j3tXGF7oMmXUILD2s4kuqJTTIkHXwlY530ESjzBPM7+l6DNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737536202; c=relaxed/simple;
	bh=P81qJi3nOs54QsyxuRF/AIqKhVYvY2aGOZa2LhTo62A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFx4QKa72Ft66X04xNS5ZYFMaL0pJubAnQSZ0uIonoDhfEUI3u+VFlbWwqWKH0b+ysbk8ZxEQquoeS8rsn1gqJ0xh75Q3uu4//22tbbOMo9ASDrSinWJ38oVGV31Utvucg84ZtYsET4+z+F9rsgpWeXRQfP9wBRt0jHzlDWYVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P52U263b; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613802a59so71322061fa.0;
        Wed, 22 Jan 2025 00:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737536199; x=1738140999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iV8OuEgT+WMxY9JLutVTmKlvwRVwnmpQtHyR4hHfJRE=;
        b=P52U263bHSOrsirLb3fEJATHMdjsYeJcAWCiGG1Yiv/fuJaLhrFvRDuT7h1yPqhVVv
         0oXWhKgPEm3dH25v+C8sQrgZnyQ11mjdF2jMAWOlFWD5frgL18ama03DwnPuuIEEle4C
         2hy9lGWjYF/+M7sHFcQGyxQ8PXoZJTh+BK2LxYvuUB8Qvl+FNt3cfc9MdHN4UK29sBc+
         2/Fck84Kn1JJtGkiMWaQszLewKa+htU2bI9dmTYk6Q/zt3sFjG3S8AwRtI0zKYxKWCQ7
         wDROzk42Cl2KYExZ//VRtElZIDvqxureoeRAYOYDVp5+YYhdYE4FespTkRL1cTZ7SeWZ
         zCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737536199; x=1738140999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iV8OuEgT+WMxY9JLutVTmKlvwRVwnmpQtHyR4hHfJRE=;
        b=jRfUfuKFFZzOWruAeXl3osIylItC+lo67079tfTb/0f6PZDl9asmP7EwMEc/KKqwqC
         PdrPSoW98nf1OUOM7fcfjwmf6TivMillf32MJQ/PeLU5TJ5hKirFwnQi2uUw0/tvGk5b
         5YyIrNp7xxcZ9PqtEiQW60JHRBgJKlskfOHUoM3TwV5tWvuU9HYwbMg6yTxtla5H4YJF
         ddoyCTkC4M/65069dMiVFImH6rqYy1m9NkjcIpltko0JtGSHhnfUje55/EqqW9B2YB2h
         Y33+RLCZ5HAaErjML4a/UKbOoX4LRGyv/cjuIr5FEpVUzPAaav5fh6N7lvwjRxms2kRx
         ODZg==
X-Forwarded-Encrypted: i=1; AJvYcCXFuWWIDU3u1LJVHkHfH2malC3OtK6uc7J/tgo8Xuf4jk0/z0ChlH9RUngCtKPXwVf9jarY+0AWi/EO4mc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc732ufeSJTySppp/moUf0MjuG7ChoB4jIWkYGqAf6ixZLl4JH
	k/z0suWmQDXC9nMMEVNVldfWhYpYaShJttCG2bs5zymOOD2EjM16
X-Gm-Gg: ASbGncu/omHKqtEEggF4JZUt6vne5L99Xk3xmjUfCoQBRMfuCU4JEKXeGip4XvP6f4u
	YJ4r5aDdjmFkSTwDwxggV4s3/jtRH8KNlfy6Sh7rnv6MvlgGS9bDIB1m3SR2WP8NnWEum7Dv27Q
	10b8BO18eX7WcU02DicM7lfy27S/K5GgTEFYZOeOGydPbM/bQJv9VBtu397SAlFyktNnWXZi6Yf
	1RJV5q1iSKAuvialsBbMrFl3Fp9Qdwi7/nE2qTLP8YJHomaBM+nCf4D5wth6hCTg5qY2+iRlWdj
	qaPArVNQRYs4sMjuPC6eUS5tW4jL/nFxP32LloQHLSP+sxoj
X-Google-Smtp-Source: AGHT+IHM+59u3MI6H6i6Vx4CGvbek2e5udkd459EwhnFGaLr4Wo0hRsnnQDEuZNzZmw96gY8/KeVKQ==
X-Received: by 2002:a2e:b8cc:0:b0:306:10d6:28b0 with SMTP id 38308e7fff4ca-3072ca5b4b0mr78369061fa.1.1737536198439;
        Wed, 22 Jan 2025 00:56:38 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:405:67f2:74ed:74c8:ae37:23f6? ([2a00:1fa0:405:67f2:74ed:74c8:ae37:23f6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a502a93sm24868411fa.97.2025.01.22.00.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 00:56:37 -0800 (PST)
Message-ID: <352b31e8-f8ef-4207-81a7-0aa22c984aeb@gmail.com>
Date: Wed, 22 Jan 2025 11:56:34 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: usbip: fix null-ptr-deref in status_show_vhci()
To: Qasim Ijaz <qasdev00@gmail.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
References: <20250121203648.23775-1-qasdev00@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250121203648.23775-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/21/25 11:36 PM, Qasim Ijaz wrote:

> If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
> the error path calls usb_remove_hcd() and also sets 
> pdev->dev.driver_data to NULL.
> 
> Consequently, any subsequent call to platform_get_drvdata(pdev) 
> (which returns pdev->dev.driver_data) may yield NULL, causing a 
> crash if that pointer is dereferenced.
> 
> Fix this by adding a sanity check to ensure "hcd" is non-NULL
> before proceeding with further operations.
> 
> Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
> Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/usb/usbip/vhci_sysfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index d5865460e82d..a5e6c3c4af06 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -76,6 +76,10 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
>  	}
>  
>  	hcd = platform_get_drvdata(pdev);
> +

   Empty line net really needed here...

> +	if (!hcd)
> +		return 0;
> +
>  	vhci_hcd = hcd_to_vhci_hcd(hcd);
>  	vhci = vhci_hcd->vhci;
>  

MBR, Sergey


