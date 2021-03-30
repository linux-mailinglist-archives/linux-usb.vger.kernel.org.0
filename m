Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC6434EA3D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 16:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhC3OWA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 10:22:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231951AbhC3OVz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Mar 2021 10:21:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77A65619BD;
        Tue, 30 Mar 2021 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617114112;
        bh=hfBkbDAsbghTaZUiNBHUebHsnQ3gcZjaoSkmAROYxHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UuHKVxyxEX58+BILgiyOe+ui6o6LNMgtlXs3O6ftgk9FkKNyW2VmmRfcIgV54h7pz
         oohmSigHf9n+dfPZiJyPdey0Q7TOsbc7A/ncM1z6tFrYq/OOp+WGmjJ194t28rvzCP
         P+cmJLtLqi/NEznl3RCxIUuW3c3tyjXLTr74xSBov6X+CCKFTsjk2Q/58qm9Ft8u0V
         tJZgDwqjQiPbwCDScPr8T/Ce725kyJIyxJG6Ck8kuxY0zEwXjHn7MkFnzDgQZX2t9b
         1MgBS3HgiCSAPaeMexO8sOidvEX8TH4e2iZzvUouyIhpxrxrd1lo8D3R4UnfJpnaOE
         UbZKYcqx2JHtg==
Date:   Tue, 30 Mar 2021 19:51:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 05/13] phy: tegra: xusb: Add Tegra210 lane_iddq
 operation
Message-ID: <YGMz/IgGxBlBBqzM@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325164057.793954-6-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25-03-21, 17:40, Thierry Reding wrote:

> +#define XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(x) (0x464 + (x) * 0x40)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ BIT(0)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD BIT(1)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK (0x3 << 4)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL (0x3 << 4)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD BIT(24)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ BIT(8)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD BIT(9)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK (0x3 << 12)
> +#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL (0x3 << 12)

GENMASK() for these please

With that fixed:

Acked-By: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
