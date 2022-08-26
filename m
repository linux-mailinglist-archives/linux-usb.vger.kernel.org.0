Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B555A1DCD
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 02:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiHZAt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 20:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiHZAt5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 20:49:57 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 780C023176
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 17:49:56 -0700 (PDT)
Received: (qmail 21716 invoked by uid 1000); 25 Aug 2022 20:49:55 -0400
Date:   Thu, 25 Aug 2022 20:49:55 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Maxim Devaev <mdevaev@gmail.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Possible corruption of PMin,Psec,Pframe in storage common driver
Message-ID: <YwgYs9xyEyJYeWHe@rowland.harvard.edu>
References: <df68c67b-78e3-115b-4764-225e17091903@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df68c67b-78e3-115b-4764-225e17091903@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 26, 2022 at 01:05:06AM +0530, Krishna Kurapati PSSNV wrote:
> Hi Alan, Maxim,
> 
>  Sorry to multicast a mail.

Messages like this should always be CC'ed to the linux-usb mailing list.  
Even if they are purely speculative.

> I am seeing one regression in emulation of my
> linux target on MAC-OS. I configured my usb_gadget containing mass_storage
> composition as follows:
> 
> 1) echo "yes" > mass_storage.0/lun.0/cdrom
> 2) echo "yes" > mass_storage.0/lun.0/removable
> 3) echo "yes" > mass_storage.0/lun.0/nofua
> 4) echo "/sdcard/download/autorun.iso" > mass_storage.0/lun.0/file
> 
> When I try to emulate it on Windows Host, it mounts fine and I am able to
> copy all the files from my iso file to Windows PC. But when I try to do the
> same with Mac-OS, I see that although it emulates, I am not able to copy all
> the files from my iso to Macbook. At some point after data copy has begun, I
> encounter the following error:
> "The Finder can't complete the operatin because some data in file can't be
> read or written. (Error code -36)"
> 
> I suspected if we are not providing/advertising the contents of cdrom
> properly and wanted to check the diff between Windows/Mac and turns out if I
> make the following changes, it works fine :
> 
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -295,7 +295,6 @@ void store_cdrom_address(u8 *dest, int msf, u32 addr)
>  {
>         if (msf) {
>                 /* Convert to Minutes-Seconds-Frames */
> -               addr >>= 2;             /* Convert to 2048-byte frames */
>                 addr += 2*75;           /* Lead-in occupies 2 seconds */
>                 dest[3] = addr % 75;    /* Frames */
>                 addr /= 75;
> 
> 
> Mac-OS has MSF bit set to '1' in its read_toc request and Windows sets it to
> '0' in its read_toc request. In case of Mac-OS, the cdrom addr which
> represents the curlun->num_sectors is already in blocks of size 2048 bytes
> as configured by fsg_lun_open(..) with
> 
>         if (curlun->cdrom) {
>                 blksize = 2048;
>                 blkbits = 11;
> 
> 	num_sectors = size >> blkbits; /* File size in logic-block-size blocks */
> 
> I did a little digging and found out the following patch [1]
> 
> In this patch, the fsg_lun_open call had the following code:
> num_sectors = size >> 9;	/* File size in 512-byte blocks */
> 
> And so, we had to shift it by 2 more positions right in store_cdrom_address
> to make the number of sectors as 2048 byte blocks, but the latest code seems
> to be doing it already and shifting it further by 2 bits is affecting
> emulation on MAC.
> 
> Can you help understand if the cdrom address is really messed up or my
> analysis that response to read_toc cmd is messed up when MSF is set to '1'
> is wrong ?
> 
> Wanted to confirm with you guys before pushing a patch as the pinged patch
> [1] has been done 11 years ago and its highly unlikely that it is buggy.
> Sorry again for unicasting a mail.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3f565a363cee14d2ed281823196d455bfc7c4170

You're right; the code in store_cdrom_address() is buggy.  Apparently 
the 3f565a363cee commit overlooked this one use of the block size.  The 
fact that this hasn't been noticed for 11 years probably just means that 
the this part of the code hasn't been used much in that time.

Please submit a patch to fix the bug.

Alan Stern
