Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043181B4FC3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 00:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgDVWC4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 18:02:56 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:50771 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725924AbgDVWCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 18:02:55 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 05C1D55C
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 18:02:54 -0400 (EDT)
Received: from imap22 ([10.202.2.72])
  by compute7.internal (MEProxy); Wed, 22 Apr 2020 18:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=YZFRJRb7Ik0rxkFTXMDarz8IxBMI9YIz33iu2uoi2E8=; b=T/x9fUOn
        7MOm85HdsrHOVXixDNAhYcjeSA4ATYGRCUZydmDGRAJk1rvLM8cQaIH1BrWvROzb
        qqRjODgUa3eK0ILsfWViiZljKIFM71dSzQzI/xSc5LN6vs9NoIU1oUqyNwRhg8Y9
        Fg29ZjqB88hzXwuSZMLQkfdDESrEnbTKAcBMd1Z/JHBLHe+HT1xFYxPn17Ag+ZeB
        MEU5RH+FEuEq6KuTUrGpALFw+ab/HbnGHUnqSXdrnHPTcYjuPXiXL0ARsx750+0U
        jPQ9kFM85d5cDFlO/1VS4sBsQNnjvHFodd1tOX/HAAyJB7Ss6zm/Ygju3DFXG8JC
        EP8vItT2fFqE5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=YZFRJRb7Ik0rxkFTXMDarz8IxBMI9
        YIz33iu2uoi2E8=; b=puTeNNDKYTib86DqFMV0od67spd4GesXnY/pNIfqSXy1g
        myvFYMtLrc0I32cd1JamV7BO3k7cH0AeyKjDeksoDcKaaxbmVwh+kSNofXP1NyWK
        yNDHEptjeOafxCnLs1Oy4PK7zqheRJ2gzRXSmxjAknjpFhGExb5BT8GJlkChXb4J
        9KMVeSC4PQGIplwsT+2WMtBPBdrB7YbXOV2Rha+525EYBps8viidXev7DZG+cFEy
        3/TuazSJZvN9NygyUA9bZfsl421ZSxVj8fvt1j+NIgLPHn5+W7xNKq0Ax5qp0ek0
        oUTaj/XLwYzf8MipCcE2FQLhWCNANVqgCWG0QaJbg==
X-ME-Sender: <xms:Dr-gXt9jrZsRvK1Pwb3AJW_rADmlCK9H83SsXkSC7GfUIkcUXKULFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeekgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecu
    ffhomhgrihhnpehlihhnuhigfhhouhhnugdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:Dr-gXvjtQV3lSZP8ASQZVfv7wIwPTjuYyThglp85dlVLTR1FucrxHA>
    <xmx:Dr-gXldYwA7QLjAd0qFWk-Hfcx5wGIZSxCr-blyq26hGCD4ze6YCug>
    <xmx:Dr-gXuoUDkh6m3hCTN-APSslYqlyX3OMVxnE33-W6fNGSMi2DfgkaQ>
    <xmx:Dr-gXsbcol-7JLUmhHOZJ3p-LRbyDaDG45pj-acgJTOaRx2U83xCoQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2A4306680078; Wed, 22 Apr 2020 18:02:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <df1fe132-79ac-4656-9ddf-040e26f11c28@www.fastmail.com>
Date:   Wed, 22 Apr 2020 17:02:30 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Failure to Assign UDC to ConfigFS Gadget
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, I'm just following these slides: https://events.static.linuxfound.org/sites/events/files/slides/USB%20Gadget%20Configfs%20API_0.pdf

On page 18 I need to assign the UDC. On my version of Debian (repackaged by Armbian, with my own kernel and modules) there is no device in /sys/class/udc as expected, but there is a link that resolves to a device:

# stat /sys/class/udc/musb-hdrc.1.auto
  File: /sys/class/udc/musb-hdrc.1.auto -> ../../devices/platform/soc/1c19000.usb/musb-hdrc.1.auto/udc/musb-hdrc.1.auto

If I try to assign the UDC using the string 1c19000.usb I get:

# echo "1c19000.usb" > UDC                                       
bash: echo: write error: No such device

It's at this point I'm lost. I appreciate any help.

Cheers!
