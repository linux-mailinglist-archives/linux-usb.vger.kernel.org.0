Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6DE41E337
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 23:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349423AbhI3VWq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 17:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349354AbhI3VWp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 17:22:45 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA26C06176C
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 14:21:02 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id cv2so4446209qvb.5
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 14:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
        b=BlxMYaM/OWq2QOg73mmSIuZReJqS9WDVJwYpygBxYlCdpjQvMPkG8JUUJuWMEfe7VW
         Kc4xJOkMskHk8O+awxj6C0zYig/iRuEgT85zngr4j5VHau1O2THU+xT3x/AlUo4/mD7V
         wX52wLkXcsoyoK8aKbnCd70Ljj6pEqXvKGjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
        b=Hhjn7j3IuDg+wRSPwp8eML0nkV3mJuOd6cPGju0qBlcfQIAeoQ3An0h+KT2VeguUA5
         LhoVpDnLrDJYS+u9z4X6BecRrD88NTU6WOmupzt91K7k139SKdAsd+JHRJCvFgh/Utsl
         jk1Eg5dseQFfDGQuod4mVb8NFiYSnI0HrGXaLo2WZaEBJUpNcYbFdQq99KZYAFha+fwT
         RZUGRPMajxTttS5s6hifQ+NolEzuULOnJ3+PNYQMQYL5CvKM13BZtOkLphVzQq48+vXP
         EEYeNB9m/OW9fmHGOkwWCXTQeuWYEa2aXJJOrAMkeRQEk3Pw5HydobG3NPzwt5DDVexr
         SZ2w==
X-Gm-Message-State: AOAM532bpAPb4DYtnqJU7rejcyoRMLH7MiAyYTY9UJvb3HP5qxflygpM
        fMyGpbiV6W8vXkbhKkhGHBqIsg6M70xCtagH5bw=
X-Google-Smtp-Source: ABdhPJxfl1ez7guR8g3rEq45tBdfOyFzAJGWj5OXiPK5NF1K2bNW0X776bLDdJtrDG3eiV66vENQFw==
X-Received: by 2002:a0c:e204:: with SMTP id q4mr6169806qvl.56.1633036860987;
        Thu, 30 Sep 2021 14:21:00 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id q8sm2234938qtl.80.2021.09.30.14.21.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 14:21:00 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id q81so8004001ybq.5
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 14:21:00 -0700 (PDT)
X-Received: by 2002:a25:df06:: with SMTP id w6mr1562849ybg.459.1633036849801;
 Thu, 30 Sep 2021 14:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930185031.18648-1-rppt@kernel.org>
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 30 Sep 2021 14:20:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memblock: cleanup memblock_free interface
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Juergen Gross <jgross@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        devicetree <devicetree@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KVM list <kvm@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-usb@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 11:50 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The first patch is a cleanup of numa_distance allocation in arch_numa I've
> spotted during the conversion.
> The second patch is a fix for Xen memory freeing on some of the error
> paths.

Well, at least patch 2 looks like something that should go into 5.15
and be marked for stable.

Patch 1 looks like a trivial local cleanup, and could go in
immediately. Patch 4 might be in that same category.

The rest look like "next merge window" to me, since they are spread
out and neither bugfixes nor tiny localized cleanups (iow renaming
functions, global resulting search-and-replace things).

So my gut feel is that two (maybe three) of these patches should go in
asap, with three (maybe four) be left for 5.16.

IOW, not trat this as a single series.

Hmm?

             Linus
