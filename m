Return-Path: <linux-usb+bounces-14734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD996E313
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 21:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16ED31F274F3
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 19:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B72618BC15;
	Thu,  5 Sep 2024 19:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R6HlLGAu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959D0158DC0
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564199; cv=none; b=CFfXEI1jHdLVnMnLKIocKf76gSt4KTOLBippIeC07y6Hon7dfCJ4U2Qrw3zJ3LWZCRi1xqalJ32BaGnaeP5v/uvBrOuzH95AEn+y4aadxqZDzn9D9j1teuYJfO+5JfPRrNDh09YeDzB8Pkxs2tiw/1wgmL1sJ13NRhLn2haeBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564199; c=relaxed/simple;
	bh=+zZPMUtY3Tl+cL59e5mBWSHG/ACJuB6OBQYodjEDwZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fqqlp9EiYXK08WnoYonZBQhi9niMEPYDN/LO9n7IDQasaAaZuUzlVCIwhQZ6iBA3vy4OjGO+TEkZgfqvX6EL3DmbaJNCBA7HAvIzL/IXYpoa5zgj6FqBLH8EMlanQ2SYS8yHXqLG7bXSmUgCk/C2LOawSmtX4eBuI/itwbEiW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R6HlLGAu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7177e6cd298so1071169b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2024 12:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725564198; x=1726168998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLevAQWbxyXgS/fGA92mwwhHAvu89geE60IJhFyppX0=;
        b=R6HlLGAuG7PmaFn9Anmxj7YMsIn29UogkYJZDejMfRa8eUAfd09/8Rz5tHKIYsdVk9
         WS6nun8y4AaX/UCsfMJ/QURHJubOGHixBbvGpbOvTahvCF0rym29OV+8hJEPNeoNCY7+
         Xn80Ow6pdcQ1F6VtR/Fd+zAJjKYLaPCxE+X3cOWPxOJA9gYls/+TyuwSCFfMe7rMRHf5
         kuRgYGtsy8DcpI5qNTVkYxAsn7NoRA4kllzEfAXtkU3iXOuZpjU7FhpwNm2mT4/+yDD9
         PBz+rT1w7EUjldlLyZ23ybWMVUc3R+s/oagUdvvWUBPxfjZY8aVuR3qElmswwgKiuqnT
         jQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725564198; x=1726168998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLevAQWbxyXgS/fGA92mwwhHAvu89geE60IJhFyppX0=;
        b=YOpSCK/w6Kt/cYBpA7BTAgdXEnQHg9QkMzeJUtn1jnlqVGxRoD5e89cEnt2JtW+zS8
         9umHIM39Xl+Wd3laxayKSrZvmdgXZO15lhYK6nAchin/5LEAcSMpDujpOg5XN/l065I8
         WnHoMJJMCxDYZXV6RO3JCgLGWMp1XHOky2XX9XikMaoP/MhdFv9yVdUYVgkG53srr9FJ
         8nDSi0X4oq6abnESv2aNeaSElTkNEXhHoXK8KLxKI6e7AQeQMYmX48fUh8D+/oq2XjXi
         Rz9HFAYfLbds8io0WAD31tHu5umIXQyLwzgj0KjGWgqou9xB0hv+UQOY4d/d/r9+j/iy
         J/SA==
X-Forwarded-Encrypted: i=1; AJvYcCVttQ1cyxpx7WFjnqPJueceijKJOKrGN7KxgzYMoc7Gv4G+xhZPTSQVB4hjhCZ3mPf3a7nfz1eATxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7aOXAIh2Eb66nEMEzMDU+z7Iuhsvu1oT3KiV93BJuohOcNzM1
	KfGYN0MIivVk1NlNCOAVO9qxQcM3yH38GHmprBwcoG+VIzBD/30BOUfpwWVNfw==
X-Google-Smtp-Source: AGHT+IFOUkFuXl3mvYSURdQQpnrk4qh5zKI0mUYPb3hun8UXmkY9fvB1QYG3r897c7MlBg+rFha62A==
X-Received: by 2002:a05:6a00:6f41:b0:714:2014:d783 with SMTP id d2e1a72fcca58-718d5df1dc6mr243684b3a.2.1725564197439;
        Thu, 05 Sep 2024 12:23:17 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:e8de:a18a:1040:ca3b? ([2a00:79e0:2e14:7:e8de:a18a:1040:ca3b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e4asm3561394b3a.39.2024.09.05.12.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 12:23:17 -0700 (PDT)
Message-ID: <78b53425-6ab2-4c53-bbc6-dfc6453cbe83@google.com>
Date: Thu, 5 Sep 2024 12:23:15 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: roles: Fix a false positive recursive locking
 complaint
To: Bart Van Assche <bvanassche@acm.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, stable@vger.kernel.org
References: <20240904201839.2901330-1-bvanassche@acm.org>
 <CAPTae5+gX8TW2xtN2-7yDt3C-2AmMB=jSwKsRtqPxftOf-A9hQ@mail.gmail.com>
 <8feac105-fa35-4c35-bbac-5d0265761c2d@acm.org>
 <d50e3406-1379-4eff-a8c1-9cae89659e3b@google.com>
 <bcfc0db2-d183-4e7b-b9fd-50d370cc0e9b@acm.org>
 <CAHp75VeA6N_jmkz0-asjogYx4ig8Q=zxnNM7C4m5FV94pH-nCg@mail.gmail.com>
 <CAHp75Ve4qfvBDgDHnjDbRW5buXnhGSp1aOQ6avOLGYnBY8UggQ@mail.gmail.com>
 <b439473b-a312-436a-9a3c-05d3eab3e1e3@acm.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <b439473b-a312-436a-9a3c-05d3eab3e1e3@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/5/24 11:22 AM, Bart Van Assche wrote:
> On 9/5/24 11:14 AM, Andy Shevchenko wrote:
>> To be clear, something like
>>
>> #define mutex_init_with_lockdep(...)
>> do {
>>    ...
>>    __mutex_init();
>> } while (0)
>>
>> in the mutex.h.
>
> How about using the name "mutex_init_with_key()" since the name
> "lockdep" refers to the lock dependency infrastructure and the
> additional argument will have type struct lock_class_key *?
>
> Amit, do you want me to add your Signed-off-by to my patch since
> your patch was posted first on the linux-usb mailing list?
>
Yes, thank you :) .

Also, thanks for the clarification on my previous questions Bart and for 
your suggestions Andy!

-

Amit

> Thanks,
>
> Bart.
>

