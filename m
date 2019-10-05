Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56036CCBB2
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2019 19:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfJERgF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Oct 2019 13:36:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41619 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfJERgF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Oct 2019 13:36:05 -0400
Received: by mail-pg1-f194.google.com with SMTP id s1so5579967pgv.8
        for <linux-usb@vger.kernel.org>; Sat, 05 Oct 2019 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uggTIGNuLjP8JO8IlUc6otc5X4VnS1N1njWH/m7ZuQQ=;
        b=JIHytj373AYIWObY9zam1HVpjNmSe0lOezPobV58l+I1W/eFCBSV10m2NO4s1Vd02K
         9INBKCNlg9swuqOa4WdG83ZqelGfKcS2YwqMv0ET9rWmC/AKkko7sHO98Ce9HTobPr5p
         hFvq/zOsbqI7RfeyG4qZ9A3Ylt2JAqo4q/VL24WGCLcqwNxmEGRqexhgAt2suyIuNYTM
         SKf1WoGqJeRwyuhRyxXmXXOSTLDwlt5KzYcpTw0yGXslHh31IzA6HQvFMEWJb6e/yT+Y
         n1/mx21XZmyCyHP39IYxCLPII3CLQLqDkiYH4zPx1DlL4ajktyozWQ/FZexP0UaGEZ++
         q6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uggTIGNuLjP8JO8IlUc6otc5X4VnS1N1njWH/m7ZuQQ=;
        b=f/iIandCXBenbrJd1KIZarSyBJl5DGLWzWnfR90LO7H1SXLh0EbbLuFEaTes3B+RIG
         elIKCeYWax5zky33wu5j7p5k1dlvDDJ4iC7+CYDje3m+QeRROKUKSama4T+yFxwPMRLx
         zQAmJParZri87je7OL+u7aRfsW/2pbKENR7AJt2vT6jErEwSlPrV5j41sRKshAJCxNYz
         mlTazcGMPF8EFvChepCCHzm2yy1gqRYPezT0qvgl8k9rgW9HYTyQxmyfk8iN5nvpASBV
         IWq+Yl4fkoxClrVDjuzYgkV+y8FXi7JsCCxmEet8P4s4cckXE5IgQ0e3ID0li+75p7hb
         Y+jw==
X-Gm-Message-State: APjAAAXfeoXG/7ZDuzXOVjdGjVjat42YlW4nQXT4BiWDa5/oy6F0+z0m
        ThnbTM5GLSOZ4P+Kvk8uraK+LR3w
X-Google-Smtp-Source: APXvYqxtZp2sImuUYxp0LmW6YCtcMYUZxpSbpXWNDGVS35CcYbB0ROCeWA2Cyekce7kIWSBCCJFhZw==
X-Received: by 2002:a63:5724:: with SMTP id l36mr21787261pgb.295.1570296964040;
        Sat, 05 Oct 2019 10:36:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w134sm11000086pfd.4.2019.10.05.10.36.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 10:36:03 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] usb: typec: Separate the operations vector
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
References: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
 <20191004150817.45413-4-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9f45326d-8667-25e0-755a-37d1a76e5b83@roeck-us.net>
Date:   Sat, 5 Oct 2019 10:36:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004150817.45413-4-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/4/19 8:08 AM, Heikki Krogerus wrote:
> Introducing struct typec_operations which has the same
> callbacks as struct typec_capability. The old callbacks are
> kept for now, but after all users have been converted, they
> will be removed.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/class.c | 39 +++++++++++++++++++++++++++++----------
>   include/linux/usb/typec.h | 20 ++++++++++++++++++++
>   2 files changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 89ffe370e426..f4972b7ee022 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -54,6 +54,7 @@ struct typec_port {
>   
>   	const struct typec_capability	*orig_cap; /* to be removed */
>   	const struct typec_capability	*cap;
> +	const struct typec_operations   *ops;
>   };
>   
>   #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
> @@ -956,7 +957,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>   		return -EOPNOTSUPP;
>   	}
>   
> -	if (!port->cap->try_role) {
> +	if (!port->cap->try_role || (!port->ops && !port->ops->try_role)) {

Even though it is only temporary, this should be
	if (!port->cap->try_role && (!port->ops || !port->ops->try_role)) {

otherwise both cap->try_role and ops->try_role must exist. Also, there would
be a crash if port->cap->try_role and port->ops are both NULL. Same pretty
much everywhere below.

Guenter
