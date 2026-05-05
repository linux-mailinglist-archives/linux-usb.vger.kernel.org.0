Return-Path: <linux-usb+bounces-36914-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ELBNW9R+Wlm7wIAu9opvQ
	(envelope-from <linux-usb+bounces-36914-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 04:09:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3668B4C5ED1
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 04:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E48113024A63
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 02:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB85371CEE;
	Tue,  5 May 2026 02:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YmSSFbcL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F59C377542
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 02:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777946975; cv=none; b=LQnM111CVmZgwz7es1albsIU3xJesfe3j3dZp/7Gt64zrhbcAkz3reuQwU+QtyW3WOum9cktPTR2voFfcWnuv4cp8PUcB8kDUB23jtRVN85zMijwVEPeKfPirRP6AFP7TBBjlePzLgXnu831siK2ydruzhaPxMZqGYNEKAwf1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777946975; c=relaxed/simple;
	bh=GhaFSxf/YPxXr7a+0yeJ7IIruBAbs2xGJRlNXistUGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb8CuhmkPzJfKir2exVKNDracBst+/WLvwBOiMdhN2h11tBoBgyB9ol+XaZDn0SX6U578XUtIywpwWp2cGbGcsQRcu1gEbwvmqutoUynmt5p4Ny/TnDW+c9Dw3jV/KRLXKzbqmuORYcrryBdQIGrjN+uUDF3H0XGcgkGS7kKAdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YmSSFbcL; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50fbd79350dso46722411cf.3
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777946971; x=1778551771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d4sI+IjXFPTlscKN3eGWCxCCUGPG1ef5danF4QZAVtw=;
        b=YmSSFbcLUvQPxulCtpioFMuHcPdbfVQAWRuluoGFmc8IY44M5wufrDGnpC5XjYZgrT
         45L/BTtGSogeqncGNKAQF3quGq2lnr8r9OiCrfQnGoyeJf/hYQerqLobje1Rv1IhZrzr
         1gynasR8HsENKsherttd//CAiNo88moWKB74VzrvNU2PmoHxGxOFAa18Ukuuf99POTXf
         6I9ZpPOs5szjGKRKFLuem+Opnt1byi6u2sNGMF2yFAGE3+gRDC7QrufL1gemOW1U6EkH
         tuqDlg/yA3H8MIryNDFH+C0LTdJofSO2FRdN6/Dk0PibVns5I118BAx0a0ydBIUcZ0RS
         7hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777946971; x=1778551771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4sI+IjXFPTlscKN3eGWCxCCUGPG1ef5danF4QZAVtw=;
        b=ay2ayuF9Cu8CIRtjMcZZF6TJFpvGUAgtpB8Tjw4IcrH3xSEmDxVnI1ZsTUQHuteMxl
         F4I46MegdU4TC/MtSqRSdWxR7yWHy2vSSlQt6m/u/4dwLHYwjkOasLv0Z5H0B0KD8zzA
         2tJF8QKhOq1N3ggPWyLR9lOr7T6UaHqKwzZOjMFfn5v/TAPlSuoRQbEX+E0Wkrq0jlPf
         LPPub/eMCCDEwEmDQVtg40V+6lUD8elYkPKxTdPJnH8VtFUeWWoStWqO5WiGUDzUQHLu
         aljG2WD2Zr+IPGN8HgrHvnd6OImKT2T6M9DUPs698jHKlr+/j5oLln7cogYziNNqWRlH
         f5FA==
X-Forwarded-Encrypted: i=1; AFNElJ8FXVSFv68tc9BTCdGVUGHubUDSN/UUrUT+Ljj8s2YanToFfiTV9fZvUZQXpiGoGWxayrc+iqWvrMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrS2INr+OlMzTQ0ylXTP4W7CS8jTzwPyq0COC65j4D0vDaiC0
	aLGWv7WXTKMFR/J1CjFbAegH1Se/5P1pE4Knav7vjFdt35MVM8RPIJKOh7IjyDqOrQ==
X-Gm-Gg: AeBDiesbfmm+MHPHeL8Y4fiDAdVluJWNIJmBMS1dYNxXfjTkhoVrA0A3/J3uaOK/GGO
	jnem4eaE4omsShCPtRCdLfo7gP6zyK41TKWdxb6GYOmvpOS6KFsVT1rPpMCYtZT5ahXv5zIlJCE
	daXOUJsgTStRlnMKKgavkX5QcyBg+eica4V9jUKDBQcZOrJJ9DWVlLyISLAgsQIHQKGkhRvwiy1
	GIZdR/k0+PJXhhNPPIthUrE7Hej6SKE0N3d/4qxlFPVS0cWnTEsAVcKhvkiYEN7JODA9eXzS/8k
	hsNwpEyeMINVPSpYcAl8KIvxvz5T0bxvJxAeFhAP0D0i+ouAD5GbeTGQJOQi6RMX7giSR62EbVY
	VT8DfQulCBlYXQgodQ/I/7zSOVtsmiyaLNERZnUKugzHFE8AKKVaXkFFTCw5j2ZUWV2Ka2gcg2d
	A53PXZbaOvevK+V6CoHmM9TLxdPs+WiSUUC0U=
X-Received: by 2002:a05:622a:1791:b0:50e:614e:4433 with SMTP id d75a77b69052e-5104bf4250emr166751341cf.30.1777946971193;
        Mon, 04 May 2026 19:09:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e7d3esm152277906d6.28.2026.05.04.19.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 19:09:30 -0700 (PDT)
Date: Mon, 4 May 2026 22:09:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, oneukum@suse.com,
	linux-kernel@vger.kernel.org, naveen.v@harman.com
Subject: Re: [PATCH v3 1/3] driver core: add
 device_enumeration_failure_notify() helper
Message-ID: <0b39693a-d8b0-4c95-97ee-07b3882c4b6a@rowland.harvard.edu>
References: <20260504193309.14684-1-Akshay.Gujar@harman.com>
 <20260504193309.14684-2-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504193309.14684-2-Akshay.Gujar@harman.com>
X-Rspamd-Queue-Id: 3668B4C5ED1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36914-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,harman.com:email]

