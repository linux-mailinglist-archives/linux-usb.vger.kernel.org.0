Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E02942CCA8
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 23:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhJMVSy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 17:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhJMVSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 17:18:53 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F7BC061570
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 14:16:49 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id c28so3928719qtv.11
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 14:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGgmeYJEA+hJC6d1SbOgu4fzoGVI+BZr0QPmIbJi7kQ=;
        b=E1DRIM0q97FmUpIKXSaVqe1NBg/ssaACiSTuQ5kH73Q334ceeF6am/DnoeEV9AYaGT
         fo69QoKvWk7RDEzE0C/nmPQbCrWMFScJMvJPzpBK0QBKU4UIhkXL5+QYolnwlSV5Hz32
         UcZBGdrzwuJ51kCW+/NN422G0mB57hI+UvHg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGgmeYJEA+hJC6d1SbOgu4fzoGVI+BZr0QPmIbJi7kQ=;
        b=BymggixzEIZgCdoSeJ3qvUIlUdRqUtH2LPeXjLD2uzZLSC32aFVtKVzOppphG6I2Y4
         WufWfJkQJLJRAZiquegHLTZKeByADsvoTDTzsaK9Lo35Bv0/K75LAjo7Ydd/iW9tWMck
         MFhsTTKzWetaW2bNGcN+1WpO9vXTtW6J+yEDEg+Z20LYDagdeziDJNPM+sgRFNJ1TIWQ
         m5t0bTyl5dyHlKlkIe/VRrOlBanqDSMkKkgOrlicR5YrQYlW1acr80zhArZhq+wrnvGN
         4vXhDStJA87Xg1+gnTnFMlc3l9JMXP/oFKtNfNjEbzcR2hiRQilr7Gqkog0C665VRVmD
         W7zw==
X-Gm-Message-State: AOAM531AD+GYcN5yw5ZhZgEi7O+sOTbCcCWjXEbLe3R/6IOBf8jGGApD
        rrvx1uDDATeaKdX317zrqCTJSoRGQ3B+YBmROX1XDg==
X-Google-Smtp-Source: ABdhPJzbLrOl806aiITElI7kNcmtlLZXVpaMcfStIM79CmRGVv9qb+bPogtcTInWREI6yRv9NWwaCilOEow0dXgRpp4=
X-Received: by 2002:a05:622a:1807:: with SMTP id t7mr2029243qtc.140.1634159809094;
 Wed, 13 Oct 2021 14:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210407065555.88110-1-heikki.krogerus@linux.intel.com>
 <20210407065555.88110-3-heikki.krogerus@linux.intel.com> <YWdBZY7vSWO7DN54@google.com>
 <d82e9972-0d30-f9f4-9333-de57146d5543@roeck-us.net>
In-Reply-To: <d82e9972-0d30-f9f4-9333-de57146d5543@roeck-us.net>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 13 Oct 2021 14:16:38 -0700
Message-ID: <CACeCKaf4OOkzchrNMfWF5Y9ayrfKcyJtZ6XPHaBUzc7K6t+e+A@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] usb: Link the ports to the connectors they are
 attached to
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 13, 2021 at 1:57 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/13/21 1:28 PM, Prashant Malani wrote:
> > Hi,
> >
> > On Wed, Apr 07, 2021 at 09:55:53AM +0300, Heikki Krogerus wrote:
> >> Creating link to the USB Type-C connector for every new port
> >> that is added when possible.
> >>
> >> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > Did this patch eventually get merged?
> > I somehow don't see it in the "master" kernel branch [1], although I do
> > see the commit in that repo [2].
> >
>
> It was applied but later reverted with commit 5bdb080f9603 because
> it created a module dependency cycle.
>

Ah I see. Thanks Guenter.
Hi Heikki, I was interested in knowing if relanding this is on your radar.

Best regards,

-Prashant
