Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4635D3A0B11
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 06:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhFIEVe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 00:21:34 -0400
Received: from gw.atmark-techno.com ([13.115.124.170]:36342 "EHLO
        gw.atmark-techno.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhFIEVe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 00:21:34 -0400
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
        by gw.atmark-techno.com (Postfix) with ESMTPS id BB22C80262
        for <linux-usb@vger.kernel.org>; Wed,  9 Jun 2021 13:13:12 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id t5-20020a170902e845b0290102b8314d05so5596619plg.8
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 21:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9QfyL1AUne5+PBkZwxn6iFg7I6n6SWl6hKQ4WQ41Sdw=;
        b=caH/EA0zeArbSTmZuVxesXAUHJ2A1+Q8t27eeHL4XgH7BZ7bGeIfPYEdkM1sr1lCSo
         h5ag6nzyoA95uyR8q2Z2vwi59MDHTUxLw+IacQzbwgOCW9J4I/E3GaWgYhHEdmbWGbIy
         l3ofHQVoJtIh3Jm7dl+/09fJdyvqtCvbd7lsKpBs9BJ7zgxtH2uo5axTVz83gRy+D3O1
         F7RbNouQOaBSEOaVq55XuqulWC+D0MxskPXMir2DePHsePVWa00Bou+aCzO9OK+uCk97
         aqoccW46GnUMdx/Uar6MrdgWW8SqvXrOmyv5o9UJzQSEJM3BdBxxk0ss+YJKYjL4hqG9
         MLNg==
X-Gm-Message-State: AOAM530G+sfi6EhC23MuQRzfIJf458+yJcfYlKKiLZFfQqC2JRMhnQXi
        WwWD5Z3uO5YeJ8uY6sfZXaiyn6ptheCsLpKj+galm38ytHeSqFKTaaF9tD3KaCuEM3CYIR1mC+I
        3n4QFGeovS7WqeURhcwYRHGeU
X-Received: by 2002:a63:e453:: with SMTP id i19mr1792187pgk.134.1623211991859;
        Tue, 08 Jun 2021 21:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9HC5Bv6qB3T/yEtdheshM0zEACgeTRb+kFv+9S95dtq6BS65/TpUlvArfNquzDDeJmTnupQ==
X-Received: by 2002:a63:e453:: with SMTP id i19mr1792172pgk.134.1623211991610;
        Tue, 08 Jun 2021 21:13:11 -0700 (PDT)
Received: from pc-0115 (178.101.200.35.bc.googleusercontent.com. [35.200.101.178])
        by smtp.gmail.com with ESMTPSA id nn6sm15509433pjb.57.2021.06.08.21.13.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 21:13:11 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94.2)
        (envelope-from <martinet@pc-0115>)
        id 1lqpaX-009K8i-MQ; Wed, 09 Jun 2021 13:13:09 +0900
Date:   Wed, 9 Jun 2021 13:12:59 +0900
From:   Dominique MARTINET <dominique.martinet@atmark-techno.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/5] media: uvcvideo: Fix race conditions
Message-ID: <YMA/y9RZZmumuXVd@atmark-techno.com>
References: <20200917022547.198090-1-linux@roeck-us.net>
 <20200917124714.GD3969@pendragon.ideasonboard.com>
 <990652f1-b6e4-211c-7a96-8c3fc3ea6efd@roeck-us.net>
 <YEsZ7qnSRv0EkJGG@atmark-techno.com>
 <74c0c32a-ebb5-34e0-d3a2-6b417ce328a1@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74c0c32a-ebb5-34e0-d3a2-6b417ce328a1@roeck-us.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Guenter Roeck wrote on Fri, Mar 12, 2021 at 06:54:52AM -0800:
> On 3/11/21 11:36 PM, Dominique MARTINET wrote:
> > Guenter Roeck wrote on Thu, Sep 17, 2020 at 07:16:17PM -0700:
> >> On 9/17/20 5:47 AM, Laurent Pinchart wrote:
> >>> I haven't checked the mailing list, but I've found it in my inbox :-)
> >>> I'm not forgetting about you, just been fairly busy recently. I still
> >>> plan to try and provide an alternative implementation in the V4L2 core
> >>> (in a form that I think should even be moved to the cdev core) that
> >>> would fix this for all drivers.
> >>>
> >> Thanks for letting me know. As it turns out, this problem is responsible
> >> for about 2% of all Chromebook crashes, so I'll probably not wait for
> >> the series to be accepted upstream but apply it as-is to the various
> >> ChromeOS kernel branches.
> > 
> > We have a customer who reported the same issue recently, has there been
> > any development?
> > 
> 
> Not that I know of. We applied the series to all Chrome OS kernel branches,
> and it reliably fixes the problem for us. We'd like to have the problem
> fixed upstream; until that happens we'll have to carry the series forward.

Thanks for confirming.
Laurent, would it make sense to take the patches as they are until a
better fix is ready?

-- 
Dominique
