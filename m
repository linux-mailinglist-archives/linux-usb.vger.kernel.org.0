Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41194304065
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 15:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392742AbhAZOeC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 09:34:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:55858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392764AbhAZOb6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 09:31:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E7D522EBD;
        Tue, 26 Jan 2021 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611671478;
        bh=lCDeEllePGSdbC047wovpja/TxDcxspb898XpipaVc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HRFJzuy3C6mTXV1Gcu/3015BtWNKEwMMNA+dO6P6cvWTPsTaV2MEKe1nko/O42ZRs
         mQUGWHoclmR/bcTV59HtIORnG4rAzgg80RXLjcVYHydFYS5TDPeKAcYivi8QUj8CQ4
         cBR4mcLE+AbphShfCXBAzC4K2OafWJQbCYsmPmCfmjqnNZi80k5ttd6GDvoHZpceZj
         /GZB9WinGx3JiPnQtWoPTI4SBfRRrwvYzpytvYAdvrXU5w7bXKEax/k8P0es7D6Gms
         zRvHeHcumXT1YcjWLLXJzkfBXh0+36IBMU1fe/WU5Lk9i3UHDpm85D28DAqXqI+LD7
         mnd5sIl/qddTQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l4PNO-0007dd-VZ; Tue, 26 Jan 2021 15:31:27 +0100
Date:   Tue, 26 Jan 2021 15:31:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul B Schroeder <pschroeder@uplogix.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mos7840: fix error code in mos7840_write()
Message-ID: <YBAnvtBE4H0ef+5a@hovoldconsulting.com>
References: <YA/ubifCUlJXxG5g@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA/ubifCUlJXxG5g@mwanda>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 26, 2021 at 01:26:54PM +0300, Dan Carpenter wrote:
> This should return -ENOMEM instead of 0 if the kmalloc() fails.
> 
> Fixes: 3f5429746d91 ("USB: Moschip 7840 USB-Serial Driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Johan
