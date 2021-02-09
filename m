Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE99D314A71
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 09:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBIIhK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 03:37:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhBIIgx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Feb 2021 03:36:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D6A664EBE;
        Tue,  9 Feb 2021 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612859772;
        bh=Ft+k6ChKA3sLViwh2bD7xbxHbsL4vuWt/wHjrAsmI7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XdDTsgNnwRzHLeL0BSRf55XQTRPOY/VG82SUU4Cx/RdH0Bjwr2CZ5TMFSdy/F7MCE
         bKuL+AjafJSVCWK1c4M6qr4npE0UQL1zdqy9FBOO235AuQ6fiZD8SW9+UUSsToXQP1
         vqb9otfvNnIjJyNKfTpxDacBIdbtcW8oB4rCFCEs=
Date:   Tue, 9 Feb 2021 09:35:27 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: changes for v5.12-rc1
Message-ID: <YCJJT7ebdTYY3/Qd@kroah.com>
References: <20210208132238.GA16704@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208132238.GA16704@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 08, 2021 at 09:22:38PM +0800, Peter Chen wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.12-rc1
> 
> for you to fetch changes up to 1ee18ded86ece87227a76d7101034fd305b8c803:
> 
>   usb: cdnsp: Removes some useless trace events (2021-02-06 15:43:52 +0800)
> 
> ----------------------------------------------------------------
> In v5.12-rc1, it adds cdnsp drivers for Cadence USB3 Family,
> it is different UDC driver with current cdns3 driver.

Pulled and pushed out, thanks.

greg k-h
