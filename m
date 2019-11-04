Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F28EE2AE
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbfKDOgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:36:48 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33602 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfKDOgs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 09:36:48 -0500
Received: by mail-pf1-f193.google.com with SMTP id c184so12335402pfb.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 06:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QJhsyF93PlEvs/F1Xf2HpFR6dpGnG/rVwAYz8juJcI8=;
        b=ZhfHusOzCzNsc523AoHLU28wFxwKQ5bRb8ZAS27c0hez9eKhzgKngeV7t/9KcSPiSt
         KEaPEIpoedBiDEiz6Ht4x/lrMzTfTVWKkJG/2WNkAH7owgdt+oU8h8GDJiIk4wZBRP3b
         HlEw0Kt8GV/nGjK6MOI2dX7WIlI12IIDGEdaMVV9YTd8ruNrETNU6k7J5DIGgFRDNf5K
         iv5OK92vRbA+oQLsjWNtFCIR3NVcctnYUdSm8YBFc+cYltdrPSvvU1M25l4cFtgLGCr9
         p/bMhzW841paVfLI02cmGio1Z3AX+y7Nh+Tc7+fAtAitAiJ7rBuE166SgsWjOfHlxikW
         SX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QJhsyF93PlEvs/F1Xf2HpFR6dpGnG/rVwAYz8juJcI8=;
        b=NQFYkmsiohsH83s9jGX9dSgYLVUthvYpUF6RlJ9jCCVDr1SuhHVmNGvQKup4IMMoEV
         qMJLeHOeCm/i/hmbtaicbPfMhbWO0LHk0w4043CCw6cdk80acpaha6yZ0dk1QvwC6ww8
         J7awodhF8mmc++NLo6+NWHkqAAGbTc0GU13ybq6luQiREbY6rBqagry7LxztkSmhSZOh
         ObTli8wzdjeWx5gyGvniK4k1zcmNMyoyxv6djpLZ/LwrxOBer8eax1o49SrrAif4pxRg
         XuiokNrm8xfeRzidDxWCx7BlX0KzBc/DV35r86hDMgeSHnqpmr0bEuJP+ftRErsVmKyD
         3gvg==
X-Gm-Message-State: APjAAAU/qxqmQmi/vzPr8S303YalD8tBJaS2EovGUFSqvo+XEtHz65mW
        S5tmRMGqozJGzMbKSsShOdy02xZe
X-Google-Smtp-Source: APXvYqxbMgudK8ZryPiv0X90wtwze56t3fY1DwSKFgzJvtk3mnJMTmccg3mmIVAfN0WihErTQL3k6Q==
X-Received: by 2002:a63:5966:: with SMTP id j38mr30128384pgm.304.1572878205801;
        Mon, 04 Nov 2019 06:36:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l33sm2397216pgb.79.2019.11.04.06.36.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 06:36:45 -0800 (PST)
