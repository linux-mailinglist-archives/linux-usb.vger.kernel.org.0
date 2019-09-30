Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4857C2710
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 22:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfI3Upb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 30 Sep 2019 16:45:31 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33795 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729057AbfI3Upb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 16:45:31 -0400
Received: from [192.168.1.162] ([37.4.249.130]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MHo6Y-1iJykt390g-00ExUl; Mon, 30 Sep 2019 22:45:25 +0200
To:     Matthias Maennich <maennich@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>, linux-usb@vger.kernel.org
From:   Stefan Wahren <stefan.wahren@i2se.com>
Subject: depmod warning: unknown symbol usb_stor_sense_invalidCDB in 5.4-rc1
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <f78f3025-a50c-5111-b022-12fea1375795@i2se.com>
Date:   Mon, 30 Sep 2019 22:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Provags-ID: V03:K1:T4YMdijL2+8vXMfbGgOrsExFbdelayGuiQbaEkJYwXQHz5n/i3N
 A0pLNVPwTG3nMjZ4xyfhTIPCb9B16i/pQSGFsBf1wdzM38BPwOqxT6Qh1XTImDxN3PCLyG6
 a3UC5cY59PhcImnfj9UCiMjG+t7PxKkfj5KQI3xyHDbYMb/C90txda9ReW9UjOeXZGJas20
 fBeQl0r3trmGwEcNTNQqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mrkzaBVUHNc=:oDxUa3MtA7stbugTUv5VBW
 yhcg+mtDrfi3FSEm4X/q4EDfgJhyyaxHBLHXri2xgFwt3u2DLc6kCjvFUV+QE9fqqiUA31OBD
 vr+2YFlJmnNQaGAmV/9y+uxZ1ZqJn3olaVuzK4OnEFJADfi4thfwYSkJEWBdosctqlNJACrRU
 g+/6wh02Ac10IUwpY6tYlGfLPMz88zNWvDSVt7pY9RAoMI2ebKHMlwhTw8JeZAbEiO1Etv3PJ
 O/AkN4tNcmOspeosxv+ZJpM6tntPSeHjVFGgAsaziczgvI/8FXcEzXxvaxyePYBp3Kp8IXtzJ
 FVhSSyJD+RoE/lAK7TYuxkYqcijMXRtjsEoyeBfNA2XgppR0oxaSEkz83ZQwbDfw64LQqgfRo
 gRGqG8ZHCx8mrpN+WAzApuQyMpfL3gtXxBX/dqVGoT1kVmRpzfh596IgO8VLiTNa6BeDPLZfd
 qwWd/jJQIrSydfsaYGi9zAr1gpOjshRKAg4xnM26dFdslR6DFfsZcXebIVRECScZQ+0CVufWu
 OILo0qpupQrIoaQvtThjFn0JHenvGbVVPwjm9bGyfrXL3w00FyiefizODW+DjpXBbnXING3yw
 nlrmXo/k1bFeiIwMrZLHn3i3LT98nZzSUslJ7bQL2nnqiwZjihJ30XI6zySg6ceTVE0nm6WLW
 djwZC4TXK+bpj8cvehaY77fkht50ug853b9VF4S4yJZ5KKai1xYrbt+fvk9VArlXrDr8kt/w1
 wdwDZH96MwRVUcuDi9/S3g+++M9crHZntULFF/IBO3bOFnkzEDl7AEmu3ODjG0M7szYAqAyCK
 QoMoZyNAl4+VP4Oz2pMuM1BihiHwZXRM6TlfdmlDz5q7QRMkyydIRqLzhjfYqVqgzQAaLKnIB
 q7E+ZbJ09R2jyoksMlK6G2MR2d6VOiDH/1m1lGe6s=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

during make modules_install for arm/multi_v7_defconfig on current Linux
5.4-rc1, i'm getting the following warnings:

depmod: WARNING:
/media/stefan/rootfs//lib/modules/5.4.0-rc1-00006-g4a80125-dirty/kernel/drivers/usb/storage/uas.ko
needs unknown symbol usb_stor_sense_invalidCDB
depmod: WARNING:
/media/stefan/rootfs//lib/modules/5.4.0-rc1-00006-g4a80125-dirty/kernel/drivers/usb/storage/uas.ko
needs unknown symbol usb_stor_adjust_quirks

Reverting 32bca2df7da2 ("usb-storage: export symbols in USB_STORAGE
namespace") makes the problem go away.

Would be if someone can take care of it.

Regards
Stefan


