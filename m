Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4752C78A6E
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 13:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387693AbfG2L0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 07:26:08 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:52309 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387450AbfG2L0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jul 2019 07:26:07 -0400
Received: by mail-io1-f72.google.com with SMTP id p12so67193753iog.19
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2019 04:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=CiTsFwy01HY+45xZWkPRSyqJ30c3ZUdDwfNLV3u64lQ=;
        b=tkfyL29tlhptu7dXMePubXrjzAvKR0sqdsa1d1mZPa59HGUgVl+uaAQNXqSqtDmajV
         XXBIBTRdcB6aDRHNsmlz2r8wKTj7gH9iELf6qE3yATjw4gp+HRT2Uw0FACJ8xtDyg/07
         urjBIcFv4mfbO7+HrZx4oyrVlPBSj9i9NQfkKqyQkMN7c2/v7SjbZF2YXS8gWPPjTBse
         Ln3ObktCdwMNKu9INkIpCqGHN35qRQOLEN30enwETjCCd8vYJbnEivDUPYbse9vIy+HF
         2DNkI/MywzGhkdaEGWMv0FJFi3p791b9JgQ/1K3WvZ5tiAJefgYNMUp3oBDu2N4SJn79
         UccQ==
X-Gm-Message-State: APjAAAUO+i15Z/WhyCBbv8RFMq4BM6vh3C/gPvIMQ3jwKmTrowS1m3bc
        RYzfW3EaD59/A0hbHwNc4GDy0xcQ/hXN2PYifhZuytBw2oUu
X-Google-Smtp-Source: APXvYqwO0ePpVSbSPAM3YZRYg1LDnzHtT0mXbTayoB4XQ1/jhncoTw791M2ecgXMexBfnxEQMcp11YASrxIWfcVCHWUqTzs/m9gD
MIME-Version: 1.0
X-Received: by 2002:a5d:9c46:: with SMTP id 6mr43195713iof.6.1564399567073;
 Mon, 29 Jul 2019 04:26:07 -0700 (PDT)
Date:   Mon, 29 Jul 2019 04:26:07 -0700
In-Reply-To: <1564399552.25582.8.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007b7990058ed028d0@google.com>
Subject: Re: Re: WARNING in iguanair_probe/usb_submit_urb
From:   syzbot <syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Am Freitag, den 26.07.2019, 05:28 -0700 schrieb syzbot:
>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=164ab1f0600000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=01a77b82edaa374068e1
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>> syz repro:       
>> https://syzkaller.appspot.com/x/repro.syz?x=143d7978600000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134623f4600000

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com

> #syz test: https://github.com/google/kasan.git  
> usb-fuzzer-usb-testing-2019.07.11]

"usb-fuzzer-usb-testing-2019.07.11]" does not look like a valid git branch  
or commit.


>  From 0b0a7f7e980973e0c0d17f1dfe2bd7742492bfcc Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Mon, 29 Jul 2019 11:49:00 +0200
> Subject: [PATCH] iguanair: add sanity checks

> The driver needs to check the endpoint types, too, as opposed
> to the number of endpoints. This also requires moving the check earlier.

> Reported-by: syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/media/rc/iguanair.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

> diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
> index ea05e125016a..663083a6b399 100644
> --- a/drivers/media/rc/iguanair.c
> +++ b/drivers/media/rc/iguanair.c
> @@ -413,6 +413,10 @@ static int iguanair_probe(struct usb_interface *intf,
>   	int ret, pipein, pipeout;
>   	struct usb_host_interface *idesc;

> +	idesc = intf->altsetting;
> +	if (idesc->desc.bNumEndpoints < 2)
> +		return -ENODEV;
> +
>   	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
>   	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
>   	if (!ir || !rc) {
> @@ -427,18 +431,13 @@ static int iguanair_probe(struct usb_interface  
> *intf,
>   	ir->urb_in = usb_alloc_urb(0, GFP_KERNEL);
>   	ir->urb_out = usb_alloc_urb(0, GFP_KERNEL);

> -	if (!ir->buf_in || !ir->packet || !ir->urb_in || !ir->urb_out) {
> +	if (!ir->buf_in || !ir->packet || !ir->urb_in || !ir->urb_out ||
> +			!usb_endpoint_is_int_in(&idesc->endpoint[0].desc) ||
> +			!usb_endpoint_is_int_out(&idesc->endpoint[1].desc)) {
>   		ret = -ENOMEM;
>   		goto out;
>   	}

> -	idesc = intf->altsetting;
> -
> -	if (idesc->desc.bNumEndpoints < 2) {
> -		ret = -ENODEV;
> -		goto out;
> -	}
> -
>   	ir->rc = rc;
>   	ir->dev = &intf->dev;
>   	ir->udev = udev;
> --
> 2.16.4

