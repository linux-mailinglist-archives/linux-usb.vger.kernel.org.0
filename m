Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A0A3F62D9
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 18:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhHXQmP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 12:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhHXQmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 12:42:14 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AF6C061757
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 09:41:30 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id x10-20020a056830408a00b004f26cead745so47731196ott.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gsMp9YeV3Jw6HTFjUwanyIxFCXQiRC3kiTA6uFyoPQo=;
        b=PBIBdoTuUHjYWnDrGToqsnI7GxnP7Xn6L+st839JjUhxbtfZN7LpWzatw7jp27MQRI
         6k/HKAGY76CLeRwLbSjeD1t7KS8J8/VrALpqL8nqgmz04R2oqkKpChrH1n0Vy3nJBKk3
         MzH+i/mSAGUKR+9chwykNJqhxISLqOSZ436meav4Ma6V2c0eLlP8IKAokrHpsvZVK6d+
         VxiQX7tnhUNIjU/1JkAM5rjWVMtjXKEkVSrUUuJAtTZpmRRtkkTgXiAEP+LGyzmDFRBv
         /wRK5uCE6KqC8IWnUGFHej66K6OQ6qpviVWdE40xhUU/YR7l2+2G/9wA5KaVTexbyPcw
         6jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gsMp9YeV3Jw6HTFjUwanyIxFCXQiRC3kiTA6uFyoPQo=;
        b=ci2j0qpyn6DLaIa7gCrjZkqJIA+HITlGCfylvCafrwU6bStrjtsehWDMTt6EZqTuFt
         J93xbv0pbsUua2YWobzRAOn7O9jOi322DJRUcmKHI5pXuei5ODZvZiwA64Glj7Hy7SX0
         ikCiql3HqyMNUdi+SvMP3gezgbXtKapJdnReZ8SLiG+KgY+02LoEeuM7u9zSDmAffpBi
         irmFTYPV8QSdpE+cgurNysvSKwd2ZgJoosAH+HlRtSLnQKX10t5av/ZRl6MNVsaISPPC
         qABEbp5ElxjQEAEPZfzQuJppDY/35cBEQhys3OOtGxy87HjrjV/S1s18saOXdSfn8P4M
         T9+w==
X-Gm-Message-State: AOAM533Fjf4ZeMpIaqdD/8gUBZ22BgPuYCO36RswmfbqpWREj69VhXk4
        bydrDQ6s8qaflUO3WLwO4NltJj8h9Ck=
X-Google-Smtp-Source: ABdhPJxIRYeawggPLIKpYWVQaJ+2XGTTmIRLs2CTgCHIbckZFMq/dMp6jQyaIYAbKLduPcK9g0M6dg==
X-Received: by 2002:a54:4189:: with SMTP id 9mr3380124oiy.45.1629823289624;
        Tue, 24 Aug 2021 09:41:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13sm4286755ota.17.2021.08.24.09.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 09:41:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
References: <20210824113014.1420117-1-xu.yang_2@nxp.com>
 <20210824113014.1420117-2-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: Don't handle two continuous same
 state
Message-ID: <20669608-3cef-69bb-6668-b110d91011a8@roeck-us.net>
Date:   Tue, 24 Aug 2021 09:41:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824113014.1420117-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/24/21 4:30 AM, Xu Yang wrote:
> When two tcpm_set_state are successively executed in non-worker context,
> such as tcpm_init, an abnormal sequence may be exist which causes two
> continuous same state to be handled.
> 
> tcpm_init:
> [    1.686293] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
> [    1.686300] state change SNK_UNATTACHED -> PORT_RESET [rev1 NONE_AMS]
> [    1.686309] 1-0050: registered
> [    1.686315] Setting usb_comm capable false
> [    1.687417] Setting voltage/current limit 0 mV 0 mA
> [    1.687425] polarity 0
> [    1.690709] Requesting mux state 0, usb-role 0, orientation 0
> [    1.691599] cc:=0
> [    1.691871] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
> [    1.691880] Setting usb_comm capable false
> [    1.692973] Setting voltage/current limit 0 mV 0 mA
> [    1.692980] polarity 0
> [    1.696843] Requesting mux state 0, usb-role 0, orientation 0
> [    1.697729] cc:=0
> [    1.697994] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
> 
> abnormal sequence:
>              [tcpm_init]                 [tcpm_state_machine_work]
> 1       tcpm_set_state(A)
> 2           port->state = A
> 3           kthread_queue_work
> 4           queue work to worker_list
> 5                                       dequeue work from worker_list
> 6       tcpm_set_state(B)
> 7           port->state = B
> 8           kthread_queue_work
> 9           queue work to worker_list
> 10                                      tcpm_state_machine_work(B)
> 11                                      port->state not change
> 12                                      dequeue work from worker_list
> 13                                      tcpm_state_machine_work(B)
> 
> state B is handled twice.
> 
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 4bdf119b1306..e0a319e00b12 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4825,6 +4825,10 @@ static void tcpm_state_machine_work(struct kthread_work *work)
>   		port->delayed_state = INVALID_STATE;
>   	}
>   
> +	/* If target state is the same as the last entered state, skip it */
> +	if (port->enter_state == port->state)
> +		goto done;
> +

I don't think that really solves the problem; it looks more like a bandage around
a race condition between setting a state in one context and executing the state
machine in another. I think it would be better to solve the underlying race condition.

The problem is ultimately that tcpm_init() ends up calling tcpm_set_state() several
times, the last time being PORT_RESET. The worker starts running and waits for the
port lock to be released. Since the worker is already running, but state_machine_running
is not yet set, tcpm_set_state() triggers it again. Maybe we need a second flag to detect
and handle that situation, or a better means to determine if the worker is running.

Guenter
