Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770173B8ACD
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 01:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhF3XMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 19:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhF3XMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Jun 2021 19:12:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDCEC061756
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 16:09:45 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bu12so7143538ejb.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 16:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Yj/+VE/hYrluELPDIeX+nRbpJ0sABuSG/agfLisvH4=;
        b=Tz6eDd1KONp4CUzBfckoib90k8BAWleZza318VCqHErAE9fwKjFQ/PfD1EaITs51qU
         31EOPdhDorPRp9o7lnzExjT/vR4HCR58Jwz+5IwJuXpiN3P4N8qphmOC+NIy86zqx8Gf
         Ao1HJO5iDmeXLdaGH1/GS3EohjD6ORYNKtqWjJJBGsG6e09bsikuh/TnZanrT14X4LN9
         l6o5JGEABqhc4RdO3VZzuLJ/mYyYZ1do4/ce5ZOGb7c/xQcdJlDQDycSSNPPyhX1FbDm
         ZnSanTvpgEdL1Eo2ZHiYSWrO44DQtEgIR8BPAfLmiKgnMohLeeWOQh+vb7mtAWH5kTT+
         GU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Yj/+VE/hYrluELPDIeX+nRbpJ0sABuSG/agfLisvH4=;
        b=RXuhBXVP9CLi5c8LjLd9xD3Jt4vGTs5H5RCw6cH/r+G2rRUplS+B8nJ6Vyt3AsDSVw
         xNoAYsRw6MhQF0YfEFeqeikgifK9ICbAU9zjYBGI60x3hxbEOOg6lvHRdFdZTJSxPwVi
         KNvWIYEflitiCHugcjwdfe0KiUddHWD+AA8IogtPiJX3Qt7+lHCh3rN9qPjgMGrnjLvM
         0DrCsEKn8NWiSOHygJ1dRz5hVvLEwK79gdUicbrlPZout1gcLtin4EvLcSpDPfMJc2/1
         iaZSPKnZjm/OBL689ZLMG28uWJU4Jz8uoUQtN8l+veEYzi1wC+gtsx2czIYMqNv6fuIV
         TzgQ==
X-Gm-Message-State: AOAM5306yiL9PIk1+MHYX6/Xvuf6Z5DieLBvlnvv9roblL77ZSLwpSK+
        8lqG8lSuj6RW5tE4baAducVhgNd1OizhfmIrIV8=
X-Google-Smtp-Source: ABdhPJx6SqoqhZGlgfRDnql7D28rWC8eMbbDRcgbZVUuZVi6usLSRmFeXE33WvWLW/euLPJE32Esv9quaX2O7ucHbJg=
X-Received: by 2002:a17:906:6cf:: with SMTP id v15mr22883781ejb.208.1625094583883;
 Wed, 30 Jun 2021 16:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
In-Reply-To: <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 1 Jul 2021 01:09:33 +0200
Message-ID: <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux.amoon@gmail.com
Content-Type: multipart/mixed; boundary="00000000000066393605c603d101"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000066393605c603d101
Content-Type: text/plain; charset="UTF-8"

Hi Minas,

On Tue, Jun 29, 2021 at 6:30 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Alan,
>
> On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > > >         usbcore.autosuspend=-1
> > > wow, this helps indeed
> > > my steps are:
> > > - power off my Odroid-C1+
> > > - unplug all USB devices
> > > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > > detected before if an additional USB 2.0 flash drive was plugged in
> > > during boot)
> > > -> without any lsusb magic the device was immediately recognized
> >
> > That does show pretty convincingly that runtime suspend is causing the
> > problem.  But I still have no idea why the problem affects some devices
> > and not others.  It's a mystery.
> Maybe because there's two related problems (I am guessing here):
> The first issue is that USB hotplug is not working at all on my
> Odroid-C1+ (which means: dwc2 + GL852G USB hub).
> The second issue is that the workaround we had before (running lsusb
> -vv to make "hot plugged" devices show up) is not working for some USB
> devices.
>
> It seems that using a different workaround (usbcore.autosuspend=-1)
> makes *all* USB devices show up - even without any "lsusb -vv" call.
> So I think we should focus on the first issue as it may also fix the
> other problem as well.
above paragraph sums up the issues which Matt and I are seeing (on
Odroid-C1+ and Odroid-C2) in case you didn't follow the full email
thread

