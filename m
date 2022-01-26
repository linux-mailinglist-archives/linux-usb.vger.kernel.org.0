Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7823149C980
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241199AbiAZMU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241194AbiAZMU4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 07:20:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E276FC06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 04:20:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 881D5619C6
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30225C340E3;
        Wed, 26 Jan 2022 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643199655;
        bh=sZjGa3dGorj95weNZQqtjE22p76KZEq/1FM60Y+97tE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaGaLP34BNmfLoNEGx8HfvvMKDDaqd/04j3cf0Qllo91jamM/m9cdwXk0damecVyv
         YPfKR/TJsOn52iyTG2x6a1hVuuuPMEicE8TWQMs0FJAN5YfptPKJZ13kC7AhbVA9N4
         xL00KOrqKwPPtkgefpnYNE19q4r63jTlp50Sspl8=
Date:   Wed, 26 Jan 2022 13:20:47 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
        regressions@lists.linux.dev,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Cristian Birsan <cristian.birsan@microchip.com>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jonas Bonn <jonas@norrbonn.se>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Message-ID: <YfE8nyH1lW/I8NTV@kroah.com>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <3bb113cd-fbf6-6898-6ae3-2f8cb8c64992@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb113cd-fbf6-6898-6ae3-2f8cb8c64992@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 12, 2021 at 10:48:14AM +0100, Thorsten Leemhuis wrote:
> [TLDR: adding this regression to regzbot; most of this mail is compiled
> from a few templates paragraphs some of you might have seen already.]
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> Top-posting for once, to make this easy accessible to everyone.
> 
> Thanks for the report. BTW, if anyone like me wonders what the included
> patch is about: it afaics is the revert of the patch causing the
> problem. Anyway:
> 
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 70a7f8be8598
> #regzbot title usb: gadget: atmel: ethernet over USB Gadget not
> recognized anymore after disconnect and reconnect
> #regzbot ignore-activity

How do I say "this isn't a regression, it's a broken board
configuration" and get regzbot to stop tracking this?

thanks,

greg k-h
