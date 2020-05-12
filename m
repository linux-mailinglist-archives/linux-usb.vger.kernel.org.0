Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E241CFB24
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 18:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgELQnX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 12:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgELQnX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 12:43:23 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9D7C061A0C
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 09:43:23 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id c12so17793893oic.1
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=E/GITzgNQWPv3AeU6m1DJUdktJ6XPw1zlBPGKlEVQL8=;
        b=ueizuCk9m2qYVWHMdsAsKopkEKMfyeMrbuoCw2CpR5sMexeqyyA/YNgXOVpivTJnHa
         kjheqKoL5UUAt0h2HcSEstSD2exJmwzHmHcpevAlDgpDrmnmy1EyVC+tSH6SAEk3BXGF
         zbGVPGqOGV1BKvOA7xrCeqbD5M/V27CRC32yFfCiPm+F6f0+Ya+RLa9V8h+IUU1sp35a
         plYJmrQRBndnuN6616+JAOnPrdqb+EGGE0ktqLHFTR7JzggGCgAhGuv8TH4jvxsbjbBC
         BaUDCBdWzmJf7mh7Ri1oYbx+tiptG/VzcIkBMiC/aXo3UeUYfxuUZWY+UE4JtgyrwjBZ
         LONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=E/GITzgNQWPv3AeU6m1DJUdktJ6XPw1zlBPGKlEVQL8=;
        b=Vbq7UW1fEWebBjN9ed8g8zs/MMTJHq89BQy46Ph9GZGZPTqfqr5SuLKlrgavl81/Gj
         kKCrvmZNiJk2GiDtqY5sYICxzQuzC0CFmYyXOqp/euvxAvnmddZIeZTEXQ01G5/GWlpX
         vm+VhtKfGJ8T0Xl3NhKd+bfS6an7kGjC2U2HQAhP91kohPSguWu/a+UfR0/knmFrVRt/
         tVAlPQD0iLvW68ftthvJD7hmB+57X7qXt/vkiBxAOHiqffavNNH2S2Mmgch0YR0Az/a9
         dbdNH6jMRHEQMX2oxN7peSJq5GaCN8bfpcET4U5OV2iKPxDw831RRPZ5DBFMfu9kXRWK
         sD4w==
X-Gm-Message-State: AGi0Pubf9b19AgUvhXvp3ZmHXixXKkQwYjCAfHrjeUwAsu3ACWucnSdp
        giHCwo8glROUtOwhDhwa6OM5SntScYgsYqUeIKb2FrvZaTQ=
X-Google-Smtp-Source: APiQypLfQLwKNasT5yCOj9dheqgH/S3JlBfwbjJtzQSbgTj650gMD5tsw6B4MZaa/zlC76qnyi8Raj5npPX6cDHTUoA=
X-Received: by 2002:aca:efc5:: with SMTP id n188mr5768724oih.64.1589301802525;
 Tue, 12 May 2020 09:43:22 -0700 (PDT)
MIME-Version: 1.0
From:   Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Date:   Tue, 12 May 2020 22:13:10 +0530
Message-ID: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
Subject: sound over USB
To:     kernelnewbies <kernelnewbies@kernelnewbies.org>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 Hi all,

In my Linux machine, I connected the plantronics usb headset with mic
and I see(with the help of dmesg) that this device detected.



[116676.507868] usb 2-2: new full-speed USB device number 5 using xhci_hcd
[116676.923445] usb 2-2: New USB device found, idVendor=047f, idProduct=c012
 [116676.927091] usb 2-2: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
 [116676.934252] usb 2-2: Product: Plantronics .Audio 628 USB
 [116676.941445] usb 2-2: Manufacturer: Plantronics
 [116676.945731] usb 2-2: ep 0x84 - rounding interval to 64
microframes, ep desc says 80 microframes
 [116677.078071] hidraw: raw HID events driver (C) Jiri Kosina
 [116677.159669] usbcore: registered new interface driver usbhid
 [116677.161686] usbhid: USB HID core driver
 [116677.175458] input: Plantronics Plantronics .Audio 628 USB as
/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.3/0003:047F:C012.0001/input/input4
 [116677.234588] plantronics 0003:047F:C012.0001:
input,hiddev0,hidraw0: USB HID v1.00 Device [Plantronics Plantronics
.Audio 628 USB] on usb-0000:00:14.0-2/input3
 [116677.281756] usbcore: registered new interface driver snd-usb-audio

 The following nodes are present in the /dev/snd

$ ls -l /dev/snd/

total 0

drwxr-xr-x 2 root root       60 May 12 11:32 by-id

drwxr-xr-x 2 root root       60 May 12 11:32 by-path

crw-rw---- 1 root audio 116,  2 May 12 11:32 controlC1

crw-rw---- 1 root audio 116,  4 May 12 11:32 pcmC1D0c

crw-rw---- 1 root audio 116,  3 May 12 11:32 pcmC1D0p

crw-rw---- 1 root audio 116,  1 May 12 11:32 seq

crw-rw---- 1 root audio 116, 33 May 12 11:32 timer



What are all these devices present in /dev/snd

How do I use it for playing and recording an audio?

Basically first I want to gain knowledge on set of test cases I can
run on ALSA and then learn ALSA kernel modules stuff including
snd_usb_audio mdule.

So please guide me by providing related documentation/Steps.



Thanks,
