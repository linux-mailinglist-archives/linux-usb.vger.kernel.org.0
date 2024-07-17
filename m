Return-Path: <linux-usb+bounces-12253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D78933F9F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 17:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5801F247AB
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 15:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBF4181BAF;
	Wed, 17 Jul 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FilpLUJD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809A381DE
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721230077; cv=none; b=d6KY/cYT4DN7DJqO/C/cutVVgT0m8w5YbCv1ulvuRYu/0WCiAaMZ3KqU3FVMRclYpmt3pvIVbxRK8sqzuXg22LJIai/4VBouXIKvR/Ar1SNbRsVko4c7smQEG9or/aaw3QVED1ylYj21Mn8oARmQFx0H8QpqdJmVWKj7QYTJpSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721230077; c=relaxed/simple;
	bh=BMVd5EygerWgxcwNiACcHRUwoSGN5IP8gVboswb88dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9zCue6Fag8DJn4kJ/rdBKY+PK3Vlkk9pStvGWeHtAety27wcD2XIQ+VO25qznUBtf9+uUl/H5L0fztagwyjvp+fvaVKoc2Sm/SFRd0pdNhN3NxC+o0HRUlP+vx07+G+FgrIuo3WR91nzlc7XWbYt4jilZNPb2ed1c1AhsBYj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FilpLUJD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36796a9b636so4115221f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721230074; x=1721834874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8cFYyUZS8xr14kCTKloTQM5D0VTca9E9b0xCK3JKxk=;
        b=FilpLUJDEEvpQs6pjVxhgSzSeiMxZ/lE5V7DaPoxWqxoIaeVqWx0Stk0i7muxQW4+I
         Y03kTnliM21rueH6FPmXKHhd28fdCIsWf4X2EaxCIXlm329tRvmkPY2LRLyrV1n8WdQr
         y/MVTlr++xiqTZDyIMUmD5j5IwnscN0bWcH/G8PQSc0Dun80XDQyfwlQe2H2S0eplmvU
         3DVAZ1ugmZfMrRXl6td5ELIklUn6iEIalopj5E8O1Dd3rpG8yoIZz1nPvXvMzvFalwjK
         enyyI0jz5qu0wql6yTHOjbzMfgte7TM8QQ69Bv2rxYCE6Tu8mzt0CZ60D9i+xSqllSco
         np3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230074; x=1721834874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8cFYyUZS8xr14kCTKloTQM5D0VTca9E9b0xCK3JKxk=;
        b=YcbtiKOBlIyo/labQ6k+oSo6naqB2mMSyUJSekuFa9mUlJLaTs17ypocZugSNaw9zm
         QMDvVHIHI4nbbK7wMUYnw0V/4HHxWNaC1SoKISk3p/pvIu4WrDAEn/kx/HfFWprSpTT7
         jQRCdkkK1VGCyEYCJ7bbJGUO7cJ0rqD62kMIym9iP/O7e1wBwBPdV0mRkWDhMERNnSoe
         jwKxjemZZEFvRat2S6RP69xZpCcQi5AaNQ7ZD/0g0ITtWy6r3QJrT367Db6qIGjOhVRy
         Dod34kKqG/Ad2NW1v1OGi6LOtH0xrlmUqo3QxbiYjyDpqfhzUHvv4k81u6XSb1CxbrK9
         SD0A==
X-Forwarded-Encrypted: i=1; AJvYcCW4DfLzqo0TrVnMyrlEv2E9l3L2A16vx+dizHuqC0yHoh3tSBfiRI0lL+60i/hIOiWO3ZCuSpmglqO07MDlBQnToESM43ZLErkH
X-Gm-Message-State: AOJu0Yz13w71hdqM0pwkz4OJkGHQMDmDEZCdI1b9uuYcAlN3Ub0zpJ7K
	ayP2IdLXzsu8v7Zm6qeEhPhBW9fc3f/RxhBHb6rg/fAZrejF7AmIcefpwGtyLlQ=
X-Google-Smtp-Source: AGHT+IFLV7FPBVXYc7SPe4aiAojhLD9zB6pPQU1onlaLad8j9XDdzLnntuq1Kblzp/lEy55WMZE29g==
X-Received: by 2002:a5d:4211:0:b0:366:ed80:d045 with SMTP id ffacd0b85a97d-3683171fe8fmr1384212f8f.47.1721230073518;
        Wed, 17 Jul 2024 08:27:53 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c77a8084sm2035035e9.19.2024.07.17.08.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:27:53 -0700 (PDT)
Message-ID: <dd3583a1-e66d-46e5-aba8-61ffb268f9a7@suse.com>
Date: Wed, 17 Jul 2024 17:27:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
To: Alan Stern <stern@rowland.harvard.edu>, Hongyu Xie <xy521521@gmail.com>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, brauner@kernel.org,
 jlayton@kernel.org, jack@suse.cz, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, xiehongyu1@kylinos.cn
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
 <2a80d11d-029f-4e7e-9a8e-3abae1034add@suse.com>
 <429eb27a-578a-4208-8ce1-89434b8d739f@rowland.harvard.edu>
 <3073c8ce-1923-4816-a442-41b4cc333af9@suse.com>
 <6419a4e9-e084-4eb6-8376-9202930ea8be@kylinos.cn>
 <ee0a5160-233a-485c-a34b-99d4a1e046c5@rowland.harvard.edu>
 <45b87923-d256-4c5e-8167-8ef764add1e9@kylinos.cn>
 <5413aa3b-92ba-4367-b720-2fa4161638b5@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <5413aa3b-92ba-4367-b720-2fa4161638b5@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.07.24 15:44, Alan Stern wrote:
> On Wed, Jul 17, 2024 at 11:13:39AM +0800, Hongyu Xie wrote:
>> From: Hongyu Xie <xiehongyu1@kylinos.cn>
>>
>>
>>
>> On 2024/7/17 10:05, Alan Stern wrote:

> 
> That's right, it should be possible to avoid rebinding.  But we can't do
> this until we have some way to tell the userspace driver that a reset
> has occurred.  Oliver's idea is to do this by returning a special error
> code for the next ioctl, and I can't think of anything better.

I wish you could, for this is supremely inelegant. In particular
it forces user space to reinit the device when it is needed, instead
of when it is idle.

Yet, I think conceptually the first ioctl absolutely must fail,
because the device state has been lost.

	Regards
		Oliver


