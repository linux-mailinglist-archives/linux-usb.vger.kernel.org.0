Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1336144255
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 17:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAUQje (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 11:39:34 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:18514 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726714AbgAUQje (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jan 2020 11:39:34 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 482DlS0pHqz5H;
        Tue, 21 Jan 2020 17:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1579624772; bh=5gdGMYaHYIG2g9T+A3VkMQR9uhBZr53wnqVlXITikBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZRuaOrlA6P+ZHCCf/N9Y5FuhUZpd7M4lTX+pZByZSbFIj/ikwkbHATf3yO32g6RPf
         OLQlEMqkze/7HgrUPO2nrYAtSkJSpgBHy2H/gy01J6cbN7qolTCW/OmCFA0fEfZTCY
         oSzZSuf53VKHTj4MtItqsF2AsQGGhq5gk7Gg2MuSoKVWKYZ7cYhwhlXmK+PPEc55IZ
         JzIwes2liwdM//ij6GhPsGwYOydn5fWW+6f9n9gvGtpcy2nvKPuGcgkc5VcuoUE6aq
         r1fL6jauDmTOIwIQeZSOxftK+VBzJJgizhjtJUezR+iI/Ip30AFdxNx/2cKJ0pMPZN
         kYxQjWHpFPOOg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 21 Jan 2020 17:39:30 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Sergey Organov <sorganov@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: serial: fix Tx stall after buffer
 overflow
Message-ID: <20200121163930.GA30699@qmqm.qmqm.pl>
References: <87pnfi8xc2.fsf@osv.gnss.ru>
 <87a76hh13r.fsf@osv.gnss.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a76hh13r.fsf@osv.gnss.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 21, 2020 at 07:42:16AM +0300, Sergey Organov wrote:
> Symptom: application opens /dev/ttyGS0 and starts sending (writing) to
> it while either USB cable is not connected, or nobody listens on the
> other side of the cable. If driver circular buffer overflows before
> connection is established, no data will be written to the USB layer
> until/unless /dev/ttyGS0 is closed and re-opened again by the
> application (the latter besides having no means of being notified about
> the event of establishing of the connection.)
> 
> Fix: on open and/or connect, kick Tx to flush circular buffer data to
> USB layer.
> 
> Signed-off-by: Sergey Organov <sorganov@gmail.com>
> ---
> 
> Changes in v2:
> 
> - Add comment to document why tty_wakeup() is kept in place
> - Don't add debug print
> - Remove NOTE from description

Reviewed-by: Micha� Miros�aw <mirq-linux@rere.qmqm.pl>

Best Regards,
Micha� Miros�aw
