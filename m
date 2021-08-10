Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6658C3E10FA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 11:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239309AbhHEJQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 05:16:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:36242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237827AbhHEJQA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Aug 2021 05:16:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D9CE61029;
        Thu,  5 Aug 2021 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628154945;
        bh=jiWBfGfrHPmdXnTZb/UnDx9zSYN4p1QfYI/iS7p0/JQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpiHG/o7FT+/0Ng7c8yckStLvPH/WlTr+d7n7pl+2yUtyDS7JC5AplUVDm8snftvO
         WIuIyYf9TIJZU6nyo6Dg8x/5falE78pzxvk+yIhjbMsw/EC2Qq/EB83DHPG2DA9Ohy
         H8q2czVBP2Yqyq/roLaKPkg4VWrQTUQgIB2zMc3I=
Date:   Thu, 5 Aug 2021 11:15:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc2: rename DWC2_POWER_DOWN_PARAM_NONE state
Message-ID: <YQusPurbybrNly+b@kroah.com>
References: <CGME20210804114433eucas1p134417b605abeb57728d358fc2f42162b@eucas1p1.samsung.com>
 <20210804114421.10282-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804114421.10282-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 04, 2021 at 01:44:20PM +0200, Marek Szyprowski wrote:
> DWC2_POWER_DOWN_PARAM_NONE really means that the driver still uses clock
> gating to save power when hardware is not used. Rename the state name to
> DWC2_POWER_DOWN_PARAM_CLOCK_GATING to match the driver behavior.
> 
> Suggested-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This is a follow-up of this discussion:
> https://lore.kernel.org/linux-usb/26099de1-826f-42bf-0de7-759a47faf4a0@samsung.com/
> 
> This should be applied on top of v5.14-rc3.

What else would I apply it on top of, we can't go back in time :)

Where is this needed for 5.14-final, or for 5.15-rc1?

thanks,

greg k-h
