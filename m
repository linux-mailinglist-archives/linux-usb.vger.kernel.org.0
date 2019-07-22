Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7EF70B66
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 23:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730536AbfGVVbU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 17:31:20 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:35902 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbfGVVbU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 17:31:20 -0400
Received: by mail-ed1-f52.google.com with SMTP id k21so41918226edq.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2019 14:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rohanlean.de; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version;
        bh=zx/3OX/FhNtnxv6l1ChVLsxrN24UCaSNAx5y3Md+w5k=;
        b=b1XW/FVWBXf2qdW+jwXt65hCShhq30CZkqJUsgoKPEQoTRpRYAgCWj5RTCDx0qLW1/
         tvNmDbinAu/HtAtmRt40cU9TsupdTZIjCGbONwRHHCGY34VsGsV913ULv2ySpk5n5SE9
         K6Ro+X4mQUvlN332y2EriXZyDRjC7sc3/F17x99hzn9DxfIMdlMxjHVFTd/UGJSzSUUF
         vJW8qPrtyRfJT52vJVGlEFTlv2NQ5e7pGopZ5dOiB2+E+vJLrSusmWXXlToNFVEMq7KG
         jQoWLGT4HBHrXGwxCuF0Rmdvs1xldOQt3ws0ei3PIRWcvpXh/sSvHzcmVfmzi2b7M8tQ
         Y+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version;
        bh=zx/3OX/FhNtnxv6l1ChVLsxrN24UCaSNAx5y3Md+w5k=;
        b=hyo0AJkYPfzj+qT3wZ2qRr8buEpVOZasScyPXHYmLTiuZjOfk0K4wIFkxaThdGeOK6
         ckywSeCb4VOMaU/cwz4jGM9e+Wtft+ccuAbS3r5cWQfUt0qh2LBrXGLv4BRBqiH1lOSA
         8S1i4xJFttP3QHCw76HMb5RTfLv2rrDlG4z+giCoF1O1wyk3+itDOWACYu76F7ePw3ak
         /Gvg6WVoBfAj0czcONb3tVM11qxoFgwrzO9K6lHH9xz1+SkaezoC1JL0+vK9oHahbZTS
         NLTUp9EFrDuqAhUcgNpREsQ0q8pAAJZfbHi58LRoi52OvZKaetwBbNnEGBsmbMw3Yx3b
         Zu8g==
X-Gm-Message-State: APjAAAVr002cHNzmngzIlSt+UVLQoG9qx73/o4x/hx9wS0PMIWArk+AM
        hYS/t3nNz+ApA+FmLpfT9F7Iahq/mFA=
X-Google-Smtp-Source: APXvYqyZsBy2AJda2lR8T9KJrLemBbQZ3c5w39N2PI2VNDYjoY2vm10jt2sCCFeD7PwLSqC03cATWQ==
X-Received: by 2002:a50:f982:: with SMTP id q2mr62498531edn.270.1563831078771;
        Mon, 22 Jul 2019 14:31:18 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96bf:f239:db96:22ef:529:30a1? ([2a02:8108:96bf:f239:db96:22ef:529:30a1])
        by smtp.gmail.com with ESMTPSA id x8sm11464531edx.67.2019.07.22.14.31.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 14:31:18 -0700 (PDT)
Message-ID: <e63353a229a3fc61c2467a87a12064ac876e87b3.camel@rohanlean.de>
Subject: Enumeration of USB keyboard connected to dock fails during boot
From:   Rohan Hendrik Jotz-Lean <rohan@rohanlean.de>
To:     linux-usb@vger.kernel.org
Date:   Mon, 22 Jul 2019 23:31:17 +0200
Content-Type: multipart/mixed; boundary="=-VskOqwfWX7uXuM70FpJt"
User-Agent: Evolution 3.32.4 (by Flathub.org) 
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-VskOqwfWX7uXuM70FpJt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I have a USB keyboard that works in UEFI apps (and grub) but if plugged
into a dock stops working when Linux boots. It works when hotplugged
into the dock or plugged into the laptop directly before or after
booting. A mouse plugged into the dock does not share this problem. (I
have no other keyboard to test at hand.)

Kernel version: 5.1.18-300.fc30.x86_64
XHCI USB controller: Advanced Micro Devices, Inc. [AMD] Raven USB 3.1
Hub: 17ef:a38f Lenovo USB2.0 Hub
Keyboard: 04d9:0192 Holtek Semiconductor, Inc. USB-HID Keyboard

