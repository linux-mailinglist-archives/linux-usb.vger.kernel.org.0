Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A91C2AB553
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 11:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgKIKsV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 05:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgKIKsU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 05:48:20 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD549C0613CF
        for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2020 02:48:18 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id e7so7740581pfn.12
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2020 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=CnzmfXvdlYjB/xGhMH1s5X9mVREZjlgk00e3TCstA/c=;
        b=N7p1NWKdINfWv0+ikoXwYBA1+6Dl0H3Ul8D8ZRpULpKzClkUNIhhultYtn26GSebSa
         EzOw/zPRQh+x0rOuRGvYMbxGo8V33lrIHeoyJXqMXdA2d4t10Relai4vSyOLVr7WEjUr
         ysIoNjOGFhgNoRDR8slmiDsV0OY3kwTkcKbKwZm56isS6U6Hr49FTIbyFFXe7waOfeHe
         Q2dMz1y0S9ctQJ8Qcy8NnpqCUlC08GnwIM6Ymp+J/jTj1902Id+8JWsQLkl12F/wPzMK
         8K0qlaHm4jvdJo8mB/RQXNXc1b20mpmiuMSJ8DmQuJDcHGk+Am4GH+VRgcU61Zt93KeT
         5waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CnzmfXvdlYjB/xGhMH1s5X9mVREZjlgk00e3TCstA/c=;
        b=bTM+ku4K7S7tbdzNO44DpkhFLqw2wOJGT6Ax2tILumQcleS4/KpPZnQ/Aqlmz1VW8q
         +hbxt2nA/mL41NMXYs71toTTMc4RSkPKW2j2JljKGttkem9/6vB28Rqib4KgD7L9+Ni5
         Q1geHweIlp8+rxZ6/GAR+rbIdxqpXScrbTjoACt8t3IE5fa6GALWA0bAxKIFjjrNQq+3
         FFN9m9J+vJYuZeq8Kyy7JN34Il02O6hm5yOpHEZZJ9j42b/HAZFaB6B4AL+4KkKQBrHW
         0JmCENePkzOPfAM8G4k4kq6C/PPNAJ26kCAu4MTAqtHbSGG1MVpIpioY2NfwCvvlDfzt
         FJpQ==
X-Gm-Message-State: AOAM532Bb7M67hsXQtEZlUpbNFMSmOH+/bw7DaQihLfebdvKwnztOqJk
        WrO2jCRhcFd5+tixZQ9418kW9V1c6bNwSym4VxwjBgMT4PJVCw==
X-Google-Smtp-Source: ABdhPJxp8d2q0JLdOHqNRCVNO5df/bOkXaVRHfKkOJW0kVe5D9wL9q08aWQ2lnDyd07IvV1geawdriQjDL7+/VsIhV4=
X-Received: by 2002:a65:5c4c:: with SMTP id v12mr12568427pgr.119.1604918898093;
 Mon, 09 Nov 2020 02:48:18 -0800 (PST)
MIME-Version: 1.0
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Mon, 9 Nov 2020 20:48:06 +1000
Message-ID: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
Subject: Power supply detection issue caused by ucsi_psy?
To:     linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: multipart/mixed; boundary="000000000000d0cf5d05b3aa4ce0"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000d0cf5d05b3aa4ce0
Content-Type: text/plain; charset="UTF-8"

Good day everyone,

Since linux 5.8 I'm experiencing a problem related to power source
detection on my laptop. My machine is equipped with 2 typec ports, one
of them has power delivery and is used for charging, another one has
only data transfer capability. The issue is, when I unplug the power
cable, the OS is reporting something like "Battery at 100%, plugged in
but still discharging" (KDE Plasma notification) - whether another
port is used or not. I checked with upower, you can see the output for
kernel 5.4 and 5.10 attached. In brief, on 5.8 onwards I have some
"line_power_ucsi_source_psy_USBC000o001" device which is considered a
power supply and that prevents OS to switch to "battery mode" when
unplugging the cable, instead it thinks there's a power source but not
powerful enough to charge the battery, upower says this: "on-battery:
    no", but actually no ac power source is connected.
