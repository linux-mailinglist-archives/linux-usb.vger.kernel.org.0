Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A261BB1B6
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 11:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405922AbfIWJxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 05:53:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33809 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387666AbfIWJxt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 05:53:49 -0400
Received: by mail-wm1-f65.google.com with SMTP id y135so14602543wmc.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 02:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pVr+aJNObFR/+g9/kL+nTeqe+BdoqBXFID2WBcZzap4=;
        b=EMvb4GJSg+GzxGq7mZ/HXn6h2roiZyUPE3E762bZJEAf38XMGJ4rS2Oj829IjPp4Ct
         OIi/PUvc89wXVVL9VCHIWwezM+CSd9QQY/a8HcPhIz/HlmSX9JB5Ry87MXSRR5eq9qyl
         SLQbl8/3pC2x4tCOyB9hjxM34QZQvDXsSCbyMWm9cUONN61k3uii192OgNnsdv0FNdgl
         sPqtNToT3Y8awrpcU1I21XcD+Qrzx7P5trGY6xSwD+xtnzg1ij5Ag3lAH/fTzzhmEnqi
         s388441rqqpv5sHI9JjrhsbAmUL8KvYk30XUdguMsePG6RyDsf3T4tY62gddSFtb1ZNY
         PEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pVr+aJNObFR/+g9/kL+nTeqe+BdoqBXFID2WBcZzap4=;
        b=p1Bqk4aqXweV+TeLE4/q9OytB73qZH0CMeMR9l9WQytH3GSlq4nUvXK2y4RuDk8Ssd
         SyyfyECwaZZXrNPPiwln/NevrDTFXthvBfzp8X9IiuLSKqi31462g579Y2YESWlW3okb
         xTtjRfyW0Eu8F2fq03PBhRwiTV+aGALjc1esYXZXS0FEJD0KomMWCy4xe3MEVMmsOcSr
         wCk6xqJemz2QIsNyj/afmul0jDMV9pv0VJCXAUdplaA318eqwsgyb2enbUMKYKXGwAM6
         l/dCyx9O1qz0ySGS2EdJYYhz2q4uuP/YySzMWNZ9g2NBfhU4xGcVWQbwtBa5OfxQmMu6
         /5Lg==
X-Gm-Message-State: APjAAAWzhWpoYvuLaDvB53/CEiCbGsgg2H+Ye6kE5TRKdDRL5+mjjQ6I
        YJv2hU1D8hGASrm5iuJ0uL3x2bmNJSRpH2tOhKc=
X-Google-Smtp-Source: APXvYqz7wfe6tUGzsNOkrrBmI7M8GbOjKhzmAIrs5p3R6nZVYwzZH+euYocU3IG5hdjH9dhjPuZR2I+AEqtMVkSg9KI=
X-Received: by 2002:a05:600c:254f:: with SMTP id e15mr12892052wma.163.1569232425739;
 Mon, 23 Sep 2019 02:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost> <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost>
In-Reply-To: <20190920075602.GI30545@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 23 Sep 2019 17:53:34 +0800
Message-ID: <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B49=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:56=E5=AF=AB=E9=81=93=EF=BC=9A
> Yes, that's better, but you're mixing register addresses, bit values and
> masks above. Perhaps things would be more clear if you but a _REG suffix
> on the register defines and order things as follows:
>
>         #define PL2303_HXN_<name1>_REG                  0xX1
>         #define PL2303_HXN_<name1>_<field>_MASK         0xY1
>         #define PL2303_HXN_<name1>_<field>_<value>      0xZ1
>
>         #define PL2303_HXN_<name2>_REG                  0xX2
>         #define PL2303_HXN_<name2>_<field>_MASK         0xY2
>         #define PL2303_HXN_<name2>_<field>_<value>      0xZ2
>
> The idea is simply to keep related defines together and not mix
> register address, masks and value defines.
>
> Keep registers sorted by address, and bit masks and values by bit order
> (e.g. MSB first).

Thank you for your reply

Charles Ans:
The new define is follows

#define PL2303_READ_TYPE_HX_STATUS    0x8080

#define PL2303_HXN_FLOWCTRL_REG        0x0A
#define PL2303_HXN_FLOWCTRL_MASK    0x1C
#define PL2303_HXN_FLOWCTRL_NONE        0x1C
#define PL2303_HXN_FLOWCTRL_RTS_CTS        0x18
#define PL2303_HXN_FLOWCTRL_XON_XOFF    0x0C

#define PL2303_HXN_RESET_REG    0x07
#define PL2303_HXN_RESET_UPSTREAM_PIPE    0x02
#define PL2303_HXN_RESET_DOWNSTREAM_PIPE    0x01


> Yes, but that doesn't imply that you need to read back the old value.
>
> I'm assuming it would either always read back as 0, or you would read
> back the previous value written, which means you could end up resetting
> something you did not intend.
>
> Either way, you should not read back the current value when resetting
> the data pipes.
>

Thank you for your reply

Charles Ans:
The new code is follows

    pl2303_vendor_write(serial,
                PL2303_HXN_RESET_REG,
                PL2303_HXN_RESET_UPSTREAM_PIPE |
PL2303_HXN_RESET_DOWNSTREAM_PIPE);


Please confirm the above new define & code..
If there is no problem.. I will write a new Patch file.

Charles.
