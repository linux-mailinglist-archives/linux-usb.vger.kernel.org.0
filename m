Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898C837529B
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 12:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234562AbhEFKvH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 06:51:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:36698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234508AbhEFKvG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 06:51:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 687FE6103E;
        Thu,  6 May 2021 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620298208;
        bh=ZGU4rlk5YcVu9K7dCjlo29xky+vQ+JfFlQg58KCFDKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vXUOu4h/3wQZTgRvhp5Eb377PiKzD7L0Op5dCWaWRo01pCoRx8LRSkb43QUKibvIq
         JhT0NJDuyuO8By+odRNJYw9SuGh4aedovEkJrZsrOguQH5vCAUua+YVWhQbvg1Oobm
         rA1cC7+jnQIZXB3d1zH86Et796g6d3cnapEUY8BY=
Date:   Thu, 6 May 2021 12:50:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
Message-ID: <YJPJ3aKf9BdQ8UKx@kroah.com>
References: <20210504101910.18619-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504101910.18619-1-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB controller.
> There is already support for the isp1760 and isp1761 in tree, this series extend
> the support also for the isp1763.
> 
> Move register access using regmap, remove some platform data and code, refactor
> the mempool, use dr_mode to align to existing bindings, then add the support for
> isp1763 host mode, add bindings files that did not existed and at the end
> add also support for peripheral mode for isp1763.
> 
> @Laurent and @Sebastian, I add both of you in the bindings files as maintainers
> (it is a mandatory field)since you were the ones which contributed with the
> initial code and peripheral code, let me know if you are ok with it.
> If yes I may send a follow up to add also entries in MAINTAINERS file that it is
> also missing.

First 3 patches now applied, feel free to rebase and resend the rest
based on the review comments.

thanks,

greg k-h
