Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470154DB2FA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 15:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356864AbiCPOW0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 10:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356789AbiCPOVy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 10:21:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADBB52E6C
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 07:19:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B26CE61277
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 14:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFCFC340F0;
        Wed, 16 Mar 2022 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647440354;
        bh=Ag1JnlJt50voX4mDBVF0jDygZ1WgvRuqQwp99e7e4Uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YrClgv9sq1i8gZ6oCLAFD2OnmJaIpatP71ISJ3onpY+eYfn8Z+aLq7qSDCd5URX1y
         eZxc2u8JRUkDGoHJd6dQIocqs8ocjkxZ0Hd86ZMAYSdxdRJyRjrkncLaF5nGiC7Ywd
         q7Wwedb7/iNaFZ3M2Ub/27wQOJXICbdAkKO0Zihs=
Date:   Wed, 16 Mar 2022 15:19:11 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Message-ID: <YjHx34Xjy9eAyn+l@kroah.com>
References: <1647437997247.23069@mentor.com>
 <YjHswpjToSM5Pr7n@kroah.com>
 <1148788f4bd848c78e28b116537979e6@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1148788f4bd848c78e28b116537979e6@SVR-IES-MBX-03.mgc.mentorg.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 16, 2022 at 02:11:47PM +0000, Schmid, Carsten wrote:
> >> [159909.614535] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> >> [159909.665513] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> >> [159909.729510] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> >> [159909.780610] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> >
> > Why is usbfs being used for a storage device?  What userspace program do
> > you have that is poking at the device?
> 
> Need to ask the userspace maintainers in that project, thanks for the hint.
> 
> >> [159928.908633] INFO: task usb-storage:31868 blocked for more than 10 seconds.
> >> [159928.908735]  ret_from_fork+0x35/0x40
> >> [159931.594483] usb 1-1: reset high-speed USB device number 13 using xhci_hcd
> >>
> >> Anyone from USB who can help with that?
> >
> > 4.14 is really old.  Does 5.16 resolve this?
> >
> Recent Desktop Ubuntu 2104 doesn't show this (kernel 5.4).
> In this project, we can't move from 4.14, unfortunately (i'm at 4.14.244 here).

Then try using 'git bisect' to track down where the issue gets fixed?

thanks,

greg k-h
