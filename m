Return-Path: <linux-usb+bounces-22328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5CA763B5
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 11:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21698188AA21
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8959F1DEFD2;
	Mon, 31 Mar 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FzZtfixn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001951DED47
	for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415179; cv=none; b=A5QxVVEb5bgkKBvdno8oCX3HK2nhqxjvFin5BIwcXe6msRbIA5Vy5tiGCJ7/+dSXKya82ExbdjNgyqYZnGrookEV4tGU+ut2VlcKyzzmX2qJpyACcQPydY/oroHdBObeaoVLQRMvlCsBnlruKQW7eK8mAx+uzBrr0glia4GUp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415179; c=relaxed/simple;
	bh=/PqcCCPTIgpg/pzD+xJ4tI1xUacqMMtg+YshUz+CqAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Sw3l8akv9bwOgen5eW+gimZ51rOKgYWrREn3nIwHUJER9B9l+Z6WWyVy/pVPBaLujToqc9PHr+Yjjr00uEZLBSqn6xl13rfEJu8DeMc2uubg/FtnNDMGozRSzKXv71GLSUu5LtnNVSwIDG0Q1Ijiui9n1Osw/k7fxM0lqB9VFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FzZtfixn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac29fd22163so717548766b.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743415175; x=1744019975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMabzr509u5T4ZaFmjs8XZAaFywVFi/eFQF/j47VzkU=;
        b=FzZtfixn6tM7GCCSmlKginW83pwBeRfAWeMT3fAjnyUcJeiW1PYUWHNztIL4nKKHvS
         AtNTSl838ZxRGIpixCyoOzoDX09XRBC5KQezwnUOySYvFSjccO0SIL7Pm2D0lZUI1P9u
         v8JmW5wiq7Y5+QjUl5159H+X/t4uV4uGtG5YlxJsnwQk8fkzH2E7XR/wv7hoxT1SqXc8
         ZYpC82GTawwc4+/DFr8iyfRBpM+y9OljTi1E6bvHj9CQDAJJxCeaQGaSZP0yJges/hMQ
         2ksMN7L4vjigF9/YcPchtd2B3isp8PmPzP561naYK73y8kDaDakRHU1CsDyD0FvTP+oE
         1c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415175; x=1744019975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RMabzr509u5T4ZaFmjs8XZAaFywVFi/eFQF/j47VzkU=;
        b=NwNumiW1fRCuP0X6tU5/cMFWU+b0bKqATk5h4dQraoMYNkpZavIaMgvDUE6UY6st4l
         6wrjtYbIayBGm9eNnCzxHwKEbUDWXQph/51X3Lypnv/EnbXKKmQDbxinbZabUO1vm6RS
         1EKTXL3s69GbhwtzumeEmD+6T8bhJz3/YB4WUupTKxnEaRpO+TxROEivvAoug5CgCgqM
         TYThvURaFrydXwBIA3eK3l5npre07uqufwllZN18tJQMZuNbJIU0eSofwEgBAK0rXw8e
         lx42L+qmV/NMkunjWW0iroDMJCtWkyxjxnO9q26y97swVw2MaOFSyE2p50CvN56SheB4
         2UeA==
X-Forwarded-Encrypted: i=1; AJvYcCWsZVcmSlpU2TOkSWkFoZow9wYjhc+kf0ZLrnN77aoPnJhfPNu79CFfqTOTkGLhkMUbzN37WpR2IUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgGCrBmHFiEYNwJbWdHO+wfqFB1wE3VXMDgEMuqoIGy3rqh/M
	KvGuJGyHxzQ3nj4ffm8+HYgD0SHWOLplm2iiqdAXaCEw2FgpSW8soAS8m4694Ibct9zxfeRKYBu
	5
X-Gm-Gg: ASbGncvCGSoZBD2hv5gJJxVV/N8W6rw0vaPX1a/2CNcGJ789mO1UhPPyXmJkVSrMSGO
	SBQcU2YTdfRBF1aSDRm/OwoOs4qv8hL1FqxaKSx4BKndgbSVSJJ0MM9nJ9t54lhHo0TuzuaazjF
	kOBWJAuQ8I4gePmOi6pUxXQDmT7R8o0lAN5vk5+JrT3efHrU5Rn+Xb8Iy0ltVBJ0Xesj7IUfgmd
	NpwL+StMyNCk2JPQ0/CHZTC2EDPKDML55PJCs9xzMq5j2Bfx/rmGqMF9hN2YWEF73tChHakRL3z
	tVMRQPuXNXhGtONzkFt8bXiBbkieb8tk0ydAc22VaLzMxPi8mNuqxb7hJp12sVvDaHh+SYWvPzk
	w9xalUgYGnw==
X-Google-Smtp-Source: AGHT+IFIX8OXKB/VOA6THN/BL8YVUKH4ay9+edaVVtm0NkMm6yxizrzJj8pFXpXTR8Kr+uvHpF3WXw==
X-Received: by 2002:a17:907:1b10:b0:ac2:7a6d:c927 with SMTP id a640c23a62f3a-ac738c23ea2mr746705366b.50.1743415174944;
        Mon, 31 Mar 2025 02:59:34 -0700 (PDT)
Received: from ?IPV6:2a02:3033:271:b27:e778:d598:b1da:7ad7? ([2a02:3033:271:b27:e778:d598:b1da:7ad7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dc426sm592637566b.159.2025.03.31.02.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:59:34 -0700 (PDT)
Message-ID: <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
Date: Mon, 31 Mar 2025 11:59:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Robert Hodaszi <robert.hodaszi@digi.com>, Oliver Neukum
 <oneukum@suse.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(Adding Bjørn)

On 27.03.25 16:27, Robert Hodaszi wrote:
> On Thursday, 27.03.2025 at 14:24 +0100, Oliver Neukum <oneukum@suse.com> wrote:
>>
>> Why do you wish to react to this like an error?
>> It seems to me that we indeed need to wait for the device in this case.
>>
>>         Regards
>>                 Oliver
>>
> See my previous response to your patch. Because:
> 
>      1. we have to submit another read URB is resp_count != 0 (call service_outstanding_interrupt), otherwise receiving gets stuck

Now that you mention that I am not sure that the resp_count
logic in general is correct. I see no reason user space cannot
exhaust the buffer and get resp_count out of sync.

>      2. we should not set WDM_READ, to not confuse userspace

We agree on that.

>      3. we should not set res_length to 0, otherwise  we get stuck again (actually, should we clear the "if (!desc->reslength)" in wdm_read(), since that's is no longer possible anymore?

AFAICT it can happen if two threads are racing on wdm_read()

	Regards
		Oliver


