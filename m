Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1416147A61A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237945AbhLTIhS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:37:18 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52399 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237925AbhLTIhS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 03:37:18 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id AFE785C014B;
        Mon, 20 Dec 2021 03:37:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 20 Dec 2021 03:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=YXpd9V2VZD4CDAsMH9+ITjtk99f
        rFY5etbfS4YScy2Y=; b=A2Pc0tIxRJ0gqGX1lMGpUcBXuMnQgrOSXsBBnXms3wm
        2tSg9d3HsIqJeLq84oIl1m1WrZgF7uTDVwYewqT5mX/QVK/bhvvRpncZxvAmanHc
        D4UQCxrzjRhLCKaRMvWSQeL5Hnq2mDE6lhHKJ97OaNcgithrAmy4E9wgA2uk0dah
        FNOHEKiY+PtiS114HFRubaHU2tK2s+A1OjbGqPqpIqB9/Q08CLl1Tq0bUFEwnCt4
        YVe6uf/O/sfTDpqLIZmqbELy/lkD/X+Qj7jN2hA5A2hm/T0SCfVsIe3AKRatkpkw
        6QtdsNZS+MwbcFfz1E8Tolel5+oFoPmI9x9MAQlGXmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YXpd9V
        2VZD4CDAsMH9+ITjtk99frFY5etbfS4YScy2Y=; b=g27Xh/YgToO6D8Cm/8D0Nx
        tmYvhbk7YceKx91PCaiR0zgtq7dgQX6US1k+xNyssua89e5l/J4OyZVyWaY6mOxn
        dtO/eeprIQSaJ5olUv6Vh+SQM88nCQrFxr4SqOTOgPoC+cLqs5HAMUoHhHLguW8O
        Cb/Z0FV7YzZlwAMtWfs93KqrHNTE7IrUqOJvgHV/6Cct0J/ANldsGKQEpQ/BrUb5
        KEM16uW4Tko7BD+YeAZeB9RYIfGuCzs+GcR1VZyXgKix5Pi/qXFqGVUSTwpMNZ0e
        trpyq9edygyNDqdg+mvkxHNy/nkw3ufMPJmjpY4pnXkjKolOrQ7VTmdXu67QZIcw
        ==
X-ME-Sender: <xms:vUDAYUbAPrfxkhvW7akGjN4eMl0upBA9HOOCi5WSjBTxMB7rNYA-QQ>
    <xme:vUDAYfbd9KIsUwPwrfZw1tX8rksdKXXi4hHd-h66wdFGwtXecO7XnQsL19l2e1OUy
    NxjNCRLwAy-vA>
X-ME-Received: <xmr:vUDAYe_d1UsMD2l4iEeQHl2ChHDl07S5KZLFWp4aPQqvd_0xdB3KyI3NQYdW8jQDiA4MFCEujL6fZ03d0zncamU-SheoFGsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtuddguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeevueehjefgfffgiedvudekvdektdelleelgefhleejie
    eugeegveeuuddukedvteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:vUDAYeqkq457oZ3Us6eK-42h_ozESGhbZl2y2UZ-1gpxt-nuWIIdeQ>
    <xmx:vUDAYfo3OyUqWquZFrwtyrhmZzPwmc4W9rZMl2xMVOtCQY4UtCCUFw>
    <xmx:vUDAYcQN4PVlmUXjxPz1oTjfZbSqEuqqp3-ifZXgpxt221R7cCA5Vw>
    <xmx:vUDAYW2KU64KRETjLAJu-mAVKUWcC8v0jU93XbLfMt8DDvj_n6PT2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Dec 2021 03:37:17 -0500 (EST)
Date:   Mon, 20 Dec 2021 09:37:14 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215361] New: SL-6000 zaurus USB error - 'bad CDC
 descriptors'
Message-ID: <YcBAuk0027ItjqYX@kroah.com>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 19, 2021 at 06:14:00AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> A 'bad CDC descriptors' error occurs when plugging the Sharp SL-6000 zaurus
> into USB. It was working in 2.6.32 but has been broken from kernel 3 onwards.

2.6.32 was released in 2009, and 3.0 was released in 2011.  Can you
please try a more modern kernel like 5.15, or ask for support from the
vendor that is forcing you to use older kernels?

Or, can you use 'git bisect' between the working and failing kernel
versions to track down the offending commit?

thanks,

greg k-h
