Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F8ED5E15
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 11:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730588AbfJNJEg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 05:04:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:60774 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730423AbfJNJEf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 05:04:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 46D04B498;
        Mon, 14 Oct 2019 09:04:34 +0000 (UTC)
Message-ID: <1571043862.19529.9.camel@suse.com>
Subject: Re: Possible bug with cdc_ether, triggers NETDEV WATCHDOG
From:   Oliver Neukum <oneukum@suse.com>
To:     Adam Bennett <abennett72@gmail.com>,
        =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Date:   Mon, 14 Oct 2019 11:04:22 +0200
In-Reply-To: <339e0633-6dd3-5c0f-0b6d-598848bf1d37@gmail.com>
References: <3913c851-93f8-3d26-a578-f5a2c8b69aaa@gmail.com>
         <878spuxpu6.fsf@miraculix.mork.no>
         <339e0633-6dd3-5c0f-0b6d-598848bf1d37@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 09.10.2019, 09:27 -0400 schrieb Adam Bennett:
> On 10/9/19 4:53 AM, Bjørn Mork wrote:

> > This warning means that the gadget doesn't accept the packets we send
> > it.  There isn't much the host can do about that, except dropping
> > packets on the floor.  Which is why the warning is this loud.
> > 
> 
> Would a firewall on either the linux host or the Pi Zero cause the same 
> problem (and message)?

If a firewall discards a packet, it will not reach the transmit queue.
Hence the answer to that question is negative. If other OSes get this
device to work, we would need to know what they are doing differently.
Can you get a trace from them and compare it to ours?

	Regards
		Oliver

