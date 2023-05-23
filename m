Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B0070D757
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 10:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbjEWIZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 04:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbjEWIY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 04:24:56 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4266BE74
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1684830150; i=christian.schaubschlaeger@gmx.at;
        bh=X/8Bqwnx81nlWh7/MWYrX5anc7Iw6B8069D0lj6pvzY=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=O4jidIttvsAxTjGIfxBcXJ7rbxizeWiLSZZOJWmwP7IczkyGZ7uosMk4jvuBoeXsv
         m6T2FjfEDJXpGM1WmehOPqu/vk/7jTxNJT1wx9XwvK44IcDckTVM/glAmq+vJUWxR7
         ReZ1g5bxdx7iIWIMUzTAKrl0ZeoeJsC9+jKhbslXZ2o18rkIdVeUkBU+skuqizGNUD
         ipDCOW9R0K/GdE782MH3mk5HMVxTjUo202BMZeH3tKKhRD67gnqlRpgq1Chtz3UBG9
         dLJ2k4GHuxZWK2ahAr/oPFkR37jR7U1DPnQZicPMxr8jw6COrVQXGo6Ft1CC2wvgZL
         xYtFO8Xl1m3wA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([88.116.17.66]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1qIl731Cdj-00svDT; Tue, 23
 May 2023 10:22:30 +0200
Message-ID: <c5193a7f-53c4-34da-f3b4-128356f9a6a0@gmx.at>
Date:   Tue, 23 May 2023 10:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: Possible problem with thunderbolt 4
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
 <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
 <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
 <Y9fPxIKIOrkHmjHS@black.fi.intel.com>
 <20230306115236.GE62143@black.fi.intel.com>
 <5cb1771f-47e2-c83f-1081-6e975ed650e0@gmx.at>
Content-Language: en-US
In-Reply-To: <5cb1771f-47e2-c83f-1081-6e975ed650e0@gmx.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aGp5RZEM0CR/LUzz9Nf5PQF6X5JjwMEJNxBeNgpr5ItzyFAcueE
 PvDJzAsp4ly8yFgJ/L2M6Pc6W4tGbN7bKp4Km4LbCfCPduzK2jmRbJ7vZP94xE5FZjfpzYd
 3VHNsZhP8VahfrJJrO3ntCpOb5R6Xpp+cMKTUSkXwO8lltowUC4623ixT1LAhLxq3mCVDJ0
 y/E2pzzbBAfjP1JCBu0qw==
UI-OutboundReport: notjunk:1;M01:P0:m4aIn7MkGbw=;m2wAlNq1xE4yk2r6xC7OQkvs9Vd
 M/QAWklNr/HmTKSHmkyVzOAfioivv0ikrGn9PJ2jhO0kWeHIT/8kRMWAoDKjq5zt6Hs2fUjgt
 rh1Z6bF0DEJEfWLR1tu99r+zv0ztw7FJ/SIMHG3gpsnQWDPMClI75GsPcGMF0igiMBerDQzeW
 3TlFZFH+UlazjHFCHczA6+D/EwFe2L0MWu0SMwV9E9kxTnjcKX1vo56mcbjRRrO9b0m/z5EiY
 Ss5jHCpN2C+tjerzdnc1OwupMU+R87AbF0+Qeayqp3F7UNpA8bo6M8QOSQKT0l2t1CUlQTavd
 tQLpHifUg7cfvQi9kjD3qvVHGHnvrUlEVki16az0E8Qm22RI3kEIBU4kxXgCPCY2osOPIaEn3
 oM8zmuBCjHv84XW5tWWgKdGw0LWbXglObeKYq/X7RPmbSEzTP4MFidM6SwdLtww9ZXaHlrp2m
 qXstCmm+JBAlpknMLFhLZZSBIQf9w3PpzpbkPmj8aQyE6AfEDK31HJn3RG5Kg/A1iifXgL51z
 cHtNcKTZsQoujaqE0AgAwGSpkBGQs77PE7r2kvfWMYNbIkAOJnHNIdB1C/xCKjDL+ZVa5YfyI
 gnThn8RItzNVqp9v41blux6C3hU60WGV7/ugaK7HfepCq7pQTOoL3v9+s5gHqlayYzSsnGXgR
 OuUf+8mRjqOnQWpLvnzjKBbW20TRflbUL/IX0Y88P6PGtNx3cxeUJk3U5WSQkxSXrnoV6CNTG
 hLwLKDUwrA01/e/0XB4zd/bLF0AYdbZ1TgC2+mwsAZKLqOGi2wJMsClE4NDTa007eHv7kwD/8
 c4rQY/ul7SjzsGeRK6z8RFCKaWRan9IgXkpPGtzYl1sBpuIwAnWEICVrppKMKNZMFOGuG2hyC
 8pfr3yhIXgcReYs1coonlegEx8+wrCDduQgLtkhFtp/x0GoLJpc9QX2ZCFZrStcTZNhJik2Pb
 zyUDlg==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

it seems that I have an issue here which seems similar to the one on the H=
P earlier this year.

This time the hardware is a Dell Latitude 7440 with a rather new Intel i5-=
1345U (13th Gen.) and TB4. I have three Docks, one older Dell WD19TB, a ne=
wer Dell WD22TB4, and a ThinkPad Universal USB-C Dock.
With the TB4 dock everything works fine (meaning all hardware is functioni=
ng in the UEFI firmware as well as in Windows after booting Linux first).

With the older TB dock, as well as with the USB-C dock the network interfa=
ce on the dock is dead after Linux. But in contrast to the HP case from ea=
rlier this year, this time the network interface remains dead when I boot =
Linux again. After replugging the dock it becomes alive again.

This can easilsy be reproduced by booting Ubuntu 22.04 from an USB device.=
 Using a newer kernel with the UNSET_INBOUND_SBTX fix does not solve the i=
ssue.

I'm not sure if this is a USB or Thunderbolt issue, could be an issue with=
 the network device, too (all three docks have the same Realtek 8153). But=
 I don't see this problem with these docks on other Laptops I have access =
to, so probably it's not the network device...

Can I provide some logs, etc. to dive deeper into this?

Thanks and best regards,
Christian



Am 06.03.23 um 13:27 schrieb Christian Schaubschl=C3=A4ger:
> Hi Mika,
>
>> We are able to reproduce the issue and it was root caused to be missing
>> UNSET_INBOUND_SBTX port operation during retimer enumeration. I posted =
a
>> series of fixes few minutes ago (with you Cc'd) and one of them should
>> fix this issue:
>>
>> https://lore.kernel.org/linux-usb/20230306113605.46137-3-mika.westerber=
g@linux.intel.com/
> That's great news, thank you!
> I'll apply this patch to a 6.1.15 kernel and give it a try. Could take a=
 day or two, though, beacause I don't have the hardware here at the moment=
. I'll let you know.
>
> Thanks and best regards,
> Christian
>

