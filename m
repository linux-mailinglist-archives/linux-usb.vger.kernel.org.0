Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25AFFE1EC2
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 17:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406425AbfJWPBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 11:01:31 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36763 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391742AbfJWPBb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 11:01:31 -0400
Received: by mail-pg1-f193.google.com with SMTP id 23so12322867pgk.3;
        Wed, 23 Oct 2019 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VGcDW9u8glpHl9NWHGsEcLSGow06v5uvF5GnWslAJA8=;
        b=TC+G+a72DBXrWYs0MMstftfx3Qr0BKRNdRe24DkeVHt1AIk+muBu5ffO+gugjhax0e
         cp7hTk+uFKfxSDqlo5jnH4pu5V8IU4KMl7ptHNzRx4H/+XiPz0np8FSEQ0nuGqDfb2M4
         h8m1drU0GhVVuOjdNnIoK4ZNHOZaFISsHap/V9o3tP51TLfqNyJUQSTqU/gd7KJKAoSP
         XLSBIlP/zyMCeu6zPBl/LNTWDD2IuC2183Ag9W3wPSOlg17qDhJ6ZgBHlqt3avrsYs6K
         1TBcbl9aaMewyX8vJ8Mgy73M2Z+NVC7cbd2gAXdUl5hEMAmSERedHoHuU2KHhMk//O60
         hFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VGcDW9u8glpHl9NWHGsEcLSGow06v5uvF5GnWslAJA8=;
        b=LRdmpMNMy31KvvYcGpOxt8s4wDgOZq+JsxAASXxt1zqp+Io+YPVRfggWVK8xebX7Nt
         nHdBtMYoBT/Vcqd10/mTB5m5oYFI50X3DrZEqFzF8vUU0iJGIbVmoSTj6yUW4wJ9Q+Fm
         e5qY2aY1E/vw3Obw7jkwGMeOTQShjvbP8AhTESQg4DM9XQiJaU1BiJLS2XseEss7EAGr
         VpYefZyYzSYJhUlBAuceT5G4E4BN41YRoYua6AtzQhWVeoHSZZukycbOd9PgD/RcnDz/
         xS3Q5VRBM7QsEtF0vd2YUjz6IF+YN4dngkyiivFhaHjN9LWR30y9EaTvAelQWikDbyz/
         RxQQ==
X-Gm-Message-State: APjAAAVRfSmi7TVzNS3moYqILki9Q+tP40hTmHPCiSOAty9Ys1xWntA0
        dPN7rGRw7nADikPHFq36yCQ=
X-Google-Smtp-Source: APXvYqzgjaZFWfZd7bF5LRqqP9IX6KdtfB6Z5qmJ4+Fk322t5Henb/vokuna0Zn55kHmvbshyCFCHQ==
X-Received: by 2002:a63:78f:: with SMTP id 137mr10662728pgh.110.1571842890449;
        Wed, 23 Oct 2019 08:01:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q71sm21951953pjb.26.2019.10.23.08.01.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:01:28 -0700 (PDT)
Date:   Wed, 23 Oct 2019 08:01:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Puma Hsu <pumahsu@google.com>, gregkh@linuxfoundation.org,
        badhri@google.com, kyletso@google.com, albertccwang@google.com,
        rickyniu@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] usb: typec: Add sysfs node to show connector
 orientation
Message-ID: <20191023150126.GA16612@roeck-us.net>
References: <20191022085924.92783-1-pumahsu@google.com>
 <20191023083221.GB8828@kuha.fi.intel.com>
 <644d890b-86e8-f05a-cd4c-32937d971a45@roeck-us.net>
 <20191023142900.GA15396@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023142900.GA15396@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 23, 2019 at 05:29:00PM +0300, Heikki Krogerus wrote:
> On Wed, Oct 23, 2019 at 06:44:39AM -0700, Guenter Roeck wrote:
> > On 10/23/19 1:32 AM, Heikki Krogerus wrote:
> > > +Guenter
> > > 
> > > On Tue, Oct 22, 2019 at 04:59:24PM +0800, Puma Hsu wrote:
> > > > Export the Type-C connector orientation so that user space
> > > > can get this information.
> > > > 
> > > > Signed-off-by: Puma Hsu <pumahsu@google.com>
> > > > ---
> > > >   Documentation/ABI/testing/sysfs-class-typec | 11 +++++++++++
> > > >   drivers/usb/typec/class.c                   | 18 ++++++++++++++++++
> > > >   2 files changed, 29 insertions(+)
> > > > 
> > > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > > > index d7647b258c3c..b22f71801671 100644
> > > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > > @@ -108,6 +108,17 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > >   Description:
> > > >   		Revision number of the supported USB Type-C specification.
> > > > +What:		/sys/class/typec/<port>/connector_orientation
> > > > +Date:		October 2019
> > > > +Contact:	Puma Hsu <pumahsu@google.com>
> > > > +Description:
> > > > +		Indicates which typec connector orientation is configured now.
> > > > +		cc1 is defined as "normal" and cc2 is defined as "reversed".
> > > > +
> > > > +		Valid value:
> > > > +		- unknown (nothing configured)
> > > 
> > > "unknown" means we do not know the orientation.
> > > 
> > > > +		- normal (configured in cc1 side)
> > > > +		- reversed (configured in cc2 side)
> > > 
> > > Guenter, do you think "connector_orientation" OK. I proposed it, but
> > > I'm now wondering if something like "polarity" would be better?
> > > 
> > 
> > Yes, or just "orientation". I don't see the value in the "connector_" prefix.
> > I also wonder if "unknown" is really correct. Is it really unknown, or
> > does it mean that the port is disconnected ?
> 
> Unknown means we don't know the orientation. We don't always have that
> information available to us. With UCSI we simply do not know it.
> 
> I think this file needs to be hidden after all if we don't know the
> cable plug orientation.
> 
Making the attribute appear and disappear may cause difficulties for
userspace.

> How about empty string instead of "unknown"?
> 
An empty string might also be challenging for userspace.

"unknown" is fine if it is really unknown. With that in mind,
I wonder what value that attribute has for userspace, but presumably
there must be some use case. I assume it is purely informational.

In summary, I would suggest to name the attribute either "orientation"
or "polarity".

Thanks,
Guenter
