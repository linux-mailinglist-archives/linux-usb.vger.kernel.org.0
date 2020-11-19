Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D302B8D37
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 09:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgKSIaB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 03:30:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:47984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgKSIaA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 03:30:00 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ABD224655;
        Thu, 19 Nov 2020 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605774600;
        bh=EZEDr5IQsioUGyF80YQbyCnywOSCXmRoVhV6Oknlr8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Up35zVXDcRBevYL07Uyr0SfYp8tQtn28j86LIncTD5uEFy0j+HR8I6UrIcwj7ZORt
         1ABvRbnrdsp7k5CmiBQhUgr5Q/iI+6IpBLYKV+nX56AOIbAh8K6GFvPV9jX2LcV8bI
         L9tJOTAisCSUUxXrVTGEWkacbNPbwV6oqD3tcMQg=
Date:   Thu, 19 Nov 2020 09:30:44 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kevin Liu <kliutw1947@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: add product ID 1b93 under Supermicro 2c23
Message-ID: <X7YtNDeGrVzkk8X1@kroah.com>
References: <CAMLv=Q9DVb+t63eK9fyDsdUWTF7d7jHQy5QXik=-nyV0rVE-3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMLv=Q9DVb+t63eK9fyDsdUWTF7d7jHQy5QXik=-nyV0rVE-3Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 04:05:14PM +0800, Kevin Liu wrote:
> Hi,
> 
> I tried to add product ID 1b93 under Supermicro 2c23 on USB ID
> Repository last week, could you please help to check the request and
> let me know if any additional action I shall take? Thank you very
> much.
> 
> Information captured from USB ID Repository:
> Main -> USB Devices -> Device UD:2c23 -> Subsystem UD:2c23:1b93
> Name: USB Ethernet/RNDIS
> Add PID for lan-over-usb host interface device that will be applied on
> Supermicro motherboard from late 2020.
> kliutw1947
> 2020-11-13 09:20:12

We do not handle this on the mailing list, if you have submitted your
entry, give it time to be updated.  There is no rush as no tool relies
on this database anywhere :)

thanks,

greg k-h
