Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22C03AE6F8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jun 2021 12:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFUK0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Jun 2021 06:26:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:32918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhFUK0I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Jun 2021 06:26:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CBBA611C1;
        Mon, 21 Jun 2021 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624271033;
        bh=fD5A0vBLpVq3CT9rnZ9UXSsuSPFuUrq4pecQ4XBLN5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qfDdgzHpkUuZoeZ7iSuZX/Pu1ftvvf2+VN/GrjBaFyzNAydLMEons56LaTIQlgVAi
         o0vfUFVl8AQi/BRzTWfYLJoPhb2nGyZWapGcs+w0WJOnCHJOQGUQ3stTxbSiKhm1rl
         trtlAewwB5QZ9K3XSRsSS8+A3Bw0Wa9FB5MKt2n8=
Date:   Mon, 21 Jun 2021 12:22:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.14 merge window
Message-ID: <YNBogFpbmMssonGb@kroah.com>
References: <YNBlRNAvQ9DGhWqg@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNBlRNAvQ9DGhWqg@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 21, 2021 at 01:09:08PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:
> 
>   Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.14-rc1

Pulled and pushed out, thanks.

greg k-h
