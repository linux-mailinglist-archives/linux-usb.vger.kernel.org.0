Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4764225807
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 08:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGTG5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 02:57:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39355 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbgGTG5N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 02:57:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 3AECC5C0140;
        Mon, 20 Jul 2020 02:57:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 20 Jul 2020 02:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=8ttvPJKPJyXcH7U+l0GvF6H7q6V
        zaFDCRCVEKPFJUnA=; b=gUJqhxelWRUfUBUhISzvOZA7tn7MHj9sF8WMs3psQb+
        56MrfIEFLtAy5aGEgtgvlkmjIBNLqmz5Wb8oBT+f358EE0v/RAexIM5ZxLXKrmDN
        1gJYy4eM9AwXdlApIu8iPmlzlHIDdUFjgHWnGdtmYPMTsvv4E9YNT3qSmXo2NWRt
        XFpcikRjr53Tzft6i4bT7f0UelW0gZTp2gv1B8b6kyKxN4Dc9SNuk1uYo0aspFFH
        R/179V9/4xydPKpjmLlwhyWtqgXl1ZVVcAbcmJBQoSaa/sPrO31Fk9HxiPjthKSq
        wrIeVbHBOCo72t7Y/as2brB+TZ7kKd+dbyA4A35H/zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8ttvPJ
        KPJyXcH7U+l0GvF6H7q6VzaFDCRCVEKPFJUnA=; b=nmMctvaQQI+UnpKjYbzrvt
        aqNggGXkn/OivxMJCsKSmpfKeeBdy51FyULnYk4tXerrciIze+SzUiL1RxcGwwZw
        SbiqocJfxbX3sxVrsOyVvCzkKbQwZz4I6o7TC2TD8qaNOBp5MbVJImN0WNCHegl/
        G0q/y/tj90OTLRqd/yDgVFeuJmsyyWiIIkKMPSutKINLwQor7i7VUPJNzR1v1svo
        ANdgBHRFpWMHoHsUuYkbVaBjfUV2/uW1jhnnUprGC6GBHrU6Vtrlv9uCq0sjtdxK
        Sao/RkN//dASveN8hUoI3B7RzcetxerW8vt29SmnpeLtTM5Rxlnk371vOg8sXpfQ
        ==
X-ME-Sender: <xms:SEAVX-dcLIkZGfL8kAWGfFvHAY83_XwKBDwDGR8q83qCcPE_Qd8cVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnheplefhfeeuvdeltdefgeetjeehtedvhfekleefveelhefhhf
    eigedtueevgfeiffdunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprhgvughhrght
    rdgtohhmnecukfhppeekfedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:SEAVX4M0RYIo17eT7RtnrUQ2yrydaiCmiW5SIECGYFrN0lVG7uhk7Q>
    <xmx:SEAVX_hlyZ7KiJUmQRTdeJm4d21ZfUxo5WjV-wbVnH599u4Wkj8nZw>
    <xmx:SEAVX7-m4OIInznF4-3JcQs4M5dSqQphJsIfUpqeL_zowmuZE8E9XQ>
    <xmx:SEAVX47dHq9Yjxlg2e39gV_OATt5zKPPi5DkfLpjqEYQ7VU1--BLeg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id A052430600A6;
        Mon, 20 Jul 2020 02:57:11 -0400 (EDT)
Date:   Mon, 20 Jul 2020 08:57:22 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208267] usbip broken with latest kernels?
Message-ID: <20200720065722.GA421995@kroah.com>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
 <bug-208267-208809-qUgQYaxY5Q@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208267-208809-qUgQYaxY5Q@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 19, 2020 at 09:29:52PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208267
> 
> Jonathan Dieter (jdieter@gmail.com) changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |jdieter@gmail.com
> 
> --- Comment #6 from Jonathan Dieter (jdieter@gmail.com) ---
> FWIW, I've had this reported in Fedora as well:
> https://bugzilla.redhat.com/show_bug.cgi?id=1856443

Any chance someone can run 'git bisect' to find the offending commit?
