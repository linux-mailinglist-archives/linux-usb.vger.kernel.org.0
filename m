Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA09E47BF05
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 12:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbhLULf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 06:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbhLULf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 06:35:58 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A46C06173F
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=Cv9od1aOHMh/G9eSEBKl2WCiH1bwhFGzGvtuhH85JEE=; b=VJCUd
        03MMMDcDIY65Q9Uf8RrsZmGfV/dpUL6WBYBQKx5Ev7e1Sx0p1q/++EIwgv4YubaGofpKQNyRVcgug
        xZ4JYm2Hp4mQzwCXHuFEgtXp8g/AnNGjeRlSTVn/oP2hm1g4fWY02Y64Hsy/jJ9D81+1qYB2ZNZyn
        +fH0Sc7uTgxblaNBmjPxg/OEiJtIl7ENN2XOYfuZnm2tZQKwvr9LXbQcijbIenpDNCVa/XAB9sPwV
        pWRVJtK5AabBhSLv/RQwjCHoQ3Gn/cyL+b5nGMN6sj47HsOGdPv3f3i7pO27mIUepyrNyb6cN/A4+
        TZdmnN+KBIhlDZbuvPPWrOK/Ce6kQ==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mzdQt-0001no-Ar; Tue, 21 Dec 2021 11:35:51 +0000
Date:   Tue, 21 Dec 2021 11:35:49 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/11] usb: gadget: u_audio: Support multiple sampling
 rates
Message-ID: <YcG8Fa8mBg7VL8sb@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-3-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220211130.88590-3-pavel.hofman@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 10:11:21PM +0100, Pavel Hofman wrote:
> From: Julian Scheel <julian@jusst.de>
> 
> Implement support for multiple sampling rates in u_audio part of the
> audio gadget. The currently configured rates are exposed through
> read-only amixer controls 'Capture Rate' and 'Playback Rate'.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---

> diff --git a/drivers/usb/gadget/function/uac_common.h b/drivers/usb/gadget/function/uac_common.h
> new file mode 100644
> index 000000000000..3ecf89d6e814
> --- /dev/null
> +++ b/drivers/usb/gadget/function/uac_common.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + */
> +
> +#ifndef UAC_COMMON_H
> +#define UAC_COMMON_H
> +
> +#define UAC_MAX_RATES 10 /* maximum number of rates configurable by f_uac1/2 */

Why a new header for this - doesn't it belong in u_audio.h?
