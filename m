Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A02AA163
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 13:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388458AbfIEL3J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 07:29:09 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42832 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbfIEL3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 07:29:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id p3so1262714pgb.9
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dwvIUziP4fafPY2JOrWPat/xl7RaGutjpB8YJJC4H/U=;
        b=Rd8SyujrfWfPhmweQ/RJpVjX7e1PVKJ0VbLka9+S335G3HYRFRoBxdeY1BkSk7d56l
         CpSzg4J/QPMDvXevEgvsbeIm2Zcw4AK9XCKCvTQoszi1k2GHkvtc2ZaKSgceUELVOMSO
         HiNAdx2jqp0qcdFzYitX2LA7VBvHqTP/cLYzAC+xSvOXDt6CzB/wXIUbu8/tKHVtWAeu
         qndhi9r7KxCR6gq/NoBh1NftR0yqbfYgluIX/MAqTmdNIZ0iQ2WzgioJ4ktpk61A8e3C
         fIreFqJnN3harixIOCjxhHoUwnSUa5GY/AoTZlkYJnKPw/1Ct29Lw3fYX+uMIqvTD9Y/
         4CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dwvIUziP4fafPY2JOrWPat/xl7RaGutjpB8YJJC4H/U=;
        b=Bqgx9RhFYrZVNbl/NcY1EQtLA5GKfQErj3yf+uX3GTzyZ/bcXUjeu8D6fj5zkSKCJL
         fNWleE35gvLjqdgpehOSGlzug2D6LnW9A7rjCK/JDadhUwsv4ZyFFfehtVmLTvCVSF7U
         5IeSieBEZbYj9bz5+AORzRAuI8YqvEl/+qTo3mW/kwFQ4PUPoBkMRHrhdIVPrsU11+J6
         OsiYZXNRctc6ifYzJmSnQfF/zns1VoESEA7g74O8GiiCT/itAoHrrPZd+9Xh9N1L8Pw4
         tH638d81WqxvI0ALUPnUFzKlqYodKj1eSKgbE5pzIVAv8Z8AP2Uq85nz8jh8o+XzdJ4w
         q2IA==
X-Gm-Message-State: APjAAAXzrPO/vO33vuc5HtYSFuITQoWbtFiNPMDJQwwiETdEPxfU0I2x
        lBQH+u/yLcfjaCmPxbePibmzNRjhhQZt270ML70p0Q==
X-Google-Smtp-Source: APXvYqwnHdnf6mymYYDnuovI2OIh+2HMDn+StpZViGrapDrf3a2ZOlbCfC6vrMHEwUlGjl1xvu5Ub0MThTVq0k0Lh94=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr2697306pgq.130.1567682948307;
 Thu, 05 Sep 2019 04:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xJrv1hCbO5qOGTBu=c8STo+-obatOGZ4cHkbuhqmEvrg@mail.gmail.com>
 <000000000000a2044d0591cc99b2@google.com>
In-Reply-To: <000000000000a2044d0591cc99b2@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 5 Sep 2019 13:28:57 +0200
Message-ID: <CAAeHK+xVqvBGJ9dXTijuHusJr6vq85DVnKZbHsdyE8-pbWf-9Q@mail.gmail.com>
Subject: Re: WARNING: ODEBUG bug in usbhid_disconnect (2)
To:     syzbot <syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com>
Cc:     Roderick.Colenbrander@sony.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 5, 2019 at 1:27 PM syzbot
<syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
> dashboard link: https://syzkaller.appspot.com/bug?extid=14b53bfeb17f2b210eb7
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b6944e600000
>
> Note: testing is done by a robot and is best-effort only.

Nice! Let's mark this one as fixed:

#syz fix: HID: sony: Fix memory corruption issue on cleanup.
