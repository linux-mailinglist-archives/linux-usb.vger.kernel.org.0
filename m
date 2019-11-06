Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA82F1618
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731640AbfKFMcL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:32:11 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:44174 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731055AbfKFMcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:32:11 -0500
Received: by mail-io1-f69.google.com with SMTP id q13so17917405iot.11
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to
         :content-transfer-encoding;
        bh=3T09uIwIwU5DRUVmjKbkvsI0BQBJlkgqaWi2GtbOfkc=;
        b=gOcURa5OTbMzqsywJKFZaKf40gi+svMdFbuVLjxfqUDtofD6uuQb0O6dGpqDSJe12c
         hX9q/5UgaVtMu3sYDS3Z5BREtOpf6tU2RVl402SIAJ5PbKbXI4J3ZQb+9h5jGnp8jydL
         9Tts6QqM2y7jn8p3nvEny1ccNOjKpYrvlIxOMXyeCxf7p6Cde83ZYzN70fqM+3ZMQdJY
         yzwMi1eA0urs/p3TAqYftAPgA91wVc0zt4rJY30+d31oTntyOjTc4TscZDLzYEpzulLD
         QtqxApHZWoHLVquuuyXUSoJ8ko7hqXz95WDJo8MBY+w/JylHs2h6IirRDZw96llJo4yb
         YvOg==
X-Gm-Message-State: APjAAAUWPYmX2Ka2SD+bnkAsGosdeLfKcLhjrOI/D2nq3PHJnOZCeELt
        vJEBpAInPsB/pEUImOQdZOMbmJI42WdCBQk1tWCbHeqaihiL
X-Google-Smtp-Source: APXvYqwpEVq7BTZNdDKa0IvmpPBiN99qQV0liktGM/r5hF1MG15lgPMZRr51FIyEpW9+iHZZgtOmfjp86OjfpuxHrKJRBzN0ROks
MIME-Version: 1.0
X-Received: by 2002:a6b:9089:: with SMTP id s131mr33836149iod.107.1573043530199;
 Wed, 06 Nov 2019 04:32:10 -0800 (PST)
Date:   Wed, 06 Nov 2019 04:32:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d5795d0596acbc93@google.com>
Subject: BUG: bad host security descriptor; not enough data (2 vs 5 left)
From:   syzbot <syzbot+8a8429a8b80280ff1c80@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8sDQoNCnN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOg0KDQpIRUFEIGNv
bW1pdDogICAgYjFhYTlkODMgdXNiOiByYXc6IGFkZCByYXctZ2FkZ2V0IGludGVyZmFjZQ0KZ2l0
IHRyZWU6ICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUva2FzYW4uZ2l0IHVzYi1mdXp6
ZXINCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50
eHQ/eD0xNTNhMWY4YWUwMDAwMA0Ka2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL3gvLmNvbmZpZz94PTc5ZGU4MDMzMDAwM2I1ZjcNCmRhc2hib2FyZCBsaW5rOiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9OGE4NDI5YThiODAyODBmZjFj
ODANCmNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1lbnRh
bCkNCnN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJv
LnN5ej94PTEwODkzZmNjZTAwMDAwDQpDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9yZXByby5jP3g9MTViYmFhNjJlMDAwMDANCg0KSU1QT1JUQU5UOiBpZiB5
b3UgZml4IHRoZSBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNvbW1p
dDoNClJlcG9ydGVkLWJ5OiBzeXpib3QrOGE4NDI5YThiODAyODBmZjFjODBAc3l6a2FsbGVyLmFw
cHNwb3RtYWlsLmNvbQ0KDQp1c2IgMS0xOiBjb25maWcgMCBpbnRlcmZhY2UgMCBhbHRzZXR0aW5n
IDAgaGFzIDMgZW5kcG9pbnQgZGVzY3JpcHRvcnMsICANCmRpZmZlcmVudCBmcm9tIHRoZSBpbnRl
cmZhY2UgZGVzY3JpcHRvcidzIHZhbHVlOiA0DQp1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBmb3Vu
ZCwgaWRWZW5kb3I9MTNkYywgaWRQcm9kdWN0PTU2MTEsICANCmJjZERldmljZT00MC4xNQ0KdXNi
IDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTAsIFByb2R1Y3Q9MCwgU2VyaWFsTnVt
YmVyPTANCnVzYiAxLTE6IGNvbmZpZyAwIGRlc2NyaXB0b3I/Pw0KaHdhLWhjIDEtMTowLjA6IFdp
cmUgQWRhcHRlciB2MTA2LjUyIG5ld2VyIHRoYW4gZ3Jva2VkIHYxLjANCmh3YS1oYyAxLTE6MC4w
OiBGSVhNRTogVVNCX01BWENISUxEUkVOIHRvbyBsb3cgZm9yIFdVU0IgYWRhcHRlciAoMTk0IHBv
cnRzKQ0KdXNiIDEtMTogQlVHOiBiYWQgaG9zdCBzZWN1cml0eSBkZXNjcmlwdG9yOyBub3QgZW5v
dWdoIGRhdGEgKDIgdnMgNSBsZWZ0KQ0KdXNiIDEtMTogc3VwcG9ydGVkIGVuY3J5cHRpb24gdHlw
ZXM6IO+/ve+/vc+B77+977+977+9fO+/ve+/vc+B77+977+977+977+977+977+9z4Hvv73vv73v
v70NCnVzYiAxLTE6IEU6IGhvc3QgZG9lc24ndCBzdXBwb3J0IENDTS0xIGNyeXB0bw0KaHdhLWhj
IDEtMTowLjA6IENhbm5vdCBpbml0aWFsaXplIGludGVybmFsczogLTE5DQoNCg0KLS0tDQpUaGlz
IGJ1ZyBpcyBnZW5lcmF0ZWQgYnkgYSBib3QuIEl0IG1heSBjb250YWluIGVycm9ycy4NClNlZSBo
dHRwczovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgc3l6Ym90Lg0K
c3l6Ym90IGVuZ2luZWVycyBjYW4gYmUgcmVhY2hlZCBhdCBzeXprYWxsZXJAZ29vZ2xlZ3JvdXBz
LmNvbS4NCg0Kc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGJ1ZyByZXBvcnQuIFNlZToN
Cmh0dHBzOi8vZ29vLmdsL3Rwc21FSiNzdGF0dXMgZm9yIGhvdyB0byBjb21tdW5pY2F0ZSB3aXRo
IHN5emJvdC4NCnN5emJvdCBjYW4gdGVzdCBwYXRjaGVzIGZvciB0aGlzIGJ1ZywgZm9yIGRldGFp
bHMgc2VlOg0KaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3Rlc3RpbmctcGF0Y2hlcw0K
