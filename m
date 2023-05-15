Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57845703EB5
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 22:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245402AbjEOUjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 16:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjEOUjI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 16:39:08 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A952D66
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 13:39:08 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2502346bea0so8299385a91.2
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684183147; x=1686775147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VnIlIKlgYtK2cK+0dhB1nFTXDfzrC4hKFVLUidauWQ=;
        b=4lEo7PiBFRrylrAWAv8CLnPJVHW8HCY0TI0xbb3qciNDlGiv5aV83Vku9oMZe6ckdD
         2BZLis1r43qAZyku0rmm2m1whIY587nZsxZpedIZZqqEDbF8XQ1Qz+faKVaumUxM3iPw
         jJDDF+l2/WTT3r+9lskPZZfCA+4bnbaMJM6x/2/RnhCo1MHeT2nKghzA56ztbMHHQo0I
         0Rvr92MWC6nVEnVWXrdzNA6oTj9XAxpKAF3cvSwazzGonfSdwJExkJlYvyYdB6GeWq5j
         ssnL6oNBJq7I6fKHsHb2loOIMs9OKHnxOYFUA0Kj3Y0sp0/Vlrb198e4dQ5kYEwOGaTI
         m5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684183147; x=1686775147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VnIlIKlgYtK2cK+0dhB1nFTXDfzrC4hKFVLUidauWQ=;
        b=Vre0Ty6Akj00CYZUH7R27kCs9sZ4BHQPCo7vHlRPoudCzq8GGjxIGKiV7pNt8mfAzi
         ylU6mToyF9btFfVJ9RuNL0TczD41w0tATa6pa5RlvNuwZtZIj9gqxdIVHKHJbuz7Q9jz
         rOx5SjKQyjpSZQxt5qR9b+FaUvZ6uNIkauTzPT/RGr72HwMl3IPvGtrGFloQRY3lIqnB
         7cQ3ZFyBsiKnBJS/1eQlvSlD3fTp91F9RQ2x/cC0F3ITiigSR09cl2lLvaUkcHesvn7r
         Ibal0yByOdbPU2Us+NazUQ3SvwbQdexjkYKUJUAkdDNUU57qBdv9rd1aXyCdVcJpVgs3
         fEFA==
X-Gm-Message-State: AC+VfDwScC8VSS/s2yCILDQJJg4kV9XOqWchjL6ILejyky5NRELwX21s
        m0vVMoHzoCqOlyvRz40VH/IYD/rRYpbj/rHm72mYEQl4L4HH9gdLhG8=
X-Google-Smtp-Source: ACHHUZ4ifykc1+tBQypDNvbOXYPO6HKpgor4vVWAxDkB3OBtzFJShON/PwlC6C4drmtuMCyBjdYMFGeDGxZuyk5BY4w=
X-Received: by 2002:a17:90b:384b:b0:252:c3b7:6689 with SMTP id
 nl11-20020a17090b384b00b00252c3b76689mr10261495pjb.49.1684183147398; Mon, 15
 May 2023 13:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com>
 <ZF4bMptC3Lf2Hnee@gerhold.net> <13285014.O9o76ZdvQC@z3ntu.xyz> <ZF5evXbOXhWFoaus@francesco-nb.int.toradex.com>
In-Reply-To: <ZF5evXbOXhWFoaus@francesco-nb.int.toradex.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 15 May 2023 13:38:30 -0700
Message-ID: <CAPTae5+uv3ZJaF7kAdkCzGnTgz3LzoCsT97_Mtv10+5kaEXrQA@mail.gmail.com>
Subject: Re: USB gadget regression on v6.4-rc1 and v6.1.28
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Stephan Gerhold <stephan@gerhold.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, stable@vger.kernel.org,
        francesco.dolcini@toradex.com, liu.ming50@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

Thanks for reporting !
Do you see the system to crash (or) wait indefinitely for the gadget
being pulled up ?
Is it possible to get the stack trace ?

Thanks,
Badhri





On Fri, May 12, 2023 at 8:44=E2=80=AFAM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> On Fri, May 12, 2023 at 05:42:03PM +0200, Luca Weiss wrote:
> > to confirm I'm seeing the same issue on Qualcomm MSM8974 and MSM8226 bo=
ards.
> > Reverting the patches Stephan mentioned makes it work again on v6.4-rc1=
.
>
> https://lore.kernel.org/all/20230512131435.205464-1-francesco@dolcini.it/
>
