Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CCD305C2E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 13:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313941AbhAZWu3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 17:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbhAZFPv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 00:15:51 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC3AC061786
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 21:15:03 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id y14so3845912oom.10
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 21:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WEj3tmR62zGvDZoGCGiPRerSzNBbdxbd1rRwr/9kJUk=;
        b=P49sxvgT7xsvQvhm489+UNNHRjydA/7wRy7XhqQbQIEkgQQAJ3Ky16ENSRxcKRMsku
         k/7TmktrWpSOkzI7k/20H5wHVS2SGi0YbY5HGLE53sqXPhVr2wo/NpOooPbYSQdU34Th
         VBiPWougzOxqABN3qvXy7YNvpWcY6w7UNtQtxoAoswujsC2EWr3NxiczgXM2u5/HQfUJ
         LrYERBbGVl9yBkB6uzN0NsKTR4wJpcH5jAlCdV1KToNzMym5qVxYxIbTP3TXsKB3rNPf
         YAimxbu0HMBI1BBPkEWfvePe+eS4LQX5r7rOmyYjBxH4L8adq6dBB7mzBCOL2xoUrgJN
         30Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WEj3tmR62zGvDZoGCGiPRerSzNBbdxbd1rRwr/9kJUk=;
        b=F1sJ1AHruBgxlg2/vzZQOMSnnHT/+g8qjZm8XpwTPfj2sfy1iilL+KrmDbqOsEaoI4
         he3p9/cXFTQdrzCEqS9E0Y2U1zYpILM6Ingk8WbrIZ+gQn20MnscMRQblaPXZEnZi+VD
         2srxYWZWX9Zu0NnMwE4OVZD5WehpEJP7nnTO/kLZk/4Vw7vjSdJ2Bgx6dBSF9TJBsRp+
         WvpRqVl6BXrOwyxpWVkVgpA1EbIwHHsKnc8uMk292zj2ZMGKRjwrssQdxc46hZ3mmxlK
         clSxCcaWDAEF6oPGHrtUAUHsr5gB9K1QL7QQYNZmJMSV8IDV+V6rHqMhZEodsZ+1CVsG
         M1hw==
X-Gm-Message-State: AOAM533QT0L2+foSu2IP5ee7KM/4VcokYw1vSMH26XzaZw722vt7qltb
        6/iL6hpHMTeF9cUKXJURb+9Pog==
X-Google-Smtp-Source: ABdhPJxQy38LYIBO8JfsuhJvZQAab+eu72Dtx+aE1TieErPJ/G0DWwha/Ormwzl0NukmD+JYSYVKPw==
X-Received: by 2002:a4a:9092:: with SMTP id j18mr1040063oog.19.1611638102791;
        Mon, 25 Jan 2021 21:15:02 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f10sm2357672oom.18.2021.01.25.21.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 21:15:02 -0800 (PST)
Date:   Mon, 25 Jan 2021 23:15:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter.chen@nxp.com,
        jackp@codeaurora.org
Subject: Re: [PATCH v6 3/4] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YA+lVFWlBDvN4MTF@builder.lan>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-4-git-send-email-wcheng@codeaurora.org>
 <YAsHbj/mITeiY5Cq@builder.lan>
 <724cb274-36ce-fb48-a156-4eaf9e686fdf@codeaurora.org>
 <20210126015543.GB1241218@yoga>
 <99dd9419-a8fd-9eb2-9582-d24f865ecf70@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99dd9419-a8fd-9eb2-9582-d24f865ecf70@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 25 Jan 22:32 CST 2021, Wesley Cheng wrote:
> On 1/25/2021 5:55 PM, Bjorn Andersson wrote:
> > On Mon 25 Jan 19:14 CST 2021, Wesley Cheng wrote:
> > 
> >>
> >>
> >> On 1/22/2021 9:12 AM, Bjorn Andersson wrote:
> >>> On Thu 21 Jan 22:01 CST 2021, Wesley Cheng wrote:
> >>>
> >>
> >> Hi Bjorn,
> >>>
> >>> Under what circumstances should we specify this? And in particular are
> >>> there scenarios (in the Qualcomm platforms) where this must not be set?
> >>> The TXFIFO dynamic allocation is actually a feature within the DWC3
> >> controller, and isn't specifically for QCOM based platforms.  It won't
> >> do any harm functionally if this flag is not set, as this is meant for
> >> enhancing performance/bandwidth.
> >>
> >>> In particular, the composition can be changed in runtime, so should we
> >>> set this for all Qualcomm platforms?
> >>>
> >> Ideally yes, if we want to increase bandwith for situations where SS
> >> endpoint bursting is set to a higher value.
> >>
> >>> And if that's the case, can we not just set it from the qcom driver?
> >>>
> >> Since this is a common DWC3 core feature, I think it would make more
> >> sense to have it in DWC3 core instead of a vendor's DWC3 glue driver.
> >>
> > 
> > I don't have any objections to implementing it in the core driver, but
> > my question is can we just skip the DT binding and just enable it from
> > the vendor driver?
> > 
> > Regards,
> > Bjorn
> > 
> 
> Hi Bjorn,
> 
> I see.  I think there are some designs which don't have a DWC3 glue
> driver, so assuming there may be other platforms using this, there may
> not always be a vendor driver to set this.
> 

You mean that there are implementations of dwc3 without an associated
glue driver that haven't yet realized that they need this feature?

I would suggest then that we implement the core code necessary, we
enable it from the Qualcomm glue layer and when someone realize that
they need this without a glue driver it's going to be trivial to add the
DT binding.


The alternative is that we're lugging around a requirement to specify
this property in all past, present and future Qualcomm dts files - and
then we'll need to hard code it for ACPI anyways.

Regards,
Bjorn
