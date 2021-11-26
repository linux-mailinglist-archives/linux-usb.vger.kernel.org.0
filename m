Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C19445EBE5
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 11:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376984AbhKZKwU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 05:52:20 -0500
Received: from mout.web.de ([212.227.17.11]:43363 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232018AbhKZKuN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 05:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1637923619;
        bh=5qzCmt/KiGBUmO+l70ZlynKaQoyTqFnq9D5GcYTa4vg=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=EIAQhL+ocw3N2rJyN4M+BYGX2JaSgmQXkgeSd7nTqGbakOJS8kSIuoHiLi0raTe13
         HzgpsvldKDMrIjIlFgc+GI4DoTHgcEmOM7hjbEDupaVjdoHNjagM3s4W7xphj5TmYa
         WOFRU+SyMC/5b22gAbbCKpyvoDBKBwAMIck27nsU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.37] ([78.55.209.233]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MC0LH-1mlIMA0MBh-00CHI2 for
 <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 11:46:59 +0100
To:     linux-usb@vger.kernel.org
From:   Andreas Ehlert <evlaim@web.de>
Subject: usb.ids entry for brother MFC-290C
Message-ID: <a045af57-9b40-5a0a-24b2-0b41cd44e3db@web.de>
Date:   Fri, 26 Nov 2021 11:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:wlg99L8q8YhTErCQxJn5jONEIzk8uRSMOjsKQmV6UZ1LZY3Z5k8
 hxUHY7PyTl0PVp4A8GPs7Cx6ifjLlKKuBCu4lxnPIuqnfGcyTn6QKLtVBSwrT+Duh5e8vkA
 Wn/r956dFwmpTxa5ZB+HKZQWtxhIYOznUCzzr0Jj4py0YSdVsxNOBGC3eoj56eplaZUAXHe
 eYLvqseNRHcZMxZW6cwLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZBN3S9Av6Lc=:EdU9XKLKVed9sPkzBnapEN
 EnoYH9kbmHRhOF1YaNGu128lm4J4k34UcxKPEvoNf0wFlX9EvR08sE+rHbtBRev445dYU2cJw
 gxGj64SOG1f9oSuyzvAOfhOWQs1NRMV/AKABOL9zjySIaHlbGmp6WwH4qj61uxaDevUZvFeAv
 HcWc0/97M42xht3lI6eN7R3O2ifdxGPjTt+lOq5zWgik5sK77SWi+Px0f7XJFI9DnR+seB5QI
 xQjwvBQrfLBHB2dcyaCviHmRD8BflnzyfFjmyrmBOBnH6qwt4k8gUPkA03R+2mUbhi/48Nx8t
 ZsgjRxTX2Nd24pcjYw/MXwN80GSbP0idAHCrH57Y7f6tkVJ03Tku1O79PtGBhOLrASJ10k96N
 lqTvChREHsaACJVr3+cri20uuNYb8djhnFaeH6MiyM/+3EXnZNURWDYH16VclPusAwmldhKod
 /H8Y6Y88WGcz0HMvvz1yRmVwDQJ5vhCaRYHsL8sEs7Ku0ebui7T3aBZ5QUWkFDetKShwi+1yI
 HJTCgf2l2Yl00jZY4B03tiVC5391Q+tjteLshus4Rwc+Do9QSXbgFPcS/rOvlKH4p4CL3/NQy
 qo9zj2ARjvi3Csjnxy6lqG632Av48p0S2UDAiTXrQEFZQwrxdIkuG/Brbg5v7+lb0YLEmuo97
 tiqd9TZKLgTpiyEoYyjaLuHLqYHSvQd8qqJcs9UTgW74WnNVTtVf6ax+UxRqiLgRpEjie9g6i
 NPiZowkE1VB8QWYyfP6voFM/OtswSnygzLOpOrwavJHt9p2wm/coab1tSG+tTRJ58R5uuZEEv
 Fek+L10q/2f+tQcEKRAS8KVTnuqpN0HRFBM96C5Qrtw0qvaXeoX03xAaK1FSyKQ9H5DuDxXcq
 da858T9qRF4N0AhCmDYHhZM9UDq3QtS5s+SHCKeZWxNRiYYeLG6we3hMRA9ik2QauHhO1ORiA
 3AoDeS/zK/W7Odzl3akqIltqFdjVGZ9MMRfjKtkwMdQqGZ2oOfO2uXQdGL2SfU0ltoh7arzZQ
 3VV2miqDiG459Be2PDoYFiEFtwJ+5ujvYdF+BW0wlFdhfPU1Co9TN0qzKQePe1w/f2VyL8E5h
 nEbdFFJMtsAAqg=
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

hello there,

i will not communicate with a robot.

some issues with my distro devuan and udev (sysvinit). after an
installation for my old printer device
brother mfc-290c. i got some errors from the udev service.

the failure was a wrong term in the rule script for sane (manually
fixed) and no entry
in the usb.ids (manually fixed).

my question: can you add the entry in the actually usb.ids?

04f9 Brother Industries, Ltd
 =C2=A0=C2=A0=C2=A0 01fd MFC-290C

lsusb output:

Bus 006 Device 002: ID 04f9:01fd Brother Industries, Ltd MFC-290C

i know it's an old device, but i use it to scan und print things.

best regards
andreas ehlert

