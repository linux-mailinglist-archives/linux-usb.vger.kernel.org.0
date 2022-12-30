Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0B06597CC
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 12:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbiL3Ljh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 06:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiL3Ljf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 06:39:35 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF431AD9E
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672400366; bh=6Uf2E0T8+FV6mzIwv9xLYbSaQcR5rPVSV2TJuc9Cn0E=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=e4Fd+SB0OOUTdraeTx9hajWG/KyvvJ7ogNUPAHwdlqVvdb1kSE3l7Eq1Kg+l9awEH
         V3QWAlES9UmB6RAdRViGLHd7mTXz7sckrFj8NkkML1IQPVhqRpJGy+9yM6oWQTb24z
         Asj8qi0UFz+e3/WTmLhSv0UuY13DwxA+quxWApDZBwoyuNjLr8xmgFKq9+gfaLVPfv
         TeG+fi+P7Klfn3rsRRO8AuUtb63WnriIun7qmEV+xVgHDlzCOSc0DRzbsTEBtyX5Ef
         fqnPRIKJ6cY4DvDJU4xtncp7vY/Ns0u9GUDWS49mEdrnAJ1B5KOasYKBHGbADKQ3y5
         dPmvQhCbj5QpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCfJ-1pOfyZ2lJh-00V6e5; Fri, 30
 Dec 2022 12:39:26 +0100
Content-Type: multipart/mixed; boundary="------------ijL9KdgPRFohtomDlPSHq5Cj"
Message-ID: <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
Date:   Fri, 30 Dec 2022 12:38:27 +0100
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
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y66vWYdLLAOG81+f@black.fi.intel.com>
X-Provags-ID: V03:K1:xkR8gp0+OQCFIf8zT06rkO1OVsO37JRz386v34MbRTfyaj8rKQ+
 IBxRlUS53pNXreSW7/R+1A7Qu6v/PWirjEwdSJzNJO1pD/ufiR2MaUMSA08jUQfapn7kF/I
 doJS/zX9tp27T5jmFpZ/OYn26vyDs09cUnhBkVQ8v871SD/An3SkLIY8q2D/onbup7ssy6C
 g1143Xntb0PdzgIbIM6JQ==
UI-OutboundReport: notjunk:1;M01:P0:eLFvU9/93GM=;LkJqY1CfIyYK4nTqsfE+UzIS0PM
 x5PNTGcRDcD6ia6/meKq9ZFSxL4i/wJlb2wVb7w+EGazZ2DpSZnb0AYqR5rhizTtbX2wS3vPQ
 uOR3Ir/xNA3WfLPsx23WVGNGiLg+MJ8AKYPdosS7DJo5FdQcNR2vTwhf4Gs/3fVLh1ODGcpUl
 kVhUsqxZhij0Cc2NvnjZ1IogW381RtWtBogCAZVgfftz+69IWriwQWvft8BXXtka+/zs2Dr9a
 gaesCGeX5KV2/jB59fg5rAs+0Ffk7av15ExFYSGCZ2sjcn0Z/IPPRUfKjllrtx5wipDoFus6R
 fzXAX+dS/aSD/RYjFh2FDqBgQ3IB5cRejHo8JcFY6AJVFqTvCzv627I1ndIhjCuTDVF6hzVj+
 MO7OYuARaZu8ka85Ybmt9a4CrjyRfK+kXiEcj4se3lyqDP+lcZ33o5M4svBACamkoKIEdxkkL
 mn+z1YQqMXh2+TCojqHs94jm1N0E7iJ1j6wHhTqI7Rr2IlGu/XgM8m8lnZK9fzMnnvQGeTUv8
 1cNdMn5P1UUfFcM6uAU5Fk+iL/yYNdPI8Seq7R1bX/fpfGW93lIhd5IoWNgGghuVTOAHhB1nV
 BbtNm7bvC382yqh59OZZP47TTO5B3Tl6KOcbXziR5fChF0jyaVfXC/f7z0Pt7nSaFWRkcStHg
 wcm0CvG/hrogPGzOwAGYiyFX4QWo7VdZIt4dYiGxf1vVgcfZiMmlyUkzwtFpF0rnS0pH0LdAk
 wh9fQAlJOchmJQySc18RXzcg5tq2XdBqHxzwYOB99j3lF6IpvKWFZYPgv/beQDIH+p8+Ca6Ht
 NtrxJ0/YBKDFXMUzzYuJ1/WNwjbKcUYssj4EtbckWq3UkOhmJ4NQ7GBECZ2DLz5+gua/Y5yHG
 lo1TZbdGg02R2vS7tG2st9RAeqAtZyEUv3Ns2hPehhlUvQ7p+9d5raNs3TrYeT/00S0TpeVnx
 TpOjIwaM34flC2iKBEtXJAoOkVU=
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------ijL9KdgPRFohtomDlPSHq5Cj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

