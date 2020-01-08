Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A371346BE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgAHPzQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:55:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:55028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727347AbgAHPzQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 10:55:16 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB65620705;
        Wed,  8 Jan 2020 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578498915;
        bh=rTbx0N+nMJdJX14nKSiBoSNdldUvQwIAMhEzefIklvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r4f8GZvdB2C3UqdD+54A8RANPoHeJqCKYowaZq+5rRxA2evLGa0J7ayqRsVFr3e/s
         uMl0LIck7lu04xXIR/eNLmszXB3NB7nNY25sqhgc0hAeeSFHrua+/vuEv/rWzmURaQ
         MpU6YpxXh9mpr6Xd+u9KrXm30blG7L9X5mzfa6UM=
Date:   Wed, 8 Jan 2020 16:55:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usbmon: Report device address assigned to USB device
Message-ID: <20200108155513.GB2451129@kroah.com>
References: <20200106093724.22947-1-desowin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200106093724.22947-1-desowin@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 06, 2020 at 10:37:17AM +0100, Tomasz Moń wrote:
> Make USB device addresses match while sniffing USB communication
> with usbmon and hardware USB sniffer (OpenVizsla) at the same time.
> On xHCI root hubs the address is assigned by hardware and can be
> different than devnum.

This breaks the userspace abi for matching up the devnum with the number
that is listed by the kernel to userspace, making it really hard to
match things up for xhci devices now :(

I understand the need to look at this data, but you can't do it in a way
that will change things like this.

thanks,

greg k-h
