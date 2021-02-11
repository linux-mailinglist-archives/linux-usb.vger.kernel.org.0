Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C401318556
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 07:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhBKGs1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 01:48:27 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:32999 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229467AbhBKGsZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 01:48:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 9228ECAD;
        Thu, 11 Feb 2021 01:47:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 11 Feb 2021 01:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=O46lrPjMLVXudjYcKwf2Yf9Ydd9
        iunqvTUsEaSqo9I0=; b=VCHS9lFVd7fiUnvRUaL37Pp7r/N8LRdNdTEf0Xg+pii
        Ia4cwVMUe+r9aXsxYdZxTfw0ZKY9wB6Kq/1sfmIQZs88SMx8HHMG291afk8bY70A
        DJWCXLpPy08gRLt6xP1a4wg8Us2JvfAmJbTf1W5AA41GoO+ZKo1NWYyAivaGp+DR
        2s7cPrWVJ9vETTUyL2X4a8av2CXLemBV/9k0VPN0Lc9TM9DXVFCUJgND+PV/JboA
        U60Qs36ky5s+lWnsElW+IFk6h6jYaJF8YbS06M+AOdclbn+6cVCueRRqCVbjAQAP
        TA5KQ1g0HdHKCQmmk/w9oSqNJlKrVFYTG+qfteAixyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=O46lrP
        jMLVXudjYcKwf2Yf9Ydd9iunqvTUsEaSqo9I0=; b=tK1HgKtVECMNHvm978GyVO
        xb9vAYUTIuUoEP0DA8zRLUXI8NQZRd/11jdKuWlBQixgwitd2g8OfrceI8mDLcur
        0jo17NrTqKyL7cK3ucE56ymQYp06Gir6B5W4ANARccp+Z4HD5Oy9dDhU7Dv2SrDN
        Fgr/a9dUHXHJphmSklPy9DXFVEYsUB0WDyz1taFL9oaSpkm16zZHGBl0M2wXxTHA
        2jDTdqk3pPQ4Wm3LIkhiCDZvsmcwg4DAvEIH2bCi3ITWVF8bUug3t/oqEuEb/uc3
        Wo9k/gimMvgwhWgMscjtmmRF0R+7UFZr/nwZ+/p3yGBCX6ECN8uumsLsb7xkrGyg
        ==
X-ME-Sender: <xms:99IkYGRaPIta3gs7JCeE610DuvsxoA6y1rcPAgWMQZEWdTGstW13xg>
    <xme:99IkYLxwDtaLx3tg3KNlgfLOYg2vd37P2y0WZ8NkS8B_E0kcgk3JgMmpE3LKvP7qz
    VW3qpB_t0c6Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheekgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeevueehjefgfffgiedvudekvdektdelleelgefhleejieeuge
    egveeuuddukedvteenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:99IkYD1AHwoA5hxRwpavxbC4u5ax4HWpLCBRAaE26DF7QWSqRBxSGA>
    <xmx:99IkYCCUJMbFn_G9bpL43IM-emF8UMqc_MEFA-84bY_B6oPXxV6HUw>
    <xmx:99IkYPiVa8RI6bfSAExP3x2y29hQWA44VL8HIMoD23LIAhlnlljWAw>
    <xmx:99IkYBd_0Q6_3OszblPZNYC6PWUnZYvbjh9cTWN-PEaGQpld0QSddw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id C747F108005B;
        Thu, 11 Feb 2021 01:47:18 -0500 (EST)
Date:   Thu, 11 Feb 2021 07:47:16 +0100
From:   Greg KH <greg@kroah.com>
To:     Yiyu Zhu <danielzeltar@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kworker takes 100% core after unplugging usb c hub
Message-ID: <YCTS9I5xTVBDvwax@kroah.com>
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 10, 2021 at 06:31:56PM -0800, Yiyu Zhu wrote:
> Hi,
> 
> I have an Anker A8383 USB C hub with power delivery. I use the hub for
> both charging and connecting to network. But when I unplug the hub, it
> sometimes causes two kworker processes to occupy 100 % cpu time.
> The issue will go away if I plug something back into the usbc port.
> And the issue seems to persist through reboot.
> 
> I am running kernel version 5.8.0-43-generic #49~20.04.1-Ubuntu SMP

That is a very old kernel, and a distro-specific one.  Please try the
latest 5.10.y release, or report the problem to Ubuntu as they are the
only ones that can support that unknown kernel.

good luck!

greg k-h
