Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9C4408162
	for <lists+linux-usb@lfdr.de>; Sun, 12 Sep 2021 22:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbhILUQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Sep 2021 16:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236644AbhILUQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Sep 2021 16:16:33 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B71C0613B2
        for <linux-usb@vger.kernel.org>; Sun, 12 Sep 2021 13:13:34 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id w29so10563369wra.8
        for <linux-usb@vger.kernel.org>; Sun, 12 Sep 2021 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=hldGy+DiVE5YeR/MdHyA+Jqia0V+LvXcD6C30kosu5I=;
        b=YrFndlMDonwu5qw55ke2kyYxuH2KuZcYoruQVNYx5yjci98vZ5Ukr+gErNQ6elGlQm
         n79OZF5FxfcbHbdcdcIS1L6JB3TEigvZDNqBXSU1TSiB+HIiKJ+9vZb0MZcC8OX5D4Vy
         RNWYTTPZT0DhkjGBjF8May6+24cImVGmyHF5N53MNhaYziNWtLYgmcRsqCGyI/UsJfgB
         CxpAqT/mmHfUAkSyIZt2bar9qsTvta4OC927zTA1fHmrPlEA8g8KSpu3Ukn1w9+ix0SW
         fqTdTTAd38YifwK55ahhdbZeFhYuaZwdmk3gevWoG65bOW7TwzX5epiTTGZqvXQZOwJk
         XzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=hldGy+DiVE5YeR/MdHyA+Jqia0V+LvXcD6C30kosu5I=;
        b=dL7xrNzsW501zZLTY9ATFBvtmfJqF2Dmz8YC2diAFbI/A2V4v12hO2TMDGvc/MyJno
         FM6MC2IzLzAxty1l/zqkBG0wAleUx9f18fW0M/yCp1CP+tknAOUURXrjXCbJMOEanBwP
         hxFMhsHIEeT220hViGNtzLPHH4vW91IMF3v1NGfow4FCB0ahZAmqLQIB75Ub8rPdPaAE
         hdwg98bLnY1Ol8cltB1pbP16/gqzpiR9w6H9W0d4KO8jP3EKPOCJIMU7bJmVwg3qXA/4
         nuj3NfXWmF/ncxoOosGk5UG+HeiYc9rv9WBz81EbFWGvqBIvsAbFE2EVWxj0PWV/lJRd
         JEUg==
X-Gm-Message-State: AOAM5304dPulxvdBaK5AR9d9dQQDvUtHRMwtrnMMZe1Zt4u0K+ef3Jg4
        CLjusN7k1557HMB7s0+SvNU=
X-Google-Smtp-Source: ABdhPJybBCoIjOw8p24ESRB29NMRHjzwAJIBNJl8W4Wg9ItDJeaDxFcnVh14TB+shUSObEy6BFhwsg==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr8940083wrp.437.1631477613402;
        Sun, 12 Sep 2021 13:13:33 -0700 (PDT)
Received: from ?IPV6:2a02:908:1980:80a0::3eb3? ([2a02:908:1980:80a0::3eb3])
        by smtp.gmail.com with ESMTPSA id y15sm5662994wmi.18.2021.09.12.13.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 13:13:32 -0700 (PDT)
Message-ID: <25e6ce5a-4732-8ffa-4805-9bf95859214b@gmail.com>
Date:   Sun, 12 Sep 2021 22:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
From:   Julian Sikorski <belegdol@gmail.com>
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>,
        USB list <linux-usb@vger.kernel.org>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
 <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
 <1568033125.365.17.camel@suse.com>
 <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
 <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
 <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
 <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
 <c4d769e6-b906-f5f4-255b-7faf27f8702f@redhat.com>
 <CA+xVL_QEgzb1tu-tzqYPxJF-G_a8czCp=uyZ1JJ9+5xmCcNp2Q@mail.gmail.com>
 <CA+xVL_QrJ9f8-BwVRq1oG_yo2Cd=yQH9=TCm5g=MUO9MmdvRVA@mail.gmail.com>
 <830f09f8-7e16-425e-d5dc-2c5102ee4c7a@redhat.com>
