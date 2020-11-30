Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704D32C8699
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 15:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgK3OXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 09:23:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgK3OXr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 09:23:47 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BA2720855;
        Mon, 30 Nov 2020 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606746181;
        bh=D5YLA2umI5xTIpIU3B4wMUGQnZii2vBjolInixNmMu0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j5SKazd1cvKNNnCeOH7JqRzgHU8HxogXSJhIyKx0caVlumceg40PfwHYT6FxLWl6y
         eMN+YiGcBzjQDR0Z/R6QjdffJDE+VSA1Wn2Lr7g4IibKnSZWmJmkmHpGa67OxyAyd4
         wBkDKfhAOosMnpvIbktmfdKaUg3zXnqvVea8bBlM=
Date:   Mon, 30 Nov 2020 15:24:15 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.10-rc7
Message-ID: <X8UAj0NE/vz7uNsn@kroah.com>
References: <20201130113238.GT5246@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130113238.GT5246@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 30, 2020 at 01:32:38PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:
> 
>   Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.10-rc7

Pulled and pushed out, thanks.

greg k-h
