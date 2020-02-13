Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE19D15BEBB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 13:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbgBMMx5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 07:53:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:44786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729901AbgBMMx4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 07:53:56 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B9F5218AC;
        Thu, 13 Feb 2020 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581598436;
        bh=nyig/oycKzyGM+1H8laUOHkyMA4yypnEaN7AHJ2b24o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HivmmBJOMH0Js1m3iNQMnRO9xvLnX4DLbUawFzovY9bg2hCXFB0U6WjPfj2Zb8UCX
         cu6HLgZ5v/PVczBi8n8RFHI4xUpsiuI9JfXq55TBdKMg/PSa9yXcVtYRrKb4X5zfEF
         x0omGMUVwZK4O3ZhKgUYHxpq7ror9+twF5cI9zGQ=
Date:   Thu, 13 Feb 2020 04:53:55 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.6-rc2
Message-ID: <20200213125355.GA3325929@kroah.com>
References: <20200213110318.GA16245@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213110318.GA16245@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 12:03:18PM +0100, Johan Hovold wrote:
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.6-rc2

Pulled and pushed out, thanks!

greg k-h
