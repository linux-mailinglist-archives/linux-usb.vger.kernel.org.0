Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD3B48A92E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 09:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348836AbiAKIRS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 03:17:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34652 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348828AbiAKIRS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 03:17:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24CA8B81920
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 08:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0873C36AE3;
        Tue, 11 Jan 2022 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641889035;
        bh=akMYAnd8ccnXJ9IP7htGw1T26BQ479cEfGgi+S/BNCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XbRvE4aTkB8UmfitoTz6E5bQTlxtaJPDBQ1vG1sJ7wKHtXIySeH0mkbXS5Bblq5vz
         4tKnbcB2o1oyXMfiWAP5YMQ4O0MbNA/I8RgurvzHIOR2f4oP87BnoCFgc4LdVI/a7L
         xQHKwkir1UYbbI1m0C+gFmdFbu5jWBaV6P4YUaek=
Date:   Tue, 11 Jan 2022 09:17:12 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     cruise k <cruise4k@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Geoffrey D. Bennett" <g@b4.vu>, linux-usb@vger.kernel.org
Subject: Re: INFO: task hung in usbdev_release
Message-ID: <Yd09CBUWA0RMRlGn@kroah.com>
References: <CAKcFiNBvtwdXH-hNRy34xVU55E6vjd2n212sPvrJdB+VW2GKzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKcFiNBvtwdXH-hNRy34xVU55E6vjd2n212sPvrJdB+VW2GKzA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 11, 2022 at 03:21:50PM +0800, cruise k wrote:
> Hi,
> 
> Syzkaller found the following issue:
> 
> HEAD commit: 75acfdb Linux 5.16-rc8
> git tree: upstream
> console output: https://pastebin.com/raw/YNZPt1rA
> kernel config: https://pastebin.com/raw/XsnKfdRt
> 
> And hope the report log can help you.

Patches are best, but thanks!

greg k-h
