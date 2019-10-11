Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2DC9D3E21
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 13:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfJKLRk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 07:17:40 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:32892 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfJKLRk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 07:17:40 -0400
Received: by mail-io1-f71.google.com with SMTP id g15so14313767ioc.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 04:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=J6IpSUQHDWERoX2AnvSyjcwg1RqT2lsBVSYteeT19hs=;
        b=dtcpzD0lFuBWinReiTdmIM2qOxBzVLM09rxvoh53G8hT2ke+0Cgkk2cNkL2RTNhh8c
         BExilkkARhJ5F5hS+4coF65+jxkQcX75n3De5h6BNWXuWu39yuB9MhvSDo/HisoS69NE
         T1XyyKUyLwcDE+BDIwoy95Uk/RXDYqxzI7J9PZ6bNpQjHn0Z928CPLrcx9XDVdB4VeAa
         hUg2G8nS3W0hEq5dDR2zaS1Pq7Zq9SyGiN4eLk9PI9pZBDMB5GQLBAzQXjchtD9NHkuC
         U73iCKSOrNxzc6OFj6H5x1V6FTRSaNDlGy0bjCa/d1fDPtxmoa1hjNlCt9BYjpv36tc2
         pCsA==
X-Gm-Message-State: APjAAAWjyYPhTd7p6iLjPbDRMNs4woCEyUJDtu6xKRVsE4hZJtwWzNmO
        xn2X33EB2L9iFELcUJ1y+B9vXfCBMmxnTBMd1twmAwRWDOwK
X-Google-Smtp-Source: APXvYqwES4qEmYyyt71giBG7PfCAe90So4U07Z87aibJC0DoxHzB5GwTlQlGmazSj6Tp5sPaljHQBMN0gA1g6YKo8aclPUOJRcvY
MIME-Version: 1.0
X-Received: by 2002:a6b:5814:: with SMTP id m20mr16543044iob.242.1570792657772;
 Fri, 11 Oct 2019 04:17:37 -0700 (PDT)
Date:   Fri, 11 Oct 2019 04:17:37 -0700
In-Reply-To: <20191011111732.GA25982@localhost.localdomain>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000061e8090594a0aa4c@google.com>
Subject: Re: Re: KMSAN: uninit-value in alauda_check_media
From:   syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
To:     Jas K <jaskaransingh7654321@gmail.com>
Cc:     gregkh@linuxfoundation.org, jaskaransingh7654321@gmail.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, usb-storage@lists.one-eyed-alien.net,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Hi, just taking a crack at this. Hope you guys don't mind.

> #syz test: https://github.com/google/kasan.git 1e76a3e5

KMSAN bugs can only be tested on https://github.com/google/kmsan.git tree
because KMSAN tool is not upstreamed yet.
See https://goo.gl/tpsmEJ#kmsan-bugs for details.


> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index ddab2cd3d2e7..bb309b9ad65b 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -452,7 +452,7 @@ static int alauda_init_media(struct us_data *us)
>   static int alauda_check_media(struct us_data *us)
>   {
>   	struct alauda_info *info = (struct alauda_info *) us->extra;
> -	unsigned char status[2];
> +	unsigned char *status = us->iobuf;
>   	int rc;

>   	rc = alauda_get_media_status(us, status);
