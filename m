Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EE73094E1
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 12:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhA3LbG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 06:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhA3LbE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Jan 2021 06:31:04 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3973CC061573
        for <linux-usb@vger.kernel.org>; Sat, 30 Jan 2021 03:30:24 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id k25so12997364oik.13
        for <linux-usb@vger.kernel.org>; Sat, 30 Jan 2021 03:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rollanet.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NI8d0bltwLSrZNp2ZdWUEe045QTPOh5t4rEtgYWwbLg=;
        b=XA97/H+buH7CedfWXhC98cWVV2kJ443hItSNpKayMCU0O7WZRRxnEabh6p0AiDRrKY
         5UjbrC6YhsUCabGFySnI6Dpwnf3T8h45NYgL8cWKPUlLHbKkQyAJipJDqEOCIzBkScZh
         ML7c37za37bNH9DNF5EHcGeXwmUtz4EY/r+oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NI8d0bltwLSrZNp2ZdWUEe045QTPOh5t4rEtgYWwbLg=;
        b=UVY4fbZe9YYN3nKRStbZwH4EPYIXX+jgwMiEHITztVuQb65XpYey/jAEGB4qlCAbn7
         y0twr1/Jc8QRyLb3btrVU5C4G5cbwSdhQvFIaK+ihX6x4YTpr8KSY5GJl3zy3nK/MuiI
         8Ue3gBiQfW/Fp2204qDbFe791eoOZvlJJ+PaUydpLQBP6gXGPWEbO1nFOcGcqYToQRfZ
         qWDW9UjtdSm0HOz+CrycA3kKafo13ECCQppH4SNQaR94gzwqYVYDapicj/k0fOItysOn
         9cgIQvh3GFSRex4eRnZfg//PL9G7Ynri13xeGnJ2ydZti17gmIlllZDuepu1V6v5/2IA
         DasQ==
X-Gm-Message-State: AOAM5311FlGvkx56OdRmeXNlxl6+8rbJ0pygdyFHMGl+8TjMre0AoaWs
        jeFLGy5RcqPJqXCurTlZoNo7qmcR+K0z7LT5mjvNAweteQhw1A==
X-Google-Smtp-Source: ABdhPJyj0fCzijl0+LTT01gF0uRJh8rsjqvpC2U8EyX5fOgYLp8wU9qTvW5xbhN1HPoYLgbV59QG47PtMMPr8MXqyVw=
X-Received: by 2002:aca:4257:: with SMTP id p84mr5322079oia.176.1612006223632;
 Sat, 30 Jan 2021 03:30:23 -0800 (PST)
MIME-Version: 1.0
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
 <X/gwVvn09NFiIOWw@hovoldconsulting.com> <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
 <X/htEGiNbjGb2dy8@hovoldconsulting.com> <CADuz4OPCnq_4Xx-sWc-ZijoQRAZR-4+MRvpOx4np2rXifoCL5A@mail.gmail.com>
 <X/rtPpHMii7AxXPJ@hovoldconsulting.com> <CADuz4OPhcFSdRhw9pmjzhEwaLJMih+X-suZg=NRR-QwOq8410A@mail.gmail.com>
 <X/waQXmnsYGX3d1b@hovoldconsulting.com> <CADuz4OO9DnauGr5MwMupuZrKOxU7Jrr54-a2_vGGXRQTCxPc1Q@mail.gmail.com>
In-Reply-To: <CADuz4OO9DnauGr5MwMupuZrKOxU7Jrr54-a2_vGGXRQTCxPc1Q@mail.gmail.com>
From:   Joe Abbott <jabbott@rollanet.org>
Date:   Sat, 30 Jan 2021 05:30:15 -0600
Message-ID: <CADuz4OOVmpZtzjYFK7S=s+csAYnegjGpWE9KMh8enzmzEwn6Nw@mail.gmail.com>
Subject: Re: pl2303.c 110 baud not working
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 Sorry it's been so long.  Busy.
 >
 > So in any case, we'd need to key this off of the device type.
 >
 Yes, key off type as I can't find the relationship.  Windows
 uses a8 a6 01 80 02 07  for any request near 110  and switches
 to direct encode for anything near 75 or 150.

 > I noticed that
 >
 >         12000000 / 0x1a6a8 ~= 110.9
 >
 > Possibly just a coincidence, especially as 0x1aa22 would be closer
 > match. But perhaps you can try a few more rates not in baud_sup and see
 > if you can figure it out.

 Coincidence. 0x01aa22 doesn't work. Not even close.

 I had to give up.  Too many other things to do and hard coding
 is working for me.

 Thanks for your help anyway.

 Joe
