Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08ED67CAD5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 13:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbjAZMXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 07:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjAZMXd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 07:23:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC58E1C33B
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 04:23:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6201B81D6B
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B8EC433EF;
        Thu, 26 Jan 2023 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674735810;
        bh=t498eaLIj9ne7WzNSzVDgRt2Q9ekSj7Be2LPxaPoETk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yJsY4jxp6oKKwE/HnWc9BpAdZO7Q4XUz7WvwapL/aAp2ZF2TF+aY0CQgXIpXtY5rd
         6dbAIxan7NUbRSNIxHeAdVhOG8WvG5Mgcp0ChhhFGusVHGOfMvuE8Wusr7eKWefIbS
         ZOLQYuTdJMaYx1dkT8tdPOUVPWCaknQRCvzpmkgY=
Date:   Thu, 26 Jan 2023 13:23:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y9Jwv1ColWNwH4+0@kroah.com>
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 26, 2023 at 12:49:32PM +0100, Troels Liebe Bentsen wrote:
> Hi,
> 
> We have a hardware projekt where something is off with power ON
> timing. It sometimes gets started in a broken state where the device
> is seen by the USB system but does not respond to descriptor reads.

Ah, a broken USB device, not much the kernel can do about that :(

> When this happens this causes lsusb and libusb based tools to hang
> until the descriptor read in the USB subsystem timeout out after 30
> seconds or so. It looks like the tools are trying to read
> /sys/bus/usb/devices/.../descriptors and it blocks until the timeout
> happens.
> 
> We should fix our hardware and have done so in the next revision but
> why should one device be able to block the descriptors file that most
> user land USB code seem to use.

If the device does not respond, what is the kernel or userspace supposed
to do?

> Would there be any reasoning against just serving the descriptors file
> as it looked before inserting the broken USB device instead of
> blocking the read?

So a different device's descriptor file is being blocked by a broken
device?  Are you sure?  They should all be independent.

> And if we wanted to create a pull request for a change like that would
> it be accepted or would it be considered breaking the API?

It depends on what the kernel change looks like.  Have you tried
anything that worked for you that you wish to propose?

thanks,

greg k-h
