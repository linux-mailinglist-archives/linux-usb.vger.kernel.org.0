Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B163C353C27
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 09:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhDEHFd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 03:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232312AbhDEHFc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Apr 2021 03:05:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E806128D;
        Mon,  5 Apr 2021 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617606325;
        bh=lwd5XnAmGnjwFIkx3oJSTwfqz42F3rs0ozEPA5qWYBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p3EEUR4Bu9RmR27EjZ4317qi+XAszNHv+1M2zjO+1+ktIAPUzU1P5tzmb6G+vAKFg
         7M5Oaeb3z81pnPaVZtBbyZA0gEL5mKy9Q44vrbfG4BnhUkZk7kn51b+vgLQIQIzsvu
         Uza8HaIPr8cUDi5KsaecnQ2Lm7BP6+W+G+Cuoa0Y=
Date:   Mon, 5 Apr 2021 09:05:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: fixes for v5.12
Message-ID: <YGq2syUhFKBTkY65@kroah.com>
References: <20210403001012.GB18389@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403001012.GB18389@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 03, 2021 at 08:10:12AM +0800, Peter Chen wrote:
> The following changes since commit cf97d7af246831ea23c216f17205f91319afc85f:
> 
>   usb: cdnsp: Fixes issue with dequeuing requests after disabling endpoint (2021-03-27 08:59:46 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/v5.12-rc5

Pulled and pushed out, thanks.

greg k-h
