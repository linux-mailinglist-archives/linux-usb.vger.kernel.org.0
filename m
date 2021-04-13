Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5109F35DC60
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 12:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241668AbhDMKTZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 06:19:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243793AbhDMKTN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Apr 2021 06:19:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C887613BB;
        Tue, 13 Apr 2021 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618309133;
        bh=b7FLiBIplyPhcilwkZ9HzIcPYoCEuOuDo/+6f20NrnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nd3yZZfJwWxvM0KrttJfwywe23u1Pa2fveXm4NvdJ++HPlEpVtXw0ZUEnKrj9eKAH
         HDa8VAv6pwkxDxf4l2GBQQY9TUxBcsVsy0OgRKOpE5Ugnd/iqY8Yoj9zkj+UIYSSlE
         CrrHUs1gcT3odDxT3FrGo94Qj0wHHdx0Vll3C+YE=
Date:   Tue, 13 Apr 2021 12:18:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.13 merge window
Message-ID: <YHVv67PpsW2filcr@kroah.com>
References: <20210413101034.GA3253676@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413101034.GA3253676@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 13, 2021 at 01:10:34PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.13-rc1

Pulled and pushed out, thanks.

greg k-h
