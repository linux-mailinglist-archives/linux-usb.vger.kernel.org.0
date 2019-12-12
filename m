Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8CB11C919
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 10:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbfLLJ2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 04:28:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:56448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbfLLJ2J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 04:28:09 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDEC221655;
        Thu, 12 Dec 2019 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576142888;
        bh=LURWB7IPn2xebRXLRJLfXE/2zhnJQAov8ugdWAGE32Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fkv6ANwWodj6MoID/TlWL5GVntVWcTHamaWlMTDefa8u3sP5GdN4vsGCdjMPIkmGw
         7/Gi+PNgYjyqg6aSuhPSvMYXY1FUTyTFZ8SQoSYFn5eBBd4806h1t96PHv16VP5LAm
         LnmRQTmozPU01wWnhRnZeeSH0R2g/0srD7D8INrk=
Date:   Thu, 12 Dec 2019 10:28:05 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zhong jiang <zhongjiang@huawei.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux@roeck-us.net, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Fix an undefined reference to
 'extcon_get_state'
Message-ID: <20191212092805.GA1375559@kroah.com>
References: <1576136063-50916-1-git-send-email-zhongjiang@huawei.com>
 <20191212090132.GC31345@kuha.fi.intel.com>
 <5DF20530.2040509@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5DF20530.2040509@huawei.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 12, 2019 at 05:15:28PM +0800, zhong jiang wrote:
> On 2019/12/12 17:01, Heikki Krogerus wrote:
> > On Thu, Dec 12, 2019 at 03:34:23PM +0800, zhong jiang wrote:
> >> Fixes the following compile error:
> >>
> >> drivers/usb/typec/tcpm/fusb302.o: In function `tcpm_get_current_limit':
> >> fusb302.c:(.text+0x3ee): undefined reference to `extcon_get_state'
> >> fusb302.c:(.text+0x422): undefined reference to `extcon_get_state'
> >> fusb302.c:(.text+0x450): undefined reference to `extcon_get_state'
> >> fusb302.c:(.text+0x48c): undefined reference to `extcon_get_state'
> >> drivers/usb/typec/tcpm/fusb302.o: In function `fusb302_probe':
> >> fusb302.c:(.text+0x980): undefined reference to `extcon_get_extcon_dev'
> >> make: *** [vmlinux] Error 1
> > There are stubs for those functions so that really should not be
> > happening. I can not reproduce that.
> It can be reproduced in next branch. you can try it in the latest next branch.

Can it be reproduced in 5.5-rc1?
