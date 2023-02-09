Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA4B68FC1A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 01:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjBIAqZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 19:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjBIAqY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 19:46:24 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725AD1717F
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 16:46:23 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id rp23so1917901ejb.7
        for <linux-usb@vger.kernel.org>; Wed, 08 Feb 2023 16:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I7+y1khe5slzGpcCcNZFq0uCv9NMhh129osV28PiNlQ=;
        b=HCAWmh5Wpv/oN0CwywbyAtyXR+Ahe7gr87UDrCLvhD/mVxbx2yd3LVtt2HvGNteuMc
         2gsibUGamSfzBhbhMTvQAFn5TaNYD73srKz4bjMq7CLcQ7QMkl3a0RWY4ZJZ+5jFXb/q
         KRIPmLmLH7FUlPtqrmfiebBE1sIBgtXh6S3iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7+y1khe5slzGpcCcNZFq0uCv9NMhh129osV28PiNlQ=;
        b=oTO6cRg3ccJS++491Ve26MX5RWxsrsgLjPZ8Bmf/xQKbF0Z1xYyZ5HKj2j16IR7tti
         simNHUY315TKdcx8ulHnRci7XS7gxE/my0IYTlwExwYoUdRbruyoF+yBfVnB4HbO7lRk
         dS51vZVkxoM9nVN4lJdgLLUwWF8PFbvL6IgEf2r1rGhIziDffGPzxKJqoTW233+blLN8
         nVRfsXnAPnYgOScIevcsm39z7oyzLUM+dyNY/ALwklA2CI9xM5MJ8Yi6kvAndXimXO5h
         06ycucF1bCT/pToH7UaKET1mACbKLdaJw0GE1vR/dQlzAxzWhtjR/SJ6jnlHWNANZQe6
         n4bA==
X-Gm-Message-State: AO0yUKWbTOTW9OjMsFiQ15+u6TXC8NYEXX4k/mdeifrEb3ZtVh54z9l7
        +dnW7GyJGwUkrE0d5eaLKfWUPB0a9lYMl4bGx1ffzQ==
X-Google-Smtp-Source: AK7set9U5wpdD3z3yqV/xedWbFuREc23DRQNWvMF8sUGzUNtY7Y3Nsy1CZ5TxAFwGqFygzFe5nwGZA==
X-Received: by 2002:a17:907:60c7:b0:8ad:51e9:cd57 with SMTP id hv7-20020a17090760c700b008ad51e9cd57mr4783883ejc.49.1675903581737;
        Wed, 08 Feb 2023 16:46:21 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id f20-20020a170906739400b00857c2c29553sm140347ejl.197.2023.02.08.16.46.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 16:46:20 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id qw12so1984345ejc.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Feb 2023 16:46:20 -0800 (PST)
X-Received: by 2002:a17:906:4e46:b0:87a:7098:ca09 with SMTP id
 g6-20020a1709064e4600b0087a7098ca09mr1926650ejw.78.1675903580346; Wed, 08 Feb
 2023 16:46:20 -0800 (PST)
MIME-Version: 1.0
References: <Y965qEg0Re2QoQ7Q@rowland.harvard.edu> <CAHk-=wjoy=hObTmyRb9ttApjndt0LfqAfv71Cz+hEGrT0cLN+A@mail.gmail.com>
 <Y98FLlr7jkiFlV0k@rowland.harvard.edu> <827177aa-bb64-87a9-e1af-dfe070744045@I-love.SAKURA.ne.jp>
 <Y+Egr4MmqlE6G+mr@rowland.harvard.edu> <a7d0e143-1e68-5531-5c2e-1f853d794bc0@I-love.SAKURA.ne.jp>
 <Y+KOeJlvQMYAaheZ@rowland.harvard.edu> <a67e24eb-b68f-2abc-50af-ae4c2d4cdd95@I-love.SAKURA.ne.jp>
 <20230208080739.1649-1-hdanton@sina.com> <1ad499bb-0c53-7529-ff00-e4328823f6fa@I-love.SAKURA.ne.jp>
 <Y+O6toMmAKBSILMf@rowland.harvard.edu> <f79e93ef-cfe8-1373-7c36-15d046c0e3c5@I-love.SAKURA.ne.jp>
In-Reply-To: <f79e93ef-cfe8-1373-7c36-15d046c0e3c5@I-love.SAKURA.ne.jp>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 8 Feb 2023 16:46:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_E5qAOTtZ6BSJph1zDN7Unzw_ct8wK1pr+E8HTnooRw@mail.gmail.com>
Message-ID: <CAHk-=wg_E5qAOTtZ6BSJph1zDN7Unzw_ct8wK1pr+E8HTnooRw@mail.gmail.com>
Subject: Re: [PATCH] drivers/core: Replace lockdep_set_novalidate_class() with
 unique class keys
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzkaller <syzkaller@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
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

On Wed, Feb 8, 2023 at 4:23 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Did I misuse the Co-developed-by: tag? I added your Signed-off-by: tag because
> https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
> states that "every Co-developed-by: must be immediately followed by a Signed-off-by:
> of the associated co-author."

That doesn't mean that *You* can add a Signed-off-by:

Nobody can certify sign-off for anybody else. Read the sign-off rules:
you can add your *own* sign-off if the rules hold, but you can't sign
off for somebody else.

The "Co-developed-by: must be immediately followed by a
Signed-off-by:" thing only means that if there are multiple
developers, then ALL DEVELOPERS MUST SIGN OFF.

It absolutely does *NOT* mean that you adding a Co-developed-by means
that you then add a Signed-off-by.

That's like faking somebody else's signature on some paperwork. Never
do that either, and it's hopefully obvious why.

                  Linus
