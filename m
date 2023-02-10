Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8636692394
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 17:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbjBJQp0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 11:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbjBJQpZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 11:45:25 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750706A730;
        Fri, 10 Feb 2023 08:45:22 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id DD5DE5C024C;
        Fri, 10 Feb 2023 11:45:21 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 10 Feb 2023 11:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676047521; x=1676133921; bh=sKazkHroa4
        DBwqlZXXKpLH6uGRtHXhLpZc/CphCd9H0=; b=HVW2W3SatwbyrQ9JXNxXe9Yoy3
        KSizOj3WI4UsBseFAbaQqaD3Ca8Q/6rlX1FUaXSEWoXidk+KM6vT/dtCZQ+iekQF
        PjeS/ltELiPAHbH2pnXMAkjqQp8SSXnJh1mNILt7Lf9mfm1JiAjGUH9eV7ON8fXW
        vvJGldvXfBzY8jY/8JM5jW9MlY1+MRO95mAPvdm2FNhq6wfuwXXW7CJRrzmo/QQH
        deauloaN3I/P4wu1uNeVFaLVuSsH6nwGjbist0tUgL9YawxQy/aOe6dheQ00CLMS
        bzfm4I7V6ep/Klz/DGKpS64sST0n8RhJGui49eqU1OYjfyTMBuZHLRD/0RAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676047521; x=1676133921; bh=sKazkHroa4DBwqlZXXKpLH6uGRtH
        XhLpZc/CphCd9H0=; b=Ar0KwhEk7RNFWIJvMaHjIFOmMtV9V10pgaUGcxyuAzYM
        edrXPQ/fSEzEKNZm52hycokA+UZ3ILwS+CBk80LNTNeSDW2Ftm5mLog2oWWrdW3i
        UBPFpLEibvYDn7yDpL5wVef6Ltp3N7bwwJRjyv3CAwY5YvTo2GlxQqfE1TuhQT3X
        x3W40qcSfiBcSBuvQnQpZu+0B0atYUHVNzPGfBgUJaKURE0ZxzXrriSAw7Dtr98y
        w1uJQWyUlIKbctXEgxWCEezxjJBr/EnqlFAtt9BJY81VX8atNe1pgFFYC/r3cvi3
        wI7Lc9j1EI2clqlC1ONJnU60XWuJS0ZR+9TDq50S6w==
X-ME-Sender: <xms:oXTmYxSMcMrWk23gle0JuXKZMRgpfQm0OUh5dDN7GWIy8VC73_Q0ug>
    <xme:oXTmY6y4KxLwCIohROXprIgm5YQrvP1ZZ8VnC9UUfVZ6QNpnIvu2xS1VwcUjBLAE2
    6fXbc0n3J-JJfkao3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehhedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:oXTmY22BeGKtAESepSkqBFm7Iutv7h5MDt9aoTkIBsWiifxQFq-rMw>
    <xmx:oXTmY5B19kwAGjHThQgZnJxa0HUBeLaEOHtjE0t3eDpcOel8eARLyg>
    <xmx:oXTmY6gyk6_9O2RYIKBK4xB8i6oJrmnBuNTB8r8otEAQu4wfP0oDYg>
    <xmx:oXTmY9vsgnUDz8_mYZubUXsWfWmpVz28mQ9vY3evaIQNLCRR5bUpQQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9FD2FB60086; Fri, 10 Feb 2023 11:45:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <91e2e047-adaf-4bf5-8244-8aca304b1b78@app.fastmail.com>
In-Reply-To: <Y+T4kTcJwRwxNHJq@kili>
References: <Y+T4kTcJwRwxNHJq@kili>
Date:   Fri, 10 Feb 2023 17:45:03 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Dan Carpenter" <error27@gmail.com>
Cc:     "Mathias Nyman" <mathias.nyman@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xhci: host: potential NULL dereference in
 xhci_generic_plat_probe()
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 9, 2023, at 14:43, Dan Carpenter wrote:
> It's possible to exit the loop with "sysdev" set to NULL.  In that
> case we should use "&pdev->dev".
>
> Fixes: ec5499d338ec ("xhci: split out rcar/rz support from xhci-plat.c")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks for the fix!

I think this doesn't happen in practice because the loop should
always find a firmware or PCI owned device, but it is clearly better
to keep the original behavior from before my patch to be on the
safe side here.

Acked-by: Arnd Bergmann <arnd@arndb.de>


>  drivers/usb/host/xhci-plat.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index cd17ccab6e00..b9f9625467d6 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -368,6 +368,9 @@ static int xhci_generic_plat_probe(struct 
> platform_device *pdev)
>  #endif
>  	}
> 
> +	if (!sysdev)
> +		sysdev = &pdev->dev;
> +
>  	if (WARN_ON(!sysdev->dma_mask)) {
>  		/* Platform did not initialize dma_mask */
>  		ret = dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));

