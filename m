Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29C52F3553
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 17:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393128AbhALQPY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 11:15:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:51030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393122AbhALQPX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 11:15:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0099922227;
        Tue, 12 Jan 2021 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610468082;
        bh=siJwsKPnAEybsFnGq1RWbFpfdmUGIGkYnWZs7l8446c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gDfSAqQrwn0zzN0/vVMd5Tj2A+UjU5dW5NfHdN52mVe5sF84M78JAbHnhtiWgjHyX
         wbLzM1mG3ApHW081/UithOfAHhSk7YPeQ9zt03ZqoAXkYmvHBGktGO9LqzH1nkMOV6
         bEwYuIS+4gafBdbi6+vO8RQsabOYZ+Gn6IEW9cDE=
Date:   Tue, 12 Jan 2021 17:15:51 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.11-rc4
Message-ID: <X/3LN1ljc64lAf85@kroah.com>
References: <20210112151836.GX968855@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112151836.GX968855@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 12, 2021 at 05:18:36PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
> 
>   Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.11-rc4

Pulled and pushed out, thanks.

greg k-h
