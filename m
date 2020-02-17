Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB5A16120A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 13:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgBQMbL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 07:31:11 -0500
Received: from mail-qv1-f46.google.com ([209.85.219.46]:35125 "EHLO
        mail-qv1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbgBQMbL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 07:31:11 -0500
Received: by mail-qv1-f46.google.com with SMTP id u10so7490476qvi.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 04:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=dXG6CClP4jx5ZwTa4pqIneGKAKm0xJl9UjRWD8qE7rY=;
        b=EllmxXhIsnJkfS1oYXIKDe7bbqnDMDLZGHT9WbCoQHfjwSmTR0hCU3DTkW6I5jsv8n
         EEIqIZqbDGYzCcwnWb/JO2znsuONwWdGkh/IlP/YtXc1mPhkCZBZlqZOfsGl885Nyxcw
         AcIzf7MpbOcET+Rs/745okgTITKpVWYLrWxdIj6HP3q7pLrqAD/hHmyw8ORDiEGrIqmh
         V0WkYpfpck7p6OaY3mWSL3eFPDOViCpfadTwq1Lq2vRTMOg3ZTuKXi1FzL+UHvEdETLD
         UiqRk35XPdkDjSSokqqxv0uLHrHdho7fY8/J4XusYqorZhNWNN0fuGlIJOIORS/z3xES
         JVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=dXG6CClP4jx5ZwTa4pqIneGKAKm0xJl9UjRWD8qE7rY=;
        b=po5sM3PASDf0NI/CWiBaxvk3qvLFPdxJQ2hPuQBbaGyAY8tpw+qSNScG3TFCo7xSom
         0i9/88KzblVQMO6sfA5khyJuF7L8pm0/XR4645rU4Kla3dXXWzDyOwYrFQaw144hEyhq
         TO/GjTFnQDey4WUsDqoqmj0cpJbhs05bTqd3X8wSSCSy7wO+myIAJ+08NbftxtXuPfsW
         /yVdq2woAuL3HuSu1pVZyV/TpI/iMeN9XlZc3e6Xug3pJo3CFwTkP0qaBUHJziKvPShv
         JW7gEch7+g8pdQ0B2xdjIBrUwftRAD1NRqFkaEw0sVwjDhayCGcIsNnekCcNi/0kPAFT
         jShg==
X-Gm-Message-State: APjAAAUUFb69h/YduIIwkZtgeYdM0CX0Hc1v5D0XKFQLxiq3PAj27mpe
        MBBDRyQiUBCPRdpe7QooymNppAepuin9gw==
X-Google-Smtp-Source: APXvYqyix1FgUjMCa4MJHhBBtYmyv0FuasEDxY1nuQI2IUOqqYjWdpwvJznY9Gad1skqMB0sFV1zqA==
X-Received: by 2002:a05:6214:80c:: with SMTP id df12mr11924172qvb.113.1581942669979;
        Mon, 17 Feb 2020 04:31:09 -0800 (PST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id p92sm101584qtd.14.2020.02.17.04.31.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 04:31:08 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f179.google.com with SMTP id i23so1705280qtr.5
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 04:31:08 -0800 (PST)
X-Received: by 2002:ac8:4b70:: with SMTP id g16mr12772150qts.296.1581942668095;
 Mon, 17 Feb 2020 04:31:08 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
In-Reply-To: <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
Date:   Mon, 17 Feb 2020 09:30:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
Message-ID: <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Minas,

On Mon, Feb 17, 2020 at 5:58 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> On 2/14/2020 5:40 PM, Otavio Salvador wrote:
...
> >      [  312.967867] g_serial gadget: high-speed config #2: CDC ACM config
> >      [  314.828173] dwc2 30180000.usb: new device is high-speed
> >      [  314.866943] dwc2 30180000.usb: new address 16
> >      [  314.889550] g_serial gadget: high-speed config #2: CDC ACM config
> >
>
> I assume here you few time disconnected and then connected cable and
> after last connection even when g_serial seen in last line it stop work.
> Correct?

Yes. It stops responding.

> > The "[  314.889550] g_serial gadget: high-speed config #2: CDC ACM
> > config" message is the last time it is detected. As mentioned, to
> > restore the port to work, we need to reload the g_serial module.
> >
> > When we reload it, following exception happens:
> >
>
> Actually exception happen in g_serial not dwc2. Why you assume that it
> because of dwc2?

Indeed. After reporting this, it does sounds it is two decouple
issues. The tty seems to be not properly cleaned up and it seems to
have a resource not properly cleaned up.

...
> > So, I am a bit lost how to debug this so I'd like to know what kind of
> > information might be useful to find the root cause of it?
>
> And despite of above exception, g_serial enumerated it works fine?

If reloaded the USB is detected but tty seems to not work. It seems it
fails to free the ttyGS0 previously used and thus it cannot properly
create the new device.

> Please provide me dump of follow dwc2 debugfs's: regdump, hw_params, params.

Do you want this on working and failing state or just the failing one?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
