Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1BC8637D6F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Nov 2022 17:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiKXQCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Nov 2022 11:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiKXQCN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Nov 2022 11:02:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0C5F2C34
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 08:02:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2E847B82847
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 16:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74263C433D6;
        Thu, 24 Nov 2022 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669305726;
        bh=eRea0Cn7S+QUYSw7LH/aojpDF6KeQAx8saFM0itvWOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aYW1TnaFVVy1/hjPox+0IxgfWPdXtcPQL1LlucJFqtyF0EFzfPnUbYnIwc3cPfKuG
         6zxmPIpfUzVZNcGOhwq2S3ggVfuGfl3FqzwM57BD9NiTDsJyEq1xTKjkkiLj0jXP1E
         N+UIar4uJs02k+X5pg1TvUbCr6ooSejiWDHPwka0=
Date:   Thu, 24 Nov 2022 17:02:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vincent Mailhol <vincent.mailhol@gmail.com>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [Question] How to check whether or not a device is an USB device?
Message-ID: <Y3+VfNdt/K7UtRcw@kroah.com>
References: <CAMZ6RqKB70YohOEeUmYWthbi8N3ADVLQUg-=j6enf5cDQC_eSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ6RqKB70YohOEeUmYWthbi8N3ADVLQUg-=j6enf5cDQC_eSg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 25, 2022 at 12:40:34AM +0900, Vincent Mailhol wrote:
> Hello,
> 
> I am trying to have devlink report default information at the core
> level. One of the attributes reported by devlink is the serial number
> which is available in usb_device::serial (details: [1]).
> 
> This code would work:
> 
>         if (!strcmp(dev->parent->type->name, "usb_device")) {
>                 /* is indeed an USB device */
> 
> but the string comparison looks odd.
> 
> There is a is_usb_device() which does the check:
> 
>   https://elixir.bootlin.com/linux/v6.1-rc1/source/drivers/usb/core/usb.h#L152
> 
> but this function is only visible at the USB core level.
> 
> Thus my questions:
> 
>   * what is the correct way (outside of USB core) to check if a device
> is an USB device?

There is none, you should never do this.  There is a reason the driver
model does not have "types" for all devices that are allowed to be
checked.

It is up to the driver that controls this device to know what type of
device this is.

Where in the kernel are you trying to do this type of thing?

> Is the string comparaison OK or is there a smarter way?

This should not be done at all, you can not rely on it.

>   * would it make sense to export the is_usb_device() function?

Nope!

> [1] https://lore.kernel.org/netdev/20221122154934.13937-1-mailhol.vincent@wanadoo.fr/

Have the netdev driver provide a way to get the serial number of a
device.  Then in the driver, it can do the correct call as it "knows"
that this device really is a USB device.

Don't let class code like this depend on random bus types, that's not
the correct way to do things.

hope this helps,

greg k-h
