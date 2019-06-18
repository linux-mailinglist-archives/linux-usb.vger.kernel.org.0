Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1C2F49944
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 08:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFRGtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 02:49:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbfFRGtJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 02:49:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A201205F4;
        Tue, 18 Jun 2019 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560840548;
        bh=4Dn85kGO6lbvN5QZM5WYOWKMQqWEwadPNOrD/WpN4hw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MEmDHXDhNv9Y/N+8reGa2wiR7ZAvUFltfn+7xjszrTq85O6gC4V4v3pxpMhbc4Miy
         JXaHAq8CcLlufaofv5uewFcqPDO+Npc7JQLWXp1LTfCHICLHrjvg0Zn5yqBwgB0KHe
         PCDar1ag64XS83gI+/J+GkYv3UE1nbh+pDL/qGWA=
Date:   Tue, 18 Jun 2019 08:49:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dmg@turingmachine.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a,
 b) in drivers/usb
Message-ID: <20190618064905.GA22457@kroah.com>
References: <20190617233050.21409-1-dmg@turingmachine.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617233050.21409-1-dmg@turingmachine.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 17, 2019 at 04:30:50PM -0700, dmg@turingmachine.org wrote:
> From: Daniel M German <dmg@turingmachine.org>
> 
> Use min_t to find the minimum of two values instead of using the ?: operator.

Why is min_t() needed for all of these and not just min()?

> 
> This change does not alter functionality. It is merely cosmetic intended to
> improve the readability of the code.
> 
> Signed-off-by: Daniel M German <dmg@turingmachine.org>
> ---
>  drivers/usb/gadget/function/u_ether.c | 2 +-
>  drivers/usb/misc/adutux.c             | 2 +-
>  drivers/usb/storage/realtek_cr.c      | 2 +-

Can you break this up into one patch per driver?  That way you can
include the proper maintainers/reviewers when you resend them.

thanks,

greg k-h
