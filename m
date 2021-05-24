Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF3D38E7B9
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 15:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhEXNgT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 09:36:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232401AbhEXNgS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 09:36:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 358166138C;
        Mon, 24 May 2021 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621863290;
        bh=ap0JKfXHsILS8wwrfDy0MpXIFdcaSB+t/OGGOnkOXcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y5h8awNMJc7SK1SVhdKzMxDfLBT9pyiJpZ7j3g6GCyW40l4j+WjkkTrMdWN1bWlSB
         4AQpqLKvl35FR5Af7HLbT6A/Bk7xmze6c5WtTcWhs/zBajFLwxsmipbDAZgcOWR2Fj
         BTp3KKhUSSkfJAffjvVU8EeNmtI6gNTDbQKnOWkc=
Date:   Mon, 24 May 2021 15:34:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v5.13-rc4
Message-ID: <YKurcK8R9XsQm5PN@kroah.com>
References: <20210524132932.GF291593@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524132932.GF291593@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 24, 2021 at 04:29:32PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:
> 
>   Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.13-rc4

Pulled and pushed out, thanks.

greg k-h
