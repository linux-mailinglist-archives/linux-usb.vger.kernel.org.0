Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D7D66D7E3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 09:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbjAQIS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 03:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235834AbjAQIS0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 03:18:26 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D987A7EC7
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 00:18:25 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z11so43960324ede.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 00:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LruPIPXQp1dgJ/y23O3y0R9TQyikAbpza1wRKEEzhGY=;
        b=Vma+i/7t7wwhtfGOIaExqk+1Uv93wsGKCG9E4WsFe0pC721W+BtB9BB6bq0bWlG3uD
         hOdvuH8lJLWvIufhSpqiRWL7absiBVvf/TJmt0jbxTmMXsqaADx4DbIVKCsGls+JBtYi
         cZDhlwkWyZ8+/ZuZjK7RhDmj2KrQLQ2LyKswJhz9VSYTsz3FOmVoj1rRz+91ikdRI5zP
         4xvOOhKzkY77QbjpuKzr0/M6VkixmBOTt5lVoa5QHRGtcdt8+iN4N2D54M09CTM2VPQY
         fjhnLRYIYTM1ASyQphEF84Q8f1AcHH8NF0EOnRC9l/MAdSf2oHfZ+0aI5KLEMm9it9UB
         dwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LruPIPXQp1dgJ/y23O3y0R9TQyikAbpza1wRKEEzhGY=;
        b=sbJg+naQrikg2HJAcvZYKGiU2wxm5Sxd1BUZ0jq/ReEQhBbKeMaucvlRWE1BCquot/
         fPo3/nXmNKOF0/zhnRoD/eCnVvgeDRZBmdIZZfWy2qZxP8CXKSrKYzYHGkcEj9s2kaig
         LV1ZJWcvGay7gEUwtlVOvPO0Bc7xWsmMaXQdJwIA1pwheGE9BK9x6HfpWTw3utWNsE+N
         XsUCsnwe39qVSvX86H4/NHVqswnSyF82utUupRi9CE9l6kw1/E5I+3zPwDaTUiWOA8vo
         SXBRoW/KLpAjMqHbn+ufmrbf+mugUTLpDt+Z+PeOKkcorDv3WbPqcm7epPvtZg+LjEcV
         rjZA==
X-Gm-Message-State: AFqh2ko1Eq3ceuWKwoB7oKTUQnrUTbyRUifTIXwuiKZJ7BSjHIosLCIA
        F0qHn6m49wPYvp3pCtoIsNuAHsGVBiJdLRkSAg4=
X-Google-Smtp-Source: AMrXdXtJUg9HzwqN9rrKva6ZhBmj8J5w6EngQa6t98hoyAXcjbD7O2FSiA4F/Br/DkB5NtjxOXgDuCqNCO4ucYpbuTc=
X-Received: by 2002:a05:6402:28a4:b0:485:2bdf:ca28 with SMTP id
 eg36-20020a05640228a400b004852bdfca28mr317129edb.251.1673943504241; Tue, 17
 Jan 2023 00:18:24 -0800 (PST)
MIME-Version: 1.0
References: <2mw02fh6hzd-2mw3w8xfngq@nsmail7.0.0--kylin--1>
 <CAD14+f1p3j3WJUYshneH7A38b8JsiXjtScESB2uOQ-ZyBi57tg@mail.gmail.com>
 <CAD14+f1ebzviMF-pi0ryKU8cRPWp2BqV2dwiXOFjeM30eqrwOg@mail.gmail.com>
 <CAD14+f3De+0oPaq0hOo0D+siTvZDNnBXg7Qg6fKNDh63zVh8Lg@mail.gmail.com> <111d7b42-5e85-58f5-0645-66749e754673@suse.com>
In-Reply-To: <111d7b42-5e85-58f5-0645-66749e754673@suse.com>
From:   Juhyung Park <qkrwngud825@gmail.com>
Date:   Tue, 17 Jan 2023 17:18:12 +0900
Message-ID: <CAD14+f3nHd3tSFwfpLkFfQOAAg8w9soRTf7F53Bj_UsCmN9+ow@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
To:     Oliver Neukum <oneukum@suse.com>
Cc:     =?UTF-8?B?5pu+57qi546y?= <zenghongling@kylinos.cn>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        gregkh <gregkh@linuxfoundation.org>,
        stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

On Tue, Jan 17, 2023 at 5:09 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
>
> On 17.01.23 07:16, Juhyung Park wrote:
> > Posted a new patch:
> > https://lore.kernel.org/all/20230117061046.114145-1-qkrwngud825@gmail.com/T/#u
> >
> > This issue has been stalled for way too long. If string-based
> > comparisons are too ugly, we can improve it later when Hongling is
> > more active towards this issue.
>
> Hi,
>
> very well, you really see no other solution?
> If so, could you please enhance the commit log to literally state
> that there is no other way to tell them apart? And then resubmit?

My unit is fine and only Hongling's isn't.

I'm fairly certain that this is not the best way to deal with that
specific defective unit, but unless Hongling actively participates in
debugging and providing more info, the affected users (who have their
completely fine RTL9210 enclosure suddenly have UAS nuked, including
me) suffer more and more.

String-based method is the only way *I* can do to keep Hongling's
working with usb-storage while restoring UAS back to the rest of the
RTL9210 enclosures with limited info Hongling's supplied thus far.

I'm not sure if this is worthy enough to write in the commit message,
let me know what you think.
Maybe link the relevant lore.kernel.org discussions directly into the
commit message?

Thanks, regards

>
>         Regards
>                 Oliver
