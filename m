Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 095BF86460
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 16:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732596AbfHHOd0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 10:33:26 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:57251 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732477AbfHHOdZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 10:33:25 -0400
Received: by mail-ot1-f71.google.com with SMTP id q22so62086705otl.23
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 07:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=jZyCbcw3RWENZUjZ8q6u6MdFhvaB3V5am3DAxqvxROk=;
        b=qoqnhXv7sbUOsxIIIxkibCRxh3xNgs7DmEgHAYV8sF/nMHCFYmiG2o23fowg5xLMbz
         SD9EmkZ77Q/xrkMQuW3DFKBeWNcQ88FX2QXMoaVOORy/klUhArOQm1D5C872fxrh3rag
         Q4CXaXYyf7dgE8MCS3aTbf4jcvxy40hBs/QsoalybOElmQMkPcGBDO4Z/BjAdMcANLxe
         0+xaTCAd/S+POCXpWg7eewJtOE7qtDh1nivgpME/FfiFHalk+mbMVxeiKdgt1aTxa235
         h3qCQyjNTMIOlOKEItrhKuqgexUQKvX3lOBbTT3tZUNcmP4pDvYAOFiE20XF0GwqeaWn
         BAcg==
X-Gm-Message-State: APjAAAXnI1F5cmERw/hVuzFXRF05FrrYDODid84vu2gEiAMFSVirlEGu
        QHdN+Hkj9TE7Q0Aa7pSwrjU0B4wikYU1l8neGNZbd9NBQgwD
X-Google-Smtp-Source: APXvYqyHOp2lVA12vv+ST29W9GrxgWuLhJZZhoi+joOmROWgcCD7PxanPpA2bipURq2utrM6+0wONAARKSHheq6iGCjCQwVOjSra
MIME-Version: 1.0
X-Received: by 2002:a02:ad15:: with SMTP id s21mr17427026jan.47.1565274804827;
 Thu, 08 Aug 2019 07:33:24 -0700 (PDT)
Date:   Thu, 08 Aug 2019 07:33:24 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908081027560.1652-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b7c096058f9bf071@google.com>
Subject: Re: Re: possible deadlock in open_rio
From:   syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oliver@neukum.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Wed, 7 Aug 2019, Oliver Neukum wrote:

>> Am Mittwoch, den 07.08.2019, 10:07 -0400 schrieb Alan Stern:
>> > On Wed, 7 Aug 2019, Oliver Neukum wrote:

>> > > technically yes. However in practical terms the straight revert I  
>> sent
>> > > out yesterday should fix it.
>> >
>> > I didn't see the revert, and it doesn't appear to have reached the
>> > mailing list archive.  Can you post it again?

>> As soon as our VPN server is back up again.

> The revert may not be necessay; a little fix should get rid of the
> locking violation.  The key is to avoid calling the registration or
> deregistration routines while holding the rio500_mutex, and to
> recognize that the probe and disconnect routines are both protected by
> the device mutex.

> How does this patch look?

> Alan Stern


> #syz test: https://github.com/google/kasan.git 7f7867ff

This crash does not have a reproducer. I cannot test it.


> Index: usb-devel/drivers/usb/misc/rio500.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/misc/rio500.c
> +++ usb-devel/drivers/usb/misc/rio500.c
> @@ -454,52 +454,54 @@ static int probe_rio(struct usb_interfac
>   {
>   	struct usb_device *dev = interface_to_usbdev(intf);
>   	struct rio_usb_data *rio = &rio_instance;
> -	int retval = 0;
> +	int retval;
> +	char *ibuf, *obuf;

> -	mutex_lock(&rio500_mutex);
>   	if (rio->present) {
>   		dev_info(&intf->dev, "Second USB Rio at address %d refused\n",  
> dev->devnum);
> -		retval = -EBUSY;
> -		goto bail_out;
> -	} else {
> -		dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
> +		return -EBUSY;
>   	}
> +	dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);

>   	retval = usb_register_dev(intf, &usb_rio_class);
>   	if (retval) {
>   		dev_err(&dev->dev,
>   			"Not able to get a minor for this device.\n");
> -		retval = -ENOMEM;
> -		goto bail_out;
> +		goto err_register;
>   	}

> -	rio->rio_dev = dev;
> -
> -	if (!(rio->obuf = kmalloc(OBUF_SIZE, GFP_KERNEL))) {
> +	obuf = kmalloc(OBUF_SIZE, GFP_KERNEL);
> +	if (!obuf) {
>   		dev_err(&dev->dev,
>   			"probe_rio: Not enough memory for the output buffer\n");
> -		usb_deregister_dev(intf, &usb_rio_class);
> -		retval = -ENOMEM;
> -		goto bail_out;
> +		goto err_obuf;
>   	}
> -	dev_dbg(&intf->dev, "obuf address:%p\n", rio->obuf);
> +	dev_dbg(&intf->dev, "obuf address: %p\n", obuf);

> -	if (!(rio->ibuf = kmalloc(IBUF_SIZE, GFP_KERNEL))) {
> +	ibuf = kmalloc(IBUF_SIZE, GFP_KERNEL);
> +	if (!ibuf) {
>   		dev_err(&dev->dev,
>   			"probe_rio: Not enough memory for the input buffer\n");
> -		usb_deregister_dev(intf, &usb_rio_class);
> -		kfree(rio->obuf);
> -		retval = -ENOMEM;
> -		goto bail_out;
> +		goto err_ibuf;
>   	}
> -	dev_dbg(&intf->dev, "ibuf address:%p\n", rio->ibuf);
> +	dev_dbg(&intf->dev, "ibuf address: %p\n", ibuf);

> +	mutex_lock(&rio500_mutex);
> +	rio->rio_dev = dev;
> +	rio->ibuf = ibuf;
> +	rio->obuf = obuf;
>   	usb_set_intfdata (intf, rio);
>   	rio->present = 1;
> -bail_out:
>   	mutex_unlock(&rio500_mutex);

>   	return retval;
> +
> + err_ibuf:
> +	kfree(obuf);
> + err_obuf:
> +	usb_deregister_dev(intf, &usb_rio_class);
> + err_register:
> +	return -ENOMEM;
>   }

>   static void disconnect_rio(struct usb_interface *intf)
> @@ -507,10 +509,10 @@ static void disconnect_rio(struct usb_in
>   	struct rio_usb_data *rio = usb_get_intfdata (intf);

>   	usb_set_intfdata (intf, NULL);
> -	mutex_lock(&rio500_mutex);
>   	if (rio) {
>   		usb_deregister_dev(intf, &usb_rio_class);

> +		mutex_lock(&rio500_mutex);
>   		if (rio->isopen) {
>   			rio->isopen = 0;
>   			/* better let it finish - the release will do whats needed */
> @@ -524,8 +526,8 @@ static void disconnect_rio(struct usb_in
>   		dev_info(&intf->dev, "USB Rio disconnected.\n");

>   		rio->present = 0;
> +		mutex_unlock(&rio500_mutex);
>   	}
> -	mutex_unlock(&rio500_mutex);
>   }

>   static const struct usb_device_id rio_table[] = {

