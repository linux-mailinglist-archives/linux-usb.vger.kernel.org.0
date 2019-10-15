Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8BDD83B6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 00:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389917AbfJOWcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 18:32:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33534 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732040AbfJOWcc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 18:32:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so21927103ljd.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 15:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fon9Xqueqx/Fq0wGHnHqEDUCXyflZLUwsevU6fmx6jE=;
        b=SIEI+eyzsLvgKQSWy68fNU4waAO3JnvS6nzHr5/fZu5+F3lS+ninFSB5dUKCVryHZ+
         kl8H8QJRcmYfRoBpcYQdlcvyFYmbnE5AhMRuYRji7sgqsBgEDlqfBvGU7GUQWJu2UMf7
         6W/csLC8ZHTI+HN72RKiuRYhkxOOMexsvDhzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fon9Xqueqx/Fq0wGHnHqEDUCXyflZLUwsevU6fmx6jE=;
        b=ia0/TtkkVulKJawwNvzt6yrSwRAkc75l4/jzZ2KWsx/1rp1BXV8LIHHVyloa8tUQAR
         /zasPPrTHV+0SGj8bllgbxzxUzhE7ms9OLJX7plEW06ELZgmjhdUwLgqOSDfVX973NNl
         6Z9AqpJ2TrK5Ki66N5vT/Vyiro6jH5FwwZUOm9cv99eNo06BfbvkG8CfCIEqu42PQ/KE
         cJHQeUw9g6iNpGZvr3jbyoctgr9nxbevfZR9+u7pRW+ho8f3wCcHsLiXnljewtpyW/03
         BcazANIHisLFCOxg0U9+aqJJTCV8Ap5tIGxkEvJFdhMY2jQAf2GlaUEWh4joYKwe+SBJ
         xigw==
X-Gm-Message-State: APjAAAV/LkymX2fUK5Xd0rLUj7ib6P/Dxq71M6aP9yJsHHTUDM1G5Fik
        TTKoXhQnWvOqLRvs/q2TkV1Yi1AKVwk=
X-Google-Smtp-Source: APXvYqxzLZAVf0b6kTeHw7GGwG8c7Dhe9s+rq5hpxgPlYJDGKEqldzCSn9PTJjO/+elV4OCPPEmoIw==
X-Received: by 2002:a2e:86cd:: with SMTP id n13mr23670991ljj.239.1571178747957;
        Tue, 15 Oct 2019 15:32:27 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id z2sm6189239ljz.72.2019.10.15.15.32.24
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2019 15:32:25 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id t8so15699726lfc.13
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 15:32:24 -0700 (PDT)
X-Received: by 2002:a19:5504:: with SMTP id n4mr4230778lfe.106.1571178744104;
 Tue, 15 Oct 2019 15:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
In-Reply-To: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Oct 2019 15:32:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfCy+WCZ5SXZGi4QEhxXm=EjZjj4R9+o4q-QR3saMyfg@mail.gmail.com>
Message-ID: <CAHk-=whfCy+WCZ5SXZGi4QEhxXm=EjZjj4R9+o4q-QR3saMyfg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] pipe: Keyrings, Block and USB notifications
To:     David Howells <dhowells@redhat.com>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Aside from the two small comments, the pipe side looked reasonable,
but I stopped looking when the patches moved on to the notificaiton
part, and maybe I missed something in the earlier ones too.

Which does bring me to the meat of this email: can we please keep the
pipe cleanups and prepwork (and benchmarking) as a separate patch
series? I'd like that to be done separately from the notification
code, since it's re-organization and cleanup - while the eventual goal
is to be able to add messages to the pipe atomically, I think the
series makes sense (and should make sense) on its own.

          Linus
