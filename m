Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D65D4D95BB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 17:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405128AbfJPPhQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 11:37:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45328 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404933AbfJPPhP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 11:37:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id q64so24481526ljb.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4sUXBF9N+gOqGoXUSe/0E2VksmAjHdkiv7KSR2ftGI=;
        b=KN++Zn81C01LK7bngv2WQhecCB2pvDWa6MiPOCNK9giCb55GzPd38NprLWCi9y4Rmp
         G5JVpEFhN07gxtvQKkcodZ0c/iin5yb7op+6svXAeHTJxJPM5HZz2LuFX2hGczINIWnp
         zjAlhPJ3IIlR8ZNhwPZ4TPeH42AI6XYGcDMmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4sUXBF9N+gOqGoXUSe/0E2VksmAjHdkiv7KSR2ftGI=;
        b=Vx9I4+qkvrwup14p0u/cXtEH6N2LrY6zZ1Vs8wLBMQiQ1+IVEsE9aUq14n8Qp20/EL
         Ls+FmsrOPQV65rTTkf0MKMuQWylq6a/0SsWM9WLg5CTkagfrP5wO0WAx44u9/5HtIKdJ
         FZhiX71PFSXhUQo2bUeFoY2g9eKpZ0YfERLjK0SW1RUvAt0AQqur3BF4rkDLzH5eGfsI
         DY6ayTJMJGzokq+XM+v2XS5bMFZvXGwpsZjlbAaOBa6Nbrt/bI8Hj02w5rU9TvtJyM3g
         OnK9P3k8Ks8cdoTnFdbBL/jXUyR0+BGWOLXahO0MTEE/GYBRFUATnGdDj5I5NR8eWhe1
         2PkA==
X-Gm-Message-State: APjAAAUUcBg2EA8JWmtBF8ikflp4l/ac5FB3BCpnZEUbkvEOCkJM6kHH
        vFQ1Rj9ieHr99mv4y/cbw6k2+Wav8gk=
X-Google-Smtp-Source: APXvYqxuIGUNApI1slkkpYJduzFI5h5WOHWUwAs9DmKRZuyoBQmSAPYdNEQtof3vE3BtQISFb5jl5g==
X-Received: by 2002:a2e:2943:: with SMTP id u64mr26814120lje.241.1571240233326;
        Wed, 16 Oct 2019 08:37:13 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id a27sm35128lfj.48.2019.10.16.08.37.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 08:37:13 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id q64so24481454ljb.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 08:37:12 -0700 (PDT)
X-Received: by 2002:a2e:545:: with SMTP id 66mr4189350ljf.133.1571239925218;
 Wed, 16 Oct 2019 08:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
 <157117608708.15019.1998141309054662114.stgit@warthog.procyon.org.uk>
 <CAHk-=whiz1sHXu8SVZKEC2dup=r5JMrftPtEt6ff9Ea8dyH8yQ@mail.gmail.com> <6900.1571235985@warthog.procyon.org.uk>
In-Reply-To: <6900.1571235985@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Oct 2019 08:31:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMZR8TWpmRBPytGmWJX=C=-bCb5D2PsCx0LUNemAPexA@mail.gmail.com>
Message-ID: <CAHk-=wgMZR8TWpmRBPytGmWJX=C=-bCb5D2PsCx0LUNemAPexA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/21] Add a prelocked wake-up
To:     David Howells <dhowells@redhat.com>
Cc:     Tim Chen <tim.c.chen@linux.intel.com>,
        Kan Liang <kan.liang@intel.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
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

On Wed, Oct 16, 2019 at 7:26 AM David Howells <dhowells@redhat.com> wrote:
>
> Btw, is there any point in __wake_up_sync_key() taking a nr_exclusive
> argument since it clears WF_SYNC if nr_exclusive != 1 and doesn't make sense
> to be >1 anyway.

Ack, looks sane to me.

We have _very_ few users of nr_exclusive. I wonder if it's even worth
having at all, but it's definitely not worth it here.

I'd love for nr_exclusive to go away and be replaced by WF_ALL
instead. Right now it looks like there is one SGI driver that uses it,
and the sbitmap code. That was all I could find.

Oh well. You removing one case is at last a small amount of progress.

         Linus
