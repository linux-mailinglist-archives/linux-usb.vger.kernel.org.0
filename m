Return-Path: <linux-usb+bounces-30058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC507C3272A
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 18:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C9C189DB80
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 17:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC30337B8A;
	Tue,  4 Nov 2025 17:52:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9D335566
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762278772; cv=none; b=EH8KRPvzd3ZuBa9BvAx3JUfJZSCfoDsoIUFCj59hTgJdGAK5Bgl0J09bhJc67uIFIJRaFzawGXNZLtmkJLgKXl6WY6a+5wZz8+pVTdrLGgfVjzw4STR92foL6t6Uzdayni+53TrAG3DHwM6LLWFvIssWzJuF7KpODG+pwKZlymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762278772; c=relaxed/simple;
	bh=M3XGml+8+ve3rsexdBQyTjM3q8Kmjfd/ND3yvhWe8PQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=llEMiEec8CRj2g6gIxFOSRnjizT/Wi05iFmEgy+UF422rMBTMhsnbS0lDHQkxa6RRv7yAGZTl8RfXQWuElhVXiz5NP5ekgZkpDdbgpIDtSrNWqUC+oYaS+5sVDxRw15cgCCbMPznw5OXvThTKNpcIvKI074R4CfyNVdVPi7cUq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-43335646758so20442885ab.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 09:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762278765; x=1762883565;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpFOGuPutw7wJGPq0GSLdfYhbwZhDvMJew+wME/lNf4=;
        b=tOtBFBXbp0vdNTZgabhktkk7EB6htdNr6GWZ6JA28YhNUClcVL0tOGUzTPNWclRao8
         EYvTgydv720vj2S7Lq5hnJbbVxqLwj5g/Is3xFiyEbkuTeLd0kwqksDCpJuPcfSDDFZ3
         8mO49n+RGUNMVv2xRWo2AbmeMEgw1xlexybsLX84tQkBX3aSan58E+5qlq/QaF8wqM4M
         Mfj2oazZnn3feRuIDMs58VQwbh4C9ek5/LzGI4XJr+f1BwalJeATIw4GQouL8R0R/FMi
         TVMPQwKSDgRSzeAyoTkPGbJ2WBM3OuaHBt/Z0tQKYgHhpyWk3CPMoAP9y63qSqThec2n
         QcEA==
X-Forwarded-Encrypted: i=1; AJvYcCUsfH/hbcJhH7OduZcp9GrScUnCHuCGEmA1rjj8p1QN9UflNoRSZHDjUFz85ft18i1KMwfvp3MqWAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK23GsBX15a+oxze6ks7JzvIasKxtnf8bzgz7b1KlNfx2aPLGV
	dTumXTQNaeFP4RpMNK8fyYYyIPTrVJd3YcO69ouyS1pnbNIWdKIWe8SYOoaeOq1jNKjpnTKqkvB
	yq+dhyMwWO1GbM7UkOKkIXlYKweJDB8d48l/hCWvJH82ZTGYIE3dOYH60RCE=
X-Google-Smtp-Source: AGHT+IE9Eqckv8N6UfM90WIFhve0UGHfhbHNHJwnfe9KOIkGR0rD6N2S8bfcglrNLefFBnmMbgVzCt5LZHUs9GMf2vzxafAMk2sP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3303:b0:433:330a:a572 with SMTP id
 e9e14a558f8ab-433407b03camr2833605ab.13.1762278765743; Tue, 04 Nov 2025
 09:52:45 -0800 (PST)
Date: Tue, 04 Nov 2025 09:52:45 -0800
In-Reply-To: <ea06bbfb-d14b-4c61-8394-c536ca2a67ce@lunn.ch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690a3d6d.050a0220.98a6.00b6.GAE@google.com>
Subject: Re: [PATCH] [PATCH] usb: rtl8150: Initialize buffers to fix KMSAN
 uninit-value in rtl8150_open
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: andrew@lunn.ch
Cc: andrew@lunn.ch, davem@davemloft.net, dharanitharan725@gmail.com, 
	edumazet@google.com, gregkh@linuxfoundation.org, kuba@kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

> On Tue, Nov 04, 2025 at 04:27:16PM +0000, Dharanitharan R wrote:
>> KMSAN reported an uninitialized value use in rtl8150_open().
>> Initialize rx_skb->data and intr_buff before submitting URBs to
>> ensure memory is in a defined state.
>> 
>> Reported-by: syzbot+b4d5d8faea6996fd@syzkaller.appspotmail.com
>> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
>> ---
>>  drivers/net/usb/rtl8150.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
>> index 278e6cb6f4d9..f1a868f0032e 100644
>> --- a/drivers/net/usb/rtl8150.c
>> +++ b/drivers/net/usb/rtl8150.c
>> @@ -719,14 +719,15 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
>>  
>>  static void set_carrier(struct net_device *netdev)
>>  {
>> -	rtl8150_t *dev = netdev_priv(netdev);
>> -	short tmp;
>> +    rtl8150_t *dev = netdev_priv(netdev);
>> +    short tmp;
>
> You are messing up the whitespace here.
>
> Did you not read your own patch and notice this problem? checkpatch
> probably also complained.
>
>     Andrew
>
> ---
> pw-bot: cr

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


