Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DD139361F
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 21:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbhE0TRf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 15:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbhE0TRf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 15:17:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA584C061760
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 12:16:01 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id f8so1104598pjh.0
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuQ1mln99XVQ8KIRtcNK5ux06may7zUsz31usRyDstI=;
        b=UoNBo0lQTQse69/jwXlT+DbMDtMQCcT+3OsBws4KmUILMvbunExHrM9Do93IDjeGM8
         MVbyTxu1iJWLa4iJfSk5+9vgUjmPuhmEDQ0XBYhl20CGPyYP342nspr2iohGgKc0xKOi
         BvLgo8z/XWlA3PhpTNP+oZBYI8eD2oqSsMVGy+MhT5ZiivgRJ+LiHpY2W5d4pWtXVCZs
         fFtFtry8HlZ+925fk5RpgifDl/lbbIEpnpg+YTdtCoh2Lc6Laq8UaCi/MSN4l4dZ5wtg
         WmeXMWO5DpWvrABR2X/B0le55LFvP3Jli+4GSwhTtE6px+AXpHOJirTUYEt1mq847VJz
         JBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuQ1mln99XVQ8KIRtcNK5ux06may7zUsz31usRyDstI=;
        b=sWO88XCjXorpdbguk+/GO987Glu/hp598VDCCL3i0f9pOEqfRrwSfsunEjsrNISu4n
         LGVZv9PrCrP358gL4+EIc5HkFmVKBjOjMfxz3mSeEzzSZ3gqKzDwJljAMVghdfdMuOSb
         D85zChIKM/0s0Q/ryvWjD+7AotECea/DY7ON4NeCRyiNhcHk3I6F45MQG+pu1w/EYkDi
         t/vPZnOQ7kmuiHwZVY6YEqHs2jcS/nAbVL7ne89QbWIb85daNfQqI2SflGyR8IjaheEq
         clhajHENcGM3LS1uHnzTWhgUaxNFO5h+IOqhd/VjlavJSVqA+M2D2eBY1W3r36RnG1OH
         dHTA==
X-Gm-Message-State: AOAM531OJ6i+HExtolRVP74SW4kbM83doGZUVKkLNz20wT1XwvD99WVX
        VCkAYDZFjVLaWKL0zUbNZIkkodG8KIeXHhtYoOcTvw==
X-Google-Smtp-Source: ABdhPJzDdcfqpqWi9YV5hdZCXknQc8mE8YRCO78A45hJlA4AvBz/MH4WTk9A4QFjxroikr8TWDSIT9+toInzUpvAFzc=
X-Received: by 2002:a17:90b:1b04:: with SMTP id nu4mr5555248pjb.18.1622142961333;
 Thu, 27 May 2021 12:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210527175703.0f0b63c7@canb.auug.org.au> <a7a618ae-936e-67a7-975f-8692db0ada87@infradead.org>
In-Reply-To: <a7a618ae-936e-67a7-975f-8692db0ada87@infradead.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 27 May 2021 21:14:28 +0200
Message-ID: <CAMZdPi-xZefr50yAiQbARXm4Dedb=Y+tJQCxxYERow9hbUR4Sg@mail.gmail.com>
Subject: Re: linux-next: Tree for May 27 (drivers/usb/class/cdc-wdm.o)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Randy;


On Thu, 27 May 2021 at 17:10, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/27/21 12:57 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20210526:
> >
> > The kvm-fixes tree gained another build failure so I used the version from
> > next-20210524.
> >
> > The hid tree (I think) gained a build failure that I left broken.
> >
> > The amdgpu tree gained a build failure for which I reverted a commit.
> >
> > The scsi-mkp tree gained a build failuer so I used the version from
> > next-20210526.
> >
> > Non-merge commits (relative to Linus' tree): 5002
> >  4946 files changed, 230454 insertions(+), 77632 deletions(-)
> >
> > ----------------------------------------------------------------------------
> >
> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> > are tracking the linux-next tree using git, you should not use "git pull"
> > to do so as that will try to merge the new linux-next release with the
> > old one.  You should use "git fetch" and checkout or reset to the new
> > master.
> >
> > You can see which trees have been included by looking in the Next/Trees
> > file in the source.  There are also quilt-import.log and merge.log
> > files in the Next directory.  Between each merge, the tree was built
> > with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> > multi_v7_defconfig for arm and a native build of tools/perf. After
> > the final fixups (if any), I do an x86_64 modules_install followed by
> > builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> > ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> > and sparc64 defconfig and htmldocs. And finally, a simple boot test
> > of the powerpc pseries_le_defconfig kernel in qemu (with and without
> > kvm enabled).
> >
> > Below is a summary of the state of the merge.
> >
> > I am currently merging 331 trees (counting Linus' and 89 trees of bug
> > fix patches pending for the current merge release).
> >
> > Stats about the size of the tree over time can be seen at
> > http://neuling.org/linux-next-size.html .
> >
> > Status of my local build tests will be at
> > http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> > advice about cross compilers/configs that work, we are always open to add
> > more builds.
> >
> > Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> > Gortmaker for triage and bug fixes.
> >
>
> on i386:
>
> ld: drivers/usb/class/cdc-wdm.o: in function `wdm_disconnect':
> cdc-wdm.c:(.text+0x7c5): undefined reference to `wwan_remove_port'
> ld: drivers/usb/class/cdc-wdm.o: in function `wdm_in_callback':
> cdc-wdm.c:(.text+0xb8d): undefined reference to `wwan_port_rx'

This is normally fixed by:
https://patchwork.kernel.org/project/linux-usb/patch/20210521021010.2490930-1-weiyongjun1@huawei.com/

Regards,
loic
