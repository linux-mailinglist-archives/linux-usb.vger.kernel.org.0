Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054247273DA
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 02:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjFHAtA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 20:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjFHAs7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 20:48:59 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D8826A0
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 17:48:58 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-39bcba263efso837413b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jun 2023 17:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686185338; x=1688777338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/ZADyhKJecAjZ1dtvONv4FHrXo3J80oI28Qjz5CE9o=;
        b=ofCqo8f5EuD+bulo+DrTDACH4TXWdDd/VOwkMmvnscgDGAjVJr806qPa721MGqbTgM
         W/Q42qCNHyF+rtzPlepqdkXRKZwL31vSUUeKzPuYCJ8Kp3g4uTnEmkyp0vxJ7U4YIKZN
         /lrBpcu7Wn6KNPatEU2Vm9J5A+IGQbKzpvzUL5LAOWDKSp0Q8kKR0cEdMuSInoeoPVNL
         +R5jmesqDh3l8ZwnC15vT4c7z2DZPB12ohHXiN5IGu/a4G4FEituULfXGGqjNR65h3Vh
         u4CfKiUCcRJ4GX7UHKeRBNSPIn8+T9X2IslfvcxdNUJSDx4ao7QPGoEIMj6LzZpV66ce
         eOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686185338; x=1688777338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/ZADyhKJecAjZ1dtvONv4FHrXo3J80oI28Qjz5CE9o=;
        b=T+zto83OkpW3L02tS1fSrj4X/KJ+dGtw+wXvwfYeVbDAMlrCtH41/rstovq3kDE2O7
         LaCx/PB9OFHeyILjHKaTNJVP5mH1/9MQ7lG4gCll8VQ6/QC0mfXc+PWEgP4jPwp61Iw8
         +QoFYmUocYzHDC8/7b9ue/OInmEuRDwQ0zMauAs/NTC/3x1JPc5VomXRCBMc9/eF/3f8
         tJM01ngZKW/60RM/mN0COoxwCJjEmFf5RpseBrU8b1hkPiNRFLDFgubClCntq8iq/28z
         ea73W+Z082lTrOF3FmO/JpeywWTYIz17ItRWvhuEOSfPyS+r9b9UYOpWyLYV5I6m7uw9
         2S1g==
X-Gm-Message-State: AC+VfDzaEvML7sRePDPlPAXenBNrYYaPdQwovaON/Y3q3iXdpAm62LhV
        wy0WN6OSFvlGfqt6SrnZQjjzinkMj5UtgQ==
X-Google-Smtp-Source: ACHHUZ6Z9JRl3cDxnXPM1TG9SdeFAtY+u6N91OA8/QL2ws3wkaDZdSi1QeiPUbMT5YkhdNUJugHHgg==
X-Received: by 2002:aca:6205:0:b0:39a:656:41b2 with SMTP id w5-20020aca6205000000b0039a065641b2mr426306oib.4.1686185337656;
        Wed, 07 Jun 2023 17:48:57 -0700 (PDT)
Received: from ?IPV6:2605:a601:ab5d:b200:ac6f:a0c:68ed:e64? ([2605:a601:ab5d:b200:ac6f:a0c:68ed:e64])
        by smtp.gmail.com with ESMTPSA id o126-20020acad784000000b003924c15cf58sm6240051oig.20.2023.06.07.17.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 17:48:57 -0700 (PDT)
Message-ID: <76fadf60-86cd-91d7-1594-bbbaf75bc96e@gmail.com>
Date:   Wed, 7 Jun 2023 19:48:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
To:     Oliver Neukum <oneukum@suse.com>,
        =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
 <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
 <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
 <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
 <b748359d-b116-6354-036c-94679bc7b306@gmail.com>
 <3d485cd9-e31c-20ac-e595-3000ada983fb@suse.com>
Content-Language: en-US
From:   Warren Togami <wtogami@gmail.com>
In-Reply-To: <3d485cd9-e31c-20ac-e595-3000ada983fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 6/7/23 08:10, Oliver Neukum wrote:
>
>> * udev rule: ATTRS{idProduct}=="55d4", ATTRS{idVendor}=="1a86", 
>> SUBSYSTEM=="usb", TEST=="power/control" ATTR{power/control}="on"
>> * usbcore.quirks=1a86:55d4:b
> [..]
>>
>> During the pandemic supply chain constraints led to some switching to 
>> the CH9102F which is described here as *almost* a drop-in 
>> replacement. Unfortunately the pinout differences might have 
>> mattered. I am uncertain if the board design could have been better 
>> but that is now in the past. Too many were mass produced so I am 
>> hoping for a USB quirk to stabilize this going forward.
>>
>> I have confirmed USB_QUIRK_RESET_RESUME allows this device to 
>> function for the same reason it works for the Cypress. I am uncertain 
>> if a narrower new quirk "ignore the remote wakeup bit" would work 
>> here. How can I test that?
>
> Please test the attached patch by giving the new 'p' quirk
> as usbcore.quirks
>
>     Regards
>         Oliver


Thanks! Tested your patch against 6.4.0-rc5. Both 
usbcore.quirks=1a86:55d4:b and usbcore.quirks=1a86:55d4:p allow the 
device to be fully functional. It even works through suspend+resume of 
the host. Without the quirk the only other way for this device to 
function at all is to turn off autosuspend.

How should we proceed? "p" would be the narrower quirk.  Would this be 
appropriate for drivers/usb/core/quirks.c?

Warren Togami