> [...]
> > > after rebooting without usbcore.autosuspend=-1 (and no USB device
> > > plugged in during boot):
> > > # grep "" /sys/bus/usb/devices/*/power/autosuspend
> > > /sys/bus/usb/devices/1-1/power/autosuspend:0
> > > /sys/bus/usb/devices/usb1/power/autosuspend:0
> > >
> > > I think the next step is narrowing down which component is causing this issue.
> >
> > Maybe Minas can help.  He knows a lot more about dwc2 than I do (which
> > is practically nothing).
> I'll wait for Minas then
I have attached the dwc2 debugfs output to this email as well as I
think that it'll be useful
unfortunately I could not attach the "regdump" because that hangs my
Odroid-C1+ (not sure but this seems like an unrelated issue?)

in params.c dwc2_set_amlogic_params is used to override a few hardware
parameters.
power_down is one of them (although Alan's comment suggests that it
may not be related) is overwritten there to
DWC2_POWER_DOWN_PARAM_NONE. When removing that overriding then the
value (probably as set by the designer) is
DWC2_POWER_DOWN_PARAM_PARTIAL.


Best regards,
Martin

--00000000000066393605c603d101
Content-Type: text/plain; charset="US-ASCII"; name="dwc2-debugfs.txt"
Content-Disposition: attachment; filename="dwc2-debugfs.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kqk38ra30>
X-Attachment-Id: f_kqk38ra30

