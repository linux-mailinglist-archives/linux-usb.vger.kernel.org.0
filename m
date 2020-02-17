Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79129161CCF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 22:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729851AbgBQVeD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 16:34:03 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:52865 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728935AbgBQVeD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 16:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LSG1Iq8N1obR+YR75qqHS+7aBiuBOgINdCLfFhtere0=; b=GZUkM4FU4wWE5TjMqeAF2RLscV
        IrWHrslEgjKlTdqvA+HBGnMVdN1KLqAxUfYfUNJLxso5M+OdSty4KBNiiIWCjPpCBLE2As7QmrbFn
        egHhazv+JNV7/mprsHjjOE473PHUJNNfmGXKlByIXQDx/VCsPTWia+BEcul2+g/AkFRZpdiCFPgFj
        v+ZoK6L72kiJ3rypxpdYnsqskeD2zYeevFQoVsG9hermTtNOnQX2ye+2TvNMbAqM2vHfrFUv6VpBr
        iDYoyfN1l4V5WWK1XTldhF5WbkRssRWcr9PD+CUi8B6INELKlqnFzdvGkS3LzM2uUeTnlDnpmljwg
        3b6mz2JA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56860 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1j3o1g-0007qk-MZ; Mon, 17 Feb 2020 22:34:00 +0100
Subject: Re: [RFC 1/9] regmap: Add USB support
To:     Mark Brown <broonie@kernel.org>
Cc:     balbi@kernel.org, lee.jones@linaro.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
 <20200217121149.GB9304@sirena.org.uk>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
Date:   Mon, 17 Feb 2020 22:33:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217121149.GB9304@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 17.02.2020 13.11, skrev Mark Brown:
> On Sun, Feb 16, 2020 at 06:21:09PM +0100, Noralf Trønnes wrote:
> 
>> Add support for regmap over USB for use with the Multifunction USB Device.
>> Two endpoints IN/OUT are used. Up to 255 regmaps are supported on one USB
>> interface. The register index width is always 32-bit, but the register
>> value can be 8, 16 or 32 bits wide. LZ4 compression is supported on bulk
>> transfers.

>> +static int regmap_usb_write(void *context, const void *data, size_t count)
>> +{
>> +	struct regmap_usb_context *ctx = context;
>> +	size_t val_len = count - sizeof(u32);
>> +	void *val;
>> +	int ret;
>> +
>> +	/* buffer needs to be properly aligned for DMA use */
>> +	val = kmemdup(data + sizeof(u32), val_len, GFP_KERNEL);
>> +	if (!val)
>> +		return -ENOMEM;
>> +
>> +	ret = regmap_usb_gather_write(ctx, data, sizeof(u32), val, val_len);
>> +	kfree(val);
>> +
>> +	return ret;
>> +}
> 
> This looks like you just don't support a straight write operation, if
> you need to do this emulation push it up the stack.
> 

After going through the stack I realise that I have a problem.
What I have failed to fully comprehend is this regmap requirement:

	if (val_len % map->format.val_bytes)
		return -EINVAL;

There will be a spi and i2c driver down the line which will transfer
buffers of any size, and having to use 8-bit register values will not be
great.

When I started writing regmap-usb 6 months ago I didn't know where it
would take me. The result is now a Multifuntion USB device with an mfd
driver. So, no usage except for the children of the mfd device.

Dropping regmap won't lead to any increased code size to speak of, so
instead of trying to make regmap match my use case, I think I'll put
this code inside the mfd driver.

Oversights like this was one of the things I was hoping to unearth with
this RFC.

Thanks,

Noralf.
