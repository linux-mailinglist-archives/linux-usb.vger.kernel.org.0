Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFAD5693417
	for <lists+linux-usb@lfdr.de>; Sat, 11 Feb 2023 22:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjBKVv1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Feb 2023 16:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjBKVv0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Feb 2023 16:51:26 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E0A14237
        for <linux-usb@vger.kernel.org>; Sat, 11 Feb 2023 13:51:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bu23so8679265wrb.8
        for <linux-usb@vger.kernel.org>; Sat, 11 Feb 2023 13:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RXe8+/gmySrgi2xTJ/y1kxhXRvSVhQBX3d0R/ggfj1s=;
        b=gOFa4clgbXPZniWEeCq9v9mxBp/VpfjfQieMN6mX/xS4otqOg+u/bL/Ws9X4sJGkCG
         zFks8k1+VHZskcS7DGAjVMiBo75RYEw8kqvVzoRDt2O2greTXIz1O5WYnJdhYfnuzMPW
         MmCo3r2kSi2pDZvfYYMk6xYZdHGkN+3QNY4vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXe8+/gmySrgi2xTJ/y1kxhXRvSVhQBX3d0R/ggfj1s=;
        b=Q7dFwiGhTDmyIeR3wt6uBgE0W09SRa6hUZ+rmQkqNr/lRnB42JRSlbPTO3rqDKSeJI
         hxDIYsyluToWmytn0ifYtVbBeR6hIG/2V2qFdO9ZLDuhIA0T0YCIONCnfu5uUJUNyHIj
         67MKwin14yTTEZNewGDEI48ndoby5fPPP8r7zlO4BrYS5a1I4TvBmHZ0XIeV6FwLApFL
         70TC624/5cG8c6kzgOyqxvUTB4oqYgRCO++9F/bp98BcVOxz9O/7IFMdb2rNF0JMr9Qm
         HVJlYU/t1yG66TCLMUSm0sF0MVvcScwnfIB44l531Minxq7I7yjsXrr8NfQcQzBJUvsS
         1Khw==
X-Gm-Message-State: AO0yUKUdPlz7SZKVM34yXA43AFEEM2rLn0jUUDZzWtbUHy16Wb3usAMu
        0NJeKnGSWxQ0qy8rBWrazt+noEjsBdC66h5v3/g=
X-Google-Smtp-Source: AK7set+OAuFr37PxOrUFxk6beQFMT9Covv6skbc79/T3TeBSPSr972D02VzpubtEVAKohKPeY4pkYQ==
X-Received: by 2002:a5d:5487:0:b0:2bf:be35:2303 with SMTP id h7-20020a5d5487000000b002bfbe352303mr16343929wrv.34.1676152283052;
        Sat, 11 Feb 2023 13:51:23 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id h10-20020adfe98a000000b002c5501a5803sm1997292wrm.65.2023.02.11.13.51.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 13:51:21 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id sa10so23650177ejc.9
        for <linux-usb@vger.kernel.org>; Sat, 11 Feb 2023 13:51:21 -0800 (PST)
X-Received: by 2002:a17:906:658:b0:88f:a9ec:dfd7 with SMTP id
 t24-20020a170906065800b0088fa9ecdfd7mr2611475ejb.0.1676152281296; Sat, 11 Feb
 2023 13:51:21 -0800 (PST)
MIME-Version: 1.0
References: <Y+Egr4MmqlE6G+mr@rowland.harvard.edu> <a7d0e143-1e68-5531-5c2e-1f853d794bc0@I-love.SAKURA.ne.jp>
 <Y+KOeJlvQMYAaheZ@rowland.harvard.edu> <a67e24eb-b68f-2abc-50af-ae4c2d4cdd95@I-love.SAKURA.ne.jp>
 <20230208080739.1649-1-hdanton@sina.com> <1ad499bb-0c53-7529-ff00-e4328823f6fa@I-love.SAKURA.ne.jp>
 <Y+O6toMmAKBSILMf@rowland.harvard.edu> <f79e93ef-cfe8-1373-7c36-15d046c0e3c5@I-love.SAKURA.ne.jp>
 <Y+RZ2RKVo9FNMgSe@rowland.harvard.edu> <52c7d509-ba9e-a121-60c9-138d7ff3f667@I-love.SAKURA.ne.jp>
 <Y+gLd78vChQERZ6A@rowland.harvard.edu>
In-Reply-To: <Y+gLd78vChQERZ6A@rowland.harvard.edu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 11 Feb 2023 13:51:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXYzkOJZo0xpyYfrhWQg1M7j0OeCojTJ84CN4q9sqb2Q@mail.gmail.com>
Message-ID: <CAHk-=whXYzkOJZo0xpyYfrhWQg1M7j0OeCojTJ84CN4q9sqb2Q@mail.gmail.com>
Subject: Re: [PATCH RFC] drivers/core: Replace lockdep_set_novalidate_class()
 with unique class keys
To:     Alan Stern <stern@rowland.harvard.edu>, Coly Li <colyli@suse.de>,
        Kent Overstreet <kent.overstreet@gmail.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzkaller <syzkaller@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 11, 2023 at 1:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> @@ -2941,7 +2944,10 @@ void device_initialize(struct device *de
>         kobject_init(&dev->kobj, &device_ktype);
>         INIT_LIST_HEAD(&dev->dma_pools);
>         mutex_init(&dev->mutex);
> -       lockdep_set_novalidate_class(&dev->mutex);
> +       if (!lockdep_static_obj(dev)) {
> +               lockdep_register_key(&dev->mutex_key);
> +               lockdep_set_class(&dev->mutex, &dev->mutex_key);
> +       }
>         spin_lock_init(&dev->devres_lock);
>         INIT_LIST_HEAD(&dev->devres_head);
>         device_pm_init(dev);

So I think this is the right thing to do, but I note that while that
lockdep_set_novalidate_class() was "documented" to only be for
'dev->mutex' by scripts/checkpatch.pl, that horrific thing is also
used by md/bcache/btree.c for the mca_bucket_alloc().

Can we *please* get rid of it there too (it was added by the initial
code, and never had any explicit excuse for it), possibly by using the
same model.

And then we could get rid of lockdep_set_novalidate_class() entirely.
That would be a good thing.

Coly/Kent? See

    https://lore.kernel.org/lkml/Y+gLd78vChQERZ6A@rowland.harvard.edu/

for more context, and

    https://lore.kernel.org/all/28a82f50-39d5-a45f-7c7a-57a66cec0741@I-love.SAKURA.ne.jp/

for some history.

                 Linus
