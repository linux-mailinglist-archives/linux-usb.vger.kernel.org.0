Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A42195FA6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 21:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgC0UZ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 16:25:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45952 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbgC0UZV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 16:25:21 -0400
Received: by mail-ot1-f66.google.com with SMTP id c9so11119538otl.12
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akWa2ipvxDdFjzHuT26VN2IdHpNjEh3op9l8PYfCVA0=;
        b=NRA7NIyKs9dvbrJdb5I0eFsmvwBuuz3f4W7KGO5Y6YsRY/dAZH+qXFQC1B/HIO8q90
         Di99YhMlahViPssUjztq+3fKqXSiF5fbgKk+mOGT+o3FPZy1dk7n4dYfdnWMzt33uDxD
         xxUKAC5cU66mNQjvtGbkHpDCaqZD7FA8potYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akWa2ipvxDdFjzHuT26VN2IdHpNjEh3op9l8PYfCVA0=;
        b=ht1Mu/+hVp1RrlUos2ECtXNlvCxlbBCUa+YiP4BA4s5khaego9vWXCf+exHicB38UE
         PPaXrVX6fWvlEIe5y2BlXa72n1/Kyf27olcZLLMlnrxEKmzch/iWRDohX5ioLpkj+5e3
         HeNkLrJXYNa0Ll06ID6QBiGY6yWAWkJsLr43MlkDfWT2JRYUMWODFPoOtzlDsrfJe9ms
         ZorECU1cpbzHjxtqYAdNlMYzRMhbNVNEkRIdklYebtT3tBSxYDuaZw96MUqgcSMRkGsk
         WnRGUimCOBJFEJhIi4/+43zKeV/cSbBuahUO7B6zXCjOL7iODqt5nzMT41gQrYutkBbd
         qmOA==
X-Gm-Message-State: ANhLgQ2sHOVkIX7yJH7esKCtg6TcIFCO47UtgripyeowcNWcPoL/0EMk
        Mp6Uqt4x1HfTX5tGKBZuB4mpmjiWPd0V0e2JUdEG
X-Google-Smtp-Source: ADFU+vtEIPmG+pfkHCSu82SSE3geeF9tI5kApWkuTOGuNqdr4Sq82a3K7dRYtvTWJOz2KWUcNK/35wGwBVO+Z9Sv9Ak=
X-Received: by 2002:a05:6820:122:: with SMTP id i2mr1003546ood.73.1585340720551;
 Fri, 27 Mar 2020 13:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200313141545.31943-1-alcooperx@gmail.com> <20200313141545.31943-2-alcooperx@gmail.com>
 <20200313220202.GA23539@bogus>
In-Reply-To: <20200313220202.GA23539@bogus>
From:   Al Cooper <al.cooper@broadcom.com>
Date:   Fri, 27 Mar 2020 16:25:09 -0400
Message-ID: <CAGh=XADV-wp_vggA=3Nf8wGdABvgkhVzpMjFg4XcdOukRoC6TA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add Broadcom STB USB support
To:     Rob Herring <robh@kernel.org>
Cc:     Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 13, 2020 at 6:02 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 13 Mar 2020 10:15:42 -0400, Al Cooper wrote:
> > Add DT bindings for Broadcom STB USB EHCI and XHCI drivers.
> >
> > NOTE: The OHCI driver is not included because it uses the generic
> >       platform driver.
> >
> > Signed-off-by: Al Cooper <alcooperx@gmail.com>
> > ---
> >  .../bindings/usb/brcm,bcm7445-ehci.yaml       | 60 +++++++++++++++++++
> >  .../devicetree/bindings/usb/usb-xhci.txt      |  1 +
> >  2 files changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.example.dts:24.13-14 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1254417
> Please check and re-submit.

I fixed this.
Thanks
