Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133E930A845
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 14:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhBANGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 08:06:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:40656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhBANGO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 08:06:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A84B164DDD;
        Mon,  1 Feb 2021 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612184733;
        bh=TJkojB0v62stzt2wuwfUo8DV1SMMHI/iR4Uw2agXmXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XrtRPKyDsdlqByQ2ZRmq1f6OwuU5BO54tuXJbDiBpONBtzAMDjhUkLDxuNG+QG7fA
         WYo4jTIyVZSlTlFQbiyvpcHdcTWRm8JMNvFd862pb7J25bqA2d/DpV/OT+j1KDuBCL
         23DuDJzgaV7sRX0lH8HQ/uPdzfUZ4azkiW7QQ+gE=
Date:   Mon, 1 Feb 2021 14:05:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.11-rc7
Message-ID: <YBf8mvU+XuPL2zA1@kroah.com>
References: <20210201124452.GM2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201124452.GM2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 01, 2021 at 02:44:52PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:
> 
>   Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.11-rc7

Pulled and pushed out, thanks.

greg k-h
