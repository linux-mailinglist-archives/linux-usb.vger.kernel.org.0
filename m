Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C1AE379
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 15:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfD2NOA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 09:14:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfD2NOA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 09:14:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25777204EC;
        Mon, 29 Apr 2019 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556543639;
        bh=CrWxlEGusK6KH4RcYMEbD22IYi7mEltvdFmE+TItnOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WpXLlUoWZbbjvXO+4+uImOD+zQ9toXL1PbPDOhWxPInYyrC0RnNNpwEFmaSp8q1Fg
         xy1I7WuLpviKKB/rikP5kV0wEImhucrupDhut6YqbQLDOyEl3+vIV+1VICRuLO+bZ7
         ALG03dE9R/kchOyiOAgsjaVi9Fzt/6YsLFuOIxgU=
Date:   Mon, 29 Apr 2019 15:13:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jim Lin <jilin@nvidia.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: xhci: Add Clear_TT_Buffer
Message-ID: <20190429131357.GB27385@kroah.com>
References: <1556541065-22352-1-git-send-email-jilin@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556541065-22352-1-git-send-email-jilin@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 08:31:05PM +0800, Jim Lin wrote:
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1864,6 +1864,7 @@ struct xhci_hcd {
>  	unsigned		hw_lpm_support:1;
>  	/* Broken Suspend flag for SNPS Suspend resume issue */
>  	unsigned		broken_suspend:1;
> +	unsigned		clearing_tt:1;

Document the bitfield?

Sorry, missed this last submission.

greg k-h
