Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD2F16BF63
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 12:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbgBYLNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 06:13:39 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33922 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgBYLNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 06:13:39 -0500
Received: by mail-lj1-f193.google.com with SMTP id x7so13584382ljc.1;
        Tue, 25 Feb 2020 03:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6veU3zcurqB+x87LSW0HY63Q2hg6fVyMJOo0byrm8sg=;
        b=ZmZFtszWqzFPoZiFWlaULNwsTdJXaqUwvRMSH/on5mfPkUvO7KPKBei7E4r0HVNigJ
         UpKdwsXkez9Shs48ruAvHD2AnfD2Yy1tatPLPXfkUSsvCdEFpSEuaVeLsvbXqsSDuUgz
         3i0THu5/kby4ByJD8xhxv0wQtZandVhyGSv1M+vAgpG24ZtQwU1nbiaAeySZ+BkHLevV
         77/MIKngPipiFuNBYwBXkFKWjmJVrZ5xGt5mu5be4mK4OvZIxox6cCIY3I/GtDtasG2f
         QEKmbRmwqCYkoYKh5d8Ky2DeW+kBjizmxRvqFgqIaeKKR187h4wCzRuB/ry8XAtRLHFz
         +15Q==
X-Gm-Message-State: APjAAAW7lLF0FTjuIHJzC7rr2zAvtbNs6/E4OQHNaggwloaNwCuMby+X
        xSvF1hPupyhFh35GE5NTxGQ=
X-Google-Smtp-Source: APXvYqzLFHczADJ4b8XpCz0/I5LO2U0TGFDGPa9dMaKX1VWKuFNfuIKyPJzUpsGCxmDfd7mxe07tnA==
X-Received: by 2002:a2e:3e10:: with SMTP id l16mr32689721lja.286.1582629217302;
        Tue, 25 Feb 2020 03:13:37 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id q17sm7584872ljg.23.2020.02.25.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 03:13:36 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j6Y9c-0004aG-Lw; Tue, 25 Feb 2020 12:13:32 +0100
Date:   Tue, 25 Feb 2020 12:13:32 +0100
From:   Johan Hovold <johan@kernel.org>
To:     "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter_hong@fintek.com.tw,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: Re: [PATCH V3 4/6] USB: serial: f81232: Add F81534A support
Message-ID: <20200225111332.GS32540@localhost>
References: <20200130054752.9368-1-hpeter+linux_kernel@gmail.com>
 <20200130054752.9368-5-hpeter+linux_kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130054752.9368-5-hpeter+linux_kernel@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 30, 2020 at 01:47:50PM +0800, Ji-Ze Hong (Peter Hong) wrote:
> The Fintek F81532A/534A/535/536 is USB-to-2/4/8/12 serial ports device
> and the serial port is default disabled when plugin computer.
> 
> The IC is contains devices as following:
> 	1. HUB (all devices is connected with this hub)
> 	2. GPIO/Control device. (enable serial port and control GPIOs)
> 	3. serial port 1 to x (2/4/8/12)
> 
> It's most same with F81232, the UART device is difference as follow:
> 	1. TX/RX bulk size is 128/512bytes
> 	2. RX bulk layout change:
> 		F81232: [LSR(1Byte)+DATA(1Byte)][LSR(1Byte)+DATA(1Byte)]...
> 		F81534A:[LEN][Data.....][LSR]
> 
> Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
 
> +static void f81534a_process_read_urb(struct urb *urb)
> +{
> +	struct usb_serial_port *port = urb->context;
> +	unsigned char *data = urb->transfer_buffer;
> +	char tty_flag;
> +	unsigned int i;
> +	u8 lsr;
> +	u8 len;
> +
> +	if (urb->actual_length < 3) {
> +		dev_err(&port->dev, "short message received: %d\n",
> +				urb->actual_length);
> +		return;
> +	}
> +
> +	len = data[0];
> +	if (len != urb->actual_length) {
> +		dev_err(&port->dev, "unexpected length: %d %d\n", len,
> +				urb->actual_length);
> +		return;

I rephrased this as

		dev_err(&port->dev, "malformed message received: %d (%d)\n",
				urb->actual_length, len);

before applying.

Johan
