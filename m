Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE4C345DEE
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 13:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCWMTg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 08:19:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:34578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhCWMTN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 08:19:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11D14619B1;
        Tue, 23 Mar 2021 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616501952;
        bh=vtB7vYHeHRyrec5gK7r4jwbxWOaGtZ5lhsGMqYrC1cc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LlrfxXVJxk3Uz41NAu39seRDWDo4+oVgOqlW/pmEczwvfOZZgxcwAmxQUFig52IQg
         3syKZCFORpYTSr2ddgpl+wQy9sunVBZRORp/MQeD9mXLpf3FnHDlvQsOFx6QmXewkd
         GxIluVfkngj1jCqiFrj1gH2QY4OCeKWdar8nmGDM=
Date:   Tue, 23 Mar 2021 13:19:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
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
Message-ID: <YFncvgvAjSNvmZk/@kroah.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 07:42:35PM -0800, Thinh Nguyen wrote:
> This series add some missing support for USB 3.2 SuperSpeed Plus detection on
> the host side. A SuperSpeed Plus device can operate in gen2x2, gen2x1, or
> gen1x2. The current implementation can't detect whether the device is in Gen 1
> or Gen 2 speed. We can do this by matching for the lane speed exponent and
> mantissa of the SSP sublink speed capability descriptor from the hub driver.
> 
> Also, the current xHCI driver is missing some reports for the default SSP
> Sublink Speed capability for USB 3.2 roothub. This series also add some support
> for xHCI driver detecting various SuperSpeed Plus GenXxY.

I took the first 4 patches already and will wait for Mathias to review
the rest.

thanks,

greg k-h
