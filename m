Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC677472DD
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jul 2023 15:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbjGDNjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 09:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjGDNjO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 09:39:14 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA0F10C1
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at;
 s=s31663417; t=1688477928; x=1689082728;
 i=christian.schaubschlaeger@gmx.at;
 bh=Ur3LW0NeVIT83ALxY7OPiLo4F4IRKRQJdE67N9BLyPA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bQS/pgDTF/bi4ttpf3IqliIh9VJOzP1+hqdun2U/qCv7zF6DhOWL4hMVsSKK0kjWAUzjY+v
 hkeHwaCk/DzQ+1iWIa51TPy8YEpkr0cOQ5887l0QF84eVIk4lOS10Humc8Nb8tJiorr8f3kUO
 V4CmpjusgqA51AXq3FHr9g/KAhEAkC89cu09Gu0kD3LXt0Gkr7KLfo8dHWN/oSM/a5nlcE9LY
 nttNSYffMntwODV4UZzzOd8J279S/quRfHjAuIp9eIqaf3E1dmoqnYLCIyPhM4j7tMo738R0V
 BFUMrVuk+ksUwOhtbNd87nedk0YqDaTS3T1C86mdgLJHrYCyAbnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([88.116.17.66]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYLQ-1poFFI1l7o-00g4IV; Tue, 04
 Jul 2023 15:38:48 +0200
Message-ID: <36d37597-c0fb-cbaa-dd7c-0f3d6b4050c1@gmx.at>
Date:   Tue, 4 Jul 2023 15:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: USB issue on a TB4 controller?
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
 <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
 <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
 <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iuLd0j1RDqJnNHrZUQgpKCs7B6GUyg3xQ1yHGl+4zWC3ktkHT+e
 BSFLx0dKSCKZmAceRpUGo2E2xpm8fYZogULPwrXF+LIM59NhSd1kUio5SgehJJeD2bBUeCQ
 Z8inCvbt++cwjaCJN2jqfq9RWVqwS4AxE8s/4pEjJaQ3QdNnT2piJk19HzuyeBc73b3uwrw
 mTQ3hxFVcnv0kEao+TW3Q==
UI-OutboundReport: notjunk:1;M01:P0:fJjITolh9vs=;I1N7Eg0c1Bfe/FXlOX9s5A7n9PT
 +CObBbEenv+rpVTaA0bSxoBIjjyoeYcw5fO915/Yu+vD7PQNY2/WM0h0X7mkRHzBMEOgntdPd
 mQv56lLWWxpH/DyH/2GhZ6MoF6aSuO/12Rj+iOOb1Slp/nSyz7DdLgbXt2TOYGro/SsaCLZuJ
 KjH+kGFYFffD1KPqxGwnohWCBHw+/or2PGoZ9Of1tzowTsENnJ47TRRzm3mfjEywMwowo1TAf
 Khv3/CPdNua2oPakqZO25r3cjUh/NvQciWhFggXc4tO8baFaS23Qe3FkDwqmhkAF1Z8slLK5E
 pMUevR6p1SBHZmoHq/EcmFNR1BWWKvUaoVGPOsZOkysd25pH59dBCqrHYqpWYKg/+7lVOgMR2
 jImD3HG3nJxOV+UdgI5F04CgPPHQqGeo0pTrIo1lKKZhoPacVbGUnqg518UNBi0f0wdgHwOMy
 F5pzXfUbwCvwGmSSa2fXEwoV2ToWQ2H6zMvln6S9nEgsfHgXm0zn2L48do1w41rhn5ItuHt35
 K2QPLxPjMwyVUZOe8+tJs0mKhqqioJjjfa7CiYowd4SPvDAbAN6i4zo5sm8Po6nFiBpx3TfXG
 TkCYyyqFrJDOUp4dLRwUyhy8cOi2GL0D+KkRFWH+xRuKrFzJkxgM/Aj45mBnyHAtNGWCebYNZ
 FWC19vKywzFtGduaKNitqeFhHGrpWJ41kOEBZ+bGQRi4OP5x0mr8aKstkozq9uJkbzaeI8gr5
 738Od61xGrsihw6T4kNXexZ7cMpKsmgiwZK7DjvSgmEZRDHKY/RH6HwQQWFNUz6/92tuVgueP
 oSRjrJj/P6mQsDTJ4zNQFGX0Z7DSuEynD63muuTrIU+9O8Luk+81q/43Qx3ZtfojZhHgkdjtK
 e6DSEYqp2Q1dsuteeWiKri4EoRwsDj+QlQRa7A3PDtA7ZKeL/weIqssVTfUT7ByokrrDMLfZI
 K42uww==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

today I got access to another Dell Latitude model, which shows the exact s=
ame issue as the Latitude from before. This time it's a slightly older mod=
el with a 12th gen Intel CPU:

=C2=A0 [=C2=A0=C2=A0=C2=A0 0.000000] DMI: Dell Inc. Latitude 5430/0260KT, =
BIOS 1.12.0 03/20/2023
=C2=A0 [=C2=A0=C2=A0=C2=A0 0.092576] smpboot: CPU0: 12th Gen Intel(R) Core=
(TM) i5-1245U (family: 0x6, model: 0x9a, stepping: 0x4)

The issue is very easy to reproduce: just boot a recent Ubuntu 23.04 from =
an USB device, reboot, and the network interface on the dock is gone. Only=
 re-plugging the dock's USB cable (or shutting down and restarting the sys=
tem) helps to recover the net interface on the dock. I have three docks he=
re (Dell WD19TB, Dell WD22TB4, Lenovo USB-C), all three show the same beha=
viour. Running the most recent linux kernel does not help.

If I can provide any useful logs I'd be happy to help, just let me know.

Thanks and best regards,
Christian


Am 01.06.23 um 15:54 schrieb Mathias Nyman:
> On 31.5.2023 14.56, Christian Schaubschl=C3=A4ger wrote:
>> Hi,
>>
>>> Attached is a patch that adds more debugging, adds a minimum
>>> "power on to power good" delay, (as hub reports 0ms), and checks port =
link
>>> states during hub initialization.
>>>
>>> Does it help? Could you take logs with that patch applied.
>>>
>>> Only dmesg with xhci and usbcore dynamic debug are needed.
>>> xhci traces won't help as issue seems to be between the hub inthe dock=
 and the NIC
>> patch applied, see logs in the attachment. The behaviour is unchanged.
>>
>> Thanks,
>> Christian
> Thanks,
>
> In the failed case the hub in the dock doesn't show any activity
> on port4 where the NIC is connected. No changes, link isn't in any
> error state. It looks just like any empty port.
>
> I don't have any idea what's going on.
>
> I guess it's not possible to connect a protocol analyzer between the
> hub in the dock and the NIC?
>
> ok success case:
>
> [    1.712754] usb 6-2-port1: status 02a0 change 0000
> [    1.713070] usb 6-2-port2: status 02a0 change 0000
> [    1.713567] usb 6-2-port3: status 0203 change 0010  <- another hub
> [    1.714184] usb 6-2-port4: status 0203 change 0010  <- NIC
>
> nok failed case:
>
> [    1.716756] usb 6-2-port1: status 02a0 change 0000
> [    1.717036] usb 6-2-port2: status 02a0 change 0000
> [    1.717395] usb 6-2-port3: status 0203 change 0010  <- another hub
> [    1.717976] usb 6-2-port4: status 02a0 change 0000
>
> Thanks
> Mathias

