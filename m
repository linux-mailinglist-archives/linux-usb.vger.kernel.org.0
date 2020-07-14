Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5121F87C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 19:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgGNRqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 13:46:51 -0400
Received: from foo.stuge.se ([212.116.89.98]:59180 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728691AbgGNRqu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 13:46:50 -0400
X-Greylist: delayed 396 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jul 2020 13:46:50 EDT
Received: (qmail 16273 invoked by uid 1000); 14 Jul 2020 17:40:08 -0000
Message-ID: <20200714174008.16272.qmail@stuge.se>
Date:   Tue, 14 Jul 2020 17:40:07 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, balbi@kernel.org,
        linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

Noralf Trønnes wrote:
> I would like to keep the SET_BUFFER request since it will serve as a
> syncing point between the host and the device. I'm no USB expert but I
> assume that a bulk transfer can fail halfway through and result in the
> next update starting where the previous one failed and thus writing
> beyond the end of the display buffer.

Transfers either succeed completely (possibly after many retries),
time out (after zero or more transfered bytes) or fail catastrophically
(e.g. from device disconnect).

In all cases, the driver on the host knows/has available how many bytes
were successfully transfered.


//Peter
