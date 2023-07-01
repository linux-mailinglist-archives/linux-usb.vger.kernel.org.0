Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAEB74466C
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jul 2023 05:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjGADvt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 23:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjGADuR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 23:50:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CA92D62
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 20:48:33 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so307571566b.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 20:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688183312; x=1690775312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTlSFnTSPWWpEyKJeqe0kZE+GXDl+QVUEIZoWHP0yK4=;
        b=ff1VZIkeMsptr0J2umV7Uk/Eq+54JuPAUaU5R0VlbAxrNuRKZzfJcDeZoIrHFxuZtI
         ckKH6+HbEyPZXRCkcAXWqxw6YQFW5ZCPQ9mku2m4jPdXrs7K3+VNuwEBAtinA0Bhs+8c
         ff/k06P5MPMwabuk07KC8jvK/mzLUEao9H4/m7jp4hmdWW006C1IBVgzRjsM+tZGCHeO
         5C34XDCQAzRc6pw6Y/O3pipz28XO2aaCEfKEzaBp7AE1g7/1cYjzk8wHjZlSE8Irfu99
         RukWboJCeD0QmYE76D78PGg6huHJKi6sRfgQok0MfBUs1oyrBxyCczGVbTywE0QYwdHq
         AMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688183312; x=1690775312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTlSFnTSPWWpEyKJeqe0kZE+GXDl+QVUEIZoWHP0yK4=;
        b=Pvv+tISGwcGi4EGWGkXLHDDmKouJ3pFHyXR16RCSTAtvl30P5hf0NV9YPA2wIIHVYs
         LPOtZjOtYUFzmW3mDAEldcXJFjvdQIQJxgaAvug/2xd+tm4BT4u1Wzrz972xu3nJni05
         CSgfdPlHrGEFrnpFDcGNBNUB2ZNpt4xKZVAPJgJEcRx8JdGG/4vLfr0IG43gCYz9r4Pz
         2sYZmJpy4IPHp4kOiGvEMYWoOHZo9vRTyrWPd1GCGfZicDJbzcf3S22PF9Fn9v7V3Uvz
         nAv6wDZYPATfclM1LzU9dueZcao8V888CTCk5VN3k7k5j51D9BsWxpmNBTa5aqRJbIAO
         RVYA==
X-Gm-Message-State: ABy/qLbRRi7zGmNCQDghGOqNnqH6Y/ffRfOdEiYzUPmA9RhYe9588vAK
        UHYz3yMkU1eFMZuPyoldE1qep1Osuy3AaNHjuYO/t1OhQMAZJSaF
X-Google-Smtp-Source: APBJJlEHynAm8CDTMe20agdxQjPYKB5cThIPe3BvWVZLNx6MH1Sbuz+Ow8H+fl3JYaelEjsDV7kXAFrJy/NP+sO0lc0=
X-Received: by 2002:a17:906:eb15:b0:991:e3c4:c135 with SMTP id
 mb21-20020a170906eb1500b00991e3c4c135mr3192837ejb.9.1688183312066; Fri, 30
 Jun 2023 20:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110401.2360746-1-yguoaz@gmail.com> <2023063013-fanning-crafty-4502@gregkh>
 <CAM7=BFoyE8XzS8g=U_wFH_AUE-W6C2tGKWzGP4+eCZTDVDgr_g@mail.gmail.com> <2023063027-repackage-partake-aa3e@gregkh>
In-Reply-To: <2023063027-repackage-partake-aa3e@gregkh>
From:   yguoaz <yguoaz@gmail.com>
Date:   Sat, 1 Jul 2023 11:48:20 +0800
Message-ID: <CAM7=BFo1ytynUBi2Eb2pxXcz-zbNoKPefkh6EfGBJPU+g65BCA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: configfs: Prevent buffer overrun in usb_string_copy
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     dan.scally@ideasonboard.com, andriy.shevchenko@linux.intel.com,
        frank.li@nxp.com, christophe.jaillet@wanadoo.fr, jgilab@gmail.com,
        chanh@os.amperecomputing.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Have done some testing. This issue cannot happen due to the protection
in `configfs_write_iter()`:

len =3D fill_write_buffer(buffer, from);
if (len > 0)
  len =3D flush_write_buffer(file, buffer, len);

Thanks for your patience,
Yiyuan

On Sat, Jul 1, 2023 at 3:48=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 30, 2023 at 09:13:58PM +0800, yguoaz wrote:
> > This is an underrun issue found by a static analysis tool (under
> > research).
>
> Then you MUST follow our research rules in order to submit patches.
> Please read and follow them, otherwise we have to reject all of your
> submissions.
>
> > I suggest the patch because the code of usb_string_copy()
> > rejects strings with length greater than USB_MAX_STRING_LEN,
> > indicating a possibility for the input string `s` to contain unwanted
> > data (e.g., being empty). For the empty string case, the proposed
> > patch simply copies '\0' in `strcpy(str, s)` without touching index -1
> > of `str`.
> >
> > Whether `strlen(s)` could ever be zero in reality is up to the
> > maintainer's judgement, since I have not worked with the subsystem. So
> > please ignore the patch if it is ensured that `s` must be non-empty.
>
> Test it and see!
>
> good luck,
>
> greg k-h
