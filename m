Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6960065AF4D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 11:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjABKJZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 05:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjABKJX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 05:09:23 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31F21DF
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 02:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672654160; x=1704190160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cs6jXBI/HRgvmeiVk7c/Bbeq4ZzjV/ivUH04xWN1dA4=;
  b=KYzZALa5TEyUoxvppS65WZe8UhgowR9UhqpwXj9EYW5BdOTDdpNEuNkk
   jEYa1NmerPQhvAYlPRuqeYjNAeL1qv4DAkUuMmxWYCKkSRIVkCzDQUfnq
   LB6iATwxRO7+JkEHZkLFG4yJjvm2tfoYNUJ03g5RQT9xJG6qwsSjs+d99
   Q1qtbN6mKwMJkCbzlfhpiLY5tFQSpyezdnr7xyEX2L71NTGnauJYx4qZ+
   YVVrc+NYTdKBXOlx1RsPnxVAiCVdz4Odz9GIeLAxnB60zYMzmz6jxWMck
   UATu10qE0CclsldPIfEOerUH7HkFEqOcV0sGfMF8q/bm9FSKMolayRyTr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="319161543"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="319161543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 02:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="796831838"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="796831838"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Jan 2023 02:09:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 02 Jan 2023 12:09:16 +0200
Date:   Mon, 2 Jan 2023 12:09:16 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <Y7KtTBTNYeeR7v/C@kuha.fi.intel.com>
References: <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
 <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
 <20210826114105.amyjjhslqhiqdw6e@fastboi.localdomain>
 <178d8c7ca72400c2aa12679d4532611d@cavoj.net>
 <Ye5wFVwQTWawdPPK@kuha.fi.intel.com>
 <23e8104421efcf0937168e0ac5489367@cavoj.net>
 <Yjw9n5FXHMp8TpsM@kuha.fi.intel.com>
 <d2952e0a1356d88f899d26173cc14205@cavoj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2952e0a1356d88f899d26173cc14205@cavoj.net>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sam,

Sorry to keep you waiting.

On Thu, Dec 22, 2022 at 09:18:27PM +0100, Samuel Čavoj wrote:
> Hi Heikki,
> 
> I gave this a hard look and figured out the issue. Long story short, the
> firmware is clearing the CCI on EC RAM after copying from EC RAM to
> system memory. This happens both when notifications are delivered and
> when a read operation is explicitly performed via _DSM(read). What the
> driver currently does after receiving a notification is performing an
> explicit read. However by this time the CCI in EC RAM has been cleared
> by the AML and the information is lost.
> 
> Details:
> 
> 1. _DSM(read) of the UCSI device:
> 
> Copies all relevant fields of the mailbox data structure from EC RAM
> to a SystemMemory OperationRegion. The last field to be copied is the
> CCI:
> 
>     [...]
>     CCI0 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI0))
>     CCI1 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI1))
>     CCI2 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI2))
>     CCI3 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI3))
>     [...]
> 
> However, for some reason, this is followed by another two operations,
> which zero-out half of the CCI:
> 
>     [...]
>     \_SB.PCI0.SBRG.EC0.ECWT (Zero, RefOf (\_SB.PCI0.SBRG.EC0.CCI0))
>     \_SB.PCI0.SBRG.EC0.ECWT (Zero, RefOf (\_SB.PCI0.SBRG.EC0.CCI3))
> 
> I don't know why this is present. This does not cause the problem,
> however, only leads to issues if two explicit reads are performed
> consecutively. What does cause problems with the current driver
> implementation is:
> 
> 2. The event handler (_Q79)
> 
> The _Q79 event handler on my machine is responsible for the UCSI
> notifications. It performs a copy from EC RAM to system memory and
> triggers the 0x80 notification on the UCSI device (called UBTC).
> The final instructions of this handler are:
> 
>     [...]
>     ^^^^UBTC.CCI0 = CCI0 /* \_SB_.PCI0.SBRG.EC0_.CCI0 */
>     ^^^^UBTC.CCI1 = CCI1 /* \_SB_.PCI0.SBRG.EC0_.CCI1 */
>     ^^^^UBTC.CCI2 = CCI2 /* \_SB_.PCI0.SBRG.EC0_.CCI2 */
>     ^^^^UBTC.CCI3 = CCI3 /* \_SB_.PCI0.SBRG.EC0_.CCI3 */
>     USGC = 0xF1
>     CCI0 = Zero // These two lines are the culprit
>     CCI3 = Zero
>     Local1 = ((Timer - Local0) / 0x2710)
>     Notify (UBTC, 0x80) // Status Change
>     Release (ECMT)
> 
> 
> A side note:
> I figured this out by booting up a Windows installation and convincing
> the local kernel debugger to dump ACPI trace information to a file. The file
> contained an outrageous amount of information with inconsistent formatting
> (missing commas and stuff) for which I wrote an extremely janky parser in
> Python. This let me examine the exact steps performed by the Windows driver.
> And the difference I noticed is that the Linux driver was issuing a
> _DSM(read)
> after every notification, reading the already-zeroed-out CCI.
> 
> Patching the AML to remove the zeroing-out instructions seemed to work as
> well, but I suppose this is not a good general solution.
> 
> Following is a prototype-grade patch, in essence performing soft-reads most
> of
> the time (i.e. just reading from the OpRegion and not calling _DSM) and
> explicit
> reads when necessary. I am unfortunately not familiar with the spec and the
> hardware in the wild and I understand that it is possible that some devices
> on
> the other hand do not synchronize the mailbox when notifying and it needs to
> be
> done explicitly. I suppose we'd need a parameter to configure this behaviour
> in
> that case with a quirk system. The patch works on my system. Some other
> issues
> surface later, but I think they are related to a particular cheap dongle I
> have
> because they don't seem to occur without it.
> 
> What do you think about this situation? Is the patch reasonable, or does it
> need
> a significant re-think?

