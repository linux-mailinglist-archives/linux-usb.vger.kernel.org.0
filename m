Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0834A327003
	for <lists+linux-usb@lfdr.de>; Sun, 28 Feb 2021 02:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhB1Bw6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Feb 2021 20:52:58 -0500
Received: from foo.stuge.se ([212.116.89.98]:48062 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhB1Bw5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Feb 2021 20:52:57 -0500
Received: (qmail 3253 invoked by uid 1000); 28 Feb 2021 01:52:09 -0000
Message-ID: <20210228015209.3252.qmail@stuge.se>
Date:   Sun, 28 Feb 2021 01:52:09 +0000
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
 <20210219214243.11330.qmail@stuge.se>
 <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
 <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Noralf Trønnes wrote:
> Peter, please have a look at this diff and see if I'm on the right track
> here: https://gist.github.com/notro/a43a93a3aa0cc75d930890b7b254fc0a

Yes that's exactly what I meant; this way the possibility for contradicting
sizes is eliminated by protocol and not just by implementation - very nice!

Some more comments, sorry if this is just because of ongoing work:

Perhaps the functions taking usb_device + ifnum could take usb_interface
instead - but I don't know if that would simplify or complicate things.
Alan mentioned this idea in similar circumstances in another thread.
I don't feel strongly, but perhaps it's cleaner.

gud_usb_control_msg() now seems almost redundant, maybe it could be removed.

In gud_usb_set() if NULL == buf then that's passed to usb_control_msg()
along with len, which likely crashes if len > 0, so it may be good to
check or enforce that, maybe with else len=0; before the gud_usb_transfer()
call.

Finally a small style note that I'd personally change a few if (ret > 0) {
blocks to have one indent level less and do each check right away, e.g. in
gud_connector_get_modes():

ret = gud_usb_get()
if (ret % EDID_LENGTH) {
	drm_err();
} else if (ret > 0) {
	edid_ctx.len = ret;
	edid = drm_do_get_edid();
}

and later on in the function by the display modes one indent level
could be saved with a goto:

if (ret <= 0)
	goto out;

but obviously no huge deal.


In general it's really helpful for device development to see error messages
when the device behaves incorrectly, the "Invalid .. size" errors are great
examples of this, but e.g. gud_get_display_descriptor() returns -EIO without
a message. Maybe there are opportunities for further helpful error messages?


Thanks a lot and kind regards

//Peter
