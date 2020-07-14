Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9DD21FD7B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 21:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbgGNTip (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 15:38:45 -0400
Received: from foo.stuge.se ([212.116.89.98]:59592 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728768AbgGNTip (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 15:38:45 -0400
Received: (qmail 18495 invoked by uid 1000); 14 Jul 2020 19:38:41 -0000
Message-ID: <20200714193841.18494.qmail@stuge.se>
Date:   Tue, 14 Jul 2020 19:38:41 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org,
        sam@ravnborg.org, dri-devel@lists.freedesktop.org, balbi@kernel.org
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
 <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Noralf Trønnes wrote:
> > In all cases, the driver on the host knows/has available how many bytes
> > were successfully transfered.
> 
> I was thinking about the device, that it could get out of sync. Let's
> say the host sends a 1k framebuffer and half of it gets transferred and
> the rest fails for some reason. Lubomir's MCU implementation has an
> endpoint max size of 64 bytes and a callback is called for each packet.
> If the 1k transfer fails at some point, will the device be able to
> detect this and know that the next time the rx callback is called that
> this is the start of a new framebuffer update?

Ah! No, a device can not detect that the host intended to send more (bulk)
packets but e.g. timed out.

I can't immediately think of other reasons for a larger transfer to fail,
which still allow communication to continue.

When the host recognizes a timeout with partial data transfer it could
simply send the remaining data in a new transfer.


While the device can not detect host intent, the protocol could allow
devices to specify requirements, e.g. that the host always sends full frames.

In any case, please avoid making a control request mandatory for frame
transfer.

Because control requests are scheduled differently onto the wire and
because they consist of more packets than bulk data, a control request
will interrupt a bulk data stream and likely introduce unneccessary latency.

If synchronization is always required then I'd suggest to place it inline
with frame data, e.g. in the first packet byte.

If synchronization is only required in rare cases then a control transfer
is probably the better choice, to not waste any inline bytes.

But the optimum would be that the device can describe its needs to the host
and the host driver ensures that the device always receives the data it needs.

Do you think this is possible?


Kind regards

//Peter
