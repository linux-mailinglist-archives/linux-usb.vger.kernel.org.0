Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FCA3DCAC9
	for <lists+linux-usb@lfdr.de>; Sun,  1 Aug 2021 10:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhHAIqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Aug 2021 04:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229885AbhHAIqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Aug 2021 04:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627807605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MAnozK3Jli8GyM6JSor6/ZmPmFWbcK8rbQiRFDAw6jk=;
        b=IrfKiud+icQ6d1qXnq2NaEasKdlfgykN3xzfkODjqN/XUtog6HuDgVM0QOPvGh2zugusq3
        CEUazoLRsc6CEoKyxtOx8XP6lHSjVBvDQeaTFc+a/ln+nvzbFunpOOsmetFP35X91Lcuvl
        PGMxoFWCuWDICA9Xf/81ZqWgahSVcGI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-IQOaqBb_NweSWQRd0eAmEQ-1; Sun, 01 Aug 2021 04:46:43 -0400
X-MC-Unique: IQOaqBb_NweSWQRd0eAmEQ-1
Received: by mail-ed1-f69.google.com with SMTP id c16-20020aa7d6100000b02903bc4c2a387bso6963106edr.21
        for <linux-usb@vger.kernel.org>; Sun, 01 Aug 2021 01:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MAnozK3Jli8GyM6JSor6/ZmPmFWbcK8rbQiRFDAw6jk=;
        b=WzRtkYnEcMLK0+plopsRjIC4C8YdGeWX7YmJMm+HCMWRdE4PYvJlVLB8+BDFxsKysI
         W9cLNaSVzEllX92f1pG9yDFRnpXvVi1URf3xjR7G46fUTDCOytYtakdT3FQmXlWVSEyb
         /RS868PcuuM3SuV0y3Hxcjy5lveiVi5wIZ7+2G2ewmoETVyYF/ABjl14qmbpwTay1uhq
         kfU71TQtnU9HNTOGYtXbf5yHvLSrczZhfj9AD1Lbpc9Cb9gGFAcA9gT9Na/bak0iFPhd
         AkpD6Jxv3l3WX0hpQS4jsJT1iS15oWJZi3kLCSS1xqFv5/UYwaQNuk0GPPL0v5iPOWta
         Zkug==
X-Gm-Message-State: AOAM530igjFZasgFDYLoTIaibEk87ehFZ4RnubnbiNLgaTHf9ti8DZAH
        ns0BnpOT7y/oL5ogrqsUNuA14mv06e5YvfE1P0WiBQOyJg1rYo12Q4t41LOVXwpIAOpRBvgmmBq
        3yoqAtSTLJApkqawCJtsjb2CB30SZyJY3IDkAykVZRTrMEVwlwb2GckMm/oHSkZ/iVNtgqIrm
X-Received: by 2002:a17:906:fb11:: with SMTP id lz17mr10506994ejb.336.1627807602180;
        Sun, 01 Aug 2021 01:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXZVMVSgoSNiLVIQ+D1hIwEzeA6PeTLC9C5e0qqth16zdspq/PJwNzvfMpSAIaNNqQU4ZvZg==
X-Received: by 2002:a17:906:fb11:: with SMTP id lz17mr10506984ejb.336.1627807601984;
        Sun, 01 Aug 2021 01:46:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i6sm2786737ejd.57.2021.08.01.01.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 01:46:41 -0700 (PDT)
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
 <7c0a8a94-b6ac-c09e-31db-11fbb7bcd365@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <daaf2c3e-6294-132e-2510-95eb9b6c39b4@redhat.com>
Date:   Sun, 1 Aug 2021 10:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7c0a8a94-b6ac-c09e-31db-11fbb7bcd365@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/1/21 9:36 AM, Julian Sikorski wrote:
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
> Hi,
> 
> are there some tests which I could run in particular to test whether WRITE_SAME is working as intended?

I don't know, but perhaps someone else reading this knows ?

> one more question: is there a way to force-enable UAS for testing now that the quirk has been upstreamed, other than reverting the patch and rebuilding the kernel?

The quirks on the commandline override any quirks from the quirk-table
inside the kernel, including the no-uas quirk.

Regards,

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
>>>          > W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
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
>>>          >>      Regards
>>>          >>
>>>          >>          Oliver
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
>>>                          "LaCie",
>>>                          "2Big Quadra USB3",
>>>                          USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>>                          US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
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

