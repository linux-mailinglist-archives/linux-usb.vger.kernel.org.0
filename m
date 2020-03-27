Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35D2A1959F2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 16:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgC0Pdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 11:33:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgC0Pdb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 11:33:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B11420578;
        Fri, 27 Mar 2020 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585323210;
        bh=0gQi+LS2PMribFGAKhCO4se7PPGlIv5ZYXk31BhMx0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KucDbApgEwSj+jorOqcbnQAx8ZJzqNBDLDh0PFCAhbI3MCsjRBmXw63OjEh8TbmEZ
         /uqDc4mMO/wMeud0eWC0UoOLPyKAOcpMqQ87R+GOVEr00pQkEiqZ5yZugGHoxKcuIX
         8bNeBRnqUGqx1KACFaXaFdX2bmWi6WipvDFvIA+o=
Date:   Fri, 27 Mar 2020 16:33:28 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Reichl <hias@horus.com>
Cc:     Anthony Mallet <anthony.mallet@laas.fr>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-acm: restore capability check order
Message-ID: <20200327153328.GA3167199@kroah.com>
References: <20200327150350.3657-1-hias@horus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327150350.3657-1-hias@horus.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 27, 2020 at 04:03:50PM +0100, Matthias Reichl wrote:
> commit b401f8c4f492c ("USB: cdc-acm: fix rounding error in TIOCSSERIAL")
> introduced a regression by changing the order of capability and close
> settings change checks. When running with CAP_SYS_ADMIN setting the
> close settings to the values already set resulted in -EOPNOTSUPP.
> 
> Fix this by changing the check order back to how it was before.
> 
> Fixes: b401f8c4f492c ("USB: cdc-acm: fix rounding error in TIOCSSERIAL")
> Cc: Anthony Mallet <anthony.mallet@laas.fr>
> Cc: stable <stable@vger.kernel.org>
> Cc: Oliver Neukum <oneukum@suse.com>
> Signed-off-by: Matthias Reichl <hias@horus.com>
> ---
>  drivers/usb/class/cdc-acm.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Thanks for this, now queued up.

greg k-h
