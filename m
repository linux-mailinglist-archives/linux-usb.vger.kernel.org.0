Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B9E17A342
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 11:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgCEKfY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 05:35:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:40300 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbgCEKfY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 05:35:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 86404ADFE;
        Thu,  5 Mar 2020 10:35:22 +0000 (UTC)
Message-ID: <1583404507.12738.32.camel@suse.com>
Subject: Re: [PATCH 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
From:   Oliver Neukum <oneukum@suse.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>, linux-usb@vger.kernel.org
Date:   Thu, 05 Mar 2020 11:35:07 +0100
In-Reply-To: <24160.54137.563763.50884@beetle.laas.fr>
References: <24160.54137.563763.50884@beetle.laas.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 05.03.2020, 11:24 +0100 schrieb Anthony Mallet:
> By default, tty_port_init() initializes those parameters to a multiple
> of HZ. For instance in line 69 of tty_port.c:
>    port->close_delay = (50 * HZ) / 100;
> https://github.com/torvalds/linux/blob/master/drivers/tty/tty_port.c#L69
> 
> With e.g. CONFIG_HZ = 250 (as this is the case for Ubuntu 18.04
> linux-image-4.15.0-37-generic), the default setting for close_delay is
> thus 125.
> 
> When ioctl(fd, TIOCGSERIAL, &s) is executed, the setting returned in
> user space is '12' (125/10). When ioctl(fd, TIOCSSERIAL, &s) is then
> executed with the same setting '12', the value is interpreted as '120'
> which is different from the current setting and a EPERM error may be
> raised by set_serial_info() if !CAP_SYS_ADMIN.
> https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L919
> 
> Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
> Fixes: ba2d8ce9db0a6 ("cdc-acm: implement TIOCSSERIAL to avoid blocking close(2)")
Acked-by: Oliver Neukum <oneukum@suse.com>

	Regards
		Oliver

