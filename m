Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B771B429E76
	for <lists+linux-usb@lfdr.de>; Tue, 12 Oct 2021 09:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbhJLHW1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Oct 2021 03:22:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:47260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232500AbhJLHW0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Oct 2021 03:22:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC7D26109E;
        Tue, 12 Oct 2021 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634023225;
        bh=k3+j2vWsTJfAQshAZdI/UgNTbfrsH6oUnQ5Mjm/UNPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nNoLH2/RD+YndvaoL99QyCkCccJg1AxM1Y+fUY1TTuro46HmTuIdGzQSvnm4DgWbx
         A1RcwTL2p25hNPDcZhlXkHpAazG4WjvRGntxujKoRwiZd/AMLCp08A2hL2KqxsK9wA
         zA0VFNCwax23CzF5xMj/t2Vaei421cUyuSHv61A0=
Date:   Tue, 12 Oct 2021 09:20:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v3] usb: gadget: u_audio.c: Adding Playback Pitch ctl for
 sync playback
Message-ID: <YWU3Ngtbbk7Y+dG1@kroah.com>
References: <20211006081258.8501-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006081258.8501-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 06, 2021 at 10:12:58AM +0200, Pavel Hofman wrote:
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
> 
> Notes:
>     v2 -> v3: only notes added
>     
>     For: usb-next
>     Depends on patch 0560c9c ("usb: gadget: f_uac2: fixed EP-IN
>     wMaxPacketSize") currently only in branch usb-linus.

I have dropped this from my usb-testing branch now due to all of the
issues found by the 0-day bot with it (build failure and warnings.)

Please fix up and resubmit.

thanks,

greg k-h
