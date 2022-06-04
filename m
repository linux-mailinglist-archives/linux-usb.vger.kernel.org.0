Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4DA53D621
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 10:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbiFDIdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jun 2022 04:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbiFDIdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jun 2022 04:33:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04851C109
        for <linux-usb@vger.kernel.org>; Sat,  4 Jun 2022 01:33:00 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 1so10756971ljp.8
        for <linux-usb@vger.kernel.org>; Sat, 04 Jun 2022 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqFZxA/HqywLfblJN7LT8qYahRL42XkEnGb9VnbgV1g=;
        b=aMEmcO6OUIvyzU0QCRHAQvI5GA7hvngQ+sQz4uJXxdYQ5GseqCH0wcQ91mZhWkVDes
         R63LqGXxkNB6k3TsarhUAu3Q//MR8HC/ewzyA2xJlNCFYP7aZuKGDPLXi047xRDql/to
         CJyREh+7nU5rml8U8fSWfBRxdhy5+fJAJc1O+t+lI6HFLDZr4/JRdop4EH2MgIKPwwsc
         RmDVoRf20N/S8dcUWxIrSnIonfVYi7E8IueQUwVVY/UPsPke89ekYlBwdrPnME40H00f
         00EUNIHn6555Iydgnl2YAVLUPSOFALYjuUE3GN9s4L6ZWXV1puwUjKoL2pfb/xQcWQYO
         fnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqFZxA/HqywLfblJN7LT8qYahRL42XkEnGb9VnbgV1g=;
        b=PU66wcepIKJp25IRH2pPV82rHMfg1esLbwJT+ygbb1ZmvNzhyJ6U+joBuKOkvrb9bX
         ZcXtJphRn3XLYzQz391pqpJc117lortFYlFRdjqqLYQE2l3pn4ZE1F2iRu77Ngn00Mtn
         DMSu9cky+W2/CrF0aW6Ub8+tvgpISGFbvMjnbJH38OFGU1B1I6CeQthD9q9dMtVcrxsn
         kko0Bsv/OKMQuF2NqeH45EgG+vnMuEshlP2LvmWwjjoZP17Hjh0DQiSKepGUBVwdZ0Ke
         cr/W9hjUv/aInB2ZvHJ3GVPqviHGmJBdYw/hfktxTCiriB1KcyIfCdHYSIpbUbq/KRkX
         4IjA==
X-Gm-Message-State: AOAM533eGn4K6yI72LhXTnTebF7Ht3aK4FdFYWAUE0OHFjKkMAv3jAcC
        /sPS5mDMG9jhqV4B3tIyW2bCCr3HXdIvq10YP2CRpg==
X-Google-Smtp-Source: ABdhPJxniorX9S2jBxBBR9x4/9fZyYZ6gULVi9sDSxUdfzLVDhgD7807Im/BPJo7tTPcHwPROaZlcuLArKk822C3hZo=
X-Received: by 2002:a05:651c:1797:b0:254:1a3a:801a with SMTP id
 bn23-20020a05651c179700b002541a3a801amr27436272ljb.363.1654331578574; Sat, 04
 Jun 2022 01:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bb7f1c05da29b601@google.com> <00000000000010b7d305e08837c8@google.com>
 <YpnqpMYcokTwCB6u@smile.fi.intel.com> <Ypor265BTdnmgwpM@rowland.harvard.edu>
 <YpouRmanvCQeKA3S@kroah.com> <Ypow1LRZ3Hau36ci@rowland.harvard.edu> <Ypoyy/stICFdHauR@kroah.com>
In-Reply-To: <Ypoyy/stICFdHauR@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 4 Jun 2022 10:32:46 +0200
Message-ID: <CACT4Y+bBWrLRwiowaWk8o4+XAtCHxxJiEQfiSkgM3BDut9atAw@mail.gmail.com>
Subject: Re: [syzbot] general protection fault in __device_attach
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        syzbot <syzbot+dd3c97de244683533381@syzkaller.appspotmail.com>,
        hdanton@sina.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com,
        rafael@kernel.org, rjw@rjwysocki.net,
        syzkaller-bugs@googlegroups.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 3 Jun 2022 at 18:12, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > > syzbot has bisected this issue to:
> > > > > >
> > > > > > commit a9c4cf299f5f79d5016c8a9646fa1fc49381a8c1
> > > > > > Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > Date:   Fri Jun 18 13:41:27 2021 +0000
> > > > > >
> > > > > >     ACPI: sysfs: Use __ATTR_RO() and __ATTR_RW() macros
> > > > >
> > > > > Hmm... It's not obvious at all how this change can alter the behaviour so
> > > > > drastically. device_add() is called from USB core with intf->dev.name == NULL
> > > > > by some reason. A-ha, seems like fault injector, which looks like
> > > > >
> > > > >         dev_set_name(&intf->dev, "%d-%s:%d.%d", dev->bus->busnum,
> > > > >                      dev->devpath, configuration, ifnum);
> > > > >
> > > > > missed the return code check.
> > > > >
> > > > > But I'm not familiar with that code at all, adding Linux USB ML and Alan.
> > > >
> > > > I can't see any connection between this bug and acpi/sysfs.c.  Is it a
> > > > bad bisection?
> > > >
> > > > It looks like you're right about dev_set_name() failing.  In fact, the
> > > > kernel appears to be littered with calls to that routine which do not
> > > > check the return code (the entire subtree below drivers/usb/ contains
> > > > only _one_ call that does check the return code!).  The function doesn't
> > > > have any __must_check annotation, and its kerneldoc doesn't mention the
> > > > return code or the possibility of a failure.
> > > >
> > > > Apparently the assumption is that if dev_set_name() fails then
> > > > device_add() later on will also fail, and the problem will be detected
> > > > then.
> > > >
> > > > So now what should happen when device_add() for an interface fails in
> > > > usb_set_configuration()?
> > >
> > > But how can that really fail on a real system?
> > >
> > > Is this just due to error-injection stuff?  If so, I'm really loath to
> > > rework the world for something that can never happen in real life.
> > >
> > > Or is this a real syzbot-found-with-reproducer issue?
> >
> > Aren't there quite a few reasons why device_add() might fail?  (Although
> > most of them probably are memory allocation errors...)
>
> I was thinking of the dev_set_name() issue further back in the call
> chain.
>
> > Basically, you have to make up your mind.  If a function can fail, you
> > should be prepared to handle the failure.  If it can't fail, there's no
> > point in even checking the return code.
>
> True, ok, we should unwind the mess.  I'll try to look at it after the
> merge window...
>
> But again, is this a "real and able to be triggered from userspace"
> problem, or just fault-injection-induced?

Then this is something to fix in the fault injection subsystem.
Testing systems shouldn't be reporting false positives.
What allocations cannot fail in real life? Is it <=page_size?
