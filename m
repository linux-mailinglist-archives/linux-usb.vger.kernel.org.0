Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B78273C20
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 09:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgIVHia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 03:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbgIVHia (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 03:38:30 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5DFC061755
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 00:38:29 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id t138so18157276qka.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ipa9AEraiZ4WxMI3j6zKkuZfOCWRU1sXPHy9ssmqhq0=;
        b=Rtb/n5643IKkbrrIlIELkX5PmLOSklXODzADHIRHXSUmSLhBJKELHm4bfivKAUr5HN
         y/xSxFeOFx/xYKXj0aMBEhWPyvJAQ1pZkYlvXRF77XQ31Qt9Fu5DAgydXzyInCNdTlCc
         ciQu0o4jkf2eAx0nlhVm/rYXZpOYVrXLYdYHgLu/FZ9uTn+pUaSg5WHZNEnb2dhL/tfZ
         wNqifnyhyGl1d5VNJiH7yB2y8VhSDaNH50YZ8SqTOAKoVYN8aREZ8gKPBuWQFsZO6zY8
         z7XgLkI7cdd1/wO6z5ahN456lnZnl6Nu8RQhtfYTJGz+KTgNRiyRszUq50LaW85DnTO1
         XKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ipa9AEraiZ4WxMI3j6zKkuZfOCWRU1sXPHy9ssmqhq0=;
        b=AUuv0pTYJ4uwSGOqMN3euO6AowdtcFH9+hUwDAji9FuyDUlMvTCEN2QC7jO/gv0b58
         OrTFUQBqSWROdCZvB/iR7vXY/M25A4hoDus+CHhdALIhZwHUQnU5+WOAfpuHzerHvldH
         WsXcRznlVckI39/lm90kF76m+CsW2JqsQM7RXBlgQ+eqLCHbPQz8+fgIWzwUyScmOfts
         4cJSR+G1XI4JqJyKx/1a6Bzfl+mJO2mMe5wIUO1KfDqWRMcJwB87a5X+OqUkkaCamSHH
         po50l75AchexgXYsSLRMuUaL3G9/adG0mT5I4yozlUWS1kvCHob06vNA6wfXtAVtR6oR
         F89A==
X-Gm-Message-State: AOAM533HrrMU//0NiYahKEc/oq2uOtCHwLDu6dgzkuQvb6H6SjJkF/GO
        imKgwgIMF8PR7/EAlls13jhsWQvXKXqfgV1lN572VA==
X-Google-Smtp-Source: ABdhPJzfwyFIKFW+VaIZxRBOXXh98PwUCNRMZap9rTzYuhUqDyzm/1OFHDUO5KaoRzBoZ+9g9UvOz7eFd0O7ZqRkld0=
X-Received: by 2002:a37:5684:: with SMTP id k126mr3364853qkb.43.1600760308797;
 Tue, 22 Sep 2020 00:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com> <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
In-Reply-To: <20200922072639.GA1578565@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 22 Sep 2020 09:38:17 +0200
Message-ID: <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rxep
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
        Brooke Basile <brookebasile@gmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> > On Tue, Sep 22, 2020 at 8:21 AM syzbot
> > <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> > >
> > > Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> > >
> > > Tested on:
> > >
> > > commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> > > git tree:       upstream
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > >
> > > Note: testing is done by a robot and is best-effort only.
> >
> > Hi Brooke,
> >
> > As far as I understand, UBS is currently completely broken on upstream
> > HEAD, so testing any USB bugs on upstream HEAD will lead to false
> > positive results only.
>
> Broken in what way?  I don't see any bug reports here...

I mean this "USB driver ID matching broke":
https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
