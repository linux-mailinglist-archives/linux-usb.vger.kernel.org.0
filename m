Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550EB408575
	for <lists+linux-usb@lfdr.de>; Mon, 13 Sep 2021 09:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbhIMHja (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Sep 2021 03:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237717AbhIMHjZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Sep 2021 03:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631518689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3pbLa5vTAc6lQFqOPVAY4+GUUfgiS9+Y/P0E00cMYPI=;
        b=iDe8IoSYNawAQocdBFTA9UCK2V+QkXMhLZT48UeWkG0OhuZEBxJbB44WTUGlrs65j2KPfc
        DJL7FOMb/7dww3MGAvF9fxx0qCzQzstz/m1qcdgSlC4GyivLEM9j8IhXn5NEztXp7rCl+X
        4b8GIroSXi8Vi5ntAvCqVur/7vB6SO8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-xp8Z0OjxPHeo4siMjb1NOQ-1; Mon, 13 Sep 2021 03:38:07 -0400
X-MC-Unique: xp8Z0OjxPHeo4siMjb1NOQ-1
Received: by mail-ej1-f70.google.com with SMTP id v19-20020a170906b013b02905b2f1bbf8f3so3261823ejy.6
        for <linux-usb@vger.kernel.org>; Mon, 13 Sep 2021 00:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3pbLa5vTAc6lQFqOPVAY4+GUUfgiS9+Y/P0E00cMYPI=;
        b=Gipg+Id0jj0zWYP5x4Nm69nf95uxlmadnfTVR2j6AE+h3nWc+Kjlsdj5yeKudjVDlP
         yemNATpSrsFvJ2Xgj8s72KMNA1egLRYpqeteHHtWFvciX33FzRHCkPG77I2bbWrLG20M
         7N/z4R14MSd5iQUKUqq0X2gTJMljfDx3hDS5H8AyanMRX0XrML55NeLy/OcTTtWN8ecg
         6zh6l9IQvYL5BracCDQb0p9M+PyScDV7tM9pkcoztoxQ+GQWQgYaogg5iEG+qHt44O80
         YUEK/5Tzpdmuqmpg56v/Rkz8vgbLh9hRkbEevYHWNdxJcGRG968S9Qr+mzTJ7jg1Waok
         Ymrw==
X-Gm-Message-State: AOAM532BhlC77SkVCVWEVqF/uKY0MBnXjoo1tanydbC+0TGxB3gGtYqo
        9BNfe57SUNQ9m5RnKAZxuF+S50bzOdWvfYndHWG7dcUoWCAwAYbIVoyLeLAurqKx0NNIzHGTiD2
        oZ4lcS1mtRNMPF0TeRqe+40JwT5eR2fp4DruboHiY9xEG0EPAC16LED6/Xy+TgtABAPDrxEc5
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr11120985ejc.60.1631518685946;
        Mon, 13 Sep 2021 00:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEdAAC0CzZYD7oplXvFD1ZXFKaiYTW2wOfAvKY54Zr5QRqPsSsqoTMU+98vepJ9i2S8iz4aA==
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr11120966ejc.60.1631518685694;
        Mon, 13 Sep 2021 00:38:05 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id v10sm3435680edt.25.2021.09.13.00.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 00:38:05 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Julian Sikorski <belegdol@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>,
        USB list <linux-usb@vger.kernel.org>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
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
 <25e6ce5a-4732-8ffa-4805-9bf95859214b@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <87a80ce7-7f66-627a-20ad-791cb971ffaf@redhat.com>
Date:   Mon, 13 Sep 2021 09:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <25e6ce5a-4732-8ffa-4805-9bf95859214b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/12/21 10:13 PM, Julian Sikorski wrote:
> Am 29.07.21 um 11:08 schrieb Hans de Goede:
>> Hi,
>>
>> On 7/28/21 7:29 PM, Julian Sikorski wrote:
>>> Hi all,
>>>
>>> f quirk alone seems to be sufficient.
>>
>> Thank you for testing, but I'm not sure using only the NO_REPORT_OPCODES
>> quirk is wise here, the other similar La Cie drive also started out with
>> just that quirk, only to have the NO_SAME quirk added later. See:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8010622c86ca5bb44bc98492f5968726fc7c7a21
>>
>> Actually triggering a WRITE_SAME SCSI command is likely tricky, so
>> it likely requires a special workload to ensure that that flag is
>> not necessary.
>>
>> As Oliver set with the quirk to disable UAS we at least have the
>> drive working (albeit slower then it would work with UAS) so we
>> can take our time to make sure that things work properly with
>> the combination of the f+k flags (at least using both seems
>> best to me) before re-enabling UAS.
>>
>> Regards,
>>
>> Hans
>>
> (final attempt)

Not sure why you tried 3 times, FWIW I successfully received all 3 emails...

> Hi,
> 
> I have just updated my backups with f+k quirks enabled and everything worked without errors. Given that nobody appears to be aware of a sure test case for checking whether f alone is sufficient, should I just generate a patch enabling fk instead of u?

Yes I believe that switching from fk to u, like done on the other Lacie entries is best.

Thanks & Regards,

Hans


>>> Julian Sikorski <belegdol@gmail.com <mailto:belegdol@gmail.com>> schrieb am Mi., 28. Juli 2021, 01:14:
>>>
>>>      Hi Hans,
>>>
>>>      apologies for top-posting and HTML but I only can send emails from my mobile currently.
>>>      With fk quirk the drive indeed appears to be working with uas: I can decrypt and mount a veracrypt volume from it. Thanks!
>>>      The patch disabling uas has already made it to Linus' tree and is about to be added to stable:
>>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf2fe6b4bf6e5256b80c5817908151d2d33e9f <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf2fe6b4bf6e5256b80c5817908151d2d33e9f>
>>>      As I have no working internet on any of my Linux machines and won't for the foreseeable future (thank you construction workers), would you mind taking care of amending the quirk accordingly? Thank you in advance.
>>>
>>>      Best regards,
>>>      Julian
>>>
>>>
>>>      Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> schrieb am Di., 27. Juli 2021, 23:19:
>>>
>>>          Hi,
>>>
>>>          On 7/19/21 6:10 PM, Julian Sikorski wrote:
>>>          > W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
>>>          >>
>>>          >>> Hi all,
>>>          >>>
>>>          >>> apologies for necro-ing this thread. I have just tried this drive with
>>>          >>> my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
>>>          >>> get the drive to work:
>>>          >>> options usb-storage quirks=059f:1061:u
>>>          >>>
>>>          >>> Should we still try to get uas working with this drive or should I
>>>          >>> send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
>>>          >>> now. Thanks for the feedback in advance.
>>>          >>>
>>>          >>
>>>          >> Hi,
>>>          >>
>>>          >>
>>>          >> sometimes we must give up. This thing is too elusive. Please send a
>>>          >> patch with a quirk.
>>>          >>
>>>          >>      Regards
>>>          >>
>>>          >>          Oliver
>>>          >>
>>>          >>
>>>          >
>>>          > Hi,
>>>          >
>>>          > thanks for confirming. Patch is attached, it appears to be working correctly when applied against 5.13.3. Please let me know if changes are required.
>>>
>>>          I seem to have missed the earlier part of this thread somehow.
>>>
>>>          Looking at the USB-ids, your model seems mightily close to this existing quirk:
>>>
>>>          UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>>>                          "LaCie",
>>>                          "2Big Quadra USB3",
>>>                          USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>>                          US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>>>
>>>          Before we go with the suggested patch, can you give the uas driver one last
>>>          try with:
>>>
>>>          options usb-storage quirks=059f:1061:fk
>>>
>>>          ? The fk translates like this:
>>>
>>>          f -> US_FL_NO_REPORT_OPCODES
>>>          k -> US_FL_NO_SAME
>>>
>>>          Regards,
>>>
>>>          Hans
>>>
>>
> 

