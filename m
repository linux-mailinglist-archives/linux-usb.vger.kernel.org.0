Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC65699D45
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 20:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjBPT7l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 14:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjBPT7k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 14:59:40 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A923B220
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 11:59:38 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id j22-20020a4ad6d6000000b0051fcc9bff19so343289oot.12
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MC8mXNoLebS4BjvTZpkKIdVBXCr5PEI2huDeMNCwnII=;
        b=J0W4Q1LNRdS4+kGGbLHcHYfOrDuPciDULfiClaB0kVaBY30oWKI5QySF9jATJmWqfo
         T7/CP2jtmcz2xXbbnyptSLpa1T34rttD+pMOKkv+E5CmqxchbZeyPsVoXSxSh3tIaMig
         CCSDoDyiHsycDe9YAOLXLkckf5AfLzzEmlO5w/F9fUxdGykhBw9g9BIuiPhnpoYw/w2d
         Bwpwm8c+eQI3Kv6QQgmfoPt7b4zwC6i/pelaKpYZ92F++4R11/7ARI8pwiOmCCtQjw2R
         ckBM324qW4e9Md228XySYMvX3K5xX1i5TOT3jJWEJy63gnKk5RSxCS3IvkIz3lNnCiUe
         jAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MC8mXNoLebS4BjvTZpkKIdVBXCr5PEI2huDeMNCwnII=;
        b=YeiXYkqHM7Os8k4FcD04owfpVtwEP7fBD77i0NUJ6kLRE5grj2MOwEuXA9zhGcJYuJ
         kEzq0oRWuxXaowpivP8NCZz0mRHt9KFACSjQpKriIy3gkwYhxEnnBh/Xg0Kg0MStA7r1
         bewnql7XDE8jRb35gu5UYxqoU2h8FKfh5NENsXX7kVJw4hHyyS+zJyq4ZFJqaHACXU2G
         izjxOH9SPU6I0lBoMCOU0pjSPoeTvaPAAD4oXYJl6J+/XldRtBpObKgIedyYTBW+H3e+
         b3I/L5htes/DDr75EjiX0Nb6CL+KdZAzXroC5nr6HtK6g6yohForvxFLL9zo6BkTueuL
         hrhQ==
X-Gm-Message-State: AO0yUKWKNE24n2/S/zmWZ1Ua0gOVo8ucOk/VtuNu2mNWPhTXmQBAuMp1
        2kQ2rs9SUQkxSgdul7eZTV+mFOCHCfE=
X-Google-Smtp-Source: AK7set8R50Ne/0pvJKhTCGRJYrzRMuLad35L7iCAIzgXi98S89veozMCov+P7wsuALHcAp2UNRqGrw==
X-Received: by 2002:a4a:c617:0:b0:51a:4c5d:fd1e with SMTP id l23-20020a4ac617000000b0051a4c5dfd1emr2963144ooq.9.1676577578028;
        Thu, 16 Feb 2023 11:59:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c25-20020a4ad799000000b004c60069d1fbsm1031670oou.11.2023.02.16.11.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:59:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0414eea3-bfb0-c806-765d-54bb612c706d@roeck-us.net>
Date:   Thu, 16 Feb 2023 11:59:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] usb: typec: tcpm: fix warning when handle
 discover_identity message
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20230216031515.4151117-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230216031515.4151117-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/15/23 19:15, Xu Yang wrote:
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
> For this case, the state machine could still send out discover
> identity message later if we skip current discover_identity message.
> So we should handle the received message firstly and override the pending
> discover_identity message without warning in this case. Then, a delayed
> send_discover work will send discover_identity message again.
> 
> Fixes: e00943e91678 ("usb: typec: tcpm: PD3.0 sinks can send Discover Identity even in device mode")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> Changelogs:
> v2: modify some code format and commit message
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7f39cb9b3429..1ee774c263f0 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1445,10 +1445,18 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
>   static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>   			   const u32 *data, int cnt)
>   {
> +	u32 vdo_hdr = port->vdo_data[0];
> +
>   	WARN_ON(!mutex_is_locked(&port->lock));
>   
> -	/* Make sure we are not still processing a previous VDM packet */
> -	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +	/* If is sending discover_identity, handle received message first */
> +	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
> +		port->send_discover = true;
> +		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
> +	} else {
> +		/* Make sure we are not still processing a previous VDM packet */
> +		WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +	}
>   
>   	port->vdo_count = cnt + 1;
>   	port->vdo_data[0] = header;
> @@ -1948,11 +1956,13 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>   			switch (PD_VDO_CMD(vdo_hdr)) {
>   			case CMD_DISCOVER_IDENT:
>   				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
> -				if (res == 0)
> +				if (res == 0) {
>   					port->send_discover = false;
> -				else if (res == -EAGAIN)
> +				} else if (res == -EAGAIN) {
> +					port->vdo_data[0] = 0;
>   					mod_send_discover_delayed_work(port,
>   								       SEND_DISCOVER_RETRY_MS);
> +				}
>   				break;
>   			case CMD_DISCOVER_SVID:
>   				res = tcpm_ams_start(port, DISCOVER_SVIDS);
> @@ -2035,6 +2045,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>   			unsigned long timeout;
>   
>   			port->vdm_retries = 0;
> +			port->vdo_data[0] = 0;
>   			port->vdm_state = VDM_STATE_BUSY;
>   			timeout = vdm_ready_timeout(vdo_hdr);
>   			mod_vdm_delayed_work(port, timeout);

