Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44A6D3CEA
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 12:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfJKKAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 06:00:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35596 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfJKKAC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 06:00:02 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so6614033lfl.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2019 03:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0nEahc+RYK2mRoZwgjtN6aYqE96n6+wJX1E1/6sYriw=;
        b=CxlLh+B5r1skmE1gFZf7LoBEMVKbo2JYroDwiiFUyL5Eu/JFjce02m/ClacP9FYm5N
         llFQ1qrLnOL9obbGZ22MsCeQUQ308w3CdMU6CyK2oG0GUnQztRQUoE/3bVwsXWBBGnc8
         f7LV4FKMVF8Z/rQdmahALvMIFuAnMzyAYguhgBFDYh+pyBkENBrVttb3O8t8BINKwEoZ
         OGputF6la6szyX+SzfsdAom1mlUlIhA6e17iqz9mOmOaWx1QnIFnyOwc+g5zlAberXZK
         3EQquNBHZYkTIwc8Sii7nZ+2G7OOCL7cYQdW6Cu8nnnj8ueXZLYOS0oUMumJU0Ua2oZy
         bNuQ==
X-Gm-Message-State: APjAAAUBMiZ8RcFzi5R01Vx2ALEwGoFgIyC/dk3QNjrTwU5zutV01MuE
        O93mCMIHgLtNnG98TIymEsJDOk3u
X-Google-Smtp-Source: APXvYqwbzjn7yL5+jItaZJP3EBrV1OTs7PuBXJcV6ci8j8lH5rmO6+Um017boL3FOkdSJhFoki6FeA==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr8476707lfl.8.1570787999389;
        Fri, 11 Oct 2019 02:59:59 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id j28sm1868178lfh.57.2019.10.11.02.59.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 02:59:58 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iIriT-0005k7-Q7; Fri, 11 Oct 2019 12:00:09 +0200
Date:   Fri, 11 Oct 2019 12:00:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] USB: serial: ti_usb_3410_5052: clean up serial data
 access
Message-ID: <20191011100009.GE27819@localhost>
References: <20191011095736.21934-1-johan@kernel.org>
 <20191011095736.21934-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011095736.21934-2-johan@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 11:57:36AM +0200, Johan Hovold wrote:
> Use the tdev pointer directly instead of going through the port data
> when accessing the serial data in open().

hmm, s/open/close/.

> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/ti_usb_3410_5052.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
> index 9174ba2e06da..ef23acc9b9ce 100644
> --- a/drivers/usb/serial/ti_usb_3410_5052.c
> +++ b/drivers/usb/serial/ti_usb_3410_5052.c
> @@ -800,8 +800,8 @@ static void ti_close(struct usb_serial_port *port)
>  							, __func__, status);
>  
>  	mutex_lock(&tdev->td_open_close_lock);
> -	--tport->tp_tdev->td_open_port_count;
> -	if (tport->tp_tdev->td_open_port_count == 0) {
> +	--tdev->td_open_port_count;
> +	if (tdev->td_open_port_count == 0) {
>  		/* last port is closed, shut down interrupt urb */
>  		usb_kill_urb(port->serial->port[0]->interrupt_in_urb);
>  	}

Johan
