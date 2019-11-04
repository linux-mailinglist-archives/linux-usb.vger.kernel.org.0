Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4CAEE2BE
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfKDOll (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:41:41 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46200 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfKDOll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 09:41:41 -0500
Received: by mail-pl1-f193.google.com with SMTP id l4so2414212plt.13
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G/hjo3+iCpiN0jVBJ9vi8R1Yj+qLdq5D5eHmYtgCKD0=;
        b=G2VNSv/gRoVq3axHQWnt6Gc8zjegbavbUvmku2c9kibheKJzobTIJRGVnlf/xFCOOh
         ZzjghgGhICmvleUgXrJc833PmUQsyexAkgYmEDni/SlM50Iri3AfVfCNb+MRQFVjzi36
         kaZzq7koJTkch8p9VmKUxMb4gVFoaEjrwo6e0B+Y3aq5J57T29Q8aUdb+Gj5W+myojGj
         x7b4AauFaFMyeqVn9c1kqmoydnE+RNclhpy0T85XT4VGQ/IL02h4Ig8XHXG/XHqK8FdA
         IBQyGAw98FthnJvkpDsJmYgFH/ZUFCH50iupXp+LR2jIQFiDqYVcAvDXWpzMBieSH+zB
         uwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G/hjo3+iCpiN0jVBJ9vi8R1Yj+qLdq5D5eHmYtgCKD0=;
        b=LvV7kKhidGUkVEYObCuVRA00ps2EN5k1wrGHyNtZ6RNsr1R5OF+kjiCxrdwia2SCF8
         EtqaRjWPRE4sveDn4rHppahwvGmqbmTfXdNjv78ThFg9K8gFeRqEA+S2iH+MQRTOYMJl
         x5B7GhWKH12EHqH3e2QmLkIiMR+i9yn0GprEHG3zLRaJZ24rgPGd7x6QcGO6HcdRXiox
         mBPeNuQWYhsHyDjvuvyz6zp0ckXCYME/55CbVEku2iUpqct2Jk/nUGxlcWfzWgqYpK5W
         D7G/XLx3jkJGL3QiE3e9ULD2qWiMi/vkhSvq9d4OgffyLZ+wfV1pSPPn4A/8ebh6acF7
         u84g==
X-Gm-Message-State: APjAAAUqvBhQT3BsqPPWgZLuXIWDTz9ACGqRnkpGmtj8OfXYm5/5O7Im
        2UnGWiw/V2ke/Xv21vDRGG7WnmSP
X-Google-Smtp-Source: APXvYqxNhGwxPeqbtWmrRo15llV47ZrWorr2WtO+dthI1YEf34sQqL89cN4HdtMPp7veNC+9qgnClA==
X-Received: by 2002:a17:902:5985:: with SMTP id p5mr28557994pli.259.1572878500354;
        Mon, 04 Nov 2019 06:41:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m68sm15927607pfb.122.2019.11.04.06.41.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 06:41:39 -0800 (PST)
Subject: Re: [PATCH v4 17/18] usb: typec: ucsi: New error codes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104142435.29960-18-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6f7d180f-dcdd-1014-65e0-2c757042eec9@roeck-us.net>
Date:   Mon, 4 Nov 2019 06:41:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104142435.29960-18-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/4/19 6:24 AM, Heikki Krogerus wrote:
> Adding new error codes to the driver that were introduced in
> UCSI specification v1.1.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Ajay Gupta <ajayg@nvidia.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/ucsi/ucsi.c | 25 ++++++++++++++++++++-----
>   drivers/usb/typec/ucsi/ucsi.h |  6 ++++++
>   2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 6c6def96a55b..772f55c92ba3 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -86,18 +86,33 @@ static int ucsi_read_error(struct ucsi *ucsi)
>   	case UCSI_ERROR_DEAD_BATTERY:
>   		dev_warn(ucsi->dev, "Dead battery condition!\n");
>   		return -EPERM;
> -	/* The following mean a bug in this driver */
>   	case UCSI_ERROR_INVALID_CON_NUM:
>   	case UCSI_ERROR_UNREGONIZED_CMD:
>   	case UCSI_ERROR_INVALID_CMD_ARGUMENT:
> -		dev_err(ucsi->dev, "possible UCSI driver bug (0x%x)\n", error);
> +		dev_err(ucsi->dev, "possible UCSI driver bug %u\n", error);
>   		return -EINVAL;
> +	case UCSI_ERROR_OVERCURRENT:
> +		dev_warn(ucsi->dev, "Overcurrent condition\n");
> +		break;
> +	case UCSI_ERROR_PARTNER_REJECTED_SWAP:
> +		dev_warn(ucsi->dev, "Partner rejected swap\n");
> +		break;
> +	case UCSI_ERROR_HARD_RESET:
> +		dev_warn(ucsi->dev, "Hard reset occurred\n");
> +		break;
> +	case UCSI_ERROR_PPM_POLICY_CONFLICT:
> +		dev_warn(ucsi->dev, "PPM Policy conflict\n");
> +		break;
> +	case UCSI_ERROR_SWAP_REJECTED:
> +		dev_warn(ucsi->dev, "Swap rejected\n");
> +		break;
> +	case UCSI_ERROR_UNDEFINED:
>   	default:
> -		dev_err(ucsi->dev, "%s: error without status\n", __func__);
> -		return -EIO;
> +		dev_err(ucsi->dev, "unknown error %u\n", error);
> +		break;
>   	}
>   
> -	return 0;
> +	return -EIO;
>   }
>   
>   static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index bc2254e7a3a3..8569bbd3762f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -133,6 +133,12 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>   #define UCSI_ERROR_CC_COMMUNICATION_ERR		BIT(4)
>   #define UCSI_ERROR_DEAD_BATTERY			BIT(5)
>   #define UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL	BIT(6)
> +#define UCSI_ERROR_OVERCURRENT			BIT(7)
> +#define UCSI_ERROR_UNDEFINED			BIT(8)
> +#define UCSI_ERROR_PARTNER_REJECTED_SWAP	BIT(9)
> +#define UCSI_ERROR_HARD_RESET			BIT(10)
> +#define UCSI_ERROR_PPM_POLICY_CONFLICT		BIT(11)
> +#define UCSI_ERROR_SWAP_REJECTED		BIT(12)
>   
>   /* Data structure filled by PPM in response to GET_CAPABILITY command. */
>   struct ucsi_capability {
> 