On Mon, May 04, 2026 at 07:33:07PM +0000, Akshay Gujar wrote:
> Hotpluggable buses may detect that a device is physically present,
> but enumeration can fail early due to protocol-level errors. Such
> failures are currently only visible via kernel log messages, with no
> structured notification to userspace.
> 
> Introduce device_enumeration_failure_notify(), a helper in the driver
> core that emits a KOBJ_CHANGE uevent with
> 
>   DEVICE_ENUMERATION_FAILURE=<dev_name>
> 
> This helper is intended for use by bus drivers such as USB and PCI.
> 
> Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> ---
>  drivers/base/core.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h | 11 +++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bd2ddf2aab50..1ab3b8290840 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3764,6 +3764,48 @@ int device_add(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(device_add);
>  
> +/**
> + * device_enumeration_failure_notify - notify userspace of enumeration failure
> + * @dev: device for which enumeration failed
> + *
> + * Emit a KOBJ_CHANGE uevent with
> + * DEVICE_ENUMERATION_FAILURE=<dev_name>.
> + *
> + * If @dev has not yet emitted its ADD uevent, the event may be sent
> + * from the parent device instead.
> + *
> + * The caller must hold a reference to @dev.
> + */
> +void device_enumeration_failure_notify(struct device *dev)
> +{
> +	char *envp[2] = { NULL, NULL };
> +	struct device *uevent_dev;
> +
> +	if (!dev)
> +		return;
> +
> +	/*
> +	 * If enumeration fails before @dev has emitted its ADD uevent, the
> +	 * device may still be in an early state (e.g. without a bus or class
> +	 * assigned). Emit the event from the parent device instead, while
> +	 * including DEVICE_ENUMERATION_FAILURE=<dev_name>.
> +	 *
> +	 * The caller holds a reference to @dev, so dev->parent remains valid.
> +	 */
> +	uevent_dev = dev->kobj.state_add_uevent_sent ? dev : dev->parent;
> +	if (!uevent_dev)
> +		return;
> +
> +	envp[0] = kasprintf(GFP_KERNEL, "DEVICE_ENUMERATION_FAILURE=%s",
> +			    dev_name(dev));
> +	if (!envp[0])
> +		return;
> +
> +	kobject_uevent_env(&uevent_dev->kobj, KOBJ_CHANGE, envp);
> +	kfree(envp[0]);
> +}
> +EXPORT_SYMBOL_GPL(device_enumeration_failure_notify);
> +
>  /**
>   * device_register - register a device with the system.
>   * @dev: pointer to the device structure
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 9c8fde6a3d86..b8776cfb6fa0 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1343,4 +1343,15 @@ static inline bool device_link_test(const struct device_link *link, u32 flags)
>  #define MODULE_ALIAS_CHARDEV_MAJOR(major) \
>  	MODULE_ALIAS("char-major-" __stringify(major) "-*")
>  
> +/**
> + * device_enumeration_failure_notify - notify userspace of enumeration failure
> + * @dev: device where enumeration failed
> + *
> + * Emits a KOBJ_CHANGE uevent with
> + * DEVICE_ENUMERATION_FAILURE=<dev_name>.
> + *
> + * See Documentation/ABI/testing/sysfs-uevent.
> + */
> +void device_enumeration_failure_notify(struct device *dev);
> +

I don't think it's very common to include two identical copies of the 
same kerneldoc, one for the declaration and one for the definition.  
It's wasteful and it violates the DRY ("Don't Repeat Yourself") 
principle.

Also, what does "device where enumeration failed" really mean?  Does it 
refer to the device that would have been added if the enumeration had 
succeeded?  Or does it refer to the device that is trying to enumerate a 
newly detected child?  The comment in the 
device_enumeration_failure_notify() function above seems to indicate the 
former, whereas the code added to the USB subsystem in the 3/3 patch 
does the latter.

Alan Stern

