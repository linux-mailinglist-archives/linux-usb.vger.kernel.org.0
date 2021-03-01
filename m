Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFBF328B75
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 19:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbhCASfH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 13:35:07 -0500
Received: from foo.stuge.se ([212.116.89.98]:50378 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239458AbhCASc4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 13:32:56 -0500
Received: (qmail 6091 invoked by uid 1000); 1 Mar 2021 18:31:58 -0000
Message-ID: <20210301183158.6090.qmail@stuge.se>
Date:   Mon, 1 Mar 2021 18:31:58 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
 <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
 <20210225213729.GG20076@stuge.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225213729.GG20076@stuge.se>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

Peter Stuge wrote:
> I'll prepare a test setup for the RGB-TFT on the weekend.

So implementing a GUD and looking at the protocol from yet another
angle gives more new insights - surprise. :)

Here are some thoughts so far:

* GUD_REQ_SET_VERSION does still rub me wrong; it seems potentially
  quite complex to maintain compatibility in two places; both for host
  and device. I don't want to insist on removing it, but at a minimum
  it's quite unusual.
  Part of the idea in USB is that host software updates are easy if
  not fully automated but device firmware updates less so, thus
  complexity is rather placed in the host.

* It's unclear to me from reading the header files in this v6 patch set
  which GUD_REQ:s and which properties are actually mandatory in devices.
  I'm getting hints from your STM32 device and reading the driver code in
  detail, but what do you think is a good way to document what's required
  vs. optional?

* GUD_REQ_SET_BUFFER my old nemesis. :) It's great that it's optional!
  But do you see any way to turn it into a bulk message, in order to
  remove the memory barrier effect of a control transfer before bulk?

I think it would be possible to noticeably improve performance later,
by changing the host driver to submit asynchronous bulk transfers for
frame data rather than waiting for each transfer to finish; bulk
transfers will then pack optimally on the wire - but with a control
transfer in between there's no chance of achieving that.

Having only one kind of transfer in the hot path would also simplify
canceling still pending transfers (when using async later) if new data
gets flushed before the previous frame is completely transfered.

* A fair bit of the EDID isn't used or has dummy values. Have you already
  considered and dismissed some other ways of accomplishing the same?

* Sorry if I've asked before - but what's the purpose of
  GUD_REQ_SET_STATE_CHECK and GUD_REQ_SET_STATE_COMMIT? Why/when does
  drm do pipe check vs. update?

* How do you feel about passing the parameters for
  GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE in wValue?
  It would save the transfer data stage.


Kind regards

//Peter
