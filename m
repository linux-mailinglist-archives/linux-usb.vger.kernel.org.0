Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23FF271A47
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 07:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgIUFFO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 01:05:14 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39507 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726228AbgIUFFN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 01:05:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B0EE35C008B;
        Mon, 21 Sep 2020 01:05:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 21 Sep 2020 01:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=gypLun0jPgetvkZD6FyF3Z4d2+y
        MYP3aTcU6VKPkCNc=; b=O8NfIfVOBebOdJvH/LsT5EpIrK/zETd8eSE6dcPbq20
        K0VVgWykP1GpYQPj/d1qwaLkE09Zkt/uOFKMkeA/EY6v/vUjmTzKIUIdifFk5F11
        xU9rZdRWTcvRc6nWT+80DI+GLLtfObqtrShRBgbAFPuHcfMQl0Y5kURthZXxg/Cc
        P5e45iErN79VHihT3+7Gb4ueaUft2huHFw2pWK311uhjAlPPViS6Dc2ozBIUjQLX
        uqwATcUUuq/1nEAg902DLjjFNKRJIO+2OiXLuTrlb6mcBFnDKUGxh/TBrPQsd8H0
        HmdOIRCQ6sf1DhJBoMmvIvG/BgOdka9tu9PoJXeLTZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gypLun
        0jPgetvkZD6FyF3Z4d2+yMYP3aTcU6VKPkCNc=; b=bcO95xSuCOAtcMy3fcrbQu
        n42y+zQL3qPbrnst3wyj7YTckVo4IGH4ynfwmn7yoHu6HnkV7tZFMeRbdEZ0AZKD
        OEu7PgdEmlZzysOa+7ZiK14Ffra/fCSJRYwXHvL/aZPOvR1RmCFelnNzSUfdv7nR
        tZykuIcWL5YPZnujnwWjIf05xctmkstYAWXFhI+pNcU686K7SivoAFQuAggeIXcl
        UVa67sh9vlaBwL8b2vtj/nXCVaFgtaLY2MqFykqlyhPB/WPbZ1FysLI+HVxBpSjx
        PtAj9XwPcW8LLG1l2psdsPfnikv39jl2hNhafxs+pbSscxfF5VUnuQwkWbFNGCbA
        ==
X-ME-Sender: <xms:iDRoXyDEpFUDmPtZaxLY2PfbbM4mt-u2SAm-7ZWNDxP79168bF08ug>
    <xme:iDRoX8hd0lTr7kV1fQg_wAR__Qcaf-vkAusIen-BFDK_b72oRk5wnj2c5U_l4VOBW
    P3_pSf1_onofg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddugdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekge
    eiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:iDRoX1n2k_nHhyGeYEUsPSpprQr_XHTRRgqnKcPoOrDEiHoD_NeHCg>
    <xmx:iDRoXwxGQ8Dbx5j6-N1JSPsIZyZ_jt3cdWRNFhSlXWyviwuLhPoY-g>
    <xmx:iDRoX3Rf54RNgJuynraDGaMMvQzniS0cPcehIp9hspEoU_BQsiZkgg>
    <xmx:iDRoX6OBCc1FOZ3amxsyqGinvcIEBj2aU0HBRRuMxQHLgiYNOObn9w>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id EED093280060;
        Mon, 21 Sep 2020 01:05:11 -0400 (EDT)
Date:   Mon, 21 Sep 2020 07:05:09 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208911] Renesas USB controller - FW has invalid version
 :8224
Message-ID: <20200921050509.GA537189@kroah.com>
References: <bug-208911-208809@https.bugzilla.kernel.org/>
 <bug-208911-208809-1kyMI7584h@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208911-208809-1kyMI7584h@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 20, 2020 at 09:38:10PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208911
> 
> Max (kernel@maximilian-stieg.de) changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |kernel@maximilian-stieg.de
> 
> --- Comment #19 from Max (kernel@maximilian-stieg.de) ---
> Will this fix only came in 5.8 or also in 4.19 (LTS), which is used by Debian
> 10?

Does it affect you on the latest 4.19.y kernel release?
