Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA4C314E9F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 13:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhBIMDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 07:03:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:52812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhBIMBq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Feb 2021 07:01:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 780BA64E7C;
        Tue,  9 Feb 2021 12:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612872066;
        bh=9dOciIoXq/YJt10nA1l19PXVyBoCgIaMmtKTmKVHoxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vAa8fp/mbW6MAtGXB4W2FuY48HvkIpgCGfn5Gz2EAGF6oGLpImZliooTo3OXwRmkD
         4puuxqq4M6B3yAb6wO0ikUb5oFZzhsE4O3FNKBX/DrXRcepPLDQodQFDr67RKKTN4l
         8zz8RsjHwGp7YUFKFB2oC0KCO47si3qtGO6uDFHY=
Date:   Tue, 9 Feb 2021 13:00:41 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.12 merge window
Message-ID: <YCJ5aSOrKIkobu4k@kroah.com>
References: <20210209113426.GH2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209113426.GH2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 09, 2021 at 01:34:26PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.12-rc1

Pulled and pushed out, thanks.

greg k-h
