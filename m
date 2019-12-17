Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711EA12358C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 20:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfLQTXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 14:23:11 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:42643 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfLQTXI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 14:23:08 -0500
Received: by mail-il1-f195.google.com with SMTP id a6so9355763ili.9
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 11:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/IwEwp0WnVVccJ/nXI+m2TMK2nBYe24/J4DSiPygpI=;
        b=haUsSjX3lPpr0JU/QJDJufoNCsgPvJ6oKb7R320ALmJQ0qYqJnDkm+wDZhEf5uPMDK
         k8KmwQARjeBw4DhVp4P0yHgR+ZYucEzw8758Ld2GYfSJRl9HmcjTIGq/3EXIXIvVMYrB
         mIHgitESF8mwTupA1jsQ8p9/LpcfxsVGQAHqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/IwEwp0WnVVccJ/nXI+m2TMK2nBYe24/J4DSiPygpI=;
        b=EvnqrIK/2HBYMLKvhhIK8mrGzey9r+9sWVbXmK8gk/pSSND7h89ieVGPOSN1Uei2Pb
         rmfSatBBKiOwbJFAlEKnQAweAQWhZ4CjCRqHZ22ku+W18Y4cQX35lcJa7GGfFMh4nTy7
         yx8kqQKZXVptcSIFpAAji5qXHICriXAl4Q8duwglOqfT+t+TzgEKMqOaAGU2LYFGC95+
         tAI7PGAoUb9Jp4XmZFCCocYXrB6bnXz+bKBnZpRxNm18ia1hr58yOjw5+ASdB/LCUsoM
         S0bLRCy6Re9Q27GbdOsW7OkS1UN2j6WPiQnbcXy8hES3aB9AO21Jd/Vs49O8pIsqoxlB
         SUyQ==
X-Gm-Message-State: APjAAAUvTy4rhbNOVDpP0kZElU3JTYq7RMw37xtSYCPlgLpLEJsqMVv6
        xAohmVKFAlFYGIUqchsYAo/8PhMgrEA=
X-Google-Smtp-Source: APXvYqzd3Pj1ggZBr4n/bj2Ma2SLJakrpudt+ondgJ+yBCFknb382tAnMXjM0M9CfD81Ponl2uKpxA==
X-Received: by 2002:a92:8995:: with SMTP id w21mr18662734ilk.231.1576610587571;
        Tue, 17 Dec 2019 11:23:07 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id j5sm5324210ioq.30.2019.12.17.11.23.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 11:23:06 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id x1so3227760iop.7
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 11:23:06 -0800 (PST)
X-Received: by 2002:a02:ba93:: with SMTP id g19mr19057729jao.90.1576610586103;
 Tue, 17 Dec 2019 11:23:06 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
In-Reply-To: <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 11:22:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com>
Message-ID: <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Dec 16, 2019 at 10:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
>
> Hm... ok. Interesting.

Use of enum seems to match 'timer/arm,arch_timer_mmio.yaml'.  ...and
sub-device probably uses DMA so IIUC it's important to pass
#size-cells of 2 down to it if the parent had it.


> > +  qcom,select-utmi-as-pipe-clk:
> > +    description:
>
> Don't these multi-line descriptions need a pipe, | ?

The pipe just means that carriage returns are important.  They aren't
here, so I think it's OK/better w/out it.  The example-schema.yaml has
many without it.


> > +        usb3_0: usb30@a6f8800 {
>
> Should node name be something like 'usb3'? Or is this usb 3.0 so it's
> 'usb30'?

Probably should be just 'usb@' as per 'usb/usb-hcd.yaml'.

-Doug
