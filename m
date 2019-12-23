Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9471C129B16
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2019 22:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfLWVcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Dec 2019 16:32:41 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:57934 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbfLWVcl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Dec 2019 16:32:41 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47hXd161hnz5Y;
        Mon, 23 Dec 2019 22:32:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1577136758; bh=O/d828ISA+n1x4IWaq8yeucNGGNrooHV7Ka+PXufgYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cU77YKvNJgICtrxQwdrkuA3dQmlcb8JweNlMyWAgunfnFPBDztMQ9mNZutXs3wY0M
         bLepP0vcFy4lhzj/XoAAmsd5S2fEKwaUVVHKoD5L+2LAQYWwtGxsJTnKpu8dBVcNuO
         a4tabsxU6iYFP6vH2NSeZiCtuKhUmC1LXFzUjc9cNfJNkEDsipFwo6d+Lr1R0DYzYp
         OD6ckcGPRmWjduIsXOGp1CCLTcKAOkOoJuBTBFzeQM0es/zNTJmcoL94jPigS60mKB
         O9ZTMghJZmA/x/NhP5wUuQ+Li65bpKqxnmGCbUd/uT4Z38ZzVekALoxobVpKIGMDBe
         4md82MjUvOVAw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 23 Dec 2019 22:32:34 +0100
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
Message-ID: <20191223213234.GA28786@qmqm.qmqm.pl>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-11-digetx@gmail.com>
 <20191220035650.GC19921@b29397-desktop>
 <fb7dee6e-e645-fe45-126c-c5f1e280bc26@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb7dee6e-e645-fe45-126c-c5f1e280bc26@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 20, 2019 at 07:31:08AM +0300, Dmitry Osipenko wrote:
> 20.12.2019 06:56, Peter Chen пишет:
> > On 19-12-20 04:52:38, Dmitry Osipenko wrote:
[...]
> >> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> >> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> >> @@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >>  	struct tegra_udc *udc;
> >>  	int err;
> >>  
> >> +	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
> >> +		err = request_module("phy_tegra_usb");
> >> +		if (err)
> >> +			return err;
> >> +	}
> >> +
> > 
> > Why you do this dependency, if this controller driver can't
> > get USB PHY, it should return error. What's the return value
> > after calling below:
> > 
> > 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
> 
> It returns -EPROBE_DEFER when phy_tegra_usb isn't loaded.

How are other driver modules autoloaded? Isn't there an appropriate
MODALIAS or MODULE_DEVICE_TABLE in there?

Best Regards,
Michał Mirosław
