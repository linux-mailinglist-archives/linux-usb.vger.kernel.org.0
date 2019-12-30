Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083ED12D49C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 22:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfL3VDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 16:03:04 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:11540 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727691AbfL3VDD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 16:03:03 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47mqdd0DMQz7N;
        Mon, 30 Dec 2019 22:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1577739781; bh=NNyRepO9YhRpotCRnJnXy8pqk04Hj9WYZM8yTYKVSKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nYqdilDubgYoiO7q7ir4AhKr8ggJoA91XK6Sjk9p095YyYgl0RiFO1mK50hybP3yU
         i6uDIqspV/CnmzP4Rs/3vCMbxydoTkFl4LJ55mWd+DSNfhB/05u3tRA7emehjh+MTm
         wt8yx4Jrs0z8lekEuiNi2htVGxTd5cEMaIk2CKu7un8f2xxcNce5IiwvHiiLtrjRvU
         LvGOZ/espqLCs4SVyMwZSTCqH3vDqU5ksVGBGuuBQiPYLvzVSh1HIwZU3bJvleqpM1
         dFATpChED97WwmAWe74O/eAQJRARWfa4vfqr1v3mquGkuZkmJKqRZRjCrWvSdmmHZI
         MOJ+GImum0JYg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 30 Dec 2019 22:02:59 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, Rob Herring <robh-dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Felipe Balbi <balbi@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/10] usb: chipidea: tegra: Add USB_TEGRA_PHY module
 to driver's dependencies
Message-ID: <20191230210259.GD24135@qmqm.qmqm.pl>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-11-digetx@gmail.com>
 <20191220035650.GC19921@b29397-desktop>
 <fb7dee6e-e645-fe45-126c-c5f1e280bc26@gmail.com>
 <20191223213234.GA28786@qmqm.qmqm.pl>
 <7174833f-8325-7fb4-d190-78ba4bed0cbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7174833f-8325-7fb4-d190-78ba4bed0cbb@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 24, 2019 at 07:21:05AM +0300, Dmitry Osipenko wrote:
> 24.12.2019 00:32, Michał Mirosław пишет:
> > On Fri, Dec 20, 2019 at 07:31:08AM +0300, Dmitry Osipenko wrote:
> >> 20.12.2019 06:56, Peter Chen пишет:
> >>> On 19-12-20 04:52:38, Dmitry Osipenko wrote:
> > [...]
> >>>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> >>>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> >>>> @@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >>>>  	struct tegra_udc *udc;
> >>>>  	int err;
> >>>>  
> >>>> +	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
> >>>> +		err = request_module("phy_tegra_usb");
> >>>> +		if (err)
> >>>> +			return err;
> >>>> +	}
> >>>> +
> >>>
> >>> Why you do this dependency, if this controller driver can't
> >>> get USB PHY, it should return error. What's the return value
> >>> after calling below:
> >>>
> >>> 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
> >>
> >> It returns -EPROBE_DEFER when phy_tegra_usb isn't loaded.
> > 
> > How are other driver modules autoloaded? Isn't there an appropriate
> > MODALIAS or MODULE_DEVICE_TABLE in there?
> 
> Hello Michał,
> 
> The phy_tegra_usb module is fine by itself, it's getting autoloaded.
> 
> The problem is that ci_hdrc_tegra module depends on the phy_tegra_usb
> module and thus the PHY module should be loaded before the CI module,
> otherwise CI driver fails with the EPROBE_DEFER.

Why, then, is CI driver not being probed again after PHY driver loads?
EPROBE_DEFER is what should cause driver core to re-probe a device after
other devices appear (PHY in this case).

Best Regards,
Michał Mirosław
