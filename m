Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2377B453D8A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 02:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhKQBRO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Nov 2021 20:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhKQBRO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Nov 2021 20:17:14 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4FDC061570
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 17:14:16 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so3761578pjc.4
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 17:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u67S6VgiwJsWU+xA5kqNMINkFWWTn3sH2/2uBHE3sqk=;
        b=hxyijb8vmHllQurbJtfr1dHloLvK1ixZoWBK6v83k4rB8IxO95LzD66cidPEkJLyFF
         JbmwnvS+vpqrxZH+3VhEMfza6ZNVfIPWtJvfnMOr+DZtNt+GQkE3Je87TJ3pDK6P2Ei7
         rEbljAwekyhWNZNvmrG+/mGL8VpjpPM8cl0is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u67S6VgiwJsWU+xA5kqNMINkFWWTn3sH2/2uBHE3sqk=;
        b=pZR/jF3DbaoxVHXuIcPrqLbhmMSV9iEk7mUcxoJHntd+4ePUiRrlxKEib609RfXXDX
         kCVjc7vXGMk+srLbXV6ELpaNbzQCHOn2WctIhzM1Y9PdxjuinZ1vlgfEWvN5g3luV7RQ
         7sQvV+ReUDVE3WhuBHpucgrzcmptSn7de6K85np77+S4OdWZtPa4maBrUt2cXC486mN/
         Di1vz2vv02JUGp7jfwx0vwuTW9C6xdm+V2nq2VyqyxOksorIP+JHjhnIViAHdCGlqd9P
         dVkNnbtQOAFFmUov5jVfjIHfHK7oM+MH+08+sfVH7TGQZLMXjJnIIxjYQmIfa4KHY4UQ
         uWVg==
X-Gm-Message-State: AOAM5302oWIW+HcqTlLWFxx2V7ms6YmNOXkiWB5s2x5ECXPIMFKNgNbw
        jh/7Mfvm26cSMDG9Hrvn7LdW9g==
X-Google-Smtp-Source: ABdhPJzlkreTQyAtkDwf5FLOlsalnRC9DUYl6FTYV0tLHNviYhp9T1daQgrEqjEZ4ymEX44bXIvr9Q==
X-Received: by 2002:a17:902:8d85:b0:142:892d:bfa with SMTP id v5-20020a1709028d8500b00142892d0bfamr50892053plo.76.1637111655735;
        Tue, 16 Nov 2021 17:14:15 -0800 (PST)
Received: from localhost ([2620:15c:202:201:54aa:73ab:b480:41e2])
        by smtp.gmail.com with UTF8SMTPSA id q18sm21936157pfj.46.2021.11.16.17.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 17:14:15 -0800 (PST)
Date:   Tue, 16 Nov 2021 17:14:14 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 2/5] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YZRXZs5B08SaBqMx@google.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-3-git-send-email-quic_c_sanm@quicinc.com>
 <YZRMoNEZTy8XimIx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZRMoNEZTy8XimIx@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 16, 2021 at 04:28:16PM -0800, Brian Norris wrote:
> On Mon, Nov 01, 2021 at 01:23:41PM +0530, Sandeep Maheswaram wrote:
> > Avoiding phy powerdown when wakeup capable devices are connected
> > by checking wakeup property of xhci plat device.
> > Phy should be on to wake up the device from suspend using wakeup capable
> > devices such as keyboard and mouse.
> > 
> > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> Because you've now factored in a device_may_wakeup() (which evaluates
> 'false' for me), this no longer breaks my Rockchip RK3399 systems
> (previous versions did). So from that angle:
> 
> Tested-by: Brian Norris <briannorris@chromium.org>
> 
> > ---
> >  drivers/usb/dwc3/core.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 643239d..a6ad0ed 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1787,7 +1787,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >  		dwc3_core_exit(dwc);
> >  		break;
> >  	case DWC3_GCTL_PRTCAP_HOST:
> > -		if (!PMSG_IS_AUTO(msg)) {
> > +		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {
> 
> I still find it odd to use device_may_wakeup(), since that's something
> controlled by user space (sysfs) and doesn't fully factor in hardware
> support. But that's what xhci-plat.c is doing, so I guess I see why
> you're imitating it...
> ...still, feels wrong to me. But so does a lot of how dwc3 works.

device_may_wakeup() actually factors in hardware support, at least if the
driver does the right thing (TM). The (current) implementation is:

static inline bool device_may_wakeup(struct device *dev)
{
	return dev->power.can_wakeup && !!dev->power.wakeup;
}

'.can_wakeup' should describe the hardware capability to wake up and the
other flag whether wakeup is enabled (which can be altered by userspace).

What this series currently does with the .can_wakeup flag is still wrong
though IMO. Patch "[1/5] usb: host: xhci: plat: Add suspend quirk for dwc3
controller" [1] dynamically sets the flag with a value that depends on what
is connected to the bus, so it doesn't specify any longer whether the
hardware supports wakeup or not.

[1] https://patchwork.kernel.org/project/linux-usb/patch/1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com/
