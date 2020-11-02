Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A1B2A2ACA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 13:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgKBMgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 07:36:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:47602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728511AbgKBMgD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 07:36:03 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B0472225B;
        Mon,  2 Nov 2020 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604320562;
        bh=ja/8tlJHAbiQmQhXL7bdVNkHrgvX6sVKjG4a4M+xtt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l1YxmL1tfUqoJE1mPT8ZbpuFOP5TKz/YC2tDIGYupHvK3i2nWcUl518J2V+icAwEX
         fIcK7qrfbgJalHYQtUfCqZDJCAeOPJNPBefJDHct/jcvDy0QRSD/Xfgi0dUac4g+xr
         ifi1t4hK5GbC8/KTgkH7lz2T+j77Kr00dVgKJ9CY=
Date:   Mon, 2 Nov 2020 13:36:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.10-rc2
Message-ID: <20201102123648.GA732161@kroah.com>
References: <87r1pcqh7u.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1pcqh7u.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 02, 2020 at 10:46:13AM +0200, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's my first pull request for the current -rc. Not much here this
> time around, hopefully this comment didn't jinx it ;-)
> 
> Let me know if you want anything to be changed.
> 
> cheers
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.10-rc2

Pulled and pushed out, thanks.

greg k-h
