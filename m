Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C3513B40A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 22:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbgANVGz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 16:06:55 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29326 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727102AbgANVGz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 16:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579036013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KDsD3rFFJZee1e17h0OAAqeCxaBOpXGUXzms/+HKcqE=;
        b=PXDTW7KADWy4SZdPb1kYv4lXOYyZFW+bCoAw03YaFWwlyHga8PuAHOpSUDmTsXu0WxxlU0
        p/U/tfTebLe0FJWBekOTwdTnWACaiKshxLR4Iq3H9mp+ZMViyOXBeNc3pX4xkkpbn+MP1x
        06E3h2sy5sHOLABAvCogDrJIBbsydtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-cWs0isd0OPemhpaU3P8xDg-1; Tue, 14 Jan 2020 16:06:50 -0500
X-MC-Unique: cWs0isd0OPemhpaU3P8xDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98BDB107ACCC;
        Tue, 14 Jan 2020 21:06:48 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-116-78.phx2.redhat.com [10.3.116.78])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE4D5C3FA;
        Tue, 14 Jan 2020 21:06:48 +0000 (UTC)
Date:   Tue, 14 Jan 2020 15:06:47 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tomasz =?UTF-8?B?TW8=?= =?UTF-8?B?xYQ=?= <desowin@gmail.com>,
        <linux-usb@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        zaitcev@redhat.com
Subject: Re: [PATCH] usbmon: Report device address assigned to USB device
Message-ID: <20200114150605.6e5f07cd@suzdal.zaitcev.lan>
In-Reply-To: <Pine.LNX.4.44L0.2001131003350.1502-100000@iolanthe.rowland.org>
References: <20200111175216.5b5680ea@suzdal.zaitcev.lan>
        <Pine.LNX.4.44L0.2001131003350.1502-100000@iolanthe.rowland.org>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 13 Jan 2020 10:05:42 -0500 (EST)
Alan Stern <stern@rowland.harvard.edu> wrote:

> > Alan's suggestion of leaving the physical address in /sys appeals
> > the most to me, honestly. One thing though, libpcap will need to
> > rifle through /sys and then store that address, so its serialization
> > has to be changed no matter what. Unfortunately, I'm wholly ignorant
> > as to what syntax it uses and how extensible it is.  
> 
> Alternatively, libpcap can ignore the issue and just display the device
> numbers, as it does now.  A separate program or the user could convert
> the number to a physical address, if necessary, using the information 
> in sysfs.

I thoght that people sometimes saved the traces and replayed them
on other machines, which obviously have their own /sys or even run
Windows or iOS.

-- Pete

