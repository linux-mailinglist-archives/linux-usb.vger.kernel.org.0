Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673A0F77B9
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 16:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfKKPeK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 10:34:10 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:46227 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfKKPeJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Nov 2019 10:34:09 -0500
Received: by mail-io1-f69.google.com with SMTP id r4so13744759ioo.13
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2019 07:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to
         :content-transfer-encoding;
        bh=Eem3IaTbbSLwsUl9KTPHSC07uTZATLVtcwEUy7E4wPk=;
        b=XSz4sx2iYXo1ypISTCxwZlNVPDnugeLZ8wEnpnQQrcsPQYF6fRoa+BuluVMctGzpm5
         ZeaNghNKNlD6cSn1AqudRtYr3xPhKj5zbzZvnUBdTPqpb7UMcMtVbEBMrMb4AnIBknyF
         W7WA9JnqN3t9CD1RGujYIZn1Nw5e6tZV+9j0f0A370JZsDPRlQLw6YPrgPfkz9AnFlBd
         upiWf9uuHz6e+gTgm5xScpN+pV9IkJXRWnkCXKS1cT4YBnZHFaRnumzppDwdmMhyVaFm
         +pmwAgg8RNIBl2sZipYiUw8JuoPbFgQtUUTBd3HPr9Qonhg/lxgDxdPSgIO9olx+8gDM
         0Y1g==
X-Gm-Message-State: APjAAAUQfnfDXJPH8gDXG50NveIWGI4aFpZC2zNdyPoUy1M0JJdE1E43
        M9r9u+YTlpA01V1TD68okQz0VUR0/NF3447EGnADd3FuqgeY
X-Google-Smtp-Source: APXvYqwzOtpPSLcPHyFEB6tbhrOTMcZpApXLcuD4o4Hm5kiK+xr2mEgaBiZMdgAMi3AN9o8BiiysZZQhux/cS40TdFSXMuEB7ptk
MIME-Version: 1.0
X-Received: by 2002:a92:79d2:: with SMTP id u201mr31723321ilc.103.1573486448973;
 Mon, 11 Nov 2019 07:34:08 -0800 (PST)
Date:   Mon, 11 Nov 2019 07:34:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d9a391059713dc1f@google.com>
Subject: BUG: bad host security descriptor; not enough data (4 vs 5 left)
From:   syzbot <syzbot+d934a9036346e0215d8f@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8sDQoNCnN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOg0KDQpIRUFEIGNv
bW1pdDogICAgMzE4M2MwMzcgdXNiOiBnYWRnZXQ6IGFkZCByYXctZ2FkZ2V0IGludGVyZmFjZQ0K
Z2l0IHRyZWU6ICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUva2FzYW4uZ2l0IHVzYi1m
dXp6ZXINCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xv
Zy50eHQ/eD0xMjUyNWRjNmUwMDAwMA0Ka2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVy
LmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTc5ZGU4MDMzMDAwM2I1ZjcNCmRhc2hib2FyZCBsaW5r
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9ZDkzNGE5MDM2MzQ2ZTAy
MTVkOGYNCmNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1l
bnRhbCkNCnN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3Jl
cHJvLnN5ej94PTE0YWM3NDA2ZTAwMDAwDQpDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTNlZWEzOWFlMDAwMDANCg0KSU1QT1JUQU5UOiBp
ZiB5b3UgZml4IHRoZSBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNv
bW1pdDoNClJlcG9ydGVkLWJ5OiBzeXpib3QrZDkzNGE5MDM2MzQ2ZTAyMTVkOGZAc3l6a2FsbGVy
LmFwcHNwb3RtYWlsLmNvbQ0KDQp1c2IgMS0xOiBjb25maWcgMCBpbnRlcmZhY2UgMCBhbHRzZXR0
aW5nIDAgaGFzIDMgZW5kcG9pbnQgZGVzY3JpcHRvcnMsICANCmRpZmZlcmVudCBmcm9tIHRoZSBp
bnRlcmZhY2UgZGVzY3JpcHRvcidzIHZhbHVlOiA0DQp1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBm
b3VuZCwgaWRWZW5kb3I9MTNkYywgaWRQcm9kdWN0PTU2MTEsICANCmJjZERldmljZT0yZi4xNQ0K
dXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTAsIFByb2R1Y3Q9MCwgU2VyaWFs
TnVtYmVyPTANCnVzYiAxLTE6IGNvbmZpZyAwIGRlc2NyaXB0b3I/Pw0KaHdhLWhjIDEtMTowLjA6
IFdpcmUgQWRhcHRlciB2MTA2LjUyIG5ld2VyIHRoYW4gZ3Jva2VkIHYxLjANCmh3YS1oYyAxLTE6
MC4wOiBGSVhNRTogVVNCX01BWENISUxEUkVOIHRvbyBsb3cgZm9yIFdVU0IgYWRhcHRlciAoMTk0
IHBvcnRzKQ0KdXNiIDEtMTogQlVHOiBiYWQgaG9zdCBzZWN1cml0eSBkZXNjcmlwdG9yOyBub3Qg
ZW5vdWdoIGRhdGEgKDQgdnMgNSBsZWZ0KQ0KdXNiIDEtMTogc3VwcG9ydGVkIGVuY3J5cHRpb24g
dHlwZXM6IO+/vVMD0IHvv73vv73vv718YwPQge+/ve+/ve+/ve+/vWMD0IHvv73vv73vv70NCnVz
YiAxLTE6IEU6IGhvc3QgZG9lc24ndCBzdXBwb3J0IENDTS0xIGNyeXB0bw0KaHdhLWhjIDEtMTow
LjA6IFdpcmVsZXNzIFVTQiBIV0EgaG9zdCBjb250cm9sbGVyDQpod2EtaGMgMS0xOjAuMDogbmV3
IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAxMQ0KDQoNCi0tLQ0KVGhp
cyBidWcgaXMgZ2VuZXJhdGVkIGJ5IGEgYm90LiBJdCBtYXkgY29udGFpbiBlcnJvcnMuDQpTZWUg
aHR0cHM6Ly9nb28uZ2wvdHBzbUVKIGZvciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN5emJvdC4N
CnN5emJvdCBlbmdpbmVlcnMgY2FuIGJlIHJlYWNoZWQgYXQgc3l6a2FsbGVyQGdvb2dsZWdyb3Vw
cy5jb20uDQoNCnN5emJvdCB3aWxsIGtlZXAgdHJhY2sgb2YgdGhpcyBidWcgcmVwb3J0LiBTZWU6
DQpodHRwczovL2dvby5nbC90cHNtRUojc3RhdHVzIGZvciBob3cgdG8gY29tbXVuaWNhdGUgd2l0
aCBzeXpib3QuDQpzeXpib3QgY2FuIHRlc3QgcGF0Y2hlcyBmb3IgdGhpcyBidWcsIGZvciBkZXRh
aWxzIHNlZToNCmh0dHBzOi8vZ29vLmdsL3Rwc21FSiN0ZXN0aW5nLXBhdGNoZXMNCg==
