Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EE24844A4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 16:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiADPdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 10:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbiADPdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 10:33:03 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CA8C061761
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 07:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=oy35XC41/H24vWLCGb4jFDn864yImNmSZZ6NALNtQUs=; b=P41+B
        uN+eMmOdoRqdmo5Yku2i93all8oQPZpdPWrne1JfbOAf4G1kMk2UNBUaH9IbI5Ojo7nHCSqu1gRls
        KS12v/zS8FAYhGNiHQ8+Zm9a4azggM/50ZLmHFnqqeBTOGxxoxJyv+GzTyH6JQDgTu1TcBeFcaVF+
        7BoPHPjW9pqQ43kqFfxROafpsgqTYmNx+oKWSNDxbf+fOeXvgHaJxVPWNyqNZctxBzP5usQBCnpyo
        Qb+9lj3FnmyO4df+gU0CBvrf7oQ/jFm1qnbQb/dLopv7sMn92C8NrjGI5x8SaUU4JDFp0hCyZV+Cv
        d6sFSsiYxA/G+rNqDBVTl6HiZuIAA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1n4lo3-0008LJ-1M; Tue, 04 Jan 2022 15:32:59 +0000
Date:   Tue, 4 Jan 2022 15:32:53 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/11] usb: gadget: u_audio: Support multiple sampling
 rates
Message-ID: <YdRopd4BfUM9ZtbX@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-3-pavel.hofman@ivitera.com>
 <YcG8Fa8mBg7VL8sb@donbot>
 <6392639d-8a6f-8203-e5d0-e862ee1d2654@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6392639d-8a6f-8203-e5d0-e862ee1d2654@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 22, 2021 at 08:13:01AM +0100, Pavel Hofman wrote:
> Dne 21. 12. 21 v 12:35 John Keeping napsal(a):
> > On Mon, Dec 20, 2021 at 10:11:21PM +0100, Pavel Hofman wrote:
> > > From: Julian Scheel <julian@jusst.de>
> > > 
> > > Implement support for multiple sampling rates in u_audio part of the
> > > audio gadget. The currently configured rates are exposed through
> > > read-only amixer controls 'Capture Rate' and 'Playback Rate'.
> > > 
> > > Signed-off-by: Julian Scheel <julian@jusst.de>
> > > Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> > > ---
> > 
> > > diff --git a/drivers/usb/gadget/function/uac_common.h b/drivers/usb/gadget/function/uac_common.h
> > > new file mode 100644
> > > index 000000000000..3ecf89d6e814
> > > --- /dev/null
> > > +++ b/drivers/usb/gadget/function/uac_common.h
> > > @@ -0,0 +1,9 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + */
> > > +
> > > +#ifndef UAC_COMMON_H
> > > +#define UAC_COMMON_H
> > > +
> > > +#define UAC_MAX_RATES 10 /* maximum number of rates configurable by f_uac1/2 */
> > 
> > Why a new header for this - doesn't it belong in u_audio.h?
> 
> The constant is used in subsequent patches in f_uac1.c, f_uac2.c, their
> headers u_uac1.h, u_uac2.h, and legacy/audio.c (which already includes
> u_uac1.h/u_uac2.h as needed). Since all occurences must use the same value,
> I did not know how to solve this without introducing a common header file,
> included in the existing headers u_audio.h, u_uac1.h, u_uac2.h. If there is
> a better way, I will be happy to use it, I do not like the extra common
> header file either. Thanks a lot for your help.

Ah, right - I hadn't accounted for UAC1.

Do you think anyone is using UAC1 these days?  I wonder if it makes
sense to just drop those changes and focus on UAC2.


John
