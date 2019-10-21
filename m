Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2B4DED4C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 15:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfJUNRg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 09:17:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42925 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbfJUNRg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 09:17:36 -0400
Received: by mail-pf1-f196.google.com with SMTP id q12so8418600pff.9
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=stU5Hw6FSHm548LGa/lJkGZIDSpDEVc2XwLjZriJ4ik=;
        b=DkRHdrCn3Ky5mIppMoFXB3qRUj+jyYHKH8JDH0yU+oVH3uMJvDinPn/7EjkNjEyp9I
         wS4c8uzw11Xc9C3oh9dDEWf7UEnWq9QpQDm7Z/KhFc8t9rHpS/e5OyrH2uznipa1yr1Y
         tRcIWCXB3477AKdSTxflHSwZkMRsut/VrZ7J1SXDpWTBXm3f/VudIIbospdO5/Ub9ysd
         EGmdwZlOJjBJp0fhr/EqKnzHTQwC9k90bi7H72So2g9lE6x/ZSuA9yUP9oagT3+PbnMc
         O2Z2GKpotGhikU3sgct1iSGWbe16RVo4xefHYPnEppBdGrUfSHAr1lWXdfpgOpLkoLSc
         LAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=stU5Hw6FSHm548LGa/lJkGZIDSpDEVc2XwLjZriJ4ik=;
        b=Ye+WopsTdwtpNcipS/i+qENlCDD6KlRzi9CWDyw75x9tggXRSbkXMEtFXj6R5sNGE4
         vDvPXTSwAg9FEMDAEH5Aq0DlkZ7o5RrTKUBblqUoQv2IALf9If3U5EcxDv15GM2CH8V/
         KWNuUuSwHNvdm410nef9RWb0yG2h3UdYy4FbRKd/f0cw7zLg9Ho7NjBjSJ3O5GxXZRCp
         lr/KT8+8Lvb5RPHL7BP7jYHu+lYLL8C7sYYqPyPAT0i8lz4xPDf4+8ARz1aLc+NVK6Fa
         GukeqO4lxEAry/VZCLP2xKTJJVJ51mIHhIQxyC4FeTjBJ/Rkd2rYr7/Wu8d2Z/ytU6/k
         WHAg==
X-Gm-Message-State: APjAAAUK5r6iFXtBwGNZQvBgpUGKT+iPVMEEYWOCs6982Qx3iBAdxHQ1
        SKDK/0F+oe2tD8bOHwW/lSq8hpEW
X-Google-Smtp-Source: APXvYqy63cPrITVId7Wkl/R33G/ExT5D56bHPekSoCG5fqIB0YVWbo+jJjxsVah9+oJy75niWGYbjA==
X-Received: by 2002:a63:1d60:: with SMTP id d32mr26383609pgm.37.1571663853616;
        Mon, 21 Oct 2019 06:17:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12sm15994352pfb.97.2019.10.21.06.17.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 06:17:32 -0700 (PDT)
Subject: Re: [PATCH 11/18] usb: typec: ucsi: Simplified registration and I/O
 API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <20191021112524.79550-12-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4100b405-d3d9-25aa-0888-24d94053876c@roeck-us.net>
