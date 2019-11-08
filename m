Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84A4F51A0
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 17:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfKHQxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Nov 2019 11:53:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:43158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbfKHQxW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Nov 2019 11:53:22 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF9F921882;
        Fri,  8 Nov 2019 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232002;
        bh=8k29q9L3Ba+eq57WnaMOgOXVog3FkRQ9/lNPfg63ho8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XhrlEupuYFxnOdlROptgBGReBF+UPt8WPqpn3pLMu3GC3aSetQYa3Mvn3JdAHKHBH
         Z/WkzotDSQrbOGk47NdK0kelX718il6jmDO50T2+Bbniy6R2eSfhyZnXX1W45l814f
         YKn4g3t51xcXP2dDPRFvIyAcuxBbu4B46SKtw5Ow=
Date:   Fri, 8 Nov 2019 17:53:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: u_audio: Remove superfluous
 snd_dma_continuous_data()
Message-ID: <20191108165319.GB1168209@kroah.com>
References: <20191108164214.611-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108164214.611-1-tiwai@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 08, 2019 at 05:42:14PM +0100, Takashi Iwai wrote:
> The recent change (commit 08422d2c559d: "ALSA: memalloc: Allow NULL
> device for SNDRV_DMA_TYPE_CONTINOUS type") made the PCM preallocation
> helper accepting NULL as the device pointer for the default usage.
> Drop the snd_dma_continuous_data() usage that became superfluous from
> the callers.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> ---
> 
> Note that the prerequisite commit 08422d2c559d is found currently only
> on for-next branch of sound git tree, so please give ACK if it's OK,
> so that I can apply on top of it.  Thanks!


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
