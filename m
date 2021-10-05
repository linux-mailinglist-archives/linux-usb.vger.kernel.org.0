Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5341422506
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 13:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbhJELdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:33:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:52452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233812AbhJELdA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:33:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BEE76124D;
        Tue,  5 Oct 2021 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633433469;
        bh=v9Ivu2/WTGqU/gNbWAmUQGt6iunTwdCv2qRWu0qrIhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ydYzzA/zmFX1asG16uIv4bzccNY1//zhhu610KN6XTflY4rb5bMdbbLGI94nnPW/a
         3zRT/ix5I2FPr1Y1u4YJE0JAE9eAr703Jcy92fM8yGGahpYojPnOhH0kQ19PAMYE7l
         6v6/mpoa8AJhGYpMqmAMpKF5RvcFJxR2zRbVOGjQ=
Date:   Tue, 5 Oct 2021 13:31:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: u_audio.c: Adding Playback Pitch ctl for
 sync playback
Message-ID: <YVw3e1zOS2QvKiM0@kroah.com>
References: <20210925143003.12476-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925143003.12476-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 25, 2021 at 04:30:03PM +0200, Pavel Hofman wrote:
> EP IN is hard-coded as ASYNC both in f_uac1 and f_uac2 but u_audio sends
> steady number of audio frames in each USB packet, without any control.
> 
> This patch adds 'Playback Pitch 1000000' ctl analogous to the existing
> 'Capture Pitch 1000000' ctl. The calculation of playback req->length in
> u_audio_iso_complete respects the Playback Pitch ctl value to 1ppm now.
> 
> Max. value for Playback Pitch is configured by the existing parameter
> uac2_opts->fb_max, used also for the Capture Pitch.
> 
> Since the EP IN packet size can be increased by uac2_opts->fb_max now,
> maxPacketSize for the playback direction is calculated by the same
> algorithm as for the async capture direction in
> f_uac2.c:set_ep_max_packet_size.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c  |  5 +-
>  drivers/usb/gadget/function/u_audio.c | 93 ++++++++++++++++++++-------
>  2 files changed, 74 insertions(+), 24 deletions(-)

Does not apply to my tree, what kernel release / branch did you make
this against?

thanks,

greg k-h
