Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23741D4F5C
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 15:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgEONie (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 09:38:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbgEONie (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 May 2020 09:38:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACE5B20657;
        Fri, 15 May 2020 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589549914;
        bh=i1uDO3Rt2yIb3qX2EBAr3qqQdRbZpYWk7XpHGC9p+FI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FSHWF92FTdpPg2e/Qt/BqtVBQVakkKNBN4Y92XEHs3Pt3fp5Jk6JzTOzOsyqyKMoR
         BTCZRRI7XR8xqDIUP1hyhlm1smLrnKOQxprXpLo914bFwqBRQz2jqhQ++PV5mei99U
         goJaTEt0A8+AdddfCMobu9A7eqSyQMjSLvIsWD+c=
Date:   Fri, 15 May 2020 15:38:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.7-rc6
Message-ID: <20200515133828.GA2046686@kroah.com>
References: <87o8qp35wx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8qp35wx.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 15, 2020 at 12:26:38PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's what I hope to be the last set of fixes for the current
> cycle. The important part are all the fixes on the raw-gadget which have
> been discussed in the mailing list.
> 
> Let me know if you want anything to be changed.
> 
> cheers
> 
> The following changes since commit 5c4edcdbcd97fb3fb657898d0463afb84e4fbbb3:
> 
>   usb: typec: mux: intel: Fix DP_HPD_LVL bit field (2020-05-13 14:33:51 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git fixes-for-v5.7-rc6

Pulled and pushed out, thanks.

greg k-h
