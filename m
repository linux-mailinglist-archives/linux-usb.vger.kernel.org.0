Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32D9361839
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 05:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236871AbhDPD2s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 23:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbhDPD2r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Apr 2021 23:28:47 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87826C061574
        for <linux-usb@vger.kernel.org>; Thu, 15 Apr 2021 20:28:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a36so18651035ljq.8
        for <linux-usb@vger.kernel.org>; Thu, 15 Apr 2021 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SeY4DFweXMM7grZDjK/X3xn8cvUn+vH8/+lDJpoo9Fk=;
        b=HhByXB8hEIe54l1AMKf1jZbdP6GjO3WbCfM0SXPOO13tEBppBXQ4BDAkd4lwefGEOf
         jc1a/2dUVR6sgD8FK/jowMTFkedl7c2rvBqwVY2narvIz17RLPPW9XS35+NkwakVqitx
         azF84omTDsC/UAhtKaq6zX8En01IyaA/roI2Knz2I3mwEllAPInXsfn3Xdevad4MR0G/
         lvCeXQHDBAjMDYmrzfW0xIEvRV9hv43vojF/4mL2r+Dicp69iDQzusDXrm9RK0jzh9wA
         /nl5rCYz6yzsZW8TqI0kRaD0anQDOJLXcW2PhEmVOFQ1vrN4X0vtMvHmDuxHjtagTWXd
         4t1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SeY4DFweXMM7grZDjK/X3xn8cvUn+vH8/+lDJpoo9Fk=;
        b=J1TfDxJhkwBezd+nu6ulkQIKM5+NPzSCPtKEMcHLZq1cwKRXwVaTyY43QvQzYILWwc
         w3KqPp+FEXkuds3F2nQb2BAKqXeKJfVCrKvegJoj6nLLnt1MBt4QVWf6zmLkRjaNSWLN
         /bLFh7L4bRORbTPNaOE7qOYOK4PM9e2OApUK6f3Fb6MXZ5BDzMA14BNLJGa787D6FPTp
         dp+LKHyYC25HAJzsCls3iGKsgNkcCSBUbBhY/YWODANefjtDVYKG1lONyxn8GYhdtz3z
         0y25+VJqJ47HvFJy51WbjUaxX8Nd5FVvkcJITFfpwDg16iirF0nLnIyXHaRZV3H7KS+c
         ojUg==
X-Gm-Message-State: AOAM532pnj9YF5GEaKTZR0roMkp4Tp5H0DuOWQzQ2oHopkWh6dQ1F4ae
        zNL4AvUX7WeAlBSBbNHRcOdFdq71QZ8dS21jQfvtjQ==
X-Google-Smtp-Source: ABdhPJx9IyovMrytd4ANdXeG/fpAf5mxvDv4hbubNwy4uHRWLzM/hAiHpOAbamZ+0EMnjuHXWEGYcDJn5k+aSZui9qw=
X-Received: by 2002:a05:651c:1243:: with SMTP id h3mr1382264ljh.128.1618543701988;
 Thu, 15 Apr 2021 20:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <2cb4e704b059a8cc91f37081c8ceb95c6492e416.1618503587.git.Thinh.Nguyen@synopsys.com>
 <374440f8dcd4f06c02c2caf4b1efde86774e02d9.1618521663.git.Thinh.Nguyen@synopsys.com>
 <CALAqxLW9d-jWC4qyfWvTQAYT-V7W19tFY+v3pzCE_QHfNYeYTg@mail.gmail.com>
In-Reply-To: <CALAqxLW9d-jWC4qyfWvTQAYT-V7W19tFY+v3pzCE_QHfNYeYTg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 15 Apr 2021 20:28:09 -0700
Message-ID: <CALAqxLX0b=uZ4JQX1h5PLRUq+B05wWOt2=QSO_QoO8rdMWgp=w@mail.gmail.com>
Subject: Re: [PATCH v3] usb: dwc3: core: Do core softreset when switch mode
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        stable <stable@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Ferry Toth <fntoth@gmail.com>, Yu Chen <chenyu56@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 15, 2021 at 5:12 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Apr 15, 2021 at 3:20 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> >
> > From: Yu Chen <chenyu56@huawei.com>
> > From: John Stultz <john.stultz@linaro.org>
> >
> > According to the programming guide, to switch mode for DRD controller,
> > the driver needs to do the following.
> >
> > To switch from device to host:
> > 1. Reset controller with GCTL.CoreSoftReset
> > 2. Set GCTL.PrtCapDir(host mode)
> > 3. Reset the host with USBCMD.HCRESET
> > 4. Then follow up with the initializing host registers sequence
> >
> > To switch from host to device:
> > 1. Reset controller with GCTL.CoreSoftReset
> > 2. Set GCTL.PrtCapDir(device mode)
> > 3. Reset the device with DCTL.CSftRst
> > 4. Then follow up with the initializing registers sequence
> >
> > Currently we're missing step 1) to do GCTL.CoreSoftReset and step 3) of
> > switching from host to device. John Stult reported a lockup issue seen
> > with HiKey960 platform without these steps[1]. Similar issue is observed
> > with Ferry's testing platform[2].
> >
> > So, apply the required steps along with some fixes to Yu Chen's and John
> > Stultz's version. The main fixes to their versions are the missing wait
> > for clocks synchronization before clearing GCTL.CoreSoftReset and only
> > apply DCTL.CSftRst when switching from host to device.
> >
> > [1] https://lore.kernel.org/linux-usb/20210108015115.27920-1-john.stultz@linaro.org/
> > [2] https://lore.kernel.org/linux-usb/0ba7a6ba-e6a7-9cd4-0695-64fc927e01f1@gmail.com/
> >
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Ferry Toth <fntoth@gmail.com>
> > Cc: Wesley Cheng <wcheng@codeaurora.org>
> > Cc: <stable@vger.kernel.org>
> > Fixes: 41ce1456e1db ("usb: dwc3: core: make dwc3_set_mode() work properly")
> > Signed-off-by: Yu Chen <chenyu56@huawei.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > ---
> > Changes in v3:
> > - Check if the desired mode is OTG, then keep the old flow
> > - Remove condition for OTG support only since the device can still be
> >   configured DRD host/device mode only
> > - Remove redundant hw_mode check since __dwc3_set_mode() only applies when
> >   hw_mode is DRD
> > Changes in v2:
> > - Initialize mutex per device and not as global mutex.
> > - Add additional checks for DRD only mode
> >
>
> I've not been able to test all the different modes on HiKey960 yet,
> but with this patch we avoid the !COREIDLE hangs that we see
> frequently on bootup, so it looks pretty good to me.  I'll get back to
> you tonight when I can put hands on the board to test the gadget to
> host switching to make sure all is well (I really don't expect any
> issues, but just want to be sure).

Ok, got a chance to test the mode switching and everything is looking good.

Tested-by: John Stultz <john.stultz@linaro.org>

Thanks again for continuing to push this!
-john
