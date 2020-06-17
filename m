Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36B01FC7EB
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 09:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgFQHw4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 03:52:56 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47945 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbgFQHw4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 03:52:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B13705C0042;
        Wed, 17 Jun 2020 03:52:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 17 Jun 2020 03:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=jdewwhHmaaDfh9nfyOXAAhEhrGY
        n782r7CvvQRi1ncE=; b=N+kCvmPyGgzdloYhoeZfwIN/c6FoamsIEhS4+rqrKts
        mxPPWGlsBjn/362LYDlf5cKBmDXEid/137dZ+baFq3NhL+3tjk5P73sUu5VSglKZ
        r/qSPKUN444DoG5aa8EqLhm8RFrpqR+tXxWLqsl8ZwZmzqHTTFhjI+guEUTXZZvT
        6SlBP5zo0wqgVCFLltIzVYCpZBissnqLg02jtgIdwXibGTXYHuuj7PCz+X4dwCdR
        8Pkao/eBUzZ+0j6qUvyJ15Ksf9aVJLjxYk/unPapibRKsATkY2ZblGpIsBhD4qOl
        FStAJGuj7A0yxsEv/QbzRw+nkGwcB9wgOfUJIIhmRvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jdewwh
        HmaaDfh9nfyOXAAhEhrGYn782r7CvvQRi1ncE=; b=sQHabR0RrB1P2dyZHRhoev
        IjiIcYUfUoztbmkC6lZ3TCIywBk89Q/QjcU0wboQp4Z7UpcP3qsW7D0cf4qkKTOc
        7Wv72IlcqKMYPzGbTbvMqI5eg6ufnB1E4E8mdBzzphm6MjZmV5F9bv9LhKYPLgAt
        cArNbZHITvvO9rQgtZRV+ix+YfJFgZlnFZBng/QR9O+OXS5bEdzw3l2MHxw+OFtl
        akKtrmFgxJVI5yg/aqizbuNw3ZEIUI4/272vJxKluyIZVdl1IB6CgW8NWvxFeyCc
        XRh3lq41XzbGZxnzqO0LE1ex5EAyd3hMEKZM/XuLMhUZv0C04+9btFtIJ58T7E+A
        ==
X-ME-Sender: <xms:18vpXifXBsBsHtzk1t_Vuzivz_gK4DvkXHFweYUZFk2vOlAknWUAsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejuddguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:18vpXsPBIFqo9zAX_O8ghEdKocNQHBmwLx1m16vvGeFfCRwumE6Jvg>
    <xmx:18vpXjgKLH9ARgTtTPnSMbMNEQ5_Kx1RQdnKhn7V4f7B-SsvbEjmeg>
    <xmx:18vpXv8VcvdqgRcy8p0sZ9WqB_YI_dhNRs0SLV1JgBSpBIZ_tiQVew>
    <xmx:18vpXs5fdt6znFwbCeaBL--VGfbchTUFwaN5kbREvhhr_tnQTA0fog>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4A35C328005D;
        Wed, 17 Jun 2020 03:52:55 -0400 (EDT)
Date:   Wed, 17 Jun 2020 09:52:49 +0200
From:   Greg KH <greg@kroah.com>
To:     JaeHun Jung <jh0801.jung@samsung.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Message-ID: <20200617075249.GA1547648@kroah.com>
References: <CGME20200617020305epcas2p35de377f38ec42a41adb47a49dfc33791@epcas2p3.samsung.com>
 <1592358930-28684-1-git-send-email-jh0801.jung@samsung.com>
 <20200617051738.GB1331778@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617051738.GB1331778@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 17, 2020 at 07:17:38AM +0200, Greg KH wrote:
> On Wed, Jun 17, 2020 at 10:55:30AM +0900, JaeHun Jung wrote:
> > In mobile, a co-processor is used when using USB audio
> > to improve power consumption.
> > hooking is required for sync-up when operating
> > the co-processor. So register call-back function.
> > The main operation of the call-back function is as follows:
> > - Initialize the co-processor by transmitting data
> >   when initializing.
> > - Change the co-processor setting value through
> >   the interface function.
> > - Configure sampling rate
> > - pcm open/close
> > 
> > Bug: 156315379
> > 
> > Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc
> 
> No need for Bug or Change-Id on patches submitted to us, same for the
> odd "ANDROID:" in the subject.
> 
> > Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
> > ---
> >  sound/usb/card.c     | 16 ++++++++++++++++
> >  sound/usb/card.h     |  1 +
> >  sound/usb/clock.c    |  5 +++++
> >  sound/usb/pcm.c      | 33 +++++++++++++++++++++++++++++++++
> >  sound/usb/usbaudio.h | 30 ++++++++++++++++++++++++++++++
> >  5 files changed, 85 insertions(+)
> 
> Did you run scripts/get_maintainer.pl on this patch to determine that
> maybe the alsa-devel list should also be needed?
> 
> 
> 
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index fd6fd17..2f3fa14 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -111,6 +111,7 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
> >  static DEFINE_MUTEX(register_mutex);
> >  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
> >  static struct usb_driver usb_audio_driver;
> > +struct snd_usb_audio_vendor_ops *usb_audio_ops;
> >  
> >  /*
> >   * disconnect streams
> > @@ -210,6 +211,12 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
> >  	return 0;
> >  }
> >  
> > +void snd_set_vender_interface(struct snd_usb_audio_vendor_ops *vendor_ops)
> > +{
> > +	usb_audio_ops = vendor_ops;
> > +}
> > +EXPORT_SYMBOL_GPL(snd_set_vender_interface);
> 
> You are exporting a lot of new symbols, but you have no user of these
> symbols, which is not allowed, as you know.  Please also post your user
> of them so we can see if you are doing things correctly or not.
> 
> Also, only one set of "vendor ops" does not make any sense at all, this
> needs to be on a per-host-controller basis, right?  If so, why is this
> all in the sound driver?

Also, your api is making a lot of assumptions about the running system,
there seems to not be any way to always "know" what bus/device the
callbacks are being used for in many places.

Why not just add the needed functionality to the sound driver itself
instead of trying to rely on these odd "callbacks"?

thanks,

greg k-h
