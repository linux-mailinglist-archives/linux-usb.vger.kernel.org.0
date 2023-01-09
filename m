Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5256624ED
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 13:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbjAIMBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 07:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbjAIMA4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 07:00:56 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA15865A6
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 04:00:54 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id fc4so19397954ejc.12
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 04:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/QmHdiGULaJGP+rPUpxdlYuhnIUflsBFp1LiLNnS7N0=;
        b=kRrlj4fQeny9w2EhAYCs4NUaalPXAQhRiKWJDHkSvZhjIuLZYgHVsg92wrHoofhf4A
         4eBvfcuPW1I7Uh9KaPNwhHeAV7rAp1BumFUcAbF8XjMvjJdGYGHbc3kbfjflmacUzKaD
         EQHGGriEy88gaOeKJ+/NAT+De3HtI1k24bTEpogeUqCkWKJY66zlvBmnydjiHW5vOpdA
         SBKKWOszwpEuneZQ9uK+0IU3LlO5qrrw+f3ixebSBelCdX5QjQztva/LOdZh/PCXZOeE
         fExLF4T9u++tz04ooA9CZZfwGnMV1ev4IbU87Nti9R2+qosBGJWqJ+HmVLymieUF5ENA
         e/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QmHdiGULaJGP+rPUpxdlYuhnIUflsBFp1LiLNnS7N0=;
        b=hoELEY9+4xMxHHhmIC15a4wchgBVw7msaSCnRuIdF1Tg5I3wUeIcHU3xYwiyL+VW9n
         jsI7ERIqPR7hf0uB86jqunzu+P4OusLF8ngHkOT5mAiynYPp0g23OAaUo66qkENmUFlJ
         ljb1Cse+zPV9ytMxcrQw/qRkGwSlBZF0CNEKg34bA3k/YAa/6w1UwZPUMDZPzS/aQfUC
         itVjksNgzFYVgViKe5BEmsb+YZ6eM6QQPPDFhIVRP7wtVcirYG9bXPJgZh/LCG0ixUgd
         EBfZYvt/adfnbS/TZN3CK9g+1knmPw36EgmJ2kc7JCMIFHfGY/vP0pfD7HOQG3NluHML
         R0cw==
X-Gm-Message-State: AFqh2kpEqqVe7ZdfT86DJzMVN1SWvOagO3ul1JHsD5scvSBytAJsY26S
        yyPJUdZGgUK3LyZc0hA999i15drwGmtD/UJSqts=
X-Google-Smtp-Source: AMrXdXtHXMEhRES129mox8fJKABXbeJF/SLTlD0aWYrdhZu94ak8ANSiAunAHsicJlF4WNADnpls/A27t5pf8cvqdDo=
X-Received: by 2002:a17:906:4684:b0:7c0:efba:a8c6 with SMTP id
 a4-20020a170906468400b007c0efbaa8c6mr3871794ejr.632.1673265652860; Mon, 09
 Jan 2023 04:00:52 -0800 (PST)
MIME-Version: 1.0
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com> <Y2uDnUQKCDGzioJN@kroah.com>
 <2022111215445443712314@126.com> <Y29RtXGcey6V9iTY@kroah.com>
In-Reply-To: <Y29RtXGcey6V9iTY@kroah.com>
From:   Juhyung Park <qkrwngud825@gmail.com>
Date:   Mon, 9 Jan 2023 21:00:41 +0900
Message-ID: <CAD14+f1dAwCtOM-yBFSs5S-jRqwX1caUuP04-DRh5=EXC5Th0A@mail.gmail.com>
Subject: Re: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "zhongling0719@126.com" <zhongling0719@126.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
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

Hi Greg,

I've posted a revert commit as there were no attempts to fix this to
apply just to the said product (Hiksemi USB3-FW):
https://lore.kernel.org/all/20230109115550.71688-1-qkrwngud825@gmail.com/T/#u

Thanks. Regards

On Sat, Nov 12, 2022 at 4:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 12, 2022 at 03:45:36PM +0800, zhongling0719@126.com wrote:
> > Hi:
> >   This error not happend on all RTL9210,The uas blacklist only for on sale device(0x0bda, 0x9210).
>
> What about using the version of the device as the only one to blacklist?
> Any more specific information you have about that device?
>
> thanks,
>
> greg k-h
