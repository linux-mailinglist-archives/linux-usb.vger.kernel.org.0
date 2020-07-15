Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961D12211F1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 18:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGOQIp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 12:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgGOQGu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 12:06:50 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E3DC061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 09:06:50 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 72so2582672ple.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aLcpjP3giSGtQEE++zxMAtkZnmx1zqHtz/qLbH195uQ=;
        b=S00auzMmLSBnCVvtVZYnClQxAKbW1IBoEoixGM7lW64++kpvzvWSaBnVCfWnqDFWYU
         c6Zc0ZJ4UYqh4+iKn8HjAx1w1PDqsGhBCgVVc+hB+x20EO610y5wo1wi/Q+fAE3p0J3z
         FdI1i03K+u/sRrLtJe64Qu85Asg+kyjk8iSPp8Sp5SXxxzaKV0LKwIN+jhQ33aYn5zYJ
         HW+YRxhMvdPnn+5KKBNfxLu+aGRZeaFWjhBqE5K5hQ3jEP+B6LqDzyG2iUl2KAdlqmPE
         fDWoonJkNmOpgHhCNeNslFrALlAArn10cglOm305dxCfK4Vs951OmaPix8HF4rqh7el9
         Wlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aLcpjP3giSGtQEE++zxMAtkZnmx1zqHtz/qLbH195uQ=;
        b=hJiAD9sZsTo6oMG0nH0RHwC3B9GmWrpmPn5N1xXu4O2BDmTLj9dgMKydnCiPUjEmrJ
         rZPc01/o4shrmxdqamiYKBxaCDt+K4F0/YebqkLbAsxc5VNgLeCdIE/PKWtz+EcQhnvZ
         kulg9ECUs5f8f/9G4wYjmLT40b5Cj+KcfJTc2+0jcBFU8u7Yma0flBbkOICQWLbe7UJl
         QtXkWcYY3mY/jpf8Yt+3lTy8a4bBfDC8bE026siAIFkYP5RfvbdTMAtFcLsmg5ybmaIa
         BsraDwTde//cxl9A1ZuxmIV84FGOszCj1ivdarfq8o8hFOvG3dSP246koO8A85IBq6C7
         fLEg==
X-Gm-Message-State: AOAM5330n6KEzrXIqn4KQexBR+tBuEPqvzhSyW8FeTrgQctZErXdwKGv
        emA1d/xcbKPtcIGPKmDc55FOdaWD
X-Google-Smtp-Source: ABdhPJwVr6fcCyOPNNUv5X8lrXk7uHvt0bvDJavfmKKHYd6YvU288uwsljG4EXFrQsWsPR8+3VXDXg==
X-Received: by 2002:a17:902:ff13:: with SMTP id f19mr117695plj.339.1594829210194;
        Wed, 15 Jul 2020 09:06:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19sm2478648pjs.11.2020.07.15.09.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 09:06:49 -0700 (PDT)
Subject: Re: [PATCH 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not
 tryong to send 2 VDM packets at the same time
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-7-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <b6c000b9-cd8a-f843-1473-0de8c5c6593f@roeck-us.net>
Date:   Wed, 15 Jul 2020 09:06:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715132301.99816-7-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/15/20 6:23 AM, Hans de Goede wrote:
> The tcpm.c code for sending VDMs assumes that there will only be one VDM
> in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
> deep.
> 
> This assumes that the higher layers (tcpm state-machine and alt-mode
> drivers) ensure that queuing a new VDM before the old one has been
> completely send (or it timed out) add a WARN_ON to check for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

subject: s/tryong/trying/

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index ea14240423d1..5adc30666566 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -971,6 +971,9 @@ static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>  {
>  	WARN_ON(!mutex_is_locked(&port->lock));
>  
> +	/* Make sure we are not still processing a previous VDM packet */
> +	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
>  	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
> 

