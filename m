Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7375F8DE7E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 22:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbfHNUMW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 16:12:22 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:41602 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfHNUMW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 16:12:22 -0400
Received: by mail-ot1-f49.google.com with SMTP id o101so934847ota.8
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=baesCGH/f6622nKyTt3pYuyj9GQL9uGRdAZgpKFE0pg=;
        b=nXecmtG4odunHeB6aXBTN0HKi7UMHEqpEKs1j6keLeZaCBgpHF5VklO2Y4bTIhuYGx
         77N5DKPerrlC7WllHf34rtrK33Zn5+cdKLrTE5yXuDNzXuPBSqoV/6xoM109pN+cAxpJ
         /CtREKnKJm5FlnkbSvYaSYJkw/K0E+GJcQ66g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=baesCGH/f6622nKyTt3pYuyj9GQL9uGRdAZgpKFE0pg=;
        b=CazOq4JPgIIlZKNSVZ7hLFKA6++BvdlDXwybpGZttmwwwY9mMIzQ9rrUTO8yzIus2C
         QSP0PAXw+uO0qoZu9T3j2XXVduDKnNnwk8DaWXNCzrlqqpnDcvWRosRUnZQBrMVoQlEM
         IFz0R/tKlswgGj9lGSq585ZWsudhAJWuu5GjhBxTz4x+oTJOnNXWxfnwCfl4xNnLoSC9
         pmEMB46hO2tETDhqk28QcWdc59Qify97oqiGh4s5QQpCyUCi3l6S+eRfPHrvbEDHcu/J
         zIxUMhFcUN5aYAq9cWDdF430vmBqWYt28gmMWNW3Z++ttQR6HWiB9cSsEvtUCYVomQ/5
         M1RA==
X-Gm-Message-State: APjAAAVHAH1CziPXvSs/orftxO4PuwfOhle64RRxDtGNvKyr5RW5eftE
        iajZxHbCOxc8XoaRy3UFZ4Ij+vVwn2g=
X-Google-Smtp-Source: APXvYqxV0t1mcnPn62zOUDSFC5WUarR8qn8+d6L3N0B5VnDMhdjgemChtyWjOM4fn+eLoGSlrqEakA==
X-Received: by 2002:a9d:371:: with SMTP id 104mr731221otv.253.1565813540608;
        Wed, 14 Aug 2019 13:12:20 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id z26sm282038ote.40.2019.08.14.13.12.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2019 13:12:19 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id a21so1579418oie.4
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 13:12:19 -0700 (PDT)
X-Received: by 2002:aca:56d2:: with SMTP id k201mr761220oib.171.1565813538728;
 Wed, 14 Aug 2019 13:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHX4x86QCrkrnPEfrup8k96wyqg=QR_vgetYLqP1AEa02fx1vw@mail.gmail.com>
 <20190813060249.GD6670@kroah.com>
In-Reply-To: <20190813060249.GD6670@kroah.com>
From:   Nick Crews <ncrews@chromium.org>
Date:   Wed, 14 Aug 2019 14:12:07 -0600
X-Gmail-Original-Message-ID: <CAHX4x87DbJ4cKuwVO3OS=UzwtwSucFCV073W8bYHOPHW8NiA=A@mail.gmail.com>
Message-ID: <CAHX4x87DbJ4cKuwVO3OS=UzwtwSucFCV073W8bYHOPHW8NiA=A@mail.gmail.com>
Subject: Re: Policy to keep USB ports powered in low-power states
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Kurtz <djkurtz@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the fast response!

On Tue, Aug 13, 2019 at 12:02 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 12, 2019 at 06:08:43PM -0600, Nick Crews wrote:
> > Hi Greg!
>
> Hi!
>
> First off, please fix your email client to not send html so that vger
> does not reject your messages :)

Thanks, should be good now.

>
> > I am working on a Chrome OS device that supports a policy called "USB Power
> > Share," which allows users to turn the laptop into a charge pack for their
> > phone. When the policy is enabled, power will be supplied to the USB ports
> > even when the system is in low power states such as S3 and S5. When
> > disabled, then no power will be supplied in S3 and S5. I wrote a driver
> > <https://lore.kernel.org/patchwork/patch/1062995/> for this already as part
> > of drivers/platform/chrome/, but Enric Balletbo i Serra, the maintainer,
> > had the reasonable suggestion of trying to move this into the USB subsystem.
>
> Correct suggestion.
>
> > Has anything like this been done before? Do you have any preliminary
> > thoughts on this before I start writing code? A few things that I haven't
> > figured out yet:
> > - How to make this feature only available on certain devices. Using device
> > tree? Kconfig? Making a separate driver just for this device that plugs
> > into the USB core?
> > - The feature is only supported on some USB ports, so we need a way of
> > filtering on a per-port basis.
>
> Look at the drivers/usb/typec/ code, I think that should do everything
> you need here as this is a typec standard functionality, right?

Unfortunately this is for USB 2.0 ports, so it's not type-C.
Is the type-C code still worth looking at?

>
> thanks,
>
> greg k-h
