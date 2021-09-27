Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1844419E50
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 20:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236123AbhI0ScU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 14:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236025AbhI0ScT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Sep 2021 14:32:19 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BDCC061575
        for <linux-usb@vger.kernel.org>; Mon, 27 Sep 2021 11:30:41 -0700 (PDT)
Received: from miraculix.mork.no ([IPv6:2a01:799:c9f:8608:6e64:956a:daea:cf2f])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 18RIUTYm1499397
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 27 Sep 2021 20:30:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1632767429; bh=Br0dxDUXmS46R8VXa+3JDvUsYLhphZTN99Gw2x1jE5E=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=SjwIaFfF5i9ygrBiDBHMjBTJGs5GSvLZXXRxOTxd/N2CvGBtCHCwVQjlSqprOvgbc
         F1GTPR8fVDlIKaG8IshabXJ0cTjZSN/1ouitm4tswY6zh4cchgCDKL91ks6G7o4MHa
         eSuEigJS4ajfCmbXDkXVM5+ylJ6T5DvPyf4rQAfo=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94.2)
        (envelope-from <bjorn@mork.no>)
        id 1mUvOX-00031o-2Q; Mon, 27 Sep 2021 20:30:29 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] xhci: add quirk for host controllers that
 don't update endpoint DCS
Organization: m
References: <87h7hdf5dy.fsf@miraculix.mork.no>
        <87tuj4jot3.fsf@miraculix.mork.no>
Date:   Mon, 27 Sep 2021 20:30:29 +0200
In-Reply-To: <87tuj4jot3.fsf@miraculix.mork.no> (=?utf-8?Q?=22Bj=C3=B8rn?=
 Mork"'s message of
        "Wed, 01 Sep 2021 17:30:48 +0200")
Message-ID: <87zgrxq3ay.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.2 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bj=C3=B8rn Mork <bjorn@mork.no> writes:

> From: Jonathan Bell <jonathan@raspberrypi.org>
>
> Seen on a VLI VL805 PCIe to USB controller. For non-stream endpoints
> at least, if the xHC halts on a particular TRB due to an error then
> the DCS field in the Out Endpoint Context maintained by the hardware
> is not updated with the current cycle state.
>
> Using the quirk XHCI_EP_CTX_BROKEN_DCS and instead fetch the DCS bit
> from the TRB that the xHC stopped on.
>
> [ bjorn: rebased to v5.14-rc2 ]
> Cc: stable@vger.kernel.org
> Link: https://github.com/raspberrypi/linux/issues/3060
> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.org>
> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> ---
> [ resending this as I haven't seen any ack/nak and wonder if it might
>   have gotten lost in a large pile of vacation backlog ]

ping?


Bj=C3=B8rn
