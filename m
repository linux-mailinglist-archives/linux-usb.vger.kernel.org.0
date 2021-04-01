Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21EDB350F4E
	for <lists+linux-usb@lfdr.de>; Thu,  1 Apr 2021 08:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhDAGqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Apr 2021 02:46:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhDAGp5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Apr 2021 02:45:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57A4B6108B;
        Thu,  1 Apr 2021 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617259557;
        bh=9WxRsuqGsMLrz2QAdI6WKjRm9njx2yQF6Q4XYdF1FhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+7Yd9ixEfC+GTnBth/nNcC8D5r+aqXemtUbb3mKnE+FeTC35PGHt3Op3eLzCjCld
         94khm4D8cDwBFu/LpLFJIKI9wAQFp43QIttAjn7C1AOdOJcMPNyOrqbX1w4Uj1D1aw
         xD4qHy//7+hsKhV9zkiY+3LtNlH5npnWv5H+bx7ZOGoLUrDRy0Odw6q0ijUEtuODj7
         9W30W7aVWsY+eJum9iaeqXhw+HK8+qW06m+6uqc3p9of2EI5MnC6AFTf5qn9XKyg31
         mTHXXOqN5H8nwDlKKPxNajcgtljWMy4xhxmNu8Wwm726OkyPJwxYMPOnm5I6Mb1NHs
         ITvTR/0TcVNfA==
Date:   Thu, 1 Apr 2021 12:15:53 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 10/13] phy: tegra: xusb: Tegra210 host mode VBUS
 control
Message-ID: <YGVsIWep5kyhXtpP@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-11-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325164057.793954-11-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25-03-21, 17:40, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
> 
> To support XUSB host controller ELPG, this commit moves VBUS control
> .phy_power_on()/.phy_power_off() to .phy_init()/.phy_exit().
> When XUSB host controller enters ELPG, host driver invokes
> .phy_power_off(), VBUS should remain ON so that USB devices will not
> disconnect. VBUS can be turned OFF when host driver invokes
> .phy_exit() which indicates disabling a USB port.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
