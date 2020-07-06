Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80599215BE1
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 18:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgGFQfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 12:35:00 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40749 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729293AbgGFQe7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 12:34:59 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C5DF65C0228;
        Mon,  6 Jul 2020 12:34:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 06 Jul 2020 12:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=W
        U9KezS7Sf2OevfzQ4BIFxIHoo6xKxgUi6+Ebs4rEfY=; b=QdwDtp0posZP7Q2hD
        uJcCR3qy8UdNFfnm6xps8tJ9DkFYT6FrAMw8FW3FSivXfOqGWpDY8/1LsrYgfqej
        9QM3xdhjnodaJvgd8Y5HLHhmd60gpu0fVeLEOW7xPkUEoeTDO6HVjGdY+VnRvrwE
        MUL+0JRIlNRu7yxZgZFDUivQJxab4X47dZFZ8eHlzFrNTfpLLrJzX9JBDRTnYZnO
        4XUGm7pHkXO82fJssuEtJVJU8c++rAKwmJUbvl8pjEnIAau6q+n+gRAhR/UoyGrt
        dEdgq3VaStQ6qzCwEUO8ummEvBz7cgbIumK62DthdCx6BVKjcBvSx3rVvkSPr1KM
        acpOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=WU9KezS7Sf2OevfzQ4BIFxIHoo6xKxgUi6+Ebs4rE
        fY=; b=ZhS67ro2e1ZgyDfnPPiol/jMuHKotcBl2FONOjUecoKUWbMIYR23o05lt
        k8UDluB0Uw5WthIktUUtiopUIT6YW0fhUD4Pr3t6kPCttnKnWvxQZFAsebfBq/sI
        jttJqESqmYqUsaFKrP6bHY567Z5Kn4XFfA4aVLBFQ3pIkOxfRSW4ULv0Esh5VSB6
        NhtILvtdGyhguyIFXI1gOTp/oA5lTvz4dKpUpnlC4xpB8ZYtx3S9YwpSJ47wvk2p
        WkGUHWlLCJ8nnpmLbhlPnaOr1HLcCoVuhjD5jD2LW7TcxkessuuQ4pUd7nxX5hBY
        B8uyQZCDOpK71gqcSyL3G95gAnfoA==
X-ME-Sender: <xms:slIDX_NC_83IM4JSRAy-hyG96lsBIYuU-TYqqmMssxOQPP5L-WK8Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggugfgjsehtke
    ertddttddunecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeevtdeileeuteeggefgueefhfevgfdttefgtefgtddvge
    ejheeiuddvtdekffehffenucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:slIDX5_vz8Vh6ATCMNwDiM-17sQtY1N2V7pMP3I4NoR3YekuGc1QCQ>
    <xmx:slIDX-Q4xsr85-DOmWE57-UVz88LjQpBXnGO8_uSsxjtvljXopKFoA>
    <xmx:slIDXzt9ltyoaTOmND9CUfM2GJCvz2BBOOaiOWoZKWiudda9lKWn3Q>
    <xmx:slIDXxr56z52ALqWr313qJy47SwqkyDOQl-4j472_FqmzqAgNjSubQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id F3BE53280063;
        Mon,  6 Jul 2020 12:34:57 -0400 (EDT)
Date:   Mon, 6 Jul 2020 18:34:58 +0200
From:   Greg KH <greg@kroah.com>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Remove documentation line that adds nothing and
 sounds condescending.
Message-ID: <20200706163458.GA2306919@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706131014.19064-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706131014.19064-1-flameeyes@flameeyes.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 02:10:13PM +0100, Diego Elio Pettenò wrote:
> Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>

I can't take patches with no changelog text in them at all, sorry.

