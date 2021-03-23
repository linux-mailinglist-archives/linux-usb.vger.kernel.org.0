Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601CF3463A2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 16:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhCWPxf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 11:53:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232803AbhCWPxK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 11:53:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31CDB619BD;
        Tue, 23 Mar 2021 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616514790;
        bh=vhcfwWbrATj0juPqxDxNC4Fe5Lch/1ZvC6Vz/V+Snhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gqvfe+uq6oewEcyDsGQ0hJACm2pqsCLtzNXxuJMiTI5lU2gu6z7ocRS3eaD1cReNy
         gJfTYlt5Blp4Am0YvIUvf62LcYR9tQUvtlVsM6fWmZa2KxSnC8zj8KPeT0OtsrctUR
         R4Jpxn73tvT3Kej6oQP/hYXWlOjVFdMoMhWjaBJY=
Date:   Tue, 23 Mar 2021 16:53:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Allen Pais <allen.lkml@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Zeng Tao <prime.zeng@hisilicon.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [PATCH v3 0/8] usb: Check for genXxY on host
Message-ID: <YFoO3VZLt4GJPPcr@kroah.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
 <YFncvgvAjSNvmZk/@kroah.com>
 <9074de11-f1ad-50c3-6f4d-9da59fd8aa12@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9074de11-f1ad-50c3-6f4d-9da59fd8aa12@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 04:36:24PM +0200, Mathias Nyman wrote:
> On 23.3.2021 14.19, Greg Kroah-Hartman wrote:
> > On Wed, Mar 10, 2021 at 07:42:35PM -0800, Thinh Nguyen wrote:
> >> This series add some missing support for USB 3.2 SuperSpeed Plus detection on
> >> the host side. A SuperSpeed Plus device can operate in gen2x2, gen2x1, or
> >> gen1x2. The current implementation can't detect whether the device is in Gen 1
> >> or Gen 2 speed. We can do this by matching for the lane speed exponent and
> >> mantissa of the SSP sublink speed capability descriptor from the hub driver.
> >>
> >> Also, the current xHCI driver is missing some reports for the default SSP
> >> Sublink Speed capability for USB 3.2 roothub. This series also add some support
> >> for xHCI driver detecting various SuperSpeed Plus GenXxY.
> > 
> > I took the first 4 patches already and will wait for Mathias to review
> > the rest.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> For patches 4 to 8
> 
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Thanks, all queued up now!

greg k-h
