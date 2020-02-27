Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDA8172AD5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 23:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgB0WG5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 17:06:57 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36098 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbgB0WG5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 17:06:57 -0500
Received: by mail-vs1-f68.google.com with SMTP id a2so722657vso.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 14:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZJFYpDMu28rzg4sSH4lYDpplDJcLA4t74m3kwP0OVc=;
        b=fSnXxRqDh7UfXXPdr2gz+QQFlZLuXvGjpruN8a7b0yy4UgTtmHn06hZFqIHGRvYNQG
         aTs1vV/VJNDqO64I6+DPkfrEJS/Gi5zmkHsLsciwXoZPq/OS9g9jIYQjEsY/VBPCji92
         DVYwcrXRTNUyds2NfyFsBneM5dOfsQkdMShgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZJFYpDMu28rzg4sSH4lYDpplDJcLA4t74m3kwP0OVc=;
        b=crSWLNzNQXLI5y2C0aEcCxSxHAQNoqH+YdNo8BBkcfyouIwli6j6S/cTkGZs2DkVYw
         3P5ppcHju50avdO6dfhrQYgoslOlrxtHYT5xK8Srs2aI5yQ13sFSofjabTiuRqA7D2uL
         ayeDT63yq8KBGIJYh8aGjcKIYYkFkAqXhI9HB9NCQ4TUOddmI1z5Kn4rnru/gI8bUpmV
         U3dszTeOZc9kSug2fq2M/bl8DdXO1tMkuhP8TB/CjiPJ5fXOWCTeYgoT0kBhfzLqdXD2
         PNMOV0g3LE9vWxHUEg6dp0cZ/HcPBdeEn4jbMozZZ353G/KXEwEW1EwGcEIMMH/l785u
         HjmQ==
X-Gm-Message-State: ANhLgQ1VLf1Rh7h/5bs/bauec7UowD0ERSD3mF5z6lvRezWdlFy+Xuyt
        PLlmG/fgwctYxZd0S8iZJzbjwGJd0II=
X-Google-Smtp-Source: ADFU+vshN9Nsp4KQLNQG66DtcggM2HhzkspGFhhbUtwhEcyBaG9BPJvCzol8GT1NU46dCpJH4SvLRw==
X-Received: by 2002:a67:6483:: with SMTP id y125mr915940vsb.212.1582841216604;
        Thu, 27 Feb 2020 14:06:56 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id c44sm1643406uad.16.2020.02.27.14.06.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 14:06:55 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id k24so239570uaq.12
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 14:06:55 -0800 (PST)
X-Received: by 2002:ab0:45b6:: with SMTP id u51mr513744uau.120.1582841215133;
 Thu, 27 Feb 2020 14:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20200226210414.28133-1-linux@roeck-us.net> <20200226210414.28133-3-linux@roeck-us.net>
In-Reply-To: <20200226210414.28133-3-linux@roeck-us.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Feb 2020 14:06:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UutvJE+k4W0sQDs6q+oOfbz5Tz670+L-8fFHfdB=KytQ@mail.gmail.com>
Message-ID: <CAD=FV=UutvJE+k4W0sQDs6q+oOfbz5Tz670+L-8fFHfdB=KytQ@mail.gmail.com>
Subject: Re: [RFT PATCH 2/4] usb: dwc2: Do not update data length if it is 0
 on inbound transfers
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Feb 26, 2020 at 1:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The DWC2 documentation states that transfers with zero data length should
> set the number of packets to 1 and the transfer length to 0. This is not
> currently the case for inbound transfers: the transfer length is set to
> the maximum packet length. This can have adverse effects if the chip
> actually does transfer data as it is programmed to do. Follow chip
> documentation and keep the transfer length set to 0 in that situation.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/usb/dwc2/hcd.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

I don't have any other test setup that you don't have, so just giving
my review tag and not tested tag.

I will note that it feels like this should have a "Fixes" tag or a
direct Cc to stable to make it obvious that it should make its way
back to stable trees.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
