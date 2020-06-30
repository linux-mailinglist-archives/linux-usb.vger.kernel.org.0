Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1520D20F2F6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 12:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732619AbgF3KrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 06:47:22 -0400
Received: from mout.web.de ([212.227.15.3]:36763 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732510AbgF3KrU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jun 2020 06:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593514025;
        bh=bW0dU0D65jfP7kb5Hr9vfPa9nw3+9XUubQ8AWpz+DnA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=qfVS7SLNwC/ErM638VtVhsKOnvmBPGWa7AYhZSgbZJFhDVU6RUB0YWvh6GyJUoCTA
         596cUESPNCzZtRZN4qoV3dvBiVEwrfAtrXlatg0UoSbvB9K5V/xWrJU/343NpugHz5
         K0gKGknLYficofLUde2ulJVoydeZadhEQsuIH8aA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.105.212]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrfou-1j55GX2eo8-00neTl; Tue, 30
 Jun 2020 12:47:05 +0200
Subject: Re: [PATCH v2] usb: mtu3: Fix NULL pointer dereferences
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <83ce087e-9da9-a8e1-8872-8520ccfc4108@web.de>
Date:   Tue, 30 Jun 2020 12:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/rGr2Nx4vkPR57gCHYowrZOB8KWU+aTDjhBY6NYTxgX3lg6M6rf
 k3omu3Jszm19XWe4Tj558zLVMPfOZs4MaKn9V10eBpFM3ODC1tvKRDUmgjmwpEB+lQxmGFw
 iGqAWmKnOZMPjEY41s1HYcCT3T3Z4ooNAWAejF1zBxttVd2ktlDhDUjUDIBTTVFcFW/iDkH
 vioNBP6OcmbMtyLLKZh7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CQjErKL30T8=:jAQgQ5tHJAD+GSPqjruEma
 u99s4AhkkCL3I0MYUx/fDZ4kuOkzoSpZ1/zAAviTGLxAUhsXn2vkRjoRINNFcflBc4L8p2euH
 oExPWU3PoMTiPtV4xNM8IFS9vLVY4oZqMBHlKQcGuStf/9UHZRUJ33qvqcQPaVZel2EXwtol6
 bC6E6Iw79UYjJsugaR40i95NSYOkfg8fR0SapLZwi2StQoSkKDeysoqI9VhGl0uCqg2rd9Ppf
 qK+bHOprwHu8zpiJrP2Hn9qdPF1J7fHyY7Fe4YplxA3iAbkttg+eJjHetMz+KrM6SoOs+m93K
 a53/FqxziQtS85GvSq1apC9GAK9HAmD4ZKVd+OQI5X32qKUdJnxie1avd38dKIWciTvtiaFDn
 LB9owCbiGsbbbnFgpFjOvxbVBlQl6UIRa2Dc/L0KVOKakG4wXgFoBiczU1s+0VsV5xF2ecolU
 93/XolrTRQlskm4DuC8Yo+xbNwNo2pFthrEMqSGvYN9b73xXxSvFpHW0cB4DxndyXrT5oXNsH
 e7M4kwHufd8ufUqKdjEvbn87klUt32CnaR1YCBfVDrVnUZTiFU4EbR/eQA6NSuC70/eOo0ah1
 SEIp81tPgiErpazD/so0ZeNUoEJYPZ5sCzG7+MgDmbdGJBolyvNlB+lkzSPdrsWffcey/oFoC
 9lP+JHZSqo4gwx4/EcRDZMS5tlqgzk0Twr+WgPzmQyUUUbDYlqTcrGZy0SBTEM6eVDAICsrs7
 8dY1pJKI6S8CFT8ku6z9tbcj4EYUIx6KVnkWzEcPWWPt2bDYE6/ZvwVM0c3/1jct0NWuSPRPI
 MA0jD47C2yKcviFPXjBpgD4SnMtt7ErUCXeJEWCXMnFKDhIT0wjnKkXWRo9oTfhARQzuRon7z
 bDi7G4zXrSoJ0DvKsNZWq95BT5VT5Fsqwfrj2kUZloTbJNHH1p4nQFgNFjUAQ3PWysA5+HAQ1
 UXOuGTNWP00B9gzmt7f1reBAdLXxDIiKG6wrHzUUvHdKWz0O/ytj76Su7GchG3vJ+Ku1BTKL/
 UsaEUYcBljVo9ikGkMjKTdEmMaXy9dOr91zJQrKOuMm+JHgyE5js7Zr4oJp0r+5HXp96/V5xN
 uvc6buOwhodzdsAILUDgWPASFJ3X6aNBSvbuxGoaxJblk04indRtEHmLwLK1V5mclaGISJ1ft
 IFHlkoZzS8mDcebl6XGNTbGNt6TTyO5S7GtCAjK5IGR/CIJi+cQ4sCXUQR8B2OljbtEyzHiQJ
 g0V69yEXyyThKkEmR
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Some pointers are dereferenced before successful checks.

I propose to reconsider and improve also this change description.

* Would a null pointer dereference be possible only with the variables =E2=
=80=9Cmep=E2=80=9D
  and =E2=80=9Cmreq=E2=80=9D in the implementation of the function =E2=80=
=9Cmtu3_gadget_dequeue=E2=80=9D?
  (Can it make sense to split the patch according to this detail?)

* How do you think about to convert any more variable initialisations
  to later assignments?

* Will it become helpful to add the tag =E2=80=9CFixes=E2=80=9D to the com=
mit message?


=E2=80=A6
> ---
> v2: nothing changed, but abandon another patch

Are there chances to take any previous patch review comments better into a=
ccount
(besides the shown reduction of update steps)?


> ---
>  drivers/usb/mtu3/mtu3_gadget.c | 25 ++++++++++++++++++-------

I suggest to replace the triple dashes before this diffstat by a blank lin=
e.

Regards,
Markus
