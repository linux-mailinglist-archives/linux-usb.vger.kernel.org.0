Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690612F3581
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 17:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406590AbhALQTT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 11:19:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:51180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404886AbhALQPg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 11:15:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3CA4223E8;
        Tue, 12 Jan 2021 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610468096;
        bh=uBUHgePGainnyQr+MRx83eKjecIj61RuYpedWOuFydE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SP58jBUQ6do0xWFaC1/oDxAK2M34gUuTX2lNOWrSNF7jWlfVIdXI5f3PQoqWCizCA
         zl2TGV9pMp5YG9RCnqmXkFapXjczNV+AUSfLOGyXMsyoOO+G2XVA5GT7oe+ukmNmw4
         WM+7K9sMktHWueYVeUlJM8FM1v+Qw3q1QPLhtxsU=
Date:   Tue, 12 Jan 2021 17:16:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: fixes for v5.11-rc3
Message-ID: <X/3LRBuTuuRD0eDv@kroah.com>
References: <20210108010109.GA3318@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108010109.GA3318@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 08, 2021 at 09:01:09AM +0800, Peter Chen wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.11-rc3

Pulled and pushed out, thanks.

greg k-h
