Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B784BE081
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344083AbiBUIsg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 03:48:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiBUIsb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 03:48:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2092BB
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 00:48:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C372260FF6
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 08:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A79C340E9;
        Mon, 21 Feb 2022 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645433288;
        bh=F9sqcLyspIX4pzjZ2h+Guk2EJ//c30PKHdsONCNhaYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L1aQk9rwgZ1kKxQJxv2uV6IZh31IxE3pzMwtt0NIFrqPt6gfq4U2+hnGtbUOjU7rU
         PIHdUFYBBVFecTZwmuZN2spctUA4kxYyfqs04h3AavsQLtwZPLzsIXNo8RBnsszy9t
         UFhdSUlujcR+76Ov/dlJu+wKeSBR7qY/5420uH955sWGsQ8jBiqp7+w1tAhj/QIENW
         eN9LmNG4JxTzziQH6DHPHGVrpXGGQdTUSHZiKP9RXJsSLVGLvqkdXSyqMBghGpG+bV
         DzlQtjAfoCP6NY5gkuOmlEIF7DvMxuBqchmpzv+A+uYm9kt5wJHEgGclmjjjbw4w9q
         ZFNZ3pt+oVbww==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nM4MW-0003rn-OE; Mon, 21 Feb 2022 09:48:04 +0100
Date:   Mon, 21 Feb 2022 09:48:04 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmytro Bagrii <dimich.dmb@gmail.com>
Cc:     Jan-Niklas Burfeind <kernel@aiyionpri.me>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Message-ID: <YhNRxJpRMamUIiu5@hovoldconsulting.com>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com>
 <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
 <YgPNK1v541ohUMtv@hovoldconsulting.com>
 <02efa491-39fe-e4f3-d617-a6f17ceba6a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02efa491-39fe-e4f3-d617-a6f17ceba6a5@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 10, 2022 at 07:41:22AM +0200, Dmytro Bagrii wrote:
> On 09.02.22 16:18, Johan Hovold wrote:

> > I don't remember all the details, but judging from a quick look it seems
> > we're just waiting for someone to resend the revert with a proper
> > explanation.
> > 
> > It would be good if Jan-Niklas could chime in too and confirm if he's
> > able to use the device in UART mode instead.
> 
> I'd like to take a look at that keeyees device from original commit 
> message to see if it has EEPROM chip. I can hypothesize that some 
> manufacturer of a CH341-based programmer could use external configuration 
> EEPROM and mixed-up PID value. I haven't experiment with configuring 
> CH341A with EEPROM but suppose it's possible to burn any custom VID:PID 
> there. I don't think ch341 driver has to handle any of such custom 
> VID/PID, especially if it conflicts with an original VID/PID assigned by 
> chip manufacturer. In case of some peculiar devices it's possible to bind 
> custom VID:PID to the driver via sysfs.
> 
> But it's just my hypothetical assumption how ch341-based device with PID 
> 5512 could work as UART in that case.
> 
> I just checked if CH341 that i have can work as UART when configured as 
> I2C/SPI (PID 5512). I doesn't work: no output signal on TX pin, no 
> loopback echo when RX connected to self TX.

Thanks for confirming.

Johan
