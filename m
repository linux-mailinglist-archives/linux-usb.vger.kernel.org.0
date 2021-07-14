Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C7D3C7A6A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 02:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237114AbhGNAKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 20:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbhGNAKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 20:10:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32386C0613EF
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 17:07:14 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v6so359422lfp.6
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IEtc6WN0JMkgA1X93JOHMXDth957tk+vFhRSm4MpLAM=;
        b=kjXNNfOnOZfSXBl9SvNCTU7DVpgzZWIJVg9FqMS+1JX+6OMWWH9CLz877AqiHOprT/
         /lsKfkuIYEXI5WFMO1UydRgKvGakHia0Zef/k9HPAsht+GzeUkroxtZWMCQ2STLroRkq
         FbqTR01kbBnrLWRZIyDwPLNuRZw8bHlvVIeiols+N3IWOXnQTDwnr76itERqCDK3hsXZ
         ftqKLC+BlDomCfes9K25/WuyzNNNMkx43ZllqSA63P/fqo0Y8nrvLk14aMTDmLSU3tmX
         DEurRNdYe9gDg4EtE+LjmrSjSrKtx9TtcvisAvYwwvXgU6rLgKJAohSbtf0H2B/+yt/o
         Sq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IEtc6WN0JMkgA1X93JOHMXDth957tk+vFhRSm4MpLAM=;
        b=Q9xzxnFi7ko4L8/8pkXZO+Let0KB+wijCz9yZsEsjm/NRiO2NuXU+Isu045JXLLvga
         FKm1t1/cH9iM5CEhI8p+8c5gO8tygP2WTwmBPaulrC00qCSi1Hu+zIhdU1S7n/hzz2li
         9FjfkbdLeQeho2L68VdRI/zuUiibrlxmgwv4EaQZLlOrctDUqMAFx7vkwfqnmlbBnBpc
         WcVuHh40+D3J2n0NsuzKlzPOOwWlbHrsRToPsJI2tVnH45C6dadVOX+yzvXRjEP3S45S
         AW2snrt3Njtc0gkCEbSELMxdoLCxdq+KGf6IFOzkdvQX02ReAKSybxR+dPr4I+/N+rj2
         XKiQ==
X-Gm-Message-State: AOAM530B/TOfKBMVnmmCo9DHURI5RN29BP8bABsVJe9E9gvzZnH/OQsh
        ivvCQP6saYM9bXjtmaN8zawsuoxpn5IZ9y4EW6vw0w==
X-Google-Smtp-Source: ABdhPJz8YKla708wW5apcE2e48dD+UxOPlSdmQcDXhRj1YqgSttTekZln8X6HfzXhD+WqceB5w0KiAl65c8UEeH/5gw=
X-Received: by 2002:a05:6512:22cc:: with SMTP id g12mr5427042lfu.535.1626221232412;
 Tue, 13 Jul 2021 17:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru> <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 13 Jul 2021 17:07:00 -0700
Message-ID: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

I know folks like to ignore this, but this patch breaks AOSP on db845c. :(

In the exact same way an earlier patch broke HiKey960:
  https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/

(which I still have to carry a revert for).

I get that this change is useful so more dynamic userland can find
devices using consistent naming with future kernels (but doesn't the
dynamic userland have to handle the case for older kernels as well?)
But for userland that uses static configs, its painful as updating
userland to use the new node ids then causes older kernels to fail.

I'm looking into how we might be able to probe and set the property
dynamically, but AOSP's init system is far more aligned to static
configs.

This will probably be ignored again, but it would be nice if we could
have a release where DTS changes don't break userland for one of my
boards. As it feels like its been awhile.

thanks
-john
