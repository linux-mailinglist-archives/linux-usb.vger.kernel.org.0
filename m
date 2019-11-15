Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86EC6FD1EC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 01:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfKOAXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 19:23:15 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44766 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfKOAXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 19:23:15 -0500
Received: by mail-oi1-f193.google.com with SMTP id s71so7044610oih.11
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2019 16:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RsrGyoqQOYTH2PPKiYL70RKRI4in0yNtJQIpGh3K26A=;
        b=GjufNMLb+2YWJLijLeqWGOvXAVzz4XsHL1I40V3nObyb3FekAhPvoAXapmoM3+HXQl
         4lXuWj5kAUZ8DShtZYDijjP4NLhLGvDJ4jZFRJmu+Lg5XQCKQj1vhFU5DfAoKfnVAxxP
         mkT/Lo7o3ATgV4w+prTyisBFmjzSxW1Z6Gnx47cfQqYV9BZdEIWIYZsD6Q0b8YBQsUe4
         a9j8xUqQXkmBtiLEwHAKNuPsGCarYjqGuqxsN3zKm2uuv9/2p/MK0I1+wKKGz0Hc/vPJ
         Swi3A+ww7I1gjZiAi87V35E+2V8ah7vDTvMDRrBc70t63sUFVwVUfl+KUh5nVHImZ/ww
         nvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RsrGyoqQOYTH2PPKiYL70RKRI4in0yNtJQIpGh3K26A=;
        b=pzkwPdxSmu6Ee6njTKjATxgUfz7dF8p6oZ1fLhLp0V72SS4XIQdfv7/2oAKdkxVehH
         +bi+8aehQ9n+1E285KNzID2v22mh6qIJ/4hWVT2pqusHhTi1EekJHEagQ9VH2aJDCCWj
         9RQbu3suwTdkhhdJmWtwSBG5y2O4PxJr1sXo7+3ktVnXccLlmGNeJf2mnqy7gBxVocog
         307rKLbrMAYA2LnlI4AXCYeUYsktdEguTHM+/WXzVJdiG5MHsDoYpNJ2LnlKGHf1Bb3Q
         T82LAXOj58cj8JY83aiSj+E5zN4oH0RETw0NtlRDgdpttvoFp9ky6vGph/lYkqy6VErH
         9KgA==
X-Gm-Message-State: APjAAAUr/YB3QRUEWYAA3UWY9IUJWLsNkzfN5/MDuMv6VE/5sn+t3W21
        yGraqFdjbB+JNYJf6w5uuAx4Le4DMAha4D1RCx8xGw==
X-Google-Smtp-Source: APXvYqxfcWlpb80bfV9/wf4du5Ri0OHkQNIq7dTOGMorsiq+ISYV3iyGYJ5gy6j6vXuX0krZDW5k5bg9mqAlmEdJMVY=
X-Received: by 2002:aca:c3cf:: with SMTP id t198mr5965693oif.10.1573777393028;
 Thu, 14 Nov 2019 16:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
 <b8695418-9d3a-96a6-9587-c9a790f49740@redhat.com> <CALAqxLVh6GbiKmuK60e6f+_dWh-TS2ZLrwx0WsSo5bKp-F3iLA@mail.gmail.com>
 <648e2943-42f5-e07d-5bb4-f6fd8b38b726@redhat.com> <CALAqxLWh0=GRod5ORpi+ENpWCkmY39mUw_=NV67sKY8qH_otZw@mail.gmail.com>
 <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com> <CALAqxLWHbhst5KXAGCswKVp7ztzFHxdb6nskfze+Jk+xWo2Ssw@mail.gmail.com>
 <7877d69b-b17c-d4a4-9806-3dca98fc9e26@redhat.com> <CALAqxLWE-8YkYmrKoP6-+2xherwsGZ8-CeUyOFe9YPQj6EuSpg@mail.gmail.com>
 <7ea7824f-abc2-4cf6-720a-3668b6286781@redhat.com> <CALAqxLVrEYT5RbL_R0tx_3jHzt7ZuWHDPuEwt1r2iXgPwR+Czw@mail.gmail.com>
 <f5c9f5a3-97b8-389b-47ee-cfa5ddb9afa7@redhat.com> <CALAqxLW5vYpGY1yLTvRefiX6anOGsPWW_Dc1Rj8kdf9+BDm0kw@mail.gmail.com>
 <5965292c-4837-5f3b-816e-287174c909ff@redhat.com> <CALAqxLXhmS2CsPRgjOdZHhzegc_z9pOse4C6oPH44ny9JJcf+A@mail.gmail.com>
 <2d98ea33-e128-6b38-8c16-c6339cb27fd1@redhat.com>
In-Reply-To: <2d98ea33-e128-6b38-8c16-c6339cb27fd1@redhat.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 14 Nov 2019 16:23:02 -0800
Message-ID: <CALAqxLXGFBcfdpzt+xznH1jqPfnL2KXG5eeCwz114ohgriT6tQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 14, 2019 at 2:11 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 22-10-2019 07:58, John Stultz wrote:
> > I'm fine to
> > continue digging and working on this approach, but I also don't want
> > to have to pollute the core code too much for this oddball hardware
> > (esp since doing the vbus control in the role-switch intermediary does
> > work ok - or at least better then this approach so far).
>
> Given the special nature of the hardware I'm fine with the OTG intermediary
> approach here. IMHO it is fine to just stick with that and to not spend
> too much time on this.

Ok.  That was what I was leaning towards as well.
Thanks again for all the review and feedback here! I really appreciate it!
-john
