Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699C229603B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 15:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503632AbgJVNmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 09:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444568AbgJVNmx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 09:42:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E655CC0613CE
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 06:42:52 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t14so971238pgg.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kxwesvm7CvQAxawGi5468guP8tm7KIPJfw/4s/j0Bsk=;
        b=SX8oMJpC5qG0LtCMCHeJr52q5pYquJWCj84Eaa2SGn/H0K6n5F5j66AGyEhh6fbY76
         Sx4blFtO6WXRbbUAVSGSYuW0IA78//PIZXNAM6+65tpQr260RB/Shy3XkdNUA3OAO09h
         oeEgo9KJFV/bKafxminOQHgT2e6hva9rjG/VOS9Oiow7j/LmvSgX6wmCOEV/hYjvt8LN
         nUVDZSF2i1oJOl2rk2zjUGh+TgKlVE1oI/DNuoCKEQf5vRt4Lq2fvGVAmtVxP5X6vhxu
         GdLN8am5wwvPsLSv8Q+VX1HjXPg18/f5WFWyWPnPFQy3u3SD1rlK/2FVtCGfLqU6IufQ
         5JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxwesvm7CvQAxawGi5468guP8tm7KIPJfw/4s/j0Bsk=;
        b=cSAvZzPMue4WRO8CU9IWpQudyeB0op9LIujo62+M5PXEWwLSMBVAp/YhfPqnQR8NuC
         UcihL9znpm1eMXbHMk2RaMsGhaCSXw8Cs8tRx4iU6h9AOKg/9+yE023c2J5du7dypABy
         AcUyGjuUGm5I7IVHmk5n8hJP8uZUJT8A6Vs2fFm25SoRPTJo2vk2Jz93+61hOJPsq2Uv
         3H/U5NOY67YG9v5d8XixkUsOlljLlZsEFUFDq2iH/jVqnG0E0CA2GnPQAU6ARNaxdYpJ
         q+tW/iadLU0hzS8o7nwWYghc0yv8/Wuo2SwVQXM3SqT4sUM5BE+HJ9p4JPgjulDLsJ4g
         jajA==
X-Gm-Message-State: AOAM5322jKcOFQn6ERY+Hkd1rlsFwt3U6OReDw04kZSKkTVwSfUIFXcF
        N9S+PbzAYIrzpXbxSWUax16gIcGf73ts1dnFIgU=
X-Google-Smtp-Source: ABdhPJxBdG0GBrLxP8DCQkSebCavm+/dBNJpdB0Dlx1J/b3sgtC+jppQqYQhM0qeG5cpNhgdKDyAGgusZnRZFKnA/Gk=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr2249904pgs.4.1603374172514;
 Thu, 22 Oct 2020 06:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org> <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com> <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com> <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com> <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
In-Reply-To: <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 22 Oct 2020 16:43:41 +0300
Message-ID: <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>,
        Heikki Krogerus 
        <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
        Andy Shevchenko 
        <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> Ferry Toth wrote:
> > Op 21-10-2020 om 21:50 schreef Thinh Nguyen:
> >> Ferry Toth wrote:

...

> >> Oops, looks like I can't make it synchronous this way. Can you try
> >> Jack's change to the u_audio.c instead?
> >
> > Oops indeed goes away with Jack's change, but usb connection goes
> > up/down continuously, meaning: my host sees usb network and audio
> > device appearing / disappearing.
>
> Ok, thanks for verifying that it went away.
>
> > mass_storage device does not appear all.
>
> There are some fixes to dwc3 in kernel mainline. Is it possible to test
> this against linux-next?

I think the best is to wait for v5.10-rc1 and retest.

-- 
With Best Regards,
Andy Shevchenko
