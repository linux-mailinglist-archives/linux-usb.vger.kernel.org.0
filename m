Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C8E1CD898
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 13:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbgEKLfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 07:35:13 -0400
Received: from mga02.intel.com ([134.134.136.20]:42750 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729610AbgEKLfL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 May 2020 07:35:11 -0400
IronPort-SDR: vZROyOj1WAPPXxCtEYkeit6DKDpqyW8NCR7T3IlyQz3IqkvuyoyHV8bRlDtSFJZLuolcS85POh
 Y8Cvu8HDExEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 04:35:10 -0700
IronPort-SDR: pL1SsiTAJyIBF/Qu6mEw90bEMYOwWcUPILyyajrHPk3Au1WGiusSXB3OnViGL9gXuFf07HReZH
 RkiBBWIfVYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; 
   d="scan'208";a="371194061"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 May 2020 04:35:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 May 2020 14:35:06 +0300
Date:   Mon, 11 May 2020 14:35:06 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     jakub@bilan.me, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: your mail
Message-ID: <20200511113506.GB2062175@kuha.fi.intel.com>
References: <526351589195104@mail.yandex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <526351589195104@mail.yandex.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Andy

Adding also the linux-usb mailing list.

On Mon, May 11, 2020 at 01:06:18PM +0200, jakub@bilan.me wrote:
> Hello, I'm running Intel NUC10i3 with Ubuntu 20.04 on board. I have a problem
> with cpu interrups causing issues with deeper CPU sleep and increased power
> usage. Also load is always 1 even if machine has nothing to do.
>  
> I made a reasearch and found that device named TPS6598x interrupts my CPU. This
> device is related with USB and according to datasheet it's "USB Interface IC USB
> Type-CG and USB PD controller power switch and high-speed multiplexer ". I have
> nothing connected to NUC except power plug and ethernet cable.
>  
> Screenshots: https://imgur.com/a/uw9NDCi
>  
> How to solve this issue? Could you help me?

My guess is that the IRQ resource is not correct for the PD
controller causing you to see irq flood.

The problem is that the ACPI device entry (the node) on this platform
has 4 I2CSerialBus resources and 4 IRQ resources. The idea is that the
single ACPI device entry can represent up to 4 USB PD controllers. The
problem is that there is no way to know which IRQ resource belongs to
which I2CSerialBus resource :-(.

Andy, this is one of those multi-instantiate I2C slave devices with
HID INT3515.

The only solution I can think of is that we start maintaining DMI
quirk table in drivers/platform/x86/i2c-multi-instantiate.c where we
supply the correct i2c to irq resource mapping for every platform
that has this device(s).

> Kernel version:
>  
> Linux NUC 5.6.11-050611-generic #202005061022 SMP Wed May 6 10:27:04 UTC 2020
> x86_64 x86_64 x86_64 GNU/Linux
>  
> Bios version:
> FNCML357 Version: 0039 Date: 3/12/2020
> -- 
> Best regards
> Jakub Bilan

thanks,

-- 
heikki
