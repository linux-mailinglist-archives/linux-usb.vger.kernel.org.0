Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33629223B44
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 14:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGQMUc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 08:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgGQMUc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 08:20:32 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D79C061755;
        Fri, 17 Jul 2020 05:20:31 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x9so12334881ljc.5;
        Fri, 17 Jul 2020 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=xzsHmZiOOZnjl0fkHt5yynj4jNzDrNk9k+w/6nQnxPk=;
        b=ffTALD3wIkedy9+v2XugdKXVuNMCzWjzArVK+z65DifdNlLJd7PMWoSBHf51KuJXwL
         BLYk7w9SBw+OXBxhJyclCb0/b2yFBg+uyc1NbvesSS07FK3h++HX7k3jywI6t/FauaVT
         KXxSRCGOPTsZGqSBSQZoK/wijoYIct4KfOuAT3EO7TFkH3mFLmA4hawMiC92whx/hp38
         29cWINCVe2ltLGYvFB7yxxbQaolBkZM4QgGG3imf2qKYJuWovzBPFiL9/C45Fsv1A9hd
         zfZihwsc7Vxrg/NnOt1t54HxVjeEQoHoL67UTPicYpQpI6XaGymsiGTUgDle3yDbBInl
         RMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=xzsHmZiOOZnjl0fkHt5yynj4jNzDrNk9k+w/6nQnxPk=;
        b=iSDE1PUXDwJBDuxBl+dBDUXbhQrxBksHq54NEUTLBUnLpq/atAE2mDd5bW6suT5BbN
         rZ56xuZZ0kiJyuK3FGH6B6JPT4s4e62PKjAVfmkso/HQRs64RNGBqg+aiL3AiYeVk2Z5
         Os7DiayDihCegrpOfopnDws4hblfEPE3BprqjaOEM4s6BcF47pJDoi5NB0cQnC076IDP
         cI3D6l2fXyKkkHLazZ/l8sorf0Yn97fx/Wh5CwQ9oYMt1NHdI2Z6WdEYP0NIJkuvKXzT
         VKTX8jyAuhIvZj75y2hySDmpbffOMDYZUC6Yhly7FupwZlVgzcm1lNC05natzGYgVRRQ
         Afpg==
X-Gm-Message-State: AOAM5323FEP6e+DGf6znwDutxXG8N/Vjb2qLAnfTTOoM+ON8gFXzaRhl
        riKUum9+78akM7T6Zha7k4k8rHbeq0+SKt7Ozug=
X-Google-Smtp-Source: ABdhPJwRfJNqxB/TSwidfPWwC3vIZDhjmH337tzv/Qnfc7AFZgDOMHaxd7Ahds4D7DcCAW7piZm4tL+tD7OmDvx2jXg=
X-Received: by 2002:a2e:968b:: with SMTP id q11mr4043206lji.300.1594988430158;
 Fri, 17 Jul 2020 05:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
In-Reply-To: <20200714100337.48719-1-jaap.aarts1@gmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Fri, 17 Jul 2020 14:20:18 +0200
Message-ID: <CACtzdJ1DxH7UWxJkZeB6pzx7ua+CR_rOe_hZE1AAjG+txrp-eQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
To:     Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I found out that since asetek generation 5 the resellers put their own
boards in the product,
so the new patch I sent in has fixed all the things mentioned as
fixed/changed and is renamed.
