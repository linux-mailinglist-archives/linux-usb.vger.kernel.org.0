Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A963D659603
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 08:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbiL3H6v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 02:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234613AbiL3H6p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 02:58:45 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C71EBEB
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672387117; bh=gf4O4g+fzkX1oHFf35aiuowEUPfgs+XrCZBRd3P6/1g=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=W6G00bimMHAt9BQtk/OLL1MFkQ3ZUAhvhTKwnTQTE2t+JtEZC7SuEwogDgl8RDNye
         rwLaHahvZO0i6MIalDzKqrHC7zazO18DPU1JE/5KbF2g6R/wtIIaaiEzMeO1s7WOmJ
         HPNscHtKpFruiMDauKFT7w90QiLeIEQ1IRmlGGpyEhcYKCpbBUCU5Dp3cJQhellzHE
         svqWhuGfsiorTH/sHp/fYqjxnvY95Z7WuJyDgMlhwEQsf2EHDoFcLVbggnwS/S60l9
         IH5gn7QuN2RaTxStdwyXy06KhbLAauxz7NctAoMn/Hce+89yzJe6E7B2NCoFkUQ8qm
         2sbeetHhkekXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1ouqvJ3dYT-00z0cc; Fri, 30
 Dec 2022 08:58:36 +0100
Message-ID: <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
Date:   Fri, 30 Dec 2022 08:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
 <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ds6ef/dtfZLgwx5nIP3JETWCiwNWv9bfU7Hzc5PEKXqRZMKNz9A
 2xpY9ZoP5CQ3yNTRiuEuu8Ome3IpmEfhkLJg29Jm/1prkSiH2awhLh4V4WFjsycE9JT9Lai
 iIPhCB/24gWB89mY6Qwldl44vYp9gXWAO5kpRhlQ8Odvq6Bh5OKGmgvViTAgBp8b+ozPz75
 HahmPchnqSR4/QHlOH6gA==
UI-OutboundReport: notjunk:1;M01:P0:bk16gMBOQso=;ztTSRhuyUl6tdIE9Pf1apWyZVcr
 VmvMZZ9G7j1plhUVzJ/PXixNj0AAYR2BKufPQEw53qrvlmMFmAw4/0adgyzNzqNa4enKgO117
 EogPjbu2w0Ks+SzyXpQW2QNIQGe4b/C6fk1+dF8OJE4SCnPveOYSITDuLh1RAP+l62xyBcP1g
 ENauMbibYQ1PuJssacOLxvzLsP/U9JqJob28bcnqclI8JjhcJywBzl3B8udeEpSuPf3rTV7A/
 BD+tcbY6wiAQXeVhHIr/tGCmGwPOtLXt7wgjk1CBr79TGZXztq1jwTHzaa4Q/9ljtfPyKTw7E
 z25JvFfIpdqJu6sd/CevEuThWiG6y0MN75DVojeCHmUuqI6kNoWTh2u9Jk02IDBHxpa3leBwj
 5H+X2L4xUeKsUMS/ch0TUmwEkA+QpAo0veNCDWlYLJsiwaCyHH6bp1HO4Wrf7qWLJcg+dnR2t
 HINsVOj3ZXDvn1ZP5J0YY1+AUsMsSST8/D6iQz2nVo122CxtQWBCBurn4Z/1GVD4MXwENYkbc
 1xlKQ+B+xVspmwsXqeSYDeKQySAEECI9D52HjizeQwnzhELnHHbWknoKL1kINu9eVaw3wwKog
 Mn+gACFY+1LqaF0U3L1ofRXOR/hZqGNWNbsR3vdOg8M4xvQkyTZJQCbcJbiyM5kjQjs9rbTV0
 FHO+0v8kkM9DgnAB6B/w3p0C2nOGBn9nLMSOOMH7jDTiJkmfmnRKkKIdYJpyelRFPjwwJFZNi
 GqmnRitVYCbaBjnPl4VN0trCuq81e/6tD1GJJgYN9rDzGZqz2sjlL5uCDKIYCXKjwPw8ROzBv
 yRzBkkgq4Te2K0Hcla4h+EKEdonUaYdQRH8kn+EAaSkYuFzrNMBKnsI7VeKJLHh5Tufj1TETP
 gFO/3eW/o0lDu1z9m01mZ8QkbS293FkXUf2D5m4u0Ksiop8ZccpgfxpgomXYV5xNGduIpFNi9
 utvcdLggeCw5lFWHx58Rkj0N/X0=
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Am 27.12.22 um 15:28 schrieb Mika Westerberg:
> Hi,
>
> On Fri, Dec 23, 2022 at 12:24:35PM +0100, Christian Schaubschl=C3=A4ger =
wrote:
>> Hello list,
>>
>> I'm having an issue which I guess might be related to thunderbolt 4.
>>
>> I have an HP EliteBook 630 G9 notebook and an HP Thunderbolt Dock G4, b=
oth with Thunderbolt 4. I run linux on it and need a working network inter=
face (the one on the dock) in the UEFI firmware for PXE boot.
>>
>> When I come from a cold boot, the thunderbolt connection works well bot=
h in the UEFI firmware (I can do PXE), and also later in linux. After a re=
boot from linux, the dock disappears from the PCI bus and is no longer acc=
essible in the UEFI firmware. Hence a PXE boot is not possible. When I the=
n boot into linux again, the dock is there again, working just fine.
>>
>> On my machine the thunderbolt controller has the PCI address 0000.00.0d=
.2, and the PCI bridge to the dock has the address 0000.00.07.0.
>> I've attached the PCI config spaces of these two devices as they are se=
en from the UEFI firmeware from two different states:
>>
>>  1. When the machine comes from a cold boot. In that state the UEFI fir=
mware sees the dock and all devices on the dock.
>>  2. When the machine comes from a linux reboot. In that state the dock =
is not visible on the PCI bus.
>>
>> The config spaces of the mentioned two devices are different in the two=
 states.
