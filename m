Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9E5833D9
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731903AbfHFOWj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:22:39 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:55414 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbfHFOWi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 10:22:38 -0400
Received: by mail-ot1-f70.google.com with SMTP id p7so49460627otk.22
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 07:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=PfWPxoJNv7jYEQYH1igsVvAbHYTVjvG9o6NhTa2SlsE=;
        b=RsYzi/00YnxS+pvN7037CVpZZXsFJ+ibjAV0dJ3zElaTx9ZF8cKfGZK+MwLQ4xhluL
         7dCgvPHKeiz2EIHZcG2JA++OgfR5piBvZ3P8OOSFpEclDhqHu9yt0Ytyi9qNnJRVQvXp
         s9qqJ0jm5xpKLpCFmsKsJF0bvsyltU5wN99zlal+uyioivhxmPECN784vCNLAo0VRDqM
         JLqowKxGWgMCENhdep/1gebYT/AZgq42rTnnQgO8DddHZicNyfzEKuOkgcdUUcE9bO+N
         HOvzwjSkn1en0CgqWlCoYEJGw5D3xzt4jIyu3QwdqtedH1x1EH5csuGqd6PKQyE6u9rJ
         qgOw==
X-Gm-Message-State: APjAAAVY8DjuMqyq+kK7RfsDKBdCDvTFBzLn0iXQslxX8w3ZHzFb5vUq
        oTMjsqWnZf9XP9r/frkvFDBNWSvcb/IT+R5eyvdkC8YA9rWF
X-Google-Smtp-Source: APXvYqxsCHFRyT9xAwNOWbJE3nfEvhiHgt8amI5q1JfTcRNp4+PadLxVRVVpFR4dMRLKG08vpGt4/s56z88823u3f5FhoUWYaN9j
MIME-Version: 1.0
X-Received: by 2002:a5d:8890:: with SMTP id d16mr3723626ioo.274.1565101357255;
 Tue, 06 Aug 2019 07:22:37 -0700 (PDT)
Date:   Tue, 06 Aug 2019 07:22:37 -0700
In-Reply-To: <1565101353.8136.27.camel@suse.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006fd649058f738e01@google.com>
Subject: Re: Re: possible deadlock in usb_deregister_dev
From:   syzbot <syzbot+a64a382964bf6c71a9c0@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Am Montag, den 05.08.2019, 04:58 -0700 schrieb syzbot:
>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=13b5bc8a600000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=a64a382964bf6c71a9c0
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

>> Unfortunately, I don't have any reproducer for this crash yet.

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+a64a382964bf6c71a9c0@syzkaller.appspotmail.com

> #syz test: https://github.com/google/kasan.git e96407b4

This crash does not have a reproducer. I cannot test it.


>  From 973e82b3f583113e4d7fe5cd2f918a16022c4e38 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 6 Aug 2019 16:17:54 +0200
> Subject: [PATCH] usb: iowarrior: fix deadlock on disconnect

> We have to drop the mutex before we close() upon disconnect()
> as close() needs the lock. This is safe to do by dropping the
> mutex as intfdata is already set to NULL, so open() will fail.

> Fixes: 03f36e885fc26 ("USB: open disconnect race in iowarrior")
> Reported-by: syzbot+a64a382964bf6c71a9c0@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/misc/iowarrior.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

> diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
> index ba05dd80a020..f5bed9f29e56 100644
> --- a/drivers/usb/misc/iowarrior.c
> +++ b/drivers/usb/misc/iowarrior.c
> @@ -866,19 +866,20 @@ static void iowarrior_disconnect(struct  
> usb_interface *interface)
>   	dev = usb_get_intfdata(interface);
>   	mutex_lock(&iowarrior_open_disc_lock);
>   	usb_set_intfdata(interface, NULL);
> +	/* prevent device read, write and ioctl */
> +	dev->present = 0;

>   	minor = dev->minor;
> +	mutex_unlock(&iowarrior_open_disc_lock);
> +	/* give back our minor - this will call close() locks need to be  
> dropped at this point*/

> -	/* give back our minor */
>   	usb_deregister_dev(interface, &iowarrior_class);

>   	mutex_lock(&dev->mutex);

>   	/* prevent device read, write and ioctl */
> -	dev->present = 0;

>   	mutex_unlock(&dev->mutex);
> -	mutex_unlock(&iowarrior_open_disc_lock);

>   	if (dev->opened) {
>   		/* There is a process that holds a filedescriptor to the device ,
> --
> 2.16.4

