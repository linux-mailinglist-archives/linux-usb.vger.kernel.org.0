Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0D227AF83
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 15:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI1N6n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 09:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgI1N6n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 09:58:43 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F06C061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 06:58:43 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id z26so1369402oih.12
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2RnYCr/aQtpgiyPDtosaMtL3MHe5ELCLnQZKgF5raQ=;
        b=MD++eIFe75eg7z8ODzF9Hu0m0+jBUro1D/Q5e6bn64E4KUW2Bd5C2ze27qHdjq88oE
         Wyv9ku6sq0/8qu2zcyJn5kL4cAIPybpV6XKmwLaTicF1rjRoZeS2+gdpgEIKiYVWJSeP
         o6KJA8AabStqhgMg0PJInPr3jvqaYpNlU+dIHvcHNQq33xrkijSlAq93xFst9z8fRKpT
         vdoSxWVmmKX+0sGStCUTcwEW8PrE9EhZAO6/2C1dAlNKMkEHaMZELn5mLKgxECk/AU18
         aQVClurnfxBcpUCcgmhC8cHlomAgOapIipA+W+2Bhlu80IAi1o2eJ4hZtySCE2UweQ9F
         7hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2RnYCr/aQtpgiyPDtosaMtL3MHe5ELCLnQZKgF5raQ=;
        b=RopOXRK2KtTqDACUVGFNnWJ1z32P/l9ilhh3G4Vba0Cpe28JSB+a0VMie3mhsNCpTU
         NanwAWDx3+oAvmglpaNMbistBXZuVrztENPHiCO5oM8fdovKPIavghuXtZUjZ749b6iN
         pYZ6Sj7wobH61B7qYV8Ok5h3aK9Y6saMRwEjc6m024b36iFzcMLiFtVgmzjolaRiJROz
         btApCTzwRrCfx8ndysqRObjPWgKWWS6L9YRjHWVF6exiZjGihx/WBRWpcjzEi3GJKoIV
         aZQdeic9ywP7dg92Vd+UUsLH5dMLFQ2VsWDDcuyKkPO1FcHDtepvudOqszWf/A5C9gk7
         U0cg==
X-Gm-Message-State: AOAM531O12e3nwStaiENF0cONMtCmWXnwTWBsvqeQih+jVN//CaNocfX
        3ZsCEFc3VIfqSFy4KEZCgKOzuqnC7aj+YB61VQ==
X-Google-Smtp-Source: ABdhPJxSHq9IMt7/r5OpxxuDlEHTs7ZZW4GX5CDvWhfkhQ9h87hn+zXZFNzThNZsjccbvwl9+X3dJPrdX2zcnihaah8=
X-Received: by 2002:aca:cf88:: with SMTP id f130mr883373oig.122.1601301522612;
 Mon, 28 Sep 2020 06:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
 <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
 <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com>
 <20200902152514.Horde.-6-I20fjCayIQgkkuxwk-o2@webmail.kiener-muenchen.de>
 <CAFSKS=P-kY=CJhbf_QCAPRJKrZQ1OR9FyrrMSzm-7Wm6BxSgYA@mail.gmail.com>
 <20200903165401.Horde.0plv-8-wrkSbaoSekydKWEy@webmail.kiener-muenchen.de> <20200922153317.Horde.kYfFgpOej2x7e8K3swKnHnz@webmail.kiener-muenchen.de>
In-Reply-To: <20200922153317.Horde.kYfFgpOej2x7e8K3swKnHnz@webmail.kiener-muenchen.de>
From:   George McCollister <george.mccollister@gmail.com>
Date:   Mon, 28 Sep 2020 08:58:30 -0500
Message-ID: <CAFSKS=MZrpiWxwge3uhN_zh+daLZEdp-PAyRgFLievbww2FLfg@mail.gmail.com>
Subject: Re: usbtmc: stb race condition introduced by 4f3c8d6eddc272b386464524235440a418ed2029
To:     guido@kiener-muenchen.de
Cc:     linux-usb@vger.kernel.org,
        Guido Kiener <guido.kiener@rohde-schwarz.com>,
        dpenkler@gmail.com, steve_bayless@keysight.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 10:33 AM <guido@kiener-muenchen.de> wrote:
>
>
> Hi George,
>
> We discussed some solutions to solve the race you found.
>
> Since we want to avoid future requests and compatibility problems
> regarding the SRQ and Status Byte, we will fix the current ioctl.
> Furthermore we add two ioctls which return the original status
> message and avoid assumptions about the USB488 subclass definition.
>
> We will have the 3 STB ioctls:
>
> 1) USBTMC488_IOCTL_READ_STB always reads the STB from the device and
> if the associated file descriptor has the srq_asserted bit set it ors
> in the RQS bit to the returned STB and clears the srq_asserted bit.
>
> Comment: This ioctl will return the latest status byte again, but will
> not loose the RQS bit sent by intermediate SRQ messages. This ioctl
> should be conform with 488.2 devices.
>
> 2) USBTMC_IOCTL_GET_STB always reads the STB from the device and returns
> the STB unmodified to the application. The srq_asserted bit is not changed.
>
> 3) USBTMC_IOCTL_GET_SRQ_STB if the associated file descriptor has the
> srq_asserted bit set it returns the STB originally sent in the device
> SRQ message and clears the srq_asserted bit otherwise it returns error
> code ENOMSG.
>
> Please let us know your feedback and comments.

Sounds great (and sorry for the late reply). This should allow for a
variety of reliable application and device implementations. I can't
think of anything else to add.

>
> Regards,
>
> Guido
>
>
