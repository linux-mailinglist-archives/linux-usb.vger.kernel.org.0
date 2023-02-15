Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C93697F82
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 16:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjBOP0o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 10:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBOP0n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 10:26:43 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358182D4A
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 07:26:42 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-16aa71c1600so23265390fac.11
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 07:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/r0mUUmr2I5hQah5E7tDeTRhD4qXo3xGFnPjvtqurE=;
        b=Tx5JqvWQ74AlQ75F/wLjeThFu9TC/RFZ9Xy0K+Yfw1jz/GuqBQMXgzelpahSKKXGqE
         BQrLgus7ME5bxmFt/jRKjG20UvAVUoO/tFX8H3I1rLupgpvHCZfv03WO22ocdybIwcKj
         Mxq6TwB9qzdXG4Dh3SxnmfRN6cJB1v8qABRtGzKlBwAGwSOSrTm+b9Ihge6OD1hxFzZO
         PHiQHdQgDL0KWk8MNWgbMMZP03Pga4x+Jvf71AjOapT+4TqMvEK1y6MCs+HQIdywOiSk
         6pMm6/eQwGypw9U7/1Tsjd9kJNuE+S88v1c3iQ5GDFMXNDP3REXVOJHOzOSmXqp/5T7G
         APzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/r0mUUmr2I5hQah5E7tDeTRhD4qXo3xGFnPjvtqurE=;
        b=R7LU9R4OHvZJ3g36kRycMSmvCbxLM+bYfSHAsFB7+rGSjcOX9PzDhjyNt+JOrStc0t
         Nw3I2+Byu6+LmqC1TXxbCO57Jt1CdNW23S1YiGK7vs2y1WKTfOST3vKnaD8nqz436/9r
         w9USKjDsSeI4AGAZvT39HreqarYHWwEk7+vS6AzLh1/qUSkeU6uYS5yQNU/5jG7NLOhh
         7YvVWCD5dEilA0OADCZMznR4EHLnsaNGe7FSyi790tXlKEeHDB1b+rsYC5bxcLUD3auY
         PyeTegsOnZvF2hJk1IKvLlSJ/FBCNjWcbDeYdFnL58SPTpk9TRovbEP4tW9VXsSn2ruJ
         hq4g==
X-Gm-Message-State: AO0yUKUeSNmhjlG9ltPzgYPBp4WoRvRjJOGRpLDW+Qqg+ek+lzKouNkL
        vmpColQMA8FY4S3uLU1uLau8U+ljhcU=
X-Google-Smtp-Source: AK7set8cQtPwowWvDrLdBUnw+nfEOHFZFdS5UYtljBt4WUCIBbMqZxbUx8i7KxA8eHZZYNyiO/6wDg==
X-Received: by 2002:a05:6870:58d:b0:16d:ed9f:75ee with SMTP id m13-20020a056870058d00b0016ded9f75eemr1214699oap.53.1676474801562;
        Wed, 15 Feb 2023 07:26:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v23-20020a4ac917000000b004fca8a11c61sm7090216ooq.3.2023.02.15.07.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 07:26:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1de70c7-85bb-b9a6-9d56-3972c8ab5f54@roeck-us.net>
Date:   Wed, 15 Feb 2023 07:26:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20230215113136.2838773-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] usb: typec: tcpm: fix warning when handle
 discover_identity message
