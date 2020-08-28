Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9B22555D9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 10:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgH1IAX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 04:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgH1IAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Aug 2020 04:00:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EA9C061264
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 01:00:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ls14so168338pjb.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PTSZwOvmd8hsoHlVT3wY5Y3CJ5kZ77NPHrIjGIbwYUw=;
        b=M2IAEoDo4E3zyfcmMI54faadFZp5+oZmu2y+07+gnyeA2B6K3YvWAITVmNhhrawFvM
         ayYK6Zbpppnq+QInfKuBJpM3Kg274lCuvSJIVpbD7OC34RwaS/ybGChcSLMI5MHvY/LA
         EEc+kAh2pY2MS9r+NVnDzx9wl6+CPq6QAv99AB4D4/CQg7qqHF08Ik6qanlsqHqULTKi
         bWKWfMhSs3v74S+j3PG8tkuLnmenF+SeOiAHnYlIPRqqQ6qPbYzg7x6yeKeHJM2YzimM
         rbF8lFxDn2NE5RYNyyzxj3jXT0d7seIFta2wYKXGHKoI+uK06yqfeXb7xZbv7j6+o+8D
         IOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PTSZwOvmd8hsoHlVT3wY5Y3CJ5kZ77NPHrIjGIbwYUw=;
        b=HZTq/wnHMbZXxwx+XFrCpqx9gGuPymHBUgcYyZF6hl9kQli43q8ojm046QmGIEUk26
         WkCy4/FJcWYHGVF6suBK3DGNRIS1dVx565S/OjBm7QX4XYvD/RSjUBAwVBM8oqki5B/3
         h3aNnDj3eFcEMVg8QpeGFnEAF1R8iaKqVoW9IOh0DuvASfV7S3ksb0rxgcRRFNEQJ+i5
         5plkMiZhfD7RxS/xR5jXtW0/VBx7oaZ2HaUUYMwDDmqVbxc8P5DRNhAKnASbNFo+S/iW
         SirosTP6/tXz2y6p/nHCObPzab9kDWZlrBaoxx0pHrwNhYbpTJdE36h65a8+X6vq3tX2
         6njw==
X-Gm-Message-State: AOAM531bWmcPwy1LOjpt1Vaca0otoJSfPCjXYn/F4QkmT7S0vcjMjhXY
        VbnGm7pNFlnkSbvFXlIJk2N34tAkPZ7olSFYPm8=
X-Google-Smtp-Source: ABdhPJwLTcqWBufu/IELgrmoM20YFsPjoErnzZG30RqB6EC1s7V1WNdiRlek/uguBUQaPLJe1jnPa+dkGe3G38zCogo=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr341800plr.321.1598601622048;
 Fri, 28 Aug 2020 01:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200819100826.69716-1-andriy.shevchenko@linux.intel.com> <20200828075134.GB993816@kroah.com>
In-Reply-To: <20200828075134.GB993816@kroah.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 Aug 2020 11:00:05 +0300
Message-ID: <CAHp75Vfbhpy9JYjdZyg9Y5TVb_m2Yz0MQeGm20JLAOd6KEVO5A@mail.gmail.com>
Subject: Re: [PATCH v1] usb: hcd: convert tasklets to use new tasklet_setup() API
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 28, 2020 at 10:53 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 19, 2020 at 01:08:26PM +0300, Andy Shevchenko wrote:
> > In preparation for unconditionally passing the struct tasklet_struct
> > pointer to all tasklet callbacks, switch to using the new tasklet_setup()
> > and from_tasklet() to pass the tasklet pointer explicitly.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Does not apply to my tree as I think someone already did all of these
> conversions.

Yes, that is the case.

-- 
With Best Regards,
Andy Shevchenko
