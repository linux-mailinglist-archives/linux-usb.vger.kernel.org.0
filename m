Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A15219F9D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 14:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgGIMHm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 08:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgGIMHl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 08:07:41 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55F3C061A0B
        for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2020 05:07:41 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 72so1524505otc.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 05:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6YVhql+Tlfr4x6XACha1ASeO8VabPyayb4LQ4NqmbGQ=;
        b=fD4U3RdtPfS8XRv98aKV7u767khDT+SogF83GwYHLGpig8L33f229GvkpyrNB4XfRU
         mtZbs2MGYh8lGO75FxSlzMll+L+tcwYcFGxJdZWt9lNI9/cuowoBUQkHXnvk7ZINaYnJ
         wNdgV8Btpjlkt0zwQeORA49fdA9dwwoUzXXPUH39i0LwyDv6UBsA9Ge95Ezx+aS1Q3xV
         NNlgltagaVL/C+g1fIUb5yBsbLYbLCAu3mGcDvoW59eug7J75XACojChj4njXXy9YKex
         +EiTgIuTP5k5DtPzOPxNcbS1KkyYNWbk3T9pETd93hNXKt8zL19bs6CMpb3KM6AplNHW
         Matw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6YVhql+Tlfr4x6XACha1ASeO8VabPyayb4LQ4NqmbGQ=;
        b=fGUu97eeGoSWFjIs4MA9fq66Mtl8S3I+FchS7jU0qxhKtuH/EQjNmmvaTVZJh588jX
         xGYiBzFbPYDP57o9WhnjKUtIfIAW2/kMzST25oE4Oa3auIvlyNSUgKNRoFSpyXUgbVUi
         8Cita9OLTQW1lOLIrnfhwt2cW6v6VxL2sJKQyrLQ+/YtHrwgLjjcGrX+G3d3d2kKlxEG
         S29tFwl9Mn+KENcofKeV3M0/t0YOuNm7NYuyUG68x1VmWr70AcY1qlQ2AnWdPAs+dab6
         MlS483JdSJwemktN16lbfr6AXnx88DKKzVph4ubvWyd9CLEIHE/poHGXgwrtcaQR5SaD
         tb/g==
X-Gm-Message-State: AOAM532Y2WGkEIqdV3zhf2PEeVu8EpPfLt1cgN74jhVahJ8TU8LID9d5
        JUiv3UZxPhBC1mdn7L96Q2jGkERF7kNov7O94s0=
X-Google-Smtp-Source: ABdhPJyaUMCNQFI7isE6KYQNY8g3NJvTaK4vNKxGwUcE2Ep5shu6SAfGqzHY10Rd9r5ft7caipkKQ+RgMAbLiFiAT/w=
X-Received: by 2002:a9d:d2a:: with SMTP id 39mr40392999oti.190.1594296461209;
 Thu, 09 Jul 2020 05:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200703134903.5695-1-ruslan.bilovol@gmail.com> <87r1tl6vn0.fsf@kernel.org>
In-Reply-To: <87r1tl6vn0.fsf@kernel.org>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Thu, 9 Jul 2020 15:07:30 +0300
Message-ID: <CAB=otbT5x5qoPedo854b0e-+Tcw1+i7UsJ6kbBBQRPrSMMtsfA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linux USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 9, 2020 at 9:38 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Ruslan Bilovol <ruslan.bilovol@gmail.com> writes:
>
> > As per UAC2 spec (ch. 4.7.2), wTotalLength of AC Interface
> > Header Descriptor "includes the combined length of this
> > descriptor header and all Clock Source, Unit and Terminal
> > descriptors."
> >
> > Thus add its size to its wTotalLength.
> >
> > Also after recent changes wTotalLength is calculated
> > dynamically, update static definition of uac2_ac_header_descriptor
> > accordingly
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>
> Missing a Fixes tag here.

The issue is present since this driver introduction in 2012 in the
commit 132fcb460839 "usb: gadget: Add Audio Class 2.0 Driver",
but in older version of the driver it should be fixed in the
uac2_ac_header_descriptor structure initialization

Should I resend this patch or you'll add this tag to the commit message
by yourself:
Fixes: 132fcb460839 ("usb: gadget: Add Audio Class 2.0 Driver")

Thanks,
Ruslan