Content-Language: en-US
In-Reply-To: <830f09f8-7e16-425e-d5dc-2c5102ee4c7a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 29.07.21 um 11:08 schrieb Hans de Goede:
> Hi,
> 
> On 7/28/21 7:29 PM, Julian Sikorski wrote:
>> Hi all,
>>
>> f quirk alone seems to be sufficient.
> 
> Thank you for testing, but I'm not sure using only the NO_REPORT_OPCODES
> quirk is wise here, the other similar La Cie drive also started out with
> just that quirk, only to have the NO_SAME quirk added later. See:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8010622c86ca5bb44bc98492f5968726fc7c7a21
> 
> Actually triggering a WRITE_SAME SCSI command is likely tricky, so
> it likely requires a special workload to ensure that that flag is
> not necessary.
> 
> As Oliver set with the quirk to disable UAS we at least have the
> drive working (albeit slower then it would work with UAS) so we
> can take our time to make sure that things work properly with
> the combination of the f+k flags (at least using both seems
> best to me) before re-enabling UAS.
> 
> Regards,
> 
> Hans
> 
(final attempt)

Hi,

I have just updated my backups with f+k quirks enabled and everything 
worked without errors. Given that nobody appears to be aware of a sure 
test case for checking whether f alone is sufficient, should I just 
generate a patch enabling fk instead of u?

Best regards,
Julian

> 
> 
>>
>> Best regards,
>> Julian
>>
>> Julian Sikorski <belegdol@gmail.com <mailto:belegdol@gmail.com>> schrieb am Mi., 28. Juli 2021, 01:14:
>>
>>      Hi Hans,
>>
>>      apologies for top-posting and HTML but I only can send emails from my mobile currently.
>>      With fk quirk the drive indeed appears to be working with uas: I can decrypt and mount a veracrypt volume from it. Thanks!
>>      The patch disabling uas has already made it to Linus' tree and is about to be added to stable:
>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf2fe6b4bf6e5256b80c5817908151d2d33e9f <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf2fe6b4bf6e5256b80c5817908151d2d33e9f>
>>      As I have no working internet on any of my Linux machines and won't for the foreseeable future (thank you construction workers), would you mind taking care of amending the quirk accordingly? Thank you in advance.
>>
>>      Best regards,
>>      Julian
>>
>>
>>      Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> schrieb am Di., 27. Juli 2021, 23:19:
>>
>>          Hi,
>>
>>          On 7/19/21 6:10 PM, Julian Sikorski wrote:
>>          > W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
>>          >>
>>          >>> Hi all,
>>          >>>
>>          >>> apologies for necro-ing this thread. I have just tried this drive with
>>          >>> my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
>>          >>> get the drive to work:
>>          >>> options usb-storage quirks=059f:1061:u
>>          >>>
>>          >>> Should we still try to get uas working with this drive or should I
>>          >>> send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
>>          >>> now. Thanks for the feedback in advance.
>>          >>>
>>          >>
>>          >> Hi,
>>          >>
>>          >>
>>          >> sometimes we must give up. This thing is too elusive. Please send a
>>          >> patch with a quirk.
>>          >>
>>          >>      Regards
>>          >>
>>          >>          Oliver
>>          >>
>>          >>
>>          >
>>          > Hi,
>>          >
>>          > thanks for confirming. Patch is attached, it appears to be working correctly when applied against 5.13.3. Please let me know if changes are required.
>>
>>          I seem to have missed the earlier part of this thread somehow.
>>
>>          Looking at the USB-ids, your model seems mightily close to this existing quirk:
>>
>>          UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>>                          "LaCie",
>>                          "2Big Quadra USB3",
>>                          USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>                          US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>>
>>          Before we go with the suggested patch, can you give the uas driver one last
>>          try with:
>>
>>          options usb-storage quirks=059f:1061:fk
>>
>>          ? The fk translates like this:
>>
>>          f -> US_FL_NO_REPORT_OPCODES
>>          k -> US_FL_NO_SAME
>>
>>          Regards,
>>
>>          Hans
>>
> 
