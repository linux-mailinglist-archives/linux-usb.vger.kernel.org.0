Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC8723204B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 16:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgG2O1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 10:27:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:47140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2O1Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 10:27:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA25C207E8;
        Wed, 29 Jul 2020 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596032844;
        bh=mbWpxOrfGeg3Blfb+2Q+dfsdv9VRD3Qmolpj/+v5Zh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EPn7N7wDqtMgWWmU0STKKumCLrIeCXlLk1u5dT8Y8JGj1OqfwoGJos0P/Hg2d7LRa
         0NtuY6OF1J8zZ2eK4cEr+PlmEvn75IgPGHsogOwfDZTzAkw9j8WgT3FVCXPPuLbvCE
         ENLVuIgnMPauWdglYLfpjcLINUk3e2tKTTRpzqXM=
Date:   Wed, 29 Jul 2020 16:27:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian Gromm <christian.gromm@microchip.com>
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
Subject: Re: [RESEND PATCH v5] drivers: most: add USB adapter driver
Message-ID: <20200729142715.GA3343116@kroah.com>
References: <1595838646-12674-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595838646-12674-1-git-send-email-christian.gromm@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 10:30:46AM +0200, Christian Gromm wrote:
> This patch adds the usb driver source file most_usb.c and
> modifies the Makefile and Kconfig accordingly.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>

Sorry for the long delay in getting to this.

This looks good to me, but I tried to apply it to my usb tree, and of
course I get the following build error:
	error: the following would cause module name conflict:
	  drivers/staging/most/usb/most_usb.ko
	  drivers/most/most_usb.ko

So, can you just send a "rename the file" patch that I can apply against
my staging-next branch and I will take it through there so that there
are no conflicts like this?

thanks,

greg k-h
