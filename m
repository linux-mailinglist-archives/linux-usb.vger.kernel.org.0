Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F681B4F9
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2019 13:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfEMLcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 07:32:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38580 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbfEMLco (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 07:32:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id j26so6639522pgl.5
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2019 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zaltys-org.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:in-reply-to:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=oW2OGfo2kmTLuf4Kc5CGIE4FQWJunf5Se7PBzqxMT+k=;
        b=QyMS1KkvVFMpgE8NWSvXdmK/oaHre2INuuntPie9HgV+miKlaRnV1PjPxBWhMwbA7Z
         mvnM8/inBQ015PcrGGYELYZXcPIWZoEra7stEA33UbOdFDDqtafe3k0xWiL4xDMZfN14
         oRgt0iFijQzgyJ7ipOWy8U4tPQYbqUhL8ZaEf3dYxSxdlacM2ix2wCyYRU9Hrvo5msIR
         /PSDuzWF6cuZaqs0QEXOXSPx9jqBz/8kW0DKR0vP4TjoL/bOG5vAgTdKCTdDZO8UaZ4+
         y8XSBnFPLCsmt9FbYFpuVEER9KiWJ5AmZdE/vwaD2c3yewD02JewIBif9h1kaLakn6ys
         82XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:in-reply-to:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=oW2OGfo2kmTLuf4Kc5CGIE4FQWJunf5Se7PBzqxMT+k=;
        b=gs70hevapvGw/JbZObvMmCKIFnBLJ+6zy90KhlfBO1XKak3DS/Xwxp3CDt8kQSx+An
         DW8EX+yUx0SiRICPag3burKoMSJDQWyRrvOiO5HfYakof9a5REoK5J1WEo31zSTKbYqE
         ws8cBoxbMewTeL44DnJy4rgO4aeXoYgBbtMsTc49NvjPLgkIxHZ3SuwoTsqfCvxGV061
         dehxs6bwLa5pVjvoPgfGzBfMxnydaC5omnFZXiEvil9EBbs1UUEmdTIRBP9zEcxLZyRm
         J6YP7572vl+p1a06PDHrf8CxwO0Yxx3nvEH56HsAI04gWdU7Ks9aKpkiYEYBCrN6y/p/
         S3tw==
X-Gm-Message-State: APjAAAX8HVjnHg818mUvR1CjhIZI+6LkqK6nfIxXySjrhNpKOseDnCWO
        Avex7nE8dGjhmvq/3TrrcqFRQg==
X-Google-Smtp-Source: APXvYqxmZhyuK0mcNDMhg97F7hXXFjrF+5Xi3FPN/3a4oxJ4C/VPadqCq4QSeE7IoTblppgKCkskFw==
X-Received: by 2002:a63:7989:: with SMTP id u131mr21610419pgc.180.1557747164024;
        Mon, 13 May 2019 04:32:44 -0700 (PDT)
Received: from [172.28.0.10] (122-59-127-127-fibre.sparkbb.co.nz. [122.59.127.127])
        by smtp.googlemail.com with ESMTPSA id r9sm19107632pfc.173.2019.05.13.04.32.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 04:32:43 -0700 (PDT)
From:   James Grant <jamesg@zaltys.org>
Subject: Re: [PATCH 0/5] usb: gadget: udc: lpc32xx: add stotg04 phy support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Felipe Balbi <balbi@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
In-Reply-To: <20190409120908.12079-1-alexandre.belloni@bootlin.com>
Message-ID: <efaaff85-ac39-f0e2-e042-7d6fd0c59054@zaltys.org>
Date:   Mon, 13 May 2019 23:32:38 +1200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-AU
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tested with a board containing LPC3250 SOC and STOTG04 PHY by using 
serial gadget.

Needed patch "[PATCH] usb: gadget: udc: lpc32xx: allocate descriptor 
with GFP_ATOMIC" also.

Tested-by: James Grant <jamesg@zaltys.org>

Regards,
James Grant.

On 09/04/2019 14:09, Alexandre Belloni Wrote:
> Hi,
>
> This series starts to clean up the lpc32xx udc driver and also repairs
> interrupt handling so hotplugging actually works. The design I tested
> that on uses an stotg04 instead of the usual isp1301 so support for that
> is also added.
>
> A bit more work is needed to get the RNDIS gadget driver to work.
>
> Alexandre Belloni (5):
>    usb: gadget: udc: lpc32xx: simplify probe
>    usb: gadget: udc: lpc32xx: simplify vbus handling
>    usb: gadget: udc: lpc32xx: properly setup phy interrupts
>    usb: gadget: udc: lpc32xx: add support for stotg04 phy
>    usb: gadget: udc: lpc32xx: rework interrupt handling
>
>   drivers/usb/gadget/udc/lpc32xx_udc.c | 167 +++++++++++----------------
>   1 file changed, 66 insertions(+), 101 deletions(-)
