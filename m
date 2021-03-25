Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2360E348B64
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 09:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCYIST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 04:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhCYIRy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 04:17:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADCEC06175F
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 01:17:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i26so1256104lfl.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L8PunBZMBDJqT6+7DSD8xJ6sQc9MVslvyWctyjXnFMA=;
        b=xSGH1rsiDreBM2v7h6QZARA6hi+U6q8I+sZE17hYb1KLFzDawnKz9hfLIJBEyliXD3
         B+O1s5eApZMDD8qC/947Ax5A2ho1+uV9YhYM+3X2+G5OUaW6wndJRWLANNihQGpnzamG
         ym4QGE1bc0KDMaS3JmIVYujfm7/28M6AIu+eTMrOyPTfDXiCmEEz9gAH6fLqkxbZVOfh
         FbDjnHtVVI7kMO6yl6LzsIm6xutR3zmRuv3uxqA7hx7t+3KHvTvoatpzVW5j4uVmF9Oq
         B8zPuHlhz90vej5/TlYjskYSqLZn+vkPUNVWEUvIYTRq0q1YH2ThLxgbNHynZF5RsyhH
         SUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L8PunBZMBDJqT6+7DSD8xJ6sQc9MVslvyWctyjXnFMA=;
        b=tQLV77EDz3r5QWzX/RhCAc0vz87l6u5vL3fplITMvl1YsXwGJXIJ4ofR3FXA+MuQgR
         pphMuFTSK4xfuHIO4xlbXmluqScdt8z6CUZCi8EOAGdpbJyimO/jhGPLtQec8OgKvbgW
         M0edCV8ldDFTMSovNKPYnHG4yY4kK0pmERQwnCIfvVL48d3I8Di0NlfS8iWtQI5FTLi1
         w/GkUT3naBZFN0wySA2O5jox/nHA96bdm69g/5qd2XAwT83G+1oaDI9rfJVRSyVX3Y9v
         k1PjNKYkw0KFKI/BxKR97xwGiuYVmJ/E+jyQ/Xtm714mpMulcdt1CqWxv8M7WHwCQqE/
         WhXA==
X-Gm-Message-State: AOAM53342KuSTNYnnQbYTurz6yFn0a3XxaJmwWtRqewIdEvwpKc6u68o
        g1XlBjj0Kd3XXPO1dQosXPrkvnk3lFYrEgadF8xuoTHGO9u+NFfa
X-Google-Smtp-Source: ABdhPJwjmsT4IiciyKlOv5cd8a7JZTMK2XLFdW1JwQB3NSEilvgDkZ2ZKmGcXwnp4yWp4V3SfhS51S/NDBqMtg/dAow=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr4411060lfo.529.1616660272746;
 Thu, 25 Mar 2021 01:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210322211149.6658-1-andriy.shevchenko@linux.intel.com> <20210322211149.6658-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210322211149.6658-6-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:17:41 +0100
Message-ID: <CACRpkdazP849L8BG18Vnuj7V+22WiWJVg3gKD9zzPCseLCp2cg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] usb: gadget: pch_udc: Provide a GPIO line used on
 Intel Minnowboard (v1)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 10:11 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel Minnowboard (v1) uses SCH GPIO line SUS7 (i.e. 12)
> for VBUS sense. Provide a DMI based quirk to have it's being used.
>
> Fixes: e20849a8c883 ("usb: gadget: pch_udc: Convert to use GPIO descriptors")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Excellent solution!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
