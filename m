Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C242EAC63
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 14:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbhAENyb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 08:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbhAENyb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 08:54:31 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8547C061574
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 05:53:50 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ga15so9142502ejb.4
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1tEI6EDPcPTbP9hxMbb+gBmR1oX5WU/Ix6NbOGH1n5Q=;
        b=Jpl9E1MsgVO3a1gOB2ZFdIHrGm24qfQNEPSrg5/239Ia7fKTmhs+V5YzKChOL40rMu
         IQ1f2mbYU7FMwYKdgjauKjsGoV+7idSbJqTDwzeXpwB5MDj0VrdFyu4KVhIkPsG2sG4g
         K9VHjp0KlG8OiiiQcNLhWCnf1+XxHa4gYviId9Cg8pF7SFTjpb+fcle3W4f1wnVWVuaG
         +GYngmERyJrzy5F3aSX5nWlOqkyxrNHLBnYaxznASmJ93k1NoQUmmBpCf+wTIgZvwOv2
         2nQ/vmE0ZxSwGRfkZJ3ZmzmjP2UUAQTSe7h0HC5j+qO2Q2iYm1p4IgV7OGWkt3hygmof
         wx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1tEI6EDPcPTbP9hxMbb+gBmR1oX5WU/Ix6NbOGH1n5Q=;
        b=HRsXBdvm4nfnR890J2j57F9NUbqB8658TJNIfjim/IIaEvYp6Z0x1AdY3wUa2L7olE
         J+BefAlHbYGomumuR3VaJNomXCtPokcKS8YOvzVcJ7miFY0xpHDFQ5CSXSsWTXPylxJS
         IHVL6yF0nQATOzRQ8eMmw7bXVyhOGSshJHcqpDqRFxwYWtBPqv+0qrpgbLs+5F4RU3W0
         hZdcNsJ4YeblKYKj3MmKquqEfg3mJlbYu4v0SkqNMg/t9iZyVjzGMJicqj5uoVKMNCIr
         Cclv9Ng2tAMXGYFMqxn3hoOLg3Bw6CtMAZ2CrrbUG+ks0DPRUn3GQreM/aFHfJ/kEdEf
         fnKw==
X-Gm-Message-State: AOAM531a9JHUyOzAHioGh8FXJfpHywIiG+KOJXGIDZuu/e2l1obL70VJ
        ++5kNgsAW+r0FTToFa6HO744WA7o8HgJzb29xk4=
X-Google-Smtp-Source: ABdhPJz57lwDBU/5XRuN21tt+xbrP7H5FYxvKoMp0I4Ko0K5Ap5PYMjJeJBAPf0xF8DJj7Fu/uB9hdpsbzlqHiZwM1Y=
X-Received: by 2002:a17:906:d93c:: with SMTP id rn28mr70005653ejb.50.1609854829486;
 Tue, 05 Jan 2021 05:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com> <20210105092808.15817-2-mika.westerberg@linux.intel.com>
In-Reply-To: <20210105092808.15817-2-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Tue, 5 Jan 2021 15:53:33 +0200
Message-ID: <CA+CmpXuFcirdh_bp1=MmXr9KHJ2XdoMiBL9ORyntoFcxpJyJYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> In some cases it is useful to be able de-authorize devices. For example
> if user logs out the userspace can have a policy that disconnects PCIe
> devices until logged in again. This is only possible for software based
> connection manager as it directly controls the tunnels.
>
> For this reason make the authorized attribute accept writing 0 which
> makes the software connection manager to tear down the corresponding
> PCIe tunnel. Userspace can check if this is supported by reading a new
> domain attribute deauthorization, that holds 1 in that case.

What a great feature! Thanks for implementing it.

BTW, is there any general way to disable the device operations before such a
disconnection? The user has a way to stop removable disks, for example, but
maybe other devices need additional precaution from the user (eGPU?).


>                 Possible values are supported:
>
> -               ==  ===========================================
> +               ==  ===================================================
> +               0   The device will be de-authorized (only supported if
> +                   deauthorization attribute under domain contains 1)
>                 1   The device will be authorized and connected
> -               ==  ===========================================
> +               ==  ===================================================
>
>                 When key attribute contains 32 byte hex string the possible
>                 values are:

As 0 is available for 'secure' security level too, you may want to reflect it in
the documentation here somehow.


> +static int disapprove_switch(struct device *dev, void *data)

Maybe it's better to mark `data` as `__maybe_unused`?

> +{
> +       struct tb_switch *sw;
> +
> +       sw = tb_to_switch(dev);
> +       if (sw && sw->authorized) {
> +               int ret;
> +
> +               /* First children */
> +               ret = device_for_each_child_reverse(&sw->dev, NULL, disapprove_switch);
> +               if (ret)
> +                       return ret;
> +
> +               ret = tb_domain_disapprove_switch(sw->tb, sw);
> +               if (ret)
> +                       return ret;
> +
> +               sw->authorized = 0;
> +               kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> +       }
> +
> +       return 0;
> +}
> +
