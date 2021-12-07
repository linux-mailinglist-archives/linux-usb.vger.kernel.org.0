Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0574846B09E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 03:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243474AbhLGCff (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 21:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234416AbhLGCfe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 21:35:34 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F23C0613F8
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 18:32:05 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id bj13so25131389oib.4
        for <linux-usb@vger.kernel.org>; Mon, 06 Dec 2021 18:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7yIt0H2BJia1n1RdLgy9XsiVyWHb2gj2JpRcgtxqXlo=;
        b=pFJa90TXfUzK+34x5n+LqtuDXUXuNklDwQGWBogvco1A+5NE5S/MB8+hE15xeRqggf
         +hsj4kE8GOXrEQTh4EcQLY13ApN3mC/pFuasgI6VA3+7nuJpg78vBM4w/kj7gVlzcQ7w
         k908aizran+2sJ3iS9aP+ed/zUqgs6Mwgjxnn2wauCaAjJ9rC9jGWsvPR5h6kOPcc7K5
         HIbXnYKxnonKq/H1a7Xp/9IB/Ey4lGlVcoyNzaQ6g1EFRmsM9b5rayXyk5nxDMh8k0Ce
         uF+B5XUz5bDaxpnL4h0CKSFVRFktnXiKRlVXZBsJEtKXcljsAHGjbViYLAdPJ8BLgEB3
         qvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7yIt0H2BJia1n1RdLgy9XsiVyWHb2gj2JpRcgtxqXlo=;
        b=3+oUyxoeU9y5rCeocNKxLYK22D9W/G1yWD5p8JHWBj1vCqjZOZunakL6Y8CnAPcIS3
         /CpgljHVUj56zZfUiLPV3Svk2cI5tQ9fP0+rOESaTfs4+BQXMk0o1Di9G7bd8caQ2H0K
         IaguniWbcwGp3u9jAPJUB+98CQcxoLe0x/4dLnPSSDwaSPdfC2FxLKB2UbGWOZT60NuA
         8nj622sUwboQRL3rSZ1gGJ6KPBXVOBOHP7SFubhHX3NTF8JwwNPwqZqdlD715XhQykjh
         KOYKynuotQw9kAegIwz0on4fbGVIbKrRCO7Gj1fIhzuqBObp49T/rkWR91Ox8zDGOEEZ
         R9iA==
X-Gm-Message-State: AOAM530dwb1dkeNBnkPyyHi0HpNq/H15Vj9BOXsakrj8IU+zy1LoM578
        YeELcrD/aF0iMf5G7wlM/2i9dQ==
X-Google-Smtp-Source: ABdhPJw5b2Eojwp5CDWYULGnVErVQDMpMC7MfWDggUfrlQeEV1KtPN5iO4llP+D8PSYWDRlntP9Kgg==
X-Received: by 2002:a05:6808:218b:: with SMTP id be11mr2719314oib.80.1638844324398;
        Mon, 06 Dec 2021 18:32:04 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m2sm2556218oop.12.2021.12.06.18.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 18:32:03 -0800 (PST)
Date:   Mon, 6 Dec 2021 18:33:28 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Avoid use-after-free when USB
 defers or unbinds
Message-ID: <Ya7H+COf/Hbk6g5M@ripper>
References: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
 <CAE-0n50n=JZEqz5aQW4FQwjO9eFN56vTmBrQ6qBWduFY5jNPJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50n=JZEqz5aQW4FQwjO9eFN56vTmBrQ6qBWduFY5jNPJA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 06 Dec 16:37 PST 2021, Stephen Boyd wrote:
> Quoting Douglas Anderson (2021-12-06 15:28:47)
[..]
> > +                       goto node_put;
> > +               }
> >
> > -       prop->name = "tx-fifo-resize";
> > -       ret = of_add_property(dwc3_np, prop);
> 
> I don't understand why we can't tell dwc3 that we want to use
> tx-fifo-resize without adding a DT property. DT isn't the only way we
> could probe this qcom dwc3 device, there's also ACPI. And in dwc3 core
> where we check for this property couldn't we add a compatible check for
> qcom,dwc3 and then force the property? I see that a lot of this was
> already discussed when these patches got applied by gregkh directly[1].
> 

When the tx-fifo-resize property was introduced I made an effort to
convince the people involved about the prospect of passing this
information in the code, rather than using DT as some sort of parameter
store to pass information between the devices.

And I still would like us to come up with some sort of code-level
mechanism for passing some state between dwc3-qcom and the dwc3-core,
because I really want to register some callback with the core so that we
don't need to duplicate extcon and usb_role_switch in both the core and
platform glue.

See this discussion:
https://lore.kernel.org/linux-arm-msm/YSZCmDEedJaJyI0u@ripper/

> Can we revert out this bad code instead?
> 

You definitely have my vote for that!

Regards,
Bjorn

> > -       if (ret) {
> > -               dev_err(dev, "unable to add property\n");
> > -               goto node_put;
> > +               prop->name = "tx-fifo-resize";
> > +               ret = of_add_property(dwc3_np, prop);
> 
> [1] https://lore.kernel.org/all/b5917fc0-c916-0a51-dc4c-315d7f02cafa@codeaurora.org/
