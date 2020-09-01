Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2E1259188
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 16:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgIAOwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 10:52:36 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36605 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728350AbgIAOwT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 10:52:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 5FE2D5C0163;
        Tue,  1 Sep 2020 10:52:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 01 Sep 2020 10:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ExsstqXbgT16tZUkXymc+robIbB
        YFiDQUnyb7vHjAyk=; b=mbxMpaHVAB2A7uvYh0Z/GOxZWAs80EGvL4iiKp5FtJX
        8BI+wIDgMkaEVnh2BSwCVzURZ4kUf9QHQWcLEzC5u//B/5c+pA6i6I94IyufJ//C
        lWVcEfnFnsZEGuGUiDJU4pMXSHZaw7Pm+fQ570aUpd8nBVuVRKgqm/KR+1IfSNW9
        1T76QKYMPJSgfvHkfNvOQK37CJOcvVmdK9hOSThTa9bg9G7HVMUuVD562mdmJnqj
        iA2Tg2v2aGck6tjey0uPzxZ5pfhJi6iwKsh/4teNkz36/uJmlPbyZ8Cmk5GnAzzy
        eIjORQHrEEF3Xq6eXuYJnHtdpWuu6TG1MagEuKND4WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Exsstq
        XbgT16tZUkXymc+robIbBYFiDQUnyb7vHjAyk=; b=bz3zIkZTDDN+7H0bGfhTZB
        qJAyBn8mAu/wYFvU22i5jFMFr88C/NHlpn4FpwjmpPnBtZ+ZK9+zXCM3boZ83opy
        r7TSOItN0hwufF8qyh6Xb+cb/neBYXvkeRSG1zYsdZ8P9zwFJ0E+w9QlJlikSavk
        9MSDpoibCF/TRAWU+AKRS7SEK0hJAG8Es92d6+8OxMBaik56tx9pH+6Nb1NXwi3J
        m70J9V2yUW3onXe1mYrUKL1150z/gcYf7YUqehLsQUTdBx1I8/osKXFhywSCJ69U
        M5WP7endZ4DDh8+vRNIkmKny01mvT1AScvP83OTBs39QNO5waCZIkZYfbEiJCxpg
        ==
X-ME-Sender: <xms:ImBOX2GTZ4V75GUncKv_QXcnYmp3gbkIdETbsyNgzPIV4TO3D91q-w>
    <xme:ImBOX3UC5R5-LRnoQN-_T0hXdKiLxwnNNPI43PfKSqvVxakutdfKXJyo3Mb4iT-Db
    CbA8t__Ek0CLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepueelledtheekleethfeludduvdfhffeuvdffudevgeehke
    egieffveehgeeftefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:ImBOXwKC85gY9o2eXrpx_SCG-w1m1hUWuqhZej7Ba1i8Wysynye2QA>
    <xmx:ImBOXwGTN8EyYYjvqv1fq65t-Yg2WzZ1wXswV-NRTPbDYvTzZHhjuQ>
    <xmx:ImBOX8VB7NHUkLJU-6wq_TsxCqVDlO-I366JchFQpS-WHd6qF19utA>
    <xmx:ImBOX_Auua1k5iDZ8_xVx1_Zs9OtnaI61MMiuBmX5WgJkvXfsO3ekg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id C7B4F306005F;
        Tue,  1 Sep 2020 10:52:17 -0400 (EDT)
Date:   Tue, 1 Sep 2020 16:52:45 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208267] usbip broken with latest kernels?
Message-ID: <20200901145245.GA1111817@kroah.com>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
 <bug-208267-208809-BbodEKaLlH@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208267-208809-BbodEKaLlH@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 01, 2020 at 02:18:17PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208267
> 
> --- Comment #14 from DocMAX (forum@docmax.my.to) ---
> things = breaking functionality of well known programs that are even integrated
> in the kernel.

Bugs happen, we are human :)
