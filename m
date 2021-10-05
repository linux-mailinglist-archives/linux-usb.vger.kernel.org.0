Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440764222F9
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 12:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhJEKCH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 06:02:07 -0400
Received: from cable.insite.cz ([84.242.75.189]:44084 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233825AbhJEKCH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 06:02:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 11E9AA1A3D403;
        Tue,  5 Oct 2021 12:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633428016; bh=m1uIXlC1wn7nqIKyiMCpKow2xGCSm6xVMCjxwaanlRA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MaOmIC04/BinEAefzudwQkiXIcLIeuZlbpLc1r14ops851n7boSH6CDTRQefX8gBm
         y8W4Qa1zmY3f4ZgYkhR+XbUY4ZuATrnl4lMOqNc1s9g1hxIpAvSoXY9CCVib4HPvk5
         P7CeLh0Nwrc06aU2VXejAYGS+Gg8ix7GomDlVncc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LASenveoNqvW; Tue,  5 Oct 2021 12:00:10 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 5D260A1A3D402;
        Tue,  5 Oct 2021 12:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633428010; bh=m1uIXlC1wn7nqIKyiMCpKow2xGCSm6xVMCjxwaanlRA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EaNX2466hgMD8xSPmBrr7boWDjVxQ9cf273LDuByyn2RxGWqqDJgVI40/bmnhx0jv
         bcHySoK2JQzT8uVV1E+PDuCxsb23NuQCEPwEln/b6ADn3NJcwxLGSeN5E/fJPDMFnX
         xGbjVRgzVQaWoh7XKVfj8/arj+9RT7OP71aZAprg=
Subject: Re: [RFC PATCH 1/2] usb: gadget: uac2: fix maximum bandwidth
 calculation
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
 <20211005093729.628833-1-jbrunet@baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <8d291ef9-31a9-1b54-cc33-8c8550b59a88@ivitera.com>
Date:   Tue, 5 Oct 2021 12:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211005093729.628833-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 05. 10. 21 v 11:37 Jerome Brunet napsal(a):
> This fixes the wMaxPacketSize of the audio gadget so it is in line with
> USB Audio Format specification - section 2.3.1.2.1
> 
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: Pavel Hofman <pavel.hofman@ivitera.com>
> Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   There was a mistake in my previous mail, rounding depends on the
>   synchronisation, not the stream direction.
> 
>   drivers/usb/gadget/function/f_uac2.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index ae29ff2b2b68..c152efa30def 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -554,7 +554,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>   	struct usb_endpoint_descriptor *ep_desc,
>   	enum usb_device_speed speed, bool is_playback)
>   {
> -	int chmask, srate, ssize;
> +	int chmask, srate, ssize, spf;
>   	u16 max_size_bw, max_size_ep;
>   	unsigned int factor;
>   
> @@ -584,11 +584,12 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>   		ssize = uac2_opts->c_ssize;
>   	}
>   
> -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> -		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> +	if (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
> +		spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> +	else
> +		spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;

Please correct me if I am wrong, but does the change mean that 
uac2_opts->c_sync value has also impact on playback (EP-IN) wMaxPacketSize?

Thanks,

Pavel.
>   
> -	max_size_bw = num_channels(chmask) * ssize *
> -		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> +	max_size_bw = num_channels(chmask) * ssize * spf;
>   	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>   						    max_size_ep));
>   
> 
