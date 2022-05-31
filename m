Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF05F53956E
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 19:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346540AbiEaR0u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 13:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiEaR0t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 13:26:49 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07461117
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 10:26:48 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t5so18497356edc.2
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CuAIH/d+CNy1WfxRpJPOJHterOgDe4/um8X6G8iiMyk=;
        b=i7BIciSs8m91MKdHBWcJ5bM0gwP8T4Z9mss/v4IkDnAHWm/vaxJ38d17bwiilUuZUx
         P5bdHotLwvkUNEqjYcizkM+jmX6L+Jm3+GRm8I9OG4P2lecY4mMaCLJNaFu9f5IAMV9k
         dwdDt2gFePxkpl583j73tMzTdfgBnqKhIiVFaBRiCXyTkIKSJ/3kIAGlHceNNQNE2RVh
         fP/06P9vjuqFzlkjtjIfsGUp4Wuesc/Fle06t4hiWh07CNphfvI9goCcodDw+IpxUJ5b
         H3CNut/StLJ/kNFTIVkuIM3xTRpcjsss9I6licJW9jyydr6CIrauq6RzVuA4BpBqdy49
         KdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CuAIH/d+CNy1WfxRpJPOJHterOgDe4/um8X6G8iiMyk=;
        b=8HyP6D8JxaBvvNQP6NT41/Q/PfR8uIXC9OFSl5Zys+BLY8+P0UQGqu69sO7H4V4Sht
         8XM4cNjbHPkKZIE+sixb6Edwaz6PRPYPBScjr0CVqicn8pMEaZPTtY0K/fSFFnP33j1N
         n+d+z/w6SEl5t0VBh3CHmEcuupn1xZXVrTE537v5mKvmal9AvXsYPMwDXw9GzuD63RR9
         PAHGj1JnneXaqdahhf4Cdjj57yaFgawJD2UiT4xi6aSjAukI0fFZyBe5MoGaSijw5g/y
         BrL5KwDSq8ECiNTVSy/gdLXRWwvxrJdYc8C8HS1Wl77BGVBV+7TnMpCwx5dU6wCi31pm
         2iqA==
X-Gm-Message-State: AOAM532qUmc1Ws9cWuXhFsacBrdv1lkfAL+Z3Mw0O2bt46qeSdriKAQj
        QaipK8eYJwdlNl9fxgC1fmhG/u+2UWbeOi0qg/0=
X-Google-Smtp-Source: ABdhPJwWdJDoM/DiZtip3f/xE4zCg9QB3h9fXzNxECexKmuwXc7+ZE8WCFRyHoGXIYsDFOkmIaHJm6vZfCKVUL0YQds=
X-Received: by 2002:a05:6402:5193:b0:428:414d:e20d with SMTP id
 q19-20020a056402519300b00428414de20dmr65418582edd.173.1654018006963; Tue, 31
 May 2022 10:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102301.13435-1-c.lobrano@gmail.com>
In-Reply-To: <20220531102301.13435-1-c.lobrano@gmail.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Tue, 31 May 2022 19:26:35 +0200
Message-ID: <CAGRyCJEwpzLyCVwbE42CMrYtZGxwk_3VWa3C8BgsK-uwsjr+Mw@mail.gmail.com>
Subject: Re: [PATCH v3] USB: serial: option: Add Telit LE910Cx 0x1250 composition
To:     Carlo Lobrano <c.lobrano@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno mar 31 mag 2022 alle ore 12:23 Carlo Lobrano
<c.lobrano@gmail.com> ha scritto:
>
> Add support for the following Telit LE910Cx composition:
>
> 0x1250: rmnet, tty, tty, tty, tty
>
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>

Reviewed-by: Daniele Palmas <dnlplm@gmail.com>

Thanks,
Daniele

> ---
> v3: - fix subject prefix and modem name (s/LN910Cx/LE910Cx)
>     - more descriptive e-mail content
> v2: use RSVD in place of NCTRL for interface 0 (rmnet)
>
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 152ad882657d..cd9aa61ec801 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1275,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),    /* Telit LE910Cx (RNDIS) */
>           .driver_info = NCTRL(2) | RSVD(3) },
> +       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),    /* Telit LE910Cx (rmnet) */
> +         .driver_info = RSVD(0) },
>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
> --
> 2.25.1
>
