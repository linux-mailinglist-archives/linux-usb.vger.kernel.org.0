Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C929D591B24
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 16:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239428AbiHMOwT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Aug 2022 10:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237698AbiHMOwS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Aug 2022 10:52:18 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315B5BF74
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 07:52:17 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-324ec5a9e97so33417757b3.7
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qtmxrU1E0yT7/cy1QcCZ+CKYUh25XuzW8phItrvY/qM=;
        b=X4WFpCnvs9cZiTxfteQLn/74DTq7NtnuSJvOwlz9s9V2PRJBG3kokWlzunWX/rQA6G
         o3MgciQcLprVioHgw7h6I/YBEcAiSBTiQtQa8jLLeBFKFze5KbNZD7NfqfCoCikJqL3Y
         7F5YU4ga5ua0YqkXcIS5iaUKjkFTj86LOfieXllBKQLO4WjKeYgrdIfcdIGzbjjOFa+w
         u5kffXoMT6OSJjlRBwXP1EtgxWlc0xRwXMI2Ox+bZ8J8jNQBIf4Au/M0bIouxouBtAwy
         kmMu51iN6+nulD4lSw76ahoEq/E/UCiBmWpHMJxm9TyPw440cPJsdVVAg9mrYv9CmCIR
         xrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qtmxrU1E0yT7/cy1QcCZ+CKYUh25XuzW8phItrvY/qM=;
        b=JT+VtwNVLY8K26NosXMq57u8E3akXY4fJOnoYMUS1KrWY8lasX61QsP7bKsVpWbSxK
         2aTR9uBoATSY385v5/P2aEAT3S/dHtnEw1JiDf6kMja+qrhS/6ilQNVHxsEFpa7myd3L
         D1hRoHhMhWu2bpSX9pm5kuAJAZ1kCZhQQ1tDlbS12lbQSwtO1FMaNIcqBnhps5gpSDee
         a2k6SlgzbF+9pOQmA04uWeZxIygKTckdWtZbRF+TLxPIfKhLGKgKkFzY+xo4PhiNp28h
         fV+q7a8BnUiDOPwGAk4Rp05P/1DoS4KaQcXjuiv4+MpFxN84XdXc+bO7xBz2XKpGJU3j
         eOoA==
X-Gm-Message-State: ACgBeo2iM0SuLqB+7eGbddp6M7stXexmAY5vUobhsBK5/J8LssIzDMIM
        zG2I/5MK4t32kWjYO9BMAWN9hAkuoKBbgBms5Ys=
X-Google-Smtp-Source: AA6agR4DuZXGbk9MdPR7aaErRGDQZx1houCSJFx/oTV40qyKYx/6kVBQlBUDa08k3WgcJLuRVAm8zorxq9Oyc8DAW6A=
X-Received: by 2002:a0d:e881:0:b0:31f:3bff:2224 with SMTP id
 r123-20020a0de881000000b0031f3bff2224mr7773326ywe.302.1660402335884; Sat, 13
 Aug 2022 07:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
 <YvdPr0Hn5eOPehIm@kroah.com>
In-Reply-To: <YvdPr0Hn5eOPehIm@kroah.com>
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Sat, 13 Aug 2022 07:52:05 -0700
Message-ID: <CAJz5OpfDH3kJV5e9UqU6Tcw8NWHK5-iGFJHdkCGBzeNW-fCRUQ@mail.gmail.com>
Subject: Re: [BUG] usb: dwc2: split interrupt in transactions silently dropped
 due to driver latency
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm using a linux-socfpga altera (intel) patched kernel, and they
don't have a 5.19 kernel available.  In any case, nothing outside of
the dwc2 driver could possibly fix this problem.  Arguably, it is a
bug (or at least major deficiency) in the synopsis hardware, in that
it does not support reliably scheduling the complete splits.  Or you
could view it as a deficiency in the usb standard, in that it does not
consider error handling in the case where complete splits are late.

On Sat, Aug 13, 2022 at 12:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 12, 2022 at 09:37:29PM -0400, Frank Mori Hess wrote:
> > Also I should mention I am using an old kernel 5.4.13, but based on
> > inspection of the mainline master branch, this problem still exists in
> > current kernels.
>
> Loads of things have changed since 2019, please try the 5.19 kernel to
> see if it still has the same issue.
>
> thanks,
>
> greg k-h



-- 
Frank