Am 30.12.22 um 10:28 schrieb Mika Westerberg:
> Him
>
> On Fri, Dec 30, 2022 at 08:57:37AM +0100, Christian Schaubschl=C3=A4ger =
wrote:
>> Hi,
>>
>> Am 27.12.22 um 15:28 schrieb Mika Westerberg:
>>> Hi,
>>>
>>> On Fri, Dec 23, 2022 at 12:24:35PM +0100, Christian Schaubschl=C3=A4ge=
r wrote:
>>>> Hello list,
>>>>
>>>> I'm having an issue which I guess might be related to thunderbolt 4.
>>>>
>>>> I have an HP EliteBook 630 G9 notebook and an HP Thunderbolt Dock G4,=
 both with Thunderbolt 4. I run linux on it and need a working network int=
erface (the one on the dock) in the UEFI firmware for PXE boot.
>>>>
>>>> When I come from a cold boot, the thunderbolt connection works well b=
oth in the UEFI firmware (I can do PXE), and also later in linux. After a =
reboot from linux, the dock disappears from the PCI bus and is no longer a=
ccessible in the UEFI firmware. Hence a PXE boot is not possible. When I t=
hen boot into linux again, the dock is there again, working just fine.
>>>>
>>>> On my machine the thunderbolt controller has the PCI address 0000.00.=
0d.2, and the PCI bridge to the dock has the address 0000.00.07.0.
>>>> I've attached the PCI config spaces of these two devices as they are =
seen from the UEFI firmeware from two different states:
>>>>
>>>>  1. When the machine comes from a cold boot. In that state the UEFI f=
irmware sees the dock and all devices on the dock.
>>>>  2. When the machine comes from a linux reboot. In that state the doc=
k is not visible on the PCI bus.
>>>>
>>>> The config spaces of the mentioned two devices are different in the t=
wo states.
>>>>
>>>> Note: once the machine is in state 2, it is necessary to remove the p=
ower supply from the dock (or physically disconnect and re-connect the thu=
nderbolt cable) in order to get it working in UEFI again. That's what "col=
d boot" above actually means.
>>>>
>>>> Also, when the machine is in state 2 and boots into Windows the dock =
does not not become visible on the PCI bus. Interestingly, after a subsequ=
ent reboot from Windows it does become avialable in UEFI again (no need to=
 disconnect the power supply or thunderbolt cable in this case!!)
>>>>
>>>> So I guess the linux kernel does something on shutdown (or misses to =
do something) that prevents the dock to wake up again after the reboot in =
the UEFI firmware.
>>>>
>>>> I'm observing this on all kernels I've tried (5.18.x, 6.0.x, 6.1.x; a=
lso when I run a vanilla Ubuntu 22.04 this happens); the logs below are fr=
om a pre-release kernel from today (which will be 6.2-rc1 in a few days). =
I've also experimented with some powersaving related settings on the kerne=
l command line, unfortunately without success.
>>>>
>>>> Can anyone confirm this behaviour?
>>> First of all can you check if you are running Intel or Microsoft drive=
r
>>> for the Thunderbolt controller? It can be seen in Device Manager
>>> somehow. It is possible that Windows and Linux use different "connecti=
on
>>> manager" so that explains why there is a difference in behaviour.
>> The TB contoller in Windows uses the Intel driver, the dock itself a dr=
iver from Microsoft.
> Okay then it is using "Firmware Connection Manager" whereas Linux is
> using "Software Connection Manager" so completely diffrent things.
>
>>> In case of Linux this is software connection manager so it is Linux th=
at
>>> does all the tunneling. In case of Windows it may be also firmware
>>> connection manager so it is handled in the firmware (and this might
>>> explain why it magically works after rebooting from Windows).
>>>
>>> In general this depends on the BIOS setting whether there is PCIe tunn=
el
>>> or not. Typically there is something like "boot from Thunderbolt" or
>>> similar option that turns it on so I suggest checking if you have
>>> such option.
>> Unfortunately there is no such BIOS setting on this machine...
>>
>> But as described above: when the laptop comes from a cold boot (with
>> power supply removed before, etc.), then there _is_ a PCIe tunnel in
>> the UEFI firmware; so the firmware can do that. Only after a reboot
>> from Linux something prohibits the firmware from re-establishing the
>> tunnel again. And I'm not sure if this is a kernel issue or a firmware
>> issue, but it clearly makes a valid use case (pxe boot after linux)
>> impossible.
>>
>> Can I do anything to bring more light to this problem?
> One thing you can try is to "force" Linux to use the same FW CM path
> than Windows. This is done by compiling your kernel with CONFIG_USB4=3Dn=
.
> This should enable the firmware CM in Linux side as well. All the
> tunneling (except software/networking/P2P) should work with it even if
> the Thunderbolt driver is not loaded. I wonder if you can try that and
> see if the PXE starts working better?
Ok, setting CONFIG_USB4=3Dn makes everything work as expected! Even hotplu=
gging the dock works fine.

