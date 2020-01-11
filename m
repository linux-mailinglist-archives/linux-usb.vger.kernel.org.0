Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC282137C91
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 10:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgAKJM5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 04:12:57 -0500
Received: from cable.insite.cz ([84.242.75.189]:39798 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728031AbgAKJM4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jan 2020 04:12:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 470E8A1A40B08;
        Sat, 11 Jan 2020 10:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578733973; bh=0sCpRAhxCCk3Q9TYlOwJGNyhQjhg4XxghqabM64acpo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KIlDlzkvA4+MHvcKkSEK0vptN8bYondsRRhNwEkYJRI8ZYZX0UKuEhUcXKZo4a61A
         iUDsQibs7jSXQBEjy4ULQEGR8LpoC/SDeSlVir/ZesE9Gzy/9v5h2URs9HC/Ird3cN
         BRUl+Rv33d8h4WrmV5FiZe79n4y7cSDT6PW2X810=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UFM3JOqmXaUM; Sat, 11 Jan 2020 10:12:48 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 847A6A1A40B07;
        Sat, 11 Jan 2020 10:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1578733967; bh=0sCpRAhxCCk3Q9TYlOwJGNyhQjhg4XxghqabM64acpo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WpvE+Wzl479dG1nY5Kcljd/O9Dpd5sqSwKwUX7dqjsgftgF1M9MtOGoMfm6E/VIwQ
         HCG1w4OAN3OnC2nESVsKz6YxZNTg4ZdbH8Cyqv9nLP35kJeeNi1WMMio2o7QEavcDP
         kgzP9Vxg945Wd5rxMWEz1y36EjG+9sp9bPu6AxR4=
Subject: Re: [PATCH] usb: gadget: f_uac2: fix packet size calculation
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <20200110112814.1abf2075.john@metanate.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <d8b755db-f38b-a454-15a2-35e1481063ec@ivitera.com>
Date:   Sat, 11 Jan 2020 10:12:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200110112814.1abf2075.john@metanate.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Dne 10. 01. 20 v 12:28 John Keeping napsal(a):
> On Fri, 10 Jan 2020 08:29:06 +0100
> Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Together with dwc2 maintainer Minas Harutyunyan we have been
>> troubleshooting various issues of dwc2 on RPi4. We hit a problem where
>> the g_audio in capture (EP OUT, playback from USB host) requests req->
>> length larger than maxpacket*mc.
>>
>> As a workaround we removed the check in dwc2/gadget.c, however that is
>> not a proper solution. Minas with his team decided to add a patch where
>> dwc2 will rejecting this type of wrong requests in dwc2_hsotg_ep_queue()
>> function, to not process these request at all. The f_uac2 + g_audio
>> gadget should restrain from sending such requests.
>>
>> Steps to reproduce:
>>
>> * Changing fs_epout_desc.bInterval in f_uac2.c from 4 (1ms) to 1 (125us)
>> - the goal is to maximize available throughput of the audio gadget
>>
>> * Loading the g_audio module with c_srate=48000, c_ssize=2, c_chmask=2 -
>> i.e. standard 48kHz/16bit/2ch USB playback -> alsa capture
>>
>> This combination produces mps=24 and mc=1 for EP OUT. Yet the audio
>> function driver sometimes queues request with req->length 192.
> 
> This sounded familiar to me, and I realised that I've been running with
> a patch for this case that I never submitted upstream.
> 
> Does the patch below fix the issue you're seeing?
> @@ -407,7 +407,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)

Thanks for your hint. Your patch handles u_audio playback which is the 
other direction than I am trying to fix (usb host playback -> u_audio 
capture).

With regards,

Pavel.
