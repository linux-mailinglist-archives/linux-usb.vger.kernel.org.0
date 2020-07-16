Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC59222721
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 17:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgGPPiD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 11:38:03 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54621 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728682AbgGPPiD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 11:38:03 -0400
Received: (qmail 1113895 invoked by uid 1000); 16 Jul 2020 11:38:01 -0400
Date:   Thu, 16 Jul 2020 11:38:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2 v2] usb: ohci-omap: Create private state container
Message-ID: <20200716153801.GC1112537@rowland.harvard.edu>
References: <20200716123433.155854-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123433.155854-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 02:34:32PM +0200, Linus Walleij wrote:
> The OMAP1 was using static locals to hold the clock handles
> which is uncommon and does not scale. Create a private data
> struct and use that to hold the clocks.
> 
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix up the error path to free the HCD *after* putting the
>   stuff inside the state container.
> - Also fix up the remove() path similarly.
> - Use some reasonable names on errorpath labels we are touching or
>   adding.
> - Fix a tab alignment.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
