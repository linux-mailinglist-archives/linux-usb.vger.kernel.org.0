Return-Path: <linux-usb+bounces-19141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4AEA05D14
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 14:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176BD188925C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A061FC7CC;
	Wed,  8 Jan 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T62zb7Aj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C804F1F9F7D
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343807; cv=none; b=eTxkyiA7uDOspkM9nKp+wpAZyXOy4Y+RC/jL1Y125ZSkcMnwdPwAzspSJkE3oGJ3O8arBPjMT6mGE3873rJSfN/tn7CyngSGg7K9f0n4Li7SKoL8SwEBBfJc8JQrf6ClXdUVAaJGh8R0gVdK4fWqKMb1y9CtLQwFPxb1QqDc/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343807; c=relaxed/simple;
	bh=kgXxP1QrU1AjOrI5tlY/+49Nr88nR+wVckEqKQR9gls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZotGKI1g1IMgCmbTqF/cYIcBqOxLfQTVgU33eMHh19jEvqrpe93YK378JuP5vl4MXojcWiK53cbEoZhpSMcdmz5keHcpw4laKFDwsNWC+ew4rn9UTaiWA+S27SwwStnix73Zzd1u1RCVssfCdn8PKpzAP9DgPvMO1ebMHqtKfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T62zb7Aj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43622267b2eso174548995e9.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736343803; x=1736948603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gN5XK9870DhIvwywth0rnSdBwrd+Q14VR5tmQVm9xDE=;
        b=T62zb7AjbovfON6GVlIKEABmPKRM3nMPJd4+OY2lEQRDJza7nodg6zYcf4t2qQcEyY
         hwudYikMOyR640jYDAxHpnipnzZ+0A8wUNaElEOzcKnFLXWxKFVMfk3JQWS/EPyNNPf9
         HoMHil3FSud5h1L2Rc5PINJbxWVPzBl/uM3ri9G2Qybu9/ibu2PGqS+FIw+1YaPK9moG
         W8i28dlWL3qXYNtBGx+6JXhqt7rfjDsFo9I2Qs+V38+axNFqR3sm0Rv47FDhFX11Yarh
         AiKKXHk62Indyzpz0+iQiViMyjiY5zYl/3BmirnWS9750Yu+nA1RS+A4uON0sqNDjVGX
         USxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343803; x=1736948603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN5XK9870DhIvwywth0rnSdBwrd+Q14VR5tmQVm9xDE=;
        b=LzXvAB8i4GTlZlk975ilpybG1lme/e/fyo5Kmr0y9IkOCnktQwCkd7Ow5nVVQMEZhZ
         tSJD1u8zUihvptteZGX4aVohMPlwYhOuPxvh0xopo8wseLtwYsD+pI47781YCT3DhhFD
         cpgyZaPAQUuK7KuTxtxPB9mMcQcZ0Ji+MEotHgPRPC1WTUvqumj7poRdB2wlhoF/0xlS
         06a13dh96oz3vx4pAAByTPDC9n1T/oyjvPDvT4+lyY1GYs+JnzpIKF7diCDjHfkrXkM7
         FM6sSrgtWrLz23IXaaps/z2QB2fNcnk75dmOj+TvK/XbSlNZ4Mq7LdI++eJxH0Yz2fRb
         vDqw==
X-Gm-Message-State: AOJu0YyKqNkyeqiLTOJ4pVx8AzXm0LAPnYYw/XIuo2cffo80XNAj/Tap
	siN8HNB6qstAHNZ/5dntApd+BpzZ8yIdGaiRVStFHnaENcoMtNqdtirypMsrGBw=
X-Gm-Gg: ASbGncteCVpdqUggW0zyFVxDrZo5lWuk+cMbeZI/wyYl1Xuwjb42XyVrUWyzbYJ/WfZ
	E+2e404yiIJWwnM5gaHZaWhbivMZ5BitO+JCT0ZUMkkxv398sN3Nj4ckc2hVpsb4BjuU8rLAqmB
	vWQVCP3rAdVnZbx2Jk0juGjX8KhFzE/LVaXFT21YbGnBoRfsbdrDm3ZTwhbFxzHFwhd312Yllr1
	1vBbr2whQgPOh82ZWt1vNnGCSs2ydYgI9/GUEm1EDmmBS3jri/fAlvyzw2W6AMJ9Lvhl9a2CfO2
	e5TCn8Y3h0k2nBZZe2r8
X-Google-Smtp-Source: AGHT+IEOi4XeZ+LRq+zk9mMU0DGV/A0NyVqgG8IUMXv8unt+n2mh8ruTO9wXtEdqK4JG2vkm+RitOg==
X-Received: by 2002:a05:6000:4a11:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-38a873305bemr2104398f8f.39.1736343802991;
        Wed, 08 Jan 2025 05:43:22 -0800 (PST)
Received: from ?IPV6:2001:a61:131f:bb01:288b:89dc:40f:14a9? ([2001:a61:131f:bb01:288b:89dc:40f:14a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89de4sm21107515e9.34.2025.01.08.05.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 05:43:22 -0800 (PST)
Message-ID: <8383131e-18f1-4d18-9bb4-4288db6872c4@suse.com>
Date: Wed, 8 Jan 2025 14:43:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding 5adc1cc038f4 ("usb: xhci: address off-by-one
 in xhci_num_trbs_free()")
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>,
 Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
References: <cdf7cc9d-48a9-4b00-8e6e-ddbfdbbdb47d@suse.com>
 <7245189f-87bc-424a-bac0-0ef4ba154e7b@linux.intel.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <7245189f-87bc-424a-bac0-0ef4ba154e7b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08.01.25 14:28, Neronin, Niklas wrote:
> 
> 
> On 08/01/2025 13.17, Oliver Neukum wrote:
>> Hi,
>>
>> I was wondering whether this patch should go
>> into the stable tree. As far as I can see the issue
>> it fixes is old. What do you think?
>>
>>      Regards
>>          Oliver
>>
>>
> 
> Hi Oliver,
> 
> My patch does not change any functionality. The extra loop was never
> executed, and the function's return value remains unchanged [1].
> I addressed this issue primarily for the benefit of developers.
> While the function is straightforward, the extra loop is not.
> Identifying its redundancy wastes time.

Hi,

thank you. I admit, I overlooked the 'if' statement.

	Thank you
		Oliver