Relevant kernel messages are attached.

My ignorant initial thought is that the hub should be transparent to
the keyboard, so that the fault is unlikely to lie with the keyboard. I
have unsuccessfully tried the delayed initialisation quirk on the
keyboard.

I have asked the Fedora kernel developers about this problem first --
they told me to ask here.


Thanks for your help.

--=-VskOqwfWX7uXuM70FpJt
Content-Disposition: attachment; filename="kernel_messages.txt"
Content-Type: text/plain; name="kernel_messages.txt"; charset="UTF-8"
Content-Transfer-Encoding: base64

SnVsIDIyIDE5OjE2OjE0IGtlcm5lbDogdXNiIDItMS4zLjMuMzogbmV3IGZ1bGwtc3BlZWQgVVNC
IGRldmljZSBudW1iZXIgOSB1c2luZyB4aGNpX2hjZApKdWwgMjIgMTk6MTY6MTQga2VybmVsOiB1
c2IgMi0xLjMuMy4zOiBkZXZpY2UgZGVzY3JpcHRvciByZWFkLzY0LCBlcnJvciAtMzIKSnVsIDIy
IDE5OjE2OjE0IGtlcm5lbDogdXNiIDItMS4zLjMuMzogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82
NCwgZXJyb3IgLTMyCkp1bCAyMiAxOToxNjoxNSBrZXJuZWw6IHVzYiAyLTEuMy4zLjM6IG5ldyBm
dWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDEwIHVzaW5nIHhoY2lfaGNkCkp1bCAyMiAxOTox
NjoxNSBrZXJuZWw6IHVzYiAyLTEuMy4zLjM6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvNjQsIGVy
cm9yIC0zMgpKdWwgMjIgMTk6MTY6MTUga2VybmVsOiB1c2IgMi0xLjMuMy4zOiBkZXZpY2UgZGVz
Y3JpcHRvciByZWFkLzY0LCBlcnJvciAtMzIKSnVsIDIyIDE5OjE2OjE1IGtlcm5lbDogdXNiIDIt
MS4zLjMtcG9ydDM6IGF0dGVtcHQgcG93ZXIgY3ljbGUKSnVsIDIyIDE5OjE2OjE1IGtlcm5lbDog
dXNiIDItMS4zLjMuMzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTEgdXNpbmcg
eGhjaV9oY2QKSnVsIDIyIDE5OjE2OjE1IGtlcm5lbDogdXNiIDItMS4zLjMuMzogRGV2aWNlIG5v
dCByZXNwb25kaW5nIHRvIHNldHVwIGFkZHJlc3MuCkp1bCAyMiAxOToxNjoxNiBrZXJuZWw6IHVz
YiAyLTEuMy4zLjM6IERldmljZSBub3QgcmVzcG9uZGluZyB0byBzZXR1cCBhZGRyZXNzLgpKdWwg
MjIgMTk6MTY6MTYga2VybmVsOiB1c2IgMi0xLjMuMy4zOiBkZXZpY2Ugbm90IGFjY2VwdGluZyBh
ZGRyZXNzIDExLCBlcnJvciAtNzEKSnVsIDIyIDE5OjE2OjE2IGtlcm5lbDogdXNiIDItMS4zLjMu
MzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTIgdXNpbmcgeGhjaV9oY2QKSnVs
IDIyIDE5OjE2OjE2IGtlcm5lbDogdXNiIDItMS4zLjMuMzogRGV2aWNlIG5vdCByZXNwb25kaW5n
IHRvIHNldHVwIGFkZHJlc3MuCkp1bCAyMiAxOToxNjoxNiBrZXJuZWw6IHVzYiAyLTEuMy4zLjM6
IERldmljZSBub3QgcmVzcG9uZGluZyB0byBzZXR1cCBhZGRyZXNzLgpKdWwgMjIgMTk6MTY6MTYg
a2VybmVsOiB1c2IgMi0xLjMuMy4zOiBkZXZpY2Ugbm90IGFjY2VwdGluZyBhZGRyZXNzIDEyLCBl
cnJvciAtNzEKSnVsIDIyIDE5OjE2OjE2IGtlcm5lbDogdXNiIDItMS4zLjMtcG9ydDM6IHVuYWJs
ZSB0byBlbnVtZXJhdGUgVVNCIGRldmljZQoK


--=-VskOqwfWX7uXuM70FpJt--

