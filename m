Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1853F0685
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 16:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239680AbhHROWu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 10:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239399AbhHROWh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 10:22:37 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C969CC0610FF
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 07:16:29 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id f16-20020a056830205000b00519b99d3dcbso3877847otp.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k5X2BLLvDlk4I/DbntcSXNJlBSW6m1ojzl0hla09RFw=;
        b=M+ITxJk0OHX9Z11PcU4SD/hoYQmhoorOhh9ud1up5IfXlZsYrOTCnYTwHc/dRS6A7u
         9yXn/rXdvnYZDMnBg04ZdR8vo0gXMJNoCttbzQXZ6WGuxX4x8M8IUJci8IFnA3jUrL1Z
         9+PoIPVxPkFurL7StnSeOGJPH0I4H2GrenT8KFn6IpCUt+a/UoxeyUshjtxRBM2MpV4m
         VCExhydDw1zO2OwicTzMVsXLrSmBygQbPF/bLOP/0ROnYUyRjk0XXlV/8Gao+SN1LdgN
         v8ZMzBK095EMIW86nQ/ykfkG68RGAuFsngxaCCHAMDyyN7lmPtR7DX7d5Dh2aD+TNyBm
         JM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k5X2BLLvDlk4I/DbntcSXNJlBSW6m1ojzl0hla09RFw=;
        b=ElXOSyayC8VqVlSPBRrGMtGu9aPExty//e/YpPsQX31jtYvBj9Vo8PgLlYweErEQor
         SXKyGRljgSCGAWOxFS1WcskRwaQ+fQ24S3YNZKILqJwxi22uHRIOkdlXztzLx/Wy/VxM
         hdILwCgMZAkw0XgX8PQLDgQoWon87UhPrBlyGv52DY1+BL+Ut3o+sgG38+Yaf9pdzPXR
         Mvo7k86Bd97qI781b3lBqwawxnENFlMlklYf91XRi9n5sQqE0vzcIKf6AhORuNCqLR2Z
         2Yjl5vysR9ZsuTyTrFfmrfCG3NDEFrmYvt6iOzBrsScRtdn1hNFLlTvKLefUeaRrkr0e
         +EHw==
X-Gm-Message-State: AOAM530u4/EQSwuJekEvVNSWFsV1vp/H0lFy8ZR3hbyJYXaJ3B+tKmEn
        GKzoug+qcsqOgecLPvL6V2Y=
X-Google-Smtp-Source: ABdhPJwfvb+SZXfdH9PHMEwca3pN9/VjhGXb6GZpDbVd3DDVTGzCXodydd5AuPD31/mvxvDQpkNILw==
X-Received: by 2002:a05:6830:1507:: with SMTP id k7mr6857055otp.317.1629296189261;
        Wed, 18 Aug 2021 07:16:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13sm1066360oov.6.2021.08.18.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:16:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH regression fix] usb: typec: tcpm: Fix VDMs sometimes not
 being forwarded to alt-mode drivers
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>
References: <20210816154632.381968-1-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6c82475c-7aee-17bb-f09b-a4389f8a3a45@roeck-us.net>
Date:   Wed, 18 Aug 2021 07:16:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816154632.381968-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/16/21 8:46 AM, Hans de Goede wrote:
> Commit a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no
> snk_vdo"), stops tcpm_pd_data_request() calling tcpm_handle_vdm_request()
> when port->nr_snk_vdo is not set. But the VDM might be intended for an
> altmode-driver, in which case nr_snk_vdo does not matter.
> 
> This change breaks the forwarding of connector hotplug (HPD) events
> for displayport altmode on devices which don't set nr_snk_vdo.
> 
> tcpm_pd_data_request() is the only caller of tcpm_handle_vdm_request(),
> so we can move the nr_snk_vdo check to inside it, at which point we
> have already looked up the altmode device so we can check for this too.
> 
> Doing this check here also ensures that vdm_state gets set to
> VDM_STATE_DONE if it was VDM_STATE_BUSY, even if we end up with
> responding with PD_MSG_CTRL_NOT_SUPP later.
> 
> Note that tcpm_handle_vdm_request() was already sending
> PD_MSG_CTRL_NOT_SUPP in some circumstances, after moving the nr_snk_vdo
> check the same error-path is now taken when that check fails. So that
> we have only one error-path for this and not two. Replace the
> tcpm_queue_message(PD_MSG_CTRL_NOT_SUPP) used by the existing error-path
> with the more robust tcpm_pd_handle_msg() from the (now removed) second
> error-path.
> 
> Cc: Kyle Tso <kyletso@google.com>
> Fixes: a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no snk_vdo")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index b9bb63d749ec..f4079b5cb26d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1737,6 +1737,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>   	return rlen;
>   }
>   
> +static void tcpm_pd_handle_msg(struct tcpm_port *port,
> +			       enum pd_msg_request message,
> +			       enum tcpm_ams ams);
> +
>   static void tcpm_handle_vdm_request(struct tcpm_port *port,
>   				    const __le32 *payload, int cnt)
>   {
> @@ -1764,11 +1768,11 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>   		port->vdm_state = VDM_STATE_DONE;
>   	}
>   
> -	if (PD_VDO_SVDM(p[0])) {
> +	if (PD_VDO_SVDM(p[0]) && (adev || tcpm_vdm_ams(port) || port->nr_snk_vdo)) {
>   		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
>   	} else {
>   		if (port->negotiated_rev >= PD_REV30)
> -			tcpm_queue_message(port, PD_MSG_CTRL_NOT_SUPP);
> +			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
>   	}
>   
>   	/*
> @@ -2471,10 +2475,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
>   					   NONE_AMS);
>   		break;
>   	case PD_DATA_VENDOR_DEF:
> -		if (tcpm_vdm_ams(port) || port->nr_snk_vdo)
> -			tcpm_handle_vdm_request(port, msg->payload, cnt);
> -		else if (port->negotiated_rev > PD_REV20)
> -			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> +		tcpm_handle_vdm_request(port, msg->payload, cnt);
>   		break;
>   	case PD_DATA_BIST:
>   		port->bist_request = le32_to_cpu(msg->payload[0]);
> 

