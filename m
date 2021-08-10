Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4267D3E7DE5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 19:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhHJRBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 13:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhHJRBA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 13:01:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9E1C0613C1
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 10:00:37 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id h13so27211644wrp.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 10:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=74SJXI5E5WWb2wjCblELI9UszaDCnz2lvHnGgWSoGB8=;
        b=GdLVDkzSFVG1sMD8MgzOiOSLAD0wFEP4QCEGKQsvZYu9TTsp+wBA9B7rk2D7q37Ynt
         WXnpoqoXj6nLXvrF8Z+fbUraivlMsv00YPy0cuysiMpkdejF0nRvhg8P+z4585gRz6+A
         F9wMaFAClre9EqMoN4PArD/S/NQ8LHRYwWAiyWTpg8QNe9cZG1w013vS7hxZviMQrqmB
         VZGShZWsxxSx1Iz+0mHXNq4wzeM79RFlYE52UUk5rABn4wuQR0KKnoQdBMLh/Yf3JIvl
         ZnYh6Voxo+XdODkfpJizB/0ALg6eg+cV37V0YUWPYJVNcOtpJo6y+VzEusk8vZnB8Eak
         atkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74SJXI5E5WWb2wjCblELI9UszaDCnz2lvHnGgWSoGB8=;
        b=jmP9MiOKlCOjOv7h42fkIzMVDrdrELI8lRVyPzLVUt3F8ILhpiHGTEGYUoz9cdxZsh
         TqIOx69UxLog/uGUF+PhczCuRF/pbKiok8Sf0EdNnDQilLg7qHzDJjjwuYbZ7OWtZp/y
         TDGqdDXrjZL1qdwK+e5x2I5bAE3Jvvcf8TbFjUScIDSkh2CbYkfNF+87j0AJKLIpYxlo
         WbyfIXuT8W20ivcvgRfOSwTkK96iHQb+vpY8Fyj9aQh92u+/IjMQ4k/JcZUD8TZU7geg
         NobeDm3kb0PtJW9el3WKA86LKZ9F21kzECn/95Mfqcj0OD50tK63CceGG2PFAmFJrUpQ
         mDpQ==
X-Gm-Message-State: AOAM531AvIJeCnBmho8Cv739GJoxDpSLfrW0u3QdeAJFg0qEYEAIRhjt
        UC/OSNlz3G2YGeEbbfkGxs4=
X-Google-Smtp-Source: ABdhPJzeC0JBbib1s5xquzGvkdHmhM8TSH6M788uOWyEjNw1sC9ooa5hyFsi2EZVqMmO1jjC2lIngQ==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr32121129wre.12.1628614836366;
        Tue, 10 Aug 2021 10:00:36 -0700 (PDT)
Received: from [192.168.86.232] (xo2wyvern.plus.com. [195.166.158.71])
        by smtp.gmail.com with ESMTPSA id k1sm24345584wrz.61.2021.08.10.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 10:00:35 -0700 (PDT)
Date:   Tue, 10 Aug 2021 18:00:28 +0100
From:   AMoonRabbit <razgriz.wilson6@gmail.com>
Subject: RE: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Message-Id: <S8VMXQ.YRNXM3NIXCE01@gmail.com>
In-Reply-To: <2c9ddbc65d1e4ce3a368c1d894281178@SVR-IES-MBX-03.mgc.mentorg.com>
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
        <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
        <YP+kqqimY1BYZAwL@kroah.com>
        <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
        <RBHWWQ.R54EUTRRR5DN@gmail.com>
        <2c9ddbc65d1e4ce3a368c1d894281178@SVR-IES-MBX-03.mgc.mentorg.com>
