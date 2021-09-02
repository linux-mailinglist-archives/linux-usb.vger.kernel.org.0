Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A03FEAE7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 10:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244735AbhIBI7o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 04:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbhIBI7n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 04:59:43 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A26C061575
        for <linux-usb@vger.kernel.org>; Thu,  2 Sep 2021 01:58:46 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e7so744407plh.8
        for <linux-usb@vger.kernel.org>; Thu, 02 Sep 2021 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dicortech-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xj+xf7NAlJQ3kotLQW37p3b6ONM7bgUST22PnZegHqI=;
        b=mUc7GguA5Xvp2scvNT25Sb699IxNXS85eYCLghyHU8eKTHnfQGQu4eBsxrsSoERHl8
         YVSLFro/DAA902YmSw6lYRFcOe+gnVluHcbRtM12/mw/DboeiIS2IyvtzqH4usB1ZAOK
         /S3KP9iJetVUIEAbwvIv/yIz8Bb470iDUcAK2qjwybRTy8EKeAy3c4OYiMA2P+OJT0oz
         nxMHLnEm7STYnDFc5Dj+GbIirP+2AYKldXg385hhaq3+Zpm4Naoz7yBfBKvVakxOC/5K
         zyKphVigyPz6arjn1P/CYo5oEGU/4bEZAuGg2lencWOi8SljxEBpiSXajVg/Tmu1VNL3
         t+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xj+xf7NAlJQ3kotLQW37p3b6ONM7bgUST22PnZegHqI=;
        b=Z1EgPP2cbWbNulvbNBVaN6x18zjHdJx2+rmX2puzk90lOk+V8fLf3uF77iJSTtvshC
         LkrQIu/8ssCd4QbVQycJPp8ZVmsUzaU1zH3z2MPgUGyRsDewfy7vlq/ztP6fXCYgp9lJ
         N/hPIJ2NJXzzM9xLm++OapvxlneBXji7WEE37+u5XlXxlm7pVtVED0FCvCWCPGJrv8A0
         QVnxhQHkYhsLFoc9iUrYirS9nD0ecUI+xpewrxuKAlyYnf4o50uDL35arEX3GXTeA0wb
         smDnLPy+8q1B5wrlpjXTQJ6vPx0hyr1QJuiW0hqZoY6bUGtWa2s7q6SY7fkkrux9XKdn
         gKXQ==
X-Gm-Message-State: AOAM533xpTuychQnfM8F84k5pyqIZVJ5BvcWRMsHMHYYgg+W/Jci4O/d
        oUeTygaPzPO/RDTIjAk3h5L0ikaIyCE50w==
X-Google-Smtp-Source: ABdhPJxBTo4lDUa++/TX93OeTSS1GXMdqBFc+6PImpC0ukV8OgfwGRSr681Q5a87gcNL3NqcbXci0w==
X-Received: by 2002:a17:90a:d187:: with SMTP id fu7mr2754374pjb.106.1630573125318;
        Thu, 02 Sep 2021 01:58:45 -0700 (PDT)
Received: from faizel.kb ([122.165.156.14])
        by smtp.gmail.com with ESMTPSA id w186sm1654313pfw.78.2021.09.02.01.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 01:58:44 -0700 (PDT)
Date:   Thu, 2 Sep 2021 14:28:40 +0530
From:   Faizel K B <faizel.kb@dicortech.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: testusb: Fix for showing the connection speed
Message-ID: <20210902085840.GB9371@faizel.kb>
References: <YS8V9Jz/MivXiaZc@kroah.com>
 <20210901181351.131378-1-faizel.kb@dicortech.com>
 <YS/FSNrJ1xyO/ydm@kroah.com>
 <20210902083315.GA9371@faizel.kb>
 <YTCOjFgddFaortsV@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTCOjFgddFaortsV@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 02, 2021 at 10:42:52AM +0200, Greg KH wrote:
> On Thu, Sep 02, 2021 at 02:03:15PM +0530, Faizel K B wrote:
> > On Wed, Sep 01, 2021 at 08:24:08PM +0200, Greg KH wrote:
> > > On Wed, Sep 01, 2021 at 11:43:51PM +0530, Faizel K B wrote:
> > > > Signed-off-by: Faizel K B <faizel.kb@dicortech.com>
> > > > ---
> > > >  tools/usb/testusb.c | 14 ++++++++------
> > > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
> > > > index ee8208b2f946..69c3ead25313 100644
> > > > --- a/tools/usb/testusb.c
> > > > +++ b/tools/usb/testusb.c
> > > > @@ -265,12 +265,6 @@ static int find_testdev(const char *name, const struct stat *sb, int flag)
> > > >  	}
> > > >  
> > > >  	entry->ifnum = ifnum;
> > > > -
> > > > -	/* FIXME update USBDEVFS_CONNECTINFO so it tells about high speed etc */
> > > > -
> > > > -	fprintf(stderr, "%s speed\t%s\t%u\n",
> > > > -		speed(entry->speed), entry->name, entry->ifnum);
> > > > -
> > > >  	entry->next = testdevs;
> > > >  	testdevs = entry;
> > > >  	return 0;
> > > > @@ -299,6 +293,14 @@ static void *handle_testdev (void *arg)
> > > >  		return 0;
> > > >  	}
> > > >  
> > > > +	status  =  ioctl(fd, USBDEVFS_GET_SPEED, NULL);
> > > > +	if (status < 0)
> > > > +		fprintf(stderr, "USBDEVFS_GET_SPEED failed %d\n", status);
> > > > +	else
> > > > +		dev->speed = status;
> > > > +	fprintf(stderr, "%s speed\t%s\t%u\n",
> > > > +			speed(dev->speed), dev->name, dev->ifnum);
> > > > +
> > > >  restart:
> > > >  	for (i = 0; i < TEST_CASES; i++) {
> > > >  		if (dev->test != -1 && dev->test != i)
> > > > -- 
> > > > 2.25.1
> > > > 
> > > 
> > > Hi,
> > > 
> > > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > > a patch that has triggered this response.  He used to manually respond
> > > to these common problems, but in order to save his sanity (he kept
> > > writing the same thing over and over, yet to different people), I was
> > > created.  Hopefully you will not take offence and will fix the problem
> > > in your patch and resubmit it so that it can be accepted into the Linux
> > > kernel tree.
> > > 
> > > You are receiving this message because of the following common error(s)
> > > as indicated below:
> > > 
> > > - You did not specify a description of why the patch is needed, or
> > >   possibly, any description at all, in the email body.  Please read the
> > >   section entitled "The canonical patch format" in the kernel file,
> > >   Documentation/SubmittingPatches for what is needed in order to
> > >   properly describe the change.
> > > 
> > > - This looks like a new version of a previously submitted patch, but you
> > >   did not list below the --- line any changes from the previous version.
> > >   Please read the section entitled "The canonical patch format" in the
> > >   kernel file, Documentation/SubmittingPatches for what needs to be done
> > >   here to properly describe this.
> > > 
> > > If you wish to discuss this problem further, or you have questions about
> > > how to resolve this issue, please feel free to respond to this email and
> > > Greg will reply once he has dug out from the pending patches received
> > > from other developers.
> > > 
> > > thanks,
> > > 
> > > greg k-h's patch email bot
> > Is it expected to be a separate patch (version 2)? Since the change is
> > only in the updated 'real name' for the 'from' field and 'Signed Off' field
> > in response with the previous message from the bot.
> 
> Yes, of course, how else would we know this is a newer patch?
> 
> thanks,
> 
> greg k-h

Ok. Will send it as new version.

