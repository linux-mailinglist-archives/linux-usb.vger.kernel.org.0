Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7FB56018B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 15:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiF2Nlr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 09:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiF2Nlq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 09:41:46 -0400
X-Greylist: delayed 497 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Jun 2022 06:41:44 PDT
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746B415FE8
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 06:41:44 -0700 (PDT)
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
        by mailhost.tip.net.au (Postfix) with ESMTP id 4LY2Tw6w20z9QgT
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 23:33:24 +1000 (AEST)
Received: from [192.168.122.14] (unknown [121.45.58.108])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4LY2Tw6ShBz9Qfw
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 23:33:24 +1000 (AEST)
Message-ID: <a1ac4690-4d46-4461-a90f-dfa4777dbf54@eyal.emu.id.au>
Date:   Wed, 29 Jun 2022 23:33:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To:     linux-usb@vger.kernel.org
Content-Language: en-US
From:   Eyal Lebedinsky <eyal@eyal.emu.id.au>
Subject: SATA/USB caddy - wrong device size reported
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I do not know if this is a USB thing (but I think so) or an IDE/SATA issue.

I was reading (dd) a few disks and used two different mounts, one is a direct SATA cable, the other uses
a UDB caddy.

When I later attempted to loop mount the (dd) images some have failed. The system log show
	bad geometry: block count 488378390 exceeds size of device (488378389 blocks)
And sure enough, fdisk shows the device as 4 sectors too short for the partition:
	Disk set-68-disk-23.dd: 1.82 TiB, 2000398931968 bytes, 3907029164 sectors
                                                                ^^^^^^^^^^
	Units: sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disklabel type: dos
	Disk identifier: 0xb2c564a3

	Device             Boot Start        End    Sectors  Size Id Type
	set-68-disk-23.dd1       2048 3907029167 3907027120  1.8T 83 Linux
                                       ^^^^^^^^^^
This image was copied from the USB caddy. Plugging the disk directly (via SATA cable) I get a good geometry:
	Disk /dev/sdj: 1.82 TiB, 2000398934016 bytes, 3907029168 sectors
                                                       ^^^^^^^^^^

This is a worry, looks like the caddy cannot be trusted.

I looked and the other copies I made today and it seems that the last 4 sectors are always lost, and the partition end
is beyond the device size. However the mount usually succeeds because the fs does not use the full partition
due to the 4k block size.

Is this a known/common issue? Is this a problem with the caddy?

I never noticed this before and would rather dump the caddy if it is at fault.

TIA

-- 
Eyal Lebedinsky (eyal@eyal.emu.id.au)
