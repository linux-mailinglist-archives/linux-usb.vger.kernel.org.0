Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010C25599B7
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 14:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiFXMhQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 24 Jun 2022 08:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiFXMhP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 08:37:15 -0400
Received: from relay3.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EE649B4B
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 05:37:12 -0700 (PDT)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay09.hostedemail.com (Postfix) with ESMTP id D2E5735619;
        Fri, 24 Jun 2022 12:37:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id E93452000E;
        Fri, 24 Jun 2022 12:37:09 +0000 (UTC)
Message-ID: <85d412b8b2413d98e429ec129880f69e99c98539.camel@perches.com>
Subject: Re: [PATCH v3] usb: core: sysfs: convert sysfs snprintf to
 sysfs_emit
From:   Joe Perches <joe@perches.com>
To:     Xuezhi Zhang <zhangxuezhi1@coolpad.com>, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 24 Jun 2022 05:37:08 -0700
In-Reply-To: <20220624121238.134256-1-zhangxuezhi1@coolpad.com>
References: <20220624121238.134256-1-zhangxuezhi1@coolpad.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Stat-Signature: 9cz97snbq574dqak5cjmwp8gnyddnphg
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E93452000E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19doAksNQTzzDb3N0l/jfNYmXntlhnyNPk=
X-HE-Tag: 1656074229-728643
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-06-24 at 20:12 +0800, Xuezhi Zhang wrote:
> Fix up all sysfs show entries to use sysfs_emit

Thanks.

Some trivia: (perhaps for a separate patch)

> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
[]
> @@ -35,7 +35,7 @@ static ssize_t field##_show(struct device *dev,				\
>  		return -EINTR;						\
>  	actconfig = udev->actconfig;					\
>  	if (actconfig)							\
> -		rc = sprintf(buf, format_string,			\
> +		rc = sysfs_emit(buf, format_string,			\
>  				actconfig->desc.field);			\

It's much more common to use fmt and not format_string

Using fmt would make several multi-line statements fit on a single line

e.g.:

		rc = sysfs_emit(buf, fmt, actconfig->desc.field);	\

> @@ -305,8 +305,8 @@ static ssize_t ltm_capable_show(struct device *dev,
>  				struct device_attribute *attr, char *buf)
>  {
>  	if (usb_device_supports_ltm(to_usb_device(dev)))
> -		return sprintf(buf, "%s\n", "yes");
> -	return sprintf(buf, "%s\n", "no");
> +		return sysfs_emit(buf, "%s\n", "yes");
> +	return sysfs_emit(buf, "%s\n", "no");

Using a ?: might be nicer

	return sysfs_emit(buf, "%s\n",
			  usb_device_supports_ltm(to_usb_device(dev)) ? "yes" : "no");

>  static ssize_t persist_store(struct device *dev, struct device_attribute *attr,
> @@ -372,7 +372,7 @@ static ssize_t connected_duration_show(struct device *dev,
>  {
>  	struct usb_device *udev = to_usb_device(dev);
>  
> -	return sprintf(buf, "%u\n",
> +	return sysfs_emit(buf, "%u\n",
>  			jiffies_to_msecs(jiffies - udev->connect_time));

Might be nicer to rewrap multi-line statements to the open parenthesis

	return sysfs_emit(buf, "%u\n",
			  jiffies_to_msecs(jiffies - udev->connect_time));


