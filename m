Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0F9400059
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhICNUp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 09:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhICNUo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 09:20:44 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AB3C061575
        for <linux-usb@vger.kernel.org>; Fri,  3 Sep 2021 06:19:44 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c10so5673847qko.11
        for <linux-usb@vger.kernel.org>; Fri, 03 Sep 2021 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9dFzYNdI8HKKuKZIeTuvv4RfoELRKtn5jipnDxs2AEY=;
        b=GStNIZdO9Gro+pvjEvlpk0+5hOz7vxFV3OShnV8ExWjhuL/FhoIDyNmqV5aA5dTf6X
         OUResW6FqXeXkzZ21l5D9Pfu6zqvrXhMGpK9I91nhbTaXT2ofM8aNVFGm6IwKTJgqNcc
         p5SRvuUtDJVxnC9MyIKeuNpq8e+exYyGgWJWggXHLy9/bpPn7TUE6pBeQipAlMrnOEHE
         TcLwzuHo7rf94B9+wUL6XGzuigB71UrqANKFQlToR2asei/QlDI5rfvMn5Da6dYWMfPP
         KpIEHs2F3XwE+5Bd6X9ul1BsRDsIG9r9ngb3i62uNQKw3FurPO1LIW93DdFVyGSGqzH2
         F75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dFzYNdI8HKKuKZIeTuvv4RfoELRKtn5jipnDxs2AEY=;
        b=CwmLJsUmkwJpi7EGlIxacFUP32pnBsnGZw//DshoyUwotaoICdukQ3T3e/JR69+ZIJ
         suBXgWUhWBJMPLIEoEOsBBKb4+NizS9q9glEtO0pXsDQ20yyd4ALjhDPoTsLt1lWauo5
         0mfEy1wcGjYftRf7n069odBlTRurp5Nl3HSD1Pi4XAsuSqFM7Ol13G2aLlbSq8EwPsIF
         UmPjNW2JJJfh2IJvctgheaSwiVaDYDzcsec4uLvA2KhD7e2CW19yQp0954EnzBBI7F5B
         askEl+IEbLWtraanHmlmUWiwjHXGrndxZWwczoewdFq7zWSfTpdIbzus2MTcLLc7X1oR
         APYw==
X-Gm-Message-State: AOAM533ljJQOur+BcCQoypFpDAczmCp3zRA4uDOCVX0isvjbHVT95NDY
        NjG6WQuoA+z9YsJIWw87Wk6fzva54+PZ51PdIGDOINDnJWg=
X-Google-Smtp-Source: ABdhPJw3pyxsb3+mdZlBoRf2OpCGVqVcpGPmK6L+f9bZ6waFBvoQlt+QlT7LPC4aVX3fr/hfN+Mi3OzMKCtyXNodnwg=
X-Received: by 2002:a05:620a:1655:: with SMTP id c21mr3366408qko.187.1630675183669;
 Fri, 03 Sep 2021 06:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210903123913.1086513-1-c.lobrano@gmail.com>
In-Reply-To: <20210903123913.1086513-1-c.lobrano@gmail.com>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Fri, 3 Sep 2021 15:20:09 +0200
Message-ID: <CAGRyCJH_Fe09RpMcbV3bMbxqzN+rwaKz1hDRWg5TWvp3wHjDww@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: option: add Telit LN920 compositions
To:     carlo <c.lobrano@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno ven 3 set 2021 alle ore 15:10 carlo <c.lobrano@gmail.com> ha scritto:
>
> From: Carlo Lobrano <c.lobrano@gmail.com>
>
> This patch adds the following Telit LN920 compositions:
>
> 0x1060: tty, adb, rmnet, tty, tty, tty, tty
> 0x1061: tty, adb, mbim, tty, tty, tty, tty
> 0x1062: rndis, tty, adb, tty, tty, tty, tty
> 0x1063: tty, adb, ecm, tty, tty, tty, tty
>
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>

Reviewed-by: Daniele Palmas <dnlplm@gmail.com>
