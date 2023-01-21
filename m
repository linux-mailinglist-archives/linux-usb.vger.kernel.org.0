Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F266764E5
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 08:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjAUHR5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Jan 2023 02:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjAUHR4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Jan 2023 02:17:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4B96E0FF
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 23:17:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DAB03B80D15
        for <linux-usb@vger.kernel.org>; Sat, 21 Jan 2023 07:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29420C433D2;
        Sat, 21 Jan 2023 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674285472;
        bh=2zOjYsGAqHktxKNoxa+OQUEDz9BaTJkJyQ/O2/7kwvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fewjOYqKxhrKktf+qktlJP5PxReja5M+gvv4XQyNhOtv9UYqJ4zVryD/IecOfueld
         fVZkBIABbHNwKstSy3ATF/WO+4vphVbPO59JUGeBhJ44lBAj8bi1D9W8+iD832DpWX
         oq/u9M1tjTZgXUEWBcIjP3oTBC/8V7rgzNuNGJyI=
Date:   Sat, 21 Jan 2023 08:17:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Message-ID: <Y8uRnc3Cxb1ADad6@kroah.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120233920.752245-1-samuel@cavoj.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 21, 2023 at 12:39:21AM +0100, Samuel Čavoj wrote:
> On some ACPI platforms (namely the ASUS Zenbook UM325) the _DSM method must
> not be called after a notification is received but instead the mailbox
> should be read immediately from RAM. This is because the ACPI interrupt
> handler destroys the CCI in ERAM after copying to system memory, and when
> _DSM is later called to perform a second copy, it retrieves a garbage
> value.
> 
> Instead, the _DSM(read) method should only be called when necessary, i.e.
> for polling the state after reset and for retrieving the version. Other
> reads should not call _DSM and only peek into the RAM region.
> 
> For platforms other than ACPI, the read_explicit op uses the same
> implementation as read.
> 
> Link: https://lore.kernel.org/linux-usb/20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain/
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
> index eabe519013e7..39ee3b63d07d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -883,7 +883,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
>  			goto out;
>  		}
>  
> -		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +		ret = ucsi->ops->read_explicit(ucsi, UCSI_CCI, &cci, sizeof(cci));
>  		if (ret)
>  			goto out;
>  
> @@ -1347,7 +1347,8 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
>  {
>  	struct ucsi *ucsi;
>  
> -	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
> +	if (!ops || !ops->read || !ops->read_explicit || !ops->sync_write ||
> +	    !ops->async_write)
>  		return ERR_PTR(-EINVAL);
>  
>  	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
> @@ -1382,8 +1383,8 @@ int ucsi_register(struct ucsi *ucsi)
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
> index c968474ee547..8361e1cfc8eb 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -37,6 +37,7 @@ struct ucsi_altmode;
>  /**
>   * struct ucsi_operations - UCSI I/O operations
>   * @read: Read operation
> + * @read_explicit: Read operation with explicit poll if applicable

I do not understand what "explicit poll" means here, you are going to
have to make it much more obvious.

But why should this need to be in the usci core?  Shouldn't the
individual driver know what needs to be done here or not?  That's it's
job, you are forcing the usci core to know about specific hardware
problems here, which feels wrong.


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
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index ce0c8ef80c04..6b3475ed4874 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -45,6 +45,16 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
>  			  void *val, size_t val_len)
>  {
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +
> +	memcpy(val, ua->base + offset, val_len);

How can you copy directly from ram?  Isn't this i/o memory?  Are you
sure this works on all platforms?

And you just switched the default read to do so, shouldn't you only do
this for the "special" types instead?

thanks,

greg k-h
