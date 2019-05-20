Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1EE022CA7
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 09:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbfETHIT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 03:08:19 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:40276 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfETHIS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 03:08:18 -0400
Received: by mail-wr1-f50.google.com with SMTP id h4so13236128wre.7
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 00:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+HccZpWfMZ+TIVZwAV0QZEFO3ZJvfjmBLEkuqXom4e0=;
        b=CmQ6X5ikpF8p1ailIRGSOjEmISaeEhexRX9InC4oNMPOEJlek1JB1jbOUMf6t7op24
         8NjuNhLrmz4rcsCwQUdwzDKB9zVggdxYYwSBHRGQmS7q3Z8MdkBgAPEaN/WMUp0o+0hx
         bKBWZFoItaaO1CRmTnskJ1mDcUOjifULAzum0U9FPTynG09X+OHPBSrhVpdzHAeocdca
         3LL0M6QTwHWWoJOhQA2xed61NAKOWiFO5wgVZv16HHTGRKaH4utVibviL+7Zv+EK6Or+
         jCxWlIJtnN0XKP0AW1bKCK+xMqbRHnaYPYSX9AZ9liUzOE8h2/TwGiTJwxTaqBfN0+9B
         YAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+HccZpWfMZ+TIVZwAV0QZEFO3ZJvfjmBLEkuqXom4e0=;
        b=DY+ACGae+3TiVuka0DYMY3VtNzuEiSxom5gNZpl/sTg+SEW5dL9yyOnS2Xx3Ch3o2X
         tNEaRU0yWcFAmYGpA4wU7hVCddkzeRcvZ8c9Ql5v13jypLH9uF9pK8n7QHNlyllHSuvd
         TDD6IMgGO/5zu+0+eRehSAKVdbo44+V9QFjtxnrxO1BcDAQ7efrgxAaeal7RxV1+L2pq
         t1v6yCkHh9fmPtNjjnokD8qif13mJN9JKnLseh5A17AjrRayFqPOaauwHQsbsKtxnjwm
         +KLKI26xatuvxphUaKRJqAUZBIwZKawxKQTgPkDN64Q4BEokjxKPJBpQ91AC5bUJnAwN
         Zkig==
X-Gm-Message-State: APjAAAWwOEZLIt/NWLFGiYJTcXfghDKFby8yeM8R23kSz6kJByUPjn32
        MSuyQ7wr1OJu2qyuq4EWNOvzhu9X
X-Google-Smtp-Source: APXvYqw+XwRbptWJ/XFb5tK/qtg1XwpUv45PlYGX+o87UuG8/jnEbR8FijR9HxKULIheRRPMmm7Yug==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr18420577wrx.300.1558336097250;
        Mon, 20 May 2019 00:08:17 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id d3sm20957803wmf.46.2019.05.20.00.08.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 00:08:16 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Kernel crash with FTDI FT232R on AMD boards.
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
 <20190516135612.GA28564@localhost>
Message-ID: <0cec0d5b-a9ef-bfeb-a316-27d8279b18cb@gmail.com>
Date:   Mon, 20 May 2019 09:06:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516135612.GA28564@localhost>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 16.5.2019 v 15:56 Johan Hovold napsal(a):
> On Thu, May 16, 2019 at 03:35:42PM +0200, StarostaCZ@gmail.com wrote:
> You should mention that you're using libusb and the vendor's ftdi
> library. Specifically, the kernels ftdi_sio driver is not involved.
Sorry, you are right, I use libftd2xx drivers version 1.4.8: 
https://www.ftdichip.com/Drivers/D2XX.htm
This driver is compiled with libusb. ftdi_sio is removed before testing 
by command "rmmod ftdi_sio".

starosta