I did some research with git bisect up to the merge commit
`e611c0fe318c6d6827ee2bba660fbc23cf73f7dc` ("Merge tag 'usb-5.8-rc1'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb"), and
looked through its content. My wild guess based on upower output is
that a new driver introduced there, /drivers/usb/typec/ucsi/psy.c, is
responsible for this wrong behavior.

Could you please look into that based on info I'm providing?
Thank you!

-- 
----
Best regards,
Vladimir Yerilov

--000000000000d0cf5d05b3aa4ce0
Content-Type: text/plain; charset="US-ASCII"; name="upower_5.10.txt"
Content-Disposition: attachment; filename="upower_5.10.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_khaf56xu1>
X-Attachment-Id: f_khaf56xu1

RGV2aWNlOiAvb3JnL2ZyZWVkZXNrdG9wL1VQb3dlci9kZXZpY2VzL2xpbmVfcG93ZXJfQURQMAog
IG5hdGl2ZS1wYXRoOiAgICAgICAgICBBRFAwCiAgcG93ZXIgc3VwcGx5OiAgICAgICAgIHllcwog
IHVwZGF0ZWQ6ICAgICAgICAgICAgICBTdW4gMDggTm92IDIwMjAgMTU6Mjc6MzkgKzEwICg5NyBz
ZWNvbmRzIGFnbykKICBoYXMgaGlzdG9yeTogICAgICAgICAgbm8KICBoYXMgc3RhdGlzdGljczog
ICAgICAgbm8KICBsaW5lLXBvd2VyCiAgICB3YXJuaW5nLWxldmVsOiAgICAgICBub25lCiAgICBv
bmxpbmU6ICAgICAgICAgICAgICB5ZXMKICAgIGljb24tbmFtZTogICAgICAgICAgJ2FjLWFkYXB0
ZXItc3ltYm9saWMnCgpEZXZpY2U6IC9vcmcvZnJlZWRlc2t0b3AvVVBvd2VyL2RldmljZXMvYmF0
dGVyeV9CQVQwCiAgbmF0aXZlLXBhdGg6ICAgICAgICAgIEJBVDAKICB2ZW5kb3I6ICAgICAgICAg
ICAgICAgU1VOV09EQQogIG1vZGVsOiAgICAgICAgICAgICAgICBSMTVCMDFXCiAgc2VyaWFsOiAg
ICAgICAgICAgICAgIEFDRkEKICBwb3dlciBzdXBwbHk6ICAgICAgICAgeWVzCiAgdXBkYXRlZDog
ICAgICAgICAgICAgIFN1biAwOCBOb3YgMjAyMCAxNToyNzozOSArMTAgKDk3IHNlY29uZHMgYWdv
KQogIGhhcyBoaXN0b3J5OiAgICAgICAgICB5ZXMKICBoYXMgc3RhdGlzdGljczogICAgICAgeWVz
CiAgYmF0dGVyeQogICAgcHJlc2VudDogICAgICAgICAgICAgeWVzCiAgICByZWNoYXJnZWFibGU6
ICAgICAgICB5ZXMKICAgIHN0YXRlOiAgICAgICAgICAgICAgIGNoYXJnaW5nCiAgICB3YXJuaW5n
LWxldmVsOiAgICAgICBub25lCiAgICBlbmVyZ3k6ICAgICAgICAgICAgICA0Ni4xOTggV2gKICAg
IGVuZXJneS1lbXB0eTogICAgICAgIDAgV2gKICAgIGVuZXJneS1mdWxsOiAgICAgICAgIDQ2LjY2
NCBXaAogICAgZW5lcmd5LWZ1bGwtZGVzaWduOiAgNjAuMDQgV2gKICAgIGVuZXJneS1yYXRlOiAg
ICAgICAgIDIuMDU5IFcKICAgIHZvbHRhZ2U6ICAgICAgICAgICAgIDguNjcyIFYKICAgIHRpbWUg
dG8gZnVsbDogICAgICAgIDEzLjYgbWludXRlcwogICAgcGVyY2VudGFnZTogICAgICAgICAgOTkl
CiAgICBjYXBhY2l0eTogICAgICAgICAgICA3Ny43MjE1JQogICAgdGVjaG5vbG9neTogICAgICAg
ICAgbGl0aGl1bS1pb24KICAgIGljb24tbmFtZTogICAgICAgICAgJ2JhdHRlcnktZnVsbC1jaGFy
Z2luZy1zeW1ib2xpYycKICBIaXN0b3J5IChjaGFyZ2UpOgogICAgMTYwNDgxMzI1OQkwLjAwMAl1
bmtub3duCiAgSGlzdG9yeSAocmF0ZSk6CiAgICAxNjA0ODEzMjU5CTAuMDAwCXVua25vd24KCkRl
dmljZTogL29yZy9mcmVlZGVza3RvcC9VUG93ZXIvZGV2aWNlcy9saW5lX3Bvd2VyX3Vjc2lfc291
cmNlX3BzeV9VU0JDMDAwbzAwMQogIG5hdGl2ZS1wYXRoOiAgICAgICAgICB1Y3NpLXNvdXJjZS1w
c3ktVVNCQzAwMDowMDEKICBwb3dlciBzdXBwbHk6ICAgICAgICAgeWVzCiAgdXBkYXRlZDogICAg
ICAgICAgICAgIFN1biAwOCBOb3YgMjAyMCAxNToyNzozOSArMTAgKDk3IHNlY29uZHMgYWdvKQog
IGhhcyBoaXN0b3J5OiAgICAgICAgICBubwogIGhhcyBzdGF0aXN0aWNzOiAgICAgICBubwogIGxp
bmUtcG93ZXIKICAgIHdhcm5pbmctbGV2ZWw6ICAgICAgIG5vbmUKICAgIG9ubGluZTogICAgICAg
ICAgICAgIHllcwogICAgaWNvbi1uYW1lOiAgICAgICAgICAnYWMtYWRhcHRlci1zeW1ib2xpYycK
CkRldmljZTogL29yZy9mcmVlZGVza3RvcC9VUG93ZXIvZGV2aWNlcy9EaXNwbGF5RGV2aWNlCiAg
cG93ZXIgc3VwcGx5OiAgICAgICAgIHllcwogIHVwZGF0ZWQ6ICAgICAgICAgICAgICBTdW4gMDgg
Tm92IDIwMjAgMTU6Mjc6MzkgKzEwICg5NyBzZWNvbmRzIGFnbykKICBoYXMgaGlzdG9yeTogICAg
ICAgICAgbm8KICBoYXMgc3RhdGlzdGljczogICAgICAgbm8KICBiYXR0ZXJ5CiAgICBwcmVzZW50
OiAgICAgICAgICAgICB5ZXMKICAgIHN0YXRlOiAgICAgICAgICAgICAgIGNoYXJnaW5nCiAgICB3
YXJuaW5nLWxldmVsOiAgICAgICBub25lCiAgICBlbmVyZ3k6ICAgICAgICAgICAgICA0Ni4xOTgg
V2gKICAgIGVuZXJneS1mdWxsOiAgICAgICAgIDQ2LjY2NCBXaAogICAgZW5lcmd5LXJhdGU6ICAg
ICAgICAgMi4wNTkgVwogICAgdGltZSB0byBmdWxsOiAgICAgICAgMTMuNiBtaW51dGVzCiAgICBw
ZXJjZW50YWdlOiAgICAgICAgICA5OSUKICAgIGljb24tbmFtZTogICAgICAgICAgJ2JhdHRlcnkt
ZnVsbC1jaGFyZ2luZy1zeW1ib2xpYycKCkRhZW1vbjoKICBkYWVtb24tdmVyc2lvbjogIDAuOTku
MTEKICBvbi1iYXR0ZXJ5OiAgICAgIG5vCiAgbGlkLWlzLWNsb3NlZDogICBubwogIGxpZC1pcy1w
cmVzZW50OiAgeWVzCiAgY3JpdGljYWwtYWN0aW9uOiBIeWJyaWRTbGVlcAo=
--000000000000d0cf5d05b3aa4ce0
Content-Type: text/plain; charset="US-ASCII"; name="upower_5.10_bat.txt"
Content-Disposition: attachment; filename="upower_5.10_bat.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_khaf56wh0>
X-Attachment-Id: f_khaf56wh0

