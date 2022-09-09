Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4AF15B2FC0
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 09:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiIIH0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 03:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiIIH0V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 03:26:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C35109D07
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 00:26:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE43BB8236E
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 07:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4943C433D6;
        Fri,  9 Sep 2022 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662708378;
        bh=00/hVMZGS4/9C3GFu2UyY5nx5NPinfBOhXduJCb5Sh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=anckkx+WcpUDE/kZt9WOHoGPzOSNoJcmq9CMEeE8/VjOv9S+qDCLLJIztFrjeMqer
         UZQMMFZHb/9GKmn1VWQOrjanhEz7J8DYAHpcH/S/nSN6XQVgiRzJkEgppkcIwZaqzr
         38iad1d9xtT8+IRHV7uwk2RAJCpz30tzl8uOe8ZI=
Date:   Fri, 9 Sep 2022 09:26:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hongling Zeng <zenghongling@kylinos.cn>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, zhongling0719@126.com
Subject: Re: [PATCH v3 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Message-ID: <YxrqlzXNHmeIR0Uw@kroah.com>
References: <1662695451-28270-1-git-send-email-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662695451-28270-1-git-send-email-zenghongling@kylinos.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 09, 2022 at 11:50:51AM +0800, Hongling Zeng wrote:
> The UAS mode of Hiksemi USB_HDD is reported to fail to work on several
> platforms with the following error message, then after re-connecting the
> device will be offlined and not working at all.
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
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Change for v1
>  - Change the email real name and the code worng place.
> 
> Change for v2
>  -Change spelling error.
> 
> Change for v3
>  -Add acked-by

You sent 2 different emails with patch 2/3, yet no patch 3/3 at all.

Also the patch series is not properly linked together, please use 'git
send-email' to do that.

Please fix all of this up and resend a v4 of the whole series.

thanks,

greg k-h
