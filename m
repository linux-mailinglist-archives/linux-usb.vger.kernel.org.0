Return-Path: <linux-usb+bounces-29997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B70C2AD36
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 10:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07BD94F0BF8
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAD62F3602;
	Mon,  3 Nov 2025 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L5fbvBuu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7D19309C
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162913; cv=none; b=HxpLwT6eu/G9lAR4RUTUAS9QDUUZ+shRst9txUwhXACmnfXXA3Yh+Fflk47bss445ca3+tvt3j4KiM553XNL0mVIlYh8xf1JQnXxo8ioskCZSHFcfmQkhyOEyj/OSv+yXdx9g439yaZgtOlN0slrEhadoOZCjHHt1jsYMxbSVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162913; c=relaxed/simple;
	bh=aXJZtEP9MzAuBE72bhvix2W9bevYZ5Ri5o0a3J6FafU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfbG/96P9Nc1PWFada19XVrwOXI6M2QQf4LLOrnk0BCVVWfUVrNsU4gu+aSKxSNEDxqjmcMPZWqntJvr+QYbGoqxvUUm46OMBNyZpQVrlPVvVxKGJWWkkJggNpu7YflvY+VfSbIc2JE8NrgsQHDZc3lr5gfdSPtqMIikbQSwY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L5fbvBuu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so7028626a12.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762162907; x=1762767707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQ4p8extKYli1hpsb18sxQURINeyF5Ujv69r9EjqtSM=;
        b=L5fbvBuuYsWJnsh89kXTpRVZTh+PLokuFWNfs7/0+mtBW1LLO9yJbex1RKcvIjrf8q
         yFdzWW7gomoG07KS5KwlMg5qW0DY323HInapNEYNmPqx12MrW/2DxmlbOEDVqfWjvK3w
         1Fqp6SNs2OWJWwSwVJMFSC+gj7CCH8DnDhSeUz2sO7eSveMgRHR5yQ+OZqS8NYsOezKU
         qBWjen17GXNdKjVxzEn+wM6sciJ5OHK48LjIl3vKRKuWlUoglBCd/eEQneJfvF7v/3WY
         W7dEXrJtZdTY9R5oyL7qPt/2ijqm7eLWmQl33DfFv5ljgwpYfpn9Kg0nmBkLLlpuyWeY
         Xxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162907; x=1762767707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ4p8extKYli1hpsb18sxQURINeyF5Ujv69r9EjqtSM=;
        b=CysoCHn1SzaLwhfWl+dd4EiVycDpbLO8EHFgbhfbn5mRYUSqPZcVI1i73LRo6T7vTU
         gNC6Pa9wPG9MtFWe4JWotLPnZU6zVP6/WDF9n1f2SYZQ3gsnUPWlkRkWuqm8XGsZEE3f
         UTBmOsBBqKT14djqD/QZdaZEBAbzSDqo1IRVLlsnrDHNvRlirU0ENPx1Yqy5K9j3oQdB
         zRtsHFcbVxuxRvBD7gx9+o8u862kDgYj3rAqFXECqpRLEs8NalCZyfa+gdN2bFLdUYFx
         L2cAuHGoXowRMe+cUBGbd6/5Ek9g4je6IQzTfsNnaSNRCqtobD0wjWP6Y85WpLV0EH8g
         J+dA==
X-Forwarded-Encrypted: i=1; AJvYcCUo9Y46h0bUE0J9BnIsCq+UOjdL/z1DRWscBmUr99JAmmu80U/YVeBySVGH5obehQiZai0zZyaE3IE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoaEMb49ZpbDM3cCfwQ9Zl8eYC2vnpe8uC8ZMktdhOWP2yyl/w
	UNyB30ps9GNissEzgoMTBK8wHAo7x4QXUwteIwxNxkR5cGY1IMdnaSYxwvllpZ3rJBY=
X-Gm-Gg: ASbGnctjBfeBYF7GlV9i/fx5pwaVPLwb9hkLtDnxA+RHP58cl1OTzkHk+S8umCIYxOj
	Dea74ylPnHi1hOaHokzNJvaQaI2zfS6cE2DDpm5ZMaDtN54MO83Ls4u4ZQcdQYhbFRLNK1/X9S4
	oxVamhjpqJB52enuwkh6f4jXJ/JkENA2ehGPrhzSUT+efFTQdg7DTZK+66VLXH09dRFBO766Nur
	cPSam3NFNKeynKa4Y1GLC3nZlcZAp29ozTbpnWLKZphGflG+TUi+QjAcjz/cPuxDr0/5LzmuZNp
	A3HfUwFx9SnoilLuAcjEkmyukJU55OuYCfdaqTJHNsCWoreKD4rXZfYaTvZJ6HuHM7V0nQUFCZC
	toypKgW3X2k8WWalBcXIjfXL9YOqVWIdCRcynjgVgacaIGxq+2kJ9xSf3GjyKp6F69QgS/aYDMt
	ZtB/dPJJ9u/nrNk28ksoL3Qt6555g9D2xhutU5agwW26UC39O5dnDAxvg=
X-Google-Smtp-Source: AGHT+IH2gzj+vo7E8Ikz+oUAKkZsomKKLWkfIfLWgoIJFmJJqNapKWXnB39jlaelhJtTjBQ7ItLs8A==
X-Received: by 2002:a05:6402:1472:b0:63c:1d4a:afc4 with SMTP id 4fb4d7f45d1cf-6407704138emr9280289a12.4.1762162906723;
        Mon, 03 Nov 2025 01:41:46 -0800 (PST)
Received: from ?IPV6:2001:a61:13df:d801:cb2e:7d62:bafe:d300? ([2001:a61:13df:d801:cb2e:7d62:bafe:d300])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64098077b1asm6659522a12.7.2025.11.03.01.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:41:46 -0800 (PST)
Message-ID: <a3d9c04d-73fe-4624-abee-b06abda9fe97@suse.com>
Date: Mon, 3 Nov 2025 10:41:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb-storage] Re: [PATCH v2] usb: uas: fix urb unmapping issue
 when the uas device is remove during ongoing data transfer
To: Owen Gu <guhuinan@xiaomi.com>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, Yu Chen <chenyu45@xiaomi.com>,
 Michal Pecio <michal.pecio@gmail.com>
References: <20251015153157.11870-1-guhuinan@xiaomi.com>
 <aP8Llz04UH8Sbq5Q@oa-guhuinan-2.localdomain>
 <8de18ee2-ccdd-4cdd-ae49-48600ad30ed4@suse.com>
 <aQYRIgg2lyFhd7Lf@oa-guhuinan-2.localdomain>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <aQYRIgg2lyFhd7Lf@oa-guhuinan-2.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.11.25 14:55, 'Owen Gu' via USB Mass Storage on Linux wrote:
> On Mon, Oct 27, 2025 at 02:35:37PM +0100, Oliver Neukum wrote:

> I think the error handling only takes effect when uas_queuecommand_lck() calls
> uas_submit_urbs() and returns the error value -ENODEV . In this case, the device is
> disconnected, and the flow proceeds to uas_disconnect(), where uas_zap_pending() is
> invoked to call uas_try_complete().

OK, I see. You are right. Please resubmit and I'll ack it.

	Regards
		Oliver