RGV2aWNlOiAvb3JnL2ZyZWVkZXNrdG9wL1VQb3dlci9kZXZpY2VzL2xpbmVfcG93ZXJfQURQMAog
IG5hdGl2ZS1wYXRoOiAgICAgICAgICBBRFAwCiAgcG93ZXIgc3VwcGx5OiAgICAgICAgIHllcwog
IHVwZGF0ZWQ6ICAgICAgICAgICAgICBTdW4gMDggTm92IDIwMjAgMTU6Mjk6MjUgKzEwICgxOCBz
ZWNvbmRzIGFnbykKICBoYXMgaGlzdG9yeTogICAgICAgICAgbm8KICBoYXMgc3RhdGlzdGljczog
ICAgICAgbm8KICBsaW5lLXBvd2VyCiAgICB3YXJuaW5nLWxldmVsOiAgICAgICBub25lCiAgICBv
bmxpbmU6ICAgICAgICAgICAgICBubwogICAgaWNvbi1uYW1lOiAgICAgICAgICAnYWMtYWRhcHRl
ci1zeW1ib2xpYycKCkRldmljZTogL29yZy9mcmVlZGVza3RvcC9VUG93ZXIvZGV2aWNlcy9iYXR0
ZXJ5X0JBVDAKICBuYXRpdmUtcGF0aDogICAgICAgICAgQkFUMAogIHZlbmRvcjogICAgICAgICAg
ICAgICBTVU5XT0RBCiAgbW9kZWw6ICAgICAgICAgICAgICAgIFIxNUIwMVcKICBzZXJpYWw6ICAg
ICAgICAgICAgICAgQUNGQQogIHBvd2VyIHN1cHBseTogICAgICAgICB5ZXMKICB1cGRhdGVkOiAg
ICAgICAgICAgICAgU3VuIDA4IE5vdiAyMDIwIDE1OjI5OjI1ICsxMCAoMTggc2Vjb25kcyBhZ28p
CiAgaGFzIGhpc3Rvcnk6ICAgICAgICAgIHllcwogIGhhcyBzdGF0aXN0aWNzOiAgICAgICB5ZXMK
ICBiYXR0ZXJ5CiAgICBwcmVzZW50OiAgICAgICAgICAgICB5ZXMKICAgIHJlY2hhcmdlYWJsZTog
ICAgICAgIHllcwogICAgc3RhdGU6ICAgICAgICAgICAgICAgZGlzY2hhcmdpbmcKICAgIHdhcm5p
bmctbGV2ZWw6ICAgICAgIG5vbmUKICAgIGVuZXJneTogICAgICAgICAgICAgIDQ2LjE5OCBXaAog
ICAgZW5lcmd5LWVtcHR5OiAgICAgICAgMCBXaAogICAgZW5lcmd5LWZ1bGw6ICAgICAgICAgNDYu
NjY0IFdoCiAgICBlbmVyZ3ktZnVsbC1kZXNpZ246ICA2MC4wNCBXaAogICAgZW5lcmd5LXJhdGU6
ICAgICAgICAgMS45OTggVwogICAgdm9sdGFnZTogICAgICAgICAgICAgOC40NCBWCiAgICB0aW1l
IHRvIGVtcHR5OiAgICAgICAyMy4xIGhvdXJzCiAgICBwZXJjZW50YWdlOiAgICAgICAgICA5OSUK
ICAgIGNhcGFjaXR5OiAgICAgICAgICAgIDc3LjcyMTUlCiAgICB0ZWNobm9sb2d5OiAgICAgICAg
ICBsaXRoaXVtLWlvbgogICAgaWNvbi1uYW1lOiAgICAgICAgICAnYmF0dGVyeS1mdWxsLXN5bWJv
bGljJwogIEhpc3RvcnkgKGNoYXJnZSk6CiAgICAxNjA0ODEzMzY1CTk5LjAwMAljaGFyZ2luZwog
IEhpc3RvcnkgKHJhdGUpOgogICAgMTYwNDgxMzM2NQkxLjk5OAljaGFyZ2luZwoKRGV2aWNlOiAv
b3JnL2ZyZWVkZXNrdG9wL1VQb3dlci9kZXZpY2VzL2xpbmVfcG93ZXJfdWNzaV9zb3VyY2VfcHN5
X1VTQkMwMDBvMDAxCiAgbmF0aXZlLXBhdGg6ICAgICAgICAgIHVjc2ktc291cmNlLXBzeS1VU0JD
MDAwOjAwMQogIHBvd2VyIHN1cHBseTogICAgICAgICB5ZXMKICB1cGRhdGVkOiAgICAgICAgICAg
ICAgU3VuIDA4IE5vdiAyMDIwIDE1OjI3OjM5ICsxMCAoMTI0IHNlY29uZHMgYWdvKQogIGhhcyBo
aXN0b3J5OiAgICAgICAgICBubwogIGhhcyBzdGF0aXN0aWNzOiAgICAgICBubwogIGxpbmUtcG93
ZXIKICAgIHdhcm5pbmctbGV2ZWw6ICAgICAgIG5vbmUKICAgIG9ubGluZTogICAgICAgICAgICAg
IHllcwogICAgaWNvbi1uYW1lOiAgICAgICAgICAnYWMtYWRhcHRlci1zeW1ib2xpYycKCkRldmlj
ZTogL29yZy9mcmVlZGVza3RvcC9VUG93ZXIvZGV2aWNlcy9EaXNwbGF5RGV2aWNlCiAgcG93ZXIg
c3VwcGx5OiAgICAgICAgIHllcwogIHVwZGF0ZWQ6ICAgICAgICAgICAgICBTdW4gMDggTm92IDIw
MjAgMTU6Mjk6MjUgKzEwICgxOCBzZWNvbmRzIGFnbykKICBoYXMgaGlzdG9yeTogICAgICAgICAg
bm8KICBoYXMgc3RhdGlzdGljczogICAgICAgbm8KICBiYXR0ZXJ5CiAgICBwcmVzZW50OiAgICAg
ICAgICAgICB5ZXMKICAgIHN0YXRlOiAgICAgICAgICAgICAgIGRpc2NoYXJnaW5nCiAgICB3YXJu
aW5nLWxldmVsOiAgICAgICBub25lCiAgICBlbmVyZ3k6ICAgICAgICAgICAgICA0Ni4xOTggV2gK
ICAgIGVuZXJneS1mdWxsOiAgICAgICAgIDQ2LjY2NCBXaAogICAgZW5lcmd5LXJhdGU6ICAgICAg
ICAgMS45OTggVwogICAgdGltZSB0byBlbXB0eTogICAgICAgMjMuMSBob3VycwogICAgcGVyY2Vu
dGFnZTogICAgICAgICAgOTklCiAgICBpY29uLW5hbWU6ICAgICAgICAgICdiYXR0ZXJ5LWZ1bGwt
c3ltYm9saWMnCgpEYWVtb246CiAgZGFlbW9uLXZlcnNpb246ICAwLjk5LjExCiAgb24tYmF0dGVy
eTogICAgICBubwogIGxpZC1pcy1jbG9zZWQ6ICAgbm8KICBsaWQtaXMtcHJlc2VudDogIHllcwog
IGNyaXRpY2FsLWFjdGlvbjogSHlicmlkU2xlZXAKCg==
--000000000000d0cf5d05b3aa4ce0--
