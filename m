Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8CA2FCF68
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 13:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbhATLYk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 06:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731037AbhATKFV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 05:05:21 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8800AC0613CF
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 02:04:40 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id d81so30557093iof.3
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1x1DNnE2tmguD//mZOuWvz3mKIik8+ReShmCCkMxJPg=;
        b=vOaQe2FJITlcZJobI1lcdZ2oifntBqUUxmvmDwD2+70GiSg80LuRavNbkVR4xTlJB5
         HkmFVKYGb9UL0NEMHF4pM9oMx3hfzzR66xvyBwqiuttgAPmgnUmxb4gSR99x76JTNg6Y
         0iZeTrSo6Ew+Nn6/uyYwDN5Mptk7SyQFecxE/UFUjqpmOt+PA48kPMZwgomvqHMrVOP3
         01TxB7j+NH4tRGWtufzMDcJGx/WbGgoQEwBTp3d9SdNKesrTQC6m6ek27xOcGry5ONkI
         4L8GTpjQ+5Vh17KfFJXfYK/5tV+sEW+D9qb9mx94sD5tl1f3CGHQTK386qlBws8uVAdK
         4R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1x1DNnE2tmguD//mZOuWvz3mKIik8+ReShmCCkMxJPg=;
        b=AkJ0V2hyu35btjbdio0ZoXvwYXOncgbF+krR5pvUxl6ppyb5uDdKaEifvJx/S9ugUW
         iI//RKw5JnwwIxAcpuFt4Xsb/11qbhq7GWlIJ1d3pcSwxwKFJkmeYbsY2PusxGvdJuSb
         ST2jY2PVLEyHBgBV46aSeZoxlM69JXXdBzL/TEeuArqEc1K7rSIClUc6SETsEhJcf3kP
         m4EfYGE6DiNZmqfIllC+K89rHmvFM897m8ZGutMoPojbh/zC10aZqzNk35gMZgPfJxpP
         DR26vEQgmBPZOFx6wvZHuSfX4xaXSU2Td5FCJ3nsCZQ1T9zS94R38auJf5d/rVppZsXT
         APvA==
X-Gm-Message-State: AOAM530CGhrE4grxWI/ueTynHLxtmqiKiTbxJHmnsYXocTiNvI1Wj0wv
        Mnoez53kuJjPCoKrNZDWsc6YGWxfvHm25kPXUJwNKQ==
X-Google-Smtp-Source: ABdhPJyiec6rsJjOmlleiEJnWE+gm+rYerW942cFcdQ7OxN+oRRXKKjz/E4+amu2LBkxWlI1M74QCgrJBJYzZywiPXw=
X-Received: by 2002:a05:6e02:1566:: with SMTP id k6mr7069593ilu.19.1611137079553;
 Wed, 20 Jan 2021 02:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20210119101044.1637023-1-howardyen@google.com> <af91bbf1-6731-3e87-4086-de0dbba22c22@intel.com>
In-Reply-To: <af91bbf1-6731-3e87-4086-de0dbba22c22@intel.com>
From:   Howard Yen <howardyen@google.com>
Date:   Wed, 20 Jan 2021 18:04:28 +0800
Message-ID: <CAJDAHvbTY3Z_bRg+++uLefWSvCWo_nGq+3OOQX3QHJ2w3X1SQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] add xhci hooks for USB offload
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 19, 2021 at 8:47 PM Mathias Nyman <mathias.nyman@intel.com> wrote:
>
> On 19.1.2021 12.10, Howard Yen wrote:
> > To let the xhci driver support USB offload, add hooks for vendor to have
> > customized behavior for the initialization, memory allocation, irq work, and
> > device context synchronization. Detail is in each patch commit message.
>
> Is this related to the usb audio sideband capability that was added to the xHCI specification?
> If yes, then we should probably implement the generic parts first, and then add
> the vendor specific hooks.
>
> -Mathias
>
>

This is for offloading, no matter what type of offloading.
I made the hooks generically and can be used for usb audio on the xhci
which is not including the usb audio sideband capability.


- Howard
