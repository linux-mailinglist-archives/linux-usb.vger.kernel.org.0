Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD0D2A94AE
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 11:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgKFKuN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 05:50:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:36536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgKFKuN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 05:50:13 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3FC6206FA;
        Fri,  6 Nov 2020 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604659811;
        bh=14U16S6iZUV0HRhCrVQqjCD2le1kVg/6x260MH6aH9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t0QoVSB5i880mfiuWtsQyWqzOzvmkG3Eel8/ijfHPIlGlA18YXm63bPfHir1fTeyR
         eEYBu95e8j2GywMOPrceTObxWPo4RbhlEymeUTxSbjjAg0EhuoAroCoRfBAAZcNsdY
         d/WgOYRrAR6sWYCvcL0o7ENMXz6SOM08xC0ds3dE=
Date:   Fri, 6 Nov 2020 11:50:58 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        George Kennedy <george.kennedy@oracle.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201106105058.GA2801856@kroah.com>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 31, 2020 at 03:24:41AM -0400, Peilin Ye wrote:
> `struct console_font` is a UAPI structure, thus ideally should not be
> used for kernel internal abstraction. Remove some dummy .con_font_set,
> .con_font_default and .con_font_copy `struct consw` callback
> implementations, to make it cleaner.
> 
> Patch "fbcon: Prevent global-out-of-bounds read in fbcon_copy_font()"
> depends on this patch, so Cc: stable.
> 
> Cc: stable@vger.kernel.org
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/
> 
>  drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
>  drivers/video/console/dummycon.c        | 20 --------------------
>  2 files changed, 41 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
