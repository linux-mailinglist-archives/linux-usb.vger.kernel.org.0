Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3650060126A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 17:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiJQPIX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 11:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiJQPIJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 11:08:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CC11CB29
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 08:07:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3938B611AD
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 15:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32150C433C1;
        Mon, 17 Oct 2022 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666018891;
        bh=lRedT7GTNvkgvG4IxutUJlPo4iQDn8kOOiFYrz1u3Hs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B/z5M9EC7rH4dJIMD13+mTbSyKA5CUR2chubOsWHU7cP+6vvzI7erwmtKhm7Svd2T
         X4d7F1xNi0hrAmr+XdpO+Nzhqi05y/FVfIF3PG9hdbxQW/iHvQ3ctfM3S5sYumBrkK
         kY+y7nMm5rNIylYrdq3PtfJjCUnNK4SDf1tkjYUk=
Date:   Mon, 17 Oct 2022 17:01:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb@vger.kernel.org
Subject: Re: is usb.ids used anymore?
Message-ID: <Y01uSKYMXBkZVgOJ@kroah.com>
References: <8526b38d-64b2-05b0-48e5-a54936f6332f@lockie.ca>
 <Y0zheI+RSeLNulpx@kroah.com>
 <7cb0f51d-6ad1-488d-a989-08eb6727e9b7@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cb0f51d-6ad1-488d-a989-08eb6727e9b7@lockie.ca>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 17, 2022 at 02:36:55PM +0000, James wrote:
> 
> >> but I didn't receive a confirmation to the email and the ids show up in the
> >> web interface but there are no names associated.
> >
> > What do you mean by this?
> 
> I tried to add:
> 7961 MT7921AU 802.11a/b/g/n/ac/ax Wireless Adapter
> 
> 7961 shows up but the description/name is blank on:
> https://usb-ids.gowdy.us/read/UD/0e8d
> 
> I also tried to add 0608  the 7921k USB Bluetooth portion of a pci card.

I don't understand, how is a USB device part of a PCI device?

What does 'lsusb' show for these devices?

> Someone else added 2870 but it doesn't show a name either.

Is there a name in the device itself?  That's the best place for this
information, and is why USB added strings to the configuration
descriptors, so that no external tool should ever really be needed.

> I expected to get an email back acknowledging my diff submission.
> I did it on the website too.

I do not think emails are sent back, but it's been a while since I last
looked at it.

> >> The link to the maintainer is no longer valid. :-(
> >
> > What link?
> 
> It says "This site maintained by Stephen J. Gowdy." and has a link to http://cern.ch/gowdy which is 404 not found.

There might be an email address on the file itself if you really want to
contact them.

> >> Wouldn't it be easier to keep in a github if it is still used?
> >
> > Why is github easier?
> 
> It tracks the commits of who added what.
> I guess it would be harder for people who haven't used git.
> 
> 
> Should it say:
> 802.11a/b/g/n/ac/ax Wireless
> or should it say:
> Wifi 6
> ?

I have no idea, what does the device itself say?

Again, there is no real need to add new devices to this file, unless
the strings in the device are somehow wrong and you want the userspace
tools to display the updated version instead.

thanks,

greg k-h
