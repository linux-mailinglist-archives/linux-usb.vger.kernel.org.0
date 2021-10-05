Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D74223F7
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 12:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbhJEK5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 06:57:02 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47627 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233449AbhJEK5B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 06:57:01 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C0F945C00FB;
        Tue,  5 Oct 2021 06:55:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 05 Oct 2021 06:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=+DMH6zcl7YqIsle+0lDEjFYR/aM
        r68/alj5rDVmPtQE=; b=LBxFdI8/NEGc9HtLdgQlhQrnXd6VP3GDpNnp9uiJ0jT
        b/RE3T1X9Co+1Uu6nErwWWYmyhxCCDIJruldQVzha5kkv2WZWOqxuezuB1Q0eozV
        0C35p3kxjY1SS67LWObD8tjC1gg1oWSV0reKSdoBYqcSwIuQWG8mG1xEyN+xid1x
        T+dx6W+W4tdlBhnGdiEuHNOZKgYA9DplYMDooYN/bhv+FZzWaLSPNoW4EhN9MEdA
        e1eAtsL89pg6+FaS7wJSqv1xTMZEvMFrzJyXoERofa6T3lb4zW+reHSM3qqkmyil
        QzgS4UtRLZr0W6YcwjwMpC07b7jReZowYh+NyQGVFAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+DMH6z
        cl7YqIsle+0lDEjFYR/aMr68/alj5rDVmPtQE=; b=PQQJf6totbOpbeg5qXVas2
        FS5QBj0axkhr8pfcEGzBwyCuhS5vY15gV+zzggpHfRtLTiqbsnJDkk0XtHVfbEEF
        AfqJ3pJyLkdxCeNK4TY3GlXr6KHf1LQOL+c4CaWyYvhhyPrLyigCUPXIgXbDqQMZ
        8b5YiXvJ/izaFpsJP2q3Jx2zfINvU1HKna5YVxCkaIQdVBCIRkj98dNL2U5gg1k7
        RHfojzRb8wWGueEuNdW8x7AfJohnKlRS1HBtqQuehxNf05+wo7yiTDUAdc+th8qE
        o07TQs3nx7PWU3Pupk8s48dQxapDTSIJxuOg02Qm04LUqVV5dJdg9ES9J8MLbFJQ
        ==
X-ME-Sender: <xms:DS9cYegV79nRr-CTyNRHv-2Hen8DRVZPFkbnsnqr5sPdF0Jcodq61g>
    <xme:DS9cYfDfUEIlFDY2mQlRADPn0_vpXCyuUYj87PAvC_YlgUqoRMKRwRK_w1ypoNBPz
    ADf4jngQ8_oAw>
X-ME-Received: <xmr:DS9cYWFRQW60l7xnLFPOmPTdYYxj0BvJBdmN1UZSGx5UGaeKnp4gZxoGLKphRD5871Ff45xj6yb1WImzsoyUALCTo8vQD0Oo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelgedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:DS9cYXQ4PAnOxNgQqpS_GMyibiPXJFEiGv4bEt0NT_3r0IchhMvnKg>
    <xmx:DS9cYbwFkOgSWgC3RUjH_i8bE256r6DVfZYW5dbVJv5zLB65DjORYQ>
    <xmx:DS9cYV71rzzwLFi-waS7GnP9598jJ8PyX8gkVaHXjHa_mV9eVy9dxw>
    <xmx:DS9cYSnFbcyD5rdIl_PerhBC9rYWb050hzJkLopnsq3IuHwrbqnLsA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Oct 2021 06:55:09 -0400 (EDT)
Date:   Tue, 5 Oct 2021 12:55:06 +0200
From:   Greg KH <greg@kroah.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        git-dev@xilinx.com
Subject: Re: [PATCH v4 1/2] dt-binding: usb: xilinx: Add clocking node
Message-ID: <YVwvClRFIfIREX2n@kroah.com>
References: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
 <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 28, 2021 at 10:57:10AM +0530, Shubhrajyoti Datta wrote:
> Add a clocking node for xilinx udc.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v3:
> update clock description and names
> 
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 6 ++++++

This file is not in my tree, where does it come from?

thanks,

greg k-h
