Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2EF1026D5
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 15:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfKSOdA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 09:33:00 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:41164 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfKSOdA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 09:33:00 -0500
Received: by mail-pl1-f171.google.com with SMTP id d29so11855559plj.8
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QWmqlctb3ZXD7WfpFuk6bq+a9VLtf6IJ8PZ6YsU1YoM=;
        b=tjRNaFMoRrBRw9kvHh1STRh+ec2EbaeYs4lSdlbdbF6xhhBUPny3SlYNdd01TM9voB
         8vmkWae4TqZalSxb1lVl/WqxASoxDRmfflkvdn7az6TlBoiepGiORPyi+8JB5DjS74NH
         8lYVXAaxyobnH5Dc+f24lg9WUz2ecxJ1OAJ9LC3UFjphQKHShmyFB1hkAr7hIptE2QuN
         91+kaFm+pdhG7sRSaLzNxE8e/bw/kF72VjuwuYJh/dIFtf5E4FV0s342iYnHuUYAVhdy
         vjKKOpw++UagcnK0Ej0HqC7MIU/5SWCoXuWZWnMp0tPKp9ue+coc1bcGWocChiX/u34h
         rqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QWmqlctb3ZXD7WfpFuk6bq+a9VLtf6IJ8PZ6YsU1YoM=;
        b=lBSe5RS9tmvQYu8z+sjOXwof+8FKeFxTaSZv1Hr8cf4vjeLImKEDY37B2RgU7sjq+A
         eC9XjGjhP/xsSpO5FoCiHoj4aMSJgFzz/oITqTBdrvGzCgB2LK0kGGKumRzxkRKuAqXy
         Fn65dGPECZGfG35bg8iI7BnpXNNUwFRXe0B1UDtC5PLwzxe6pb6y7G9ccrqHbmNj+Ze7
         e4Acb5cBVjSN/VaGNk6P75OrRO4TDCZERdlZwzmmfs/aGHfnaWy+6mVLBx0GwDEPkrzT
         YOGtjE5vf/3xMnZf/sY6POkbJuLzJGKOmGMWn9yAkj3yoQn9bzs1StqMe+T4XM6K70qA
         R57g==
X-Gm-Message-State: APjAAAWDde4fqc7RXMEk0glIp+Kw2MVlu5biP3rZRM3d7//5aAKcmt6j
        VarqgrBLM5Vs/IPEMy0FrPcU8iFkUOCVpwHVVgJfJw==
X-Google-Smtp-Source: APXvYqwvB8z7JKHK0FBF93atWvKuTGWQhtP8yLuQ3OI887t6FDkGv4DBSg8nzPLVPcHXZLb8md4U9G7TfFvupiFlIV8=
X-Received: by 2002:a17:90b:438b:: with SMTP id in11mr6904277pjb.129.1574173978895;
 Tue, 19 Nov 2019 06:32:58 -0800 (PST)
MIME-Version: 1.0
References: <000000000000dece03058f87bf11@google.com> <00000000000091301a058fabc3f1@google.com>
 <CAAeHK+zV2TXWtdmLj8Fjpfg9DPNNWrZXnbtLJ_bEhMJUjiua9Q@mail.gmail.com> <1574173039.28617.13.camel@suse.com>
In-Reply-To: <1574173039.28617.13.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 19 Nov 2019 15:32:40 +0100
Message-ID: <CAAeHK+yuUyz6P-3kHaJbA-KziwawKKDduz6=5KVgqnFZ_iUONA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in wdm_int_callback
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+1a3765ef3c0d49d36a75@syzkaller.appspotmail.com>,
        baijiaju1990@gmail.com, bigeasy@linutronix.de,
        Colin Ian King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 19, 2019 at 3:17 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Dienstag, den 19.11.2019, 14:46 +0100 schrieb Andrey Konovalov:
> >
> > #syz dup: WARNING in wdm_write/usb_submit_urb
> >
> > https://syzkaller.appspot.com/bug?extid=d232cca6ec42c2edb3fc
>
> Hi,
>
> this is a bit odd. A fix for that bug went in quite some time ago.
> Is the kernel tree these tests are running on regularly updated?

Hi Oliver,

The fix went in a while ago indeed, and the original WARNING bug got
closed. But this bug was never marked to be somehow related to the fix
or the WARNING bug and therefore was never closed.

Thanks!