>>
>> Note: once the machine is in state 2, it is necessary to remove the pow=
er supply from the dock (or physically disconnect and re-connect the thund=
erbolt cable) in order to get it working in UEFI again. That's what "cold =
boot" above actually means.
>>
>> Also, when the machine is in state 2 and boots into Windows the dock do=
es not not become visible on the PCI bus. Interestingly, after a subsequen=
t reboot from Windows it does become avialable in UEFI again (no need to d=
isconnect the power supply or thunderbolt cable in this case!!)
>>
>> So I guess the linux kernel does something on shutdown (or misses to do=
 something) that prevents the dock to wake up again after the reboot in th=
e UEFI firmware.
>>
>> I'm observing this on all kernels I've tried (5.18.x, 6.0.x, 6.1.x; als=
o when I run a vanilla Ubuntu 22.04 this happens); the logs below are from=
 a pre-release kernel from today (which will be 6.2-rc1 in a few days). I'=
ve also experimented with some powersaving related settings on the kernel =
command line, unfortunately without success.
>>
>> Can anyone confirm this behaviour?
> First of all can you check if you are running Intel or Microsoft driver
> for the Thunderbolt controller? It can be seen in Device Manager
> somehow. It is possible that Windows and Linux use different "connection
> manager" so that explains why there is a difference in behaviour.
The TB contoller in Windows uses the Intel driver, the dock itself a drive=
r from Microsoft.

> In case of Linux this is software connection manager so it is Linux that
> does all the tunneling. In case of Windows it may be also firmware
> connection manager so it is handled in the firmware (and this might
> explain why it magically works after rebooting from Windows).
>
> In general this depends on the BIOS setting whether there is PCIe tunnel
> or not. Typically there is something like "boot from Thunderbolt" or
> similar option that turns it on so I suggest checking if you have
> such option.
Unfortunately there is no such BIOS setting on this machine...

But as described above: when the laptop comes from a cold boot (with power=
 supply removed before, etc.), then there _is_ a PCIe tunnel in the UEFI f=
irmware; so the firmware can do that. Only after a reboot from Linux somet=
hing prohibits the firmware from re-establishing the tunnel again. And I'm=
 not sure if this is a kernel issue or a firmware issue, but it clearly ma=
kes a valid use case (pxe boot after linux) impossible.

Can I do anything to bring more light to this problem?

Thanks and best regards,
Christian



