Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B943D3DD3
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 18:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhGWQIQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 12:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhGWQIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 12:08:16 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1365FC061575
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:48:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bp1so3121270lfb.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91aQFRYIdgzj88IJSIkdm28VlazqEvs9hYL7HHJxDXk=;
        b=XW/m8ZN3fwu7Z5pQmde3f5jvv+IYVT+DJenurWjN3gEVVTMavo99HL3vhP00ldDJr3
         563xPFcq1zcftiqyIOuQUhh6vA8KztVGbmvUgXCo6yZLmYvlS2nTlMWZeUxzui33Kb0y
         EdZQGBj+EkRIMzPbDO9GtxGxsjh9z/7wvW17kDPMgNgY33LsoHdG0OsIHJS5ZXdI5wq3
         mEtJGfiJB9g1hFVOpzTQjVRRImm9HegeDWlVlM1Egb9f+LZ+yIad79x9uIFfYFAj4FQu
         Lr3pZ4deHxUJVNeI2RdoOnZoxb1PHjDrWkIIuHk7kPMFH2yY7ZJmqOy+XCUrYlftGrm1
         VoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91aQFRYIdgzj88IJSIkdm28VlazqEvs9hYL7HHJxDXk=;
        b=EnE9BEHZRYyNhdbu6w5t48O478YIvLKNF7Vxz2CjiHdMVkPerkiHZCTNMiUY+jGPJ5
         JZoPT6S4nv/A6ykU1gqfU6M2AnxY+5jYqPMieKMl1qvTtzWg76VZoCtycSquuVBmPPYW
         /5yaZ/uQ0jPP1P+/7u+dS+liJylhZO+CH58y283KlZ5yfB/hFPouRxHhEL/lX9s+mS5z
         fzNdc+lcZcPNVYYwM87gxAcWHfiwGivEESc0wVi4ZId0Dlv7u0HQPYXTMyBY05YjgljG
         Cn6FakbiQ8AEhLpmjgfhBAVqq3ufj5aVQ+eCs+4ivpQG2n32RfpFzxmvslxcK8lUsHFl
         nnYw==
X-Gm-Message-State: AOAM530NmJ4ceEFrZDdsc23xl/G7C3FNeTh03Iz0W1LWWScffWJ1cCks
        K4YmQstNy06hA+LtmV+75/E=
X-Google-Smtp-Source: ABdhPJwO/3aTGxNI+VpLl+syvq2OFoKeamRtTn5rfck2WL2Akc+T5fmfJvuW/fKzaV5xFwSnV/tQng==
X-Received: by 2002:a05:6512:3458:: with SMTP id j24mr3702359lfr.366.1627058926397;
        Fri, 23 Jul 2021 09:48:46 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id f23sm116430lfc.225.2021.07.23.09.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 09:48:46 -0700 (PDT)
Date:   Fri, 23 Jul 2021 19:48:44 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, sandeen@redhat.com, linux-usb@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v2] usb: gadget: f_hid: fixed NULL pointer dereference
Message-ID: <20210723194844.54773693@reki>
In-Reply-To: <YPrsyBwKqcxI5uO0@kroah.com>
References: <20210723155928.210019-1-mdevaev@gmail.com>
        <YPrsyBwKqcxI5uO0@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > +	if (!hidg->in_ep->enabled) {
> > +		ERROR(hidg->func.config->cdev, "in_ep is disabled\n");
> > +		status = -ESHUTDOWN;
> > +		goto release_write_pending;  
> 
> What prevents "enabled" from changing right after you test this?  You do
> not have the lock held so could it change then?

Inside usb_ep_queue() a similar check is used without blocking.
I suppose this is how it should be. Here it's necessary for the error message.

> > +	}
> > +
> >  	status = usb_ep_queue(hidg->in_ep, req, GFP_ATOMIC);
> > -	if (status < 0) {
> > -		ERROR(hidg->func.config->cdev,
> > -			"usb_ep_queue error on int endpoint %zd\n", status);
> > +	if (status < 0)
> >  		goto release_write_pending;  
> 
> No error message if queueing up failed?

Yes. For each write from userspace, this generates one message.
This can lead to a huge spam in the log. 
