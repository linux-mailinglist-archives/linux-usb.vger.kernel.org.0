Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466F22D2B56
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 13:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgLHMqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 07:46:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:34070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgLHMqr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 07:46:47 -0500
Date:   Tue, 8 Dec 2020 13:46:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607431566;
        bh=8mrUPtO0PblI1SeCOEQnxehyz9SpfMq+vpGoZ6u62P4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=LRywAuk87ENtJa/wKk2pMafIlggJKZVsl4qnKvehwFg9AZLzLaMZMU79UDWCkBUsx
         I2tHY7n1MOSSauZ0xdGHk7c/jc1VESn9FnfdFO/HMKRhwOgyIgKdjbYzJOAdDmow01
         9IU/yzSttEhSmchYXUug49JBv9QM457H58qTNUv4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.11 merge window
Message-ID: <X891p/xZTglq1sfn@kroah.com>
References: <20201208121830.GC5246@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208121830.GC5246@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 02:18:30PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:
> 
>   Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.11-rc1

Pulled and pushed out, thanks.

greg k-h