L3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9kcl9tb2RlOmhvc3QKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9maWZvOk5vbi1wZXJpb2RpYyBGSUZPczoKL3N5cy9r
ZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9maWZvOlJYRklGTzogU2l6ZSA1MTIKL3N5cy9r
ZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9maWZvOk5QVFhGSUZPOiBTaXplIDUwMCwgU3Rh
cnQgMHgwMDAwMDIwMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2ZpZm86Ci9z
eXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvZmlmbzpQZXJpb2RpYyBUWEZJRk9zOgov
c3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFtczpvcF9tb2RlICAgICAg
ICAgICAgICAgICAgICAgICA6IDUKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9o
d19wYXJhbXM6YXJjaCAgICAgICAgICAgICAgICAgICAgICAgICAgOiAyCi9zeXMva2VybmVsL2Rl
YnVnL3VzYi9jOTBjMDAwMC51c2IvaHdfcGFyYW1zOmRtYV9kZXNjX2VuYWJsZSAgICAgICAgICAg
ICAgIDogMQovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFtczplbmFi
bGVfZHluYW1pY19maWZvICAgICAgICAgICA6IDEKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMw
MDAwLnVzYi9od19wYXJhbXM6ZW5fbXVsdGlwbGVfdHhfZmlmbyAgICAgICAgICAgOiAwCi9zeXMv
a2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvaHdfcGFyYW1zOnJ4X2ZpZm9fc2l6ZSAgICAg
ICAgICAgICAgICAgIDogMjA0OAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3
X3BhcmFtczpob3N0X25wZXJpb190eF9maWZvX3NpemUgICAgICA6IDIwNDgKL3N5cy9rZXJuZWwv
ZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9od19wYXJhbXM6ZGV2X25wZXJpb190eF9maWZvX3NpemUg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvaHdfcGFyYW1zOmhv
c3RfcGVyaW9fdHhfZmlmb19zaXplICAgICAgIDogMjA0OAovc3lzL2tlcm5lbC9kZWJ1Zy91c2Iv
YzkwYzAwMDAudXNiL2h3X3BhcmFtczpucGVyaW9fdHhfcV9kZXB0aCAgICAgICAgICAgICA6IDQK
L3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9od19wYXJhbXM6aG9zdF9wZXJpb190
eF9xX2RlcHRoICAgICAgICAgOiA0Ci9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2Iv
aHdfcGFyYW1zOmRldl90b2tlbl9xX2RlcHRoICAgICAgICAgICAgIDogOAovc3lzL2tlcm5lbC9k
ZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFtczptYXhfdHJhbnNmZXJfc2l6ZSAgICAgICAg
ICAgICA6IDUyNDI4Nwovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFt
czptYXhfcGFja2V0X2NvdW50ICAgICAgICAgICAgICA6IDEwMjMKL3N5cy9rZXJuZWwvZGVidWcv
dXNiL2M5MGMwMDAwLnVzYi9od19wYXJhbXM6aG9zdF9jaGFubmVscyAgICAgICAgICAgICAgICAg
OiAxNgovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFtczpoc19waHlf
dHlwZSAgICAgICAgICAgICAgICAgICA6IDEKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAw
LnVzYi9od19wYXJhbXM6ZnNfcGh5X3R5cGUgICAgICAgICAgICAgICAgICAgOiAwCi9zeXMva2Vy
bmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvaHdfcGFyYW1zOmkyY19lbmFibGUgICAgICAgICAg
ICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFt
czpudW1fZGV2X2VwICAgICAgICAgICAgICAgICAgICA6IDIKL3N5cy9rZXJuZWwvZGVidWcvdXNi
L2M5MGMwMDAwLnVzYi9od19wYXJhbXM6bnVtX2Rldl9wZXJpb19pbl9lcCAgICAgICAgICAgOiAw
Ci9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvaHdfcGFyYW1zOnRvdGFsX2ZpZm9f
c2l6ZSAgICAgICAgICAgICAgIDogMTk4NAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAu
dXNiL2h3X3BhcmFtczpwb3dlcl9vcHRpbWl6ZWQgICAgICAgICAgICAgICA6IDEKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9od19wYXJhbXM6dXRtaV9waHlfZGF0YV93aWR0aCAg
ICAgICAgICAgOiAxCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvaHdfcGFyYW1z
OnNucHNpZCAgICAgICAgICAgICAgICAgICAgICAgIDogMHg0ZjU0MzEwYQovc3lzL2tlcm5lbC9k
ZWJ1Zy91c2IvYzkwYzAwMDAudXNiL2h3X3BhcmFtczpkZXZfZXBfZGlycyAgICAgICAgICAgICAg
ICAgICA6IDB4MAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczpvdGdf
Y2FwICAgICAgICAgICAgICAgICAgICAgICA6IDIKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMw
MDAwLnVzYi9wYXJhbXM6ZG1hX2Rlc2NfZW5hYmxlICAgICAgICAgICAgICAgOiAwCi9zeXMva2Vy
bmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmRtYV9kZXNjX2ZzX2VuYWJsZSAgICAg
ICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczpzcGVl
ZCAgICAgICAgICAgICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMw
MDAwLnVzYi9wYXJhbXM6ZW5hYmxlX2R5bmFtaWNfZmlmbyAgICAgICAgICAgOiAxCi9zeXMva2Vy
bmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmVuX211bHRpcGxlX3R4X2ZpZm8gICAg
ICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczpob3N0
X3J4X2ZpZm9fc2l6ZSAgICAgICAgICAgICA6IDUxMgovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkw
YzAwMDAudXNiL3BhcmFtczpob3N0X25wZXJpb190eF9maWZvX3NpemUgICAgICA6IDUwMAovc3lz
L2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczpob3N0X3BlcmlvX3R4X2ZpZm9f
c2l6ZSAgICAgICA6IDUwMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFt
czptYXhfdHJhbnNmZXJfc2l6ZSAgICAgICAgICAgICA6IDUyNDI4Nwovc3lzL2tlcm5lbC9kZWJ1
Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczptYXhfcGFja2V0X2NvdW50ICAgICAgICAgICAgICA6
IDEwMjMKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6aG9zdF9jaGFu
bmVscyAgICAgICAgICAgICAgICAgOiAxNgovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAu
dXNiL3BhcmFtczpwaHlfdHlwZSAgICAgICAgICAgICAgICAgICAgICA6IDEKL3N5cy9rZXJuZWwv
ZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6cGh5X3V0bWlfd2lkdGggICAgICAgICAgICAg
ICAgOiAxNgovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczpwaHlfdWxw
aV9kZHIgICAgICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAw
LnVzYi9wYXJhbXM6cGh5X3VscGlfZXh0X3ZidXMgICAgICAgICAgICAgOiAwCi9zeXMva2VybmVs
L2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmkyY19lbmFibGUgICAgICAgICAgICAgICAg
ICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczppcGdfaXNv
Y19lbiAgICAgICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAw
LnVzYi9wYXJhbXM6dWxwaV9mc19scyAgICAgICAgICAgICAgICAgICAgOiAwCi9zeXMva2VybmVs
L2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmhvc3Rfc3VwcG9ydF9mc19sc19sb3dfcG93
ZXIgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczpob3N0X2xz
X2xvd19wb3dlcl9waHlfY2xrICAgICA6IDAKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAw
LnVzYi9wYXJhbXM6YWN0aXZhdGVfc3RtX2ZzX3RyYW5zY2VpdmVyICAgOiAwCi9zeXMva2VybmVs
L2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmFjdGl2YXRlX3N0bV9pZF92Yl9kZXRlY3Rp
b24gIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAwMDAudXNiL3BhcmFtczp0c19kbGlu
ZSAgICAgICAgICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJuZWwvZGVidWcvdXNiL2M5MGMwMDAw
LnVzYi9wYXJhbXM6cmVsb2FkX2N0bCAgICAgICAgICAgICAgICAgICAgOiAxCi9zeXMva2VybmVs
L2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmFoYmNmZyAgICAgICAgICAgICAgICAgICAg
ICAgIDogMHhhCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOnVmcmFt
ZV9zY2hlZCAgICAgICAgICAgICAgICAgIDogMQovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpleHRlcm5hbF9pZF9waW5fY3RsICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6cG93ZXJfZG93biAgICAgICAgICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmxwbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpscG1fY2xvY2tfZ2F0aW5nICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6YmVzbCAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmhpcmRf
dGhyZXNob2xkX2VuICAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpoaXJkX3RocmVzaG9sZCAgICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6c2VydmljZV9pbnRlcnZhbCAgICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmhvc3Rf
ZG1hICAgICAgICAgICAgICAgICAgICAgIDogMQovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX2RtYSAgICAgICAgICAgICAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z19kbWFfZGVzYyAgICAgICAgICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmdfcnhf
Zmlmb19zaXplICAgICAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX25wX3R4X2ZpZm9fc2l6ZSAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z190eF9maWZvX3NpemVbMF0gICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmdfdHhf
Zmlmb19zaXplWzFdICAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX3R4X2ZpZm9fc2l6ZVsyXSAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z190eF9maWZvX3NpemVbM10gICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmdfdHhf
Zmlmb19zaXplWzRdICAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX3R4X2ZpZm9fc2l6ZVs1XSAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z190eF9maWZvX3NpemVbNl0gICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmdfdHhf
Zmlmb19zaXplWzddICAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX3R4X2ZpZm9fc2l6ZVs4XSAgICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z190eF9maWZvX3NpemVbOV0gICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmdfdHhf
Zmlmb19zaXplWzEwXSAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX3R4X2ZpZm9fc2l6ZVsxMV0gICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z190eF9maWZvX3NpemVbMTJdICAgICAg
ICAgICAgOiAwCi9zeXMva2VybmVsL2RlYnVnL3VzYi9jOTBjMDAwMC51c2IvcGFyYW1zOmdfdHhf
Zmlmb19zaXplWzEzXSAgICAgICAgICAgIDogMAovc3lzL2tlcm5lbC9kZWJ1Zy91c2IvYzkwYzAw
MDAudXNiL3BhcmFtczpnX3R4X2ZpZm9fc2l6ZVsxNF0gICAgICAgICAgICA6IDAKL3N5cy9rZXJu
ZWwvZGVidWcvdXNiL2M5MGMwMDAwLnVzYi9wYXJhbXM6Z190eF9maWZvX3NpemVbMTVdICAgICAg
ICAgICAgOiAwCg==
--00000000000066393605c603d101--
