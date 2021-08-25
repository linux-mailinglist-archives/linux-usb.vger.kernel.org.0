Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809D33F7BE3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 19:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235251AbhHYSAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 14:00:20 -0400
Received: from cable.insite.cz ([84.242.75.189]:57476 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230112AbhHYSAT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 14:00:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 535FFA1A3D402;
        Wed, 25 Aug 2021 19:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629914372; bh=rGekSBK7yYQxzecHRgjmhJ56mq7nCvKb0BNG8yl8Jm4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MqSji/7kSYJGv7ijv09+YSGyHvWhl4zkC102Hr5cs46X4j9ifUuVQ/MRnxQL2kdq3
         D4dao2RDjM+9ZfrulCxStYFjANquKSjgKJBYjmo1JYZAM8sK+Stu6EQ7qXQHr1YJ/9
         3bbPCTKXssMQ8lQVFllDIkfFw6Gyb+/UTN1W/UPk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RNUWcbbxMJBk; Wed, 25 Aug 2021 19:59:26 +0200 (CEST)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 85BEAA1A3D400;
        Wed, 25 Aug 2021 19:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629914366; bh=rGekSBK7yYQxzecHRgjmhJ56mq7nCvKb0BNG8yl8Jm4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LLUa7EHRV+gVsbg07ekSh2ewVTm/d4vZKBcw/nzLslir/dh+YccoAcnP22xPDMyHA
         LKKJ1tYWrXoi605eLosDU90FPnBuXfb2YD+gz6JrA9Z8bbnlZCmkuYGumRpbufGlT8
         /vIctjlfAWQ+CQTLdWnAu//1NHNfUra5n0UMQTZw=
Subject: Re: [PATCH v3 2/4] usb: gadget: u_audio: add bi-directional volume
 and mute support
To:     Jerome Brunet <jbrunet@baylibre.com>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
References: <20210712125529.76070-1-pavel.hofman@ivitera.com>
 <20210712125529.76070-3-pavel.hofman@ivitera.com>
 <1jr1ehy79v.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <d03d8d29-f3f2-028f-efb1-a194955599d7@ivitera.com>
Date:   Wed, 25 Aug 2021 19:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1jr1ehy79v.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 25. 08. 21 v 15:25 Jerome Brunet napsal(a):
> 
> On Mon 12 Jul 2021 at 14:55, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>
>> USB Audio Class 1/2 have ability to change device's
>> volume and mute by USB Host through class-specific control
>> requests. Device also can notify Host about volume/mute
>> change on its side through optional interrupt endpoint.
>>
>> This patch adds Volume and Mute ALSA controls which can be
>> used by user to send and receive notifications to/from
>> the USB Host about Volume and Mute change.
>>
>> These params come from f_uac* so volume and mute controls
>> will be created only if the function support and enable
>> each explicitly
>>
>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> 
> Hi Greg,
> 
> This change made it to usb-testing and usb-next but there are several
> indentation errors in it. By itself, without the rest of the series, it
> does not make much sense. It adds a couple of alsa controls but those
> actually do nothing without the uac1 and uac2 part of the series.
> 
> Maybe it would be better to drop this change until the rest of series is
> ready (if this is still possible) ?
> 

The indentation errors were fixed by commit 
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=1bc220835526ae076eecfb7ed513f80f22cf840d 
which is in usb-next now too. If possible this commit should be dropped too.

Thanks,

Pavel.
