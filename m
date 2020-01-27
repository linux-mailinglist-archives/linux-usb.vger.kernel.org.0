Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 281FF14A728
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 16:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgA0P0L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 10:26:11 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44317 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729321AbgA0P0K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 10:26:10 -0500
Received: by mail-qk1-f193.google.com with SMTP id v195so9920263qkb.11;
        Mon, 27 Jan 2020 07:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5tTERXc24SbVitg6xNzcYxUuuAPTVEFl1xDNy1GGDo=;
        b=sfl7dQzVAUi3OV8GAxoBiUM3regkNgsyLLNj8FlKVKrcoNXp7HV6uoDXJUNzgZMiRQ
         uFBMJR3AlxAM1Vw83MKSCep3Q3V3SzS6nNPle3qMWYipGB2b5Q7fGUGa556IeLWC2aJF
         l4AyKgwJ2SEeQ+WM5hIuNWx+792PDZRLnSQOUpD1ejsN8Qbn6SEfdHTzmCaIPIPzGrN4
         GGtZSCNgTlxXeIW4W9FS742fMthxrGo4EuGgX9YKOIsXQ3cl761W3aNqQxmW2CBnN8if
         9AIlvs9OA7FDR5kz8YGKpFAT7xPqDYhjQsHJamOmUdcFLagklGiurULV1fRd+OelAWpz
         /1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5tTERXc24SbVitg6xNzcYxUuuAPTVEFl1xDNy1GGDo=;
        b=fKF0h2vwyDF0CkPSiF1xNCPitkJCEm1ftWGJJZe6/II1s3NsJXb2j7/22p4Gpl/h/m
         /QbI5+h/FEQCh8iMoX+apbnV5dhmtgNRl7qdqltLjOai3gxR5v/8hoGs9/VgSf+kafuh
         /zcC2KVBTeyWUGOUqRYzB2Nwse3ISP/txKTfMkQlHqw2KDjBsX0JRQoWhYWnN2txmE/v
         Tnx17xSsZq2SKpwgZwdXPlNp/P3rzpA8dpyjsKH41w3K/XpCQYbszkhC/aWBbfDyzEQZ
         cm5yw/xQlGxNQlhwpHZU45nLsOPJWi0fdemLiF4e4TCyTvUb8rB3PJBZqrUn1qu15A/x
         sVzg==
X-Gm-Message-State: APjAAAX5mDF75c15zD+AFP06XyuYWqK3Tlq8avOjzkn+KNpNnSAzD0WR
        Barj80RiukZoHLkMK7GA31LLoSanYSg20NqFH6s=
X-Google-Smtp-Source: APXvYqw8ITbxq5m4f5dYC/keJMppOJazV3Z6TxBrD0ijf60oNOfK4XvfeZDlhUIWTr0uSDeEfG3mmQ6/gnVBnJE5Ouw=
X-Received: by 2002:a05:620a:1324:: with SMTP id p4mr17301424qkj.497.1580138769708;
 Mon, 27 Jan 2020 07:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20200127023548.27107-1-pgwipeout@gmail.com> <20200127071758.GD279449@kroah.com>
In-Reply-To: <20200127071758.GD279449@kroah.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 27 Jan 2020 10:25:33 -0500
Message-ID: <CAMdYzYqctkfqhHN0-WDvX9kKdXH-AVir193SpcrR_t3K=VN=0w@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 27, 2020 at 2:18 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jan 26, 2020 at 09:35:48PM -0500, Peter Geis wrote:
> > The ci_hdrc_tegra driver does not currently support dual role mode, but
> > it does not explicitly prevent its use.
> > Certain devices support dual role mode, but not automatic role switch.
> > This can cause the device to lock up during initialization of the
> > driver.
> >
> > Detect this state by checking for the extcon phandle when dual role mode
> > is set to otg.
> > If it doesn't exist request the driver to only enable manual role
> > switching.
> >
> > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
>
> Please use 12 digits for kernel sha1 values, this should be:
> Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")

Understood, thank you.
I will ensure that is the case in the future.

>
> As proof of the need of this, just using the values you gave here causes
> git to complain:
>
> $ git show dfebb5f
> error: short SHA1 dfebb5f is ambiguous
> hint: The candidates are:
> hint:   dfebb5f43a78 commit 2017-08-16 - usb: chipidea: Add support for Tegra20/30/114/124
> hint:   dfebb5fec744 tree
> fatal: ambiguous argument 'dfebb5f': unknown revision or path not in the working tree.
>
> thanks,
>
> greg k-h
