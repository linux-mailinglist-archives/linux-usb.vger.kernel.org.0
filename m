Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F7321E8B2
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 08:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgGNG5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 02:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgGNG5J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 02:57:09 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A47BC061755
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 23:57:09 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y2so16204921ioy.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 23:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEqM3Kk6BInJrzhuFtYQ/dCvLcq7Qh6rb6FLoHzVLzc=;
        b=Donu1wjoXrQsX1pILpkkyA0rN0SQQTpxz6CGP0MR07pL/HUwu/JQuRi5dDk4uYNyUZ
         lAwnTEg/So2Z5k99tAC3ApWctA/ORGiUZANJFXoJ8WzRmxQ5MdruWGb9BilR0hjIovnx
         s5D1mCFKe9Ao45I1LD2U7TP+vwe28+LRLjl5MhqaJ70V2+IG0M3UbWDe2z600+SScVrO
         Tygva+yv/Opp4BTuM5+Nmn+pkQD9o1pptZNDkLzSgTb4q5xMtkVXmFa1h49w5SduLLhJ
         LOK/ees8J3YW2O636JX+0WvfPZf3Yp5GfivpFTDroufTIaZk1amlbxeE7hzzZpFh20V+
         7UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEqM3Kk6BInJrzhuFtYQ/dCvLcq7Qh6rb6FLoHzVLzc=;
        b=Gt3PwguHNSa3RO27xzHog2RbICKksoBmKlOpDwg9nMKuWruG9D8LAnJjYqW3fE3v0Z
         TAknAXjeJgpoU+HM9GaGaNENSjeEZpIWXSjOzuC1Syn9M3VV5fCrcR1GBdFWuenaUflh
         5bVDmS37X9wycMKVqo/yA2PZwvK3kYr3HIlLwBmMRWTJAlSpoe9mahbD6jmARfZENc/h
         egit+RUYqzsLx6moL4R/PqVS9yje6XER3ylhZwL01Hf5Re1ys0OjGpTX+HfZD8xl32aa
         Dvs8nULSsh3mfm9+kqqNLGJcNsosmfxyA4Z51fOC50vlpazCaa9GsSNwP69EiQiemkn9
         ICCw==
X-Gm-Message-State: AOAM533sdzVTskT0JRyzagx5nO/SWRO3c2YGOQG3AlhveQl4w0pvkpPV
        1iotFtmiPe5q0Z0JzT/HNw0pJpHvYgh77yllMBlC+g==
X-Google-Smtp-Source: ABdhPJzxFLyzZSkmMi6sKjYolxyBPfiL3C7xSHANSDOzO4iRPPIcOKQ2TcpdMziW9tRf6lkZpJDJJ7ux1WaNfGSrDuU=
X-Received: by 2002:a05:6638:164a:: with SMTP id a10mr4476273jat.126.1594709828951;
 Mon, 13 Jul 2020 23:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com>
In-Reply-To: <20200713160522.19345-1-dan@dlrobertson.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Tue, 14 Jul 2020 12:26:57 +0530
Message-ID: <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="000000000000e00ede05aa6150f0"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000e00ede05aa6150f0
Content-Type: text/plain; charset="UTF-8"

hi Dan,

On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wrote:
>
> When testing suspend for another driver I noticed the following warning:
>
> WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> Hardware name: Hardkernel ODROID-N2 (DT)
> [..]
> pc : reset_control_assert+0x184/0x19c
> lr : dwc3_meson_g12a_suspend+0x68/0x7c
> [..]
> Call trace:
>  reset_control_assert+0x184/0x19c
>  dwc3_meson_g12a_suspend+0x68/0x7c
>  platform_pm_suspend+0x28/0x54
>  __device_suspend+0x590/0xabc
>  dpm_suspend+0x104/0x404
>  dpm_suspend_start+0x84/0x1bc
>  suspend_devices_and_enter+0xc4/0x4fc
>
> In my limited experience and knowlege it appears that we hit this
> because the reset control was switched to shared and the the use
> of the reset control was not changed.
>
> > * Calling reset_control_assert without first calling reset_control_deassert
> > * is not allowed on a shared reset control. Calling reset_control_reset is
> > * also not allowed on a shared reset control.
>
> The above snippet from reset_control_get_shared() seems to indicate that
> this is due to the use of reset_control_reset() in dwc3_meson_g12a_probe()
> and reset_control_deassert is not guaranteed to have been called
> before dwc3_meson_g12a_suspend() and reset_control_assert().
>
> After some basic tests with the following patch I no longer hit the
> warning. Comments and critiques on the patch are welcome. If there is a
> reason for the current use of the reset control, I'd love to learn why!
> Like I said before, I have not really looked at this driver before and
> have verify limited experience with reset controls... Was working on
> another driver, hit the warning, and thought I'd take a shot at the
> fix :-)
>
Thanks, I was also looking into this issue
So best Fix to this issue is to drop the call of reset_control_assert
from dwc3_meson_g12a_suspend
and drop the call of reset_control_deassert from dwc3_meson_g12a_resume
With these changes we do not see the warning on suspend and resume

Can you try this attached patch?

Best Regards
-Anand

--000000000000e00ede05aa6150f0
Content-Type: application/octet-stream; 
	name="0001-usb-dwc3-meson-g12a-drop-reset-controller-call-from-.patch"
Content-Disposition: attachment; 
	filename="0001-usb-dwc3-meson-g12a-drop-reset-controller-call-from-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kclkz4tk0>
X-Attachment-Id: f_kclkz4tk0

RnJvbSA4NDE1MDBjNzg0YWM1MjUzZTllYWY5YWZlY2Q2Y2UxMjVlOGJmMWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+CkRh
dGU6IFR1ZSwgMTQgSnVsIDIwMjAgMTI6MTM6MTcgKzA1MzAKU3ViamVjdDogW1BBVENIXSB1c2I6
IGR3YzM6IG1lc29uLWcxMmE6IGRyb3AgcmVzZXQgY29udHJvbGxlciBjYWxsIGZyb20KIHN1c3Bl
bmQgYW5kIHJlc3VtZQoKRHJvcCB0aGUgcmVzZXQgY29udHJvbGxlciBjYWxsIGZyb20gc3VzcGVu
ZCBhbmQgcmVzdW1lLgoKU2lnbmVkLW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMgfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEy
YS5jCmluZGV4IDFmN2Y0ZDg4ZWQ5ZC4uMGMwZWE1NTIxNWNiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1t
ZXNvbi1nMTJhLmMKQEAgLTg3Niw4ICs4NzYsNiBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IGR3YzNfbWVzb25fZzEyYV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJcGh5X2V4aXQo
cHJpdi0+cGh5c1tpXSk7CiAJfQogCi0JcmVzZXRfY29udHJvbF9hc3NlcnQocHJpdi0+cmVzZXQp
OwotCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTg4Niw4ICs4ODQsNiBAQCBzdGF0aWMgaW50IF9fbWF5
YmVfdW51c2VkIGR3YzNfbWVzb25fZzEyYV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCXN0
cnVjdCBkd2MzX21lc29uX2cxMmEgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQg
aSwgcmV0OwogCi0JcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yZXNldCk7Ci0KIAlyZXQg
PSBwcml2LT5kcnZkYXRhLT51c2JfaW5pdChwcml2KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwotLSAKMi4yNS4xCgo=
--000000000000e00ede05aa6150f0--
