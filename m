Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082B647BB57
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 08:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235359AbhLUHyd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 02:54:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37296 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhLUHyd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 02:54:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60CC8B80EA6
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 07:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C3FC36AE2;
        Tue, 21 Dec 2021 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640073271;
        bh=/fA8V6JgRiDWkumm/hopQ4pZaBVTRbimgK2Lwl6kfao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P1Qwd2zroW5yh8t8DOLztoal0WANig7q9yVL8s4+wsSe+pWIL+ryWJQp/ql+YhNHz
         8ZuuJss1mYqXkiZ07g3Y8g53FV/kuQAH8C6C3BIPeldEolUKHva/q9M2e/3tYOwBWV
         zv0OOEm4zPyPvnonpvHjrXe83CammY1hJAHRPafs=
Date:   Tue, 21 Dec 2021 08:54:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]How else could a malicious device sabotage endpoints for
 usbnet
Message-ID: <YcGINEZn1NyYbtbD@kroah.com>
References: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
 <YbIlBl8Ay1rIED8p@kroah.com>
 <71bfdff1-61d0-881e-a201-e91920750648@suse.com>
 <YboCTzOTp49HuCxa@kroah.com>
 <4739899e-54c9-c28a-502c-e3a85118c301@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4739899e-54c9-c28a-502c-e3a85118c301@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 16, 2021 at 11:16:26AM +0100, Oliver Neukum wrote:
> 
> On 15.12.21 15:57, Greg KH wrote:
> > On Wed, Dec 15, 2021 at 03:47:55PM +0100, Oliver Neukum wrote:
> >> On 09.12.21 16:47, Greg KH wrote:
> >>> Why not use usb_find_common_endpoints() and/or the other helper
> >>> functions instead? that's what they were created for.
> >> Hi,
> >>
> >> which one would I use? In this case I already know the endpoints
> >> to be verified.
> > I have no context here so I have no idea, sorry.
> 
> usbnet has three ways to match the endpoints
> 
> 1) the subdriver provides a method
> 
> 2) a heuristic to find the endpoints is used (that should be converted
> to the new API)
> 
> 3) they are given nummerically by the subdriver
> 
> It turns out that #3 needs to verify the endpoints against malicious
> devices.
> So the following questions
> 
> a) should that verification go into usbcore

the usb_find_common_endpoints() functions are in the usbcore for drivers
to use for this type of problem.

> b) what possible ways for a malicious device to spoof us can you come
> up with

Start with:
	- invalid endpoint sizes and types
	- invalid data being sent on valid endpoint types
and you will catch almost all possible errors.

thanks,

greg k-h
