Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF68662556
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 13:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237193AbjAIMTL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 07:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237011AbjAIMTG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 07:19:06 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AA11ADB9
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1673266723; bh=9tO87Mrq7vkjNh935wZs0PnmuuWYv0aXlAv2v/ZMANs=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=SzFpsCB2ftZfhf/gVuz7XFLAq1+OO2/UAMLbz0Yq11rDDYqrRdJFKN2U9bF6o0ZlG
         B+wKru8q77wIE+mW9mEwVsKSVuIrYfECBmfB1yrqXltikceuEHfbGYp/lTZrWcE2+p
         EZQq02M0b/gRij3B2zrxNAHMgU1QlQAte6D5TiZUMwVghZp8I4gqxBZZa8Rh3KZQZK
         8HaqYpuN63GjsF5ppW043aH2mgX3DpZU74/Ql4ef14QyMbp1v4PgYAzsx0ZBuETSB6
         JoA1AbvdzUS6vrnpoNgJFirODcuv0CIM2SVaFQ5nbHSdZ4ZJcK12+BjIW11WL/oR+y
         voXKG2CYxxpuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1pMOIj3ypv-00TQTk; Mon, 09
 Jan 2023 13:18:43 +0100
Message-ID: <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
Date:   Mon, 9 Jan 2023 13:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Nm+uC9q8dIDIVcxlVzsRcszsA6w0W4dxN1tFEjOC1yCemzeSOV2
 FjFXs6pRcuYWPsGI+0fDvRCyIoPu70Oq66G4kvwwGr7zpbPIQaNknNnTcas+tQewdDxd6Va
 TiHA+/M8QWYLcW5rzvnH2N83sgzRsoEhR9z1Aw3BEydYXQmlmKDvuwu2WaFpuKo/NnEPI9i
 b++XVoi7cfMFswAyhsKgA==
UI-OutboundReport: notjunk:1;M01:P0:a1J5o8fh1AA=;DjbfG1OCZayhPuCuUkF111mBJrp
 opaHWHxKqOCnNFFmXURuaa8nBofe079Nu/UvEv0jzJzpU7x3fGlx6lDP8MRWAc4U95Jxe6Gla
 4Vrh2KHv3iMdDC0t4mNvOguVQ1CTUKS1HeXzWNmIpdvuCDE32SsP67pBBVZMw3iiYdXLFVzS3
 wNAuhQN7UhnDz3jKSNPue6kKS9E7qifmjUsRgOygZ01xsTTtZcIdeL+Up6PC0lwnd7vclO+u8
 KmIt+P7zsye/NlrkdsAxvqDOE/1tntd35jB86NpKkYYO4+TKywIiUOJclBtFUcYBbwmInEaI+
 iDFKgOMmGSzGet0K0iKvmpJciSPBIE9BpTuvEutEFY4mQK4OLkAM9gpCeXSHp6aYvY1Xa/3FX
 gWpX7Au0Yzyz9jO8tOX2Na4vPoZHMZZzREyMH8XyG95DMjtCsfXrB8QRFuwjVP6NaxaiFMGUJ
 b+AjOl++XqLSro8jYkU8OfwPqn9VcwVPcaxOjrkPhO7uninMd8wPZmpUNgBzZXIL/B92nbKlu
 AWlFEbBZkYfBGXEkoRDlB57fIMcGa3n1zW3FUwO6+gyiawNjrZ5eHbrK/6lgotS+SAVHrsr5P
 Jk2HKpKHnXV7jlVReV3DGdxuEixToXEOZBTyebu4yhYiPI/kiot8BvpouwBTKJVcH1vgCperg
 k51koqErRaVa3mqq1mr8T1tVkFPOC8nSiwivznZ3023QzycDoLBvKvEJkM8DhuldckNeKUhNN
 2nloM0hNSEevka2ZP+Ld4/HlH6O2PxkADc3ZjrLubYg0jo9+zTntHffQ4GNe9VakJVscM+/YY
 Tk9kbWRfgGxEp3vlORC2B++xNitwjY6hQ/57zKu/5YsQ13dFIBA5zgeHXfIOEI4S1TB6567ZD
 EMGIvqCEYQ4T3c4t6eL/d5kG6ttIrea0IM7OIOFRQNHtwP2GYzyBaM/P5+u5cCrmqesxPIv8+
 adqOpg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello again,

>> Earlier you said that with Windows 11 the behaviour might be the same
>> as in Linux. I'll try that next week (out of office until then). If
>> Win 11 indeed has the same problem, then I guess someone at HP or
>> wherever will address this sooner or later. I mean, the requirement
>> for a working network device/stack after a reboot from an OS is not
>> that unusual I'd say...
> I agree. If it turns out that Windows 11 works wrt. this (please check
> that it is using Windows "inbox" driver for TBT) then we need to figure
> out what it is doing differently.

So today I've installed Windows 11 22H2 on the EliteBook, and I can report this:

* The thunderbolt controller is run by a driver from Microsoft (in the Win 11 device manager it's no longer called "Thunderbolt Controller", but "USB4 Host Router".
* I think there isn't even a thunderbolt driver from Intel for Windows 11 - at least on the HP support site for the EliteBook they don't have one (but they do have an Intel driver for Windows 10).
* And regarding functionality: after rebooting Windows 11, the network device is visible in the firmware, and working fine...

Any more test I could make?

Thanks,
Christian

