Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2459C34A824
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 14:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhCZNcq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 09:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:35634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhCZNc2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 09:32:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F4A61A13;
        Fri, 26 Mar 2021 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616765548;
        bh=zDg5cvz1boAlimnBE/K7mw2FFrFPKqLbJa1FYux51Fc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0OKEhUNy0HqEaJM8jisfBFM+SaxFXIN/Yad4ZWyCxowQx3TiYIl9a3QfFdGN1oKfB
         MI5oEmWLfjZ7O8hUeT1jVnjwALt3H8iPpRs45aoG2dZOiw3kMnss8j2AFOSlqui+DB
         ZSxOb9KIm/bNJNfS/KkSTZ7E6A55sA5NQA00A47c=
Date:   Fri, 26 Mar 2021 14:32:25 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc2: Add default param to control power
 optimization.
Message-ID: <YF3iaZT47tT11xFP@kroah.com>
References: <20210326102424.7AE5BA005D@mailhost.synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326102424.7AE5BA005D@mailhost.synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 26, 2021 at 02:24:23PM +0400, Artur Petrosyan wrote:
> There are 3 power saving options supported in dwc2 core
> 1. Hibernation
> 2. Partial Power Down
> 3. Clock gating
> 
> To enable or disable the power saving features earlier users
> had to set "power_down" param to "0". However, "power_down"
> parameter is meant to and used for distinguishing between the
> power saving options.
> 
> So, if Hibernation is enabled then
> "power_down = 2"
> if Partial Power Down is enabled then
> "power_down = 1"
> if not Hibernation nor Partial Power Down are enabled then
> "power_down = 0".
> 
> Setting the "power_down" to "0" for disabling power saving
> options is not right because it is used to differentiate
> power saving options.
> 
> Therefor added a new parameter named "power_saving" which will
> be used only for enabling or disabling power saving modes.
> 
> NOTE: If Hibernation or Partial Power Down modes are disabled
> then by default Clock gating mode is used.
> 
> - Added a default param "power_saving" to enable or
>   disable hibernation or partial power down features.

But nothing changes this option?  So why does it matter?

> 
> - Printed hibernation param in hw_params_show and
>   power_saving param in params_show.

Please make this a separate patch for the hibernation option, as it has
nothing to do with this patch at all.

thanks,

greg k-h
