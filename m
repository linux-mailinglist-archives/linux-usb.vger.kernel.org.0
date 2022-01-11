Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0450848A808
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 07:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348370AbiAKG7C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 01:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348344AbiAKG7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 01:59:02 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83FBC06173F
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 22:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=BRqJvLC56Vxe+VSbPwmPQzrmCucPR8amgvX4UlaitHQ=; b=WqgUEW8xxEBBHJWSLBwDC8NMUM
        M4SXVxBkJN2z8GbTWLn1NlLvZE0koVDVM6cKuTKt9pzeqwHaYyHtNCwsK05/A5kxyQzI3iT0mA7ze
        SBE4G4yoSpMJKctnHGT/X/1F1t99a6KyHLzdXJAdJil5HSdSMPaQ+JJecNwI3gqQY0kfRcsKN68D8
        XAzkPpyBP7g1N5jQeN1KdtGYghwNP8NDccJjuUv6urE+WomdBDBWKZUWoFJZ3qT6kndLncodhYSUK
        6/tZqSZtctPAp2svEOrNy8QfUGf40H5ch6UScqLIM7lkyChwtRUFLww9TcML0SnvDSa+QV89uqi43
        8/iV8ixw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n7B7S-0032Om-B2; Tue, 11 Jan 2022 06:58:58 +0000
Message-ID: <0895680e-8a4a-7eea-e5c8-f6c29867e563@infradead.org>
Date:   Mon, 10 Jan 2022 22:58:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: no name mouse?
Content-Language: en-US
To:     James <bjlockie@lockie.ca>, linux-usb <linux-usb@vger.kernel.org>
References: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/10/22 18:48, James wrote:
> $ lsusb -tv
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
>     |__ Port 3: Dev 4, If 0, Class=Mass Storage, Driver=uas, 5000M
>         ID 0bc2:ab5a Seagate RSS LLC
>     |__ Port 4: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
>         ID 0bc2:2321 Seagate RSS LLC Expansion Portable
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 5: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 5: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
>         ID 30fa:0400
> 
> Port 6 Dev 3 is the mouse I bought from Amazon.
> Why doesn't have a name beside it?

USB 2.0 spec, section 9.6.7 String (descriptors):

"""
String descriptors are optional. As noted previously, if a device does not support string descriptors, all
references to string descriptors within device, configuration, and interface descriptors must be reset to zero.
"""

so whoever manufactured this device chose to leave it with no Mfr/Product name strings,
i.e., it's a generic device.

You could look at 'lsusb -v' for that device and then look at these fields:
(e.g., from a "transceiver" device for a wireless kbd/mouse)

  iManufacturer           1 Dell Computer Corp
  iProduct                2 Dell Universal Receiver
  iSerial                 0 

You should see iManufacturer and iProduct set to 0.

-- 
~Randy
