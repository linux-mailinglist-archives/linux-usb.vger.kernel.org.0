Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9DFDCE4E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 20:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505870AbfJRSjU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 14:39:20 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53008 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505856AbfJRSjU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 14:39:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so7169808wmh.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 11:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f4CnMsn4AbSRNn1EVCaabWmq8sv54L0ZTWdVo5HeLwA=;
        b=f1TWdlYaruRtAyn1ngSsZ6uQn90ArDxO5LBV1SCnegvCTBjunLuFQdCC5GQcOic5kV
         XFX4SOPayd3RrflTHaz9+t1hM4dPpdExngdo3PnFxk5kowUq+zvTsVLEbj2AUks6p20x
         iQHFEDttYjw/iF8/w/yPlasZfFcKXzwcThXlvx8iXO6IZu/+6bD9Si5igH998rahS9kD
         wCtSdgazQwuBZ7W127ThETW+39wbFdle7JTJlO+jOfYJ/a4KN4EGaVf7O2oRqubH7fEQ
         XdqNT2/L8jTS95upwtA+kgQwGiJxlXO8kpGvnzsiPJcVm/lBKiwBaH9+SueZ4aw1uEBh
         zaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f4CnMsn4AbSRNn1EVCaabWmq8sv54L0ZTWdVo5HeLwA=;
        b=hHn/1zU0MqDTqtWnf6UrgyHc/zB0PPUIbz996QMAc9qc4BCpgW9MySZGvAKGes3gc2
         RY29TD6Cq24qe9JdLEzkcEc7N0NKCbTq1njvrRz5MCvyJ+2rwWNByqnA8SyVoxlB3cA3
         9qWio2t560ZES2pq6i7ET8jy5mjpkE/um8SGpRgJ+hr+sTmWutcASLb84/FUZvGPVTNV
         rCxO3eZi4nbtEHvtM606gtMpsmI3SZQXjPT8f4AGJjHgM/3ZdSU3OEy0DbwvwH/ek+eh
         jjahH27XR1O6ving37e66e8klc2AMPZ7HsHfMPlGIrtJeUMJt/qNnfyknn2nLRMej08G
         7Ahg==
X-Gm-Message-State: APjAAAW5A2SGn/M2FEB74PViHbOf6ibY03fhUdbtK2EyIv4v019mC5cQ
        RSwO1VQ16cnNFcMaUCRG020VBIXNSOokBgwAR6fDYQ==
X-Google-Smtp-Source: APXvYqwQBRN+0AP3sy+6+jMt6ece72V8onGhRTBZvT/3iOom/I8z+sXUkSfEcU0M5YrBcGzh2NdoipI884i3PRHW/D4=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr8322752wmc.59.1571423957896;
 Fri, 18 Oct 2019 11:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com> <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
 <b8695418-9d3a-96a6-9587-c9a790f49740@redhat.com> <CALAqxLVh6GbiKmuK60e6f+_dWh-TS2ZLrwx0WsSo5bKp-F3iLA@mail.gmail.com>
 <648e2943-42f5-e07d-5bb4-f6fd8b38b726@redhat.com> <CALAqxLWh0=GRod5ORpi+ENpWCkmY39mUw_=NV67sKY8qH_otZw@mail.gmail.com>
 <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com>
In-Reply-To: <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 18 Oct 2019 11:39:06 -0700
Message-ID: <CALAqxLWHbhst5KXAGCswKVp7ztzFHxdb6nskfze+Jk+xWo2Ssw@mail.gmail.com>
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

On Fri, Oct 18, 2019 at 1:06 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 18-10-2019 07:55, John Stultz wrote:
> > On Wed, Oct 16, 2019 at 12:27 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >> Look at the tcpm_set_vbus implementation in drivers/usb/typec/tcpm/fusb302.c
> >> you need to do something similar in your Type-C controller driver and
> >> export the GPIO as as a gpio-controlled regulator and tie the regulator to
> >> the connector.
> >
> > Thanks for the suggestion, I really appreciate it! One more question
> > though, since I'm using the tcpci_rt1711h driver, which re-uses the
> > somewhat sparse tcpci.c implementation, would you recommend trying to
> > add generic regulator support to the tcpci code or trying to extend
> > the implementation somehow allow the tcpci_rt1711h driver replace just
> > the set_vbus function?
>
> I have the feeling that this is more of a question for Heikki.
>
> My first instinct is: if you are using tcpci can't you put all
> the hacks you need for the usb connection shared between hub
> and type-c in your firmware ?

I appreciate the suggestion, but I'm not aware of any USB firmware for
the board, nor do I think I have any such source.  :(

thanks
-john
