Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 427F353BA7E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 16:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbiFBOK5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 10:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235750AbiFBOKz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 10:10:55 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 219772A68B2
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 07:10:52 -0700 (PDT)
Received: (qmail 268108 invoked by uid 1000); 2 Jun 2022 10:10:51 -0400
Date:   Thu, 2 Jun 2022 10:10:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vitaly Bordug <vitb@kernel.crashing.org>,
        Stefan Roese <sr@denx.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: Fix refcount leak in ehci_hcd_ppc_of_probe
Message-ID: <YpjE61Ra0gUMfCW7@rowland.harvard.edu>
References: <20220602110849.58549-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602110849.58549-1-linmq006@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 02, 2022 at 03:08:49PM +0400, Miaoqian Lin wrote:
> of_find_compatible_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 796bcae7361c ("USB: powerpc: Workaround for the PPC440EPX USBH_23 errata [take 3]")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-ppc-of.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
> index 6bbaee74f7e7..28a19693c19f 100644
> --- a/drivers/usb/host/ehci-ppc-of.c
> +++ b/drivers/usb/host/ehci-ppc-of.c
> @@ -148,6 +148,7 @@ static int ehci_hcd_ppc_of_probe(struct platform_device *op)
>  		} else {
>  			ehci->has_amcc_usb23 = 1;
>  		}
> +		of_node_put(np);
>  	}
>  
>  	if (of_get_property(dn, "big-endian", NULL)) {
> -- 
> 2.25.1
> 
