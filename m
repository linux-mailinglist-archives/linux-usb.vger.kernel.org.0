Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A5465AE78
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 09:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjABI5d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 03:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjABI5b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 03:57:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEE4D53
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672649842; bh=FzeUqiUzrlEjwdbu9sIW1nuJGoCa+NZURa9p+j4Q+Ow=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=mQajlLFT1sKB06wR9Qg11NwWevgWGt+MJ5+BOJXlbfdxEgdjc25p7/tgP3A1FrkUP
         WFuMQydTSLJ1jniCLbwnN4o0vJzYZiTN4Qr7ZrYmcruSUiUYXJfqQufgQSOLDAizeh
         g4JWcl3LrIc02BNAECSsyL1lvH9bCN6dieAnq86oxfHswNQfLgnYbvNY+E9Bn1pgn2
         wnd3CHHhYiHYkH58zHh1zgBKDC5SCVWABafbHFnC45dFv7tgS0g2Lxf8EUSEo3IQt0
         b6A+Qdx6E/rHg+gfHnL1Y4Gv4JA4s48jSoPndv27sVOvzZlQG0u0qw32jeo314McvL
         ztPLg9VlsiTfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmUHp-1oURYR2ToX-00iRsf; Mon, 02
 Jan 2023 09:57:22 +0100
Message-ID: <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
Date:   Mon, 2 Jan 2023 09:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Possible problem with thunderbolt 4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
 <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y67X5JrnRxYN/pns@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8UnaQ7QWgbjtXBRn1GL+vhjOwDKjZkWrTxx5c6480hmGC3hofEr
 +qRI/d4LxbU+zaSZ50k0MEC1twoZ4oC5FoQa1+OElLOigcD8fjA21skAHd/5pzExC9pf5IY
 8Gefy73t8Ilr5b+/fMtcJ7haO8vr9XXzSwEMoTMBYDc4oxOe9AXH0pXw7WD8UJIVsccEBLZ
 d4GOcjrXdpBcz1l66UmTQ==
UI-OutboundReport: notjunk:1;M01:P0:KaTm3gUtT9Q=;mdem00Jpbhp3ToIOw40axLee2FB
 vSKNFlm/AUddlUDoqmN5yGk7TLENE9VSfkYy8t5wWCKF1HtK9qiYmEAqVrXSAmZ89lu+CNRS4
 WYXG40nht7EBzv+aW+iyajxvS5XWSr+nCAin/+jt+IY3wdhA6DFixxDNOv40Kdvs6VMCQV0yS
 EO8mgfKXFs0PgZzD5DtlNFiQJzT/Ez6YxFks0ezfo2fQgpkkVR44qNd1+uGDtzvLXL3ammcNc
 d1GGv5k8y2Jk93NZ3aXrWMoh48ainawx70LB3lTOUARl7AkidNY+lNQVa5ON1MfO7V4HJLzCl
 qP7sKiX08VByiyutEnqmTx/52bH+cwVJHVR9gYhCfzozoDg0G2BVVJ+gU+AJUu80EbTWR5U16
 nW2BhYvl2e4FmOPVefG4odsYMoJLSRJ1kbKml3ZRdvCCJtMEc5+QRTZDhxHWFxT8nH4DSStQ1
 qF5LQ/j/v/tUufYKV2KKiq9nO5dejluSBMJaQZedgUSDLVt0u7MCc5MI5ceLRkrjte48/ICex
 gKKpkYf0m2K9FlY0Ld1o/X449D7PpPcp7ZuPDkaSX6cxsFkbHioAODXwpQKly2mULnj6tAiX3
 XJbllq5+vU9qEsctwTsviwCpsaCTKmSiGssppeE7N8VfQox0bI1Wpu8veLKfDMwU43jHQxbR9
 UADN7RKsRFSryTDh3hhaWKRB9GzH7aVWI2QmDj6XgllZ9xdapb0qKRcXGBV1NOChrjoifHYnH
 K1mmFt+2cVDd0tt4N43+jo/FM2N8wWRsposiFgOJFJA13DW4Xz6nz7gPbguaFOPPaWt4McxPi
 fAT60LInYXzaFw9jf5srmfsl8WsWcMNnOfT97dp1hP2okRws5Z6hbaDMXmJcslC+DBEOBfMsm
 u2lwyPyi8wDgL2h2AZJgCiPz0wBXKFyncNroTQJT1Ylj0i5yyFm1NL1bbDTQuXB/14dZJx+7i
 nNmOrOwcKCw70mmO+My64UFhapI=
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, (and happy new year!)

>> If I just remove the module without un- and re-plugging the cable, the
>> connection is not there in the firmware after the reboot.
> Right because the driver leaves all the tunnels up so the boot firmware
> then finds the PCIe tunnels established.

So maybe it's a firmware issue? If the kernel leaves the tunnels in place, but the firmware doesn't see them?

> One more experiment if you will.
>
> Same steps 1-3 as above but then do this:
>
> 4. Disconnect the PCIe tunnel directly:
>
>   # echo 0 > /sys/bus/thunderbolt/devices/DEVICE/authorized
>
> (where DEVICE is typically 0-1 or 0-3 in Intel platforms)
>
> 5. Check in lspci that it is not visible anymore
> 6. Soft boot the system.
>
> In other words this leaves the USB4 link and other tunnels up but not
> PCIe.
After echoing 0 to the 'authorized' file, the devices disappear in linux from the PCI bus, but unfortunately don't show up in the firmware after the reboot...

Thanks & regards,
Christian

