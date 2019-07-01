Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3AB12816
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 08:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfECGyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 02:54:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35491 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfECGyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 02:54:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id j20so3671995lfh.2;
        Thu, 02 May 2019 23:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PNXQmunQu5QZmN64MuQdng2Hjr43+4G/NRvlRZwoeQI=;
        b=l+eoVW0mngw8oQfdjAoNMHfKXdUatmir2/ZJ57nbuk94xthj9q8u3Y7uV8bZd93g37
         kmK6Tnwjlo1YY3u6XPdYTE8PCf+4UkHxSrIZPcEoEXKAt+rMv+T10LxtS6GmvaoSyP0F
         D0GFvNd5cn5EoBd0NTWUq6tM1SErBfBlxJFO/FkHcOfCBnCSy+UDrai4O4u3BqvOXaK4
         cBQkDtAznNiKGIqQOXcmj5h16btLdO1UfAFmIHwavai2MYdmxXmBD8x4Ei5KJwN6DJw0
         c6t8e4u1NBiRtb1+JZ9+YTOr4zmE+pa6lgyKp6KUp+gCFlLTPtCeXRSYzL6BtF2qqFpT
         PPZA==
X-Gm-Message-State: APjAAAXtQHhMYBvvJKgXv6F3uxcxHipYGkrKVWJegKsqe25ylTiuKC5Z
        rSW/a72+A7KOO5UnJxjRM0+VacpY
X-Google-Smtp-Source: APXvYqyCXcEZM9T7gI0iTiAPjhAohJGknGlYMP644Si1wPo4GWCfTnpIO3p4sHZzU/syRPan7AzkqA==
X-Received: by 2002:a19:c216:: with SMTP id l22mr4026992lfc.112.1556866423356;
        Thu, 02 May 2019 23:53:43 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id g13sm202306lfh.49.2019.05.02.23.53.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 23:53:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMS4v-0004Xf-U7; Fri, 03 May 2019 08:53:53 +0200
Date:   Fri, 3 May 2019 08:53:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
Cc:     peter_hong@fintek.com.tw, johan@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: Re: [PATCH V9 1/4] USB: serial: f81232: fix interrupt worker not stop
Message-ID: <20190503065353.GZ26546@localhost>
References: <1556587352-19500-1-git-send-email-hpeter+linux_kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556587352-19500-1-git-send-email-hpeter+linux_kernel@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 30, 2019 at 09:22:29AM +0800, Ji-Ze Hong (Peter Hong) wrote:
> The F81232 will use interrupt worker to handle MSR change.
> This patch will fix the issue that interrupt work should stop
> in close() and suspend().
>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>

> +static int f81232_resume(struct usb_serial *serial)
> +{
> +	struct usb_serial_port *port = serial->port[0];
> +	int result;
> +
> +	if (tty_port_initialized(&port->port)) {
> +		result = usb_submit_urb(port->interrupt_in_urb, GFP_NOIO);
> +		if (result) {
> +			dev_err(&port->dev, "submit interrupt urb failed: %d",
> +					result);

I added the missing '\n' to the error message.

> +			return result;
> +		}
> +	}
> +
> +	return usb_serial_generic_resume(serial);
> +}

This also fixes the issue with interrupt events not being received
after a suspend cycle, so I added that to the commit message.

Johan
