Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1BF4CCBB3
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2019 19:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbfJERhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Oct 2019 13:37:54 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38093 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbfJERhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Oct 2019 13:37:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id x10so5599896pgi.5
        for <linux-usb@vger.kernel.org>; Sat, 05 Oct 2019 10:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8QUckDowABtG2OK1dEo6Hy4YQHZyDqUycrv+JMp0dmg=;
        b=EztDTqHOsnBS2et1yD4e0w3VbsrgPKWzkSHmJQvw5/Wy7XG51ykMUACdx4gd2QvDZj
         lCdgsI6IzmGNGxTWjmXL/sy2DYhOqzHl65agn+I+v6HXhg98eYAcRcublY1SUmzg1kaM
         insTyPlFFtzW3NVzyMAoZxN1IjiMLpMJCU/B+ZKczAv/x60wdixi0MFww7yqxd28jtfb
         bwzmjHp7/Che0rcR5HgX1nbCU5bycZcl1E7bdSCS5KhIjSAGSm5LIZ0HYIMviTn7VwFR
         I15hh2lhpJC04/U5pgUJDQ1k/xWdPG3rkpym/3O3BhwM+ftBIacBEHz4MTTE1Yieq3/1
         KVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8QUckDowABtG2OK1dEo6Hy4YQHZyDqUycrv+JMp0dmg=;
        b=NERU0OBSMFGhRBmkI+g2rDw8rNZ2Mu8CcLBvwPCaD82ba6P3APDhBRWrxPHj7i9E5+
         +BiUIlKpTDZq6T3TkxzpJcV2I2vdYuWNksIUVyIqBjtzxnhn2lXpJJRArKAfnpL6auAU
         nKDOdHqJUdpAKdSBJPgtKllbqG0KjbHFH0h3CgyeuaJx2owMTFfC/7XnraVDNxwZrYct
         3sJzvsiPSurevLcKttMC4eQvqYnlu4+cOZcdqSARwVuj29/yQdJ7a8Bk37gPx3WsGZaz
         75rI+1GBiGLqvBCdFwnAE0ngkNkzx29n1EwAkIYIPTTLoPsMyXFSEWEnUYjyke2EmKvT
         w2QQ==
X-Gm-Message-State: APjAAAUCQ4nrFclY6Vws0jISUU8tuZ+irSBd0AIUJDQEKDM6kqPamhF+
        Is2u8SFvkWvxtv47ov0HB3Ja+XRK
X-Google-Smtp-Source: APXvYqwQ5KQZwMjiHFqvAG3Er9WQOGmI/LqL4EWy/piO44Oi+4ziceO2ScW5V4vpEG/P9TK8afw74w==
X-Received: by 2002:a17:90a:fc8:: with SMTP id 66mr24058796pjz.134.1570297072535;
        Sat, 05 Oct 2019 10:37:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i74sm12482063pfe.28.2019.10.05.10.37.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 10:37:51 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] usb: typec: Remove the callback members from
 struct typec_capability
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
References: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
 <20191004150817.45413-8-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e6ff8434-5f09-5e86-a32b-eea2834dbd28@roeck-us.net>
Date:   Sat, 5 Oct 2019 10:37:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004150817.45413-8-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/4/19 8:08 AM, Heikki Krogerus wrote:
> There are no more users for them.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/class.c | 38 ++++++++++----------------------------
>   include/linux/usb/typec.h | 17 -----------------
>   2 files changed, 10 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index f4972b7ee022..e7b92f650ba0 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -52,7 +52,6 @@ struct typec_port {
>   	struct typec_switch		*sw;
>   	struct typec_mux		*mux;
>   
> -	const struct typec_capability	*orig_cap; /* to be removed */
>   	const struct typec_capability	*cap;
>   	const struct typec_operations   *ops;
>   };
> @@ -957,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
>   		return -EOPNOTSUPP;
>   	}
>   
> -	if (!port->cap->try_role || (!port->ops && !port->ops->try_role)) {
> +	if (!port->ops && !port->ops->try_role) {

I think this should be
	if (!port->ops || !port->ops->try_role) {
or the code would crash if port->ops is NULL. Same everywhere else below.

Guenter
