Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A99E8F3E
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 19:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731376AbfJ2S0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 14:26:14 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38054 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731367AbfJ2S0O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 14:26:14 -0400
Received: by mail-ot1-f66.google.com with SMTP id r14so5870319otn.5
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F0/jbrX4IDouWf5n0Ojei70Kw+dN6xE0YN1q94WIUzA=;
        b=lKvQS0hHD4pj59HlV6oR0/djUnPuGpWekyavljQi7ntMzsbNBbY5kRUKP+N9n4IUtd
         maRk/snxO5ptQrmheK+AFhcB0qusQUQU9uqxU+S4Dp7WHJe3cw9tF8YosUx3hoRuYI9r
         nVedD3689ILaB3NAEDt95fwjMDA4JMq+1bEgKiaTqmc7r9enukmH6wTRiyL/ijQEmkDp
         0sJWD7FDkSoJ6OaZxsmOw678g00dsavQbZN+uy+jhW6kx0F+GAXZRW8+pIWB/7adGLKJ
         5GSo+Xo7uAoDCvHllODyrCQKxRPr0HLhXP4igjRfuz9Xb5Z+Q3BpsxOxg+izWGYDwufy
         SoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F0/jbrX4IDouWf5n0Ojei70Kw+dN6xE0YN1q94WIUzA=;
        b=Y3vGXbHagj9ie6h9M7LREmbSTg5Gvvbi0Vk1iHFYXkiIbwi0SGqatWNc12fn530rDO
         VLBRvGOn0Rw9fYnWjAiO27DZ9zQMn+Mr+XyZDoqB3oKpaOQTTc6Djb1hA7SY57ceBcU9
         1oua3fmbaa7xb+DHGeRkIoF0IWWE0f69rbB6xmEReaPiy7oAkW4O4JKbGXN4GxRWxmoI
         QMfA6imI5ss2jNo5HsxFmKUkJUyAHxqJDkpStA7bqtt+PfhjgKFqcs/tf5q4a8qZEAii
         4uaFOqfIzJt70IDe2GBIW2AB5V5QEcjv4IqPsommK8DecIqQSfXz2czS1zqEiWcGZ3Tt
         JbGQ==
X-Gm-Message-State: APjAAAVrtbwHEwXEUBZXS90BuPMc4NsmyrZAo+Rt0UWKFcdb257ydCB9
        xsaHJSXNhXJW7vKU5qiHIdQ5wAz/waG2aXvI+WW9lA==
X-Google-Smtp-Source: APXvYqxMuKgV9hIGV28BZLBjcSzYuevoUIQsOkCa/3osxr8otj1CMRnSYhoMgINxrs/ynaGGsktybzxiSTkQJHs2gQk=
X-Received: by 2002:a05:6830:ca:: with SMTP id x10mr18348228oto.221.1572373573201;
 Tue, 29 Oct 2019 11:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191028215919.83697-1-john.stultz@linaro.org>
 <20191028215919.83697-9-john.stultz@linaro.org> <87bltzj47a.fsf@gmail.com>
In-Reply-To: <87bltzj47a.fsf@gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 29 Oct 2019 11:26:01 -0700
Message-ID: <CALAqxLUcvJ6K-ysOLJj0ddiGyoHGkaJBBiw6RShmWRD8h+wWrQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] dt-bindings: usb: generic: Add role-switch-default-host
 binding
To:     Felipe Balbi <balbi@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 29, 2019 at 2:23 AM Felipe Balbi <balbi@kernel.org> wrote:
> John Stultz <john.stultz@linaro.org> writes:
>
> > Add binding to configure the default role the controller
> > assumes is host mode when the usb role is USB_ROLE_NONE.
> >
...
> > + - role-switch-default-host: boolean, indicating if usb-role-switch is enabled
> > +                     the device default operation mode of controller while
> > +                     usb role is USB_ROLE_NONE is host mode. If this is not
> > +                     set or false, it will be assumed the default is device
> > +                     mode.
>
> Do we also need a role-switch-default-peripheral? Would it be better to
> have a single role-switch-default property which accepts "host" or
> "peripheral" arguments?

I guess the standard default is peripheral, so this differentiated
from that, but I agree it might be more forward thinking to let it
specify a type argument in case there is another option in the future.

I'll rework this.

Thanks again for the review and feedback!
-john