Now I've tried this: CONFIG_USB4=3Dm and blacklist the thunderbolt module =
(because disabling CONFIG_USB4 in general is not an option for me (I guess=
?) There's probably hardware out there where the firmware doesn't set up t=
he PCIe tunnels. Then I need the linux thunderbolt driver to do this I sup=
pose).

So with CONFIG_USB=3Dm and blacklisting the thunderbolt module this happen=
s: the tunnel is there before and after linux (PXE works), but in linux no=
ne of the devices that sit behind the PCIe tunnel (network, external displ=
ay) are there... that's strange, because I would have expected that CONFIG=
_USB4=3Dm + blacklist thunderbolt would be the same as CONFIG_USB4=3Dn. Wh=
ich obviously isn't the case. I've attached lspci output from either case.

Is there any other option to decide at boottime whether or not to use the =
USB4 driver (besides using two different kernels)?

Thanks and best regards,
Christian

--------------ijL9KdgPRFohtomDlPSHq5Cj
Content-Type: application/x-xz; name="lspci_vv_no_usb4.txt.xz"
Content-Disposition: attachment; filename="lspci_vv_no_usb4.txt.xz"
Content-Transfer-Encoding: base64

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
--------------ijL9KdgPRFohtomDlPSHq5Cj
Content-Type: application/x-xz; name="lspci_vv_blacklist_usb4.txt.xz"
Content-Disposition: attachment; filename="lspci_vv_blacklist_usb4.txt.xz"
Content-Transfer-Encoding: base64

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
--------------ijL9KdgPRFohtomDlPSHq5Cj
Content-Type: application/x-xz; name="lspci_t_blacklist_usb4.txt.xz"
Content-Disposition: attachment; filename="lspci_t_blacklist_usb4.txt.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4AGpAGBdABaWwhojqAIw+Lij6z75ATbTrvovbvZk
JmfgSP/T8B+imDyRuSBTeO2Eo8UNi9INPQ+qd4i4o+2tyGhchrkjzteD6B7Taqyhag8Ic+wO
Mw2/J48AIua04PqFrrhLt9LRgADI135Lb12y1gABfKoDAAAAvjGXl7HEZ/sCAAAAAARZWg==

--------------ijL9KdgPRFohtomDlPSHq5Cj
Content-Type: application/x-xz; name="lspci_t_no_usb4.txt.xz"
Content-Disposition: attachment; filename="lspci_t_no_usb4.txt.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4AK5AIxdABaWwhojqAIw+Lij6z75ATbTrvovbvZk
JmfgSP/T8B+imDyRuSBTeO2Eo8UNi9INPQ+qciq1xwMRWoefPK5uM25E9tFLKE7NRFbiYDA1
LBaIOOF/p1Zv+F8ougYwqVOQbj3Ptx6vkacxne0xp3hSRqDj/UJ1bPPdZBH9YDkamcwjbWka
9wRCR0/+8bcAAIPwVNteryjgAAGoAboFAAD7An5/scRn+wIAAAAABFla

--------------ijL9KdgPRFohtomDlPSHq5Cj--
