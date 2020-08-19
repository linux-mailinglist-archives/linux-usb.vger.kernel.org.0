Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E55249D84
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 14:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgHSMJv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 08:09:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:47662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728207AbgHSMJu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 08:09:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CA20205CB;
        Wed, 19 Aug 2020 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597838989;
        bh=t/TZTN6magjI4csa/4SY5nxjnkjswmAQ6VB4tPt4FX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vqWtTt6vHSS/+3hTZAFadZmyiLa0rrD/sO4Fp8oyRcW5/dWtC5UYsdEV2/imqVtPS
         SvBzPwkpNeHS1U9DviqGFxnoF19GJcHHrVBx5F0P2UFoVapEWzWGjPKm8Q21yeffG5
         T6WMG5BKSFcmk376CIuHJiI1RCWCRWJ9Ig69Js20=
Date:   Wed, 19 Aug 2020 14:10:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.9-rc2
Message-ID: <20200819121011.GB931936@kroah.com>
References: <87wo1uyhdm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wo1uyhdm.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 03:01:09PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's my first pull request for the current -rc cycle. It contains only
> 4 commits. Hopefully this means the USB gadget framework is almost ready
> ;-)

Hah!

> Let me know if you want anything to be changed
> 
> cheers
> 
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> 
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.9-rc2

now pulled and pushed out, thanks.

greg k-h
