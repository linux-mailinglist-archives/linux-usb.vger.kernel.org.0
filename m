Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4D52AE662
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 03:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKC1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 21:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgKKC1G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 21:27:06 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F807C0613D1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 18:27:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f11so1097332lfs.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 18:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmn6G7kQ/KxG60kLYsaMIjbgg5mvOLdx4epTPmjZMjI=;
        b=l5k9Dx9ofMM+ACVyF/EqSZEzdqM2vWbL5eAAf8ORuOi6JYcI2IHiNklEjwGzdmqKdE
         yIZhGKKtLj7ZVyEL5yEInfvcI8I46keOZhq8eoh4e4n9liMAgwT3R1T/Q2JaX8qdo7+V
         jFGGeGK2Zgxoz14SOhddzEFXafxSJ6/NGuxyfZm26AA2W6QQEceUEPYJaV9BoU/9uIqQ
         FyWPctO213Ng5fx8MzMTopbwHseKaaMKz/YgF0bFXf0isBwj5dSlAxMg5BbGSm1lpcx+
         bKmnReNUfLa8arMtv2uDH+HwZRiQa3AS+khls6z7eBmDmJT0XZXjweI4ro22eSZMZVkN
         1ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmn6G7kQ/KxG60kLYsaMIjbgg5mvOLdx4epTPmjZMjI=;
        b=H1sPdfbJUfEHN18HlBqN1K1ZdhQZXopsc49Kzy/epupjwsPCz/e1htCKXcjdIy9vWw
         Dnvfk30FecmAh6gQPg+Hv+b1x9Ef7uWS2jq8R38Gkd10oAX7zmKQptg7lq3UH5PgD+8m
         2ocNJkV0s0nH2tFXRTcFFdJkROpBqPGx853GXmu+xnwyjVD6eftpWFEhRCRtfnPxCbcH
         OQT+mSUURFziUesD+e+KoMZMFZ4f2lX6e1kSysZ9vJj6uUucKp1o9UgkAgT6BG3zVPbm
         uGRmE+v63tDfw5pWgoSxeyzz5A4qsgTdONYNGIggts6JJVJdhgna7QSucPLWp2JZkmGJ
         3H8Q==
X-Gm-Message-State: AOAM5324c7g2T8Aqr0g2xLM2lw3dh/dwaAEHoKMLSJ9hcIisNHuAV0d3
        R0PzmXub1+CI+5gsKl6temDfwQxp4U2w/C62VKA=
X-Google-Smtp-Source: ABdhPJy2XBLvFsJmmfsT9G6m6jCJKEPO5Ud5/gRJHOh0uQonZ+zjQ/ZDXVaLBcTARcGC+kEFCBW+4rHAQiC5ZLR2xY4=
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr9321744lfg.251.1605061620152;
 Tue, 10 Nov 2020 18:27:00 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AMuRv5AZ2HOEgqzaPcbLeNXWajpTB40Dejs7gcsL=BhQ@mail.gmail.com>
 <20201111013711.GA14896@b29397-desktop>
In-Reply-To: <20201111013711.GA14896@b29397-desktop>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 10 Nov 2020 23:26:48 -0300
Message-ID: <CAOMZO5Aik9vSdQCMea5B7CAOs0UBzUgdDBiW9S9-o+_-isWKJQ@mail.gmail.com>
Subject: Re: chip idea: Crash on i.MX27
To:     Peter Chen <peter.chen@nxp.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>, Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Tue, Nov 10, 2020 at 10:37 PM Peter Chen <peter.chen@nxp.com> wrote:

> 0xf4424184 should be the virtual address for the register PORTSC. There are
> two possible reasons for this issue:
> - The PHY is not initialized correctly
> - The related clock has not opened correctly.

If you have a suggestion for a debug patch, I can give it a try.

Thanks
