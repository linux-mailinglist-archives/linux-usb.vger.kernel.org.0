Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6152E3F94
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506303AbgL1OmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:42:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:46488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502469AbgL1OmN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:42:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CE7320715;
        Mon, 28 Dec 2020 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609166493;
        bh=xa8iROS+FwIKusHc2CtnTTODCU7LS2ASRoYJPCztw+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FIyK4PczH23OcfKQJ29stQEn59i5BBOqFHwdtXAl+PDVsPZCl2SJ97I0Noj3pVOCx
         /ooVuAAkHk2spbBG38AX2ESPytRv8kzoRvFNMEabhVb4+9R2hrgdBZNpa3YTqNP1mZ
         YXzmUjNdQP9p9LEOy+ky3R8xCHQn9u19hA4S++4s=
Date:   Mon, 28 Dec 2020 15:42:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     peter.chen@nxp.com, linux-usb@vger.kernel.org,
        dan.carpenter@oracle.com, kurahul@cadence.com,
        rdunlap@infradead.org
Subject: Re: [PATCH] usb: cdnsp: Fix for undefined reference to
 `usb_hcd_is_primary_hcd'
Message-ID: <X+nu7pD9tVw5iMJB@kroah.com>
References: <20201210162258.10289-1-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210162258.10289-1-pawell@cadence.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 05:22:58PM +0100, Pawel Laszczak wrote:
> Patch fixes the following compilation error:
> 
> ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
> host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'
> 
> This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
> which is being built as a loadable module:
> 
> int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> {
>         struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> 
> Issue occurrd for following kernel configuration:
> CONFIG_USB_GADGET=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=m
> 
> CONFIG_USB_CDNS_SUPPORT=y
> CONFIG_USB_CDNS_HOST=y
> CONFIG_USB_CDNS3=m
> CONFIG_USB_CDNS3_GADGET=y
> CONFIG_USB_CDNS3_HOST=y
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  drivers/usb/cdns3/Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Doesn't apply to 5.11-rc1 :(
