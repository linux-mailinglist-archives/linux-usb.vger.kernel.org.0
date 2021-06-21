Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C553AE5C1
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jun 2021 11:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhFUJRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Jun 2021 05:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:44236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230061AbhFUJRb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Jun 2021 05:17:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9F5A61059;
        Mon, 21 Jun 2021 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624266917;
        bh=AXRrXRNLq0BDB++1HSfkoXpt2mnysReljEJFpd9zNdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nKJzQfRMOtAzUjQtGJBsx/PBSfKNkzX5Wtttud2s/xnWwBgHuKo5YtNn9JL8yLY57
         ZMljmYP4g5svXfewTRhPYc1K4DU1N3/I4Ss8ypTtQeQyts8j3Ih7IpPQ9XdjbcJA7F
         e5eLwuV1v04Iv6ARmRpYiGdPivNSTWEoGwMen04o=
Date:   Mon, 21 Jun 2021 11:15:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: changes for v5.14-rc1
Message-ID: <YNBYos63bZoPcP6h@kroah.com>
References: <20210619090655.GA9299@Peter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619090655.GA9299@Peter>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 19, 2021 at 05:06:55PM +0800, Peter Chen wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.14-rc1

Pulled and pushed out, thanks.

greg k-h
