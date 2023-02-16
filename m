Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD98698EB2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 09:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjBPIak (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 03:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBPIaj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 03:30:39 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46330474D5
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 00:30:36 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id x71so1309240ybg.6
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aV6pFwE43CN4dem5vZuHJChCMbOrTxdF1BMzS4I5thA=;
        b=dR1ZtEmOP3odAC3bEPASdqgIl20IHPzHQkOUvMp1FM1Xp0ykjbimWSPFMMAdZYfYsc
         Di8B93AsFkX/IePgujBt2O9VlkPgcvH49pPV7Iuev9KbQzBveh9OsTjYce19tW69mi0s
         JXbM/InAUtEeDhyS7GnUzJV9aBz6QPTLzEvN/HhYNObLTmbCM7H7hk5qtKWummBqgYw3
         miSDQkMMFAQRHTbcdfk6YCrg/b9AMaslGt9Ku/rcaZ6QtJnnsixBlQfldyYRdH9ObS4S
         Sf6Qf9sO5zGJXX2Tg/0nX/RP8gJySxhw+Te2H+QW+mo7vbG0l5uG0bjn5B383eQ6fFAA
         l11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aV6pFwE43CN4dem5vZuHJChCMbOrTxdF1BMzS4I5thA=;
        b=G2bVwjvNgBS6cBqIfNpWPwoTS5OTCy0mAT79tUnx3IHRQm/zLwnR5/EZriGDgEvms2
         HqYHVlwAhEAJGA1op5vNjPHQWx9L1iKqCqY57uBYtQggoCRg99sIn6Bcw0tCi+vQBSSQ
         bt99wK57BRmAsgwGQJ+HT9KddDdK+6eMPZtjAsbSOo7ow1AITn4klKUDN8vGMUlfVmtg
         lAcOuF4Y1eTpMyof9GbWlmqB36JKyuEsYUINJZAddqiOAKAvGtsjMB+UEo5xetamkH3I
         w75PyyXBnicV5S+3CBn81SFblk2Rqotl2q8TTZQqdBwJsvnUSIr6p0ADeDffo6DEUg7S
         qjxQ==
X-Gm-Message-State: AO0yUKWQxcAVlr3Df6V5vLKYgA+T/8LYnLoLPWHWZ1XYtOv0ljHEgimT
        tH1dcg60nkowipeR5+J2ymqxhici7ohLJoje+c1BlA==
X-Google-Smtp-Source: AK7set9aQOLKtH9O2Hal4NZyH6uriEKubDXvZj7QxBF6mwF4swlyoOv+TuQfEhquM0RKsldDD3QIpRo515xgRrsb59c=
X-Received: by 2002:a25:9983:0:b0:883:cf5:1553 with SMTP id
 p3-20020a259983000000b008830cf51553mr517453ybo.28.1676536235470; Thu, 16 Feb
 2023 00:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20230120154437.22025-1-andriy.shevchenko@linux.intel.com>
 <20230120154437.22025-4-andriy.shevchenko@linux.intel.com> <736566bd-b8bc-07d0-bb07-b8abb8bc09eb@wanadoo.fr>
In-Reply-To: <736566bd-b8bc-07d0-bb07-b8abb8bc09eb@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 09:30:23 +0100
Message-ID: <CACRpkdYVbMiwWyQtTGezZcZ5UaRL=hy1y5FNHTTkYWQDCySE=Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] usb: fotg210: Switch to use dev_err_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 16, 2023 at 9:07 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> > -     dev_err(dev, "init %s fail, %d\n", dev_name(dev), retval);
> > -     return retval;
> > +     return dev_err_probe(dev, retval, "init %s fail\n", dev_name(dev));
>
> Hi,
> the patch is already applied, but is dev_name(dev) needed here?

Not really but it's not a big deal either, it's just a string.
Feel free to send an incremental patch dropping it :)

Yours,
Linus Walleij
