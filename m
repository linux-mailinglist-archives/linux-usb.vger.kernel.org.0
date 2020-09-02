Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631BF25AD4B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 16:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgIBOgz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 10:36:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:57868 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727998AbgIBOgY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 10:36:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CAF8BB1AE;
        Wed,  2 Sep 2020 14:36:23 +0000 (UTC)
Date:   Wed, 02 Sep 2020 16:36:22 +0200
Message-ID: <s5hft809rfd.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        stern@rowland.harvard.ed, linux-kernel@vger.kernel.org,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 06/10] sound: usx2y: move to use usb_control_msg_send()
In-Reply-To: <20200902110115.1994491-7-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
        <20200902110115.1994491-7-gregkh@linuxfoundation.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 02 Sep 2020 13:01:08 +0200,
Greg Kroah-Hartman wrote:
> 
> The usb_control_msg_send() call can handle data on the stack, as well as
> returning an error if a "short" write happens, so move the driver over
> to using that call instead.  This ends up removing a helper function
> that is no longer needed.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
>  sound/usb/usx2y/us122l.c | 42 ++++++++--------------------------------
>  1 file changed, 8 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
> index f86f7a61fb36..e5c5a0d03d8a 100644
> --- a/sound/usb/usx2y/us122l.c
> +++ b/sound/usb/usx2y/us122l.c
> @@ -82,40 +82,13 @@ static int us144_create_usbmidi(struct snd_card *card)
>  				  &US122L(card)->midi_list, &quirk);
>  }
>  
> -/*
> - * Wrapper for usb_control_msg().
> - * Allocates a temp buffer to prevent dmaing from/to the stack.
> - */
> -static int us122l_ctl_msg(struct usb_device *dev, unsigned int pipe,
> -			  __u8 request, __u8 requesttype,
> -			  __u16 value, __u16 index, void *data,
> -			  __u16 size, int timeout)
> -{
> -	int err;
> -	void *buf = NULL;
> -
> -	if (size > 0) {
> -		buf = kmemdup(data, size, GFP_KERNEL);
> -		if (!buf)
> -			return -ENOMEM;
> -	}
> -	err = usb_control_msg(dev, pipe, request, requesttype,
> -			      value, index, buf, size, timeout);
> -	if (size > 0) {
> -		memcpy(data, buf, size);
> -		kfree(buf);
> -	}
> -	return err;
> -}
> -
>  static void pt_info_set(struct usb_device *dev, u8 v)
>  {
>  	int ret;
>  
> -	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> -			      'I',
> -			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> -			      v, 0, NULL, 0, 1000);
> +	ret = usb_control_msg_send(dev, 0, 'I',
> +				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> +				   v, 0, NULL, 0, 1000);
>  	snd_printdd(KERN_DEBUG "%i\n", ret);
>  }
>  
> @@ -305,10 +278,11 @@ static int us122l_set_sample_rate(struct usb_device *dev, int rate)
>  	data[0] = rate;
>  	data[1] = rate >> 8;
>  	data[2] = rate >> 16;
> -	err = us122l_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC_SET_CUR,
> -			     USB_TYPE_CLASS|USB_RECIP_ENDPOINT|USB_DIR_OUT,
> -			     UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep, data, 3, 1000);
> -	if (err < 0)
> +	err = usb_control_msg_send(dev, 0, UAC_SET_CUR,
> +				   USB_TYPE_CLASS|USB_RECIP_ENDPOINT|USB_DIR_OUT,
> +				   UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep, data, 3,
> +				   1000);
> +	if (err)
>  		snd_printk(KERN_ERR "%d: cannot set freq %d to ep 0x%x\n",
>  			   dev->devnum, rate, ep);
>  	return err;
> -- 
> 2.28.0
> 
