Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798CB64E9E0
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 12:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiLPLAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 06:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiLPLAp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 06:00:45 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD75C273C
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 03:00:40 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2B6035C00C2;
        Fri, 16 Dec 2022 06:00:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 16 Dec 2022 06:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1671188440; x=1671274840; bh=Rr/K17OJ6N
        DDRDmBPZ/uGDhzkHTbk3RYTCkR3omQHKw=; b=fCCrSUX1CGKyCB0wKuDZvxMMu3
        0BXExSucegK3BscllxZY0lSNDjpOdGrWvVSqrWe2On0v+Ngi93yrMuSnlSoX0TVZ
        Ret60Zc/xfVgL2FSN7hCxktccXeGvnZhSFpVc+fldPCinkZjfur1DYD053XX/mls
        15hFe8vUpKxYZDgmLLRSViDgAV5u/qAMHL35jEwp26/fxDiCAACexs3YZchi8wtV
        ufL3bzgCKQfxjwgVQjNZXA07WIyAhkSFoa3nLMXrBTPQrkKEKTwWxvmqyrRzgTps
        Pgksp6PP/cx/mseZ1DxIAoknD1BTeydWvyjbi7ugfTBfv6W0QX2+XF4aaZXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1671188440; x=1671274840; bh=Rr/K17OJ6NDDRDmBPZ/uGDhzkHTb
        k3RYTCkR3omQHKw=; b=Uq6p1xQ5OKty0U2ZCPNB/wuzcSkPpNLmQEfbAjYCeWHP
        WHE5yep754codJFy5zzfUnWAnvTXGfPzYIoNl1R6WVzUNBHhh2ZBDI8zmEjL3Eci
        ZTmElvrvBPoWBFoY4dDDJGLobn9Yo1FUiez31k92NNQl3pay9RKx8QJo5guq4XIR
        2zfJnUlXkxlZgv+h59rLdEfSdcvuNe+a4weLEA5zxQsHEaTHbDsqg5aaJU6p8Qkg
        V662MHD6AYV1NZguc9TnFbjDcx6SrhbXk2PUGBg/HKO26aOpu4gjwHOwC02MdaVh
        hglIpu7KpTMIvkX5U9ke2Fgpydv3v/RVzASOSduvYA==
X-ME-Sender: <xms:10-cYwhzf8M9X44JC6-ioY8IgJX6vEfmxvHmCcCz1zJhlqkzlB1V4w>
    <xme:10-cY5BG8wH7jjoeUwlivNNURg5hQKvtvEWS8Wl5bVWDIYadVNM2R-8Yy2h3jTLtB
    i2Ub2vSh2xYnQ>
X-ME-Received: <xmr:10-cY4HDGkr8uPm3a5yKOW9Y4yI1YQu1b5CN_BM5SwbQkJok31r9KiZ2Jr2vbDKMzTkl9i0fFgN5VJUBsWw9fYGzQwx5QdzR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:2E-cYxSQ2vby-EVF6NA6r4xEnZQiIXoTFpNXMdSaj-6sdQBd_UpejA>
    <xmx:2E-cY9wUNd9AhUyRuCjiJk3YFN98e4tVKDsae--XiC-g7CX8aBzNKA>
    <xmx:2E-cY_4lDj6CeuM3Uvae4qJKFh4q63myHMU8dWkU7gpz5m3lRZcDmw>
    <xmx:2E-cY49hYyKLmAGT1WqFsXpqpepRrPDTuewCIQwTutNr2oUdZ2Fh9g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Dec 2022 06:00:39 -0500 (EST)
Date:   Fri, 16 Dec 2022 12:00:36 +0100
From:   Greg KH <greg@kroah.com>
To:     Artem Egorkine <arteme@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] sound: line6: correct midi status byte when
 receiving data from podxt
Message-ID: <Y5xP1OqOQUoXUrQC@kroah.com>
References: <20221216100239.577805-1-arteme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216100239.577805-1-arteme@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 16, 2022 at 12:02:38PM +0200, Artem Egorkine wrote:
> A PODxt device sends 0xb2, 0xc2 or 0xf2 as a status byte for MIDI
> messages over USB that should otherwise have a 0xb0, 0xc0 or 0xf0
> status byte. This is usually corrected by the driver on other OSes.
> 
> This fixes MIDI sysex messages sent by PODxt.
> 
> Signed-off-by: Artem Egorkine <arteme@gmail.com>
> ---
>  sound/usb/line6/driver.c  |  2 +-
>  sound/usb/line6/midi.c    |  2 +-
>  sound/usb/line6/midibuf.c | 42 +++++++++++++++++++++++++++++++--------
>  sound/usb/line6/midibuf.h |  2 +-
>  sound/usb/line6/pod.c     |  3 ++-
>  5 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
> index 59faa5a9a714..4dbe7bce3ee8 100644
> --- a/sound/usb/line6/driver.c
> +++ b/sound/usb/line6/driver.c
> @@ -304,7 +304,7 @@ static void line6_data_received(struct urb *urb)
>  		for (;;) {
>  			done =
>  				line6_midibuf_read(mb, line6->buffer_message,
> -						LINE6_MIDI_MESSAGE_MAXLEN);
> +						LINE6_MIDI_MESSAGE_MAXLEN, 1);
>  
>  			if (done <= 0)
>  				break;
> diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
> index ba0e2b7e8fe1..335f8d531548 100644
> --- a/sound/usb/line6/midi.c
> +++ b/sound/usb/line6/midi.c
> @@ -56,7 +56,7 @@ static void line6_midi_transmit(struct snd_rawmidi_substream *substream)
>  
>  	for (;;) {
>  		done = line6_midibuf_read(mb, chunk,
> -					  LINE6_FALLBACK_MAXPACKETSIZE);
> +					  LINE6_FALLBACK_MAXPACKETSIZE, 0);

This random number at the end of the function is not good, please make
it more obvious what has to happen here otherwise every time you see
this call you have to go look up what it means.

>  
>  		if (done == 0)
>  			break;
> diff --git a/sound/usb/line6/midibuf.c b/sound/usb/line6/midibuf.c
> index 6a70463f82c4..ba7a2243cf68 100644
> --- a/sound/usb/line6/midibuf.c
> +++ b/sound/usb/line6/midibuf.c
> @@ -9,6 +9,22 @@
>  
>  #include "midibuf.h"
>  
> +/* #define DUMP_BUFFERS */
> +
> +#ifdef DUMP_BUFFERS
> +static void dump_buffer(char rx, const u8 *data, int length)
> +{
> +	const char* type = rx ? "rx" : "tx";
> +        printk(KERN_DEBUG "%s packet: [", type);
> +        for (; length > 0; ++data, --length)
> +                printk(KERN_CONT " %02x", *data);
> +        printk(KERN_CONT " ]\n");
> +}

Coding style issues :(

Also, there is a "print a buffer to the debug log" command already, why
not use that?  And you need to use dev_dbg() to show the device that
this came from, right?

thanks,

greg k-h
