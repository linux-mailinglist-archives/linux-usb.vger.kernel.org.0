Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C155FABB
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 10:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbiF2IiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 04:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbiF2IiA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 04:38:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3395D3CA72
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 01:38:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0AFB61B6B
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 08:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11BFC34114;
        Wed, 29 Jun 2022 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656491879;
        bh=voMUPC/MOA9Hg86CL1NlZzWZ1ytOUli1SZIhR2D11CQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IyyPFEGvYlbJQaW1+SxZ9NE8L6yeKklLF3oujnfAx5HwsSWZTS8moctznJd/hb6mP
         dyNYuSCqAjuzknvEjdinrULynBRf7cFSlsgaASB7muvehGKn+5XLi5iYprZFHeLaZ5
         2Uy0Z9JwBUOH6xvlahnvcd6PXyRGMPbJ4i4jG4H4=
Date:   Wed, 29 Jun 2022 10:37:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jookia <contact@jookia.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: acm_port_shutdown hangs for 30 seconds
Message-ID: <YrwPY0faDmVcjTqx@kroah.com>
References: <YiynBKeGJCMEkgyO@novena-choice-citizen>
 <YrmpLXcPeHW4fnvz@kroah.com>
 <YrrILGzC2R3qGiHu@novena-choice-citizen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrrILGzC2R3qGiHu@novena-choice-citizen>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 28, 2022 at 07:21:48PM +1000, Jookia wrote:
> Hi Greg,
> 
> Thanks for getting back to this!
> 
> On Mon, Jun 27, 2022 at 02:57:17PM +0200, Greg KH wrote:
> > What host controller driver is this showing up on?
> 
> I have the following modules loaded:
> 
> xhci_pci_renesas
> xhci_pci
> xhci_hcd
> 
> This isn't an ARM board or anything, this is a standard x86 desktop
> (B450 plus motherboard, Ryzen 3700x chipset)- but I believe I've had the
> same error when using serial cables on a years older computer and in
> general when doing embedded development.
> 
> I believe this issue is related to buggy serial devices, in particular
> ones run by a microcontroller like an ATmega32u4 and perhaps Linux USB
> gadget where the device is abruptly reset but the serial session isn't
> terminated.
> 
> The host device USB system has to time out then, which is fine, but in
> userspace this seems to hang close() instead of doing this
> asynchronously.

The close is timing out as it tries to flush the data to the device
which is no longer responding.  So this kind of is expected behavior,
sorry.

greg k-h
