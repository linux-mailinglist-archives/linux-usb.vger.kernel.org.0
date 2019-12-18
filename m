Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A06A51250D1
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 19:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbfLRSjp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 13:39:45 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:37159 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbfLRSjo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 13:39:44 -0500
Received: by mail-il1-f194.google.com with SMTP id t8so2569820iln.4
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 10:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qS07QetcqHopZvL0SAF8T87/ibXNrIwvAxwHVFARh9I=;
        b=cCfmWZGu+EkTY9HHCwEPsf8m9ckAewsbfv+DdyQ2mndIWHOIm5cPWNW6KA2eDILRbS
         Yp1/dohvrHxPAl+V3lkzpybQo/+zHsShotOBU5xVZT9n5tFDQQe3LfkSfaeEXTa1iav5
         Tw1T5zvpDld+JYMpSOSO8g4Wf2BGB/9CUvAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qS07QetcqHopZvL0SAF8T87/ibXNrIwvAxwHVFARh9I=;
        b=fVxd7SknSbtySeuAUtOH8nbNWNulhYWZjjcswxNcD+CSu05w6t/GftyfvlvBBOMhm4
         AHSXrE+Ay320O1dV5RxAiKjH0lHhmsmfOAcgDox8Hfqvy7B2/bjpbQIAvaDTG2MOlm8a
         0p5hDd7j/S3n8zB9qwClYtHeavg8uMSBFajKjiLSWUoX+n7HrnSdvEJCUIBV8DzRBhZP
         qUdxTKsqo0PA+A022srj+FwZAdyAlDOBxbiencCqrmrfEj1GUgLMxVokTvGBLd9dUsHB
         qc/2N9uD47Xm7FhzrogdLY8jW6a/xpGrj5NMfNxIwVqiOfKz3xJB6/htkDlacMG0Z+yc
         w4Kw==
X-Gm-Message-State: APjAAAXZee5eJH/lJ71KOyPxo6AYHyFq4OtlzW8TrtcEu8tBkj70ZXZr
        gIxa5ZSnYJrMGHMyZz3gBHbbfyZ/X0E=
X-Google-Smtp-Source: APXvYqy8lVFC/X9b2QINGW/yj/ysxJMaB9y3/O9Yc9eVgRF8adD9EYGcbJUUoiAvr90lxKpe6bqN+Q==
X-Received: by 2002:a92:60f:: with SMTP id x15mr3169236ilg.181.1576694383669;
        Wed, 18 Dec 2019 10:39:43 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id y9sm613190iob.86.2019.12.18.10.39.42
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:39:42 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id v15so2584671iln.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2019 10:39:42 -0800 (PST)
X-Received: by 2002:a92:cc90:: with SMTP id x16mr3278373ilo.269.1576694382002;
 Wed, 18 Dec 2019 10:39:42 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
 <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com> <e901331b-456c-f3ed-6717-e5bf24778c57@codeaurora.org>
In-Reply-To: <e901331b-456c-f3ed-6717-e5bf24778c57@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 10:39:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xg9UTt2xjerkSKiSKSZ3tP2Drqf36Mu5eFiSxmsgj6kw@mail.gmail.com>
Message-ID: <CAD=FV=Xg9UTt2xjerkSKiSKSZ3tP2Drqf36Mu5eFiSxmsgj6kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
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

On Wed, Dec 18, 2019 at 4:48 AM Sandeep Maheswaram (Temp)
<sanm@codeaurora.org> wrote:
>
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
>
> Hm... ok. Interesting.
>
> Use of enum seems to match 'timer/arm,arch_timer_mmio.yaml'.  ...and
> sub-device probably uses DMA so IIUC it's important to pass
> #size-cells of 2 down to it if the parent had it.
>
> Should i mention this as below?
>
>  "#address-cells":
>     const: 2
>
>   "#size-cells":
>     const: 2

No, keep it like you have unless Rob disagrees.  If the parent is only
32-bits it should be fine to keep it.
