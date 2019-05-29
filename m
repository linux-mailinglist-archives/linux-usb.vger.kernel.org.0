Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D5D2E47D
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2019 20:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfE2Sa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 May 2019 14:30:59 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42179 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2Sa7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 May 2019 14:30:59 -0400
Received: by mail-ua1-f65.google.com with SMTP id e9so1397434uar.9
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2019 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Icd3S6fysa6PQB1IvdBLYuy5pEg+pRKkO0zAPB11e+s=;
        b=h1/b3YNFUzwwTW33Zipxw/L27jtJJFS/uoN5p2DdHA3M3G0nsuslv5HtLyXAslZXBF
         YXAYkYJ+OdVsCg3Cs+bwX5YoW2csbYBr+38xCAWFrcpCvxMr33VPJrhXTHQcgYCjSgz1
         pXEoQmXGAOMsFQDNtFtHcRBZEmaeM3orpTlPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Icd3S6fysa6PQB1IvdBLYuy5pEg+pRKkO0zAPB11e+s=;
        b=DkOkU4v9FPbMkWsZn3IrKqepfFwE2vZqIrBqN+7pzaZJrhTYCK3DWGe/NabkKvnujp
         ujNxi2NWOjjTWUgWCLlAb3szxtDY32bG5HmuD/WWhB44IFE8+aKhWysXSCO6Iwb0giKQ
         84m5liPF5jZyTHXP+OLRSB7oHiskqPNY0zX6XeeuzmkaWJvSSMBZ/EBNY9YJYGNk3vHn
         7CqzI7fPjkW55WRQlEtk2r9aZa8j95T0ZFX0NSQjfqAqryn6S1yHGcaN0vNDyHOUhdfr
         +GopLgqUjiUaOLh6r8WGM0D64yxWbNVuHiXe0+FQQ8WeFW0vx8FYrmGmyMRKIVSiD1Tg
         LlpA==
X-Gm-Message-State: APjAAAUVqhGL3K6b781QuFtUcxOYV/evXfg3Mu8Qbz/pl6Tw6ibAPs+T
        4tx/ju63luP2Q9v4kS1RERSIj55HVvY=
X-Google-Smtp-Source: APXvYqwPpfYq7BHuvPGEMJ5B/K5pzWU9mqyOL9N2slWNcedM2a3s8ERLfiDKxg921/SHA7zUbFHANg==
X-Received: by 2002:ab0:3406:: with SMTP id z6mr28829445uap.102.1559154658181;
        Wed, 29 May 2019 11:30:58 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 69sm149776uas.0.2019.05.29.11.30.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 11:30:57 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id z11so2587689vsq.9
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2019 11:30:52 -0700 (PDT)
X-Received: by 2002:a67:ebd6:: with SMTP id y22mr63801054vso.87.1559154652088;
 Wed, 29 May 2019 11:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190218063730.26870-1-ms@dev.tdt.de>
In-Reply-To: <20190218063730.26870-1-ms@dev.tdt.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 May 2019 11:30:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Viag00jL-QRLsnyDoXWT5KFyZ3TnMdTPSJ-dbuNNiFVQ@mail.gmail.com>
Message-ID: <CAD=FV=Viag00jL-QRLsnyDoXWT5KFyZ3TnMdTPSJ-dbuNNiFVQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Fix DMA cache alignment issues
To:     Martin Schiller <ms@dev.tdt.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Feb 17, 2019 at 10:37 PM Martin Schiller <ms@dev.tdt.de> wrote:
>
> Insert a padding between data and the stored_xfer_buffer pointer to
> ensure they are not on the same cache line.
>
> Otherwise, the stored_xfer_buffer gets corrupted for IN URBs on
> non-cache-coherent systems. (In my case: Lantiq xRX200 MIPS)
>
> Fixes: 3bc04e28a030 ("usb: dwc2: host: Get aligned DMA in a more supported way")
> Fixes: 56406e017a88 ("usb: dwc2: Fix DMA alignment to start at allocated boundary")
> Signed-off-by: Martin Schiller <ms@dev.tdt.de>
> ---
>  drivers/usb/dwc2/hcd.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

This patch has been in the back of my mind for a while bug I never got
around to it.  Today I was debugging memory corruption problems when
using a webcam on dwc2 on rk3288-veyron-jerry.  This patch appears to
solve my problems nicely.  Thanks!

Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: <stable@vger.kernel.org>