Date:   Mon, 21 Oct 2019 06:17:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021112524.79550-12-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/21/19 4:25 AM, Heikki Krogerus wrote:
> Adding more simplified API for interface registration and
> read and write operations.
> 
> The registration is split into separate creation and
> registration phases. That allows the drivers to properly
> initialize the interface before registering it if necessary.
> 
> The read and write operations are supplied in a completely
> separate struct ucsi_operations that is passed to the
> ucsi_register() function during registration. The new read
> and write operations will work more traditionally so that
> the read callback function reads a requested amount of data
> from an offset, and the write callback functions write the
> given data to the offset. The drivers will have to support
> both non-blocking writing and blocking writing. In blocking
> writing the driver itself is responsible of waiting for the
> completion event.
> 
> The new API makes it possible for the drivers to perform
> tasks also independently of the core ucsi.c, and that should
> allow for example quirks to be handled completely in the
> drivers without the need to touch ucsi.c.
> 
> The old API is kept until all drivers have been converted to
> the new API.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/ucsi/ucsi.c | 326 +++++++++++++++++++++++++++++++---
>   drivers/usb/typec/ucsi/ucsi.h |  58 ++++++
>   2 files changed, 355 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index edd722fb88b8..75f0a5df6a7f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -98,6 +98,98 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
>   	return ret;
>   }
>   
> +static int ucsi_acknowledge_command(struct ucsi *ucsi)
> +{
> +	u64 ctrl;
> +
> +	ctrl = UCSI_ACK_CC_CI;
> +	ctrl |= UCSI_ACK_COMMAND_COMPLETE;
> +
> +	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
> +}
> +
> +static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
> +{
> +	u64 ctrl;
> +
> +	ctrl = UCSI_ACK_CC_CI;
> +	ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
> +
> +	return ucsi->ops->async_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
> +}
> +
> +static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
> +
> +static int ucsi_read_error(struct ucsi *ucsi)
> +{
> +	u16 error;
> +	int ret;
> +
> +	/* Acknowlege the command that failed */
> +	ret = ucsi_acknowledge_command(ucsi);
> +	if (ret)
> +		return ret;
> +
> +	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, &error, sizeof(error));
> +	if (ret)
> +		return ret;
> +
> +	switch (error) {
> +	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
> +		return -EOPNOTSUPP;
> +	case UCSI_ERROR_CC_COMMUNICATION_ERR:
> +		return -ECOMM;
> +	case UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL:
> +		return -EPROTO;
> +	case UCSI_ERROR_DEAD_BATTERY:
> +		dev_warn(ucsi->dev, "Dead battery condition!\n");
> +		return -EPERM;
> +	/* The following mean a bug in this driver */
> +	case UCSI_ERROR_INVALID_CON_NUM:
> +	case UCSI_ERROR_UNREGONIZED_CMD:
> +	case UCSI_ERROR_INVALID_CMD_ARGUMENT:
> +		dev_err(ucsi->dev, "possible UCSI driver bug (0x%x)\n", error);
> +		return -EINVAL;
> +	default:
> +		dev_err(ucsi->dev, "%s: error without status\n", __func__);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
> +{
> +	u32 cci;
> +	int ret;
> +
> +	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> +	if (ret)
> +		return ret;
> +
> +	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return ret;
> +
> +	if (cci & UCSI_CCI_BUSY)
> +		return -EBUSY;
> +
> +	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
> +		return -EIO;
> +
> +	if (cci & UCSI_CCI_NOT_SUPPORTED)
> +		return -EOPNOTSUPP;
> +
> +	if (cci & UCSI_CCI_ERROR)
> +		return ucsi_read_error(ucsi);

I am a bit concerned that this may result in an endless recursion. Would it
be possible to avoid that ?

> +
> +	return UCSI_CCI_LENGTH(cci);
> +}
> +
>   static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>   			    void *data, size_t size)
>   {
> @@ -106,6 +198,26 @@ static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>   	u16 error;
>   	int ret;
>   
> +	if (ucsi->ops) {
> +		ret = ucsi_exec_command(ucsi, ctrl->raw_cmd);
> +		if (ret < 0)
> +			return ret;
> +
> +		data_length = ret;
> +
> +		if (data) {
> +			ret = ucsi->ops->read(ucsi, UCSI_MESSAGE_IN, data, size);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = ucsi_acknowledge_command(ucsi);
> +		if (ret)
> +			return ret;
> +
> +		return data_length;
> +	}
> +
>   	ret = ucsi_command(ucsi, ctrl);
>   	if (ret)
>   		goto err;
> @@ -518,7 +630,7 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>   		ucsi_altmode_update_active(con);
>   }
>   
> -static void ucsi_connector_change(struct work_struct *work)
> +static void ucsi_handle_connector_change(struct work_struct *work)
>   {
>   	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
>   						  work);
> @@ -580,7 +692,10 @@ static void ucsi_connector_change(struct work_struct *work)
>   	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
>   		ucsi_partner_change(con);
>   
> -	ret = ucsi_ack(ucsi, UCSI_ACK_EVENT);
> +	if (ucsi->ops)
> +		ret = ucsi_acknowledge_connector_change(ucsi);
> +	else
> +		ret = ucsi_ack(ucsi, UCSI_ACK_EVENT);
>   	if (ret)
>   		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
>   
> @@ -591,6 +706,20 @@ static void ucsi_connector_change(struct work_struct *work)
>   	mutex_unlock(&con->lock);
>   }
>   
> +/**
> + * ucsi_connector_change - Process Connector Change Event
> + * @ucsi: UCSI Interface
> + * @num: Connector number
> + */
> +void ucsi_connector_change(struct ucsi *ucsi, u8 num)
> +{
> +	struct ucsi_connector *con = &ucsi->connector[num - 1];
> +
> +	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
> +		schedule_work(&con->work);
> +}
> +EXPORT_SYMBOL_GPL(ucsi_connector_change);
> +
>   /**
>    * ucsi_notify - PPM notification handler
>    * @ucsi: Source UCSI Interface for the notifications
> @@ -647,6 +776,39 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
>   	unsigned long tmo;
>   	int ret;
>   
> +	if (ucsi->ops) {
> +		u64 command = UCSI_PPM_RESET;
> +		u32 cci;
> +
> +		ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
> +					     sizeof(command));
> +		if (ret < 0)
> +			return ret;
> +
> +		tmo = jiffies + msecs_to_jiffies(UCSI_TIMEOUT_MS);
> +
> +		do {
> +			if (time_is_before_jiffies(tmo))
> +				return -ETIMEDOUT;
> +
> +			ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +			if (ret)
> +				return ret;
> +
> +			if (cci & ~UCSI_CCI_RESET_COMPLETE) {

This repeats the reset command if any bit but UCSI_CCI_RESET_COMPLETE
is set. The old code has a comment here; it might be worthwhile to
add thesame comment here.

> +				ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL,
> +							     &command,
> +							     sizeof(command));
> +				if (ret < 0)
> +					return ret;
> +			}
> +
> +			msleep(20);
> +		} while (!(cci & UCSI_CCI_RESET_COMPLETE));
> +
> +		return 0;
> +	}
> +
>   	ctrl.raw_cmd = 0;
>   	ctrl.cmd.cmd = UCSI_PPM_RESET;
>   	trace_ucsi_command(&ctrl);
> @@ -807,7 +969,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   	struct ucsi_control ctrl;
>   	int ret;
>   
> -	INIT_WORK(&con->work, ucsi_connector_change);
> +	INIT_WORK(&con->work, ucsi_handle_connector_change);
>   	init_completion(&con->complete);
>   	mutex_init(&con->lock);
>   	con->num = index + 1;
> @@ -898,9 +1060,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   	return 0;
>   }
>   
> -static void ucsi_init(struct work_struct *work)
> +/**
> + * ucsi_init - Initialize UCSI interface
> + * @ucsi: UCSI to be initialized
> + *
> + * Registers all ports @ucsi has and enables all notification events.
> + */
> +int ucsi_init(struct ucsi *ucsi)
>   {
> -	struct ucsi *ucsi = container_of(work, struct ucsi, work);
>   	struct ucsi_connector *con;
>   	struct ucsi_control ctrl;
>   	int ret;
> @@ -956,7 +1123,7 @@ static void ucsi_init(struct work_struct *work)
>   
>   	mutex_unlock(&ucsi->ppm_lock);
>   
> -	return;
> +	return 0;
>   
>   err_unregister:
>   	for (con = ucsi->connector; con->port; con++) {
> @@ -970,49 +1137,106 @@ static void ucsi_init(struct work_struct *work)
>   	ucsi_reset_ppm(ucsi);
>   err:
>   	mutex_unlock(&ucsi->ppm_lock);
> -	dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(ucsi_init);
> +
> +static void ucsi_init_work(struct work_struct *work)
> +{
> +	struct ucsi *ucsi = container_of(work, struct ucsi, work);
> +	int ret;
> +
> +	ret = ucsi_init(ucsi);
> +	if (ret)
> +		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
>   }
>   
>   /**
> - * ucsi_register_ppm - Register UCSI PPM Interface
> - * @dev: Device interface to the PPM
> - * @ppm: The PPM interface
> - *
> - * Allocates UCSI instance, associates it with @ppm and returns it to the
> - * caller, and schedules initialization of the interface.
> + * ucsi_get_drvdata - Return private driver data pointer
> + * @ucsi: UCSI interface
>    */
> -struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm)
> +void *ucsi_get_drvdata(struct ucsi *ucsi)
> +{
> +	return ucsi->driver_data;
> +}
> +EXPORT_SYMBOL_GPL(ucsi_get_drvdata);
> +
> +/**
> + * ucsi_get_drvdata - Assign private driver data pointer
> + * @ucsi: UCSI interface
> + * @data: Private data pointer
> + */
> +void ucsi_set_drvdata(struct ucsi *ucsi, void *data)
> +{
> +	ucsi->driver_data = data;
> +}
> +EXPORT_SYMBOL_GPL(ucsi_set_drvdata);
> +
> +/**
> + * ucsi_create - Allocate UCSI instance
> + * @dev: Device interface to the PPM (Platform Policy Manager)
> + * @ops: I/O routines
> + */
> +struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
>   {
>   	struct ucsi *ucsi;
>   
> +	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
> +		return ERR_PTR(-EINVAL);
> +
>   	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
>   	if (!ucsi)
>   		return ERR_PTR(-ENOMEM);
>   
> -	INIT_WORK(&ucsi->work, ucsi_init);
> -	init_completion(&ucsi->complete);
> +	INIT_WORK(&ucsi->work, ucsi_init_work);
>   	mutex_init(&ucsi->ppm_lock);
> -
>   	ucsi->dev = dev;
> -	ucsi->ppm = ppm;
> +	ucsi->ops = ops;
> +
> +	return ucsi;
> +}
> +EXPORT_SYMBOL_GPL(ucsi_create);
> +
> +/**
> + * ucsi_destroy - Free UCSI instance
> + * @ucsi: UCSI instance to be freed
> + */
> +void ucsi_destroy(struct ucsi *ucsi)
> +{
> +	kfree(ucsi);
> +}
> +EXPORT_SYMBOL_GPL(ucsi_destroy);
> +
> +/**
> + * ucsi_register - Register UCSI interface
> + * @ucsi: UCSI instance
> + */
> +int ucsi_register(struct ucsi *ucsi)
> +{
> +	int ret;
> +
> +	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
> +			      sizeof(ucsi->version));
> +	if (ret)
> +		return ret;
> +
> +	if (!ucsi->version)
> +		return -ENODEV;
>   
> -	/*
> -	 * Communication with the PPM takes a lot of time. It is not reasonable
> -	 * to initialize the driver here. Using a work for now.
> -	 */
>   	queue_work(system_long_wq, &ucsi->work);
>   
> -	return ucsi;
> +	return 0;
>   }
> -EXPORT_SYMBOL_GPL(ucsi_register_ppm);
> +EXPORT_SYMBOL_GPL(ucsi_register);
>   
>   /**
> - * ucsi_unregister_ppm - Unregister UCSI PPM Interface
> - * @ucsi: struct ucsi associated with the PPM
> + * ucsi_unregister - Unregister UCSI interface
> + * @ucsi: UCSI interface to be unregistered
>    *
> - * Unregister UCSI PPM that was created with ucsi_register().
> + * Unregister UCSI interface that was created with ucsi_register().
>    */
> -void ucsi_unregister_ppm(struct ucsi *ucsi)
> +void ucsi_unregister(struct ucsi *ucsi)
>   {
>   	struct ucsi_control ctrl;
>   	int i;
> @@ -1035,7 +1259,51 @@ void ucsi_unregister_ppm(struct ucsi *ucsi)
>   	ucsi_reset_ppm(ucsi);
>   
>   	kfree(ucsi->connector);
> -	kfree(ucsi);
> +}
> +EXPORT_SYMBOL_GPL(ucsi_unregister);
> +
> +/**
> + * ucsi_register_ppm - Register UCSI PPM Interface
> + * @dev: Device interface to the PPM
> + * @ppm: The PPM interface
> + *
> + * Allocates UCSI instance, associates it with @ppm and returns it to the
> + * caller, and schedules initialization of the interface.
> + */
> +struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm)
> +{
> +	struct ucsi *ucsi;
> +
> +	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
> +	if (!ucsi)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_WORK(&ucsi->work, ucsi_init_work);
> +	init_completion(&ucsi->complete);
> +	mutex_init(&ucsi->ppm_lock);
> +
> +	ucsi->dev = dev;
> +	ucsi->ppm = ppm;
> +
> +	/*
> +	 * Communication with the PPM takes a lot of time. It is not reasonable
> +	 * to initialize the driver here. Using a work for now.
> +	 */
> +	queue_work(system_long_wq, &ucsi->work);
> +
> +	return ucsi;
> +}
> +EXPORT_SYMBOL_GPL(ucsi_register_ppm);
> +
> +/**
> + * ucsi_unregister_ppm - Unregister UCSI PPM Interface
> + * @ucsi: struct ucsi associated with the PPM
> + *
> + * Unregister UCSI PPM that was created with ucsi_register().
> + */
> +void ucsi_unregister_ppm(struct ucsi *ucsi)
> +{
> +	ucsi_unregister(ucsi);
>   }
>   EXPORT_SYMBOL_GPL(ucsi_unregister_ppm);
>   
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index de87d0b8319d..d8a8e8f2f912 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -10,6 +10,56 @@
>   
>   /* -------------------------------------------------------------------------- */
>   
> +struct ucsi;
> +
> +/* UCSI offsets (Bytes) */
> +#define UCSI_VERSION			0
> +#define UCSI_CCI			4
> +#define UCSI_CONTROL			8
> +#define UCSI_MESSAGE_IN			16
> +#define UCSI_MESSAGE_OUT		32
> +
> +/* Command Status and Connector Change Indication (CCI) bits */
> +#define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 0)) >> 1)
> +#define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
> +#define UCSI_CCI_NOT_SUPPORTED		BIT(25)
> +#define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
> +#define UCSI_CCI_RESET_COMPLETE		BIT(27)
> +#define UCSI_CCI_BUSY			BIT(28)
> +#define UCSI_CCI_ACK_COMPLETE		BIT(29)
> +#define UCSI_CCI_ERROR			BIT(30)
> +#define UCSI_CCI_COMMAND_COMPLETE	BIT(31)
> +
> +/**
> + * struct ucsi_operations - UCSI I/O operations
> + * @read: Read operation
> + * @sync_write: Blocking write operation
> + * @async_write: Non-blocking write operation
> + *
> + * Read and write routines for UCSI interface. @sync_write must wait for the
> + * Command Completion Event from the PPM before returning, and @async_write must
> + * return immediately after sending the data to the PPM.
> + */
> +struct ucsi_operations {
> +	int (*read)(struct ucsi *ucsi, unsigned int offset,
> +		    void *val, size_t val_len);
> +	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
> +			  const void *val, size_t val_len);
> +	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
> +			   const void *val, size_t val_len);
> +};
> +
> +struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
> +void ucsi_destroy(struct ucsi *ucsi);
> +int ucsi_register(struct ucsi *ucsi);
> +void ucsi_unregister(struct ucsi *ucsi);
> +void *ucsi_get_drvdata(struct ucsi *ucsi);
> +void ucsi_set_drvdata(struct ucsi *ucsi, void *data);
> +
> +void ucsi_connector_change(struct ucsi *ucsi, u8 num);
> +
> +/* -------------------------------------------------------------------------- */
> +
>   /* Command Status and Connector Change Indication (CCI) data structure */
>   struct ucsi_cci {
>   	u8:1; /* reserved */
> @@ -207,6 +257,10 @@ struct ucsi_control {
>   #define UCSI_ACK_EVENT			1
>   #define UCSI_ACK_CMD			2
>   
> +/* Bits for ACK CC or CI */
> +#define UCSI_ACK_CONNECTOR_CHANGE		BIT(16)
> +#define UCSI_ACK_COMMAND_COMPLETE		BIT(17)
> +
>   /* Bits for SET_NOTIFICATION_ENABLE command */
>   #define UCSI_ENABLE_NTFY_CMD_COMPLETE		BIT(0)
>   #define UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE	BIT(1)
> @@ -383,8 +437,12 @@ enum ucsi_status {
>   };
>   
>   struct ucsi {
> +	u16 version;
>   	struct device *dev;
>   	struct ucsi_ppm *ppm;
> +	struct driver_data *driver_data;
> +
> +	const struct ucsi_operations *ops;
>   
>   	enum ucsi_status status;
>   	struct completion complete;
> 

