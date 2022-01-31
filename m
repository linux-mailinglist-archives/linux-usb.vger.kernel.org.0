Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE7C4A4EB2
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 19:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357144AbiAaSoS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 13:44:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:36574 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357183AbiAaSoR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 13:44:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2CEDB82B9F
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 18:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF121C340E8;
        Mon, 31 Jan 2022 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643654655;
        bh=SUEdqQX0WF+nCfiy4Nv9vyiA76JsUhYKOaz4Y+FTWcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TmrzXuFuUuDFEFyXHsJgE7RmtcCSIlfU3fS8zBRhObLVZ9S0NID8qpdo4s6JjbCLG
         oAEDCepLMoNQx8iYhth9SZpGgIpX//9i7Dh0g4S7smocZBi5wUK/NeZsMassNuK+Sy
         /g8VYo14EXuO2xLh+OvtupcOae6ty/jA2B2lhwaI=
Date:   Mon, 31 Jan 2022 19:44:12 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     root <brice.chatelan@erems.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Looking for usbip driver
Message-ID: <Yfgt/BP0xR+NkHK8@kroah.com>
References: <20220131181200.E183645E00D0@ere-mx2.erems.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131181200.E183645E00D0@ere-mx2.erems.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 31, 2022 at 07:12:00PM +0100, root wrote:
> Hello,
> 
> I have an old equipment on the international space station running a linux 2.4 kernel (RedHat).
> I need to connect the USB1000IP to it to use standard devices: mass storage and cameras.
> The usbip device driver for linux seems to be the right package to handle this hardware.
> If you agree with this, where can I find the complete source code of my 2.4 kernel (otherwise 2.6)?

You can get it from the distro source where you got your Linux system
image from.  It should be at the same location.

good luck!

greg k-h
