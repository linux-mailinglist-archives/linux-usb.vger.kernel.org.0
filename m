Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4BDF6E01B7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 00:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjDLWPV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 18:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDLWPU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 18:15:20 -0400
X-Greylist: delayed 525 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Apr 2023 15:15:19 PDT
Received: from mail-200160.simplelogin.co (mail-200160.simplelogin.co [176.119.200.160])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0EA6589
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 15:15:19 -0700 (PDT)
Date:   Wed, 12 Apr 2023 22:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8shield.net; s=dkim;
        t=1681337192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=3QIKZYyDwVYZ16tbgagaCvjpy0LQkwhUHoy8ARF4pbc=;
        b=SO/2vKiGPHE61Wg8VhD/2C7T3YZq24l0MHkfS6JHN8ARWcBPc49jXBGPHy3CMghSJmO7LE
        wfqwyVRahBiOL8abGQEkyX3Wk1MHhnRE8WhkHNn0VH6jNxx80n2JRXJHoTUP1UCM664h+C
        tDZkU5ZFynPdcRP0AOq9O5vAtoDOCkw=
Subject: btusb driver need to be unloaded and reloaded after boot & lag issue
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   help.7ocym@8shield.net
To:     linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
Message-ID: <168133719213.7.14774994518515251513.119182329@8shield.net>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 119182329
X-SimpleLogin-Want-Signing: yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
sorry to address both list, but this issue seems related, without knowing w=
here lies the issue
my hardware : https://wiki.gentoo.org/wiki/Lenovo_Yoga_900
I use the pre-built gentoo linux kernel,=20
6.2.8-gentoo-dist #1 SMP PREEMPT_DYNAMIC Wed Mar 22 17:15:39 -00 2023 x86_6=
4 Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz GenuineIntel GNU/Linux

since a few update (sadly I didn't noted the latest kernel version that did=
n't had the issue), after a boot, the bluetooth isn't working, nothing bad =
in dmesg, I just have to unload btusb module and modprobe it again to have =
bluetooth working again...

after a suspend to ram, I have to power off-power on the bluetooth to have =
it work again (bluetoothctl power off; bluetoothctl power on)

bluetooth mouse can also be extremely laggy sometimes,but without error mes=
sage in dmesg, most of the time `bluetoothctl power` off-on cycling do solv=
e the issue....

I also included the usb mailing list because it might be related to some be=
havior I noticed :

I have usb3.0 micro sd card reader (SanDisk MobileMate UHS-I microSD Reader=
/Writer USB 3.0 Reader, Kingston MobileLite Plus (MLPM) microSD Card Reader=
 USB 3.1 microSDHC/SDXC UHS-II, for example) and some extra fast micro sd c=
ards (like sandisk extrem 512G), when transfering data the read rate can be=
 as high as 110Mo/s and write 70Mo/s sustained, nothing impressive but when=
 such rate is achieved for a long time (big file transfer) either reading o=
nly access, writing only access or read write, the usb bus become unusable,=
 I can't even use a usb mouse connected to it by wire... even if cpu usage =
is really low (less than 10%)=20
I don't have the issue if I connect a M2 usb3 flash drive, with comparable =
transfert speed... so not related to some bus over usage... =20

so I suspect that there is an issue with the usb driver, and that maybe the=
 bluetooth issue can be related to the usb issue, since the bluetooth contr=
oller is on the usb bus on the laptop

the transfer issue of usb is much more older than the bluetooth issue, it's=
 approximative, but :
 - the btusb boot issue is about 3 month old,=20
 - the suspend/resume issue of bluetooth is more than a year old
 - the usb transfer issue as more than a year...

I'll gladly provide any useful information, can also do patch tries...=20

thanks and regards
JLM


Sent with Proton Mail secure email.

