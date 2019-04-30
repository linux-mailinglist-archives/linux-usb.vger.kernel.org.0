Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4AFCAE
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 17:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfD3PXW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 11:23:22 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:41813 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfD3PXW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 11:23:22 -0400
Received: by mail-vk1-f194.google.com with SMTP id q193so1906895vkf.8
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vEDUu1mzojfttPFnsI8BLY/6XWBdLDT7OktJ1KG8wg8=;
        b=lEOu5ISpyiG6SYi/Spqo6aWLzjf3i3+XbXoen+uaV9tV3XDOu8kTX1gG6hAaf2WEm2
         QE4wglp6LO8uGG1sCDGBS8yV6E3TkUWvkoAoau7wGvIwoGQ+544+T3wrIeyCS3pwmtOk
         9qNfqOVpfRT/ZhEOS4IXMi6bZhCQ0bd4MMIe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vEDUu1mzojfttPFnsI8BLY/6XWBdLDT7OktJ1KG8wg8=;
        b=GjDeiz2DO9qleriQ12js2s9sVm3TtEOUmxUqcRqeoBYoVcTWzLdA4krkf3by3I+zZ0
         HAQn3s0rQp2MHXBhO2y57DCBU88qB5gzH+gBlaUG82vBAsSVVH7VSL8oK0bBacpE3z7t
         cw6sg+fBgBxUwiNEDQAHt0JS+PlwTj4mP0BTkcAxKrjLyuXdeDgt3yoSFutO8kV8HyMO
         FEdLR+KRF5Lqb8V6wZb63E/M43CWI7eK86X4SKTJYgu+iBTWYA2yxmoKYQQ5mhe1wWrS
         Qz46jjNqyVRyopBMO4CWrCtNZwg8IWSvHf0l4metmhbEkl7cag2iCYS1MWnTMMlex+Bb
         RSLw==
X-Gm-Message-State: APjAAAUHZUGM22KizdfX9UaO35L/A2gOyLAjm28ZMn0lcg5jmXyr0c+f
        QRI9kma4SoTqP1lpLdAhJ9dFYfKXov4=
X-Google-Smtp-Source: APXvYqz0iKz1jv5+KDC2HAvOyGqs4D51tvixdGXI8uMESU1dpj4MxP2kbTsZEA2rM9Fgk4ZqAX6oig==
X-Received: by 2002:a1f:264b:: with SMTP id m72mr4768533vkm.43.1556637801302;
        Tue, 30 Apr 2019 08:23:21 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id s16sm4791221vks.39.2019.04.30.08.23.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 08:23:20 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id e2so8193712vsc.13
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 08:23:19 -0700 (PDT)
X-Received: by 2002:a67:7cd1:: with SMTP id x200mr5313157vsc.144.1556637799296;
 Tue, 30 Apr 2019 08:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
 <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com>
 <SN1PR12MB2431B8BC296AF49152702868A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=XFd-Uk_beUr+5djbi-93eWENGu5z5td7V3KPqpuoeiig@mail.gmail.com> <SN1PR12MB243103882D0C119575275915A73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB243103882D0C119575275915A73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Apr 2019 08:23:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UD6MCRGik3RWQ1ZjvHUT-zTrR3+oOiN42GignFAXd1wA@mail.gmail.com>
Message-ID: <CAD=FV=UD6MCRGik3RWQ1ZjvHUT-zTrR3+oOiN42GignFAXd1wA@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] usb: dwc2: Add default param to control power optimization.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Apr 30, 2019 at 5:45 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> > If setting "power_down = 0" is wrong then please update your patch to
> > remove all the mainline code that sets power_down to 0.  Presumably
> > this means you'd want to convert that code over to using "power_saving
> > = False".  Perhaps then I can see your vision of how this works more
> > clearly.
> Yes this is a good idea.

Actually, I have a feeling it won't work, at least not without more
changes.  ...and that's part of the problem with your patch.

Specifically dwc2 works by first filling in the "default" parameters.
Then the per-platform config function runs and overrides the defaults.
If the per-platform config function overrides the "power_saving"
parameter then it will be too late.


> > NOTE: I'm curious how you envision what someone would do if they had a
> > core that supported hibernation but they only wanted to enable partial
> > power down.  I guess then they'd have to set "power_saving = True" and
> > then "power_down = DWC2_POWER_DOWN_PARAM_PARTIAL"?  I guess your
> > vision of the world is:
> I have implemented everything based on programming guide and data book.
> Core can only support hibernation or partial power down based on the
> configuration parameters. There cannot be two modes simultaneously of
> power saving only one of them.

Ah, this is new information to me.  I assumed they were supersets of
each other, so if you supported hibernation you also supported partial
power down.  Thanks for clearing that up!


> The power_down flag is set to DWC2_POWER_DOWN_PARAM_PARTIAL ,
> DWC2_POWER_DOWN_PARAM_HIBERNATION or DWC2_POWER_DOWN_PARAM_NONE while
> checking the hw parameters. So it just indicates which power down mode
> is supporting the core.

I don't think this is what the params are about.  The params are about
the currently configured parameters, not about what the core supports.
This is why all the other code checks the actual value of the params
to decide whether to do power savings.

-Doug
