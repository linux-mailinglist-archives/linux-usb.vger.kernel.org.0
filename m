Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D99B1188F6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 13:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfLJM45 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 07:56:57 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40281 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfLJM45 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 07:56:57 -0500
Received: by mail-lf1-f67.google.com with SMTP id i23so1166249lfo.7
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 04:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=x2K6GCIMEJlItAHtOz2nbKLBm/RVX9lmHtoNzS4grYE=;
        b=Q/S5C46rysAQ/yBNrl2iB0b2CknU1Qr+Tw/vGwKLKYzR6qyzJDOA85dQQLP+/zrxvq
         2/UcyDNzp0jnETB6byo7xbPjMy/6E8D9De4I0qFjIxXpsSfwL8CZrMHPKjRa2A3Ugi2+
         9CvtpcjvnBQ8vewtsHSikloBeUtfqzkp4fwn6teyApWAD5VbjKsj/+ksrYtZSnXe5v6M
         ZsKqidOXu4WtpvDRyMN0T0+c/GL9esc7MZMKoGq55OzznLv3qYZEVWD+7ArP4jTZTq/n
         N2CFDzutroPZt9XK8rRZkdFddOpiE/VYddDu2RLSe5M/284c+q9Ymc8xtfaxQvWncNdl
         GdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=x2K6GCIMEJlItAHtOz2nbKLBm/RVX9lmHtoNzS4grYE=;
        b=Og+cWy8WSNBL6yx6Im3OSmZjGnlY4wWjmKhO7Oe1jko5sDZuLD4Cl0aHjANWteP7BM
         QT9WOvQEy59ItCclpRoaE68+TbP3rb6IfoU/rpolKHylA8qNS1eZwgyaZRd7ZQ+iSWC3
         m1KdSALgE54HlaPvMw4vA/cDWEktMc3tCEBTd+uT0fLQ5BJYEOfbdXVqwiaIafXLo1tG
         P4qk5wL+jLOkJMjwjXZL0bSc8EeAyi4x0ZhQFomSW6DIjzwkHMffM+AAEjsSpKP1mAH6
         pzIcDLBai6nrudUGbjUMrze4zYfwBHCbRUQBHI20SxX5AzIQBE2HGgNH2kH0G7Ubec30
         bCBA==
X-Gm-Message-State: APjAAAWy2HxWdXqN+2RLuR9FanyBnR9wMA9C7AreMXOkNAwNph2CH4Lu
        c/JRIS3i2CXw6h9ANvivgSwvc/ZO3EccNQ==
X-Google-Smtp-Source: APXvYqxP9xhl2vfRan+dBkjE/HZ2i7qigbAhe/aAoB3E4dyxt53tgHj0wOBH6tmbRy3tFtSFmi/+tg==
X-Received: by 2002:a19:be93:: with SMTP id o141mr15659348lff.181.1575982615002;
        Tue, 10 Dec 2019 04:56:55 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id d20sm1520662lfm.32.2019.12.10.04.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 04:56:54 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Properly set maxpacket limit
In-Reply-To: <021da5c9-d46a-0eaa-c545-2d98ce407bf7@synopsys.com>
References: <47eb7d52f0e361d64547460b45e48fcc87f13ece.1568080486.git.thinhn@synopsys.com> <e5c791b5514a25c1a84f53ac5360d149b26b1cbc.1568080486.git.thinhn@synopsys.com> <021da5c9-d46a-0eaa-c545-2d98ce407bf7@synopsys.com>
Date:   Tue, 10 Dec 2019 14:57:42 +0200
Message-ID: <87wob4jq2h.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Thinh Nguyen wrote:
>> Currently the calculation of max packet size limit for IN endpoints is
>> too restrictive. This prevents a matching of a capable hardware endpoint
>> during configuration. Below is the minimum recommended HW configuration
>> to support a particular endpoint setup from the databook:
>>
>> For OUT endpoints, the databook recommended the minimum RxFIFO size to
>> be at least 3x MaxPacketSize + 3x setup packets size (8 bytes each) +
>> clock crossing margin (16 bytes).
>>
>> For IN endpoints, the databook recommended the minimum TxFIFO size to be
>> at least 3x MaxPacketSize for endpoints that support burst. If the
>> endpoint doesn't support burst or when the device is operating in USB
>> 2.0 mode, a minimum TxFIFO size of 2x MaxPacketSize is recommended.
>>
>> Base on these recommendations, we can calculate the MaxPacketSize limit
>> of each endpoint. This patch revises the IN endpoint MaxPacketSize limit
>> and also sets the MaxPacketSize limit for OUT endpoints.
>>
>> Reference: Databook 3.30a section 3.2.2 and 3.2.3

<snip>

> I sent these couple of patches some time ago. When you have time, can=20
> you take a look and see if they can go on the next tree.

I don't seem to have these patches in my inbox anymore. Could you resend
on top of v5.5-rc1?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3vlkYACgkQzL64meEa
mQZT+xAAxhg8cjCSp7WFNo5to9id3yV67uSbnEOgF7iVrAjpNHu6mje9A35SiWt8
8yempfRPgG8xvBttUX39sfbVYy4WRqBoBc/MD7BHkAIs+KvS+VoWPB5xyqLYZUWZ
HYOi4BYdYLUZL3BTYx+G3jdT1/mbBShzc/llFT5ZZDtbT+nKjGFsK7VKjOWM+woQ
/uNWLpqPkkPAcEr82BqZaV1/PanKDjQkaQatK1oAAkHe3NE0VNs3xfsZTfNfonCq
x9WrIPjROeB70BuBILJwQFbnMX+DNnz3+tXqq6O2NJ0Rg+yBwdIyudDxgCXxwh1u
567iKdbFfyRjYtTs82TN18x5jPUX936BeNY/pKAlSXajNsEU5uFnbdYQVOGaFAYI
T991dgNi4WN6yaSjZXA+uRjmAwaUR4/fe2YoOhPnZ2nbKO3+wjr1esalyYAC9EJC
aKZ1U7caveYwr0J0alN+6mCfsXWTxw6BvnVXW2a0P3kfX53FfISEeHrbv0BOZyUH
/3SyClE0+PNBmmnKu8WhgINaMcTS/wBDT7RZQAh1ctxReszh3KN/iZPxisOLBj2k
fkY60vvIwIYmW1BwDg39F5wBjD5J6ci4mWN7EOY5usoiPxLIlK8UwlqRAoTT+PMR
PJSuE6lfZ1UVNEnc9zdYKlNcsd4LIj9i3Uw2j8LquBR6lK2oD60=
=BCjk
-----END PGP SIGNATURE-----
--=-=-=--
