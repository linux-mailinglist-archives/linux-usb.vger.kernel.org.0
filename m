Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C87F450C62
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 15:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730063AbfFXNuj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 09:50:39 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:31988 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbfFXNuj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jun 2019 09:50:39 -0400
X-Greylist: delayed 520 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Jun 2019 09:50:38 EDT
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45XVmg5DtGz8r;
        Mon, 24 Jun 2019 15:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1561383651; bh=h+Ajvt6l3Z8eH2pMN2nrxhryZfTf/CDYIKZlF6F1ED0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gEV4RgH6kwFYq1wwb3/WDfjwCUHqV3wBu1/oy+Z6lh0JrTJ+c5tYnCIdkVeFIYABH
         haKzoSVa1QsZaWu31ErTV0ragPnXu2RC3HA9mj4Xs4cSl8CIV+Dxahh5HJUYrYnI25
         g0wdoXtmIi4Gwc0dIWlwgyVaersRs2zPbeOpaY6TaqIZzZYHrVp1MNaGEaZ3TSSVHz
         jrPXfrOclNShHUJLfAORiA4FncxOudUCTD+PM+qzT58BLEi2RZtyKcIjk8kEi5CrXi
         tPj5OF8WLDC1ruj8DHFH+0M6DrDoT3WkZmfUH3HA7HP0ZQpp98SO0MgqYSj5ErG5/+
         28z0stRhDtkhQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 24 Jun 2019 15:41:54 +0200
From:   mirq-linux@rere.qmqm.pl
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: gadget: u_serial: process RX in workqueue
 instead of tasklet
Message-ID: <20190624134154.GA3953@qmqm.qmqm.pl>
References: <20190624123258.GA31097@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190624123258.GA31097@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 24, 2019 at 03:32:58PM +0300, Dan Carpenter wrote:
> Hello Micha³ Miros³aw,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 8b4c62aef6f6: "usb: gadget: u_serial: process RX in
> workqueue instead of tasklet" from Dec 16, 2018, leads to the
> following Smatch complaint:
[...] 
>    431		/* We want our data queue to become empty ASAP, keeping data
>    432		 * in the tty and ldisc (not here).  If we couldn't push any
>    433		 * this time around, RX may be starved, so wait until next jiffy.
>    434		 *
>    435		 * We may leave non-empty queue only when there is a tty, and
>    436		 * either it is throttled or there is no more room in flip buffer.
>    437		 */
>    438		if (!list_empty(queue) && !tty_throttled(tty))
>                                           ^^^^^^^^^^^^^^^^^^^
> in the original code there was check for NULL here but the patch removed
> it.
> 
>    439			schedule_delayed_work(&port->push, 1);
>    440	

Hi Dan,

The code is correct and explained in the comment above it - while() loop
above can be exited before emptying the queue only when tty != NULL.

Best Regards,
Micha³ Miros³aw
