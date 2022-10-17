Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1033E6013D1
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 18:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJQQpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 12:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJQQpt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 12:45:49 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20A64151C
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666025142;
        bh=oGC7i6J0lllAwNAFWqumKtkWzZVtLllpBSE7BelU+0Q=;
        h=X-UI-Sender-Class:From:Date:Subject:To;
        b=ajDadvSj1ud3ogVCwPPcWZduvFBDodC+11T5mQ2gSo9xLoQ3QkJO5kOQGJsU4Xg4w
         XsMHV2CF+bXshgxNklJd64l7RfucB7kjO7vNHK2knlOfDGRfPcF8M9uZ08oDVpmj3m
         bDBq4hXmMBnBId8Ib/i1hTjQyt7s/3FjeI5V6drw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mail-ej1-f48.google.com ([209.85.218.48]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mt75H-1ozXG321zF-00tWxe for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022
 18:45:42 +0200
Received: by mail-ej1-f48.google.com with SMTP id bj12so26199701ejb.13
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 09:45:42 -0700 (PDT)
X-Gm-Message-State: ACrzQf0yPhC4wzlmA4MhsA4Ay9vtQc+9IJSFzR1jtRqAXRg1vV3l9ycQ
        eK0W2tnfTLrad+/k61/g9pwVZ6gbMpKNMwWhrVs=
X-Google-Smtp-Source: AMsMyM6465ACdBoEVyXvNQSdSLjd16hRlliSIUsJInpGcxXYx/t96MzdYkd6dB2n1lryZ+vnZLOz93A4UYn72tGyI6Y=
X-Received: by 2002:a17:907:7244:b0:78d:cedc:7a9e with SMTP id
 ds4-20020a170907724400b0078dcedc7a9emr9203939ejc.600.1666025142105; Mon, 17
 Oct 2022 09:45:42 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Mon, 17 Oct 2022 18:45:30 +0200
X-Gmail-Original-Message-ID: <CABfF9mP99Wyu2bXipwyBXYn6SOJ+tJJ2oV_ejZkTLPRi5RyOXQ@mail.gmail.com>
Message-ID: <CABfF9mP99Wyu2bXipwyBXYn6SOJ+tJJ2oV_ejZkTLPRi5RyOXQ@mail.gmail.com>
Subject: Litra Glow on Linux
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ULDsCUezwS8eusFA8ozGKJIAJRHn3OG9UbFlcV5h0cBPwS0JNOt
 xmTe5vgVgqJKXDYQQ7FE9ZE2lnsq0PbP3kP6VPtPcTLu5sftOtjb4XTqhjQ1oVnFJvjFBg+
 klwMQrBFi8E6YVrDByOwqBCYxqBR40Sf266KE0Fly2T4LdbMg9HBDnxM/suOKDr8VrBcFq8
 MGyPwwlnYJIJTIBU/i5Zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T2JcBEBwnmU=:+OV9Eg7zPYmfaN7Yd+r9fB
 gpih2BL6yxGEI6SoyubNK4sEbK0kSyXhxP0J5PSvkyFkr+i46DnHa9AYnChxYicU0SXTE2ZO5
 dCcpBqKfNTvgzb+HQvX1LnIzkKYzog5wYF6730miAdVCfEKS20ZWbVnIUAUfrY1zxiXc25Un5
 gzYM1gCJnTtK0+9meE3nkXTV4Tbaf0RyK0y2Cvedm3In3IBVJmsREuJ+oytRZYt+hsq1jwb0V
 u2Gj0Fo9/PRzJMwwPUrDANdrR5qdHsct5VYqXR776MqvuhKNqE6cK1m2q4Iux50Ij9DLsxNAo
 eOkqev6Gx3fP3LpHJD1Z3ulQGffSsTZ6uX5490q1qYBYdP4KHr+4hiSiPlOiscXL3dzyl12jH
 QkQLXF2r1nmz7eomsxvk57Im56YXCKYNe17UOxulDqNpq+v2VAM7e1XAA0DuAmSOKfRjm8pqy
 5J/S4e6DmKerOATcqmBMugxfv6+pVN7wCux+SCQVpIyKqdgNFNONZpwOv5NC1Vj22eNHB1kjU
 fTlGVZO/jPJ8hZiMa/oMeL+TTLxLE9d5/eVlUcNpNH65Brh+NpBdntExWDlj5PJ6PkX8WWoLQ
 mCTlZrojy6Oc07mi0jnVySR9XOoR4spl/J+nW8HFxjTuDth4b6+uc9LzpwbOscRCsXSyvr08D
 f1Phs9KvxhuiNqO/NN6Ng+KYdiTZra4gIfACaw0AE4iaEw/6KtB4EV0AUN6+0N5+3UTGVh7hD
 VMxRmd9iJapUlhw+7j7L2e2wzgYYB0zmQuzkjhODj9YF8z0kff79Chfs7f5qHGPnmAmw3dJak
 p8PJFt0OByzh0IQki1QAQr0K/+aL1ppE3wzp3sO1coveCwmNrNJJ0kmcYxo4mXRmSUQPgOEBd
 /TCMBrZ3kmfUlIzv5PGyPcHPNeE74dG489IPovLXE3mee6njktd05PKRxcyFcwJTmsiH1uS8H
 JqIm77g6F/8yxAXRq3i3pCXQvBYLQr09DvoNfC0JuniKgxAtZSkb4C3T4ZDUX1pJW9BFXWft0
 o1mB3fBKn/ZQsYFH/CvjQScUc0upchUNvV6BRSjLt4h+35GloJMu7Ip60uj9fXCEoMOt1qB2O
 w7JjiucQ6SyStgpcKnhkrUsyXKao4r8XNuHWYZWtfejVqXPM9rdiQyzL6dhf0YMMclxvhqXHx
 aHrEexiq3sRDhmcFTGW1xXhr4x7y+gndWO5AyOpfhmq+R3xaMGT4TUNoXZO8x5xbq+dlim35P
 HXux+4xqAGDZs5etxkgKxjTXNbN0vc2ag8gfAwNGe06kUD6Mu37HyXm3g3slQo8WFtmhAnjQj
 p3QEIGMp6S4Hlfhyig/uPkbXSVz4TBZvvdVc5AZCqHx05DnY+n2984BGhNVqv0o7FIIFwqbs8
 QB/2kSCkkNM4kcIQf/WQhJLKWz1LDrcFihXJISWVhkwkSnfYBYXPOnZoVPpSvjhsfgOaq5Xgc
 AsW4Y0KaZf8TnPxD006zXddUvb5+wPpefmLtysRMogRDx4HYMIhqWbI3BSnTa+y/e/lEKWvOc
 tKOZHM+jOy50gmKfVmDJNVT1pIc5WzM9axwmlMnKaRcTH
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On my Ubuntu machine i am running 5.15.0. Now when I plugin in my
Logitech Litra Glow, it gets detected and the following shows up in my
dmesg:

```
input: Logi Litra Glow Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4.2/3-4.2:1.0/0003:046D:C900.00=
0B/input/input75
hid-generic 0003:046D:C900.000B: input,hiddev0,hidraw2: USB HID v1.11
Device [Logi Litra Glow] on usb-0000:00:14.0-4.2/input0
```

Via (hardware) buttons you can switch the device on, regulate the
color temperature as well as the brightness.
I know of no way to fully control the device from my computer and
would like to change that.

It seems to me like I need to solve 4 problems (in userspace and maybe
kernelspace):
1. Handle plugging in and off
2. Listen to events (button pressed) from the device
3. Get the current state of the device
4. Send events to the device


The device seems to provide a pretty bare HID Report interface with no
alternate configurations:
https://github.com/abergmeier/litra_glow_linux/blob/main/lsusb
The HID seems to define 3 Reports:
https://github.com/abergmeier/litra_glow_linux/blob/main/parsed_descriptor

Ignoring 1. for now.

Trying to solve 2. I wrote a basic HIDDEV application. Using `read` I
only see events from Report 17 (0x11). For all my experimenting with
the device I have never seen a Report 1 or 2.
So I get events, but it seems like the provided
`hiddev_usage_ref.value` is sometimes wrong (seems to be 0 and 1 for
most of the time even if I adjust the brightness).
Doing a recording (turning on, adjusting brightness, turning off) of
the raw HID events seems like the "correct" events are sent from the
device: https://github.com/abergmeier/litra_glow_linux/blob/main/hid-record=
er.
So it seems to me like maybe the values get mixed up somewhere in the HID c=
ode.
Alternatively I did a `evtest` run on the /dev/input/event* for the
`Logi Litra Glow Consumer Control`:
https://github.com/abergmeier/litra_glow_linux/blob/main/evtest
When pressing (hardware) buttons no events showed up in `evtest=C2=B4.
Probably not surprising since these would be from Report 1 and 2 IIUC.
Now I am not sure whether the USB interface is sketchy or whether one
needs to activate the _Consumer Control_ somehow.

Trying to solve 3. from what I understand with HID there usually is no
way of reading the current state of the device?

Trying to solve 4. there are userspace libraries in Python and Go
which send events to the device bypassing HID. So there may be some
quirks handling necessary in HID but I would defer that until 2. is
done.

With all that I am pretty much at my wits end and would appreciate any
input how to further analyze the device situation.

Cheers
