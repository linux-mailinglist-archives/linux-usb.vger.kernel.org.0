Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEC3280F0F
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 10:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgJBIh7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 04:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBIh7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 04:37:59 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BD9C0613D0
        for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2020 01:37:59 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id e5so160415vkm.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=RySDOEtGGD32o2QkU9ooGytFUyvPsgdbUrYkbeSTAvg=;
        b=LTFWpxGVP2jVAQntSKZAQHxbNVNA+KoNlw/ak6WT/nVoejIgy1ssijqxfhAYn8ViH5
         I8pvwCmIqEW1PlToqmm2THREtccRpxa8b7RFhUUGhifW/PYSAsGpLLFaKOFM716deS2V
         Y5rSOFGdDkl+HgQZAA6K1z2sQK8sekbjX2P4Qd80E0fcE4zIOWwI3YVos9BdJ7vzeabx
         hynyfXUdMGyc4XlhzHvCK0wQoTzl7iXSjsl6EDm/wreMW0oxnQG+nTlEaCSbOnejBm0U
         hs/Mg7CdB/DYY1FeGr3qcnvzmbN6ORnMK+0Nkk/EPQC7Zx/RMXTwByjmP2gEQ7u0vkoA
         Lr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=RySDOEtGGD32o2QkU9ooGytFUyvPsgdbUrYkbeSTAvg=;
        b=j3CaAB2qcsbnPLuc5jQbPsFWpf34R46kgS+6YNPixiRLwAXPyKmVCPBGYn3MCioPWj
         c29yy4gCwEVcnn7AQFp3ddXGyZnvnqBI/t1opnkGIywhO4aknREw4hO9JvpFvdkP2KG3
         WB81g4xn9zlL6dNMJcnqX5lxutUEj2cYgS8dpkcYrp3JZDRiL1IZkVK4z8Q+su863Lki
         zAXwsa40JW99WUr7PUQnNwdNcrtfhIS2IeD+rHvIhGsvv/diif3To9sas33qlO8bp0/U
         PU0MzKg53yB3u/J+p+Zxszc8yh4xr32bZjGTFKTE+ziDmOSMQG7D0VLKCmvpLNpovqGn
         KvUg==
X-Gm-Message-State: AOAM531CAHDqNyUScwqYnULMnnbZ2YYI+8EeVPLs86MhKhXTwKL1KpMK
        WjnOHt9Tqfueer7IyEKeqwWZaylF4qYzM39U134=
X-Google-Smtp-Source: ABdhPJyRvQtiKfVjgb2/pfQZv0qxRfTDF9c/tSc0RuIhox1yvPzES1Zn960play+Q6fdJ4DYmp7mBYQ8jz95K1FzA0E=
X-Received: by 2002:a1f:43d0:: with SMTP id q199mr358110vka.9.1601627878517;
 Fri, 02 Oct 2020 01:37:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:22c4:0:0:0:0:0 with HTTP; Fri, 2 Oct 2020 01:37:58 -0700 (PDT)
In-Reply-To: <20201002070148.GF5141@localhost>
References: <CA+uuBqbCtc3EB0zPUE1WJ9s_+=Oyc5aHzYqUug7D4GpcsgoJcA@mail.gmail.com>
 <20201002070148.GF5141@localhost>
From:   Mychaela Falconia <mychaela.falconia@gmail.com>
Date:   Fri, 2 Oct 2020 00:37:58 -0800
Message-ID: <CA+uuBqZg+GJk+7FNUh9V4LhCU5L0QSHsM_3Q5bVfsOecBkAnQw@mail.gmail.com>
Subject: Re: [RFC] ftdi_sio driver: use altsetting or cur_altsetting?
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> As long as you only access bNumInterfaces, which by definition is
> identical for all altsettings, it's not wrong per se.

But the code in ftdi_determine_type() that uses the altsetting pointer
is not looking at bNumInterfaces, it is looking at bInterfaceNumber
instead:

  inter = serial->interface->altsetting->desc.bInterfaceNumber;

> Yes, please use that for new code.

OK, I will make a new version of my DUART28 patch with cur_altsetting
instead of altsetting.

> > Should I also make a patch to ftdi_determine_type() changing it to use
> > cur_altsetting as well?
>
> Sure; it's not needed for correctness, but let's do it for consistency.

OK, I will include that patch as well in the next version of my series.

M~
