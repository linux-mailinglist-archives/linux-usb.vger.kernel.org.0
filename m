Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8756D2FB3
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 12:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjDAKs7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 06:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDAKs6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 06:48:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B014902B
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680346092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zUv7dZXh9mIvQJQIA/OX5UG+LOgfqbX9QQwiu1BwMBc=;
        b=ePjVPgO/JQoSkphTjRvl0YxUt2NBeJxCn7Xi8AeT1OsfWCCtfr1af9kZNNQkO/bYkJts5d
        RH07ceIr5UNJ0tnBIoVDjS8w77W5QssZRW+h9d1wxIACpTHxLVS7bLVBzonOrKL2hA45JR
        hUe5xLJkVU6bIv9GySiaIT/5oA93iUo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-NygsLpDFPzKE2uXce_hzDQ-1; Sat, 01 Apr 2023 06:48:11 -0400
X-MC-Unique: NygsLpDFPzKE2uXce_hzDQ-1
Received: by mail-ed1-f69.google.com with SMTP id es16-20020a056402381000b004fa3e04c882so35014328edb.10
        for <linux-usb@vger.kernel.org>; Sat, 01 Apr 2023 03:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680346089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUv7dZXh9mIvQJQIA/OX5UG+LOgfqbX9QQwiu1BwMBc=;
        b=yCY6b54BOXS0Bl+XRMn6xHe3upcFMJ3RCdDbZHcspXNwS9N7AiLzQrRpmy3snNR7qC
         nYUeSGL8SfWQJ3equBvEHx7rt84tdlNbtXc4STG/udbi9BlXDkWHBcnszGAOQUsuqOJ3
         NUR8cU5QqDB0EfyQQnHHtBwRx/1yxkFofv9oPyrfPNNXAclg1MDYtonOZHmlxEa8qS5g
         Z2FneHSF/cjTuUUwbgW3lXkeNckTwiiZU+Ryil4kAuwjvAMWPeA/8KL/ly6/iXDDjeJ7
         +tGKIAi1fAz17RPKnf/CEpNB1yyTm/1EZnUbxCNAb+iq7RyoWmXRDk7gOpc1CuxnGryR
         iGMw==
X-Gm-Message-State: AAQBX9csUzRhR2RWg88SKKL0CcISg7lv600lRNem6iVuml+VXIu0Awid
        fTLxyzD4vvG6aLFspMalxvSlMaQZY6VVNefCheXSBr88Wc2WK1znPF3+9F4bRPSTonN9fvqISzD
        coJaaiRU1MiiGK0y/MBhhOLVLyWvO
X-Received: by 2002:aa7:c2d9:0:b0:4fa:315a:cb59 with SMTP id m25-20020aa7c2d9000000b004fa315acb59mr31407425edp.12.1680346089447;
        Sat, 01 Apr 2023 03:48:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZbGHNN8OowjNxT/X/gh6jNWFFxqjeLWPYMCZnd1egShrs8VtALiZc5Ot07YHfOGjPjrrmYw==
X-Received: by 2002:aa7:c2d9:0:b0:4fa:315a:cb59 with SMTP id m25-20020aa7c2d9000000b004fa315acb59mr31407416edp.12.1680346089165;
        Sat, 01 Apr 2023 03:48:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v4-20020a50a444000000b00501c0eaf10csm1962832edb.40.2023.04.01.03.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 03:48:08 -0700 (PDT)
Message-ID: <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
Date:   Sat, 1 Apr 2023 12:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [syzbot] WARNING in shark_write_reg/usb_submit_urb, WARNING in
 shark_write_val/usb_submit_urb
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+4b3f8190f6e13b3efd74@syzkaller.appspotmail.com>,
        syzbot <syzbot+1cb937c125adb93fad2d@syzkaller.appspotmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On 3/30/23 22:10, Alan Stern wrote:
> Reference: https://syzkaller.appspot.com/bug?extid=4b3f8190f6e13b3efd74
> Reference: https://syzkaller.appspot.com/bug?extid=1cb937c125adb93fad2d
> 
> The radio-shark driver just assumes that the endpoints it uses will be
> present, without checking.  This adds an appropriate check.
> 
> Alan Stern
> 
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.2

Thank you for working on this!

Both the core changes and the 2 radio-shark driver changes look good to me.

Please add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

When submitting these upstream.

Regards,

Hans





