Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A692F451
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 12:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfD3Khm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 06:37:42 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44343 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726262AbfD3Khm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 06:37:42 -0400
X-Greylist: delayed 334 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Apr 2019 06:37:42 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 9FEF473F;
        Tue, 30 Apr 2019 06:32:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 30 Apr 2019 06:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QymceY
        o1m9ZhJTIT2V9SfUoPvmceC3x/CSg2lUBgMz8=; b=nZPP8ULB9uODS1bXzkNYs9
        iBvHIcB6qeacqGYrfO/OoCMPjfmWnAl46hpJ22qdksCYi21mx+yPvryYzNnQQ89q
        uTuTldJPr/lyjAyquZFUe21UH83cvGUOlAsybOKfaG0gAcT2/cTBUClJYG47qZtd
        2gm47aGnBtVQFcaYQRToBprm7K28nTkreIkZUHGW9RgdWz7u2CJwucIsOi403aRX
        wJkF20Denk2dKu0g25tDqA82rqrjcCHmKB6Pq7FqmYAuNZrhMUmlVOfenCMrLY8u
        x7AJzk13QX/QMysllSJvg9abYGPkDptsLlm6Wj7bjOBOTnBGVC4MHhRT2Bl9LwaA
        ==
X-ME-Sender: <xms:JCTIXIkwG5PWy1X-b5BEEfTo2TfVhlVUvTN18K2dvQK_YvYSisJiYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeggdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgmffjsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgqeenucfkph
    epkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvghes
    khhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:JCTIXInJ7d2Aq-rLqLzLrmiqh4pn6M96m4e1C9LX2cF__9cswopuhQ>
    <xmx:JCTIXPgUYecgGxQ41dZubrop5maKiYR7Fjx4HR9iaauz8x8xsOBXlg>
    <xmx:JCTIXMdTa2eExlq0UdUupnYb3LOquMWPWhDhHZytFrlI-Jct_NqcDg>
    <xmx:JSTIXDGIfy55TS2dbFbrHkL1dIvmo4D0mWPuvwg68rqJTyKEWSsRQg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6F55F103CC;
        Tue, 30 Apr 2019 06:32:04 -0400 (EDT)
Date:   Tue, 30 Apr 2019 12:32:02 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCHv2] UAS: fix alignment of scatter/gather segments
Message-ID: <20190430103202.GA24575@kroah.com>
References: <20190430102145.7423-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430102145.7423-1-oneukum@suse.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 30, 2019 at 12:21:45PM +0200, Oliver Neukum wrote:
> This is the UAS version of
> 
> 747668dbc061b3e62bc1982767a3a1f9815fcf0e
> usb-storage: Set virt_boundary_mask to avoid SG overflows
> 
> We are not as likely to be vulnerable as storage, as it is unlikelier
> that UAS is run over a controller without native support for SG,
> but the issue exists.
> The issue has been existing since the inception of the driver.
> 
> Fixes: 115bb1ffa54ac ("USB: Add UAS driver")

Shouldn't this be:
Fixes: 115bb1ffa54c ("USB: Add UAS driver")

The sha1 you put here isn't valid :(
