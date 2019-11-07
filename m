Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50555F37B2
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 19:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfKGS74 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 13:59:56 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39706 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfKGS74 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 13:59:56 -0500
Received: by mail-ot1-f65.google.com with SMTP id e17so2960848otk.6
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 10:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgwxQZHa6ldii1pWiRxVyykr5nSYdGqgGsnTVFnT84Y=;
        b=iPZ79ADka3j4nmgFew4aV8GDcZgyEwjLMdxp0Mh5gVImbZONvzSBW9L1sDFI8fDn3H
         tnob8FIWxwGjDxp9eXuUAyD7X+O9J00fk8t56cyUl1HBcq0UNvZEFDD7/H+/lhhzvKYj
         SgIFewwBSBs+CRZJu4aSqVjtbsfPz4Ia4NSA5kd8fqnHx+ad24lm/tMPtATyuujAgPXh
         1XKicq1x1Q5xCLuAe65ljYXBxTPoh9Q9cqz2zM2+OCgrTkmSh/OTID/oUW0ztm5864wN
         wN4GNgZiZRtRUKL6RJ6zJRdQh59WYXHqXthL1ObImv7honOLN59FTmXsawrwD0Dyt9e/
         vpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgwxQZHa6ldii1pWiRxVyykr5nSYdGqgGsnTVFnT84Y=;
        b=R9mmu287yo40UV0C8B2a0Xml74/vx/KBGQpRvCPhEtc6LU2uRkbFbly0EZ7NI0dWbI
         lhJWkSxABjOhiKOKzXkwSFN7OEvfzYrm9vlnnJ6ZY73MO8ThN+XKYmIkOUAbBjN3zMGt
         3xhypeh+L8TXxsrZOGUA9ZKlWM29ZZ698Yuh8iBVOdOfztsJ/iOLLwAZf9kdQJe0bxjs
         nQ75/5lu/hk42tqDob4Lc8cHcyG8Sql0TkrLyZcqNF0TkLXbswKi5WDbX+Dx2J/f8KsR
         tu1EHZnNed334NrvmvSpnFf7SNdRGIG8eZtO5hHNbXItE+RY3gCwNaHM6/JEqhG/RqWz
         Zw/w==
X-Gm-Message-State: APjAAAV5Ks2lVjASixUdBXJsIIxtG6ErfjfkYqRpAMQlERs5nSoZs65d
        bI4olUz43jx9PlglU7XWZFeB6d2eLBKfvl9nUjfMjQ==
X-Google-Smtp-Source: APXvYqzZ2xDwFA4+o+16DbpXyR0jc2MOPlP3+u/QTC5jyvI5FJY3d9mHmZ9im0K4MWchyT/eP41C3qrbM2OhGj3lIpU=
X-Received: by 2002:a9d:5a0f:: with SMTP id v15mr4513902oth.266.1573153195073;
 Thu, 07 Nov 2019 10:59:55 -0800 (PST)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1911061044070.1694-100000@iolanthe.rowland.org>
 <BYAPR04MB5816640CEF40CB52430BBD3AE7790@BYAPR04MB5816.namprd04.prod.outlook.com>
 <b22c1dd95e6a262cf2667bee3913b412c1436746.camel@unipv.it> <BYAPR04MB58167B95AF6B7CDB39D24C52E7780@BYAPR04MB5816.namprd04.prod.outlook.com>
In-Reply-To: <BYAPR04MB58167B95AF6B7CDB39D24C52E7780@BYAPR04MB5816.namprd04.prod.outlook.com>
From:   Andrea Vai <andrea.vai@unipv.it>
Date:   Thu, 7 Nov 2019 19:59:44 +0100
Message-ID: <CAOsYWL3NkDw6iK3q81=5L-02w=VgPF_+tYvfgnTihgCcwKgA+g@mail.gmail.com>
Subject: Re: Slow I/O on USB media after commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans Holmberg <Hans.Holmberg@wdc.com>,
        Kernel development list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Sorry for the duplicate message, it didn't reach the lists due to
html formatting]
Il giorno gio 7 nov 2019 alle ore 08:54 Damien Le Moal
<Damien.LeMoal@wdc.com> ha scritto:
>
> On 2019/11/07 16:04, Andrea Vai wrote:
> > Il giorno mer, 06/11/2019 alle 22.13 +0000, Damien Le Moal ha scritto:
> >>
> >>
> >> Please simply try your write tests after doing this:
> >>
> >> echo mq-deadline > /sys/block/<name of your USB
> >> disk>/queue/scheduler
> >>
> >> And confirm that mq-deadline is selected with:
> >>
> >> cat /sys/block/<name of your USB disk>/queue/scheduler
> >> [mq-deadline] kyber bfq none
> >
> > ok, which kernel should I test with this: the fresh git cloned, or the
> > one just patched with Alan's patch, or doesn't matter which one?
>
> Probably all of them to see if there are any differences.

with both kernels, the output of
cat /sys/block/sdh/queue/schedule

already contains [mq-deadline]: is it correct to assume that the echo
command and the subsequent testing is useless? What to do now?

Thanks, and bye
Andrea
