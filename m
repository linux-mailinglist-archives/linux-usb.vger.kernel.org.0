Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530125AEEFD
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 17:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiIFPiC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 11:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiIFPhk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 11:37:40 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0FDAF6068A
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 07:47:03 -0700 (PDT)
Received: (qmail 382878 invoked by uid 1000); 6 Sep 2022 09:58:20 -0400
Date:   Tue, 6 Sep 2022 09:58:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     zenghongling <zenghongling@kylinos.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, zhongling0719@126.com
Subject: Re: [PATCH 1/3] uas: add no-uas quirk for Hiksemi usb_disk
Message-ID: <YxdR/LJusrGHpwSr@rowland.harvard.edu>
References: <1662434874-5116-1-git-send-email-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662434874-5116-1-git-send-email-zenghongling@kylinos.cn>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 06, 2022 at 11:27:54AM +0800, zenghongling wrote:
> The UAS mode of Hiksemi is reported to fail to work on several platforms
> with the following error message, then after re-connecting the device will
> be offlined and not working at all.
> 
> [  592.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
>                    inflight: CMD
> [  592.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
>                    04 00 00
> [  592.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
>                    inflight: CMD
> [  592.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
>                    00 08 00
> 
> These disks have a broken uas implementation, the tag field of the status 
> iu-s is not set properly,so we need to fall-back to usb-storage.
> 
> Signed-off-by: zenghongling <zenghongling@kylinos.cn>

In all three patches, the name in your Signed-off-by: line must be your 
real name (that is, the name you would use when signing a legal 
document), not an email alias.  Furthermore, the same name should appear 
in the From: field of the email message

In patches 2 and 3, the new entries are in the wrong place in the file.  
Entries are sorted by vendor and product ID.

In patch 3, how do you know that the problem is in the drive?  Does it 
fail in the same way on a Windows or Mac OSX system?

Alan Stern

> ---
>  linux-4.9.327/drivers/usb/storage/unusual_uas.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/linux-4.9.327/drivers/usb/storage/unusual_uas.h b/linux-4.9.327/drivers/usb/storage/unusual_uas.h
> index cdff7dc..2fc6787 100644
> --- a/linux-4.9.327/drivers/usb/storage/unusual_uas.h
> +++ b/linux-4.9.327/drivers/usb/storage/unusual_uas.h
> @@ -62,6 +62,12 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_IGNORE_UAS),
>  
> +UNUSUAL_DEV(0x090c, 0x2000, 0x0000, 0x9999,
> +		"Hiksemi",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /*
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
>   * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
> -- 
> 2.1.0
> 
