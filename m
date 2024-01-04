Return-Path: <linux-usb+bounces-4731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9682417E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 13:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922A01F2214A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 12:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0CB2137B;
	Thu,  4 Jan 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a0xhF0l3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C56221361
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d4a222818so8369995e9.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Jan 2024 04:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704370690; x=1704975490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxU6fLfvgeP4XXhw+FvcfNjtQkS0rCQXO0+fs6iE3Rk=;
        b=a0xhF0l386/3nUEh2YwmtA9J9QXKB41NAlD5e/41pLM3UgVz17vF/Xo6/eA2zp9Ydu
         kIfiuyNzC7CxkfSiD9kZeMDe14cnD0fz6BzoVx7TeGB9U9JJc46Mdu4lZwow+LevsQT8
         sSUi6UDmlAu2l59IIWez+FRgdPJBFvn9CzI4w0L1zWYGxTwJJvHXKnjfOxF7LTu55YqD
         p0mD7KjQRiU0hXmHmhnKJkvchULY6ToZZC+YFa7PFZ+DWOj15f9sMjaQnWDI3SoTv9FG
         Y5HD1z8+F8qT/ljKBNB7NWO00iS+k3oVb1H/X15Q0kFU4Jraqu1mgi2e3WduW5S0pmoU
         Fseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704370690; x=1704975490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxU6fLfvgeP4XXhw+FvcfNjtQkS0rCQXO0+fs6iE3Rk=;
        b=chXpOccTuNTWmkLvSjdQdc4eOV5dB7DJzf5gr1LJYU2Nr82S8XQ9vV5kUguMLKd+w6
         CGtYc2/nVOhcMifyEzV+0r4V2R8CrOwpq5HZmtUfa30u7zFnEB5c+MDb4zHvS53uTxWg
         pzsVKoG5E5qDUOJz61ixh5S96jkfiSEH0souVmpq9uYoT6lT8F1caSniOmnNOvKVgnti
         7k+F5eyQ5Gmc4rp8jepSfUyiFzTjZI92UIhYrlDq8O86TfMXY4V2Q1xzc73W3dObMtcV
         SaeTI8hlTRHeCU4G9H8jbgaSudZdnB5hKfh9SjgQ71M3CNF5xhpRYMxeLS6J4wuQ9kkq
         JRQg==
X-Gm-Message-State: AOJu0Yx4sC3d9szMseGbdwFICAw7gGNHnkrLq0+rHoYFYB5lPZ0q8pJe
	VuYMY7is6Q7CTunL5IWD7Hb/r+jL+zSghQ==
X-Google-Smtp-Source: AGHT+IEY8GWWs+L0oRvGtnWlB8meCmOsKZCKD2D5Gp9PUp6VQwJoKV9zEZxqTrFVqmeQepKUieZWNA==
X-Received: by 2002:a05:600c:4487:b0:40d:8f0c:db84 with SMTP id e7-20020a05600c448700b0040d8f0cdb84mr345374wmo.184.1704370690516;
        Thu, 04 Jan 2024 04:18:10 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:437e:aac3:dcf6:79ab? ([2001:a61:13af:fb01:437e:aac3:dcf6:79ab])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b0040d8810efc9sm5564822wmq.17.2024.01.04.04.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 04:18:10 -0800 (PST)
Message-ID: <c6706bc0-d9d4-42b2-a97a-eb95446d692e@suse.com>
Date: Thu, 4 Jan 2024 13:18:09 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] usb: r8152: interface driver before device driver
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
References: <20240104103811.2318-1-oneukum@suse.com>
 <87frzd9um6.fsf@miraculix.mork.no>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <87frzd9um6.fsf@miraculix.mork.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04.01.24 13:00, Bjørn Mork wrote:
> Oliver Neukum <oneukum@suse.com> writes:

> Why not
> 	return usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MODULE);
> ?

To be blunt, I did not want to edit more to get to a marginally shorter,
but inconsistent function.

	Regards
		Oliver


