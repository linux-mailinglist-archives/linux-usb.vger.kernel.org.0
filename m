Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEE71ECF83
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 14:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgFCMLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 08:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgFCMLM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 08:11:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7857C08C5C3
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 05:11:11 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s1so2436784ljo.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2020 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YfIwoVqhINbM8JX02JQVBFl5UwDmm1K0R0OAHvfku4E=;
        b=aWqv3ou5Qov3U3msHumGanAGhQDq5piVnxaH/XWJmipKJsOeWVNQIztptBeNCtMWG6
         99b3l7r9pG46qUjWpv+WoQs+yVkeYL+OHYfJzjhbwlgDHanfANKMk5J6k2xrDF0jApcs
         ITr+QKkVRhH2NduIS0rGnMoa1juq/PSUMUe+/Vobm+ot+3yv1cd8yFBR8RpnGpZzbD/i
         KGvscj/DzzzJcfsZ/B2RW2XxwxgRgDyru1kGkFLZGIOB4klILxvqMmjRjUexshZjeou7
         IWTl2Oef6qF/8FD3/+nq6Ege6qhULB4qLz6/BgG3qQflgRe1nkZ+ZiOB0fEUutqZ2TNb
         CrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YfIwoVqhINbM8JX02JQVBFl5UwDmm1K0R0OAHvfku4E=;
        b=jAC2LZlRAb01X9k1kP6oTp7Z460ISypZkcY/jgJlNCri+570fud2iGNo7Ssm6UgGCZ
         KuwQROdazj54dC3HgdZymzIiANiqbXAJeKjqoA8YTHR+bSp+PRf7fjtWWWLQhYaQ013p
         Ei2S2903BQu9KQ4DJmJaJ+6fJveftaXjGgfo+NYTaqIOqRgz90ljU5cKcg2LFX6pFWVi
         cHHqnkfXgYnNCFIWkTN10FqtN0Z8drmYrMAWmkCN3+RIJ2tSmAorMg/eiFVN1RW72mAZ
         mxmfSQmxf5bE93cgz3N1j+SCE4Wup5QYs6xKwr1GxpuOOyRmWUmdbbXWqHTbaxA+jA5C
         hS+A==
X-Gm-Message-State: AOAM530sFi/7SgrRbN6xEmoNAr+75FiVE1JcUcJBWDcasxzVuAEmzzAz
        gyqV3S4L/PUmQzuBKpzC1z/67pz1Hs8ahUgn8VncZw==
X-Google-Smtp-Source: ABdhPJwGPqax4Ku+Y+HnI5jIvzA/eJkmp5Pc0XM9c3bmnH0a+2++YRcBgL324sT+NutIXiJsU51+xCLtJmEUSqS/sw4=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr1798631ljo.338.1591186270117;
 Wed, 03 Jun 2020 05:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200513145935.22493-1-benjamin.gaignard@st.com> <20200513145935.22493-15-benjamin.gaignard@st.com>
In-Reply-To: <20200513145935.22493-15-benjamin.gaignard@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:10:59 +0200
Message-ID: <CACRpkdYu2As27M60ogUoLfX1z=XZSCSx5qTLwm5ADdf9Jy7HGQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] dt-bindings: pinctrl: stm32: Add missing interrupts property
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 5:00 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Driver use interrupt-parent field so update the bindings to allow it.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Patch applied.

Yours,
Linus Walleij
