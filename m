Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B55347BBB4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 09:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhLUIUh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 03:20:37 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42081 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232095AbhLUIUh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 03:20:37 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 7172A5C004D;
        Tue, 21 Dec 2021 03:20:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 21 Dec 2021 03:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=smcusCOvJzlgP2hUumXVjI/bsBg
        DP2hb7V/b/WIhwdQ=; b=LY+++PPPZRPo4AARICEfB2fkVyap/27div+BYuZ/AHO
        a1qstwNyFI3c2cK2K8lZI/EGP3skIt5j2b6JsDcEnlUKNQvi8CiNiRPRzjPD4s9j
        bBu/7eccnWTmAv1hzcfaWdJJcB01goIXCxKF2sAuyM18FJkLxA+Ckw+30K7HDX1j
        W69U/8bGUz1EHFbr0cDXu0+aSc0pQ8dr9DGE2AdEXrAr7shDuu+ZY1y/ochLpYUC
        66mdxSFbsmpDGObB4buOgeRAKG4Se8rTe72f/R9gSePb7QOAqt9vzr2utm09bBR0
        CpixirF33Ko7sv0pslfn/C35zz0jZKpF/Vbj1Zl8n6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=smcusC
        OvJzlgP2hUumXVjI/bsBgDP2hb7V/b/WIhwdQ=; b=VddjjEZo/uxOz/oeZvtOni
        VqYUnKzG+EDx8KXRv4U5jddKWemjqWUDOfvij4QvzBcpZpTR8CPr1+OtNn+5DA6F
        TBy2jybBrAPAZA6acwGJ0vUcVluX85ZT0qUh4RqZDbrfvsU1G2ttH9lDcROzCF/n
        vXY5AGOMjxyGEhahoY05bBHb+Tf26ILm8j/Fpn0N5U6XvqRwzFZfB89cPKLhNlCl
        JFaaaSyzW3TQ5Xjo2u4oFocFjPxPUK2NNVz8+1PrGsWK3P83kSKEEKpg8GpU/vE3
        1smOBqdOUFeCDwRcyJzCak6Gbtfhu5BEA5UkbEqqAiRpTM8+/NF5f6cSrOksCjIQ
        ==
X-ME-Sender: <xms:VI7BYeLIh2V6rCFX4THllTU13bpl5TeUhzML0Sl2pJbVf8KmH4AdXA>
    <xme:VI7BYWKwma1t5h2Q0IDvYPOpd_4WDB3-4nZRcnGtyXyKOxN_pNjm3oaKb1hwAW264
    wbwN26L0xG4lg>
X-ME-Received: <xmr:VI7BYet9oIzMutbWDZVSx67tK56fDyFnKotgmF1OgdyWqE9NbTLRUfVMqYch6IeWcgMyKVoM_ArI8a67k9j7HgKDQw81xxUF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtfedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeevueehjefgfffgiedvudekvdektdelleelgefhleejie
    eugeegveeuuddukedvteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:VI7BYTYr_jSA7Sp3enldfq63H02MzmhqWhlt5V7uf_s7wmnhuFOhWQ>
    <xmx:VI7BYVauFtFTIKoegq8SAJ4Mo7OlG91H7LHqpVC9dVsWb8vqgSWw9g>
    <xmx:VI7BYfAaeDMHOpSksPv76RxFBop5XxpjMv4UhwhdnI4wWn5uNAQObQ>
    <xmx:VI7BYUnwbGNCYJD3K0u0A-PNg8s46e1ugqZnxrxEc7ayHPS9y8ZGmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Dec 2021 03:20:35 -0500 (EST)
Date:   Tue, 21 Dec 2021 09:20:33 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Message-ID: <YcGOUdlWEwDG+SV8@kroah.com>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
 <bug-215361-208809-UcLCp9zH1m@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-215361-208809-UcLCp9zH1m@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 21, 2021 at 08:07:37AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> I am wondering if there was a change in the cdc_ether or zaurus modules 
> that caused it to stop working in 3.0.

There probably is.  Can you please use 'git bisect' between those two
versions to find the offending change?

thanks,

greg k-h
