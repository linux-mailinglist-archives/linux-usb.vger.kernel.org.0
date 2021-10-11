Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C418428BEB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 13:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhJKL1F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 07:27:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236227AbhJKL1F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 07:27:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D53C60EB1;
        Mon, 11 Oct 2021 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633951505;
        bh=RuJomKPZLFQL35W+YFeJBY0CYNy2GotlLI69CpgmVXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0wZZxo14BNe1muDs9hc6L+VWHaNT9lIRUtyBOJztfD2KLXu+6NtYIZTLvKkJe+mZo
         WZ36dy+a+q/qRUrBSSIyMxMaBFjH4zY+7Tmr+ruXuwYeF9OduPE0LyHFyhh/9msdEA
         7U0fuPUyjnIK7uDIem/KWKv/JGwCEHyV0r2Srsec=
Date:   Mon, 11 Oct 2021 13:25:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
Message-ID: <YWQfDjkgRA4GR7ot@kroah.com>
References: <20211011103210.156552-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011103210.156552-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 11, 2021 at 06:32:10PM +0800, Xu Yang wrote:
> There are potential problems when states are set as following:
> 
>     tcpm_set_state(A, 0)
>     tcpm_set_state(B, X)
> 
> As long as the state A is set and the state_machine work is queued
> successfully, state_machine work will be scheduled soon after. Before
> running into tcpm_state_machine_work(), there is a chance to set state
> B again. If it does occur:
> 
> either (X = 0)
>     port->state = B and state_machine work is queued again, then work
>     will be executed twice.
> or (X != 0)
>     port->state = A and port->delayed_state = B, then work will be
>     executed once but timer is still running.
> 
> For this situation, tcpm should only handle the most recent state change
> as if only one state is set just now. Therefore, if the state_machine work
> has already been queued, it can't be queued again before running into
> tcpm_state_machine_work().
> 
> The state_machine_running flag already prevents from queuing the work, so
> we can make it contain the pending stage (after work be queued and before
> running into tcpm_state_machine_work). The state_machine_pending_or_running
> flag can be used to indicate that a state can be handled without queuing
> the work again.
> 
> Because the state_machine work has been queued for state A, there is no
> way to cancel as it may be already dequeued later, and then will run into
> tcpm_state_machine_work() certainly. To handle the delayed state B, such
> an abnormal work should be skiped. If port->delayed_state != INVALID_STATE
> and timer is still running, it's time to skip.
> 
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes for v2:
> -Try to avoid such problems occurring from the source.
> -Set a state_machine_pending_or_running flag to indicate that a state
>  can be handled without queuing the work again.

I think this is a v3, as I see 2 v2 patches here :(

v4 now please?

thanks,

greg k-h
