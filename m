Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8E26BE8D8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 13:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCQMI4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 08:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjCQMIz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 08:08:55 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F737B5B5C
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1679054923; i=deffo@gmx.de;
        bh=oDc7dMFeLvxRiowskZqRj6yFsBa2N+XUnCpyLMc0cxY=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=Y/vL/M4Ex7v3uf/A2wnhlvUS/VvD46xMpQ0POB+gAVZoDQvoc5aIUAtJnaIQHexOG
         rJimJzgTq5JSp3WmsZs6bsRWQxldS9sUf+rSBLTqDqqaeVPOkliSqT0wpZ8GLaVfnI
         OotR1MR1d0Nu8oy34I0dpi3YsA7R6tPnQ+EtIX7P877QTH9hvYzSYfB2Af6Nsx2Zcs
         fg90oYLN8yhwWkTgzk0POhoCVdWUDgEmLKMdXU8pa77OFCFlurBzKQXJz3dM7gqiwN
         um4JYO+FRe3hfz9yS0z5kzb5Fqxa+XE0HwSk22APxgIQ2OiawPOxinw3mNVjBHr5ca
         8yiMN5EilLpBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [46.5.1.147] ([46.5.1.147]) by web-mail.gmx.net
 (3c-app-gmx-bs70.server.lan [172.19.170.215]) (via HTTP); Fri, 17 Mar 2023
 13:08:43 +0100
MIME-Version: 1.0
Message-ID: <trinity-b95eeb12-c36c-47ae-9981-7418e68964a2-1679054923002@3c-app-gmx-bs70>
From:   deffo@gmx.de
To:     linux-usb@vger.kernel.org
Subject: UDC core dependent of CONFIG_MODULES?
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 17 Mar 2023 13:08:43 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:ust/fHI7kRrjQh6EiIlouxlVx04e7QC59MXU9M3OCHXtHm8jJerj/WuSOiwwfIONOmb4v
 Yw4JubdRxUHNvaW/WvLv0IglesvUahGspu42b158WuQzJP0clQQvIXdr8rMq50G21oDkIFrxHFzv
 4YNyKDTnzRGVmo4Nf/+NiZpasn6ttYrBzBgmemwxYmIqMJr7Hi8z82gkntyW3oE2c5+Jdz0wG6T6
 NCFtrZBTiGxYYyC8nW6dFnyqVVuyl6WNvYT2b3fmiXA8nUWHRirOdd+6BpTJYIR4GSZCfeJ/YjZP
 jw=
UI-OutboundReport: notjunk:1;M01:P0:krnMd87QB5s=;i5vbKHXUI+JGAla7J0qUKymVQBi
 sY3n4hH7FBo8d9T0owu3FIjfNsxFBaeX3+febWDWfR/Dr//DW2Uu6+CpmZJEaRRBVKfZQj9FF
 1nyBaLtCGlElh9hzoHDMHCTKJ+wRlR8x1RcrxfBBxOLfRyeGzloOMIsECC2FiCyasRO06hRRL
 n8qW7mkDfwVGgXPSJoTu+hGmuOLhbQMBE4llWftOqmP2kkZFfesqkarLnbvMRhAdno7GJfpkp
 GFIh+8U0DjjHShNDjjZzGYNrybBsmZ0INSNIS0zzXNG68nzJjX7fDjyLnbCuJq9bkbYsHokJc
 Jz0sdeLNLUHoC0BiVNb4DzAGKwWnwn9elfQpYShOSRTKTCYpuatI0Rx5DRsK/RpTUMa2E6xzr
 CFaO9I1P3GB5Gd0I6Cz4PyKIIr9ow3CcktVL+DuuMNoPFBOaXYSIJCS+v7YiR7+5LMlS9G0f7
 9btJVejrQTGtK21aAMDQfEBSam+lKSqN519TLZpVQHSR1LgjE2ketJxm94o8pkzf7Nkvmnnw4
 Zvel4E/vG3QJxSHXIq5sr/qhSl9F8W5ZuXeJ4h6cAbSG4DqbuTANDX0YIrPtV7oEOqNOjY/QY
 4wT+hS0Cw9gOmtQ9cFGHJsPNPZzsMA4JNKFZdWrgr6c76tO5/H4iyEAcCUjD7YQQOPFHq/VAz
 qxXsU+k5/SjJorjohH8X1GJaaGopU4B3CT15acnEimz2cf3XA5D8TJ03o2253Fz3outJFzum/
 roF3yygVR7e13huqbUzQe5NbUkj1CG2nZBz03x0k0DxZ0MZw+a0AAcPxUBeqTLj6/B+damKml
 xuU79YD2ITNriFc/ljD2V1Fw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

is the UDC core meant to be used only with CONFIG_MODULES=y? Because I have the problem, that I want to configure g_ether via CONFIGFS, but when I do

ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/g/UDC

in order to enable the gadget, I get the error:

[ 314.569798] udc-core: couldn't find an available UDC or it's busy

Sure g_ether is already enabled via UDC and as such cannot be configured anymore:

[ 9.981767] udc 49000000.usb-otg: registering UDC driver [g_ether]

Trying to disable UDC via:

echo "" > /sys/kernel/config/usb_gadget/UDC

won't help either. Am I forced to use modules here? Or am I doing something wrong?

Bye,
Joe
