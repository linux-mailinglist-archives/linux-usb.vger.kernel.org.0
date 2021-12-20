Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC3147A606
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhLTI2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:28:31 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46086 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbhLTI2a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 03:28:30 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EB5660C3E
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 08:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD8AC36AE5;
        Mon, 20 Dec 2021 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639988909;
        bh=vQqw7VdK3nB8t1j6mCgKB6IeVOU/LmwrkAyv/cDTJdc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qi3NeAeVxs+n4TZPEFwkshBJj0zUHblRBSo/8DRvXi8whLqTji94clcE+uUJVlq/e
         v7MZB99cYAr2kM6afRYImThryH2UCMbcFGtLJthBev9AXiRuYgTSpf0VQt1dBxEOcM
         BhxVdX31MU+7pRyJBaLWdQV/RXagBIZYUE2Ex3jc=
Date:   Mon, 20 Dec 2021 09:28:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Filip =?utf-8?Q?=C5=BDaludek?= <filip.zaludek@oracle.com>
Cc:     linux-usb@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>
Subject: Re: data throttling under load when serial to usb adapter is used
Message-ID: <YcA+qegbpj0heal4@kroah.com>
References: <738e20c6-c709-d149-fe48-ee89540fe38a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <738e20c6-c709-d149-fe48-ee89540fe38a@oracle.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 09:11:06AM +0100, Filip Žaludek wrote:
> 
> 
> 
> Hi,
>  under load I am experiencing data throttling when serial to usb adapter is used,
> but only in direction from wires to usb. Opposite direction seems to be robust.
>  To reproduce plug both ends of usb to serial adapter into same hardware and run
> attached script. You should see data flowing in both directions, then saturate cpu
> `stress --cpu #cpus_plus_two`.
>  Data will be corrupted only in serial to usb direction, usually from beginning,
> often within first urb. Not seems to be due to flow control.
>  Even though chopped bytes are received, rx/tx counters are correctly incremented.
> Script implements data sending in two ways, first utilizing socat and second standard
> cat command. It is adjusted for RPi4 with miniUART ttyS0, for multiport hardware
> and/or ttyAMA0 you will need to tailor accordingly.
> 
> Rough failure rates observed (former trials with ~32k dmesg):
> ttyAMA0: 'cat' 20% vs. 'socat'  2%
> ttyS0  : 'cat' 90% vs. 'socat' 40%
> 
> Why to plug both adapter ends into same hardware?
> - I believe this is sub-issue of two connected devices, but it is hard to reproduce
> - serial port programming
> 
> 
> 
> 
> Regards,
> Filip Zaludek
> 
> 
> 
> 
> Tested chipsets:
> 
> ftdi_sio [TTL], Bus 004 Device 003: ID 0403:6001 Future Technology Devices International, Ltd FT232 Serial (UART) IC
> pl2303 [TTL], Bus 001 Device 005: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port / Mobile Action MA-8910P
> ch341-uart [RS232], Bus 001 Device 006: ID 1a86:7523 QinHeng Electronics CH340 serial converter

Using 'cat' is not a good way to ever use a serial port.  Please use a
tool that can properly detect and use the serial port flow control
settings, which should prevent the issues you are seeing here.

Is socat using flow control?  If so, which settings, hardware or
software flow control?

Also please note that the usb-serial devices you are using here are
_very_ cheap and not good for huge amounts of data like you seem to want
to use here.  I would recommend a much more robust usb-serial device if
you need high data rates and good hardware flow control handling.  Most
of the time, the devices you have here do not even have any hardware
flow control support as the manufacturers do not hook up those lines.
So be careful.

thanks,

greg k-h
