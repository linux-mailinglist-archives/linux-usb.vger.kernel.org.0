Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD2B4AD73A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376351AbiBHLcS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356143AbiBHKPh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 05:15:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42716C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 02:15:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F2668B819B1
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 10:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADC4C004E1;
        Tue,  8 Feb 2022 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644315333;
        bh=per1lYXMK6Q0bDOepiEt2ZBYV9CLxeiYyV7xiunGRXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NxSykoRH3Cs6hdYPbnqUWqVgr7p1k9ll9JnNWMC6IHXEweTHE3WkugQ7MinI9XZ1E
         7EbAj1VjqYs2CeBky2ZV07uU4B2HfhBZYa5WDCxmfI9ZuAlqowYZ7xAYQfxbyj24D9
         DV8mbrPFAia0qU+0ijZm5iG7OXHFZyyAuDzDGujQ=
Date:   Tue, 8 Feb 2022 11:15:30 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eduard-Bogdan Budai <eduard.budai@rcs-rds.ro>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Bug report for pl2303 converter (ATEN USB to serial Bridge,
 idVendor=067b, idProduct=23a3, bcdDevice= 1.05)
Message-ID: <YgJCwn5s1Cv/LT5I@kroah.com>
References: <10d4dbe9-4b17-aeb5-0abe-bf0829173c1d@rcs-rds.ro>
 <e85bac58-6d40-b61a-b217-8c4ee3c5853e@rcs-rds.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e85bac58-6d40-b61a-b217-8c4ee3c5853e@rcs-rds.ro>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 05:08:15PM +0200, Eduard-Bogdan Budai wrote:
> Dear Sirs,
> 
> Today, when a USB-RJ45 adapter was conected to a cumputer running Ubuntu
> 20.04.3 in its dmesg appeared:
> 
> [Thu Jan 20 15:24:17 2022] usb 1-3.1: new full-speed USB device number 7
> using xhci_hcd
> [Thu Jan 20 15:24:17 2022] usb 1-3.1: New USB device found, idVendor=067b,
> idProduct=23a3, bcdDevice= 1.05
> [Thu Jan 20 15:24:17 2022] usb 1-3.1: New USB device strings: Mfr=1,
> Product=2, SerialNumber=0
> [Thu Jan 20 15:24:17 2022] usb 1-3.1: Product: ATEN USB to Serial Bridge
> [Thu Jan 20 15:24:17 2022] usb 1-3.1: Manufacturer: Prolific Technology Inc.
> [Thu Jan 20 15:24:17 2022] pl2303 1-3.1:1.0: pl2303 converter detected
> [Thu Jan 20 15:24:17 2022] pl2303 1-3.1:1.0: unknown device type, please
> report to linux-usb@vger.kernel.org
> 
> The kernel version is 5.13.0-27-generic #29~20.04.1-Ubuntu.

Should be fixed in newer kernel versions, this is a quite old and
obsolete kernel version.  Can you try 5.16?

thanks,

greg k-h
