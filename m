Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3683C65B175
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 12:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjABLrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 06:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbjABLqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 06:46:53 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EE4F18
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 03:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672660004; bh=H2YD6ihZiQ+pvJ/mpn1BGeavL7q8R8gjIMkcDQYUazQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=sB0v6Nb8AST6PaUsotQIE/iVjL9NDjbm7zu98YvMbTB/6TxKoHOn7zspLpSKprJzC
         Ah23BlVDzU+V8I7KWrkLGKA4dKhEtti4YKu1k/MDOAcg5fzFPBH9S8Rt9xVC7LnTPO
         8RrAmVG0a7AyGa9xmZqKHFUZtqClY8KQa0v9HgAs9T/uF/XSUhuxLL6u0Jupzvf1og
         wtS73ioxbPOM3wa7tqZxWhFoX38GyrEfpD6BxjAQBIP5797nr+9H9jiizdHY8/uRdM
         OLH5xp3/a/GtPEmPPMMH9Z1C9/kfKa51ziVg3EXDF1nl1jsn8mhb3hmQ/DKpMsflc8
         OM2UoWvCnrWtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf0BG-1oaFm220Ve-00gVN3; Mon, 02
 Jan 2023 12:46:44 +0100
Message-ID: <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
Date:   Mon, 2 Jan 2023 12:45:40 +0100
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
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8y1LI9fGvdXiiOr8FI0BiRpyoUbEZHjVT1hhGw81nUPLJsBC7qS
 HORC7qtuscnJqQ865WlVrCmAfXvJr8LHguEOH1SqLblWrU+we70a2spop/7M/Jq9EulA0md
 CNeE2NpEpGi2z7ezCSLf8ntsDmcDteu4tn54Q5hpElUsv9CsxJl97wCNDYLzy8+tiMnrm6T
 DzNQ0htOS31EvF+2WU6fQ==
UI-OutboundReport: notjunk:1;M01:P0:ZESf9wNGcVk=;uy02u2+80w2sYa3AnFwZ3jBh3+P
 fycdOEds+JxB61pWrL/ySegNCine6nQz4TNLfoKzffa94Kb9Qqk/8otFq6hTvwFAwF2tIy9xk
 /soozfU4FFKjVGxjbWXNv1oT+dsT/dT5Ina+XI3H8R4/lQAST8bcsk4kVIhkj+EKr8kBpyTaX
 lVqR2n/KJT5JurnHUnAP2e3biLWCPF8hRkCgzO62IwmobbFHBHzJ7Qh+Watg3G5yS9xVOt5qr
 SPwg9W+k6ya6rrS4NARllYQtEC+ysMsHEbidxPUEVxyaaMANZ6QoKGnwqavI0skt7YbxcDdqX
 kuhgmuCC6wKlo9mfGNCYj+57TS00nPt3/2IpeiEwpyYYNR0grS5Dj7DmiBq2iKcksYD/zIbcN
 nmK2D7OFx7HaqHJjs6ZjFwxNqsjyEXw5q0VHtYxDmTJ25D1AOlKOtmJN6bpZWUqtAjn5wePfo
 EH5/7EXxddBP1trjA9xKExvgMwiBy5mmv/I4zRpreIT5oP/whgXqQ8cbEuljNJsfRaYopR3fl
 XaLWp7gKAezXpe9CWF4MPT5lfcgzPeqe42WWS/XfBm7hei1lui4eCLzwRAd29KQJeM8Um2h++
 Nyt9z4srzqPPL87b42c/FbfllVOg8rvGGFH1IV9EG6Efl4/c2IwT0bK24+3uPzaQKZz2BZRMu
 rDL0+DIWbSdtUUbM/CzhA5gC8vHBptLSIcfhHsggSIjOiXLNiByuQ2Z7l+7l9OegCWr6bbhPk
 RN7TqKRuT5qtGb7xEGN7JKlTvpn9Dy9p75cwpXQ5RxlB96ODT73xxzqqM/Pgl/VnlOH8xqm9I
 3AmX2k7ACSQ1pMkXbEPiN/yYKt/9aqR6V1cWkNapGzvLf2zNmYBZ+CSowSDFowPa6I8ZUdOE5
 wbqr1U31QFRl5XJmmrt7Kt6w6xoBXDNtL/Fy6wIr+P3Zzzd9AuaIJdkTSWr0GK9AKcov482tm
 JlgiGQ==
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

>> After echoing 0 to the 'authorized' file, the devices disappear in
>> linux from the PCI bus, but unfortunately don't show up in the
>> firmware after the reboot...
> Okay it may be that the USB 3 tunnel that is still up makes the CM in
> BIOS to think the hardware is in unexected state or so.
>
> This was Thunderbolt 4 dock, right? Do you happen to have Thunderbolt 3
> device or Thunderbolt 3 active cable around? If yes then there is only
> the PCIe tunnel so doing the above de-authorization should in theory
> work. If no then one option is to add the ->shutdown() hook to tear down
> the tunnels.
I have a slightly older EliteBook with a TB3 controller. The TB4 Dock works flawlessly with this.
And I have the predecessor of the TB4 Dock which also uses TB3. This works fine on the new EliteBook with the TB4 controller.

Both docks have their thunderbolt cables 'built-in', so I cannot switch cables...

Any more tests I could make?

Thanks and best regards,
Christian

