Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D530087ABE
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 15:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406982AbfHINAb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 9 Aug 2019 09:00:31 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:13942 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHINAb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 09:00:31 -0400
IronPort-SDR: BXFJjNSuMAfxs3BgCfSIw+hMS2H8o27J6LNyCGjgJmbMkzEM1NgAhWKHKQCNHYIBu8n1EGD45b
 fyke9kdg4AoA4XBz/gTYlwoRnZG61ES5gnPaKG1Cj9FzjkpJcZoA25c3PC9PXKa/0Ggr/vsuJq
 G3KOEa3ROLmGjo4GEajldhf/bW7GtkUKKcOyctq9Kf++8jsk8qZtnRNvasi46Ncp4Kektgm8R7
 ykE+BX8BN/sIr1+KtZ8xEU+v0gI2W1pGFG9Rp7BYklGYYivlKauPS7aVTxjdC3GZKvxpDG1X4X
 ktc=
X-IronPort-AV: E=Sophos;i="5.64,364,1559548800"; 
   d="scan'208";a="40305218"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 09 Aug 2019 05:00:30 -0800
IronPort-SDR: p88PXKN0b8DCEXlNYcdFY16N8px8trPxQPiUC1K5a3bIsnddtGBxgM+U5Ju8xnHjERYUceIJwq
 hwDQ15o41CnGuiCtOuqhZJO6d8CcgBimh6bO5XiZEdldhBh7SHXJfOhgUgz2BrHQ/XBzfyLhGe
 2ERqMN6nWx/WDOxq3BmLfVdaxy3ZTG66lXmPhdoPRciPSlJzUyGBeZJXymQ0Df2zD357M4aTAG
 3ugbyiK1IJ991ZRiiBIx26DcfkXfrnkXUq62IUGJdFUfgvMHSgGmzBW29mJQ+aIXmQ6zJpP0dw
 +f8=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        "Oliver Neukum" <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: AW: AW: AW: KASAN: use-after-free Read in usbhid_power
Thread-Topic: AW: AW: KASAN: use-after-free Read in usbhid_power
Thread-Index: AQHVQVT8kp3cH3z0AEy3rfqKg0QMQKbaMLqAgAAB/4CAANH5gIAAXcMAgBY/mwCAAAvuAIAA2G/Q///144CAAChbQP///+iAgAATm0D///XXgAAFC+Zw///5egCAABGghw==
Date:   Fri, 9 Aug 2019 13:00:25 +0000
Message-ID: <1565355625471.54150@mentor.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
 <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
 <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
 <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
 <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
 <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>,<20190809125458.GA2230@kroah.com>
In-Reply-To: <20190809125458.GA2230@kroah.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>>
>> @Greg:
>> I am still confident that my patch in __release_region should be taken in.
>
> Ok, submit it in a "real" way and we can consider it :)
>
> thanks,
>
> greg k-h

Already done, linux-kernel@vger.kernel.org, see
https://www.spinics.net/lists/kernel/msg3218180.html

Thanks, and have a nice weekend.

Best regards
Carsten
