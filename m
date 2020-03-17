Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8D8188D85
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2020 19:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgCQS6k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Mar 2020 14:58:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgCQS6k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Mar 2020 14:58:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 083CB20724;
        Tue, 17 Mar 2020 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584471518;
        bh=OY84ZxDccQFhgYDlAvwhsfk2SegbVqCssMbIJ8LHZwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lEbfyZoVjZ3QH6Ubdqit9/rhjwYb9P8NvvchyecqX491YLdrQbE/GlMKC3zMNNUne
         qEgelwQ3uFe4fQa+kZ+0OM1p3bfQfJwHR6Jf0Uc6l4q9sHNorvydkzavwDtsi7RRDp
         xJVMVVS2bci5AoO+xyZzpeIA4hiGy8wuEQ8MKd2E=
Date:   Tue, 17 Mar 2020 19:58:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] usb: tegra: Changes for v5.7-rc1
Message-ID: <20200317185835.GC1480055@kroah.com>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313170730.2924259-1-thierry.reding@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 13, 2020 at 06:07:30PM +0100, Thierry Reding wrote:
> Hi Greg, Felipe,
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-usb
> 
> for you to fetch changes up to 9dd4fbef2f88ccf46f5294805bf121d6554791e8:
> 
>   usb: gadget: tegra-xudc: Support multiple device modes (2020-03-13 17:16:28 +0100)
> 
> It occurred to me that I could just as well send this pull request to
> you guys, rather than take it via ARM SoC. Kishon already acked all the
> patches for the PHY tree that this series depends on, so I've included
> them here as a dependency.
> 
> Let me know if you'd prefer that I take this through ARM SoC.

I tried to merge this into my usb-next branch, but get merge issues in
drivers/usb/gadget/udc/tegra-xudc.c that I really don't know how to
resolve.

Can you give me a clue as to what to do here?

thanks,

greg k-h
