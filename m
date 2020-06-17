Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461421FC594
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 07:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgFQFRt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 01:17:49 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48373 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbgFQFRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 01:17:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 473145C0097;
        Wed, 17 Jun 2020 01:17:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 17 Jun 2020 01:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Rur7T2gicgakrNTN+vjXCicVxVJ
        SaTbqgi1qMUbb3MU=; b=Euddcc7tXNK1lMHAxMU59Z9codudwc4lrh26nW757oT
        r1+j9wmfpKkjGAT4NYGi2A2+ZmgvwIrzJMV4Oguc9uJFg73gsTHxnwtaCf89/o5/
        +CdRNYZlTv5YAlIRhViNadAMlNvQPt+rK1fzztdjHVlVrNCpQ6UuZPlIjsPHhHDg
        sZNGPsrDLv3Wvrztx/WtwhoBCcGuorrloxeiZ/nubCl9516s6gsceRGe2jqebjqb
        naahcF1+JepUCqyoVycaoEodMi7Toscd5dPySlnW0tlTy2N0XvAdaNog/ctxqeng
        URoxxZpFKYlTQj1/9FORwv/OUC/XONZh1QvC1AU9YKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Rur7T2
        gicgakrNTN+vjXCicVxVJSaTbqgi1qMUbb3MU=; b=WCrxTqzHnAZZEViOto5jnn
        hQ1f9e4us/0kMh/6PMWvypfXXuOkT6PAUvv7/SIBsitc8uO0UhRbDoyDVdCdd7On
        BBMzViGmq0huUMyVoPJkYNSqmKiQIcvyrGaam9sNXv558Was4ahH1IFuT7Z/v6iW
        oCx85yL/ycyHIpoz0K7smZC/M+JeiqVLKbJ0oGuxHePnP3EUsOfdtPCXA8Sb/p88
        fYrrA4AQuMAp/s4GeK9LFHqFoOwgwKoOxqjF0rBzxvE37qAOwgyYCrxJFrhOY1L9
        LRhy/v4UTy9xbYFapSdeYaoBYcT4LD4h3PnIa5hGsDZNZjopCWkuYivxa/zFTEEw
        ==
X-ME-Sender: <xms:eqfpXt_3_w8sDkSlUMMjMIxHCXna3Lu2g2ouunNUP55lnCW8qPZ8hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:eqfpXhsAOfSNDt1Vf1DTlTiDT06y0dEl4w8CEcKjZ7VDM6q9KV65tQ>
    <xmx:eqfpXrCloawgWFSwSuSSlUkJ_IoQ5Z4IkPdq5WHmByK0Z0mWmjTX-g>
    <xmx:eqfpXhcY015XrQtL4Z4Sa2xRCn44pjstBKRIZRQbfUNzQiipEqdw8Q>
    <xmx:e6fpXobffetXkx4Jp7EzcnIkOdxaOFDCPgnGnJNbDO9DZSCmtykWMQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 60EF9328005A;
        Wed, 17 Jun 2020 01:17:46 -0400 (EDT)
Date:   Wed, 17 Jun 2020 07:17:38 +0200
From:   Greg KH <greg@kroah.com>
To:     JaeHun Jung <jh0801.jung@samsung.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Message-ID: <20200617051738.GB1331778@kroah.com>
References: <CGME20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791@epcas2p3.samsung.com>
 <1592358930-28684-1-git-send-email-jh0801.jung@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592358930-28684-1-git-send-email-jh0801.jung@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 17, 2020 at 10:55:30AM +0900, JaeHun Jung wrote:
> In mobile, a co-processor is used when using USB audio
> to improve power consumption.
> hooking is required for sync-up when operating
> the co-processor. So register call-back function.
> The main operation of the call-back function is as follows:
> - Initialize the co-processor by transmitting data
>   when initializing.
> - Change the co-processor setting value through
>   the interface function.
> - Configure sampling rate
> - pcm open/close
> 
> Bug: 156315379
> 
> Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc

No need for Bug or Change-Id on patches submitted to us, same for the
odd "ANDROID:" in the subject.

> Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
> ---
>  sound/usb/card.c     | 16 ++++++++++++++++
>  sound/usb/card.h     |  1 +
>  sound/usb/clock.c    |  5 +++++
>  sound/usb/pcm.c      | 33 +++++++++++++++++++++++++++++++++
>  sound/usb/usbaudio.h | 30 ++++++++++++++++++++++++++++++
>  5 files changed, 85 insertions(+)

Did you run scripts/get_maintainer.pl on this patch to determine that
maybe the alsa-devel list should also be needed?



> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index fd6fd17..2f3fa14 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -111,6 +111,7 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +struct snd_usb_audio_vendor_ops *usb_audio_ops;
>  
>  /*
>   * disconnect streams
> @@ -210,6 +211,12 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
>  	return 0;
>  }
>  
> +void snd_set_vender_interface(struct snd_usb_audio_vendor_ops *vendor_ops)
> +{
> +	usb_audio_ops = vendor_ops;
> +}
> +EXPORT_SYMBOL_GPL(snd_set_vender_interface);

You are exporting a lot of new symbols, but you have no user of these
symbols, which is not allowed, as you know.  Please also post your user
of them so we can see if you are doing things correctly or not.

Also, only one set of "vendor ops" does not make any sense at all, this
needs to be on a per-host-controller basis, right?  If so, why is this
all in the sound driver?

thanks,

greg k-h
