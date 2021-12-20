Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED37F47A58F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 08:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhLTHzz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 02:55:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:34318 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbhLTHzy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 02:55:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 180D860C6B
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 07:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1333C36AE5;
        Mon, 20 Dec 2021 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639986953;
        bh=N9CY1inx/e6t8BtWRR1gEcDr1AEYdK2DVabjReLctXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w7EZgtyZFSTRLGWxqfzfjP1SblvDDGn6txX1FFvgNwJmTvOWBJXSOjUGrhAqa5u4R
         KRN873e44MvUyzwwCWjoBYB7JO2ly2hSWXzVrJhH1cFrzk/nt6Kf1tcI1fmYf+/8oI
         FYcQdwnuC6uZTiesfQd0ZdbI2LufBCGwH1arSbVk=
Date:   Mon, 20 Dec 2021 08:55:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ralf Beck <musical_snake@gmx.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re:
Message-ID: <YcA3BrVn8vVfBEZn@kroah.com>
References: <trinity-09ddec50-a8ca-4663-ba91-4331ab43c9e4-1639982794116@3c-app-gmx-bs07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-09ddec50-a8ca-4663-ba91-4331ab43c9e4-1639982794116@3c-app-gmx-bs07>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 07:46:34AM +0100, Ralf Beck wrote:
> 
> Currently the usb core is disabling the use of and endpoint, if the endpoint address is present in two different USB interface descriptors within the same USB configuration.
> This behaviour is obviously based on following passage in the USB specification:
> 
> "An endpoint is not shared among interfaces within a single configuration unless the endpoint is used by alternate settings of the same interface."
> 
> However, this behaviour prevents using some interfaces (in my case the Motu AVB audio devices) in their vendor specific mode.
> 
> They use a single USB configuration with tqo sets of interfaces, which use the same isochronous entpoint numbers.
> 
> One set with audio class specific interfaces for use by an audi class driver.
> The other set with vendor specific interfaces for use by the vendor driver.
> Obviously the class specific interfaces and vendor specific interfaces are not intended to be use by a driver simultaniously.
> 
> There must be another solution to deal with this. It is unacceptable to request a user of these devices to have to disablethe duplicate endpoint check and recompile the kernel on every update in order to be able to use their devices in vendor mode.

The device sounds like it des not follow the USB specification, so how
does it work with any operating system?

What in-kernel driver binds to the device in vendor mode?

thanks,

greg k-h
