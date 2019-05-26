Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA05D2A93B
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2019 12:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbfEZKLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 May 2019 06:11:48 -0400
Received: from mout.gmx.net ([212.227.15.15]:57223 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727681AbfEZKLs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 May 2019 06:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558865489;
        bh=RsZzmmSplgdO28RoGwyrViaNFl/kTmVpO3gWicYofcQ=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=eZteg3NakwWwjquYjLdxx92cKYsyjV7TRjaZsZFAs/4aRWwxILuiunOaQaHL4DXs2
         AtpQ9LO+4Z83T1ePgQmNvpS2LTIgwhFYbKhD6QXXmxr1fsbWsRRUXk9nbVREcIVlMF
         JDHUTQv60oCznt6GfmBoWidcNSIZQzUZ3jFZWk7g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.166] ([37.4.249.160]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MIMUZ-1hTT5C20TP-0047nm; Sun, 26
 May 2019 12:11:29 +0200
To:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will.deacon@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Subject: usb: dwc2: RODATA_FULL_DEFAULT_ENABLED causes kernel oops
Message-ID: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net>
Date:   Sun, 26 May 2019 12:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:1dhw3hl/QquHu4b0qlpUUv5UepZ1XfJqfyDw1LRXaSoxGWxpLFt
 c6IzWcCrmkQNkaOsBZaov9zx2QvyKyO9jpCnfUPabUJZWNC4ZhmAoLyZhZkD327VwXvGZA3
 YfLDzg1Rxv+2VqoGkNhMXEItWkTjHb+rQWly0+hZegqZO7PYyhOWRmzR0y0QybQEQq56E7X
 qvfs9yYSC65sCOtu92x3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yTAV9FBPStY=:+GhH0LwmaG47T8JvhAc0Y3
 azIx7ioiRhcYzrkSP9I/wY1l/qQ1Nu4BBav857JgQUaWe36fksVAcgBHjqHOWr6sAGr99B+hL
 rAK3K7XuxHBeVmps9C5aK6d6OX8/RQAAoj3iijdgHL3Jsn+YbR1EKQ/0OPihBAIvgTm+1gBTm
 Xclj8gUAjqfxnqG0pQqeWKyhOzWwm41EmGubDcg3CJcAKuRdTwkAr4N/ySSiw8rxqmBzPpwMr
 A79m5x4t6pc0uFbYtvaq3Ocq/AhqqwKgLZWPLW5BUPK4Wox7LDGJJJZuNlQQ7mZiHEVsZDawF
 tnpnxSFOQPw5OEDYoQfEg1gTlvPtZ5wZdRbAvHRdeFwSFJhgSVxEOep19h7D/4sxfaQ6lJWrU
 k6XI9HbB6TSXJBKCKsJD4LlS4YxiX0j6BKE4I9dVQNOXXwHZTWN3+/OvLoAnUubRL1ruR1eqA
 atufEAjsZBrm+PwcwHLEF+GtbJvfp3NWifzuCKop7/Sly3XbvOC1qeWgAZ9Z5fbLnb4vpqHF8
 5cVe6sFLt9m8Uecajip33TE4dLBehZLSd1F1OJsS4NXJMWQm7ntZrf17p49hhqliQf8ZAcopC
 BJn2jnBBYLQ5k43qJqR9rNW3TFV6guU8LU5l1kpTkOL0S9PcgZgywTNsf7OK4JMygCL16jwrP
 TaJbys5B6XdegzcN/9LeZLI7Gwjl2z5M8j5NF2LESCBxkWvPZv+M2qmCCQZQJojZ5SIn22D1M
 ozRFhreTthkC7BeEcRcbqQAiwPsNmZb4V/WGOiTOYn6pSK1eY+yv+IOJ7tqNZYhu7zKKxDKWT
 o7bR6ZElY3QAW4vmjZci13gytUpKfy03+H5SliTN8LVt2TFPwlqShLEQDRWEHOnTLE/SSIzE7
 vwSc1Hjk2aXBAUL6G8+Q13FrapMMj+KaLy+iZLgdgt0Zywgp/WMXinlEeQf5Cuss3p6OdofPZ
 z1qdC5tbqww2jvvQGaduOb0n7fV9nVUfhF8fcINkd0gyQob9SN56R
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

i want to remind about an issue which was originally reported by Wayne
Piekarski [1]. I'm able to reproduce this oops with Mainline Linux 5.0.2
on a Raspberry Pi 3B+ (arm64/defconfig) and according to Jan Kratochvil
[2] this applies to 5.1.0 and 5.2.0.

The crash is reproducible since commit c55191e96ca ("arm64: mm: apply
r/o permissions of VM areas to its linear alias as well"), but the root
cause of the crash was introduced much earlier with commit 56406e017a88
("usb: dwc2: Fix DMA alignment to start at allocated boundary").

I tested successfully the following workarounds with the RPi 3B+:

1) Disable RODATA_FULL_DEFAULT_ENABLED

2) revert commit 56406e017a88 ("usb: dwc2: Fix DMA alignment to start at
allocated boundary")

It would be nice if someone can come up with a proper solution.

Regards
Stefan

[1] - https://marc.info/?l=linux-usb&m=155440243702650&w=2
[2] - https://bugzilla.kernel.org/show_bug.cgi?id=203149

