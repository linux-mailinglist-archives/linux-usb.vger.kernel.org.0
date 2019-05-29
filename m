Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD99B2E3F9
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2019 20:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfE2SAN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 May 2019 14:00:13 -0400
Received: from mout.gmx.net ([212.227.15.19]:49789 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfE2SAM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 May 2019 14:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1559152784;
        bh=7XibJJMuc3gBDgywBVlMCtRhxW465B1HJ06mrxSAsUE=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=JZSdPvPZyjtbXTW9tH6mVZn5xq09RmfdIEVCgQP1kFn5o7MkoFGYgrfF0NmojvgyT
         1RQlFckN176BOom4F7PgiDoJ3/x/5k2rNzQeMmijuXrC5rhQNxHQZNLGuYt/D3j3gx
         dVn1wb4zPg2djFQ8OZDS9nb414RtEojXQr/rwFng=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.166] ([37.4.249.160]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1hRhHU21se-00DDtz; Wed, 29
 May 2019 19:59:44 +0200
Subject: Re: usb: dwc2: RODATA_FULL_DEFAULT_ENABLED causes kernel oops
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will.deacon@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Martin Schiller <ms@dev.tdt.de>
References: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net>
 <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
 <a908bca3-b410-d58f-1011-4f47eca85da4@gmx.net>
Message-ID: <1765e293-c0a2-e3b6-4942-fdf3f3cea063@gmx.net>
Date:   Wed, 29 May 2019 19:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a908bca3-b410-d58f-1011-4f47eca85da4@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:mUFCBMVahBmZYHJb/LAv73s6r3HZbxtjh7mQx/Dl8htmdZ/t7Bs
 7DirHKfIBJMaB6MSkZypPbO2lkCC2wkE41vHX3ePR6mUxV03lKlvuOoViJKMshRAok5JbmS
 Bj03kNFI9F/2hNfjiDvzAKXo78kLas+se+vbcJdfyGiy/dbuHS/YzkUu2fxHDVH+B/9Cusm
 UcI3BYsZkgIHHBmMj4g8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7QXFQJOxifg=:7ijpr0RfE8w7mt4UMkuG5+
 g+AOU2UMrUY37zDRA3I5NntA6Ry0s3278fImr+ABQsfalFzCmAhvDHwwP7J7zh31Bo3yuS+67
 KEYpYvpDKYZSrnoIA1vX/O/LLRTtSOhomDm1vT2QPQ7JDbYT48OD9wrXcvhicL5IbHClEHXva
 Q6wQiH0r0Y355mJeyfIJedl7UzT8pVmCLcP68ZdsoGNiozp9+yvOWeYV7ClqToDXDDXTZ/p7m
 W5jnOAiQ+M9xsj81ySl6MyLQzLZx79+7y5cMgGhpj10GCod5rSoEvHnUtdWSBXweqcOFGroB7
 QJE2ANHGoYa7rYp3bT495UYpz4k3+Xkh3XdSqB1VylhNdHMqb6SbhBT6hx+5+wqO8YpEu97gj
 G61QOVcXvcVdaAowlM69AeExycoPr1NWErInlZR18rgAsfUm/3J57fS76akHf/L4Mv0LDZf1w
 v3dUEZ9ICh5m2MAjrZNIMd1pNyvq6iiPnkqIZyFKlfc7cm/XqTRPju3cnqF3lT3Ru6VufpbLP
 eKVYr9LYRm1E6F3M5CyaMlSKmN7OcjtihIJQcAwKIQTeLGKl/mH0DBC5riGgj6HQJDJxSDPf6
 KOolOZhIv3ueK0pjWu6JPt5Y3NVJuXsjvuSLdNQXL/gmY0m7N3CyD2F60h9Za3ZbjU76kG+/n
 2bI0JGFCKAXFceHT2w6qEY8KKzaoP8aD3trNv+2AzDQ6EV/Tpcas3yx3drBNoKsv44qFq0yOi
 Ov+P+RK1ZRJDepv3femAhiRaJxqvvYBgzTY3uzs8ITQib6jz4OHeg9SKeQuITnzym/Uol0HhA
 ttGUdMTmZZxSnr6LfLfsv6bPiZsr8M8PHooOam0NIvbq17mHj+F6ZrQwsV7ODVGS9BQntfG1+
 hRaQ85urIOTk2Cxc8gs/3Adx6z2g8jCNtTj9KVH9MUbmhVF3AP0UvtDVnESlA9qmYF5V8qNKg
 5pbJ6lMLhDjTIBe5aKNDSlZDqE2XVsnf7WxxAaHpMxQwZNsmawuEb
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,
hi Felipe,

Am 26.05.19 um 21:58 schrieb Stefan Wahren:
> Hi,
>
> Am 26.05.19 um 12:44 schrieb Antti Sepp=C3=A4l=C3=A4:
>> Hello.
>>
>> This is just a shot in the dark but have you tried to apply DMA cache
>> alignment issue fix [1] as a third workaround alternative?
>> If it helps the fix should be merged upstream.
> yes. After applying Martin's patch, i wasn't able to reproduce this
> kernel oops.
>
> Thanks to all
>
>> [1] - https://patchwork.kernel.org/patch/10817377/
do we need a resend of this patch? Is there reason why it hasn't been
applied?
>>
>> Br,
