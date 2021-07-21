Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E073D0A3C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 10:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhGUHVC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:21:02 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37255 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234859AbhGUHUz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 03:20:55 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9EEFC5816BD;
        Wed, 21 Jul 2021 04:01:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 21 Jul 2021 04:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=t/iRrQczCNXUrTQ/j8FZjeqa8BE
        VK33aJLsccDr4NTM=; b=cxMnA1EIqfXTHhv+5C4H4uAia2YRug82j/R2D/QeC5H
        9iUK8LMixRPvMy3puG3fmJmNHa4SfvnU5kN05hrIgs6FDeDmsnsIIKmW9WAPx6kS
        QbJDN3ggQ3TZpqbENzIZgkLY/09k5U5t8bwfSYrLTmpkGSwwfhEsAQHQeIx7sMx+
        pYLaOHFCndJCgTnQ4BbiCiwjGHwSBYiIttClIPabD5ws/z10Gepj+SGp67y39mVM
        +E6+g1UYqjP13cDe06x6z2ZT3F4WXpBQ4IE8alRjFXl1vF/zayEMhEqz4+Z9AQcN
        PI2df7/g258qZo3snhNpVkILipyDZANlnEcXRt4Wl4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=t/iRrQ
        czCNXUrTQ/j8FZjeqa8BEVK33aJLsccDr4NTM=; b=Qb8+YO/GrqzlJI+yalgu7s
        lTBGTPjXrBO8tnUtII/ULj4NDVAPMk+DIhIjDgsjpAcbRDJTUIm+keJX0D9EM9Pr
        ARxu8wP3QffCRab7R5JEs1NlIB4hLBzGRdJWnTs/WU7U/WhNWpkCBcJBIkyNC0Tr
        fX9sO66WUOgZXLu6mc/aRoHsgisu/mQByS5VrB5G/6WBRBmPMH4+86xwIfecUoqy
        Jyo1itoVO3fEEY6kQev4ULLsAVoTsqIdXenpCUR8rvQHpT0QFsZcy/WZ305zT5ae
        01/5VklNMUCnhtp+/XSnsZt05sJv9n64QumQgWpK0rUfeRaoh3IW6IS7kypbVPHA
        ==
X-ME-Sender: <xms:UNT3YBsR5Km809Xz0861r6gsz72nzoG-dZbTg6V3f06CGQV9yboD7g>
    <xme:UNT3YKemU7TX8JkTWcep3k-9eMFPGfp5lOHCDNVMEAEbmUtD1todDDEihOYTrhrtH
    R-YnNBrYDqNug>
X-ME-Received: <xmr:UNT3YExXrFpff64yGN8tKpbScZWL9IUiG37Cf6TMHLvqihN8ZG2bsYbXEQmg9n4X1rY3m0MM6D_9KcTRNntuvQQupJB4QyJS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevhefgje
    eitdfffefhvdegleeigeejgeeiffekieffjeeflefhieegtefhudejueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:UNT3YIPfwhjI9MfCROjJ16nvbr4H6U6Cm1cfMU-IsRQ0pBKlkF2WfA>
    <xmx:UNT3YB-h0ILo4BdMO0am5ydkEABv4c8Mf2mJYaYF6KfpiL11QE1xbA>
    <xmx:UNT3YIUQEQ_UU-5ih19GfatQzkgd50ZgeXrD-qN3fT83J1rsEXNLfQ>
    <xmx:UNT3YEVwIzrqQCi7Adqf7jdNkX4gqBwP7IyHlO5uvrMtBwhQGaW0IQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 04:01:19 -0400 (EDT)
Date:   Wed, 21 Jul 2021 10:01:17 +0200
From:   Greg KH <greg@kroah.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v3 1/5] usb: dwc3: gadget: set gadgets parent to the
 right controller
Message-ID: <YPfUTSOpXCSDnmyW@kroah.com>
References: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
 <20210628155311.16762-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628155311.16762-2-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 28, 2021 at 05:53:07PM +0200, Michael Grzeschik wrote:
> In case of dwc3 it is possible that the sysdev is the parent of the
> controller. To ensure the right dev is set to the gadget's dev parent we
> will hand over sysdev instead of dev, which will always point to the
> controller.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
>    -> v2: first version of patch
>    -> v3: -
> ---
>  drivers/usb/dwc3/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index af6d7f157989d..8a1b1daff2e97 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3990,7 +3990,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>  	}
>  
>  
> -	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
> +	usb_initialize_gadget(dwc->sysdev, dwc->gadget, dwc_gadget_release);

Does this change how the device shows up in sysfs?  Why does the parent
not always work properly here?

thanks,

greg k-h
