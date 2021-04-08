Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA67C357EBE
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhDHJK4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53973 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhDHJKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 05:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617873043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RkhdQwgUHvi0PETPC2fnnJ9lJ4y8w2d+cYZRPXBPSOw=;
        b=V6iB3QoIlYSxuNDzC2SqbCQvlFnFX48rCbI3XF9wIMrqoiWQH/7zLkR2coTIxgqxhAsLQW
        QdvcfVtr3fvkBU6BRvQUEPyfIqp5/s1NSWESgDtNpV5AEYzRbvbhzcfxdXwouNljC6YGUE
        TsPZRih+qc0Sh3SaNMahPVMAbCDXJ18=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-OmPfnLwuMCSVB7RG0aAbug-1; Thu, 08 Apr 2021 05:10:41 -0400
X-MC-Unique: OmPfnLwuMCSVB7RG0aAbug-1
Received: by mail-ej1-f72.google.com with SMTP id jo6so556047ejb.13
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 02:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RkhdQwgUHvi0PETPC2fnnJ9lJ4y8w2d+cYZRPXBPSOw=;
        b=ZPPfvuQKBgr4KGpB0rf2SISM9ffdVxCHij4B50VI6qdOib8kn+iHIlf5z1vRnyh3fZ
         Xm1/bWLwOjJtm1CV6xXOgw5wg5hy+QuGr74nofodm3ynmAfPmm+3KQWo7Ye3efglp90m
         4F/i9uJPFzjIxgWyJwuVakK1SZCaa8Bkn9yqvV3GtsHvy/Km08ssW5a050lITiBg7tqw
         O0ZF9nYEKx6eH6gT90dNCZ35/+5PdA0ZvhK3ArgeyA9T0sP9c6lofcST6RMHVD00sX/k
         /0nvw7rKKf4GzmABWuvlScGmjTVdqZd6K+oqszIrAqKy4DFavEq86HhFZnL2+1lQupww
         6GMQ==
X-Gm-Message-State: AOAM532CBmsOzkbQ2cJ02uT+zprnbrB9H2cOpU2OhtRzejS2RmDV1Rwp
        Zay6cYw8pJoJ0nxP38r5S1ReHsu/kJU9xeFbCOGe0Jg+BY3b9rnNDAa4y6K7edLykmHhrHD0t5H
        rVEaszfUJaH0YAkJuL1ju
X-Received: by 2002:a17:906:e48:: with SMTP id q8mr9167354eji.84.1617873039792;
        Thu, 08 Apr 2021 02:10:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRihNaVCbYKVJyY0EjQkNhqVl4UyfOoyDnKt13PCSviz0rnl5QOerXDAplktnSaZz3b+7QXg==
X-Received: by 2002:a17:906:e48:: with SMTP id q8mr9167338eji.84.1617873039599;
        Thu, 08 Apr 2021 02:10:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bf14sm8473713edb.67.2021.04.08.02.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 02:10:39 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: typec: tcpm: remove unused static variable
 'tcpm_altmode_ops'
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210407091540.2815-1-thunder.leizhen@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7e2797f7-0ba7-0362-ae34-a1d4fb265cd7@redhat.com>
Date:   Thu, 8 Apr 2021 11:10:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210407091540.2815-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/7/21 11:15 AM, Zhen Lei wrote:
> Fixes the following W=1 kernel build warning:
> 
> drivers/usb/typec/tcpm/tcpm.c:2107:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
> 
> The reference to the variable 'tcpm_altmode_ops' is deleted by the
> commit a079973f462a ("usb: typec: tcpm: Remove tcpc_config configuration
> mechanism").
> 
> By the way, the static functions referenced only by the variable
> 'tcpm_altmode_ops' are deleted accordingly.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

I have a patch pending:

https://www.spinics.net/lists/linux-usb/msg197684.html

Which actually uses this. I really need to (and plan to) brush the dust of
this one soon and submit a new version.

As such I would prefer for these ops to not get removed. But I guess I
can always include a patch in my series reverting the removal...

Regards,

Hans



> ---
>  drivers/usb/typec/tcpm/tcpm.c | 60 -------------------------------------------
>  1 file changed, 60 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index ce7af398c7c1c1f..2f89bae29c0c297 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1365,14 +1365,6 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	mod_vdm_delayed_work(port, 0);
>  }
>  
> -static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
> -				    const u32 *data, int cnt)
> -{
> -	mutex_lock(&port->lock);
> -	tcpm_queue_vdm(port, header, data, cnt);
> -	mutex_unlock(&port->lock);
> -}
> -
>  static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	u32 vdo = p[VDO_INDEX_IDH];
> @@ -1705,8 +1697,6 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	 *
>  	 * And we also have this ordering:
>  	 * 1. alt-mode driver takes the alt-mode's lock
> -	 * 2. alt-mode driver calls tcpm_altmode_enter which takes the
> -	 *    tcpm port lock
>  	 *
>  	 * Dropping our lock here avoids this.
>  	 */
> @@ -2060,56 +2050,6 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
>  	return 0;
>  }
>  
> -static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
> -{
> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> -	int svdm_version;
> -	u32 header;
> -
> -	svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> -	if (svdm_version < 0)
> -		return svdm_version;
> -
> -	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
> -	header |= VDO_OPOS(altmode->mode);
> -
> -	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0);
> -	return 0;
> -}
> -
> -static int tcpm_altmode_exit(struct typec_altmode *altmode)
> -{
> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> -	int svdm_version;
> -	u32 header;
> -
> -	svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> -	if (svdm_version < 0)
> -		return svdm_version;
> -
> -	header = VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
> -	header |= VDO_OPOS(altmode->mode);
> -
> -	tcpm_queue_vdm_unlocked(port, header, NULL, 0);
> -	return 0;
> -}
> -
> -static int tcpm_altmode_vdm(struct typec_altmode *altmode,
> -			    u32 header, const u32 *data, int count)
> -{
> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> -
> -	tcpm_queue_vdm_unlocked(port, header, data, count - 1);
> -
> -	return 0;
> -}
> -
> -static const struct typec_altmode_ops tcpm_altmode_ops = {
> -	.enter = tcpm_altmode_enter,
> -	.exit = tcpm_altmode_exit,
> -	.vdm = tcpm_altmode_vdm,
> -};
> -
>  /*
>   * PD (data, control) command handling functions
>   */
> 