> 
>  drivers/usb/core/usb.c |   70 +++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |    7 ++++
>  2 files changed, 77 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/usb.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/usb.c
> +++ usb-devel/drivers/usb/core/usb.c
> @@ -207,6 +207,76 @@ int usb_find_common_endpoints_reverse(st
>  EXPORT_SYMBOL_GPL(usb_find_common_endpoints_reverse);
>  
>  /**
> + * usb_find_endpoint() - Given an endpoint address, search for the endpoint's
> + * usb_host_endpoint structure in an interface's current altsetting.
> + * @intf: the interface whose current altsetting should be searched
> + * @ep_addr: the endpoint address (number and direction) to find
> + *
> + * Search the altsetting's list of endpoints for one with the specified address.
> + *
> + * Return: Pointer to the usb_host_endpoint if found, %NULL otherwise.
> + */
> +struct usb_host_endpoint __must_check *usb_find_endpoint(
> +		const struct usb_interface *intf, unsigned int ep_addr)
> +{
> +	int n;
> +	struct usb_host_endpoint *ep;
> +
> +	n = intf->cur_altsetting->desc.bNumEndpoints;
> +	ep = intf->cur_altsetting->endpoint;
> +	for (; n > 0; (--n, ++ep)) {
> +		if (ep->desc.bEndpointAddress == ep_addr)
> +			return ep;
> +	}
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(usb_find_endpoint);
> +
> +/**
> + * usb_check_bulk_endpoint - Check whether an interface's current altsetting
> + * contains a bulk endpoint with the given address.
> + * @intf: the interface whose current altsetting should be searched
> + * @ep_addr: the endpoint address (number and direction) to look for
> + *
> + * Search for an endpoint with the specified address and check its type.
> + *
> + * Return: %true if the endpoint is found and is bulk, %false otherwise.
> + */
> +bool usb_check_bulk_endpoint(
> +		const struct usb_interface *intf, unsigned int ep_addr)
> +{
> +	const struct usb_host_endpoint *ep;
> +
> +	ep = usb_find_endpoint(intf, ep_addr);
> +	if (!ep)
> +		return false;
> +	return usb_endpoint_xfer_bulk(&ep->desc);
> +}
> +EXPORT_SYMBOL_GPL(usb_check_bulk_endpoint);
> +
> +/**
> + * usb_check_int_endpoint - Check whether an interface's current altsetting
> + * contains an interrupt endpoint with the given address.
> + * @intf: the interface whose current altsetting should be searched
> + * @ep_addr: the endpoint address (number and direction) to look for
> + *
> + * Search for an endpoint with the specified address and check its type.
> + *
> + * Return: %true if the endpoint is found and is interrupt, %false otherwise.
> + */
> +bool usb_check_int_endpoint(
> +		const struct usb_interface *intf, unsigned int ep_addr)
> +{
> +	const struct usb_host_endpoint *ep;
> +
> +	ep = usb_find_endpoint(intf, ep_addr);
> +	if (!ep)
> +		return false;
> +	return usb_endpoint_xfer_int(&ep->desc);
> +}
> +EXPORT_SYMBOL_GPL(usb_check_int_endpoint);
> +
> +/**
>   * usb_find_alt_setting() - Given a configuration, find the alternate setting
>   * for the given interface.
>   * @config: the configuration to search (not necessarily the current config).
> Index: usb-devel/include/linux/usb.h
> ===================================================================
> --- usb-devel.orig/include/linux/usb.h
> +++ usb-devel/include/linux/usb.h
> @@ -292,6 +292,13 @@ void usb_put_intf(struct usb_interface *
>  #define USB_MAXINTERFACES	32
>  #define USB_MAXIADS		(USB_MAXINTERFACES/2)
>  
> +struct usb_host_endpoint __must_check *usb_find_endpoint(
> +		const struct usb_interface *intf, unsigned int ep_addr);
> +bool usb_check_bulk_endpoint(
> +		const struct usb_interface *intf, unsigned int ep_addr);
> +bool usb_check_int_endpoint(
> +		const struct usb_interface *intf, unsigned int ep_addr);
> +
>  /*
>   * USB Resume Timer: Every Host controller driver should drive the resume
>   * signalling on the bus for the amount of time defined by this macro.
> 
>  drivers/media/radio/radio-shark.c  |    7 +++++++
>  drivers/media/radio/radio-shark2.c |    7 +++++++
>  2 files changed, 14 insertions(+)
> 
> Index: usb-devel/drivers/media/radio/radio-shark.c
> ===================================================================
> --- usb-devel.orig/drivers/media/radio/radio-shark.c
> +++ usb-devel/drivers/media/radio/radio-shark.c
> @@ -317,6 +317,13 @@ static int usb_shark_probe(struct usb_in
>  	struct shark_device *shark;
>  	int retval = -ENOMEM;
>  
> +	/* Are the expected endpoints present? */
> +	if (!usb_check_int_endpoint(intf, SHARK_IN_EP | USB_DIR_IN) ||
> +	    !usb_check_int_endpoint(intf, SHARK_OUT_EP | USB_DIR_OUT)) {
> +		dev_err(&intf->dev, "Invalid radioSHARK device\n");
> +		return -EINVAL;
> +	}
> +
>  	shark = kzalloc(sizeof(struct shark_device), GFP_KERNEL);
>  	if (!shark)
>  		return retval;
> Index: usb-devel/drivers/media/radio/radio-shark2.c
> ===================================================================
> --- usb-devel.orig/drivers/media/radio/radio-shark2.c
> +++ usb-devel/drivers/media/radio/radio-shark2.c
> @@ -283,6 +283,13 @@ static int usb_shark_probe(struct usb_in
>  	struct shark_device *shark;
>  	int retval = -ENOMEM;
>  
> +	/* Are the expected endpoints present? */
> +	if (!usb_check_int_endpoint(intf, SHARK_IN_EP | USB_DIR_IN) ||
> +	    !usb_check_int_endpoint(intf, SHARK_OUT_EP | USB_DIR_OUT)) {
> +		dev_err(&intf->dev, "Invalid radioSHARK2 device\n");
> +		return -EINVAL;
> +	}
> +
>  	shark = kzalloc(sizeof(struct shark_device), GFP_KERNEL);
>  	if (!shark)
>  		return retval;
> 

