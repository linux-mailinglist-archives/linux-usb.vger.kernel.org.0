Return-Path: <linux-usb+bounces-14670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31F96CA7A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 00:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF9E1C2202E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 22:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542841714B2;
	Wed,  4 Sep 2024 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SxmVPR3C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C311146D7F
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725489257; cv=none; b=irADEQU4+3ksgI7tQTBl3bdheiT7344K2qMSY4FHmgEM1ncSrFFRGclGNcF1SrAhVJsddA2Xpl7gIciM8EGyiCFZId2t86mugkMgOmgxzguK9OW5GoKDAkzA9cLHe5CCDkKcjTvRy03InKfbfDRjttX0ng9q/8IsWb7yHa4Z/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725489257; c=relaxed/simple;
	bh=Sx8Wgv1eQKylbuzJNMnYYybtbUUvUsPwOWYjEik+7Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mi4j5qd4pkGg8XgXfVrUQOGRJT+eLidvtt6ymelZlzUFQ7zUFNc1P1k/vXX5nfrjvyfeHqRnQN6DTJEmhLoP4kb7MjqXpk5ot+mFyCytqdWbWIkWYNhOJilHmLvJOi0Hk1EdrKqNwLog5Eb/g7OldR86hUML2YYT4DSXgTuNWwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SxmVPR3C; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7176212de5cso99372b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725489256; x=1726094056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0IMH0NZ+lHLaI+tIdMYlCgdYPhkZWscTLUdFIUgcAs=;
        b=SxmVPR3C7r9KQkcPvTIFCM40M0ljcyACWIP/dv0UXf0Lw5l4lSbR1XDosvcQhNaKX3
         EEMkaWkwWRVvhDpLSE9OXjTGYZD2YSPmfPeVEoRhBOgUEXJFDKlZl4uSZXZ401lXv9bU
         FMfhZfVnfvHSbdcziFMVGxI0taYrQsRYk8EB7gK0qxJvk18R/rDsot3ROFlFEesgUzUB
         bhmnE4juHybNLLOzy8XcJB4qo6EhduOU1TF4ZvhaHAmTc6kd3gBAU8tEc41+k9qszMvG
         l8RSn5Eu5YPI2gLWmJ/QYRJ6YvT2/KoF605KburRCj50qTZavv4CRjKcNdJOOKNhc0HO
         f0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725489256; x=1726094056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0IMH0NZ+lHLaI+tIdMYlCgdYPhkZWscTLUdFIUgcAs=;
        b=ZQp9uuv5DXXGVUDn+SAHQsX+h+JiAfsgy07aeqcNRckidyEDyf//CXkkmIm0Ix8VsQ
         priObwMRo8REsyitKDOMG8YRmWzU4U00BSrqynQYTmD4nvSIYJ+NEllUtsnejipLW7VI
         NycnDkW6TFZfBJaFaSMJb2cHUDx7i9Keiqvc+NY2g9SvsDzFkTY1882FSPFEVSpqV5ga
         JGlJHPeXMukP836bOkGfElUF8SkzVLR6QUxNcODiGWz30yzWgg6D9fXkcac6DVN45gfP
         wg00ywWPOEZMyb017IzeqV+bpC/Y9C2g14W2EbqUfkTyDI9Q54PUQzYu75Et8qLdXmh8
         mYDg==
X-Forwarded-Encrypted: i=1; AJvYcCXEi6AiHKDLsr+FL53OJmh3jUSh2sl4JN4hJzbRgT8OjfAan1KoMAm4rDlfQBhVbhS3ntCM8o6QGBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMQu03GK3B5XseMi2GhbCqU0xDm4rZr802AkeUu9REcssrA4Cv
	Igq1iD7hq0Ht7edhYl/ap4nVsBOFd9sOjBav9JF8Ip+I/7UVxml1s3+mAgIWEw==
X-Google-Smtp-Source: AGHT+IGJhoyZj5JvkXbJu62mR3+HZoLDUXHbyMA/FpFC11l0mskHUTqSkqBQkp26whTBx+iQ5QgRNA==
X-Received: by 2002:a05:6a00:2345:b0:714:2d05:60df with SMTP id d2e1a72fcca58-7173c30f3c6mr17522720b3a.15.1725489255313;
        Wed, 04 Sep 2024 15:34:15 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:e8de:a18a:1040:ca3b? ([2a00:79e0:2e14:7:e8de:a18a:1040:ca3b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8538dsm2151763a12.9.2024.09.04.15.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 15:34:14 -0700 (PDT)
Message-ID: <d50e3406-1379-4eff-a8c1-9cae89659e3b@google.com>
Date: Wed, 4 Sep 2024 15:34:12 -0700
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
 Badhri Jagan Sridharan <badhri@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, stable@vger.kernel.org
References: <20240904201839.2901330-1-bvanassche@acm.org>
 <CAPTae5+gX8TW2xtN2-7yDt3C-2AmMB=jSwKsRtqPxftOf-A9hQ@mail.gmail.com>
 <8feac105-fa35-4c35-bbac-5d0265761c2d@acm.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <8feac105-fa35-4c35-bbac-5d0265761c2d@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bart,

On 9/4/24 2:15 PM, Bart Van Assche wrote:
> On 9/4/24 2:00 PM, Badhri Jagan Sridharan wrote:
>> https://lore.kernel.org/all/ZsiYRAJST%2F2hAju1@kuha.fi.intel.com/ was
>> already accepted
>
> Thanks, I hadn't noticed this yet.
>
>> and is perhaps better than what you are suggesting as
>> it does not use the internal methods of mutex_init().
>
> Although I do not have a strong opinion about which patch is sent to
> Linus, I think my patch has multiple advantages compared to the patch
> mentioned above:
> - Cleaner. lockdep_set_class() is not used. Hence, it is not possible
>   that the wrong lockdep key is used (the one assigned by
>   mutex_init()).
> - The lock_class_key declaration occurs close to the sw->lock
>   declaration.
> - The lockdep_register_key() call occurs close to __mutex_init() call
>   that uses the registered key.
> - Needs less memory in debug kernels. The advantage of __mutex_init()
>   compared to mutex_init() is that it does not allocate (static) memory
>   for a lockdep key.
>
Thanks for the patch.

While I agree on (1) & (4), *may* be a good reason to reconsider.
However, I have seen almost 30+ instances of the prior
method 
(https://lore.kernel.org/all/20240822223717.253433-1-amitsd@google.com/)
of registering lockdep key, which is what I followed.
However, if that's is not the right way, it brings into question the purpose
of lockdep_set_class() considering I would always and unconditionally use
__mutex_init()  if I want to manage the lockdep class keys myself or
mutex_init() if I didn't.


Thanks,

Amit

> Thanks,
>
> Bart.
>

