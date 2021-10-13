Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC9942B924
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 09:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhJMHdy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 03:33:54 -0400
Received: from cable.insite.cz ([84.242.75.189]:52630 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhJMHdy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 03:33:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E21A2A1A3D404;
        Wed, 13 Oct 2021 09:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1634110309; bh=IX7gQisW5nRSScW1Wp0Z5pwdqBOc0GAS+cKm2HDpcPY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X1HFBf83GFYthG+3sPZyDNcEqSPHLkrMYxfcFpYstV9Vx+wNbw2U2RCrsTlRWudFH
         1GfCjzDC/5y19gtVnlVwVR5LfTxWJUX0RmXUp8gawxIVbL0kg2zdC8L/U+kCULUozy
         HpVzLio7tNsTiGArFwy57WsD1Y4cSVcrIZT8mgmQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KhDZs16cshsD; Wed, 13 Oct 2021 09:31:44 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 38BECA1A3D403;
        Wed, 13 Oct 2021 09:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1634110304; bh=IX7gQisW5nRSScW1Wp0Z5pwdqBOc0GAS+cKm2HDpcPY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l4x1uM/kUspcUez+nwIcNcJjlrrvbI7Z+bssWOuHf5eC/NGe1TCLN+5srZCkbfPBG
         MhhjOrH8eNJWbzqhn8Sv97JEfVHQgzrIEOW2bjbWFWhcYoz8h+AXeRF6fXwb4q7KCq
         0UBDAkqzQIlIp6fZpN6FOWBaf/8SrQPR/PJTy0pY=
Subject: Re: [PATCH 2/2] usb: gadget: u_audio: remove unnecessary array
 declaration of snd_kcontrol_new
To:     Yunhao Tian <t123yh.xyz@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org
References: <20211012165314.338619-1-t123yh@outlook.com>
 <20211012165314.338619-2-t123yh@outlook.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <fdf83233-be33-15de-051c-b3652ad63c12@ivitera.com>
Date:   Wed, 13 Oct 2021 09:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211012165314.338619-2-t123yh@outlook.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 12. 10. 21 v 18:53 Yunhao Tian napsal(a):
> From: Yunhao Tian <t123yh.xyz@gmail.com>
> 
> Currently, an array is used to contain all snd_kcontrol_new objects
> of the audio gadget. This is unnecessary and possibly prone to an
> (unlikely happen) race condition between the assignment of name
> and call of snd_ctl_new1 if two audio gadget is being set up simutaneously.
> This patch removes the global snd_kcontrol_new array and initialize
> individual snd_kcontrol_new object when it's being used.
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
> ---
>   drivers/usb/gadget/function/u_audio.c | 65 +++++++++++----------------
>   1 file changed, 25 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index c5f39998c653..1f4226d75dd8 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -27,12 +27,6 @@
>   #define PRD_SIZE_MAX	PAGE_SIZE
>   #define MIN_PERIODS	4
>   
> -enum {
> -	UAC_FBACK_CTRL,
> -	UAC_MUTE_CTRL,
> -	UAC_VOLUME_CTRL,
> -};
> -
>   /* Runtime data params for one stream */
>   struct uac_rtd_params {
>   	struct snd_uac_chip *uac;	/* parent chip */
> @@ -914,31 +908,6 @@ static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
>   	return change;
>   }
>   
> -
> -static struct snd_kcontrol_new u_audio_controls[]  = {
> -	[UAC_FBACK_CTRL] {
> -		.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
> -		.name =         "Capture Pitch 1000000",
> -		.info =         u_audio_pitch_info,
> -		.get =          u_audio_pitch_get,
> -		.put =          u_audio_pitch_put,
> -	},
> -	[UAC_MUTE_CTRL] {
> -		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
> -		.name =		"", /* will be filled later */
> -		.info =		u_audio_mute_info,
> -		.get =		u_audio_mute_get,
> -		.put =		u_audio_mute_put,
> -	},
> -	[UAC_VOLUME_CTRL] {
> -		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
> -		.name =		"", /* will be filled later */
> -		.info =		u_audio_volume_info,
> -		.get =		u_audio_volume_get,
> -		.put =		u_audio_volume_put,
> -	},
> -};

Hi,

Please is this patch necessary? My patch (a fixed version of which I 
will submit today) defines another control and several other important 
controls are on their way in a few patches. My current devel version has:

enum {
	UAC_FBACK_CTRL,
	UAC_P_PITCH_CTRL,
	UAC_MUTE_CTRL,
	UAC_VOLUME_CTRL,
	UAC_CAPTURE_RATE_CTRL,
	UAC_PLAYBACK_RATE_CTRL,
	UAC_CAPTURE_REQ_CTRL,
	UAC_PLAYBACK_REQ_CTRL,
};

I actually like the current method, IMO it keeps it quite organized.

Anyway if you want to remove it, please can you wait for all the 
important patches to land first?

Thanks a lot for considering.

Pavel.
