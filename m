Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BED4AD6FF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349455AbiBHLbX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348998AbiBHKQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 05:16:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C16C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 02:16:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A06EB81897
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 10:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD8C004E1;
        Tue,  8 Feb 2022 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644315404;
        bh=1DW+eeqCHXv0FSmxanpGUJnuximgL+CngSZZI05z9OU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJ5OoiZDS+FIgTMyexCFo+0ZLCYtPwTIz3Hq2zUZDu83OLXhOpk2J7nKqsC1bsCn6
         JRFNnflwEDfefPQ2Sn89JG0CMF4gtSX019Ndw5EuoiRXe26Ez70rvxBAmoPfHpUgYP
         pXauRbT6JTc6RgzIb9926PT0NJ5l4VeGME7Sctug=
Date:   Tue, 8 Feb 2022 11:16:41 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christopher Rutherford <chrisrutherford@protonmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Neoway Technology N27 NB-IoT/eMTC/EGPRS module
Message-ID: <YgJDCZl8Z7XgKY6u@kroah.com>
References: <KX3y23_c5OPlneretDRhw4_4oqxJ1tXAwYfYb99nLhF8jWCLgWNuhotDR3ehKZ7bPqfDP4aocSpkn8IHccmKt6flhO4CqVxtR9wbidlaTEQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KX3y23_c5OPlneretDRhw4_4oqxJ1tXAwYfYb99nLhF8jWCLgWNuhotDR3ehKZ7bPqfDP4aocSpkn8IHccmKt6flhO4CqVxtR9wbidlaTEQ=@protonmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 13, 2022 at 02:36:05PM +0000, Christopher Rutherford wrote:
> Hi,
> 
> As per the dmesg log, please add the Neoway N27 to a proper driver.
> 
> lsusb
> Bus 001 Device 014: ID 2949:8620 Qualcomm, Incorporated Qualcomm CDMA Technologies MSM
> 
> sudo modprobe usbserial vendor=0x2949 product=0x8620
> 
> [1989329.151331] usbcore: registered new interface driver usbserial_generic
> [1989329.151336] usbserial: USB Serial support registered for generic
> [1989329.151346] usbserial_generic 1-11:1.0: The "generic" usb-serial driver is only for testing and one-off prototypes.
> [1989329.151347] usbserial_generic 1-11:1.0: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> [1989329.151348] usbserial_generic 1-11:1.0: generic converter detected
> [1989329.151429] usb 1-11: generic converter now attached to ttyUSB0
> [1989329.151451] usbserial_generic 1-11:1.1: The "generic" usb-serial driver is only for testing and one-off prototypes.
> [1989329.151451] usbserial_generic 1-11:1.1: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> [1989329.151452] usbserial_generic 1-11:1.1: generic converter detected
> [1989329.151486] usb 1-11: generic converter now attached to ttyUSB1
> [1989329.151499] usbserial_generic 1-11:1.2: The "generic" usb-serial driver is only for testing and one-off prototypes.
> [1989329.151500] usbserial_generic 1-11:1.2: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> [1989329.151501] usbserial_generic 1-11:1.2: generic converter detected
> [1989329.151526] usb 1-11: generic converter now attached to ttyUSB2
> [1989329.151536] usbserial_generic 1-11:1.3: The "generic" usb-serial driver is only for testing and one-off prototypes.
> [1989329.151537] usbserial_generic 1-11:1.3: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> [1989329.151538] usbserial_generic 1-11:1.3: generic converter detected
> [1989329.151567] usb 1-11: generic converter now attached to ttyUSB3
> 
> miniterm  /dev/ttyUSB1
> --- Miniterm on /dev/ttyUSB1  9600,8,N,1 ---
> --- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
> at
> OK
> at
> OK
> 
> Best regards,
> 
> Christopher

What type of device is this?  A modem connection?

Can you provide the output of 'lsusb -v -d 2949:8620' for this device?

thanks,

greg k-h
