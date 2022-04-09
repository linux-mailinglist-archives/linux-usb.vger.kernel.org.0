Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1794FA621
	for <lists+linux-usb@lfdr.de>; Sat,  9 Apr 2022 11:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238489AbiDIJNG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Apr 2022 05:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238233AbiDIJNE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Apr 2022 05:13:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A79F24977
        for <linux-usb@vger.kernel.org>; Sat,  9 Apr 2022 02:10:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E09A60F7D
        for <linux-usb@vger.kernel.org>; Sat,  9 Apr 2022 09:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071DFC385A4;
        Sat,  9 Apr 2022 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649495456;
        bh=qJBIE65drYzoMSbry722wJFdsTYK3TrNzsDVleYF1OU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S6NEEbLIy5B368U7vROpWTuzfy5tVkvdpU/lX8A6Eb+fUVY3NvX61doeAAxIQVQw2
         4kdKce7LW//GEEM+wDPkY74JxKzSBG4PZRhL0JNR1olwLHjChJI4qszLBxDm7/nP74
         /BeL9l8Q67QCm63RCf4ybthrvUEc18jpPnFRLV1S6D++7tPCsEHjPQvEYIUFKJb8Qq
         UQy/7lHpcguyOssr86PbQeZSd/vos61MwY2fj2Ar02GlmpGooAtYUes4y0GwDZziEu
         MUpdLWUWRKU74hwRasPl6Rc0HPeLsUDSHwNesgMBcQ5h5KV75rlKE48BrCwxXCOe0O
         NiTGlQ5kqK+Zg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nd77J-0003jo-HY; Sat, 09 Apr 2022 11:10:50 +0200
Date:   Sat, 9 Apr 2022 11:10:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Florian Eichelberger ARES <fe@ares-ci.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Issue using PL2303GS device on Kali Linux
Message-ID: <YlFNmYjCA/FlwAEL@hovoldconsulting.com>
References: <DB6PR08MB2646980562ADC78EA613E8A694E99@DB6PR08MB2646.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB6PR08MB2646980562ADC78EA613E8A694E99@DB6PR08MB2646.eurprd08.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 08, 2022 at 03:31:52PM +0000, Florian Eichelberger ARES wrote:

> I just wanted to use a USB/serial TTL Converter that is using the
> Prolific PL2303GS Chipset on Kali Linux 2022.1-virtualbox-amd64.
> The device is a waveshare PL2303 USB UART Board (Type C)
> (see here: https://www.waveshare.com/pl2303-usb-uart-board-type-c.htm )
> 
> Uname -a shows
> Linux kali 5.15.0-kali3-amd64 #1 SMP Debian 5.15.15-2kali1 (2022-01-31) x86_64 GNU/Linux
> 
> It does not seem to work / be recognized and thus useable under linux
> and this is what I get using dmesg after plugging in the device and
> connecting it to my Virtualbox and thus I am sending this message as
> instructed 😊
> (I am using Virtualbox Version 6.1.32 r149290 (Qt5.6.2)  with USB 2.0
> (OHCI+EHCI) enabled )
> 
> [ 8784.041905] usb 2-2: USB disconnect, device number 5
> [10055.489536] usb 2-2: new full-speed USB device number 6 using ohci-pci
> [10056.048307] usb 2-2: New USB device found, idVendor=067b, idProduct=23f3, bcdDevice= 6.05

> [10056.089015] pl2303 2-2:1.0: pl2303 converter detected
> [10056.089020] pl2303 2-2:1.0: unknown device type, please report to linux-usb@vger.kernel.org

Thanks for the report. This has been fixed in mainline by commit
5b6ab28d0678 ("USB: serial: pl2303: fix GS type detection"), which was
backported and included in the stable kernels that were released
yesterday (e.g. 5.15.33).

Johan
