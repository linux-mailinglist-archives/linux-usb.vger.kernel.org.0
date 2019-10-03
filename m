Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C78ACB130
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 23:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733144AbfJCVdy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 17:33:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55556 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730427AbfJCVdy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 17:33:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id a6so3482654wma.5
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WqLu0wakUs3wLW/I7o/nZ1HroZMOcAjOwf4CjhO+KeY=;
        b=SU3vbsQ6OHP3PG8vkkVhBcWke1RWVX76BBLoh371ZnNseL8IPXWuUGs8Aawlr7RpB1
         OhrN3ieOxkzztglV/yzpowrX4psibNxJXJlYePix7tD7J1IqNmVEkFQHpaImI+SJw+fL
         Qi+eFZDQbJZsRWvepgaLrxHz5iKcyph7k+468NLpj1+Xkc2829Qd76LtjKfibN9nNXLq
         SNFXX3G5dtcqpf/41ELgEut0HkWdZfSqF65GOSbmfjS+BlIId4xiH8HRfQclYS1FE5ay
         F0Vu/yPgPWokiZrw2+UdoNnU6d8v867EKDBCXwHsRUn0yTCFaPoNK5g1zBK6A1siE2rm
         3y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WqLu0wakUs3wLW/I7o/nZ1HroZMOcAjOwf4CjhO+KeY=;
        b=W3G9l2q/WVo4UgOhnh/8wWqm92SkA4Bio72p/nk7PZfCjXvolgKd7GgxQ10uRRR76G
         60wg49QEqYEqXsA3xMpVfW7EOEErf7x9N8LvNxQbMNoEjTAfOS0m/kfKk8IUUHJsxeQ5
         J4RbihIWel7QTEXP+J7NgbO5e5gg/Bb9+fVbiwYHpW86/qCGt63KRy2zLFxEEea6Q89+
         qkRVTNYm08PbA5D0yDLqkBxp00pPlmehpiu7/DrmoDaW510EiZc40TNc4vdtwVoKS9+i
         aMBOEdYGiDwT08OrpPZGA5lcSKUCanZ5e7PP/zWQPQzII0l8VOnlHls5nxf8h7Ovwlga
         qLMQ==
X-Gm-Message-State: APjAAAWn4wSQI8q4Iru8JxjR0Hx3yMg3MxibblfCFIeH633XrZQvEkFU
        9h7FENSAsfesh1Zq0bpIjBFvEkADDEpPCUuEqJp57Q==
X-Google-Smtp-Source: APXvYqy0aDLcBSZThcU2euPdqUC7jbpYAO1vXBYibNhLeJuIpnrowDBFsgcoWmV4/OIiW/ottBpZY0dyuBAWgcYMMGw=
X-Received: by 2002:a05:600c:48b:: with SMTP id d11mr3500415wme.153.1570138431210;
 Thu, 03 Oct 2019 14:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <20191003112618.GA2420393@kroah.com> <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
 <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com>
In-Reply-To: <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 3 Oct 2019 14:33:38 -0700
Message-ID: <CALAqxLX3uSJKvRwzcQznaF4WK52BcM5Bh+PNXHmfDe1aTSUL8Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Yu Chen <chenyu56@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 3, 2019 at 1:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 03-10-2019 22:45, John Stultz wrote:
> > The HiKey960 has only one USB controller, but in order to support both
> > USB-C gadget/OTG and USB-A (host only) ports. When the USB-C
> > connection is attached, it powers down and disconnects the hub. When
> > the USB-C connection is detached, it powers the hub on and connects
> > the controller to the hub.
>
> When you say one controller, do you mean 1 host and 1 gadget controller,
> or is this one of these lovely devices where a gadget controller gets
> abused as / confused with a proper host controller?

I'm not totally sure myself, but I believe it's the latter, as the
host ports have to be disabled in order for the gadet/otg port to
function.

There was a similar situation w/ the original HiKey board (dwc2
controller) as well, though the switching was done fully in hardware
and we only needed some minor tweaks to the driver to keep the state
transitions straight.

> And since you are doing a usb-role-switch driver, I guess that the
> role-switch is integrated inside the SoC, so you only get one pair
> of USB datalines to the outside ?

I believe so, but again, I don't have a ton of knowledge about the SoC
details, Chen Yu would probably be the right person to answer, but I
don't know if he's doing upstreaming anymore.

> This does seem rather special, it might help if you can provide a diagram
> with both the relevant bits inside the SoC as well as what lives outside
> the Soc. even if it is in ASCII art...

There is a schematic pdf here:
https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf

The larger block diagram on page 3 might be helpful, but you can find
more details on the usb hub bits on page 17 and 18.

thanks
-john
