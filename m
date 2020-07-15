Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3225220633
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 09:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgGOHat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 03:30:49 -0400
Received: from v6.sk ([167.172.42.174]:37176 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728888AbgGOHar (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 03:30:47 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 8175060D19;
        Wed, 15 Jul 2020 07:30:15 +0000 (UTC)
Date:   Wed, 15 Jul 2020 09:30:10 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     Peter Stuge <peter@stuge.se>, balbi@kernel.org,
        linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
Message-ID: <20200715073010.GA41046@demiurge.local>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
 <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 14, 2020 at 09:03:14PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 14.07.2020 19.40, skrev Peter Stuge:
> > Hi Noralf,
> > 
> > Noralf Trønnes wrote:
> >> I would like to keep the SET_BUFFER request since it will serve as a
> >> syncing point between the host and the device. I'm no USB expert but I
> >> assume that a bulk transfer can fail halfway through and result in the
> >> next update starting where the previous one failed and thus writing
> >> beyond the end of the display buffer.
> > 
> > Transfers either succeed completely (possibly after many retries),
> > time out (after zero or more transfered bytes) or fail catastrophically
> > (e.g. from device disconnect).
> > 
> > In all cases, the driver on the host knows/has available how many bytes
> > were successfully transfered.
> > 
> 
> I was thinking about the device, that it could get out of sync. Let's
> say the host sends a 1k framebuffer and half of it gets transferred and
> the rest fails for some reason. Lubomir's MCU implementation has an
> endpoint max size of 64 bytes and a callback is called for each packet.

Note that 64 bytes was chosen totally arbitrarily, without any thought.
Perhaps the full frame of 1024 bytes would work just fine. I'm not
familiar with USB at all.

> If the 1k transfer fails at some point, will the device be able to
> detect this and know that the next time the rx callback is called that
> this is the start of a new framebuffer update?
> 
> Noralf.

Lubo
