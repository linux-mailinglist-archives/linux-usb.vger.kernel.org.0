Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2652BAF14
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 16:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgKTPfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 10:35:30 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55141 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729562AbgKTPf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Nov 2020 10:35:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5C7A55C00C6;
        Fri, 20 Nov 2020 10:35:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 20 Nov 2020 10:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=fbu6GB2S5qczpw6HOQEMUIHe4iW
        yMJQhl+jQGri3P30=; b=p2J5ntvPOaU3xPd7ldlQAwu2bI6WDTuGXSP3qfRTMfL
        qqEu1+S194ZgRPXjS4/usnDfzYclpvvVUj9yKWf+AcF5x1z00w4hoDgjzRgyx94y
        GkKkBoNbVRjLZt3uk7DIBg8Cv5LOJUIzZa9loLeTdFRWKZR3IVlN7i5NOieGrKCz
        aP5cJP2K3plWnoEPZVjwQ+7tpvYa0qWDIK1r1u41aVzXDTRb8JzrI3spjVzuCmgB
        KfyAR5ydyJBGgAJrp/uUUTUJlg9G3wsLoBJ52kuWK9yN89e3cy0jy5Sl5ZklXWh7
        Oy9QWKQtgTJh93nxpUbmV6XUIwThmLqkJsDbMvFcRHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fbu6GB
        2S5qczpw6HOQEMUIHe4iWyMJQhl+jQGri3P30=; b=II4kfMwl6pyTWE8JhNrcc5
        D+J+0ffCDFi1GVF+7D0poeBt1H/Ciz1kXofOKRqOe8PHruK/tY4ROBhpN1m9zKV6
        zgBUMBZfqnd31MzMDgvNimghg5Vci7eG28j8VpWNYbbfTdCKyLSE3dHZCspPKUK2
        8d5dgzFKED0M9k6h0vfSnxuPCiT9OsTKAXTVUOvoDL0mAOKaP/zm/H6AwpHC73m0
        jWWOctJLZTzx3JZMWBr44yXdrJkkxSxf2pweBcD2tSRxJBXDeXPuJGfLTQuOFo4l
        y9OQs2/KNZAr+pIBPNVDZtCEaXsV+KSwUI7fCHI3v1HnvB0o6oECmBXCMtn94Aog
        ==
X-ME-Sender: <xms:P-K3X3NBASbV0Pk4vfXsI-ZMzipTrIbYbmK2ZXBkZiDF9bdkq7eCkQ>
    <xme:P-K3Xx9MUKd5xVSMSOa6RG626CYmhBzEnf8YxZSbXTnBOM5Turc5kucWBSh7XLcmM
    s7Tt457PrnNUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:P-K3X2SbiGeCUmaR4oGIZxR8pAadolzlhA-0dV2H7RGSQm8TMxqq6g>
    <xmx:P-K3X7tt2Q2AfuyqhPp1JO_BPixXR5dGVhE-MFtfHZ_XQMALiC5dBQ>
    <xmx:P-K3X_d-0cyfeEJDQ8xwvfqQlQZqPRATU1huqDJi1dgaT6omFSkN2A>
    <xmx:QOK3X_lA4Or6mp53F8NtMbjd0erxHsLTJxYRGyM46tHKaNlsMMQ_gA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 667823064AB5;
        Fri, 20 Nov 2020 10:35:27 -0500 (EST)
Date:   Fri, 20 Nov 2020 16:36:09 +0100
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Alexander Chalikiopoulos <bugzilla.kernel.org@mrtoasted.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Fix regression in Hercules audio card
Message-ID: <X7fiab4KwSE/0gq1@kroah.com>
References: <20201119170040.GA576844@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119170040.GA576844@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 12:00:40PM -0500, Alan Stern wrote:
> Commit ecaaef6b50a7 ("USB: core: fix check for duplicate endpoints")
> aimed to make the USB stack more reliable by detecting and skipping
> over endpoints that are duplicated between interfaces.  This caused a
> regression for a Hercules audio card (reported as Bugzilla #208357),
> which contains such non-compliant duplications.  Although the
> duplications are harmless, skipping the valid endpoints prevented the
> device from working.
> 
> This patch fixes the regression by adding ENDPOINT_IGNORE quirks for
> the Hercules card, telling the kernel to ignore the invalid duplicate
> endpoints and thereby allowing the valid endpoints to be used as
> intended.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-by: Alexander Chalikiopoulos <bugzilla.kernel.org@mrtoasted.com>
> Fixes: ecaaef6b50a7 ("USB: core: fix check for duplicate endpoints")

Nit, this is:
	 3e4f8e21c4f2 ("USB: core: fix check for duplicate endpoints")
The id you listed here is the 4.9.209 backport id.

thanks,

greg k-h
