Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2CE188D6F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2020 19:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgCQSsy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Mar 2020 14:48:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgCQSsx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Mar 2020 14:48:53 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B851420724;
        Tue, 17 Mar 2020 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584470933;
        bh=gGV1ItYxNQ6tY67FPy0h+CFqjiIH3Jj4TqMkX5acqCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zko1XOTxt4aT2xvx5Olsk3hD1VHMQuKfHG0S8hxhqNlIJ2CWrE9YAswDXeSQF4hpc
         1pJC2r8FglzvsjEe8X2y2I6HMckPOiucIdvfBD/AAiyamuVQzbf3oi3EBrC//SvrUC
         jTZWBScZTuV8yPWZlE0X3vGZuMwx05yWIsyaU7NQ=
Date:   Tue, 17 Mar 2020 19:48:51 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Al Cooper <alcooperx@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] usb: ehci: Add new EHCI driver for Broadcom STB SoC's
Message-ID: <20200317184851.GA1470797@kroah.com>
References: <20200313141545.31943-1-alcooperx@gmail.com>
 <20200313141545.31943-4-alcooperx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313141545.31943-4-alcooperx@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 13, 2020 at 10:15:44AM -0400, Al Cooper wrote:
> +static int __init ehci_brcm_init(void)
> +{
> +	if (usb_disabled())
> +		return -ENODEV;
> +
> +	pr_info("%s: " BRCM_DRIVER_DESC "\n", brcm_hcd_name);

Drivers should be quiet if all is good, no need for this line.

thanks,

greg k-h
