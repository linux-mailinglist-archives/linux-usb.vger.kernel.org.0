Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCB42B2E2E
	for <lists+linux-usb@lfdr.de>; Sat, 14 Nov 2020 16:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgKNPmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 10:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgKNPmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Nov 2020 10:42:14 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8431C0613D1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2020 07:42:13 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y4so8387101edy.5
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2020 07:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=npiGIGHfo0dZ/gJfUbw66PLTWb4kNoip6xYi/kw3hZE=;
        b=DAGPGx7EwpKFYbyuSTWimBTGDBnVvUtACki8Qw0PaXp9nMvrQOZ0+Yw7/M3/lvK9bU
         J7zl8h8S9vEdyemzfjvKHjLJAOZWNfHBv73BXs2Ghy61/gelAjCDG6YSvBjdMKPDHuKA
         vztzdTpYVtf2VZv2bPDRRgi4r4+BK3MC1QbNe9gezGYlRvMXxqaRD3QG6TlQ+ceuFAm4
         /Cz9c3Y1MXNRvrAa9S/zhQ7iZEMopE5UslgwVK18FwM8z5uOCgnvOkS5Ahg/cDuzgNCg
         rwovGvs12NupjL4V31jMVmIEb9dzmXdQqW9BS33Rv0PtBhUC0hdQ33LxAIPJklOoha9f
         Cxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=npiGIGHfo0dZ/gJfUbw66PLTWb4kNoip6xYi/kw3hZE=;
        b=E4rEfVJv5bIbfAQNd/gD1MGw0Lpor1BB6jL+jo+1b5gcZ49+MwfmI1cS2jentHzV2L
         E8omN16EmmRWJx0XMiDNH0uNY3ua6WqLuPgqW5I5iFePbad/goz4V64AetS85nGJcOFg
         DV3w3UG1rC4W9fY5flsP2CBgGXMJU0kQbO/56ShIBdI5NdHDcrdPsF1tAQCbewo6tntw
         tj3gAIPrB9lDXDytemHsk3AFeSQgJJ7nW41kO0/prHVAfKrNv3BAKZ94gLCU8lfCbHt5
         4z9yZdfBNAxMm6uOT8Er9rMcQwUx26penncJ9mJMah3VqKbAh8aJGq5uPhwKhecYLe8k
         Ezyg==
X-Gm-Message-State: AOAM533C0+tDxD6PGYi0X7pQrfimW9pIXk20rn115nUUCGoraKvkeHWX
        90lPO1kL5DFg2b9Ii6OKEKmf1ZXHniS+C9k9LlnDl7/z
X-Google-Smtp-Source: ABdhPJzxylzVnTSZ39BIXpx2lgAvCyYLEDIQRgtOywdZp4GF6zz21Yq/ZiVq9mC5YOQbUtG+BncHX4jkqlH2mS7GDw4=
X-Received: by 2002:a05:6402:14cf:: with SMTP id f15mr7891186edx.18.1605368532263;
 Sat, 14 Nov 2020 07:42:12 -0800 (PST)
MIME-Version: 1.0
References: <CAFdiRoChCT4+mqPW71oWp1sBLxYKqaOiVHy+jHQ_en7-M_MXTQ@mail.gmail.com>
In-Reply-To: <CAFdiRoChCT4+mqPW71oWp1sBLxYKqaOiVHy+jHQ_en7-M_MXTQ@mail.gmail.com>
From:   Denis Valeev <lemniscattaden@gmail.com>
Date:   Sat, 14 Nov 2020 18:41:36 +0300
Message-ID: <CAFdiRoCmNcrAO9qcp3eOHeXom0GQoEACjy1aUTYXtLe3jRkFkA@mail.gmail.com>
Subject: Fwd: BUG REPORT: USB controller doesn't work after PC sleep
To:     linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000019c19005b412fde6"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000019c19005b412fde6
Content-Type: text/plain; charset="UTF-8"

Hello Mathias and Greg.

Sometimes my USB controller doesn't work after PC sleep. After such a
sleep, In journalctl I have these lines:

