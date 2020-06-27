Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E24120BED9
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 07:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgF0FSP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jun 2020 01:18:15 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47255 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725840AbgF0FSP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Jun 2020 01:18:15 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B901C5C0086;
        Sat, 27 Jun 2020 01:18:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 27 Jun 2020 01:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=okhKTy6GGTog6o0ZpWWGFknKBch
        x+Wyb5+yj0hFRF3M=; b=qmt4RAq/poeK6cDSu8JlYRnIi7AW8DpDT4TUuDGD+wS
        SVpvn+Kwfc0VYpJZVUoLBKSO3BZvpeJ4sTstt9IlbuNFzHQosmBwGXRGKxxptjde
        /UY5Xf0LgOK28MWmWnkz/Q0d11AnmmlOlM0Pzr+Sx8JV+QKIt9H0l2ANH30W9QqF
        luwGDotuu3qoAM0r1aKPkOaBYnB4od0pjhjWOWNik3PRi+iZpTrLelWMku1ZHqyz
        96PZpY0UzqhFFvSOw7tiNM1bVR/nm4IJnQFVe/gqd84Dy7D1RYM6DK8u0QO5uU9s
        9mD9RYvxiaIsmj6CzHED8qzyKH8Ho/dFVWcRFe6FYVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=okhKTy
        6GGTog6o0ZpWWGFknKBchx+Wyb5+yj0hFRF3M=; b=tEYnbCVARr5BTv0tlzQUAZ
        lC0W3wCcsktrnEogMgVFHxOLIamg/3+FDvYWTS7O7dFNRhIj98o0Wz8bC89Zr6Hn
        zaNE/sbnRvFfbaW9ixZL8lNsHTQiYW7AyjWsRnzAaN6isfhKPQBu3wTY/pG2g1Xo
        xX5W/YRM33ipZ38ZrY4hqa8pwK+wUL+d0NBSzuzQcPifGgNac4DeATK2ObkrVzu0
        XQU5t6GG+YjssT88lm4uKS48OenyIuWxTcLtCegYQGEyoDSXI5DS/N9XDk/D++TC
        RDQaI9RKwSxR6xrIHS2F8NW+rdbxVcGDzaYpqHPZ+UlD+Fiel/3DZQyVWBcv6e5A
        ==
X-ME-Sender: <xms:ldb2Xn4fbS47lubVT58tQARMIROWQ9dwbVZmnH7ysd-i0HcyLmU8kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudelvddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecukfhppeekfedrkeeirdekledruddtjeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homh
X-ME-Proxy: <xmx:ldb2Xs6432Ir-lNS-RDqyrFikEWruz80Y8I4GB_r1shSHgcQ4Our4g>
    <xmx:ldb2XucbkxJu19oFKJduPK_Lqvcg_qA_KQkJVI1SpbCHcVyinSZyFA>
    <xmx:ldb2XoLXi2P6sbvZMDBfwyD5lkqfWb3535aFE32TLiTE0C3akLSqNg>
    <xmx:ldb2XgW8Jh71z9yYxwDSMq4v1GELvR4cme-L41I6qK9wXT6J2nLUOQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 518553280059;
        Sat, 27 Jun 2020 01:18:13 -0400 (EDT)
Date:   Sat, 27 Jun 2020 07:18:10 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208337] New: ucsi_ccg 6-0008: con1: failed to register
 alternate modes
Message-ID: <20200627051810.GE233327@kroah.com>
References: <bug-208337-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208337-208809@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 03:43:18PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver for UNIX platforms 
> 440.82  Wed Apr  1 19:41:29 UTC 2020
> kernel: [drm] [nvidia-drm] [GPU ID 0x00000100] Loading driver
> kernel: [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:01:00.0 on minor 1
> kernel: nvidia-smi (368) used greatest stack depth: 12488 bytes left
> kernel: usb 5-1: New USB device found, idVendor=2109, idProduct=2820,
> bcdDevice= b.a3
> kernel: usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> kernel: usb 5-1: Product: USB2.0 Hub
> kernel: usb 5-1: Manufacturer: VIA Labs, Inc.
> kernel: hub 5-1:1.0: USB hub found
> kernel: hub 5-1:1.0: 4 ports detected
> kernel: ucsi_ccg 6-0008: con1: failed to register alternate modes

And what is wrong with this?

Also, 5.4 is really old for typec stuff, please use 5.7 at the latest.
