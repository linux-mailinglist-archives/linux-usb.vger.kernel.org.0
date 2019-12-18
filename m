Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 368671250C5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 19:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfLRSiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 13:38:08 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34923 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbfLRSiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 13:38:08 -0500
Received: by mail-io1-f67.google.com with SMTP id v18so3050011iol.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=If9n9LWtZGwO9cBtHXPSqWrRQWL2H+dGPsSdvZ1Ke3s=;
        b=G5QCuHckZR+UYBlSuoqYvD3YazGZK1yBYvycKFSY3URC8LIyhCbIuej/Kaaffiq5L4
         92606OJK+TKfXSAfkh0FiaB3G5jt9UGQshpfDs2q+I944lz3SEdLnkj/Ub0mvoEu5dOO
         J/Rd18YDRIPIOTc4M8TImCc1kMLL8HN3M2P7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=If9n9LWtZGwO9cBtHXPSqWrRQWL2H+dGPsSdvZ1Ke3s=;
        b=iimWxBy8WzG+MrL824gyLidP+SMdMFWfW3Q9CtRKJAMJyKFjmbbEhFT1oBuibZ9p0u
         PqMa27uVyd0MkjQWcX1zZP0iNV2ENjzExr7ys8lwKX4/jOTTwqeONdBgWOvKBEBlSta2
         HWo23YquOV3065BvFRuqevjOv116RSVKMCasWW+kV1z6S3xIhXNypqBIEDaJTo2o32pB
         XQku0AySUj0raO/AFuEFN7YK8mto7yfgZt5NbuyLvwpP9LcgOurXbP6NoP93TDSGnxuM
         WPyy4CaO4S/7nn2CT4hPQf5gA8v41+n6Ts52ERTxKZrUrUhpGweXGL6JMB50qR1R0aqB
         71Qg==
X-Gm-Message-State: APjAAAUO/BRvcpOG5K5c7qkh/uBkuVHFrFgLZ2xPHZJ60wtq33Q4pxoS
        xlyjn/QlvLQUyj+KJI5ygnN9WIW2ybM=
X-Google-Smtp-Source: APXvYqw/ZiWTjip2MVwlccb+AAgb7+VYh/7q+h01Tkw76Y5PQ2wK3EEoX2xxOc9cRKgJ5AHFEQ5fWQ==
X-Received: by 2002:a5d:8501:: with SMTP id q1mr2761913ion.268.1576694286831;
        Wed, 18 Dec 2019 10:38:06 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id k16sm920724ili.35.2019.12.18.10.38.05
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:38:05 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id z8so3054314ioh.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 10:38:05 -0800 (PST)
X-Received: by 2002:a6b:b941:: with SMTP id j62mr2902869iof.168.1576694284957;
 Wed, 18 Dec 2019 10:38:04 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
 <6d8c979f-daa3-3b40-f29c-cca5a2f8f1c8@codeaurora.org>
In-Reply-To: <6d8c979f-daa3-3b40-f29c-cca5a2f8f1c8@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 10:37:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UER4zt=z3XWEzNt5v2oe8V=z6Hb-Wm-2BzuWtuHmYg-A@mail.gmail.com>
Message-ID: <CAD=FV=UER4zt=z3XWEzNt5v2oe8V=z6Hb-Wm-2BzuWtuHmYg-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
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

On Wed, Dec 18, 2019 at 4:41 AM Sandeep Maheswaram (Temp)
<sanm@codeaurora.org> wrote:
> +  assigned-clock-rates:
> +    description:
> +      Should be 19.2MHz (19200000) for MOCK_UTMI_CLK
> +      >=125MHz (125000000) for MASTER_CLK in SS mode
> +      >=60MHz (60000000) for MASTER_CLK in HS mode
> +    maxItems: 2
>
> You can still express some limits here even if we don't go all out
> with the "oneOf".  AKA I think this is better:
>
> assigned-clock-rates:
>   items:
>     - const: 19200000
>     - minimum: 60000000
>       description: >= 60 MHz in HS mode, >= 125 MHz in SS mode
>
> Facing error when i add as above.
> properties:assigned-clock-rates: {'items': [{'const': 19200000}, {'minimum': 60000000}]} is not valid under any of the given schemas
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/qcom,dwc3.example.dts' failed

I couldn't figure it out either.  ...but at least this seemed to work
and is slightly better than what you have:

  assigned-clock-rates:
    items:
      - description: Must be 19.2MHz (19200000)
      - description: Must be >= 60 MHz in HS mode, >= 125 MHz in SS mode

So I'd say go with that.


-Doug
