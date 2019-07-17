Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7086BD12
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 15:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGQNdk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 09:33:40 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36736 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfGQNdj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 09:33:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so11184599pgm.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cxHPMiG+WqmnI0H/Wq3+yKNSQIJxv1cJctwHZp3FbeQ=;
        b=RZJKUY5vjwb/l8Aj8uYOql3b2hszH4I57qqflA+jRiL9b6IXmWroS6ACBnidp7CbPC
         I5y0eJi1z3Yf8Aalislk2h9AggLx6m8jxYc6dhBryrmNCnr5t2LlOhsf/gT6jonDOvtJ
         Eph4EdDZw7tiasAX59WI6zGNPx9fWNqbYkIU3zrFawz++CuDJJ620K1vPUyBWdcWg/BV
         rZzWTjfu+icFcb6fbwSANJs9JGb6t5f8wNueEyZX26dbRf1oZ+f4TJq+bTiiwW1bwIEK
         VG7z7smN4iT1+YEF/7I1m5RsXFgvQjhZ4vNQbyDS3sLE3tEzeAZo8eZBuzuhWRNEykeP
         jDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cxHPMiG+WqmnI0H/Wq3+yKNSQIJxv1cJctwHZp3FbeQ=;
        b=tm1GdEs4L83nq3zRxrWRJOwDyTCwnMbYf6f2IUCA5HOHO2VqBtrCtajBCFy54KZyIl
         yBerwqwa848bdFs/Q/2YPFy2lNiL8GhVbeUFMFjyXUtIvky7QSBLuIHVn2KpUNzb1K2H
         1tTNCY45aGEVSuFCep0/+WeRPaNTQB4cUJLKcCyT2StHb06CZ1ITWKfy3AtmTo+fhHMI
         INMc1Qp1VSG2zRPJRdsXpjgXZvdUs+h6uGCEhHQqxvP+Zwt0vsBuPHlOf/otOEJIYKPc
         Ul0zdrruXA0NXBAKF/PZ7ImRAF+KmMmRJo+o6EBDqWJE3a4ls2+GCX4doS3cz5tlZUfF
         jOnQ==
X-Gm-Message-State: APjAAAW0GpoHgXaC4zHsO5ci/whfU55uB0HhrbdTO3a+Hdl0EfpL3wMi
        KXLJxlK9DfunZn2pXyXkxZo=
X-Google-Smtp-Source: APXvYqx/HbRYJWrtqKSsvIhVK+OOLpZkfr26REhoh0zGnBQ1z504nyZK0slvhOGnRh3+caYqTzWf3Q==
X-Received: by 2002:a17:90a:35e6:: with SMTP id r93mr44242492pjb.20.1563370419282;
        Wed, 17 Jul 2019 06:33:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21sm22594696pjh.25.2019.07.17.06.33.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 06:33:38 -0700 (PDT)
Subject: Re: [PATCH 2/2] usb: typec: tcpm: remove tcpm dir if no children
To:     jun.li@nxp.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
References: <20190717080646.30421-1-jun.li@nxp.com>
 <20190717080646.30421-2-jun.li@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2a9f2e6e-e497-e141-801f-c18224017524@roeck-us.net>
Date:   Wed, 17 Jul 2019 06:33:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717080646.30421-2-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/17/19 1:06 AM, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> If config tcpm as module, module unload will not remove tcpm dir,
> then the next module load will have problem: the rootdir is NULL
> but tcpm dir is still there, so tcpm_debugfs_init() will create
> tcpm dir again with failure, fix it by remove the tcpm dir if no
> children.
> 
> Cc: stable@vger.kernel.org # v4.15+
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 1249d8e..86e4552 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -596,6 +596,10 @@ static void tcpm_debugfs_exit(struct tcpm_port *port)
>   	mutex_unlock(&port->logbuffer_lock);
>   
>   	debugfs_remove(port->dentry);
> +	if (list_empty(&rootdir->d_subdirs)) {
> +		debugfs_remove(rootdir);
> +		rootdir = NULL;
> +	}
>   }
>   
>   #else
> 

