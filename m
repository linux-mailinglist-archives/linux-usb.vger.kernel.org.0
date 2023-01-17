Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8064A66D940
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 10:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbjAQJFr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 04:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbjAQJDo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 04:03:44 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB48193DA
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 01:00:48 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 18so44060268edw.7
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NI10LlWiYdeHfpEZqL1lmcR2D8Sybx5E4NUlJpcgjew=;
        b=XS5fKglsTiB4ZIZCzQvCug0TIDpUBthNqixzvIOcvguQ7BXf0GrcAiM/5+CvqLYpUk
         dU0emxiG+dUOWFv1+SYHDKL5r5AyFOi0IK4cdQhIdSJgW1GSnrS61KLf8Mk7jp4X0fK6
         AqEqWXU8exKabBiC+6HclRVjRHV+XuZZArELrptHRp/9acH4tiBpOAFYlYglHOSW5Eyh
         0dTq1y+n8GdG/YewKpuuN7inMQGQgx0janOAvn6AVMgXeRnZbbPpOjMBdeIuVNzA/RW4
         VnlCr7dWrllKBFD4w+zl797c40wvWmyZZt5nBesA9OiOFZWNxo3LoQfIzK05AYnb5X9K
         1RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NI10LlWiYdeHfpEZqL1lmcR2D8Sybx5E4NUlJpcgjew=;
        b=x2cL/Z4JbaYkMtUysrhnYP/VKFn9JCuTpNjadu5irEItUcwmvcAZ3dXgQ4Qk7odJQ8
         Ad9pQjD9mqWUOvwXAsaAsxSKRv/g7ciw2qrAnyxiw0kOE7S8RlNNKxMYDN34jWvoxgCv
         zgw6y1ZgVaXDQFRkm4s3XLcgvLp0O01cVhYIvopJD7b7ruaWHP5ofQdBLtHSNWhflhsC
         BghZ11RDAfAGCROID3/SOqNaaDearCj280azo8FwH2EThHqbAEhsufgOyMLqls1cQhnl
         7dMwzkz/C54cg1e0zPwo5KvQhY5f6Rt8194tPciImwv3Gcqg0xl03kgFb6ZjhsHI0Tm8
         MNtQ==
X-Gm-Message-State: AFqh2kqH9A712c6Wriy9P0BZH5WDSYFYAi4GZWVjIXl+Swxja0lmmin3
        AHf4upnDlCTyWk0Wky0r+0I4cQS+lic6mKwT63g=
X-Google-Smtp-Source: AMrXdXtvQirzyWEcqZmMCecCeNH0NMpXjl0VddRInqPLZG+w5uxky9e8b2rN33zcOvlxXQ8YtEHTyuMMzgiOUmYpu7A=
X-Received: by 2002:a05:6402:1002:b0:49a:1676:4280 with SMTP id
 c2-20020a056402100200b0049a16764280mr233814edu.16.1673946046406; Tue, 17 Jan
 2023 01:00:46 -0800 (PST)
MIME-Version: 1.0
References: <2mw02fh6hzd-2mw3w8xfngq@nsmail7.0.0--kylin--1>
 <CAD14+f1p3j3WJUYshneH7A38b8JsiXjtScESB2uOQ-ZyBi57tg@mail.gmail.com>
 <CAD14+f1ebzviMF-pi0ryKU8cRPWp2BqV2dwiXOFjeM30eqrwOg@mail.gmail.com>
 <CAD14+f3De+0oPaq0hOo0D+siTvZDNnBXg7Qg6fKNDh63zVh8Lg@mail.gmail.com>
 <111d7b42-5e85-58f5-0645-66749e754673@suse.com> <CAD14+f3nHd3tSFwfpLkFfQOAAg8w9soRTf7F53Bj_UsCmN9+ow@mail.gmail.com>
 <d01fed62-dacd-b3a8-c138-73f6093f58ff@suse.com>
In-Reply-To: <d01fed62-dacd-b3a8-c138-73f6093f58ff@suse.com>
From:   Juhyung Park <qkrwngud825@gmail.com>
Date:   Tue, 17 Jan 2023 18:00:34 +0900
Message-ID: <CAD14+f2+U7ap_YCu+Cq8+UNxz--OxcEZE_oiJWqU7n8---u2JQ@mail.gmail.com>
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

On Tue, Jan 17, 2023 at 5:34 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
>
> On 17.01.23 09:18, Juhyung Park wrote:
>
> Hi,
>
> > I'm not sure if this is worthy enough to write in the commit message,
> > let me know what you think.
> > Maybe link the relevant lore.kernel.org discussions directly into the
> > commit message?
>
> By any means. The patch is the best you can do. I see and appreciate it.
> It is still ugly. Yet, if there is no better way, so be it. But this
> needs an extensive justification in the change log.
> Please rather be wordier than you think necessary than too short.
>
> I'll ack it.

Thanks again for your input.

I've posted v2 here:
https://lore.kernel.org/all/20230117085154.123301-1-qkrwngud825@gmail.com/

I've added cc to stable as well, forgot that for v1.

Thanks, regards.

>
>         Regards
>                 Oliver
>
