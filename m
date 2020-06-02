Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580681EB7D3
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 11:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBJDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 05:03:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgFBJDb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 05:03:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AD6E20679;
        Tue,  2 Jun 2020 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591088610;
        bh=ArLrF1gFhz6V6JE6MN5KNyQe3ja/99jTV7ZkA9DWYQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HBpcie5EZspQz4CsCOmivljcybTdmBIZ2C8cCwsApjcEnrlSPmDEbNBFxXO5kmxlW
         CIMLGlk880uvsZd1cctc+koC7lpaDy60st7izipG8wlKoURtlPiVK9Xgcx97HgWNO6
         rffho59C/GJ349bJrMezXDfr9SNl4Yk6p3ZbORlo=
Date:   Tue, 2 Jun 2020 11:03:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jun.li@nxp.com
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        john.stultz@linaro.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: avoid screaming irq causing
 boot hangs
Message-ID: <20200602090328.GD2735864@kroah.com>
References: <20200602071208.12120-1-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602071208.12120-1-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 02, 2020 at 03:12:08PM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> John reported screaming irq caused by rt1711h when system boot[1],
> this is because irq request is done before tcpci_register_port(),
> so the chip->tcpci has not been setup, irq handler is entered but
> can't do anything, this patch is to address this by moving the irq
> request after tcpci_register_port().
> 
> [1] https://lkml.org/lkml/2020/5/30/1

Please use lore.kernel.org links instead of lkml.org as we have no
control over that random site at all.

thanks,

greg k-h
