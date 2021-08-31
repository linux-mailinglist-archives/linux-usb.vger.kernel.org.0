Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1353FC533
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 11:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbhHaJwq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 05:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20539 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240790AbhHaJwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 05:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630403505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=boUrZKhLp0JiMUKIan6Po3HbNkfH+6C/uMe+4QjtHEA=;
        b=KAsbVUmRBDLMl44mp5fcXtjKIxDkG677VO92DtSGxauElYcZCNqwYk3RSEOD+Qciz2vsNh
        2SEVWSUwL6ZPk6WcmXgKnyYyj/UgD+y+rzlWcoPa5yANeOxITt2CrNQYcuIQT+ouhRUdiz
        hQVlU8jYsFjsYhmo4vxBydoRxwoxAns=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-42hEWH35Mxy3yFVUZ3HYpg-1; Tue, 31 Aug 2021 05:51:44 -0400
X-MC-Unique: 42hEWH35Mxy3yFVUZ3HYpg-1
Received: by mail-pl1-f199.google.com with SMTP id h5-20020a170902704500b00137e251c362so805837plt.10
        for <linux-usb@vger.kernel.org>; Tue, 31 Aug 2021 02:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boUrZKhLp0JiMUKIan6Po3HbNkfH+6C/uMe+4QjtHEA=;
        b=PQc47gc2Rf/+useYU1L81qDhHApnTr/UuLszxAMKbTCkWcYbD4Cyd4+ufaIN2bA8PD
         nTcQaYpOrjn/cUFYnqPlbe0UxSjZ8yhMDbX+PN9a/PzezmHy0WldqJ+8qwTcohpfzuzR
         uDiQHp7TrEuH8ZjTWJEUjUHmhf53OIE603BsMaDlEHYsDbEwcpfQ4OcSYZzQs65gLY/J
         +a9Rw/a/sIkHmMNCna9zeIhwRe4Nzu9zgJ14NfmOhcz8r+zhmI+RHhES+R4CEULMX3Fp
         p2gr3m5Z2dw4ebas12Ohs4Kb+qCOrKQsBIoySqZ6kL6ikFxHstXBzpLCdMDQvtLKsHG7
         JkpA==
X-Gm-Message-State: AOAM533tp/q4fh+pBE062fzmQuCC/49Q55juZl9H171d2xvFewbTxCoj
        Iza+TEQwbSlA25PT1DfU9uQzQr8ETdNnfF/zPqdZn1RiAfV8lq9x2EYjkXG+1HMQ27KlFUodOxd
        j577thQzQ5QRiFKdB1zPgxLQqTV7QVZGzH0Ju
X-Received: by 2002:a17:90b:120a:: with SMTP id gl10mr4426087pjb.234.1630403503182;
        Tue, 31 Aug 2021 02:51:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzojti8W56GvxIsdVgucUtiiapsjjuPzxBecCRiM0JFpL3yj4lfl53tJeN7sS3PHQ/XJHKcnklFe+XbA8OBY18=
X-Received: by 2002:a17:90b:120a:: with SMTP id gl10mr4426067pjb.234.1630403502897;
 Tue, 31 Aug 2021 02:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210819195300.GA8613@rowland.harvard.edu> <000000000000c322ab05c9f2e880@google.com>
 <20210820140620.GA35867@rowland.harvard.edu> <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 31 Aug 2021 11:51:31 +0200
Message-ID: <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Michal Kubecek <mkubecek@suse.cz>,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 24, 2021 at 1:54 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 20 Aug 2021, Alan Stern wrote:
>
> > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >
> > That's good to know.  Still, I suspect there's a better way of handling
> > this condition.
> >
> > In particular, does it make sense to accept descriptors for input or
> > feature reports with length zero?  I can't imagine what good such
> > reports would do.
>
> I quickly went through drivers + some hidraw users, and can't spot any use
> case for it.
>
> > On the other hand, I'm not familiar enough with the code to know the
> > right way to reject these descriptors and reports.  It looks like the
> > HID subsystem was not designed with this sort of check in mind.
> >
> > Benjamin and Jiri, what do you think?  Is it okay to allow descriptors
> > for zero-length reports and just pretend they have length 1 (as the
> > patch tested by syzbot did), or should we instead reject them during
> > probing?
>
> I think it's a good band-aid for 5.14 (or 5.14-stable if we don't make
> it), and if it turns out to break something (which I don't expect), than
> we can look into rejecting already during probe.
>
> Benjamin, is there a way to run this quickly through your HID regression
> testing machinery?
>

I have finally been able to test this patch:
- the testsuite is still passing (of course, this is not hid-core related)
- Logitech unify receivers are fine (according to the automated tests)
- Gaming mice with hidraw calls works (with libratbag in userspace)
- Wacom Intuos Pro still works (so the usbhid calls to enable the
tablet mode are still OK)

->
Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Alan, would you mind resending the patch with the various tags with a
commit description? (unless I missed it...)

Cheers,
Benjamin

