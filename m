Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7CB2E2DE7
	for <lists+linux-usb@lfdr.de>; Sat, 26 Dec 2020 11:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgLZKIZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Dec 2020 05:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgLZKIY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Dec 2020 05:08:24 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9E0C061757
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 02:07:44 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id i18so5445115ioa.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 02:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=4TDnhn+5Zj+zfKQ9yarygW4xmSbmIVpUam2YaL6DjBo=;
        b=Pz0c6huXRoQZ7tnrMHU36Lu3BogM1LVNIdZkqGpA3ZniCPn+WExO4xPjD9PoB9koaL
         u9RPoyyZnQdMVQN80WxiNRhslFNiEzA8L2Iy/aEnQYvGlLlnGpQrwVBZz+Yz5U4NfXBa
         Mg4GWNhpQGcrx8g0I4Umw151Aw2ChPbPDEBH0gwR9RTeKO79k8RwlSr93Dgd2zijiPzW
         0NM2v53hbdatTPiGbamBlsoO7WiIVtzir/duquNd/cth23dz64nOPguZxuHvv5SkkIq7
         TQ9Y52g3wKdeHjsOgVqTJjuNNRmRMUA2vYyCl5F61ug9WM/f8kiMQAbavaQs3aNMW8eE
         ZxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=4TDnhn+5Zj+zfKQ9yarygW4xmSbmIVpUam2YaL6DjBo=;
        b=U9l7Z1RcBPpQOuRpxwEz8dOEAZ6Vi6DqVwT+pibWJvgrBTuInfnxQx9VqTDo7Ovnpb
         huEhme0UM/EJbKI3scKf9ZLHxCUH7psoxmvzKGvmKTTrsuO09EU0rc38tMTQDR83ATi6
         04R2Byqejqkgr/WAsDKozflvGV3WEkBfu2/ImWgBsPlKrNTA38ScU4QX0bJ8OzTtfCpc
         yWs86fA8GNIrI56Jcy+DsC+zuU6xKIxiMJocpkpahfCm9GBIhp0Eq14q+KJGj+8Ygwzr
         6Wz9JmnbejBAum6HU80wf4xKNhKhj2bwBm2L0JtK5muBOKIaoZdkSJ91xni8bSf5H5B7
         lCyQ==
X-Gm-Message-State: AOAM533iazKaAtF01Rx20MEUO317xuTetVytywBqHKHZvyD7Ma5Uw9tS
        8Ro1yJ1bPM4W3+G1gSo0u+34lnKdg9jiephr716Kp18boPfCKQ==
X-Google-Smtp-Source: ABdhPJyD1kHVHs2p2acH8am/D5O+dGy6Vg2frlijiwI8gGmC3wRKzkhwTszxiBKeG27/Rxe2XNTYCOhRvpvgECT20Pg=
X-Received: by 2002:a05:6638:48:: with SMTP id a8mr31689671jap.138.1608977263154;
 Sat, 26 Dec 2020 02:07:43 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHOZ9GSY7JCkooXP1oJ10_8GzHD--uuAFry_1jYDJOow@mail.gmail.com>
 <Pine.LNX.4.44L0.1606151149200.1914-100000@iolanthe.rowland.org>
 <CA+icZUWCnoBp8_Qcsxiua_en35YO7YGuc9aSmaNwNWc_RH8U=Q@mail.gmail.com>
 <87porhxwtt.fsf@nemi.mork.no> <CA+icZUW3p-QOGwoi9xj1pireghg26Tne34KZrS605soP9FWMpw@mail.gmail.com>
In-Reply-To: <CA+icZUW3p-QOGwoi9xj1pireghg26Tne34KZrS605soP9FWMpw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 26 Dec 2020 11:07:32 +0100
Message-ID: <CA+icZUUMhz3EuZpisegMzHPE1js_wE9DXdyvvLLymXN8JoRpFw@mail.gmail.com>
Subject: Re: Reset hanging Huawei USB-2.0 Internet stick
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Downloaded usbreset.c file from new OpenWrt Git repo (see [1])...
>
> $ wget "https://raw.githubusercontent.com/openwrt/openwrt/master/package/utils/usbreset/src/usbreset.c"
>
> ...compiled it successfully:
>
> $ gcc-10 -o usbreset usbreset.c
>

Debian/testing ships usbreset binary in usbutils package version
1:013-1 which supports to reset a USB device via VID:PID option.

# dpkg -S $(which usbreset)
usbutils: /usr/bin/usbreset

# /usr/bin/usbreset 12d1:1436
Resetting HUAWEI Mobile ... ok

- Sedat -

[1] https://raw.githubusercontent.com/openwrt/openwrt/master/package/utils/usbreset/src/usbreset.c
