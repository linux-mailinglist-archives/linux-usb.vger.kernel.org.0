Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B135A23F807
	for <lists+linux-usb@lfdr.de>; Sat,  8 Aug 2020 17:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgHHPRb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Aug 2020 11:17:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51651 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726233AbgHHPQt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Aug 2020 11:16:49 -0400
Received: (qmail 257323 invoked by uid 1000); 8 Aug 2020 11:16:48 -0400
Date:   Sat, 8 Aug 2020 11:16:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yasushi Asano <yazzep@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com,
        jim_baxter@mentor.com, wnatsume@jp.adit-jv.com,
        nnishiguchi@jp.adit-jv.com, yasano@jp.adit-jv.com
Subject: Re: [PATCH] [RFC] USB: hub.c: decrease the number of attempts of
 enumeration scheme
Message-ID: <20200808151648.GC256751@rowland.harvard.edu>
References: <CAEt1RjrQsb6=reKUKV9uJTG4JoJXErhJFj=2TdVx=N1_Ad1GVg@mail.gmail.com>
 <20200808064014.3199-1-yazzep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200808064014.3199-1-yazzep@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 08, 2020 at 03:40:14PM +0900, Yasushi Asano wrote:
> From: Yasushi Asano <yasano@jp.adit-jv.com>
> 
> According to 6.7.22 A-UUT “Device No Response” for connection timeout
> of USB OTG and EH automated compliance plan v1.2, the enumeration
> failure has to be detected within 30 seconds. However, the old and new
> enumeration schemes made a total of 16 attempts, and each attempt can
> take 5 seconds to timeout, so it failed with PET test. Modify it to
> reduce the number of attempts to 5 and pass PET test.

This description should explain that there will be 3 attempts using the 
new scheme and 2 attempts using the old scheme (is that right?), at 
most.

> 
> Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 052d5ac..ebf6931 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2707,9 +2707,9 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>  
>  #define PORT_RESET_TRIES	5
>  #define SET_ADDRESS_TRIES	2
> -#define GET_DESCRIPTOR_TRIES	2
> -#define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
> -#define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
> +#define GET_DESCRIPTOR_TRIES	1

Instead of changing the number of loop iterations to 1, you should get 
rid of the loop entirely.

> +#define SET_CONFIG_TRIES	(use_both_schemes + 1)
> +#define USE_NEW_SCHEME(i, scheme)	((i) == (int)(scheme))
>  
>  #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
>  #define HUB_SHORT_RESET_TIME	10
> -- 
> 2.7.4

Alan Stern
