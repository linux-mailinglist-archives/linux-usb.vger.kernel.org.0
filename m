Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F66E346B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 15:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393655AbfJXNjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 09:39:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44076 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733296AbfJXNjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 09:39:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id e10so14262517pgd.11
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=suq9Sbqez65nm6sNwjXVb4eVX4KIX9kkoJj8FM98PoM=;
        b=OHYw/9D+5pRDJM5o00TqrXMqaZZHH0YXF8fFIHxdq5w0p9wSW1QT2CM5tKV07TQK9X
         USyRxNJtE78wYc01M3eWTZmGSUTa7Og4HhUAbT18qkFqKvGyUNJrMcuNF2EGJE9Nu1+Q
         jGuVq4mDYULKEiXPnSFYHbVPbUcxxuH2CZgsnfpwAJ3Ouq2wj2tgfIJQCoXVJeBuptxY
         zFDe5ZxaFcvST5tmVOxPFuGVw25Yd7oWCDsO1OxGv01ieE2RLWMNam6EwIlR3jGk+GN7
         AJcGnNRAZt1So7BQSQ/v7BIFMeLCFisLVibyPPH/x8AY1gOHoBcQNzoeq5JKu0APBvQP
         dCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=suq9Sbqez65nm6sNwjXVb4eVX4KIX9kkoJj8FM98PoM=;
        b=Oph3VpllLOz5RHEBKRELXab5gXjG6hpDusJlPKksH6FKZEgHG4EOQ1ZcE9fjGCzG5w
         6ncLl06sWLK/9eLsdNbnoyAhvPYc8DRICvVLP4zq4bfXck0O/hsQIGRiB/G5rV1QMN38
         VgChuliana+CHl+25s57HcZiSCha2xvisnm/PCp6AStXj8Wuj+bvNi3zxoNAoB8jS6Rx
         hdSPDqYXeggzeJm+WnfXc0cdX+CqpJd/c1BDqXYIaLQ9PZYZXHJt764gH5rjonhPjTHn
         FDzB3qA0j6ZyGAnKKygrzo4hMptK0T+92xmqkexNoQeEFHBWU/VULi3mI4tdKxLefrcg
         oWGg==
X-Gm-Message-State: APjAAAUShQ7wGJfIHitAiZ6On9pTGN0qjS0xGQfaXUtXVv7j9TIekHR7
        CYkN9WirDncx96R9H/w6I48g0pRYTE7pwLfRJA7p5V1p6zA=
X-Google-Smtp-Source: APXvYqyCMBjaWqJGYxfc2KvlmcpxPxYmygFWjwLlOZ++J3LD4PX1QzcetP3vbmeNZx4vVL82pcs5q5JVkP9MAlrTQ0A=
X-Received: by 2002:a65:4c03:: with SMTP id u3mr16680974pgq.440.1571924355500;
 Thu, 24 Oct 2019 06:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <453d1fe3843d576eeeef6f8536eead59c1e566f3.1571762488.git.andreyknvl@google.com>
 <201910240309.CaNX9Uju%lkp@intel.com>
In-Reply-To: <201910240309.CaNX9Uju%lkp@intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 24 Oct 2019 15:39:04 +0200
Message-ID: <CAAeHK+zZszdu9dLNW0UBjCpT4nVW5uiZPMpeMogBqN3T5oTPPw@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb, kcov: collect coverage from hub_event
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, USB list <linux-usb@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 23, 2019 at 9:11 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Andrey,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [cannot apply to v5.4-rc4 next-20191023]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Andrey-Konovalov/kcov-collect-coverage-from-usb-and-vhost/20191023-185245
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 3b7c59a1950c75f2c0152e5a9cd77675b09233d6
> config: s390-allmodconfig (attached as .config)
> compiler: s390-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=s390
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ERROR: "kcov_remote_stop" [drivers/usb/core/usbcore.ko] undefined!
> >> ERROR: "kcov_remote_start" [drivers/usb/core/usbcore.ko] undefined!

Indeed, we need EXPORT_SYMBOL() for kcov_common_handle(),
kcov_remote_start() and kcov_remote_stop(). Will fix in v3.

>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
