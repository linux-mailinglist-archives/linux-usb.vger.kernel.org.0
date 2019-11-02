Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EEDECFBD
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 17:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfKBQVl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 12:21:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39797 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbfKBQVl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 12:21:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id x28so5863823pfo.6
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 09:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UM0yi2P7AYMykeYwl+i6ch5qS3WRCyWYaVcCiLra748=;
        b=hdbiz90ozb28KqnqLV8aRaODOnKhpOKVKH73vlxccQ6kKVlJwH2Njhgtzy4urKkO1F
         fl3m6sANCgP4WjJU50o0tymkJ1savvK8necL9MbJMDf42yIvV2FdiuPboj41tthL7Eia
         8GaKYPYKXgbxerOpDluvXOpPPuleHLye5WGw9nwWrVqQ8kmq2ajWwNX41TzotJvDvYwF
         qy3V3dgu8M6HE9bF5oijktw4eXiXdX1/PVvD+53/a2ElmUghueoGP+IZvCdtUXm+M7w9
         TDOnmSbcgYv5mLmNNQ/gHSpqNb8pOFvJAvBccBa+wLMl66F30KHC4JZQSms+nZv4H4H1
         OofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UM0yi2P7AYMykeYwl+i6ch5qS3WRCyWYaVcCiLra748=;
        b=YgwczxWSXrq555tRXAJEuArjHpYMbVS56ir4B4lCrUdZqrR5DbWtslD0wIhONILrLB
         x3lkFFNt6ZRrXDi09rNguL105N4+V0BbQ/HVGRBhTLfXy230161tiJS84JLFEdSMQpyG
         Sg3i2NxJ+jHNvb0xbxPntmkZCrP7OsDKjdlXtlpzL5iYJRz2arwebGUcQSXuMUi/Z9jV
         6+nPdIcB1D1IOpLxG/1wJc4fuwKdm5YwWoo9OSLZ3wPmlymvG8KHeJro80rS4SYnjVyu
         YCfIlJ+Oo7jn16FdqlqrE250LIYheCEd7WoS5JQ48qlbHeX5dIekjje73HtS8piHIYHa
         y+JQ==
X-Gm-Message-State: APjAAAV5uczRoObceYuEZ6boq6jZ35+Q2eUiUBMeFcCgPX2r/lGYhj2/
        agBQr9use+fnGtocgBjQYRrdY9y2
X-Google-Smtp-Source: APXvYqxCzmdK5jwMsa8NJFs2CNV/zW3cSW/pP814vP9i2/nhqM2Gu27D2ZADzuBrcUwKTfwGWywg+w==
X-Received: by 2002:a63:5a03:: with SMTP id o3mr20320595pgb.381.1572711699809;
        Sat, 02 Nov 2019 09:21:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21sm11399389pfa.170.2019.11.02.09.21.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2019 09:21:39 -0700 (PDT)
Subject: Re: [PATCH v3 11/18] usb: typec: ucsi: Simplified registration and
 I/O API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
 <20191025082324.75731-12-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a37ea88e-5f31-2f02-beef-376669cda9cf@roeck-us.net>
Date:   Sat, 2 Nov 2019 09:21:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025082324.75731-12-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/25/19 1:23 AM, Heikki Krogerus wrote:
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
> Tested-by: Ajay Gupta <ajayg@nvidia.com>

I am still a bit concerned about log spam, eg if a battery is
dead for good, or if there is an actual driver bug, but I guess
we can address that later if needed.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/ucsi/ucsi.c | 330 +++++++++++++++++++++++++++++++---
>   drivers/usb/typec/ucsi/ucsi.h |  58 ++++++
>   2 files changed, 359 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index edd722fb88b8..dffc2cf8db6f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -98,6 +98,101 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
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
> +	if (cci & UCSI_CCI_ERROR) {
> +		if (cmd == UCSI_GET_ERROR_STATUS)
> +			return -EIO;
> +		return ucsi_read_error(ucsi);
> +	}
> +
> +	return UCSI_CCI_LENGTH(cci);
> +}
> +
>   static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>   			    void *data, size_t size)
>   {
> @@ -106,6 +201,26 @@ static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
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
> @@ -518,7 +633,7 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>   		ucsi_altmode_update_active(con);
>   }
>   
> -static void ucsi_connector_change(struct work_struct *work)
> +static void ucsi_handle_connector_change(struct work_struct *work)
>   {
>   	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
>   						  work);
> @@ -580,7 +695,10 @@ static void ucsi_connector_change(struct work_struct *work)
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
> @@ -591,6 +709,20 @@ static void ucsi_connector_change(struct work_struct *work)
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
> @@ -647,6 +779,40 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
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
> +			/* If the PPM is still doing something else, reset it again. */
> +			if (cci & ~UCSI_CCI_RESET_COMPLETE) {
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
> @@ -807,7 +973,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>   	struct ucsi_control ctrl;
>   	int ret;
>   
> -	INIT_WORK(&con->work, ucsi_connector_change);
> +	INIT_WORK(&con->work, ucsi_handle_connector_change);
>   	init_completion(&con->complete);
>   	mutex_init(&con->lock);
>   	con->num = index + 1;
> @@ -898,9 +1064,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
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
> @@ -956,7 +1127,7 @@ static void ucsi_init(struct work_struct *work)
>   
>   	mutex_unlock(&ucsi->ppm_lock);
>   
> -	return;
> +	return 0;
>   
>   err_unregister:
>   	for (con = ucsi->connector; con->port; con++) {
> @@ -970,49 +1141,106 @@ static void ucsi_init(struct work_struct *work)
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
> @@ -1035,7 +1263,51 @@ void ucsi_unregister_ppm(struct ucsi *ucsi)
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