In-Reply-To: <20230215113136.2838773-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/15/23 03:31, Xu Yang wrote:
> Since both source and sink device can send discover_identity message in
> PD3, kernel may dump below warning:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 169 at drivers/usb/typec/tcpm/tcpm.c:1446 tcpm_queue_vdm+0xe0/0xf0
> Modules linked in:
> CPU: 0 PID: 169 Comm: 1-0050 Not tainted 6.1.1-00038-g6a3c36cf1da2-dirty #567
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : tcpm_queue_vdm+0xe0/0xf0
> lr : tcpm_queue_vdm+0x2c/0xf0
> sp : ffff80000c19bcd0
> x29: ffff80000c19bcd0 x28: 0000000000000001 x27: ffff0000d11c8ab8
> x26: ffff0000d11cc000 x25: 0000000000000000 x24: 00000000ff008081
> x23: 0000000000000001 x22: 00000000ff00a081 x21: ffff80000c19bdbc
> x20: 0000000000000000 x19: ffff0000d11c8080 x18: ffffffffffffffff
> x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000d716f580
> x14: 0000000000000001 x13: ffff0000d716f507 x12: 0000000000000001
> x11: 0000000000000000 x10: 0000000000000020 x9 : 00000000000ee098
> x8 : 00000000ffffffff x7 : 000000000000001c x6 : ffff0000d716f580
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> x2 : ffff80000c19bdbc x1 : 00000000ff00a081 x0 : 0000000000000004
> Call trace:
> tcpm_queue_vdm+0xe0/0xf0
> tcpm_pd_rx_handler+0x340/0x1ab0
> kthread_worker_fn+0xcc/0x18c
> kthread+0x10c/0x110
> ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Below sequences may trigger this warning:
> 
> tcpm_send_discover_work(work)
>    tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
>     tcpm_queue_vdm(port, header, data, count);
>      port->vdm_state = VDM_STATE_READY;
> 
> vdm_state_machine_work(work);
> 			<-- received discover_identity from partner
>   vdm_run_state_machine(port);
>    port->vdm_state = VDM_STATE_SEND_MESSAGE;
>     mod_vdm_delayed_work(port, x);
> 
> tcpm_pd_rx_handler(work);
>   tcpm_pd_data_request(port, msg);
>    tcpm_handle_vdm_request(port, msg->payload, cnt);
>     tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> --> WARN_ON(port->vdm_state > VDM_STATE_DONE);
> 
> For this case, since the state machine could still send out discover
> identity message later if we skip current discover_identity message.

the second part of "since" is missing. since ... what ?

If this is supposed to be "since ... we should handle", just drop the
"since".

> So we should handle the received message firstly and override the pending
> discover_identity message without warning in this case. Then, a delayed
> send_discover work will send discover_identity message again.
> 
> Fixes: e00943e91678 ("usb: typec: tcpm: PD3.0 sinks can send Discover Identity even in device mode")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7f39cb9b3429..914bbaf4e25e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1445,10 +1445,19 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
>   static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>   			   const u32 *data, int cnt)
>   {
> +	u32 vdo_hdr = port->vdo_data[0];
> +
>   	WARN_ON(!mutex_is_locked(&port->lock));
>   
> -	/* Make sure we are not still processing a previous VDM packet */
> -	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +	/* If is sending discover_identity, handle received message firstly */

firstly -> first

> +	if (PD_VDO_SVDM(vdo_hdr) &&
> +		PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
> +		port->send_discover = true;
> +		mod_send_discover_delayed_work(port,
> +					SEND_DISCOVER_RETRY_MS);
> +	} else
> +		/* Make sure we are not still processing a previous VDM packet */
> +		WARN_ON(port->vdm_state > VDM_STATE_DONE);
>   
>   	port->vdo_count = cnt + 1;
>   	port->vdo_data[0] = header;
> @@ -1950,9 +1959,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>   				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
>   				if (res == 0)
>   					port->send_discover = false;
> -				else if (res == -EAGAIN)
> +				else if (res == -EAGAIN) {
> +					port->vdo_data[0] = 0;
>   					mod_send_discover_delayed_work(port,
>   								       SEND_DISCOVER_RETRY_MS);
> +				}


Both sides of if/else should have braces.

>   				break;
>   			case CMD_DISCOVER_SVID:
>   				res = tcpm_ams_start(port, DISCOVER_SVIDS);
> @@ -2035,6 +2046,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>   			unsigned long timeout;
>   
>   			port->vdm_retries = 0;
> +			port->vdo_data[0] = 0;
>   			port->vdm_state = VDM_STATE_BUSY;
>   			timeout = vdm_ready_timeout(vdo_hdr);
>   			mod_vdm_delayed_work(port, timeout);

