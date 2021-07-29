Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3CA3DA014
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 11:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbhG2JIx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 05:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36667 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235017AbhG2JIw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jul 2021 05:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627549729;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B72jT94zoaK8ld9T7Wc/L2JO+VbuQyD10IikltADwPM=;
        b=Uv+g1sjIjEo1YiuycTYeyVrgEtcrSKm7mVQnC5noRpPmNoYbtE16pFHHhMYZcO40HrEVo/
        4w6ErPnw19mkVRUCfG9diGJ1q6ZpvQhEgmcaez9WQG/Z7G3rYvAFMo4vfn1AvdO5kV9krW
        7ISqctPzPO4GobhaXU18pVsuaYSVF5s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-wVRIELrjOQO8fZt_n7RlhA-1; Thu, 29 Jul 2021 05:08:48 -0400
X-MC-Unique: wVRIELrjOQO8fZt_n7RlhA-1
Received: by mail-ed1-f72.google.com with SMTP id d6-20020a50f6860000b02903bc068b7717so2642666edn.11
        for <linux-usb@vger.kernel.org>; Thu, 29 Jul 2021 02:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B72jT94zoaK8ld9T7Wc/L2JO+VbuQyD10IikltADwPM=;
        b=CI7ZjecSx4/GBJNQlSK0TsKAQgAhuIYbaoPoxAHIGRByR4XT+camo5a9cjIn6EgxhY
         mDxyko14MiYrh9JEFdTeW9XJtwt/DtR8jLJT+FKMsxkY8lQKk6L+/FqgpijygPURfItW
         XrmdEtzuzm3MPZM0HlaoYO+NwwMuTwvb/+KMI/B8kF24M/HCtPZzIylTDDyC5qadt2GH
         36ccRPedP0dfVyOBSs350hTO0NPSVgf26DiNJSqixdL5S4uEZf3Xt4bUiAQ5RYpn6D54
         acVTculvkiJp9J0x3kcP2ZBv5IDaEq75STZIc7LY+13GI/U7OUv7mxA2RpKh8O/N9s2+
         2K/g==
X-Gm-Message-State: AOAM5306pCLBUlNHWo+P65MOPyzF8fHyxydZk56KdXJBhNBqNzW5tUqT
        GWARJRBJJsoImezFiJF0+umfcT93gcdOgfMlg3VjrvjajDrbZ9w9V0h+TpAdU+r0igd0bJlwpEk
        oBvpS0mbqQYCEdHND7m+JXlpbUfqQ03bTzAJLH4fTA52+qtQ2WlKDarMlGzqAvzg8QTW7lZUc
X-Received: by 2002:a50:af85:: with SMTP id h5mr4881682edd.27.1627549726285;
        Thu, 29 Jul 2021 02:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzltitzoKi+zfTiYYJGs/kFIMVRgaz53yPZ98ZlEue0ImpcwClNiWLmXgW42O+TyKnvt6k1rQ==
X-Received: by 2002:a50:af85:: with SMTP id h5mr4881665edd.27.1627549726081;
        Thu, 29 Jul 2021 02:08:46 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h19sm930131edt.87.2021.07.29.02.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 02:08:45 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Julian Sikorski <belegdol@gmail.com>
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <830f09f8-7e16-425e-d5dc-2c5102ee4c7a@redhat.com>
Date:   Thu, 29 Jul 2021 11:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+xVL_QrJ9f8-BwVRq1oG_yo2Cd=yQH9=TCm5g=MUO9MmdvRVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/28/21 7:29 PM, Julian Sikorski wrote:
> Hi all,
> 
> f quirk alone seems to be sufficient.

Thank you for testing, but I'm not sure using only the NO_REPORT_OPCODES
quirk is wise here, the other similar La Cie drive also started out with
just that quirk, only to have the NO_SAME quirk added later. See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8010622c86ca5bb44bc98492f5968726fc7c7a21

Actually triggering a WRITE_SAME SCSI command is likely tricky, so
it likely requires a special workload to ensure that that flag is
not necessary.

As Oliver set with the quirk to disable UAS we at least have the
drive working (albeit slower then it would work with UAS) so we
can take our time to make sure that things work properly with
the combination of the f+k flags (at least using both seems
best to me) before re-enabling UAS.

Regards,

Hans




> 
> Best regards,
> Julian
> 
> Julian Sikorski <belegdol@gmail.com <mailto:belegdol@gmail.com>> schrieb am Mi., 28. Juli 2021, 01:14:
> 
>     Hi Hans,
> 
>     apologies for top-posting and HTML but I only can send emails from my mobile currently.
>     With fk quirk the drive indeed appears to be working with uas: I can decrypt and mount a veracrypt volume from it. Thanks!
>     The patch disabling uas has already made it to Linus' tree and is about to be added to stable:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf2fe6b4bf6e5256b80c5817908151d2d33e9f <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf2fe6b4bf6e5256b80c5817908151d2d33e9f>
>     As I have no working internet on any of my Linux machines and won't for the foreseeable future (thank you construction workers), would you mind taking care of amending the quirk accordingly? Thank you in advance.
> 
>     Best regards,
>     Julian
> 
> 
>     Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> schrieb am Di., 27. Juli 2021, 23:19:
> 
>         Hi,
> 
>         On 7/19/21 6:10 PM, Julian Sikorski wrote:
>         > W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
>         >>
>         >>> Hi all,
>         >>>
>         >>> apologies for necro-ing this thread. I have just tried this drive with
>         >>> my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
>         >>> get the drive to work:
>         >>> options usb-storage quirks=059f:1061:u
>         >>>
>         >>> Should we still try to get uas working with this drive or should I
>         >>> send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
>         >>> now. Thanks for the feedback in advance.
>         >>>
>         >>
>         >> Hi,
>         >>
>         >>
>         >> sometimes we must give up. This thing is too elusive. Please send a
>         >> patch with a quirk.
>         >>
>         >>      Regards
>         >>
>         >>          Oliver
>         >>
>         >>
>         >
>         > Hi,
>         >
>         > thanks for confirming. Patch is attached, it appears to be working correctly when applied against 5.13.3. Please let me know if changes are required.
> 
>         I seem to have missed the earlier part of this thread somehow.
> 
>         Looking at the USB-ids, your model seems mightily close to this existing quirk:
> 
>         UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
>                         "LaCie",
>                         "2Big Quadra USB3",
>                         USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>                         US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
> 
>         Before we go with the suggested patch, can you give the uas driver one last
>         try with:
> 
>         options usb-storage quirks=059f:1061:fk
> 
>         ? The fk translates like this:
> 
>         f -> US_FL_NO_REPORT_OPCODES
>         k -> US_FL_NO_SAME
> 
>         Regards,
> 
>         Hans
> 

