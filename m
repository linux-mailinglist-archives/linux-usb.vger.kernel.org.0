Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C34A81674
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 12:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbfHEKIQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 06:08:16 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39109 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbfHEKIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 06:08:16 -0400
Received: by mail-lf1-f67.google.com with SMTP id x3so3688144lfn.6
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VmJocWvsymOdQ7NU7/6yMlP4/6K5DwEx+usK89GVi9s=;
        b=kyJZW7fZfdLgtDs2aKngH2TyuWTJjTeVTLZyRgxZRY9MQ56FWUw3A52lCdt4c4YJ+1
         3TgWOde1fzdSqgTWIgbjzvsDeaFtKgXf6SuYKrrM9YK82qK7s6dWcsjao4CGSwv8Ahlt
         Crwmv8+ySmVuExNcK9irfRd7xd4YEh9epWXPM2OVxpgaQ8bRFBbu/lNMcWXb245BCABI
         /yNpf25WGiE15uDcA+a++0LXluCfysTo88g0q7Hcvunkj67HSTRYbpqtQilt8t8aWCuR
         NoBItyc2gaayKuIzBJdFKFHEpFkdC+iXQWdc8it3UQcFXi36FqTMsdYN8t8x8xKnWrM8
         44vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VmJocWvsymOdQ7NU7/6yMlP4/6K5DwEx+usK89GVi9s=;
        b=AUd4Fd+hp4NHEl2gAYGWgv0QMKelz6Dkamcsocrfgi/w/DkMQiJIIr/YNNHnq1O/VV
         UfHysO8estQ9XA8jv4g2JqLruTO4pTFPSSwBaO35SGkKbmUucxsOANNLRfDi3jVuE3mF
         zqz4Vy/ru1aj5NQkW/+FFq0ungfhipxbRtKNS42ykXy7sD85083vJHt5l3a7wTY2dymh
         21Nx3nNpT5qAg7yQjLiXore/XcsO/yH5QrsUgggvaoF44Yy56UU/bkq9tQzbyKie6TPp
         yXmiOBFeR8wrur/SkWsbfcHE5Wfn37rn54EjI0Cv64xMmF8/MVdAXdX1sIGFhTG1fc5N
         gbYg==
X-Gm-Message-State: APjAAAXodYpAjHSwxdmj650/GfNxFm/9N7NzIO1GAztPru5xw4K7wvsC
        wUW9PR7vWyibZIcaxijlyzumlwD/Bphw9i/0w7qbcQ==
X-Google-Smtp-Source: APXvYqxpqm0yndDdT3beIa5MGWi8lTPoZhzSa/lWFiqq6Dn3b88/pHlyJgXWVtBOlC/fjyLdOtrrqUOtG4JGHdovYiM=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr60787048lfp.61.1564999694066;
 Mon, 05 Aug 2019 03:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com> <1563958245-6321-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1563958245-6321-4-git-send-email-chunfeng.yun@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:08:02 +0200
Message-ID: <CACRpkda5OUEfZRSMA-8H5jnhSan+VJ_3KB5CvOaRdZP1NeJQ+w@mail.gmail.com>
Subject: Re: [PATCH v8 03/11] dt-bindings: usb: add binding for USB GPIO based
 connection detection driver
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Li Jun <jun.li@nxp.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Min Guo <min.guo@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 24, 2019 at 10:51 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> It's used to support dual role switch via GPIO when use Type-B
> receptacle, typically the USB ID pin is connected to an input
> GPIO, and also used to enable/disable device when the USB Vbus
> pin is connected to an input GPIO.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v8 changes:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
