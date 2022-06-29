Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57035602C8
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 16:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiF2ObO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 10:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbiF2Oav (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 10:30:51 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5333330F54
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 07:30:49 -0700 (PDT)
Received: (qmail 190962 invoked by uid 1000); 29 Jun 2022 10:30:47 -0400
Date:   Wed, 29 Jun 2022 10:30:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc:     linux-usb@vger.kernel.org
Subject: Re: SATA/USB caddy - wrong device size reported
Message-ID: <YrxiF/uE0/0Kw7rJ@rowland.harvard.edu>
References: <a1ac4690-4d46-4461-a90f-dfa4777dbf54@eyal.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1ac4690-4d46-4461-a90f-dfa4777dbf54@eyal.emu.id.au>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 29, 2022 at 11:33:12PM +1000, Eyal Lebedinsky wrote:
> I do not know if this is a USB thing (but I think so) or an IDE/SATA issue.
> 
> I was reading (dd) a few disks and used two different mounts, one is a direct SATA cable, the other uses
> a UDB caddy.
> 
> When I later attempted to loop mount the (dd) images some have failed. The system log show
> 	bad geometry: block count 488378390 exceeds size of device (488378389 blocks)
> And sure enough, fdisk shows the device as 4 sectors too short for the partition:
> 	Disk set-68-disk-23.dd: 1.82 TiB, 2000398931968 bytes, 3907029164 sectors
>                                                                ^^^^^^^^^^
> 	Units: sectors of 1 * 512 = 512 bytes
> 	Sector size (logical/physical): 512 bytes / 512 bytes
> 	I/O size (minimum/optimal): 512 bytes / 512 bytes
> 	Disklabel type: dos
> 	Disk identifier: 0xb2c564a3
> 
> 	Device             Boot Start        End    Sectors  Size Id Type
> 	set-68-disk-23.dd1       2048 3907029167 3907027120  1.8T 83 Linux
>                                       ^^^^^^^^^^
> This image was copied from the USB caddy. Plugging the disk directly (via SATA cable) I get a good geometry:
> 	Disk /dev/sdj: 1.82 TiB, 2000398934016 bytes, 3907029168 sectors
>                                                       ^^^^^^^^^^
> 
> This is a worry, looks like the caddy cannot be trusted.
> 
> I looked and the other copies I made today and it seems that the last 4 sectors are always lost, and the partition end
> is beyond the device size. However the mount usually succeeds because the fs does not use the full partition
> due to the 4k block size.
> 
> Is this a known/common issue? Is this a problem with the caddy?

Historically the problem goes the other way: Lots of devices used to 
report a total size that was one logical block _larger_ than their 
actual capacity.  This was caused by the firmware authors 
misunderstanding the READ CAPACITY command, which is supposed to return 
the block number of the last logical block -- but instead they would 
return the total number of logical blocks, which is one higher (since 
the first block is number 0).

Nowadays most devices seem to sorted this out.  It looks like you found 
one that makes the opposite mistake: The value it reports is one less 
than the last block number.

It is definitely a bug in the caddy.  On the other hand, this bug 
probably doesn't affect the rest of the caddy's operations.

Alan Stern

> I never noticed this before and would rather dump the caddy if it is at fault.
> 
> TIA
> 
> -- 
> Eyal Lebedinsky (eyal@eyal.emu.id.au)
