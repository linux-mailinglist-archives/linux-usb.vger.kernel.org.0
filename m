Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9102A0321
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 11:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgJ3KrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 06:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJ3Kq7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Oct 2020 06:46:59 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8D63221FA;
        Fri, 30 Oct 2020 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604054819;
        bh=2YrFoWG+JAf4rqDK5LmYC3tXACxjjamvymCxlxjJrwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WpYeqYZranex1dYGwZhrG0eDXAF5g5FHDoy2Qi5rXpGb/l5e2djkj/O5vMgFu0HKv
         ijjYn051UTGpPvzPVB0DB9zNq1vRO2lNNwnWG4qUGbNtQdqnkqC3YiRTDbwdIlkG3p
         FqygcadGbRtPJjyEJOznu9KUSYPuuqES9MNEQ3OY=
Date:   Fri, 30 Oct 2020 11:47:38 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: fixes for cdns3 driver
Message-ID: <20201030104738.GC2395528@kroah.com>
References: <VE1PR04MB73105F9B65F5546DF46BAAC48B150@VE1PR04MB7310.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB73105F9B65F5546DF46BAAC48B150@VE1PR04MB7310.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 30, 2020 at 03:52:14AM +0000, Peter Chen wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.10-rc2

Pulled and pushed out, thanks.

greg k-h
