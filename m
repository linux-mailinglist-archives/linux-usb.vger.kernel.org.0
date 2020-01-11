Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41113137CA3
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 10:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgAKJbm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 04:31:42 -0500
Received: from cable.insite.cz ([84.242.75.189]:55992 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728683AbgAKJbm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jan 2020 04:31:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8FC4FA1A40B08;
        Sat, 11 Jan 2020 10:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578735099; bh=gtJSw3sKmAmrfh+jaC3r94M6WecsLOiF4hkFfL9RQcQ=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=V3rGskCKgDiGub+AEap5RkTBFkCa2h+h7zxL91ey/sDYjRR8kKD0Moe3rITYeNUZM
         tbtKKf5kvUnDndp2vHqMFrSF9hRWOZjqbGoiDcthAkNDsvNIEl3Ji/I0f3sNxIhcQD
         iE7vmqaIWAqp0NN4lREtPJctzwcnkf2PIJeaO6Ng=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UWnwgsPyKLXP; Sat, 11 Jan 2020 10:31:33 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 5332EA1A40B07;
        Sat, 11 Jan 2020 10:31:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578735093; bh=gtJSw3sKmAmrfh+jaC3r94M6WecsLOiF4hkFfL9RQcQ=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=RFyNOEsOe+DRdJnlbHfymuEk8Av4TNlcpHu9eSkLRpZZ8e2LkPsQonyKaLJni3ABU
         /WQwiwCIaGpK3z8eWgBiGvMSLl88EdK0+4lLpBx7ISMCsM0Rug1fApCVVSDztEoci2
         gtueih3MlgDAhiql1lAsdUq0EZLgVdbabqaLlN88=
Subject: Re: USB:UAC2: Incorrect req->length > maxpacket*mc - cause likely
 found
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
Message-ID: <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
Date:   Sat, 11 Jan 2020 10:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Dne 10. 01. 20 v 8:29 Pavel Hofman napsal(a):
> Hi,
> 
> Together with dwc2 maintainer Minas Harutyunyan we have been
> troubleshooting various issues of dwc2 on RPi4. We hit a problem where
> the g_audio in capture (EP OUT, playback from USB host) requests req->
> length larger than maxpacket*mc.
> 
> As a workaround we removed the check in dwc2/gadget.c, however that is
> not a proper solution. Minas with his team decided to add a patch where 
> dwc2 will rejecting this type of wrong requests in dwc2_hsotg_ep_queue()
> function, to not process these request at all. The f_uac2 + g_audio
> gadget should restrain from sending such requests.
> 
> Steps to reproduce:
> 
> * Changing fs_epout_desc.bInterval in f_uac2.c from 4 (1ms) to 1 (125us) 
> - the goal is to maximize available throughput of the audio gadget
> 
> * Loading the g_audio module with c_srate=48000, c_ssize=2, c_chmask=2 - 
> i.e. standard 48kHz/16bit/2ch USB playback -> alsa capture
> 
> This combination produces mps=24 and mc=1 for EP OUT. Yet the audio 
> function driver sometimes queues request with req->length 192.
> 

IMO the problem is here 
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L675 
:

First wMaxPacketSize is correctly calculated for HS and FS. In my setup 
it yields (confirmed by an added debug in set_ep_max_packet_size):

FS: ep_desc->wMaxPacketSize 192
HS: ep_desc->wMaxPacketSize 24

However, a few lines later the agdev->out_ep_maxpsize is set as maximum 
from these two values 
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L700 
:

agdev->out_ep_maxpsize = max_t(u16, 
le16_to_cpu(fs_epout_desc.wMaxPacketSize),			 
le16_to_cpu(hs_epout_desc.wMaxPacketSize));


In g_audio_setup this value is used for max_psize 
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/u_audio.c#L519 
:

prm->max_psize = g_audio->out_ep_maxpsize;

And max_psize is used as req->length in u_audio_start_capture 
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/u_audio.c#L379 
:

req_len = prm->max_psize;
...
req->length = req_len;


192bytes (the value for FS) will be assigned here, instead of the 
correct 24 bytes for HS. The reason it has worked so far is the original 
bInterval=4 for HS which yields the same 192bytes as the original for 
FS. But lowering the fs_epout_desc.bInterval reduces the packets, yet 
the maximum of the two values is being used.

IMO the very same problem will be on u_audio playback side, the 
preceeding line:

agdev->in_ep_maxpsize = max_t(u16,			 
le16_to_cpu(fs_epin_desc.wMaxPacketSize),			 
le16_to_cpu(hs_epin_desc.wMaxPacketSize));

Unfortunately I do not know the reason for selection of the maximum 
value from FS and HS, I cannot create a patch. Very likely there is more 
hidden know-how which I do not know.

Thanks a lot for looking at the issue.

With regards,

Pavel.





