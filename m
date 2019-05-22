Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6449D267FB
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 18:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbfEVQUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 12:20:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728638AbfEVQUG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 12:20:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2629E21473;
        Wed, 22 May 2019 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558542005;
        bh=cvOsDYBU7K/64voRX1UMUS0mhGd1RnKxtiaqAVkn80U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WuZuyP9e98HQvST4mHUhLadBvDnY46XzyNpBE03zl/ZOrcvxcq+6HLANFtCPXnffW
         AJWl4zDBf2RSZueOmF3JbolQxy1v+2Xf55THxgS/taUHyWIMGYy/bz+EWPIGdZPCiE
         08K00PjWYtDbhHnHnKp2QgR8WTDSfNHdyy/q1oZs=
Date:   Wed, 22 May 2019 18:20:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Fabio Estevam <festevam@gmail.com>, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, henryl@nvidia.com
Subject: Re: [PATCH v2] xhci: Use %zu for printing size_t type
Message-ID: <20190522162003.GB30643@kroah.com>
References: <20190522133529.14164-1-festevam@gmail.com>
 <8ac71a87-cf73-852b-c4b7-4322f0ed5e5b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac71a87-cf73-852b-c4b7-4322f0ed5e5b@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 22, 2019 at 05:08:13PM +0300, Mathias Nyman wrote:
> On 22.5.2019 16.35, Fabio Estevam wrote:
> > Commit 597c56e372da ("xhci: update bounce buffer with correct sg num")
> > caused the following build warnings:
> > 
> > drivers/usb/host/xhci-ring.c:676:19: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
> > 
> > Use %zu for printing size_t type in order to fix the warnings.
> > 
> > Fixes: 597c56e372da ("xhci: update bounce buffer with correct sg num")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> 
> Thanks for writing this follow-up patch
> 
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> 
> 

Thanks, now queued up.

greg k-h
