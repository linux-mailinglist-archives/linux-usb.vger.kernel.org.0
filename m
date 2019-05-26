Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB1C2A94B
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2019 12:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfEZKpF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 May 2019 06:45:05 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:54698 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfEZKpF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 May 2019 06:45:05 -0400
Received: by mail-it1-f196.google.com with SMTP id h20so22657421itk.4
        for <linux-usb@vger.kernel.org>; Sun, 26 May 2019 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fy8gWLtD7tKjEdQdS509f8xv6me4+FFE+am99zi0rI=;
        b=a9T0uzguTnCnlhbkVr9UzT4r+8a/gTzmLzrFtP+7rrJKD0GnyENIvYyb3qEgETGKpB
         kwAbe9XChuchkowsduTR1dAo0trFNQXTS/Xt3miMRBgXVWUxbrGIRu5S6SzF2Zp8rYtJ
         Q/5fzSrUIMOnQTHQKcQ4E4GdjcqBZP4nSZBkXFrq5fksfN2DlTkwLI/Oh71aCK1f5RzO
         wpjy1LCO19MzSSZg/UDYHj9q4CC+KT7fLegE5FFHyqH17w0xA+Otl/y0GjqR0x85TH3x
         B4kEnJXhGdhPQQbzgWjbtUhF4kTztoPlsNmEXu3C83LwSDN68y/4OYk7HjmDkHRbiLKV
         QOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fy8gWLtD7tKjEdQdS509f8xv6me4+FFE+am99zi0rI=;
        b=QT/KyVhi2ZXB+/8VRwiapV1YDG8VOQvdKpCOIO4+E95sfPib/hoy9EUBf3a/HHCyuC
         3BRVxZx965Go7icycklnh6FnuJjh2/zw+N47QahR4kJFsS0YiaWRaKuW/4Ha6piuie+H
         rO1w0nx3M9uM+wYX9mmkV4O4M6ryBYpJozGkwxZA/zg3P2F40Lm1vdwMrqruq6MbfyND
         7dNLUc9GJSFGoDO5cqZrj+lX5pRQbX3TJ1mYjvGLk0CHPSx0KUH1DN1cTlWbeIklSQfF
         ZaLCeQs/4bW99vpysFIqpo+pJJLcB91EzHaXw8APrk9KHT0SGx7x1X4s5hLqbKsuuRQL
         pk+Q==
X-Gm-Message-State: APjAAAXoJwutkY9TswXfs6jhI0OWHNw+o8/R7AAvJPr/AmZiKspctR7e
        ivdz7LB4FsSf5jqP3jVuNMkXQwAWsyK0+7OA4OvlLOyv
X-Google-Smtp-Source: APXvYqz2GtYqwV2gwx+x0jxW5tmL1/nj2VLboXOndK+rGxzpVZjRwA8eUxvDTQsBObSIdpahkPn5eM6c1BpsaEuFgc8=
X-Received: by 2002:a24:29cd:: with SMTP id p196mr26570376itp.116.1558867504370;
 Sun, 26 May 2019 03:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net>
In-Reply-To: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net>
From:   =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Date:   Sun, 26 May 2019 13:44:28 +0300
Message-ID: <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
Subject: Re: usb: dwc2: RODATA_FULL_DEFAULT_ENABLED causes kernel oops
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will.deacon@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 26 May 2019 at 13:11, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi,
>
> i want to remind about an issue which was originally reported by Wayne
> Piekarski [1]. I'm able to reproduce this oops with Mainline Linux 5.0.2
> on a Raspberry Pi 3B+ (arm64/defconfig) and according to Jan Kratochvil
> [2] this applies to 5.1.0 and 5.2.0.
>
> The crash is reproducible since commit c55191e96ca ("arm64: mm: apply
> r/o permissions of VM areas to its linear alias as well"), but the root
> cause of the crash was introduced much earlier with commit 56406e017a88
> ("usb: dwc2: Fix DMA alignment to start at allocated boundary").
>
> I tested successfully the following workarounds with the RPi 3B+:
>
> 1) Disable RODATA_FULL_DEFAULT_ENABLED
>
> 2) revert commit 56406e017a88 ("usb: dwc2: Fix DMA alignment to start at
> allocated boundary")
>
> It would be nice if someone can come up with a proper solution.
>
> Regards
> Stefan
>
> [1] - https://marc.info/?l=linux-usb&m=155440243702650&w=2
> [2] - https://bugzilla.kernel.org/show_bug.cgi?id=203149
>

Hello.

This is just a shot in the dark but have you tried to apply DMA cache
alignment issue fix [1] as a third workaround alternative?
If it helps the fix should be merged upstream.

[1] - https://patchwork.kernel.org/patch/10817377/

Br,
-- 
Antti
