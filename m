Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC2320703E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 11:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389074AbgFXJmK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 05:42:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388031AbgFXJmK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jun 2020 05:42:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A4B120885;
        Wed, 24 Jun 2020 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592991729;
        bh=cMi9OQAkp7kWFuAezIhMkHCNOKhWoM9+5PZHNpUTvPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZCYwbJtEdNgaEVEazNIy7eMiF0aNmnymSNJ93mru3DuKrKOum0X9e0gDcQYRkIA8C
         GI+cHLJV/TMsArbuVZj5OfWdfAbsv9Ls43/U/W89PpvSXuL93M94vj8iZl2kWBztiy
         YKquVyiHrOzBKXL+uW7lH+eReuPtv1YWCCZkukAc=
Date:   Wed, 24 Jun 2020 11:42:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200624094207.GA1752676@kroah.com>
References: <20200619133141.31890-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619133141.31890-1-rrobgill@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 01:31:48PM +0000, Rob Gill wrote:
> The user tool modinfo is used to get information on kernel modules, including a
> description where it is available.
> 
> This patch adds a brief MODULE_DESCRIPTION to the following modules in driver/usb.
> 
> isight_firmware
> mxuport
> u_ether
> uas
> 
> Signed-off-by: Rob Gill <rrobgill@protonmail.com>
> 
> ---
>  drivers/usb/gadget/function/u_ether.c | 1 +
>  drivers/usb/misc/isight_firmware.c    | 1 +
>  drivers/usb/serial/mxuport.c          | 1 +
>  drivers/usb/storage/uas.c             | 1 +
>  4 files changed, 4 insertions(+)

What changed from previous versions of this patch?  That always goes
under the --- line as the documentation asks for.

Can you fix that up and do a v4?

Also, please use the output of scripts/get_maintainers.pl to determine
who to cc: on your patches.

thanks,

greg k-h
