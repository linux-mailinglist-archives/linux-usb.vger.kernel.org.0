Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6383647D314
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 14:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245410AbhLVNic (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 08:38:32 -0500
Received: from cable.insite.cz ([84.242.75.189]:38515 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234173AbhLVNic (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 08:38:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E40E4A1A3D401;
        Wed, 22 Dec 2021 14:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640180310; bh=MNAkhqAEm4ehq1/xfVFpKEir/5nJA0LtzE7B0AI+wok=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XxynUYugQSNvl1HMXjveVrw/uPxA3NTOwqYNOjGdesbmTTLwIihIzIkbT4SXu15bE
         GicAEvSjS88yHYOBJ5Dfza6G5S3Yo7Y+uYcZDbHAiCmEFs0u++qQcg5ZSn+BQ2pnM1
         D+7TH/fZzg8AgpwXO7y4miEKFvKEtx5oWiYd2O/0=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8BBKgjQyLyv6; Wed, 22 Dec 2021 14:38:25 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 2D114A1A3D400;
        Wed, 22 Dec 2021 14:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640180305; bh=MNAkhqAEm4ehq1/xfVFpKEir/5nJA0LtzE7B0AI+wok=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iDJz0a3zO4+4/cxmW4HO5BzRKmXOV6BevT6P8/ex1Dtfwf0wglBZ6Sldnd4ukpGOz
         7RZHXnZJhpOm7bA++PkOt7juqWx/vgVNLKXWhfL4A4Agss53hlC4QwADyb3AsSiyE4
         MtybXdbIDdbIceG22GH9dC+/JY9zu2ogrWk5aGDc=
Subject: Re: [PATCH v2 00/11] usb: gadget: audio: Multiple rates, dyn.
 bInterval
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <YcGJTHA+1zBMvACy@kroah.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <2517d391-2e3e-f102-96b5-c2cbc47aa188@ivitera.com>
Date:   Wed, 22 Dec 2021 14:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcGJTHA+1zBMvACy@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 21. 12. 21 v 8:59 Greg Kroah-Hartman napsal(a):
> On Mon, Dec 20, 2021 at 10:11:19PM +0100, Pavel Hofman wrote:
>> Hi all,
>>
>> This series implements:
>> * Support for multiple rates in the audio gadget
>> * Notification of gadget-side alsa processes about playback/capture
>> start/stop on the host side via Playback/Capture Rate controls.
>> * Detection of the USB cable disconnection by handling SUSPEND call
>> in f_uac1/2. The disconnection generates a stop notification.
>> * Dynamic bInterval calculation for HS and SS
>>
>> Patches for the multirate support, originally authored by Julian Scheel,
>> were rebased and modified for the current code base. Julian has
>> acknowledged the presented patches.
>>
>> The detection of cable disconnection was discussed with dwc2 maintainer
>> Minas Harutyunyan who confirmed that the suspend event can be used
>> (https://lore.kernel.org/all/5aada8e3-f385-0589-8d58-187abd1a924d@synopsys.com/T/).
>> Tests on dwc2 have confirmed reliable detection, the gadget correctly
>> reports playback/capture stop at cable disconnection.
>>
>> The start/stop/current rate notification feature is accompanied by
>> example implementation of audio gadget controller
>> https://github.com/pavhofman/gaudio_ctl. The controller also handles
>> debouncing fast start/stop events when USB host audio driver is loaded
>> and/or audio daemon re/started.
>>
>> Changes:
>> --------
>>
>> v2: Fixed compilation of "usb: gadget: f_uac1: Support multiple sampling
>> rates" - added changes for CONFIG_GADGET_UAC1
> 
> I get the following build warning and error with this series applied to
> my tree:
> 
> drivers/usb/gadget/legacy/audio.c: In function ‘audio_bind’:
> drivers/usb/gadget/legacy/audio.c:251:21: error: unused variable ‘i’ [-Werror=unused-variable]
>    251 |         int status, i;
>        |                     ^
> cc1: all warnings being treated as errors
> 
> Please fix up.

I am sorry for the inconvenience. I  will send fixed v3 tomorrow.

Thanks for your patience.

Pavel.
