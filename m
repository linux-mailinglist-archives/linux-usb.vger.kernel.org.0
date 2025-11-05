Return-Path: <linux-usb+bounces-30120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B37C381EA
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 22:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3569918C7BA9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 21:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7F42E2DD2;
	Wed,  5 Nov 2025 21:55:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505822D739F
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379738; cv=none; b=k8FUh8g/HHsxvYDjr9ORJPl8LEpadeAHoYhYinuFBGLwpquli+TYCwkewxqFtKSSEwicECbI05dFa8kNXbQZ2wnB85/D7PlZHB9N9h/zCQlVycCZNyudxS8FcxD9gqnrTQO0vK6cYp2PCuN/xXsv8AJIo2G4OhAD54dTc60qsj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379738; c=relaxed/simple;
	bh=o+upkX391+0VrLVDVlvNb0q7K6Y72v81B9HOBXgZB7M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=PVAhavlTqusFInvQo3dEY3vEq4qwp7tVguQcUBk/4wiw9zvIwL5707IX2RWH+bYVprMTdpQqYP+d1sBT63UkAebhy300lOEin+kNZAmQJ7zlxmgq2/Sy9KS8AeI8L3Cs13iKrjUTGSdPjUiJ0QmoEbMko3lzTBqyyyBUbpHtKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-4333035774fso3468175ab.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Nov 2025 13:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379736; x=1762984536;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwBf7ucm3+56iKVW7EZm+Ks9LT5jYkGcEHRVcLbxAI8=;
        b=B86b2m02or66AYJPXTurw5MZ6XC4Kbhkl9+AOlJqAwqUuw5BthZ21+U0Us65kXZ4/T
         tqBcqG+la3FLL3ans0zbomM9WDH8Z7qjG4+95PZZjtgUJZaUhLng9eQhmqQEeiWwtqgM
         OXZGQtueIx+aHLdlbICMI+xcOw/7B8+pL9nMtageoxinmGwRTxHprFvVubyLpfCeofmg
         blXiwj6hTXiMn4mGKVpmCJ20eh7ruPo/xhrrnqtq3G5adMW3cOZ5oht4J9blpo3iiX2C
         g7CENh9+I010QbwPj/f4D6hHQq+byeioHSm5i0/lAQMnaDXR4qLvH94CERSb4IIimiGu
         ImBw==
X-Forwarded-Encrypted: i=1; AJvYcCVPna97K7N7rMNp2W7zrwhFTrJq3OXsiFwzZNs1Wkf4BQ2M3HgY/HqcjAJaayArlKFiifw3hqjFU8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuIgdCEN0XZaTU4GLxXpVpVXzFrTRxPNyvrvZtsmIrCFSVQlG
	iKRtADIWASvtInYsZusNlKirA7B6PQ9N8Q/vMpi8i9lFdLqw6CSfLjGa8+UXTeowGPbnEU63eKh
	Wu8t+NpSClwpZrkRoammlfxB8kvZvgwuFchB+lBZ8qTDEBJu3hnMnVZYdUYU=
X-Google-Smtp-Source: AGHT+IErvgVX2lT1VTeExtwe7VxD3tNx5nEjEm+MYjbP3l+C8+JnOOqZC+bupe05ezRup0sS7ESz+GO2T0H8DuOhhyPQ9mBXn6Id
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b21:b0:433:2389:e0b1 with SMTP id
 e9e14a558f8ab-4334068a78emr65038635ab.0.1762379736577; Wed, 05 Nov 2025
 13:55:36 -0800 (PST)
Date: Wed, 05 Nov 2025 13:55:36 -0800
In-Reply-To: <a5ddc43a-5354-4951-8691-1f3887743e3d@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690bc7d8.050a0220.baf87.0073.GAE@google.com>
Subject: Re: [PATCH v2] usb: rtl8150: Initialize buffers to fix KMSAN
 uninit-value in rtl8150_open
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: jacob.e.keller@intel.com
Cc: davem@davemloft.net, dharanitharan725@gmail.com, edumazet@google.com, 
	gregkh@linuxfoundation.org, jacob.e.keller@intel.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

>
>
> On 11/5/2025 11:47 AM, Dharanitharan R wrote:
>> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
>> index f1a868f0032e..a7116d03c3d3 100644
>> --- a/drivers/net/usb/rtl8150.c
>> +++ b/drivers/net/usb/rtl8150.c
>> @@ -735,33 +735,30 @@ static int rtl8150_open(struct net_device *netdev)
>>  	rtl8150_t *dev = netdev_priv(netdev);
>>  	int res;
>>  
>> -	if (dev->rx_skb == NULL)
>> -		dev->rx_skb = pull_skb(dev);
>> -	if (!dev->rx_skb)
>> -		return -ENOMEM;
>> -
>
> None of the changes in the diff make any sense, as you remove the only
> place where rx_skb is initialized in the first place.
>
>>  	set_registers(dev, IDR, 6, netdev->dev_addr);
>>  
>>  	/* Fix: initialize memory before using it (KMSAN uninit-value) */
>>  	memset(dev->rx_skb->data, 0, RTL8150_MTU);
>>  	memset(dev->intr_buff, 0, INTBUFSIZE);
>>  
>
> This isn't even in the current driver code, but its shown as part of the
> diff context. Based on your commit description this is probably what
> you're trying to insert? But its obviously not a properly formatted or
> generated patch. It reeks of being generated by a bad LLM.
>
> Please don't waste reviewers time with this kind of generated nonsense.

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


