Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCB545F1D5
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 17:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhKZQ3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 11:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbhKZQ1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 11:27:43 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54641C0619EB
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 08:14:54 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w1so41060929edc.6
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNwpCfa5vdz5URKXoBoziS8DLa8q/pxzIVcRvP60W6o=;
        b=LBXbREg2GS+u3BqEAnE9+G2jlIGT0ooShjGgw5RvmMiAwLyOD9YAsSE0kVdXd01LHe
         ic5u+8hx8vmR4qi+4ZzZG4owjrUfyACtTyvAgu2i9uwiR5QjXDQWknNSOxJ0Xq4sP4ls
         svh/kQF/cxckLQ9mAOYoTf9Dxe1hI46Qo3hdjqQIKDyILjbX4oOm3X/CwSwMo9uJIFgb
         CkUcV4zZgHmY/ULr2zWaksDqoCCU1JYedZcEFK/tn4MUN3A/+i631vCDqSKceORC/fE0
         xOxqc7Xspv23hm7osxclmCgk1uKhNEDO99qzC/T5nGzVkDiTw69jvArE65eD/lQ885s8
         3Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNwpCfa5vdz5URKXoBoziS8DLa8q/pxzIVcRvP60W6o=;
        b=ltrFPPOFCs5779+a4gaR0tezmGiPtCTGXB6Tgil2uEhF3+SVmtsa+cZdHT0b/+JLOv
         L9t/ebgMV20exL/ID6spbN4b6D9UfCXo0d4SEQx1h4I0vct8J8+gbuIemSWJL3Y/QcwR
         r08++zjtQPmEiNJkAeLk1NZ4NJYTmTXKUA+7v+i3x0cMnq6gzjNcgCQGjCd6zsiyhCmy
         77P3KdfRFaI9VlDMWJTn1xEpN9pV4sD4r9zLZoAo6m0Wa26mmtru/+FCIIGV3x8hdNbD
         1EmlcZ7F5uEK5fjSi21PqcTRs6ugW9LL4cgW5kW/gF128iiQXKuZ5xpCJO+bH5Kj1KaB
         es6A==
X-Gm-Message-State: AOAM531gkp74aZNo9usOhTK5GRe4FCYjXEGBngcwmJlPjfWOoO0TzE7V
        neza7fVpn3A7YO+wpW0DatDN/+rJI0NN/Ha//3y4nDEPsBt9gw==
X-Google-Smtp-Source: ABdhPJyoOsT5yoaKQy81miA4H5WjwfmLOAWHxoCnlvKvigZYt1ztXqCCdC1cHDofBU+NEajsjI0BUczvkjxutknpMMI=
X-Received: by 2002:a50:d741:: with SMTP id i1mr48131098edj.37.1637943292861;
 Fri, 26 Nov 2021 08:14:52 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
 <YZ3j9XKE0WjfkcsI@kroah.com> <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
 <YZ4QL5CARZAVnaEE@kroah.com> <CAA=hcWQ-Tr5Sn9mmpBoK0Rs0Vgk2fM3X5DaWwXT_dLJWd8ZiGA@mail.gmail.com>
In-Reply-To: <CAA=hcWQ-Tr5Sn9mmpBoK0Rs0Vgk2fM3X5DaWwXT_dLJWd8ZiGA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 18:14:17 +0200
Message-ID: <CAHp75VfPQ7Oozzi2Mw46CoBz7WqVtXyCzx7-nFRevTMqOab9PQ@mail.gmail.com>
Subject: Re: Kernel 5.10 USB issues
To:     Jupiter <jupiter.hce@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 26, 2021 at 1:04 PM Jupiter <jupiter.hce@gmail.com> wrote:
>
> Hi Greg,
>
> Thanks for your patience, here is what I did. I thought I followed the
> instructions, any useful information?
>
> > Start working on the "master" branch and do:

But do you actually _build and run_ kernel each time after running
`git bisect {good,bad}`? It looks like you simply typed it in a row.
Also there is a subcommand to `git bisect` which prints log in
reproducible format (someone else mey run it on their side and
compare).

-- 
With Best Regards,
Andy Shevchenko