X-Mailer: geary/3.38.2
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On Tue, 27 Jul, 2021 at 1:02 pm, "Schmid, Carsten"=20
<Carsten_Schmid@mentor.com> wrote:
> Hi Neil,
>=20
>>  -----Original Message-----
>>  From: AMoonRabbit <razgriz.wilson6@gmail.com>
>=20
> No top posts please.
>=20
> On Tue, 27 Jul, 2021 at 7:43 am, "Schmid, Carsten"
> <Carsten_Schmid@mentor.com> wrote:
>>  Hi Greg,
>>=20
>>  On Tue, Jul 27, 2021 at 12:37:28AM +0100, Razgriz375 (Neil) wrote:
>>=20
>>>>   [  109.668465] usb 1-1: USB disconnect, device number 2
>>>>   [  110.084429] usb 1-1: new high-speed USB device number 5 using
>>>>  xhci_hcd
>>>>   [  110.237963] usb 1-1: New USB device found, idVendor=3D054c,
>>>>  idProduct=3D0b8c, bcdDevice=3D 1.00
>>>>   [  110.237989] usb 1-1: New USB device strings: Mfr=3D2, Product=3D3=
,
>>>>  SerialNumber=3D4
>>>>   [  110.238002] usb 1-1: Product: WALKMAN
>>>>   [  110.238011] usb 1-1: Manufacturer: Sony
>>>>   [  110.238019] usb 1-1: SerialNumber: 10458B55477916
>>>>   [  110.342104] usb 1-1: 1:7 : unsupported format bits 0x100000000
>>>>   [  110.343953] usbcore: registered new interface driver
>>>>  snd-usb-audio
>>>>=20
>>>=20
>>>=20
>>>   Looks like you removed the device and then added it back?  And it
>>>  says
>>>   the device is supported by the kernel now, what does not work
>>>  properly?
>>=20
>>  But earlier in boot these messages are seen:
>>  [    1.908489] usb 1-1: New USB device found, idVendor=3D054c,
>>  idProduct=3D0ca1, bcdDevice=3D 1.00
>>  [    1.908503] usb 1-1: New USB device strings: Mfr=3D2, Product=3D3,
>>  SerialNumber=3D4
>>  [    1.908508] usb 1-1: Product: WALKMAN
>>  [    1.908513] usb 1-1: Manufacturer: Sony
>>  [    1.908516] usb 1-1: SerialNumber: 10458B55477916
>>  [    2.195821] usb-storage 1-1:1.0: USB Mass Storage device detected
>>  [    2.195988] scsi host0: usb-storage 1-1:1.0
>>=20
>>  ProductId is different, that's strange.
>>=20
>>  Neil, could you collect the dmesg from the working kernel 5.10=20
>> please?
>>  And: is the device expected to be a mass storage (aka USB disk) and
>>  sound card in one?
>>=20

Responded to this already in the email on the 27th July.

>>=20
>>  So this is the Dmesg output from 5.10.17 with working output to USB=20
>> DAC
>>  (Walkman visually gets audio as the amp meter visualiser works=20
>> where as
>>  on newer kernels, whilst the system looks to be outputting sound,=20
>> the
>>  Walkman shows it's receiving nothing).
> ...
>>  [   12.202312]usb 1-1: new high-speed USB device number 3 using=20
>> xhci_hcd
>>  [   12.351838]usb 1-1: New USB device found, idVendor=3D054c,
>>  idProduct=3D0b8c, bcdDevice=3D 1.00
>>  [   12.351844]usb 1-1: New USB device strings: Mfr=3D2, Product=3D3,
>>  SerialNumber=3D4
>>  [   12.351847]usb 1-1: Product: WALKMAN
>>  [   12.351850]usb 1-1: Manufacturer: Sony
>>  [   12.351852]usb 1-1: SerialNumber: 10458B55477916
>>  [   38.560172]usb 1-1: 1:7 : unsupported format bits 0x100000000
>>  [   38.562750]usbcore: registered new interface driver snd-usb-audio
>>  [   38.630995]snd_hda_intel 0000:00:1f.3: DSP detected with PCI
>>  class/subclass/prog-if info 0x040380
>=20
> Looks like on the old kernel the Walkman is seen as the first sound=20
> card.
> On the new kernel, it was seen as a mass storage first and later=20
> switched to snd-usb.
> Please check if your Walkman appears as a sound card in the new kernel
> and if it is muted due to not being the default output.

So I have checked this, starting with the Walkman connected in DAC=20
mode, so it is only seen in DAC mode. Pop OS updates the sound settings=20
so that the Walkman is the selected output device. It does not show as=20
muted. Within ALSA Mixer, I see that HDA Intel PCM is first, and then=20
the WALKMAN device, however when selecting WALKMAN I get "This sound=20
device does not have any controls".

>=20
> Thanks,
> Carsten
> -----------------
> Siemens Electronic Design Automation GmbH; Anschrift: Arnulfstra=DFe=20
> 201, 80634 M=FCnchen; Gesellschaft mit beschr=E4nkter Haftung;=20
> Gesch=E4ftsf=FChrer: Thomas Heurung, Frank Th=FCrauf; Sitz der=20
> Gesellschaft: M=FCnchen; Registergericht M=FCnchen, HRB 106955
>=20

Kind regards,

Neil