nov 11 21:02:40 q kernel: xhci_hcd 0000:06:00.1: xHCI host not
responding to stop endpoint command.
nov 11 21:02:40 q kernel: xhci_hcd 0000:06:00.1: USBSTS:
nov 11 21:02:40 q kernel: xhci_hcd 0000:06:00.1: xHCI host controller
not responding, assume dead
nov 11 21:02:40 q kernel: xhci_hcd 0000:06:00.1: HC died; cleaning up

This problem happens not after every sleep, about every third or
fourth. I noticed that the transition to problem sleep takes more time
than to a normal one.

I tried to switch different options related to USB in UEFI without any result.

My system:
Asus TUF Gaming X570-Plus (Wi-Fi), UEFI version is 2802 from 2020/10/23
Ryzen 3950X
ArchLinux with 5.9.8 kernel
External USB connected devices: mouse and keyboard only

Let me know if you need more information. If necessary, I can build a
debug version of the kernel.

BR,
Den

--00000000000019c19005b412fde6
Content-Type: text/plain; charset="US-ASCII"; name="usb_log.txt"
Content-Disposition: attachment; filename="usb_log.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_khhuft0m0>
X-Attachment-Id: f_khhuft0m0

MDkgMTc6NTE6MTcgcSBrZXJuZWw6IFBNOiBzdXNwZW5kIGVudHJ5IChkZWVwKQowOSAxNzo1MTox
NyBxIGtlcm5lbDogRmlsZXN5c3RlbXMgc3luYzogMC4wNDQgc2Vjb25kcwoxMSAyMTowMjo0MCBx
IGtlcm5lbDogRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMgLi4uIChlbGFwc2VkIDAuMDAx
IHNlY29uZHMpIGRvbmUuCjExIDIxOjAyOjQwIHEga2VybmVsOiBPT00ga2lsbGVyIGRpc2FibGVk
LgoxMSAyMTowMjo0MCBxIGtlcm5lbDogRnJlZXppbmcgcmVtYWluaW5nIGZyZWV6YWJsZSB0YXNr
cyAuLi4gKGVsYXBzZWQgMC4wMDAgc2Vjb25kcykgZG9uZS4KMTEgMjE6MDI6NDAgcSBrZXJuZWw6
IHByaW50azogU3VzcGVuZGluZyBjb25zb2xlKHMpICh1c2Ugbm9fY29uc29sZV9zdXNwZW5kIHRv
IGRlYnVnKQoxMSAyMTowMjo0MCBxIGtlcm5lbDogc2VyaWFsIDAwOjA0OiBkaXNhYmxlZAoxMSAy
MTowMjo0MCBxIGtlcm5lbDogc2QgNTowOjA6MDogW3NkYV0gU3luY2hyb25pemluZyBTQ1NJIGNh
Y2hlCjExIDIxOjAyOjQwIHEga2VybmVsOiBzZCA1OjA6MDowOiBbc2RhXSBTdG9wcGluZyBkaXNr
CjExIDIxOjAyOjQwIHEga2VybmVsOiBzZCA2OjA6MDowOiBbc2RiXSBTeW5jaHJvbml6aW5nIFND
U0kgY2FjaGUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNkIDY6MDowOjA6IFtzZGJdIFN0b3BwaW5n
IGRpc2sKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6MDY6MDAuMTogeEhDSSBo
b3N0IG5vdCByZXNwb25kaW5nIHRvIHN0b3AgZW5kcG9pbnQgY29tbWFuZC4KMTEgMjE6MDI6NDAg
cSBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6MDY6MDAuMTogVVNCU1RTOgoxMSAyMTowMjo0MCBxIGtl
cm5lbDogeGhjaV9oY2QgMDAwMDowNjowMC4xOiB4SENJIGhvc3QgY29udHJvbGxlciBub3QgcmVz
cG9uZGluZywgYXNzdW1lIGRlYWQKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHhoY2lfaGNkIDAwMDA6
MDY6MDAuMTogSEMgZGllZDsgY2xlYW5pbmcgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6
IFByZXBhcmluZyB0byBlbnRlciBzeXN0ZW0gc2xlZXAgc3RhdGUgUzMKMTEgMjE6MDI6NDAgcSBr
ZXJuZWw6IFBNOiBTYXZpbmcgcGxhdGZvcm0gTlZTIG1lbW9yeQoxMSAyMTowMjo0MCBxIGtlcm5l
bDogRGlzYWJsaW5nIG5vbi1ib290IENQVXMgLi4uCjExIDIxOjAyOjQwIHEga2VybmVsOiBJUlEg
MTE0OiBubyBsb25nZXIgYWZmaW5lIHRvIENQVTEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJv
b3Q6IENQVSAxIGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBJUlEgMTE1OiBu
byBsb25nZXIgYWZmaW5lIHRvIENQVTIKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQ
VSAyIGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBJUlEgMTE2OiBubyBsb25n
ZXIgYWZmaW5lIHRvIENQVTMKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSAzIGlz
IG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBJUlEgMTE3OiBubyBsb25nZXIgYWZm
aW5lIHRvIENQVTQKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSA0IGlzIG5vdyBv
ZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBJUlEgMTE4OiBubyBsb25nZXIgYWZmaW5lIHRv
IENQVTUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSA1IGlzIG5vdyBvZmZsaW5l
CjExIDIxOjAyOjQwIHEga2VybmVsOiBJUlEgMTE5OiBubyBsb25nZXIgYWZmaW5lIHRvIENQVTYK
MTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSA2IGlzIG5vdyBvZmZsaW5lCjExIDIx
OjAyOjQwIHEga2VybmVsOiBJUlEgMTIwOiBubyBsb25nZXIgYWZmaW5lIHRvIENQVTcKMTEgMjE6
MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSA3IGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQw
IHEga2VybmVsOiBJUlEgMTIxOiBubyBsb25nZXIgYWZmaW5lIHRvIENQVTgKMTEgMjE6MDI6NDAg
cSBrZXJuZWw6IHNtcGJvb3Q6IENQVSA4IGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2Vy
bmVsOiBJUlEgMTIyOiBubyBsb25nZXIgYWZmaW5lIHRvIENQVTkKMTEgMjE6MDI6NDAgcSBrZXJu
ZWw6IHNtcGJvb3Q6IENQVSA5IGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBJ
UlEgMTIzOiBubyBsb25nZXIgYWZmaW5lIHRvIENQVTEwCjExIDIxOjAyOjQwIHEga2VybmVsOiBz
bXBib290OiBDUFUgMTAgaXMgbm93IG9mZmxpbmUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJv
b3Q6IENQVSAxMSBpcyBub3cgb2ZmbGluZQoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDog
Q1BVIDEyIGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBDUFUg
MTMgaXMgbm93IG9mZmxpbmUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSAxNCBp
cyBub3cgb2ZmbGluZQoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQ1BVIDE1IGlzIG5v
dyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBDUFUgMTYgaXMgbm93IG9m
ZmxpbmUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSAxNyBpcyBub3cgb2ZmbGlu
ZQoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQ1BVIDE4IGlzIG5vdyBvZmZsaW5lCjEx
IDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBDUFUgMTkgaXMgbm93IG9mZmxpbmUKMTEgMjE6
MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSAyMCBpcyBub3cgb2ZmbGluZQoxMSAyMTowMjo0
MCBxIGtlcm5lbDogc21wYm9vdDogQ1BVIDIxIGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEg
a2VybmVsOiBzbXBib290OiBDUFUgMjIgaXMgbm93IG9mZmxpbmUKMTEgMjE6MDI6NDAgcSBrZXJu
ZWw6IHNtcGJvb3Q6IENQVSAyMyBpcyBub3cgb2ZmbGluZQoxMSAyMTowMjo0MCBxIGtlcm5lbDog
c21wYm9vdDogQ1BVIDI0IGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBi
b290OiBDUFUgMjUgaXMgbm93IG9mZmxpbmUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6
IENQVSAyNiBpcyBub3cgb2ZmbGluZQoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQ1BV
IDI3IGlzIG5vdyBvZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBDUFUgMjgg
aXMgbm93IG9mZmxpbmUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IENQVSAyOSBpcyBu
b3cgb2ZmbGluZQoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQ1BVIDMwIGlzIG5vdyBv
ZmZsaW5lCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBDUFUgMzEgaXMgbm93IG9mZmxp
bmUKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6IExvdy1sZXZlbCByZXN1bWUgY29tcGxldGUK
MTEgMjE6MDI6NDAgcSBrZXJuZWw6IFBNOiBSZXN0b3JpbmcgcGxhdGZvcm0gTlZTIG1lbW9yeQox
MSAyMTowMjo0MCBxIGtlcm5lbDogTFZUIG9mZnNldCAwIGFzc2lnbmVkIGZvciB2ZWN0b3IgMHg0
MDAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEVuYWJsaW5nIG5vbi1ib290IENQVXMgLi4uCjExIDIx
OjAyOjQwIHEga2VybmVsOiB4ODY6IEJvb3RpbmcgU01QIGNvbmZpZ3VyYXRpb246CjExIDIxOjAy
OjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgMSBBUElDIDB4
MgoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUxOiBwYXRjaF9sZXZlbD0weDA4
NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBcX1BSXy5DMDAyOiBGb3VuZCAyIGlk
bGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFUxIGlzIHVwCjExIDIxOjAyOjQwIHEg
a2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgMiBBUElDIDB4NAoxMSAy
MTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUyOiBwYXRjaF9sZXZlbD0weDA4NzAxMDIx
CjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBcX1BSXy5DMDA0OiBGb3VuZCAyIGlkbGUgc3Rh
dGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFUyIGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVs
OiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgMyBBUElDIDB4NgoxMSAyMTowMjo0
MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUzOiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIx
OjAyOjQwIHEga2VybmVsOiBBQ1BJOiBcX1BSXy5DMDA2OiBGb3VuZCAyIGlkbGUgc3RhdGVzCjEx
IDIxOjAyOjQwIHEga2VybmVsOiBDUFUzIGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBi
b290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgNCBBUElDIDB4OAoxMSAyMTowMjo0MCBxIGtl
cm5lbDogbWljcm9jb2RlOiBDUFU0OiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQw
IHEga2VybmVsOiBBQ1BJOiBcX1BSXy5DMDA4OiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAy
OjQwIHEga2VybmVsOiBDUFU0IGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBC
b290aW5nIE5vZGUgMCBQcm9jZXNzb3IgNSBBUElDIDB4YQoxMSAyMTowMjo0MCBxIGtlcm5lbDog
bWljcm9jb2RlOiBDUFU1OiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2Vy
bmVsOiBBQ1BJOiBcX1BSXy5DMDBBOiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEg
a2VybmVsOiBDUFU1IGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5n
IE5vZGUgMCBQcm9jZXNzb3IgNiBBUElDIDB4YwoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9j
b2RlOiBDUFU2OiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBB
Q1BJOiBcX1BSXy5DMDBDOiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVs
OiBDUFU2IGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUg
MCBQcm9jZXNzb3IgNyBBUElDIDB4ZQoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBD
UFU3OiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBc
X1BSXy5DMDBFOiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFU3
IGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9j
ZXNzb3IgOCBBUElDIDB4MTAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IG1pY3JvY29kZTogQ1BVODog
cGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8u
QzAxMDogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVOCBpcyB1
cAoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQm9vdGluZyBOb2RlIDAgUHJvY2Vzc29y
IDkgQVBJQyAweDEyCjExIDIxOjAyOjQwIHEga2VybmVsOiBtaWNyb2NvZGU6IENQVTk6IHBhdGNo
X2xldmVsPTB4MDg3MDEwMjEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6IFxfUFJfLkMwMTI6
IEZvdW5kIDIgaWRsZSBzdGF0ZXMKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IENQVTkgaXMgdXAKMTEg
MjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAxMCBB
UElDIDB4MTQKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IG1pY3JvY29kZTogQ1BVMTA6IHBhdGNoX2xl
dmVsPTB4MDg3MDEwMjEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6IFxfUFJfLkMwMTQ6IEZv
dW5kIDIgaWRsZSBzdGF0ZXMKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IENQVTEwIGlzIHVwCjExIDIx
OjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgMTEgQVBJ
QyAweDE2CjExIDIxOjAyOjQwIHEga2VybmVsOiBtaWNyb2NvZGU6IENQVTExOiBwYXRjaF9sZXZl
bD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBcX1BSXy5DMDE2OiBGb3Vu
ZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFUxMSBpcyB1cAoxMSAyMTow
Mjo0MCBxIGtlcm5lbDogc21wYm9vdDogQm9vdGluZyBOb2RlIDAgUHJvY2Vzc29yIDEyIEFQSUMg
MHgxOAoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUxMjogcGF0Y2hfbGV2ZWw9
MHgwODcwMTAyMQoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAxODogRm91bmQg
MiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVMTIgaXMgdXAKMTEgMjE6MDI6
NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAxMyBBUElDIDB4
MWEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IG1pY3JvY29kZTogQ1BVMTM6IHBhdGNoX2xldmVsPTB4
MDg3MDEwMjEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6IFxfUFJfLkMwMUE6IEZvdW5kIDIg
aWRsZSBzdGF0ZXMKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IENQVTEzIGlzIHVwCjExIDIxOjAyOjQw
IHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgMTQgQVBJQyAweDFj
CjExIDIxOjAyOjQwIHEga2VybmVsOiBtaWNyb2NvZGU6IENQVTE0OiBwYXRjaF9sZXZlbD0weDA4
NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBcX1BSXy5DMDFDOiBGb3VuZCAyIGlk
bGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFUxNCBpcyB1cAoxMSAyMTowMjo0MCBx
IGtlcm5lbDogc21wYm9vdDogQm9vdGluZyBOb2RlIDAgUHJvY2Vzc29yIDE1IEFQSUMgMHgxZQox
MSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUxNTogcGF0Y2hfbGV2ZWw9MHgwODcw
MTAyMQoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAxRTogRm91bmQgMiBpZGxl
IHN0YXRlcwoxMSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVMTUgaXMgdXAKMTEgMjE6MDI6NDAgcSBr
ZXJuZWw6IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAxNiBBUElDIDB4MQoxMSAy
MTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUxNjogcGF0Y2hfbGV2ZWw9MHgwODcwMTAy
MQoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAwMTogRm91bmQgMiBpZGxlIHN0
YXRlcwoxMSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVMTYgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJu
ZWw6IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAxNyBBUElDIDB4MwoxMSAyMTow
Mjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUxNzogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQox
MSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAwMzogRm91bmQgMiBpZGxlIHN0YXRl
cwoxMSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVMTcgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6
IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAxOCBBUElDIDB4NQoxMSAyMTowMjo0
MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUxODogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAy
MTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAwNTogRm91bmQgMiBpZGxlIHN0YXRlcwox
MSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVMTggaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNt
cGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAxOSBBUElDIDB4NwoxMSAyMTowMjo0MCBx
IGtlcm5lbDogbWljcm9jb2RlOiBDUFUxOTogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTow
Mjo0MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAwNzogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAy
MTowMjo0MCBxIGtlcm5lbDogQ1BVMTkgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJv
b3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAyMCBBUElDIDB4OQoxMSAyMTowMjo0MCBxIGtl
cm5lbDogbWljcm9jb2RlOiBDUFUyMDogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0
MCBxIGtlcm5lbDogQUNQSTogXF9QUl8uQzAwOTogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTow
Mjo0MCBxIGtlcm5lbDogQ1BVMjAgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6
IEJvb3RpbmcgTm9kZSAwIFByb2Nlc3NvciAyMSBBUElDIDB4YgoxMSAyMTowMjo0MCBxIGtlcm5l
bDogbWljcm9jb2RlOiBDUFUyMTogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0MCBx
IGtlcm5lbDogQUNQSTogXF9QUl8uQzAwQjogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0
MCBxIGtlcm5lbDogQ1BVMjEgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJv
b3RpbmcgTm9kZSAwIFByb2Nlc3NvciAyMiBBUElDIDB4ZAoxMSAyMTowMjo0MCBxIGtlcm5lbDog
bWljcm9jb2RlOiBDUFUyMjogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0MCBxIGtl
cm5lbDogQUNQSTogXF9QUl8uQzAwRDogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0MCBx
IGtlcm5lbDogQ1BVMjIgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJvb3Rp
bmcgTm9kZSAwIFByb2Nlc3NvciAyMyBBUElDIDB4ZgoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWlj
cm9jb2RlOiBDUFUyMzogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0MCBxIGtlcm5l
bDogQUNQSTogXF9QUl8uQzAwRjogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0MCBxIGtl
cm5lbDogQ1BVMjMgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJvb3Rpbmcg
Tm9kZSAwIFByb2Nlc3NvciAyNCBBUElDIDB4MTEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IG1pY3Jv
Y29kZTogQ1BVMjQ6IHBhdGNoX2xldmVsPTB4MDg3MDEwMjEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6
IEFDUEk6IFxfUFJfLkMwMTE6IEZvdW5kIDIgaWRsZSBzdGF0ZXMKMTEgMjE6MDI6NDAgcSBrZXJu
ZWw6IENQVTI0IGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5v
ZGUgMCBQcm9jZXNzb3IgMjUgQVBJQyAweDEzCjExIDIxOjAyOjQwIHEga2VybmVsOiBtaWNyb2Nv
ZGU6IENQVTI1OiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBB
Q1BJOiBcX1BSXy5DMDEzOiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVs
OiBDUFUyNSBpcyB1cAoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQm9vdGluZyBOb2Rl
IDAgUHJvY2Vzc29yIDI2IEFQSUMgMHgxNQoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2Rl
OiBDUFUyNjogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQ
STogXF9QUl8uQzAxNTogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0MCBxIGtlcm5lbDog
Q1BVMjYgaXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAw
IFByb2Nlc3NvciAyNyBBUElDIDB4MTcKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IG1pY3JvY29kZTog
Q1BVMjc6IHBhdGNoX2xldmVsPTB4MDg3MDEwMjEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6
IFxfUFJfLkMwMTc6IEZvdW5kIDIgaWRsZSBzdGF0ZXMKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IENQ
VTI3IGlzIHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQ
cm9jZXNzb3IgMjggQVBJQyAweDE5CjExIDIxOjAyOjQwIHEga2VybmVsOiBtaWNyb2NvZGU6IENQ
VTI4OiBwYXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBc
X1BSXy5DMDE5OiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFUy
OCBpcyB1cAoxMSAyMTowMjo0MCBxIGtlcm5lbDogc21wYm9vdDogQm9vdGluZyBOb2RlIDAgUHJv
Y2Vzc29yIDI5IEFQSUMgMHgxYgoxMSAyMTowMjo0MCBxIGtlcm5lbDogbWljcm9jb2RlOiBDUFUy
OTogcGF0Y2hfbGV2ZWw9MHgwODcwMTAyMQoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogXF9Q
Ul8uQzAxQjogRm91bmQgMiBpZGxlIHN0YXRlcwoxMSAyMTowMjo0MCBxIGtlcm5lbDogQ1BVMjkg
aXMgdXAKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IHNtcGJvb3Q6IEJvb3RpbmcgTm9kZSAwIFByb2Nl
c3NvciAzMCBBUElDIDB4MWQKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IG1pY3JvY29kZTogQ1BVMzA6
IHBhdGNoX2xldmVsPTB4MDg3MDEwMjEKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IEFDUEk6IFxfUFJf
LkMwMUQ6IEZvdW5kIDIgaWRsZSBzdGF0ZXMKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IENQVTMwIGlz
IHVwCjExIDIxOjAyOjQwIHEga2VybmVsOiBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNz
b3IgMzEgQVBJQyAweDFmCjExIDIxOjAyOjQwIHEga2VybmVsOiBtaWNyb2NvZGU6IENQVTMxOiBw
YXRjaF9sZXZlbD0weDA4NzAxMDIxCjExIDIxOjAyOjQwIHEga2VybmVsOiBBQ1BJOiBcX1BSXy5D
MDFGOiBGb3VuZCAyIGlkbGUgc3RhdGVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBDUFUzMSBpcyB1
cAoxMSAyMTowMjo0MCBxIGtlcm5lbDogQUNQSTogV2FraW5nIHVwIGZyb20gc3lzdGVtIHNsZWVw
IHN0YXRlIFMzCjExIDIxOjAyOjQwIHEga2VybmVsOiBzZCA2OjA6MDowOiBbc2RiXSBTdGFydGlu
ZyBkaXNrCjExIDIxOjAyOjQwIHEga2VybmVsOiBzZCA1OjA6MDowOiBbc2RhXSBTdGFydGluZyBk
aXNrCjExIDIxOjAyOjQwIHEga2VybmVsOiBzZXJpYWwgMDA6MDQ6IGFjdGl2YXRlZAoxMSAyMTow
Mjo0MCBxIGtlcm5lbDogbnZtZSBudm1lMDogU2h1dGRvd24gdGltZW91dCBzZXQgdG8gOCBzZWNv
bmRzCjExIDIxOjAyOjQwIHEga2VybmVsOiBudm1lIG52bWUwOiAzMi8wLzAgZGVmYXVsdC9yZWFk
L3BvbGwgcXVldWVzCjExIDIxOjAyOjQwIHEga2VybmVsOiBhdGExOiBTQVRBIGxpbmsgZG93biAo
U1N0YXR1cyAwIFNDb250cm9sIDMwMCkKMTEgMjE6MDI6NDAgcSBrZXJuZWw6IGF0YTY6IFNBVEEg
bGluayB1cCA2LjAgR2JwcyAoU1N0YXR1cyAxMzMgU0NvbnRyb2wgMzAwKQoxMSAyMTowMjo0MCBx
IGtlcm5lbDogYXRhNi4wMDogc3VwcG9ydHMgRFJNIGZ1bmN0aW9ucyBhbmQgbWF5IG5vdCBiZSBm
dWxseSBhY2Nlc3NpYmxlCjExIDIxOjAyOjQwIHEga2VybmVsOiBhdGE2LjAwOiBkaXNhYmxpbmcg
cXVldWVkIFRSSU0gc3VwcG9ydAoxMSAyMTowMjo0MCBxIGtlcm5lbDogYXRhNi4wMDogc3VwcG9y
dHMgRFJNIGZ1bmN0aW9ucyBhbmQgbWF5IG5vdCBiZSBmdWxseSBhY2Nlc3NpYmxlCjExIDIxOjAy
OjQwIHEga2VybmVsOiBhdGE2LjAwOiBkaXNhYmxpbmcgcXVldWVkIFRSSU0gc3VwcG9ydAoxMSAy
MTowMjo0MCBxIGtlcm5lbDogYXRhNi4wMDogY29uZmlndXJlZCBmb3IgVURNQS8xMzMKMTEgMjE6
MDI6NDAgcSBrZXJuZWw6IE9PTSBraWxsZXIgZW5hYmxlZC4KMTEgMjE6MDI6NDAgcSBrZXJuZWw6
IFJlc3RhcnRpbmcgdGFza3MgLi4uIAoxMSAyMTowMjo0MCBxIGtlcm5lbDogdXNiIDEtNTogVVNC
IGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMgoxMSAyMTowMjo0MCBxIGtlcm5lbDogZG9uZS4K
--00000000000019c19005b412fde6--
