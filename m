Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814CC2B98A4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 17:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgKSQw0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 11:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbgKSQw0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 11:52:26 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0567C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 08:52:25 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a16so8899012ejj.5
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jhdam4JJsmZDRNdv/8ctzT1YWmG7aOPkP3XgPug6Xf8=;
        b=g1eVIvfGEb3iPccEpV/gEtqgoX9z56/YQWY5DkTddu5H18sMnJVmpfnuaPHPsMARVd
         zfSlStfKjpgngh7BSGzTYr5J2leRBggAntmn0zIteyw6smApBre6vG/Cxu+AG3kcmOOK
         X73rr3GW6l1oFviHnX9Zrk7j3d3o9l0bwff2J4z5qW2c1xVqIlpTU4Y26YsMZzsxQaqM
         1E5wD6qeDuWJrZyqve4tDFVfIPVU4vdCv2CDujlWntZcrSZbF9P5MIbP7BEmUSkVO6YA
         GaaMTzpSCL4wZvzA9C0k1B9dXHdHSGkak4SMLwFZ9kR/8uu4xrg4XpsrR9PZ9ncsR7C4
         JbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jhdam4JJsmZDRNdv/8ctzT1YWmG7aOPkP3XgPug6Xf8=;
        b=dgthaoHDAHU6AjNv41swsApwottChTxy1YeeH1mmAHCSu+tCLAI9j/kCMjr9iLbYmV
         F3ctQEwNTGwmaq+lGBg8NJX9MsX8hK46WDSlQrPW6S5EvQM5R1jAs7CEO3vEGPeOz0Ly
         Hj20iqXXyLu90RZW+z1/nJZ5UbbFCuW0X8t5N2Nfls/U/OelQ/3VxdaIZ+OqBn94cm/T
         Db/jeinIO1B92QJuz0QzAKKbX0YjoGakdIMeLsvzuk/gGmPcXBPXBDTUWL+hLSnJ+eny
         BRQ1XPsdiY0A2n8j5KbG3bwCjqhNfWCPAltVKyyg9XcToyoOdU1uLMm2dH8fiyZowD/W
         +7Uw==
X-Gm-Message-State: AOAM531BDKFuz1wEs7RXyAWxysJlNuS7LOtjx9nfG+6rlXmV0A0Bz52v
        s0nk9WHKe76bFCi82yMuVQJC/FSMs4iEAsyV568nzw==
X-Google-Smtp-Source: ABdhPJxhwBAUBSg9gYreNM8WYQ88mROFKajVFdUyPF+aKgNI2kMM3Lg3IC1yuEg7tvhDt6NscpdVa2543+oRaYITtrQ=
X-Received: by 2002:a17:906:11d0:: with SMTP id o16mr4712406eja.25.1605804744033;
 Thu, 19 Nov 2020 08:52:24 -0800 (PST)
MIME-Version: 1.0
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com> <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com> <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com> <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com> <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
In-Reply-To: <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
From:   Ross Zwisler <zwisler@google.com>
Date:   Thu, 19 Nov 2020 09:52:12 -0700
Message-ID: <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
Subject: Re: xhci problem -> general protection fault
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 13, 2020 at 1:45 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:

> I've been focusing on this part so rewrite shouldn't take long.
> If hardware is still giving incorrect values after this we might
> also need a quirk on top of it.

Hi Mathias,

I just wanted to check back in on this and see how things were going.
Can Andrzej and I help test anything for you?  Have you been able to
reproduce this issue locally?  Anything else we can do to help?

Thanks,
- Ross
