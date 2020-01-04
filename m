Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F26C130237
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2020 12:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgADLqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jan 2020 06:46:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:38268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgADLqG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Jan 2020 06:46:06 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EF09215A4;
        Sat,  4 Jan 2020 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578138365;
        bh=BIfs1NixzYretDBMD+eLD0lOwz5l1r8LwnPk2qddhaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSo0ppJF1kT3u0Rw9MZLTSYurBo81qyT++5jI8nw7Poi9LvhHpgvbcY/oRV+ka6n4
         034dzlZU0/ow4g85zwAa6BVOGB+fkqxCaN3RVY4kRmP0prsNKO1TekeFRDt27ihEeo
         +dv7y9u6dezO0LUybYGdVrDhtuv3GcwNaUYTH9qY=
Date:   Sat, 4 Jan 2020 12:46:03 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     atmgnd <atmgnd@protonmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: missing parentheses in USE_NEW_SCHEME
Message-ID: <20200104114603.GB1288021@kroah.com>
References: <ht4mtag8ZP-HKEhD0KkJhcFnVlOFV8N8eNjJVRD9pDkkLUNhmEo8_cL_sl7xy9mdajdH-T8J3TFQsjvoYQT61NFjQXy469Ed_BbBw_x4S1E=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ht4mtag8ZP-HKEhD0KkJhcFnVlOFV8N8eNjJVRD9pDkkLUNhmEo8_cL_sl7xy9mdajdH-T8J3TFQsjvoYQT61NFjQXy469Ed_BbBw_x4S1E=@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 04, 2020 at 11:02:01AM +0000, atmgnd wrote:
> accroding to bd0e6c9#diff-28615d62e1250eadc353d804f49bc6d6, will try old enumeration
> scheme first for high speed devices. for example, when a high speed device pluged in,
> line 2720 should expand to 0 at the first time. USE_NEW_SCHEME(0, 0 || 0 || 1) === 0.
> but it wrongly expand to 1(alway expand to 1 for high speed device), and change
> USE_NEW_SCHEME to USE_NEW_SCHEME((i) % 2 == (int)(scheme)) may be better ?
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Qi Zhou <atmgnd@outlook.com>
> ---
>  drivers/usb/core/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index f229ad6952c0..7d17deca7021 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2692,7 +2692,7 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>  #define SET_ADDRESS_TRIES	2
>  #define GET_DESCRIPTOR_TRIES	2
>  #define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
> -#define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)scheme)
> +#define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
> 
>  #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
>  #define HUB_SHORT_RESET_TIME	10
> --
> 2.17.1
> 
>

Much better, but your From: name does not match your signed-off-by name :(