This is great! Thank you so much for figuring this one out!

I think your patch looks totally reasonable, but let me test it with
a couple of different systems that I have. I'll check the event
handlers from the ACPI tables. If that is how Windows works in
general, then this is what has to be done.

Thanks!

> From 45a29c149a29da989fbdd843c7f040a4454c3a33 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Samuel=20=C4=8Cavoj?= <samuel@cavoj.net>
> Date: Fri, 11 Nov 2022 00:06:24 +0100
> Subject: [PATCH] TODO: ucsi: introduce read_explicit
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Signed-off-by: Samuel Čavoj <samuel@cavoj.net>
> ---
>  drivers/usb/typec/ucsi/ucsi.c         |  9 +++++----
>  drivers/usb/typec/ucsi/ucsi.h         |  3 +++
>  drivers/usb/typec/ucsi/ucsi_acpi.c    | 11 +++++++++++
>  drivers/usb/typec/ucsi/ucsi_ccg.c     |  1 +
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c |  1 +
>  5 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index e690fa50ffce..c2fce8b27821 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -884,7 +884,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
>  			goto out;
>  		}
> 
> -		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +		ret = ucsi->ops->read_explicit(ucsi, UCSI_CCI, &cci, sizeof(cci));
>  		if (ret)
>  			goto out;
> 
> @@ -1351,7 +1351,8 @@ struct ucsi *ucsi_create(struct device *dev, const
> struct ucsi_operations *ops)
>  {
>  	struct ucsi *ucsi;
> 
> -	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
> +	if (!ops || !ops->read || !ops->read_explicit || !ops->sync_write ||
> +	    !ops->async_write)
>  		return ERR_PTR(-EINVAL);
> 
>  	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
> @@ -1385,8 +1386,8 @@ int ucsi_register(struct ucsi *ucsi)
>  {
>  	int ret;
> 
> -	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
> -			      sizeof(ucsi->version));
> +	ret = ucsi->ops->read_explicit(ucsi, UCSI_VERSION, &ucsi->version,
> +				       sizeof(ucsi->version));
>  	if (ret)
>  		return ret;
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 8eb391e3e592..e961ec1f92a0 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -37,6 +37,7 @@ struct ucsi_altmode;
>  /**
>   * struct ucsi_operations - UCSI I/O operations
>   * @read: Read operation
> + * @read_explicit: Read operation with explicit poll if applicable
>   * @sync_write: Blocking write operation
>   * @async_write: Non-blocking write operation
>   * @update_altmodes: Squashes duplicate DP altmodes
> @@ -48,6 +49,8 @@ struct ucsi_altmode;
>  struct ucsi_operations {
>  	int (*read)(struct ucsi *ucsi, unsigned int offset,
>  		    void *val, size_t val_len);
> +	int (*read_explicit)(struct ucsi *ucsi, unsigned int offset,
> +			     void *val, size_t val_len);
>  	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
>  			  const void *val, size_t val_len);
>  	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c
> b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index a0cd8c4ebe31..20432f4313c9 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -52,6 +52,16 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int
> offset,
>  			  void *val, size_t val_len)
>  {
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +
> +	memcpy(val, ua->base + offset, val_len);
> +
> +	return 0;
> +}
> +
> +static int ucsi_acpi_read_explicit(struct ucsi *ucsi, unsigned int offset,
> +				   void *val, size_t val_len)
> +{
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
>  	int ret;
> 
>  	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> @@ -101,6 +111,7 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi,
> unsigned int offset,
> 
>  static const struct ucsi_operations ucsi_acpi_ops = {
>  	.read = ucsi_acpi_read,
> +	.read_explicit = ucsi_acpi_read_explicit,
>  	.sync_write = ucsi_acpi_sync_write,
>  	.async_write = ucsi_acpi_async_write
>  };
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 5c0bf48be766..c1d2db3a7363 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -593,6 +593,7 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi,
> unsigned int offset,
> 
>  static const struct ucsi_operations ucsi_ccg_ops = {
>  	.read = ucsi_ccg_read,
> +	.read_explicit = ucsi_ccg_read,
>  	.sync_write = ucsi_ccg_sync_write,
>  	.async_write = ucsi_ccg_async_write,
>  	.update_altmodes = ucsi_ccg_update_altmodes
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 061551d464f1..274b5f016dfb 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -437,6 +437,7 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq,
> void *data)
> 
>  static const struct ucsi_operations ucsi_stm32g0_ops = {
>  	.read = ucsi_stm32g0_read,
> +	.read_explicit = ucsi_stm32g0_read,
>  	.sync_write = ucsi_stm32g0_sync_write,
>  	.async_write = ucsi_stm32g0_async_write,
>  };

Br,

-- 
heikki
