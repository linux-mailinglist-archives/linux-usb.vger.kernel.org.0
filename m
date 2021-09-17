Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C4540F2F0
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 09:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbhIQHRH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 03:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhIQHRG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 03:17:06 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDD7C061574
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 00:15:45 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q68so8743878pga.9
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 00:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xMt2sX2jDUgWXLfZ7hg6li8heCIlRZ77kIPAMfMjLIk=;
        b=b+MWr328444hR5ErST+7YyQCNUPHWPLcx5tYY9KNkNGxKRFxNuuNkL5tsScUfovy21
         ufvK29h2uVcGWvbtUCKRZiPL2l/iNpGsu0tfQdDqmrPwzEtfMKrhmfFiF9KcreLxLD5+
         fZr+9VLhbBgHFjrDL/CSeg8JA8fBfDqDkra6iDbsCRhHSCbo3/tXmyjzSGF8pje/XAGd
         5XugYbn3ipHBUA12w0hVqwiNADr9TCgkC+9byQ/H75qmJbwDtGJzkA9gKkHwohv/zNVg
         yWVc2TZXXsx71mAmqoQZfd9fu+xaQsIiHXo2qem3u7TqdjYppXyNxI958FzAIv+jRCpP
         qGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xMt2sX2jDUgWXLfZ7hg6li8heCIlRZ77kIPAMfMjLIk=;
        b=FkIlV/mztfd3uF8Vp9bcKhZdorz44Isrd2OmUThP8vA+u4Azj1F46mcqpYTrIm2DuS
         4564YEBo9Gq61w9qgG5Y7uC5fxEDMYP63YJgC9SeFe3TNlg1TP6BfKGB64xaMBeFZt8e
         8veuS0vvwd9lAhuSP6GufTTz0VlA2hrtu6nPLgn2zN1ZWIsfKnaGucyUSHpSDzjL+o1h
         0IBXlZmdcq/Yy+rLIxllh/A/w+uStGWIed81bb4pRYi8mfK4vbt9rzHvTeR8hxR9Fqoy
         VrtCfUcNBd5659ATQCOo7OPP3DrIKWQIjgoxXgNdnm5cxZj/ZKpYmeHUdnuEm9o2YJWc
         AlIA==
X-Gm-Message-State: AOAM532IAVp5xrxMzCZDaU7FmS4o1D5aXAHy5bIle/7DCooCOgMgetzp
        bjhWQoG2G/xbztspIGzjlmzKvVFISYpBvLLbFvfVTA==
X-Google-Smtp-Source: ABdhPJz+U8zYChBhGSmOz13MRU9O5Ydz8bjddYxEqQXk6joT5dKZX6j5UMh8iPtSKNoRLzrZ/vprcQ==
X-Received: by 2002:a05:6a00:2444:b029:3cd:5af9:821e with SMTP id d4-20020a056a002444b02903cd5af9821emr9479741pfj.40.1631862944654;
        Fri, 17 Sep 2021 00:15:44 -0700 (PDT)
Received: from ws2 ([185.65.135.245])
        by smtp.gmail.com with ESMTPSA id x10sm9567420pjv.57.2021.09.17.00.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 00:15:44 -0700 (PDT)
From:   Andreas Bauer <andreas.bauer.nexus@gmail.com>
X-Google-Original-From: Andreas Bauer <Andreas.Bauer.Nexus@gmail.com>
Date:   Fri, 17 Sep 2021 14:15:33 +0700
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/legacy/ether: assume saner default power mode
Message-ID: <YURAlSpAWT0s9dVr@ws2>
References: <YUNbDyoTPa+5J9Od@ws2>
 <87pmt7ahtj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmt7ahtj.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Fri, Sep 17, 2021 at 08:28:16AM +0300 schrieb Felipe Balbi:

> Have a look at other commits to get examples of how to write commits for
> upstream. You're missing your Signed-off-by, adding extra unnecessary
> spaces and making your signature show up in the commit log. All of
> these are described in kernel documentation this
> (https://www.kernel.org/doc/html/latest/process/submitting-patches.html)
> is a good starting point.

I apologize, this was my first try at contributing based on what I 
observed on this list. Will fix all mentioned points and consult the
documentation before trying again.

> > -	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
> > +	.bmAttributes		= 0,	/* bus powered implied */
> > +	.bMaxPower		= 250,	/* 500mA in 2mA units */
> 
> right, your "sane" default now prevents this gadget driver from working
> behind bus powered hubs. Considering that a linux-based device is likely
> to have its own battery, this is not really a sane default.

The linux-based battery-powered device I have here (Android) charges its
battery and is thus bus-powered while in gadget mode.

Are there really a lot of devices that use gadget mode and do NOT draw 
power from the USB bus? Honest question, I don't know the answer.

> The default value of "self powered", seems much saner ;-)

It violates USB specification as is for most cases I reckon.  It also 
maximize functionality when the host does not enforce USB spec which
mostly seems to be the case.

Would a CONFIG option here make sense to differentiate between 
bus-powered devices and self-powered ones? This would probably affect
most OTG drivers...

regards,

Andreas
