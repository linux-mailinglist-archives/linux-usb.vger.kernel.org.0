Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0054A97C20
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 16:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbfHUOI0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 10:08:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44661 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbfHUOI0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 10:08:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so1371446pgl.11
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8e7X/wg8+ApZ+vWe4sHZB1SNwyGdWR6g5xcxu8rV80=;
        b=Dj/lnu3ZX7p7VpkQfHD4EhbkT/zNZw2oSL1+X7i8bb9NqzWJY0w/czMeU1BacLiVoj
         ZAJhc2WMRPuSUOhcYKsKbqib75c79kEwD+vw4hNR+wcow+7GFtlYp+ik/jJPU4xKm5Ib
         z6zeHnLHM0URsW+J7gs8Cj+nePj4MlP77vzXVLwG0vsgmdYFar02I010mxL+U3JCQXdz
         Vz4die9g0DpVk8p1mkijq8zBnIGVWBSDHd/BjOI4ciOj1aFkxN32h+g04H/z8zy8j4zj
         JU3NSTVYCyFJeNDCv1IEq5CzgAMJseymRq+TGpTi2QF/g6JXY2nCqjfiY3hWai55ixWK
         Tbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8e7X/wg8+ApZ+vWe4sHZB1SNwyGdWR6g5xcxu8rV80=;
        b=ZWURZswhsaBmHFC50MsEKDneOKx7RiTvnCT+/3Ru3pcYTXPB8pN0ZMYDRXF+yoUhDy
         0KPTGMEvq00t+1iiMR8G7vrJpreUtOw+9hPSdq3B2UhurZK7iDgltSpn1ijccyKGZRHh
         L2ucyvDNPnwwbMpt++wLnODUiaMtn29qsDfsTljsBYtQzLE9OXpdgXNTDXWxfPmMZmdU
         g2GmKeNRPXxr7sXUnQEINkdLi75kKVaWzYp6neTzu2/VQvb1ipow6rUEV4Lx+1fXzVtN
         VyawMKWhM22wH/EFyBuzGXlCXG4sKMzeMdHR/bLAqcByzEbkTmrti1AE454YTEoqhaoZ
         r/iw==
X-Gm-Message-State: APjAAAVaMmWAuMXtAST1BylBGU4FQcG9BGqo6fv9LsoO3Fu/5I82IvSn
        Pg4ijnVRnGIYvHSHFEwNL0lKVvbpEO9tQ7Au7rF7fg==
X-Google-Smtp-Source: APXvYqxXod9xjQCe4CMS8qhhzsa2np2x+ANIzguwxuQcTl8BzLgnWiBzvlPrS5tJ/YujbXwEJcBpAn4iO1cGd69JiIU=
X-Received: by 2002:a63:c442:: with SMTP id m2mr9011032pgg.286.1566396504987;
 Wed, 21 Aug 2019 07:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+wkV7zpAHURRzdY_TMRkCv=P5=yfJqLf9tAoYJA35779A@mail.gmail.com>
 <000000000000ca63880590a046e2@google.com>
In-Reply-To: <000000000000ca63880590a046e2@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 16:08:13 +0200
Message-ID: <CAAeHK+wmpfkPEKOoYy-LgKw88DdVsEbyoRroRpcF8ygPp3oVWw@mail.gmail.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb
To:     syzbot <syzbot+a7a6b9c609b9457c62c6@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 21, 2019 at 3:09 PM syzbot
<syzbot+a7a6b9c609b9457c62c6@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+a7a6b9c609b9457c62c6@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=140148ca600000
>
> Note: testing is done by a robot and is best-effort only.

Looks like the same bug:

#syz dup: general protection fault in __pm_runtime_resume
