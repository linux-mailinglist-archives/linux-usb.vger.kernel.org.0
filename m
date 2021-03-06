Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2637C32FC48
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 18:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhCFR1m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 12:27:42 -0500
Received: from mout.web.de ([217.72.192.78]:43343 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230311AbhCFR1J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Mar 2021 12:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1615051627;
        bh=PF9vhLJlYEb2vjaOXkl0dzCyhV1zBGEPDl42bgYhuQ8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=idoHdLKVmlABSBjlJ3f28wo4lzs1lvf3+TaHIKsl1JN2CuTyKxZ1PlzRduV8ZJU40
         c0WcBANZeIK8AIprjRXeXa3LXK0V6NGrlzaJAC3Nh8K55sCTYRUVsg1n8vhzSbkM+F
         5Jv4pZB+6/lK/pjEn7HQN4j4Zq1I/szIVbu1kjMY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.53] ([128.0.103.26]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M09ZI-1ldPuR13S0-00uEzB; Sat, 06
 Mar 2021 18:27:07 +0100
Subject: Re: A question about UAS
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
 <YEO1t63SQw1Ui4ce@kroah.com>
From:   Aaron Dewes <aaron.dewes@web.de>
Message-ID: <e5c24520-bc6d-8eec-4e51-6cbc30dd59a6@web.de>
Date:   Sat, 6 Mar 2021 18:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEO1t63SQw1Ui4ce@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:VlOn98dzYz0qktSWiDJds6GbJtjfHbw9T6XaRZ5RQIXmjjuLzxp
 eVOajb4EbhBwDoEuvc/yKe02HgVm/3+9PefuzWmF4aaPo4ZAE/mgcty0yWZbwgXzBULlYua
 oJmjRdB6Y0llw6SrX8TyzJEQKM7n+Q3ta5qwUsybKaZfTuYIlEpyBXptUsHkqFnlo75EHWi
 g9Kmzs1g+zhiEpajfSMQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NooW41PrstU=:kfY78bFP92He6giSDbi9ne
 SeTN5u70sKhYw2N3KPYG/GraJnoxuADpbNzbPrB8aQvOTZ9ciqeo+RczpMN+0t/BSQ3aZs24B
 OMW1lkkfSQ3JBdVwb9Nu+BXnWKeq+ej3qEFBQk3hToNwym+Nz9/C5Rr3yFUtW5CcANTAGGFHX
 1e+jbXXXHSV5/MqKU3xWIj4hGYqqEnxDaODdquZydBo9N6MscKVyz88mrqhVnxiWNd3RKiruB
 M3dyFIk9eqtKfZPGC9SXTMignS3dYsMmzfMNWYmBCzYkfrgoFQxRkJdBalhhmqWrc3h7558On
 0mTuFbiPr/VGzcTkLD11XJpeCMnUoqgt5AERa09q434vdyTjeomLcdMRkptVEAVCp434MCYxY
 QcDWno3gdQyXsAiKih3yje3Klx6CIA2UItiGaqwB35Hn7+/6xbWz+99/ckXoInIHje9BFu85X
 iaDaxybgm+t3FxHOTqZcZXprVwS6tp5swFcIVYQKveg4o/e3pGCCJ8bhBxsBdNPBk6gahFCF3
 keecTGTpYgUr24UxTV9lagO5muoPuFvjnnkj/7llWQDv8DNBSdGjm8tOfppbJbD6e/hpI3i6l
 TMueW8LrsDe2sdMvJEJ5M35Htig7eB0wv5oAt1PV6QL25coNcGlCXQO5dqwMuddiMuEyj0kwk
 KUbmZCgOoqaXT1Q6BpogQ+ifkcfmZ00LLm2M1hCnU929JRZR0BqXSAax30U5U3RWlL2262U3O
 lgThiY1xUULjSDgPt6EURHsTR76KjHD6V7QCtRahYro7jDKic5IQTkPv4k6abSaVHFPnSGTSg
 bSW1Xade/kI1zJJCw4+cJj/T0rUsk3eMHfurI1JiuBtIgvvdPApQtXFg00kVm25tMRI5lD9jb
 l3iF3qt1cknMl/r+aLfQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> On Sat, Mar 06, 2021 at 05:34:32PM +0100, Aaron Dewes wrote:
>> Hello!
>>
>> Sorry if this suggestion/question sounds stupid, I don't have experienc=
e
>> with the kernel code and this mailing list.
>>
>> I'm a contributor to Umbrel (getumbrel.com), and we provide a software
>> that allows to run a bitcoin node easily, and we've run into many peopl=
e
>> having UAS issues
> What specific UAS issues?  And why not just fix those instead?

Sorry, I should've been more specific. When I said UAS issues, I meant
that we've had many users who used drives that were incompatible with
UAS, and that script is our way to detect that and fix it, because the
kernel apparently often doesn't detect that, and I think that way would
be a way to actually automatically detect such issues.

Currently, drivers/usb/storage/unusual_devs.h disables UAS for a few
devices, but autodetecting would be better in my opinion.

>
>> , and we were manually adding quirks in this case. Now
>> I'm wondering if it is possible to disable UAS for all devices in the
>> kernel cmdline.
> Sure, just blacklist the uas kernel module, that prevents it from being
> loaded and hopefully the device will degrade to the
> old-school-and-dirt-slow usb-storage protocol.
>
> Have you tried that?
No, but I'll do that.
>
>> This is my first question, but I also have another
>> suggestion. We've developed the following bash script to check for UAS
>> issues and automatically add quirks:
>>
>> ------
>>
>> get_uas_string () {
>>    UDEVADM_DATA=3D$(sudo -u umbrel udevadm test /block/${block_device} =
2> /dev/null) # Umbrel is the  main user on umbrel, and udevadm doesn't re=
port the vendor id if running as root, which this script is
>>    ID_VENDOR=3D$(echo "${UDEVADM_DATA}" | grep "ID_VENDOR_ID" | sed 's/=
ID_VENDOR_ID=3D//')
>>    ID_MODEL=3D$(echo "${UDEVADM_DATA}" | grep "ID_MODEL_ID" | sed 's/ID=
_MODEL_ID=3D//')
>>    echo "${ID_VENDOR}:${ID_MODEL}:u"
>> }
>>
>> if [[ $(dmesg) =3D=3D *"uas_eh_abort_handler"* ]]; then
>>    echo "External storage might have UAS issues"
>>    UAS_STRING=3D$(get_uas_string)
>>    if [[ $(cat /boot/cmdline.txt) =3D=3D *"${UAS_STRING}"* ]]; then
>>      sed "s/usb-storage.quirks=3D/usb-storage.quirks=3D$(get_uas_string=
),/g" -i /boot/cmdline.txt
>>      echo "Rebooting"
>>      sudo reboot
>>    fi
>> fi
>>
>> -----
>>
>> I was wondering if a check like this could be added to the kernel, so
>> every time uas_eh_abort_handler gets logged, which AFAIK only happens i=
f
>> UAS has issues, a counter could be increased, so that, if it happens to
>> often, UAS gets disabled for that drive.
> How do you "know" the next time you boot you really have the same drive
> or not?  That type of logic is best done in userspace, the kernel is
> just reporting the issues, it's up to userspace to determine if it wants
> to not mount the drive or not.
Okay, I wasn't sure about that.
> But back to your root problem, what is wrong with UAS?  I've been using
> it for a build system for Android for years just fine.  And that
> stresses the CPU and drive really hard.
>
> thanks,
>
> greg k-h

Thanks for your reply,

Aaron Dewes

