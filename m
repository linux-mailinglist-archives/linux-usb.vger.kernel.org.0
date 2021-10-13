Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C666042B9FB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 10:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238741AbhJMIPN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 04:15:13 -0400
Received: from cable.insite.cz ([84.242.75.189]:35040 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229830AbhJMIPL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 04:15:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 0143FA1A3D404;
        Wed, 13 Oct 2021 10:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1634112788; bh=abqddRGeqRZ0fInUqvDG5/HT4BMp5Fna5Zf+Qpc74E4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dSPhyVoUTLkGm4xdg06Ee7gv1WaAgc6Ty4/n+SJcuHgVQ481psD8rmu4B60oO6dPp
         uhzRQG4BZR2X73cwALk/tFZxlklUnyVybAfKQCUaFd+XL/HUTybILkNbBcB90TbS3J
         1gflNP7EbOQf1TOHtxzGtbQ7qhIYwxb3TOOtupng=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wPx9nTl4qSuc; Wed, 13 Oct 2021 10:13:02 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 74654A1A3D403;
        Wed, 13 Oct 2021 10:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1634112782; bh=abqddRGeqRZ0fInUqvDG5/HT4BMp5Fna5Zf+Qpc74E4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nM7yecAsSGUHFYUk97YZ870FkKm0O1jvXvrMcP3sKSIzkyTILIt9Z9329NBTE6Dt6
         hckyCGxB83LuwdSsigAk3Cu0XoGtTXONbvzMYzMRNqz6FSKy6k5WsYvQQEEzURBAG8
         9+XaiIoFc4K5KhhOZpDr8t3ExPdOHEJN15MdOvZk=
Subject: Re: [PATCH v3] usb: gadget: u_audio.c: Adding Playback Pitch ctl for
 sync playback
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>
References: <20211006081258.8501-1-pavel.hofman@ivitera.com>
 <YWU3Ngtbbk7Y+dG1@kroah.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <714fe0a9-cf2d-d2c4-d85e-b07e4cf6294a@ivitera.com>
Date:   Wed, 13 Oct 2021 10:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWU3Ngtbbk7Y+dG1@kroah.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 12. 10. 21 v 9:20 Greg Kroah-Hartman napsal(a):
> On Wed, Oct 06, 2021 at 10:12:58AM +0200, Pavel Hofman wrote:
>> EP IN is hard-coded as ASYNC both in f_uac1 and f_uac2 but u_audio sends
>> steady number of audio frames in each USB packet, without any control.
>>
>> This patch adds 'Playback Pitch 1000000' ctl analogous to the existing
>> 'Capture Pitch 1000000' ctl. The calculation of playback req->length in
>> u_audio_iso_complete respects the Playback Pitch ctl value to 1ppm now.
>>
>> Max. value for Playback Pitch is configured by the existing parameter
>> uac2_opts->fb_max, used also for the Capture Pitch.
>>
>> Since the EP IN packet size can be increased by uac2_opts->fb_max now,
>> maxPacketSize for the playback direction is calculated by the same
>> algorithm as for the async capture direction in
>> f_uac2.c:set_ep_max_packet_size.
>>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>
>> Notes:
>>      v2 -> v3: only notes added
>>      
>>      For: usb-next
>>      Depends on patch 0560c9c ("usb: gadget: f_uac2: fixed EP-IN
>>      wMaxPacketSize") currently only in branch usb-linus.
> 
> I have dropped this from my usb-testing branch now due to all of the
> issues found by the 0-day bot with it (build failure and warnings.)
> 
> Please fix up and resubmit.
> 

I apologize for the issues, a fixed patch was submitted a while ago 
https://patchwork.kernel.org/project/linux-usb/patch/20211013073934.36476-1-pavel.hofman@ivitera.com/

Thanks a lot,

Pavel.