Subject: Re: [PATCH v4 13/18] usb: typec: ucsi: ccg: Move to the new API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104142435.29960-14-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1a404105-8872-7377-465c-cf792f2fad58@roeck-us.net>
Date:   Mon, 4 Nov 2019 06:36:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104142435.29960-14-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/4/19 6:24 AM, Heikki Krogerus wrote:
> Replacing the old "cmd" and "sync" callbacks with an
> implementation of struct ucsi_operations. The interrupt
> handler will from now on read the CCI (Command Status and
> Connector Change Indication) register, and call
> ucsi_connector_change() function and/or complete pending
> command completions based on it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Ajay Gupta <ajayg@nvidia.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/ucsi/ucsi_ccg.c | 166 +++++++++++++++---------------
>   1 file changed, 81 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index d772fce51905..3370b3fc37b1 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -176,8 +176,8 @@ struct ccg_resp {
>   struct ucsi_ccg {
>   	struct device *dev;
>   	struct ucsi *ucsi;
> -	struct ucsi_ppm ppm;
>   	struct i2c_client *client;
> +
>   	struct ccg_dev_info info;
>   	/* version info for boot, primary and secondary */
>   	struct version_info version[FW2 + 1];
> @@ -196,6 +196,8 @@ struct ucsi_ccg {
>   	/* fw build with vendor information */
>   	u16 fw_build;
>   	struct work_struct pm_work;
> +
> +	struct completion complete;
>   };
>   
>   static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
> @@ -243,7 +245,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
>   	return 0;
>   }
>   
> -static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
> +static int ccg_write(struct ucsi_ccg *uc, u16 rab, const u8 *data, u32 len)
>   {
>   	struct i2c_client *client = uc->client;
>   	unsigned char *buf;
> @@ -317,88 +319,85 @@ static int ucsi_ccg_init(struct ucsi_ccg *uc)
>   	return -ETIMEDOUT;
>   }
>   
> -static int ucsi_ccg_send_data(struct ucsi_ccg *uc)
> +static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
> +			 void *val, size_t val_len)
>   {
> -	u8 *ppm = (u8 *)uc->ppm.data;
> -	int status;
> -	u16 rab;
> +	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
>   
> -	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, message_out));
> -	status = ccg_write(uc, rab, ppm +
> -			   offsetof(struct ucsi_data, message_out),
> -			   sizeof(uc->ppm.data->message_out));
> -	if (status < 0)
> -		return status;
> -
> -	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, ctrl));
> -	return ccg_write(uc, rab, ppm + offsetof(struct ucsi_data, ctrl),
> -			 sizeof(uc->ppm.data->ctrl));
> +	return ccg_read(ucsi_get_drvdata(ucsi), reg, val, val_len);
>   }
>   
> -static int ucsi_ccg_recv_data(struct ucsi_ccg *uc)
> +static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
> +				const void *val, size_t val_len)
>   {
> -	u8 *ppm = (u8 *)uc->ppm.data;
> -	int status;
> -	u16 rab;
> +	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
>   
> -	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, cci));
> -	status = ccg_read(uc, rab, ppm + offsetof(struct ucsi_data, cci),
> -			  sizeof(uc->ppm.data->cci));
> -	if (status < 0)
> -		return status;
> -
> -	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, message_in));
> -	return ccg_read(uc, rab, ppm + offsetof(struct ucsi_data, message_in),
> -			sizeof(uc->ppm.data->message_in));
> +	return ccg_write(ucsi_get_drvdata(ucsi), reg, val, val_len);
>   }
>   
> -static int ucsi_ccg_ack_interrupt(struct ucsi_ccg *uc)
> +static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
> +			       const void *val, size_t val_len)
>   {
> -	int status;
> -	unsigned char data;
> +	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
> +	int ret;
>   
> -	status = ccg_read(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
> -	if (status < 0)
> -		return status;
> +	mutex_lock(&uc->lock);
> +	pm_runtime_get_sync(uc->dev);
> +	set_bit(DEV_CMD_PENDING, &uc->flags);
>   
> -	return ccg_write(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
> -}
> +	ret = ucsi_ccg_async_write(ucsi, offset, val, val_len);
> +	if (ret)
> +		goto err_clear_bit;
>   
> -static int ucsi_ccg_sync(struct ucsi_ppm *ppm)
> -{
> -	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
> -	int status;
> +	if (!wait_for_completion_timeout(&uc->complete, msecs_to_jiffies(5000)))
> +		ret = -ETIMEDOUT;
>   
> -	status = ucsi_ccg_recv_data(uc);
> -	if (status < 0)
> -		return status;
> +err_clear_bit:
> +	clear_bit(DEV_CMD_PENDING, &uc->flags);
> +	pm_runtime_put_sync(uc->dev);
> +	mutex_unlock(&uc->lock);
>   
> -	/* ack interrupt to allow next command to run */
> -	return ucsi_ccg_ack_interrupt(uc);
> +	return ret;
>   }
>   
> -static int ucsi_ccg_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
> -{
> -	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
> -
> -	ppm->data->ctrl.raw_cmd = ctrl->raw_cmd;
> -	return ucsi_ccg_send_data(uc);
> -}
> +static const struct ucsi_operations ucsi_ccg_ops = {
> +	.read = ucsi_ccg_read,
> +	.sync_write = ucsi_ccg_sync_write,
> +	.async_write = ucsi_ccg_async_write
> +};
>   
>   static irqreturn_t ccg_irq_handler(int irq, void *data)
>   {
> +	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
>   	struct ucsi_ccg *uc = data;
> +	u8 intr_reg;
> +	u32 cci;
> +	int ret;
> +
> +	ret = ccg_read(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
> +	if (ret)
> +		return ret;
> +
> +	ret = ccg_read(uc, reg, (void *)&cci, sizeof(cci));
> +	if (ret)
> +		goto err_clear_irq;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (test_bit(DEV_CMD_PENDING, &uc->flags) &&
> +	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +		complete(&uc->complete);
>   
> -	ucsi_notify(uc->ucsi);
> +err_clear_irq:
> +	ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
>   
>   	return IRQ_HANDLED;
>   }
>   
>   static void ccg_pm_workaround_work(struct work_struct *pm_work)
>   {
> -	struct ucsi_ccg *uc = container_of(pm_work, struct ucsi_ccg, pm_work);
> -
> -	ucsi_notify(uc->ucsi);
> +	ccg_irq_handler(0, container_of(pm_work, struct ucsi_ccg, pm_work));
>   }
>   
>   static int get_fw_info(struct ucsi_ccg *uc)
> @@ -1027,10 +1026,10 @@ static int ccg_restart(struct ucsi_ccg *uc)
>   		return status;
>   	}
>   
> -	uc->ucsi = ucsi_register_ppm(dev, &uc->ppm);
> -	if (IS_ERR(uc->ucsi)) {
> -		dev_err(uc->dev, "ucsi_register_ppm failed\n");
> -		return PTR_ERR(uc->ucsi);
> +	status = ucsi_register(uc->ucsi);
> +	if (status) {
> +		dev_err(uc->dev, "failed to register the interface\n");
> +		return status;
>   	}
>   
>   	return 0;
> @@ -1047,7 +1046,7 @@ static void ccg_update_firmware(struct work_struct *work)
>   		return;
>   
>   	if (flash_mode != FLASH_NOT_NEEDED) {
> -		ucsi_unregister_ppm(uc->ucsi);
> +		ucsi_unregister(uc->ucsi);
>   		free_irq(uc->irq, uc);
>   
>   		ccg_fw_update(uc, flash_mode);
> @@ -1091,21 +1090,15 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>   	struct device *dev = &client->dev;
>   	struct ucsi_ccg *uc;
>   	int status;
> -	u16 rab;
>   
>   	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
>   	if (!uc)
>   		return -ENOMEM;
>   
> -	uc->ppm.data = devm_kzalloc(dev, sizeof(struct ucsi_data), GFP_KERNEL);
> -	if (!uc->ppm.data)
> -		return -ENOMEM;
> -
> -	uc->ppm.cmd = ucsi_ccg_cmd;
> -	uc->ppm.sync = ucsi_ccg_sync;
>   	uc->dev = dev;
>   	uc->client = client;
>   	mutex_init(&uc->lock);
> +	init_completion(&uc->complete);
>   	INIT_WORK(&uc->work, ccg_update_firmware);
>   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>   
> @@ -1133,30 +1126,25 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>   	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
>   		uc->port_num++;
>   
> +	uc->ucsi = ucsi_create(dev, &ucsi_ccg_ops);
> +	if (IS_ERR(uc->ucsi))
> +		return PTR_ERR(uc->ucsi);
> +
> +	ucsi_set_drvdata(uc->ucsi, uc);
> +
>   	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
>   				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>   				      dev_name(dev), uc);
>   	if (status < 0) {
>   		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
> -		return status;
> +		goto out_ucsi_destroy;
>   	}
>   
>   	uc->irq = client->irq;
>   
> -	uc->ucsi = ucsi_register_ppm(dev, &uc->ppm);
> -	if (IS_ERR(uc->ucsi)) {
> -		dev_err(uc->dev, "ucsi_register_ppm failed\n");
> -		return PTR_ERR(uc->ucsi);
> -	}
> -
> -	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, version));
> -	status = ccg_read(uc, rab, (u8 *)(uc->ppm.data) +
> -			  offsetof(struct ucsi_data, version),
> -			  sizeof(uc->ppm.data->version));
> -	if (status < 0) {
> -		ucsi_unregister_ppm(uc->ucsi);
> -		return status;
> -	}
> +	status = ucsi_register(uc->ucsi);
> +	if (status)
> +		goto out_free_irq;
>   
>   	i2c_set_clientdata(client, uc);
>   
> @@ -1167,6 +1155,13 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>   	pm_runtime_idle(uc->dev);
>   
>   	return 0;
> +
> +out_free_irq:
> +	free_irq(uc->irq, uc);
> +out_ucsi_destroy:
> +	ucsi_destroy(uc->ucsi);
> +
> +	return status;
>   }
>   
>   static int ucsi_ccg_remove(struct i2c_client *client)
> @@ -1175,8 +1170,9 @@ static int ucsi_ccg_remove(struct i2c_client *client)
>   
>   	cancel_work_sync(&uc->pm_work);
>   	cancel_work_sync(&uc->work);
> -	ucsi_unregister_ppm(uc->ucsi);
>   	pm_runtime_disable(uc->dev);
> +	ucsi_unregister(uc->ucsi);
> +	ucsi_destroy(uc->ucsi);
>   	free_irq(uc->irq, uc);
>   
>   	return 0;
> 

