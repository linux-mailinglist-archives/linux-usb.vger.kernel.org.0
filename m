Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A560635AA3F
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 04:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDJCMk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 22:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDJCMj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 22:12:39 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95C6C061762
        for <linux-usb@vger.kernel.org>; Fri,  9 Apr 2021 19:12:25 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 25so6242641oiy.5
        for <linux-usb@vger.kernel.org>; Fri, 09 Apr 2021 19:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RysMo0l7WPoFvlhCsWYaw6uHiJCcSPuiX9YAISHSmKQ=;
        b=ClA5j0gja2sAf4+dcK8o1eP0ui2BV6zcA2a2Gcs544fgkBDvORmLvHiJwOsYBapfsP
         YDauSPzPUzhP0o4KWiK7IUY62wINeKKuls/+u7Di/nJvUYHlPJsOQJcix8zr0Hs578Gy
         wU4GrQ+GHU7qDpMV6OW0nBoUyNGc+h+z4QN4ctX64kFsdvUEXkAFUYak5M8Y3qQUm2Ru
         YyuKOCWNfzUq+XMWLPJqBBKkXAS27AF5hPuD3Ldy9/CLlIqaTiT4EbdtvuKmZEnVN6Kb
         qBAlNyMAL3ceYHBuRKwmnG/5Ux2I1xA3Yz64RdgvKRnbYxEXA2Mbva+mT7xETq2784oH
         LjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RysMo0l7WPoFvlhCsWYaw6uHiJCcSPuiX9YAISHSmKQ=;
        b=DCEdVz7RLCpI7WEODA6W67T8hiv2V2NslFPZoW8jXosuoCsgH1Pw1KaJu3MC/StHjs
         7O6xKTirkvzsm9prHZvpVSLSohppencC/3NoMthE4w+JlMuj0j5zVuCOyzJ4Cvz176j+
         6574W67f6WOc6BIezSh32UaAHWdWSMFJq8VoarPm2M6g6n79zEJzl4erBzIYmDyJ894e
         ldiELcDIGBP/NDBfitnfKvwJn4ZW2HtSnBsdSqbHhlCo4nnJ6ulDMN8hj+KZ0hQdF/9R
         KRJqwPmiFSsHdac8FRGAj+LvqW3oFGVUxZQkwXLclb+O/wT8bLfh1YKxiME1XEfCVNAc
         pV8A==
X-Gm-Message-State: AOAM5324FWku/ejyUkbEJoAPMUB4p6GByX5s85Kfum+tDkpt82cZLBHE
        dVGsmno85rPy5hYMumk1wec0135CQa0=
X-Google-Smtp-Source: ABdhPJyapjy4svkjALzG9UP1yYa12JvKko1uaH84AQ2UslO24evmq/WzQ1JZUYZse4/EMfx4nt/Qfw==
X-Received: by 2002:aca:3788:: with SMTP id e130mr11687783oia.45.1618020744890;
        Fri, 09 Apr 2021 19:12:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u126sm412169oig.4.2021.04.09.19.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 19:12:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: Add typec_port_register_altmodes()
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
References: <20210409134033.105834-1-hdegoede@redhat.com>
 <20210409134033.105834-2-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <39a2076c-2df0-658b-26eb-78d763140140@roeck-us.net>
Date:   Fri, 9 Apr 2021 19:12:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409134033.105834-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/9/21 6:40 AM, Hans de Goede wrote:
> This can be used by Type-C controller drivers which use a standard
> usb-connector fwnode, with altmodes sub-node, to describe the available
> altmodes.
> 
> Note there are is no devicetree bindings documentation for the altmodes
> node, this is deliberate. ATM the fwnodes used to register the altmodes
> are only used internally to pass platform info from a drivers/platform/x86
> driver to the type-c subsystem.
> 
> When a devicetree user of this functionally comes up and the dt-bindings
> have been hashed out the internal use can be adjusted to match the
> dt-bindings.
> 
> Currently the typec_port_register_altmodes() function expects
> an "altmodes" child fwnode on port->dev with this "altmodes" fwnode having
> child fwnodes itself with each child containing 2 integer properties:
> 
> 1. A "svid" property, which sets the id of the altmode, e.g. displayport
> altmode has a svid of 0xff01.
> 
> 2. A "vdo" property, typically used as a bitmask describing the
> capabilities of the altmode, the bits in the vdo are specified in the
> specification of the altmode.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
> - Rename typec_port_register_altmodes_from_fwnode() to
>   typec_port_register_altmodes()
> - Use fwnode_for_each_child_node()
> 
> Changes in v2:
> - Drop the unnecessary fwnode parameter from
>   typec_port_register_altmodes_from_fwnode()
> - Document the expected "altmodes" fwnode in the commit message for now
>   as v2 of the patch-set drops the dt-bindings since there are not DT
>   users for this yet
> ---
>  drivers/usb/typec/class.c | 54 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  6 +++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 45f0bf65e9ab..af4b5d91a7c7 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1978,6 +1978,60 @@ typec_port_register_altmode(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
>  
> +void typec_port_register_altmodes(struct typec_port *port,
> +	const struct typec_altmode_ops *ops, void *drvdata,
> +	struct typec_altmode **altmodes, size_t n)
> +{
> +	struct fwnode_handle *altmodes_node, *child;
> +	struct typec_altmode_desc desc;
> +	struct typec_altmode *alt;
> +	size_t index = 0;
> +	u32 svid, vdo;
> +	int ret;
> +
> +	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
> +	if (!altmodes_node)
> +		return; /* No altmodes specified */
> +
> +	fwnode_for_each_child_node(altmodes_node, child) {
> +		ret = fwnode_property_read_u32(child, "svid", &svid);
> +		if (ret) {
> +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		ret = fwnode_property_read_u32(child, "vdo", &vdo);
> +		if (ret) {
> +			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		if (index >= n) {
> +			dev_err(&port->dev, "Error not enough space for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		desc.svid = svid;
> +		desc.vdo = vdo;
> +		desc.mode = index + 1;
> +		alt = typec_port_register_altmode(port, &desc);
> +		if (IS_ERR(alt)) {
> +			dev_err(&port->dev, "Error registering altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		alt->ops = ops;
> +		typec_altmode_set_drvdata(alt, drvdata);
> +		altmodes[index] = alt;
> +		index++;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
> +
>  /**
>   * typec_register_port - Register a USB Type-C Port
>   * @parent: Parent device
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 91b4303ca305..71b4dd6e63f1 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -17,6 +17,7 @@ struct typec_partner;
>  struct typec_cable;
>  struct typec_plug;
>  struct typec_port;
> +struct typec_altmode_ops;
>  
>  struct fwnode_handle;
>  struct device;
> @@ -138,6 +139,11 @@ struct typec_altmode
>  struct typec_altmode
>  *typec_port_register_altmode(struct typec_port *port,
>  			     const struct typec_altmode_desc *desc);
> +
> +void typec_port_register_altmodes(struct typec_port *port,
> +	const struct typec_altmode_ops *ops, void *drvdata,
> +	struct typec_altmode **altmodes, size_t n);
> +
>  void typec_unregister_altmode(struct typec_altmode *altmode);
>  
>  struct typec_port *typec_altmode2port(struct typec_altmode *alt);
> 

