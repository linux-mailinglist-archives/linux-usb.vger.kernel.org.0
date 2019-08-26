Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78A619CB44
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 10:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbfHZIJf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 26 Aug 2019 04:09:35 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:3998 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730327AbfHZIJf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 04:09:35 -0400
IronPort-SDR: 2o/2UhbLlwYheKvx9SPHJCF1891OgHvVnf71NYeB30b0gpkIS1OM5ntxXfcBGdOiq7oXoN8a2h
 7bRKSdZkitd8/eZWF1bgyraSq1Npf/lncaYgYO61ZbWMd7dyuatdMrkEQMN+MhZAncSHbuPGgV
 cAKjdNa8dLxjIck9ARYlODnLWFbsqQInkh6+x13f2kv8QbA4tyqFxdppsMI/WQZdn3nQNyOiUb
 8qwGR5INryrlN+XazrEROSdhX3/OIxkwD1lOydE5C8wvMZdsNJQ/aCPZspG6NuI6eKPlHFtdM1
 A4k=
X-IronPort-AV: E=Sophos;i="5.64,431,1559548800"; 
   d="scan'208";a="42556481"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 26 Aug 2019 00:09:34 -0800
IronPort-SDR: 8tuQ56Ljfis9yF1+lP272gS0MYBYCKsZrEt2L/r26WW6d5Zj66VK2eZ2Fpvfxtl4B6roAdXoHT
 zJkS16/M8O0EHn0eZWvl1K/81w9YxpLjjZ3byORxybGF3PqZrQ13PsSMxGXDzfwOOpZyoeWapA
 7dEJ+QvTgnMLgWcNjM8SO3pqAz9OTooEYusl+UNrO07fROwOOarOy/Vv+vl/GYot/NZcyEesDk
 H/2RKnNsqk058hhdJaX2i924fGoGhTF/qKnrLeLUiJh82pEXUYHI6PzOY4ZkBHQPNSXunuLhUJ
 ok8=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: [Patch v5] usb: hcd: use managed device resources
Thread-Topic: [Patch v5] usb: hcd: use managed device resources
Thread-Index: AQHVWbuDnGbGmDS690Kl9IU7UhO1uqcLekmAgAGBUYCAABgOQQ==
Date:   Mon, 26 Aug 2019 08:09:30 +0000
Message-ID: <1566806970031.45477@mentor.com>
References: <1566569488679.31808@mentor.com>
 <20190825082949.GA4583@kroah.com>,<975465c3-6ced-56f6-9115-a19248b370be@linux.intel.com>
In-Reply-To: <975465c3-6ced-56f6-9115-a19248b370be@linux.intel.com>
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

>>> Upstream version of driver is identical in the affected code.
>>> Fix was tested successfully on 4.14.129.
>>> Provided patch applies and compiles on v5.2.8 stable.
>>> As this is also a bugfix, please consider it to go to stable trees too.
>>
>> How far back should it go, just 4.14?  Was this caused by a specific
>> commit that you happened to notice?
>>
>
> To me it looks like the causing commit was added to 4.17:
> fa31b3c xhci: Add Intel extended cap / otg phy mux handling
>
> Carsten, was the issue reproduced on upstream linux stable 4.14.129,
> or on some custom tree with backports?
> 
> -Mathias
>
The issue was reproduced on a custom kernel.
The commit you give "xhci: Add Intel extended cap / otg phy mux handling"
is part of a merge from 4.14/usb to 4.14/yocto in this custom kernel.
Hard to tell exactly where it came in.

Anyway, you are right, looks like upstream 4.14 doesn't have it.
So 4.19 seems to be the oldest one, indeed.

For me, i am fine to know that the patch will go upstream and avoid curious
crashes through this use-after-free in the future. I'm pretty sure that this
could be reproduced with the upstream kernel as the mechanism is deterministic.

In our project, due to a crash that happened short before SOP and
i did not have time to figure out where the problem originally came from,
i did a really dirty hack setting the num_resource=0 of the platform device
prior to platform removal code. Helps but is really, really dirty.
And now as you accept the patch for upstream i can replace the dirty hack
by the official patch for next SOP.

Thanks for all your guidance and efforts.
Carsten
