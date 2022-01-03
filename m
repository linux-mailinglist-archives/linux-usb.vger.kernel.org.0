Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028A14830F5
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jan 2022 13:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiACMXX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 07:23:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37926 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiACMXW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jan 2022 07:23:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25557B80EA7
        for <linux-usb@vger.kernel.org>; Mon,  3 Jan 2022 12:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8F9C36AED;
        Mon,  3 Jan 2022 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641212599;
        bh=0jHdOcqstfhSBPmnswy9jWwO6KpyrFXwS9Itu2HD/Xc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G4UixPXacnTX/pxxJ+fuC5L+2nOoaG5WuCfKgmj60RMX//Lm0D6DRvbKHcfWrd+se
         Etr52TPqjbo7CU9VNbNBMRs4O7DUpUz0jLAY2MBEziTx29lSsAqxEvqFePnHO12JfV
         vDXh0KRuf1c0/lvVbq0E/xWkeY9AwzsE5FiIFKRw=
Date:   Mon, 3 Jan 2022 13:22:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.17 merge window
Message-ID: <YdLqiyC9Xrqc3rEO@kroah.com>
References: <YdLVXlwnU+QNxaHZ@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdLVXlwnU+QNxaHZ@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 03, 2022 at 12:52:14PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1:
> 
>   Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.17-rc1

Pulled and pushed out, thanks.

greg k-h
