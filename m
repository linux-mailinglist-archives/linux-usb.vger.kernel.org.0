Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75C405A922F
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 10:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbiIAIhU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 04:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbiIAIhR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 04:37:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB84012CB31
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 01:37:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E5C4B82492
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 08:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934D6C433B5;
        Thu,  1 Sep 2022 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662021432;
        bh=OJ/3u3NUtIXDEfIRDU0iLh08TEQiNKVgN8QzAwaQCQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=liFiQbhXcmujgTFgGt1eM347D0HwPWjjYQsQ3n7Wu5DfB7axjgza0llnADJjZPLKX
         7B3BN5hfRIVzajiXoNzg2lhJ4VR2syyEMzJnHk5NlPEcWyIzmi52jsdbU6VuYx6qUR
         L0kB3fLkLBhuTp4a34yaKwBezpLMW7Hslx1b4e1g=
Date:   Thu, 1 Sep 2022 10:37:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zenghongling <zenghongling@kylinos.cn>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, zhongling0719@126.com
Subject: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <YxBvNEn0jEEd0lXV@kroah.com>
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 01, 2022 at 03:00:53PM +0800, zenghongling wrote:
> UAS:if ignore uas feature for these drivers can fix the not working and
> output error message bug.
> 
> The UAS mode of Thinkplus and Hiksemi is reported to fail to work on
> several platforms with the following error message,I tested these USB
> disks on other architecture platforms as arm/loongson for different xHCI
> controller,the same error occurred:
> 
> [   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled
>                endpoint or incorrect stream ring
> [   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000
>                1b000000 05038000
> 
> [  592.490369][ 1] xhci_hcd 0000:0c:00.3: Assuming host is dying, halting host.
> [  592.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
>                    inflight: CMD
> [  592.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
>                    04 00 00
> [  592.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
>                    inflight: CMD
> [  592.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
>                    00 08 00
> 
> And when running iozone will disconnect from the USB controller, then after
> re-connecting the device will be offlined and not working at all.
> 
> We changed a lot of USB devices and contact relevant manufacturers to 
> confirm the USB disk is ok.

I do not understand why there are failures on Linux, yet not on other
operating systems.  If you run iozone on OS-X, does the same errors
happen?  How about a storage stress-test on Windows?  Why is Linux going
to have to make these devices go very very slow and what will happen to
the users that now can not operate their devices at the advertised
speeds?  Who will handle that support issue?

thanks,

greg k-h
