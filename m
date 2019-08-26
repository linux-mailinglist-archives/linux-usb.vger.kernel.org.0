Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6293C9CA01
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 09:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbfHZHUd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 26 Aug 2019 03:20:33 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:2102 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbfHZHUd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 03:20:33 -0400
IronPort-SDR: kp+a/J3iRS7LAH5/vt1m3RClaZVsrPBVoaiMHeAlgl8yDowF5AtEIB52rgX4ujutiMsCNDAoF9
 XrWWp2KzCIS1qTuW5qy+j6xyR3907aKyeAbEgy6xDJvSxPoPdaJ9DmyTETLbCBP5MQcEKYSS8G
 631zov2RyWoYBCpjDWATazm5x5EL2TZkd8UKgkAZWr1f2eE8shHwL8ffZNEFSHbej/ESlQyakI
 9Ywo4OVmBnOOSW4KPhsF6I6FoKFrjozlILRtCo8sRbX68UNW8mzfYPHiBbfTyIPSNS4IKGr3sQ
 fo4=
X-IronPort-AV: E=Sophos;i="5.64,431,1559548800"; 
   d="scan'208";a="42555463"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 25 Aug 2019 23:20:32 -0800
IronPort-SDR: GAg1vJ5mBAbdtVBJuAFQvQXcZgqB6qp9xU0T9lX6dBrazCeKxNOQNjyDHS4i/WAewOgYBCTayU
 SU2+dO19J+NJ57IZbKSZdE0HVG7tnKcfcvt95lxTceF2T63A3ZNdCJuZcT/b2mF7gwdsF+l018
 76Kh9+hryAAGVz3TOnILSualZNjRo/4fA5RUofImrn6w5HBww56640OmjCUHGO/tJsIOcGvFUO
 oZG36CWi6b9oQBRkuEhxcNsDn32ttw7M+cq+fD+CKOBKhMxVZ1vDZQj56xq4oVSWM7wLr7waOy
 2ps=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: [Patch v5] usb: hcd: use managed device resources
Thread-Topic: [Patch v5] usb: hcd: use managed device resources
Thread-Index: AQHVWbuDnGbGmDS690Kl9IU7UhO1uqcLekmAgAGOS9Y=
Date:   Mon, 26 Aug 2019 07:20:28 +0000
Message-ID: <1566804028404.60821@mentor.com>
References: <1566569488679.31808@mentor.com>,<20190825082949.GA4583@kroah.com>
In-Reply-To: <20190825082949.GA4583@kroah.com>
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

>> Upstream version of driver is identical in the affected code.
>> Fix was tested successfully on 4.14.129.
>> Provided patch applies and compiles on v5.2.8 stable.
>> As this is also a bugfix, please consider it to go to stable trees too.
>
> How far back should it go, just 4.14?  Was this caused by a specific
> commit that you happened to notice?
>
> thanks,
>
> greg k-h

Looks like the ext caps driver has been introduced in 4.17-rc1 and backported to 4.14.97.
(at least my git history tells so).
4.9 doesn't have it.

So, yes, 4.14 is the "oldest" candidate.

Thanks and best regards
Carsten

