Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B0C45F6AC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 22:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243243AbhKZV7q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 16:59:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhKZV5p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 16:57:45 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8A2C061574
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 13:54:32 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id e27so6815379vkd.4
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 13:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=E71VEuiHzWTiixi1CpnbKlAX/wONDtrDVFboXMRVZh8=;
        b=L9oC/hLiKF/rdFHkisgvDZLfGLzWW85f0a20boe8NmBAxzYMJ+1njt3ekdIsll6oBW
         99xwkq547PvI7s7FcoVzpxYqbFXo1P98LwyHgGJqWB7XfYWIEJyJyNxxB+4S7Q2LGIEC
         6EGCybcctTx2IEzgVaAYIQZKxr3mykrHtTrc8DN5HGDClpjxH5F1YAjSnOHYgEaSgepr
         05WSlAxhfkr9ueOsd7vySiFmGtzBuBNHhUT/aHmPaCu5BSc+U7hyZH6KLpUMsPMJNf2S
         bvXlBxVBsF/EIsGqYbFAPBgDv8zxwOvkGQ5C3n5fZBGqGE76D/4jisGFdgiuRJWMgPds
         FS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=E71VEuiHzWTiixi1CpnbKlAX/wONDtrDVFboXMRVZh8=;
        b=d7hnfs1RBzG8Q58fkXf2jYz8teiwgVkIPAjq/30TDialjTBgU/W+nqIcgYKJ7GFHmp
         jZh5oXWPzRbmCiMc0wt6Fj3TSetHX9F5vA6v37ojL+QJNdKltxwq5dda+FZQb361pe+T
         mtZBqR/UEYwDV+82TfDfTqJD/shFv6BjN/2qGucqE6OaKDvpRF/L8U0u6ECvKtPhj69L
         J7IxeJVJDMwiyT1wTwVND9aX2SL7MJBCAsTheW2sQYjHWoEA0VIMikestpJYQouQ6Rym
         2XfJWBRl45caN14AWRAvOF7NMURW4df/OcGT4it9jQ+9I6EJFKHqGzoY4blIiGLy19PA
         jYlA==
X-Gm-Message-State: AOAM533Eldyo9/gYkleEGzJp+QqqZIvO8TCkiS2ai40e6LxSBAU2lCod
        RnIdve6Z13tjgjl3kDjpPiMF/C+3ulBR6jvP7tQ=
X-Google-Smtp-Source: ABdhPJx2/lse6mEkSDINw+NL8L+aYxSQczHijcJvw9e1HVS053CJ8i6l4469MAOYhG1lKjdNBU1jsd73fcdJ+z/6Gmg=
X-Received: by 2002:a05:6122:b64:: with SMTP id h4mr23198021vkf.21.1637963671475;
 Fri, 26 Nov 2021 13:54:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:612c:1190:b0:23d:b395:8769 with HTTP; Fri, 26 Nov 2021
 13:54:30 -0800 (PST)
In-Reply-To: <CAHp75VfPQ7Oozzi2Mw46CoBz7WqVtXyCzx7-nFRevTMqOab9PQ@mail.gmail.com>
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
 <YZ3j9XKE0WjfkcsI@kroah.com> <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
 <YZ4QL5CARZAVnaEE@kroah.com> <CAA=hcWQ-Tr5Sn9mmpBoK0Rs0Vgk2fM3X5DaWwXT_dLJWd8ZiGA@mail.gmail.com>
 <CAHp75VfPQ7Oozzi2Mw46CoBz7WqVtXyCzx7-nFRevTMqOab9PQ@mail.gmail.com>
From:   Jupiter <jupiter.hce@gmail.com>
Date:   Sat, 27 Nov 2021 08:54:30 +1100
Message-ID: <CAA=hcWSW4Di6tCw332e8h6MTRAgFEbyx_TDqjW4orw7VuuS3CA@mail.gmail.com>
Subject: Re: Kernel 5.10 USB issues
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> But do you actually _build and run_ kernel each time after running
> `git bisect {good,bad}`? It looks like you simply typed it in a row.
> Also there is a subcommand to `git bisect` which prints log in
> reproducible format (someone else mey run it on their side and
> compare).

I was running `git bisect`, it could be the build issues, I am still
digging it further.

Thank you very much.

- jh
