Return-Path: <linux-usb+bounces-9276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2118A19DC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 18:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444FA289266
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCD617AD66;
	Thu, 11 Apr 2024 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B4tYEgXR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465DD1BAA83
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849838; cv=none; b=ZV3ITK9CnZisb+6NT9XoF8S3UYrQkwHziRfhzrmZw0OYDeLtWuwIKUpWSrseAxg6/BLjq1qXwQJ+IU82utv3Kl10hSWLLdRvaafJNomJMBk2uMNDT7Otv/Q4S+JE7FuJMl9y/IVurs+Boo5pF0TKqdHqaeEVOkGkgQPVfjKfHWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849838; c=relaxed/simple;
	bh=lyVryDpeRjIWhmMwhVkA44A6fLf5ocFCTc8/3TArGjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJq11aZVQGkVhwdxu3+1KP7FZEmV91sEcWqzv97jQBGPvH+ksFCm/M5BLXIOetDBdIi20NPMs4lE4DNT18V9YFcY/HxJjpl3pM8CopfoYc7ur1MP6TpHAZ+ujFy1xzIXfs1oG1wydJOy8+fu0y8oRi3B0GrtifDQdlIcf37KxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B4tYEgXR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5171a529224so5534412e87.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712849834; x=1713454634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmorzkCOGwY7AcP/p6fqbbuMyTVKf8+4+iZfJd5eQBc=;
        b=B4tYEgXRJZTmH2WW33My8zFLmXGjhEBdRD7rEghOEG5vPpqDmOdcqf4VL2PZ99RZtJ
         deFmwQ7BpngB11+XSWwtPQEpw8/YvpSWwRntZQxfACGo9pAw4cRzu58hEzvbjlKIfj61
         b+H7YiKJsrWuNL7wUGxmedvR0UXxXXdK4olTwflqpi4ZTNlM8GguoYk1qrzawyGrJ9DZ
         lW3hxQ1AOpRp6e+EPA7CD4HYgBcXC71KOw205ig22XsO99BqrOyTpEY/QgH756NQkaK/
         2JVTdYEPi1BVoHb8fM6ToGhq5St5YSK5QMKKqquyDrYsfZf71RH/f3/BkzCjJAcs3pMo
         ObdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712849834; x=1713454634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmorzkCOGwY7AcP/p6fqbbuMyTVKf8+4+iZfJd5eQBc=;
        b=fjv/ht+nu2+TQy8bULGtuZRW29fxJvK9uGZL+X5+tnKofh3DONbqPrqjXjOuqtfA4B
         hzjhUpk7OcoDcBnHaH2O0C0DZeqHG/po636uHnMb4yTqB9UIdopEIJ4G8Z7WAw2U1sbl
         A5AvwC3ts65EhvDfg2TrCZFNaFuT7nUF4hsim9QTwt36BcXXuNEHIc9ZTiCfvlx1q94M
         uXiZmNTHdYcjCR4siTzC9+0WCFEHuEXrQFS9U5PI22qs8k59/y59npHyxXJDtB4bvXWh
         QmidCDNGvowo5+7523eFqTze46Dv612s23lz3mNShxf6+T7jGzqUcHZU4CknMJZ+GZjz
         oBUQ==
X-Gm-Message-State: AOJu0YxOXUOEhhlKf999hD2wwyTzwyooAPFD8wJYCeIjdk3NqhHI6Hxn
	UL1y4vY+RJiKP2N+INdNXO69vHwa+bZa9HDmgQbzgddQEI63oKOQkqubWZgI26HLrF5xNJPx47U
	4
X-Google-Smtp-Source: AGHT+IEbE3ti2OZQW8w5tAiJ/IUWgtMSUNUrvbqUoylF6dyBJxPQZxC9z2itPBkxbtQAzFo+3U9XhQ==
X-Received: by 2002:ac2:518c:0:b0:516:d09b:cbd6 with SMTP id u12-20020ac2518c000000b00516d09bcbd6mr65716lfi.15.1712849834342;
        Thu, 11 Apr 2024 08:37:14 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c1c9700b0041469869d11sm5824835wms.47.2024.04.11.08.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 08:37:14 -0700 (PDT)
Message-ID: <45c446c7-bd69-4202-8de4-d3305fe83cda@suse.com>
Date: Thu, 11 Apr 2024 17:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hardening the parser during enumerations
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20240411124722.17343-1-oneukum@suse.com>
 <2024041116-unicorn-washbasin-ba17@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2024041116-unicorn-washbasin-ba17@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.24 16:09, Greg KH wrote:

> Right now, we barely trust USB descriptors, if we wish to change this
> threat-model, that's great, but I think a lot of work is still to be
> done as you prove here.

Indeed. As this is fiddly and holes are easy to overlook,
anything I've missed?

	Regards
		Oliver


