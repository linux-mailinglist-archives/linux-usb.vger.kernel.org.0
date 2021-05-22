Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EAA38D59B
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 13:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhEVL20 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 07:28:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230238AbhEVL2Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 May 2021 07:28:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5232261182;
        Sat, 22 May 2021 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621682819;
        bh=nPW3SJG/OmgBpcFuE9An9ThO5luLPVYW+1b2rdEwJo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=twM3bxWkbRsAcXy8zAKOX3EG2cDhHEUZolL+ijyd/b6Duy482fsVIs/xYZPNBz/D2
         ehWurjAFGLbyWqkaglTqEEw54D1Hb/Wo0UUoNnEOpXJ7FnMKFV1wB3jQ0uAwEuwxv4
         cRh+FVOsN8RJC7iciDObo0e8KCREXhMFuZNA9mOA=
Date:   Sat, 22 May 2021 13:26:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: bug fixes for v5.13
Message-ID: <YKjqgQQX1WTVpM+b@kroah.com>
References: <20210522102723.GA14135@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522102723.GA14135@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 22, 2021 at 06:27:23PM +0800, Peter Chen wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc3
> 
> for you to fetch changes up to 9e3927f6373da54cb17e17f4bd700907e1123d2f:
> 
>   usb: chipidea: udc: assign interrupt number to USB gadget structure (2021-05-17 10:04:05 +0800)

Pulled and pushed out, thanks.

greg k-h
