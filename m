Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA4221664
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 22:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgGOUjo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 16:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgGOUjn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 16:39:43 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35554C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 13:39:43 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id q198so3237824qka.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjLLLG6oBzFqqQb/FVICVvK66QhiFvPZx95/20biE+s=;
        b=HUq9TNnMGjeGjZRx3aKmnV5V5uYNUQv43JULViBa73jQLQ/OijcIk120zTOLQ9/5Sq
         M2LKlsiNMmc4j11KA/qjet7PWjNrxLpbI/Juii0IA8yaiC5uJP/zYcBum5MKQfEWeoka
         A0tGgdVmOzXrkkBMVIpOALHoFbNjbqHiPUcKQZtFQlPjQ5Ij2qkJmqql17P0tXdaVUET
         fVEV7znmdGIeRBHWQT16I5/ukvdV+c4V0C7XKZE07nTBUavNRT1KTvYkr7APvJJBeUeV
         2KiUjPKqJ2bvjUf6bxl47pJ+WkXXqOWPxzbS/So2A5iXPr1/NyGOBv9fo7boHM7YDJLh
         nmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjLLLG6oBzFqqQb/FVICVvK66QhiFvPZx95/20biE+s=;
        b=Bg5gpfFAx00EDXzkslKheU4KhSmHUhzsjrUJ4PiSYFjb++33uT+c0cKG4nQ9oUp1cF
         X2zCkTIkvHccT3RCcpzDcRGfJBfkCLK/nOcSJPUzN5hZT1HYBxe1yqjqwTIOnzQOc15g
         xlev03tExpzrFJ1IHL1xp1vr0kLiVYiQ5DD6RPWedog+ZVK9wkKunK7t3FZVo+S3UZhp
         esVpE0KTTJHEFS5kcU9D1q/66qCFNjlBKIFDcbjyk8a5LpRAGMQ4W2YF64GY4HcSwF1y
         606cAgd/yrhpV7J7Fcb3am6iXanVdex90p83g+bwCEbT1IZKSJJuCWj1VPzAEwRBpFya
         o4bw==
X-Gm-Message-State: AOAM5329CqkJluTdXKjAb1LtB3uDwLeeTfVcZjh3XJSKpisYpTjpvKTb
        5aM23Pv24wPQqw/vIBYRPlX10AmQsg6qpYHx8rE=
X-Google-Smtp-Source: ABdhPJyNoChRnlGm9bdeXv2mQaTsQPvgodDqBKJ8xt6ukf7wetlJlSufjAz/XSNrySSjwyaeRgh54cC1ByIRDVwhv9k=
X-Received: by 2002:a37:d0d:: with SMTP id 13mr947191qkn.234.1594845582168;
 Wed, 15 Jul 2020 13:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
 <20200715093029.GB2759174@kroah.com> <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
 <20200715105034.GB2880893@kroah.com> <956ec3169eec6b121339ed6c1aedd0f7ca08db43.camel@davidgf.net>
 <20200715111210.GA2892661@kroah.com> <ed743fe1e0ede6d37bc4a62ba704f51c54c2f5bf.camel@davidgf.net>
 <20200715122403.GC2937397@kroah.com> <8ebe3fb975db65531e71fdf8a298e3b3f68ae3ca.camel@davidgf.net>
In-Reply-To: <8ebe3fb975db65531e71fdf8a298e3b3f68ae3ca.camel@davidgf.net>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Wed, 15 Jul 2020 22:39:30 +0200
Message-ID: <CAGRyCJFP07iUGSnmamHx5bSCdk69q4P5THcxh7BtYxqnA=DU5A@mail.gmail.com>
Subject: Re: System crash/lockup after plugging CDC ACM device
To:     David Guillen Fandos <david@davidgf.net>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi David,

Il giorno mer 15 lug 2020 alle ore 19:06 David Guillen Fandos
<david@davidgf.net> ha scritto:
>
> Since I'm not aware of any other commercial solutions (apart from FTDI)
> that use more than 2 ACM ports, could that be the issue? Meaning
> there's a bug somewhere and no commercial hardware that can trigger it.
>

Telit modems like LE910V2 or LE910EU1 expose 6 cdc-acm ports and are
working fine.

Regards,
Daniele
