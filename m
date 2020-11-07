Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB52AA60C
	for <lists+linux-usb@lfdr.de>; Sat,  7 Nov 2020 15:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgKGO40 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Nov 2020 09:56:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:32982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgKGO40 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 7 Nov 2020 09:56:26 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3B93206A4;
        Sat,  7 Nov 2020 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604760986;
        bh=Uqa3mYAQuZNVmzxG011RMxjpXfsqYkdBB7palzE+gvQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MOy4AxtARXfrcndARYNt0aIHGNR64Be3pJBK3LLiUZUI6EQkwQb1F2wh+uvRNkOZt
         8FI/an0OWOC+W4atpEvyjnqv0Dku+lSXu2AcTINDA1rkGtwoWNM3CK+vS/7ukE74BR
         gjWYaywRmMHyY3zWQfSdeKMrJRmAtbxVAjjpg2fM=
Date:   Sat, 7 Nov 2020 15:57:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.10-rc3
Message-ID: <20201107145702.GD3722301@kroah.com>
References: <20201106154347.GA32032@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106154347.GA32032@localhost>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 06, 2020 at 04:43:47PM +0100, Johan Hovold wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.10-rc3

Pulled and pushed out, thanks!

greg k-h
