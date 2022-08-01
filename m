Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BDE5871C0
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 21:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiHATuu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 15:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235264AbiHATun (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 15:50:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA1F3DF07
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 12:50:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 332A761348
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 19:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CD8C433D6;
        Mon,  1 Aug 2022 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659383436;
        bh=OmLA8/wpaKgGceYc2X7JRbv6QpW3se8xb4K/OUCvMlM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PY9wGh7uEywSCRnPAX3u0ex3vKeBkZVx4LmV5OB8F+08xzBMN5YXg2D1djRM/lQkT
         h79JkP+OZHjt5N4mtSFv+ZJdWu8niZZwPRli7pwSzM/ZB1hoFVFYXhhBZChl32KmoI
         CWXFAZAmbat/cbi7OZrM5BRusXophxEzINKjX8uaSK79XFphdezMkwyT/ddaXNVe59
         s80PcLJbecBe+XwhWFWkTAxBKqI7dfbU2EKzQhduoPejpmc7VXeolCkyOQi9ciUxJd
         /d77rc5CQ7Pxw7yuY73zLIShu7/ABkbT6+SsptHmHPuvYeHlUNeWzjo2j1ylQ3lT1H
         Nwnga4Xh7/Wgw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oIbRC-00009n-KJ; Mon, 01 Aug 2022 21:50:50 +0200
Date:   Mon, 1 Aug 2022 21:50:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pere Blay <pereblay@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Fwd: PL2303 unknown device type in kernel
Message-ID: <Yuguml8UHAJLkrwc@hovoldconsulting.com>
References: <CANyrUpxawx0iba88N6g=w_sOwF9Nepe4UgQbWTpVsWjN7oiKrw@mail.gmail.com>
 <CANyrUpwZCHQTgoo-8vQxqcnnmETVchiZjfKXOnbTYHKWBra0nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANyrUpwZCHQTgoo-8vQxqcnnmETVchiZjfKXOnbTYHKWBra0nw@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 01, 2022 at 07:19:01PM +0200, Pere Blay wrote:
> Hi and thanks,
> 
> I get this message when plugin a usb device wich uses a usb-serial converter:
> 
> [ 5097.161310] usb 1-3.4.1: New USB device found, idVendor=067b,
> idProduct=23d3, bcdDevice= 4.00
> [ 5097.161326] usb 1-3.4.1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [ 5097.161332] usb 1-3.4.1: Product: USB-Serial Controller
> [ 5097.161336] usb 1-3.4.1: Manufacturer: Prolific Technology Inc.
> [ 5097.161340] usb 1-3.4.1: SerialNumber: DGARb193428
> [ 5097.170447] pl2303 1-3.4.1:1.0: pl2303 converter detected
> [ 5097.170470] pl2303 1-3.4.1:1.0: unknown device type, please report
> to linux-usb@vger.kerne.org
> 
> Then, I'm reporting.

Thanks for the report.

> My system:
> 
> $ uname -r
> 5.17.5-051705-generic
> 
> Output of lsusb:
> $lsusb -d 067b:23d3 -v
> 
> Bus 001 Device 017: ID 067b:23d3 Prolific Technology, Inc. USB-Serial Controller
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x067b Prolific Technology, Inc.
>   idProduct          0x23d3
>   bcdDevice            4.00
>   iManufacturer           1 Prolific Technology Inc.
>   iProduct                2 USB-Serial Controller
>   iSerial                 3 DGARb193428
>   bNumConfigurations      1

> Anything to make it work? thanks a lot.

This has been fixed by commit ae60aac59a9a ("USB: serial: pl2303: add
support for more HXN (G) types") which has also been backported to the
5.18.8 and 5.15.51 stable kernels about a month ago.

5.17 is no longer supported by the stable team so you may need to get
your distro to update their kernel or backport the fix.

Johan
