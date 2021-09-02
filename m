Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A523FEAA9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 10:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244486AbhIBIeU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 04:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244485AbhIBIeT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 04:34:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E39FC061757
        for <linux-usb@vger.kernel.org>; Thu,  2 Sep 2021 01:33:21 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id s11so1148484pgr.11
        for <linux-usb@vger.kernel.org>; Thu, 02 Sep 2021 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dicortech-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x/XyzeDOQsKXO34lWnXn/v75fRQ9IO4h0JcKa4QhpVY=;
        b=n7mtV96ioGHyv/H86jpGVgRGtFEvwCK31o6m/jKbgEyErwFvC4M1xyPIA8Pbk3ahJ0
         4B+s7/BSCzgyxnCSRSHBfnIvy64a3bNTdQluWiaz5A2Av1Fb5ye6YhHlvhfXnUYbgCNe
         oD2SZw7VbVkRSUIaTzbg0rNopp/C2nNRbbNiyIjVI+uzrvP8WxfT8G7v7vXdcdcMsfF7
         oevU55YnEsHYmKtLgWrO1YA2b8vKFqXo6OLvR6hhUoILxIXXx5xtauJZ8xFZzo63nKxd
         FeHmkLqEqhqpTPKO/9vjAzYseYvCA9Zi/FBX21caOmRsxwmTW1TIFuEhXRIR8ZNA3ypi
         bDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x/XyzeDOQsKXO34lWnXn/v75fRQ9IO4h0JcKa4QhpVY=;
        b=t9X10wUA8bFIbnBHlSP+JOpG7d0Kr5suUOPOmBd9ceIckx2ch50VpMFQdnV9gjuQKz
         JyxXD2UpAulpmI2lLMjqWgLcZAsvlNc1SYWFQ0lI4pVHArhFxabPNJUB5fEeNWtvijbS
         c+4aXBrQ0/gKNq7pvBFmQALJqPq2uAtLh3dSo85MezIpzEHlXABUYeKzH/N8MVf2xHZ0
         Qkc7Ky4dB++EW97mQRj8V3g0gxSpgcn3vpNM1OwBIdsr97Nn6vfIDZfj7r9I8+t1SNHX
         4czKhZVSpsl0sCT83oLlmtoFcyYsiWCnwZQL1UY8Bxyiu90kI3yb3y9Kb4T6FwZpt4RT
         zL2A==
X-Gm-Message-State: AOAM533IM2QokcdjHvq6hGXD22VVwmlBedYB2Fc0yRhpUvYO4iO4oyeC
        OuugDD7nrAMYQwm0v/e15PbrULnqoGxZvg==
X-Google-Smtp-Source: ABdhPJwmkBpaWyxDZPXW85uG9LRvTTlQGoZSRPBk5K5UDzPnMxgfrHpo46LhQ50TCq0S01iUue8ndQ==
X-Received: by 2002:a63:34c3:: with SMTP id b186mr2174329pga.8.1630571600319;
        Thu, 02 Sep 2021 01:33:20 -0700 (PDT)
Received: from faizel.kb ([122.165.156.14])
        by smtp.gmail.com with ESMTPSA id e16sm1568068pfj.90.2021.09.02.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 01:33:19 -0700 (PDT)
Date:   Thu, 2 Sep 2021 14:03:15 +0530
From:   Faizel K B <faizel.kb@dicortech.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: testusb: Fix for showing the connection speed
Message-ID: <20210902083315.GA9371@faizel.kb>
References: <YS8V9Jz/MivXiaZc@kroah.com>
 <20210901181351.131378-1-faizel.kb@dicortech.com>
 <YS/FSNrJ1xyO/ydm@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS/FSNrJ1xyO/ydm@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 01, 2021 at 08:24:08PM +0200, Greg KH wrote:
> On Wed, Sep 01, 2021 at 11:43:51PM +0530, Faizel K B wrote:
> > Signed-off-by: Faizel K B <faizel.kb@dicortech.com>
> > ---
> >  tools/usb/testusb.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
> > index ee8208b2f946..69c3ead25313 100644
> > --- a/tools/usb/testusb.c
> > +++ b/tools/usb/testusb.c
> > @@ -265,12 +265,6 @@ static int find_testdev(const char *name, const struct stat *sb, int flag)
> >  	}
> >  
> >  	entry->ifnum = ifnum;
> > -
> > -	/* FIXME update USBDEVFS_CONNECTINFO so it tells about high speed etc */
> > -
> > -	fprintf(stderr, "%s speed\t%s\t%u\n",
> > -		speed(entry->speed), entry->name, entry->ifnum);
> > -
> >  	entry->next = testdevs;
> >  	testdevs = entry;
> >  	return 0;
> > @@ -299,6 +293,14 @@ static void *handle_testdev (void *arg)
> >  		return 0;
> >  	}
> >  
> > +	status  =  ioctl(fd, USBDEVFS_GET_SPEED, NULL);
> > +	if (status < 0)
> > +		fprintf(stderr, "USBDEVFS_GET_SPEED failed %d\n", status);
> > +	else
> > +		dev->speed = status;
> > +	fprintf(stderr, "%s speed\t%s\t%u\n",
> > +			speed(dev->speed), dev->name, dev->ifnum);
> > +
> >  restart:
> >  	for (i = 0; i < TEST_CASES; i++) {
> >  		if (dev->test != -1 && dev->test != i)
> > -- 
> > 2.25.1
> > 
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - You did not specify a description of why the patch is needed, or
>   possibly, any description at all, in the email body.  Please read the
>   section entitled "The canonical patch format" in the kernel file,
>   Documentation/SubmittingPatches for what is needed in order to
>   properly describe the change.
> 
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/SubmittingPatches for what needs to be done
>   here to properly describe this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot
Is it expected to be a separate patch (version 2)? Since the change is
only in the updated 'real name' for the 'from' field and 'Signed Off' field
in response with the previous message from the bot.
