Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE76B439031
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 09:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhJYHVe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 03:21:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231279AbhJYHVd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Oct 2021 03:21:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAA1E60724;
        Mon, 25 Oct 2021 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635146351;
        bh=+5hjeH7uQoJji5cBr2gLSh/AWb9BTi1OQNGbddXR+ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1YjLS9V6OkW66Urk51t3QicTfYvQc9Rzz+EdLLqXa6iFYgN6xQRaPDjiVrVXanYMv
         m2VfvHZxvbktG36zsdCTnBrzQJx/4XLw3hTXRpfyytoKZRz9BSHcoATfHQmhiCnZh1
         POh7qsg13WMwfAl3SbsIYMOTMo4eo3QSR+liNAkQ=
Date:   Mon, 25 Oct 2021 09:19:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb:gadget: f_uac1: fixed sync playback
Message-ID: <YXZabbR5pEsc/mE3@kroah.com>
References: <20211022140339.248669-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022140339.248669-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 22, 2021 at 04:03:39PM +0200, Pavel Hofman wrote:
> The u_audio param fb_max was not set to its default value in f_uac1.c.
> As a result the maximum value of Playback Pitch ctl was kept at 1000000,
> not allowing to set faster playback pitch for UAC1.
> 
> The setting required moving the default constant UAC2_DEF_FB_MAX from
> u_uac2.h to FBACK_FAST_MAX in u_audio.h as that header is common for
> f_uac1.c and f_uac2.c.
> 
> Fixes: 6fec018 ("usb: gadget: u_audio.c: Adding Playback Pitch ctl for
>                  sync playback")

Nit, in the future the format for this is:

Fixes: 6fec018a7e70 ("usb: gadget: u_audio.c: Adding Playback Pitch ctl for sync playback")

The kernel documentation about submitting patches should describe this.

I'll go hand-edit it, no worries this time.

thanks,

greg k-h
