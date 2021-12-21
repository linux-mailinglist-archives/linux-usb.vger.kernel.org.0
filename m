Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA88E47BFB4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 13:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237566AbhLUM35 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 07:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhLUM35 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 07:29:57 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A899C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=/cQ+AuCpZFXdS9c0WI3ICwcIqPz08U6S6QGgSwxOXl0=; b=WW3lZ
        jSMPYc6l/Lg4vF4r5JlbQWLY+0i+tR46R5AsZYq9oilVg60zaIzloHaxJI9+5k3aDzan4/UbyYtbR
        zM9pO81JltlcrhcnO3be/RaWzp4Pjj8VLNrJq/l0h7UpH+STzDp+Mt3xqdTrmFhhh2T6g/Uks2nZd
        2SU5tR6rv3kDV7FNYG1NjbDejMiQxz/omd3qv5Bw4Mp3ChSJfp1sAmaZJ4W+sEWlFNflnBBHhPvPs
        FMkdKyCP+utKgWb8RwcJc1id7fYFP5+wsV/5RexgZTLIlsGN8vwQ/DWdrZpinoGmZCfFaJDA8Mrha
        ODPYszSeXiSW6lAHNM+aCo8oOy1gQ==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mzeGx-0002by-EQ; Tue, 21 Dec 2021 12:29:39 +0000
Date:   Tue, 21 Dec 2021 12:29:37 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 11/11] usb: gadget: f_uac2: Determining bInterval for
 HS and SS
Message-ID: <YcHIsR4AFaL9g6N2@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-12-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220211130.88590-12-pavel.hofman@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 10:11:30PM +0100, Pavel Hofman wrote:
> So far bInterval for HS and SS was fixed at 4, disallowing faster
> samplerates. The patch determines the largest bInterval (4 to 1) for
> which the required bandwidth of the max samplerate fits the max allowed
> packet size. If the required bandwidth exceeds max bandwidth for
> single-packet mode (ep->mc=1), bInterval is left at 1.

I'm not sure if this is desirable - there are more concerns around the
interval than just whether the bandwidth is available.

The nice thing about having the HS/SS interval at 4 when the FS value is
1 is that these both correspond to 1ms, which means the calculations for
minimum buffer & period sizes are the same for FS/HS/SS.

How do FS transfers work if the bandwidth requirements necessitate a
smaller interval for HS/SS?  Doesn't that mean the FS transfers must be
too big?

I don't think there has ever been a check that the configured sample
size, channel count and interval actually fit in the max packet size for
an endpoint.  Is that something that should be checked to give an error
on bind if the configuration can't work?

> The FS mode is left at fixed bInterval=1.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
