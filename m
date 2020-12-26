Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9832E2E0A
	for <lists+linux-usb@lfdr.de>; Sat, 26 Dec 2020 12:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgLZLH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Dec 2020 06:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgLZLH5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Dec 2020 06:07:57 -0500
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F09C061757
        for <linux-usb@vger.kernel.org>; Sat, 26 Dec 2020 03:07:16 -0800 (PST)
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 0BQB70nx011884
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 26 Dec 2020 12:07:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1608980821; bh=TokKdPgcg4hHBEpjsA1qaRG+DXLsRIJ8uc8fIRfkAvo=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=S1tX8V0ywaQge65eDYD9hMwHqGahgbQWP/Nk5xeGqdhryNGUtYBGlILRj7sZqQnHf
         AAWuEIZ8qPnRRPXUbkWeHjy+VSBa4REhBNRJsAqrtvFu75JYSa0kY7QN0r/xFAF4iD
         MdYZy0wMJ7sbewM7o7A92ZS9DltqH41vUA+QHBPo=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1kt7PX-000WSQ-WB; Sat, 26 Dec 2020 12:07:00 +0100
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Reset hanging Huawei USB-2.0 Internet stick
Organization: m
References: <CA+icZUWHOZ9GSY7JCkooXP1oJ10_8GzHD--uuAFry_1jYDJOow@mail.gmail.com>
        <Pine.LNX.4.44L0.1606151149200.1914-100000@iolanthe.rowland.org>
        <CA+icZUWCnoBp8_Qcsxiua_en35YO7YGuc9aSmaNwNWc_RH8U=Q@mail.gmail.com>
        <87porhxwtt.fsf@nemi.mork.no>
        <CA+icZUW3p-QOGwoi9xj1pireghg26Tne34KZrS605soP9FWMpw@mail.gmail.com>
        <CA+icZUUMhz3EuZpisegMzHPE1js_wE9DXdyvvLLymXN8JoRpFw@mail.gmail.com>
Date:   Sat, 26 Dec 2020 12:06:59 +0100
In-Reply-To: <CA+icZUUMhz3EuZpisegMzHPE1js_wE9DXdyvvLLymXN8JoRpFw@mail.gmail.com>
        (Sedat Dilek's message of "Sat, 26 Dec 2020 11:07:32 +0100")
Message-ID: <87czyw3jxo.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sedat Dilek <sedat.dilek@gmail.com> writes:

> Debian/testing ships usbreset binary in usbutils package version
> 1:013-1 which supports to reset a USB device via VID:PID option.
>
> # dpkg -S $(which usbreset)
> usbutils: /usr/bin/usbreset
>
> # /usr/bin/usbreset 12d1:1436
> Resetting HUAWEI Mobile ... ok

Yes, this was merged into usbutils a long time ago:
https://github.com/gregkh/usbutils/commit/c430d91f772a57083ddf3bcea4421262a=
76a049b



Bj=C3=B8rn
