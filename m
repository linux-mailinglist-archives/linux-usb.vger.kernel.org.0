Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8D0272382
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 14:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIUMPf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 08:15:35 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:44279 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUMPf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 08:15:35 -0400
Received: by mail-lj1-f177.google.com with SMTP id b19so10864529lji.11
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PucaVNZG7a2BDgaEJBx2aQDY3Mss+7fBpx/BFNuY4ng=;
        b=PK5tGjd3TAf49zhOxr4p70fNV80DbbKAtaKPAFw6sZsiwhvHEu/7aeajdhmIvp+SV5
         xa5nbhquk350Fiq4PxLOs2NoWGkWH630mPJoYTp9Kiq/Z15oRqzY69CoEWgr19q+ATMF
         gFkrYaCtm/PLsTLNFw2DqYRiwrCqU97wEjTLabY5QU6cP2jv9MDjpzW1lfDhGE2sV9jx
         jYv6VxeWg6+LuE4Pb7EcXGX+lGJ3E+YaRwTPRHyWOrAS2PQJ8iFM7C43HoNARDBX1j9A
         47SFahYx4sPx0mYjZW5SPHz5XGChHj7ySIDU3DDFOR0W+g6BJA7tMQAbJl4+NrdPi/iQ
         xYmQ==
X-Gm-Message-State: AOAM533hG1RtbozANQBqBMtZY38Nq/xhbwJdGh/jH8jPqgMdetw8Vq/r
        3u6VaWPsm33Ux2hZYlkMiDU=
X-Google-Smtp-Source: ABdhPJzClL+ZxOH4BRK4jk0KvTMv7gFM4i3a6qWAn9brm/Iva/xSL1kb3JaAKpByIjsyGCMwR47mgw==
X-Received: by 2002:a2e:980c:: with SMTP id a12mr14635527ljj.26.1600690532853;
        Mon, 21 Sep 2020 05:15:32 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b141sm2553336lfd.236.2020.09.21.05.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:15:32 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKKj7-0000Zr-R8; Mon, 21 Sep 2020 14:15:25 +0200
Date:   Mon, 21 Sep 2020 14:15:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [RFC 4/4] USB: cdc-acm: clean up handling of quirky devices
Message-ID: <20200921121525.GV24441@localhost>
References: <20200921113525.32187-1-johan@kernel.org>
 <20200921113525.32187-5-johan@kernel.org>
 <1600689232.2424.78.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600689232.2424.78.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 01:53:52PM +0200, Oliver Neukum wrote:
> Am Montag, den 21.09.2020, 13:35 +0200 schrieb Johan Hovold:
> > Instead of falling back to "combined-interface" probing when detecting
> > broken union and call-management descriptors, assume all interfaces with
> > three endpoints are of "combined-interface" type.
> 
> Hi,
> 
> this just ignores a union header. I am afraid that is not correct.
> Could you move it into the !union_header clause?

And probe for a combined interface before falling back to the management
descriptor then? Along the lines of

	if (!union_desc) {
		if (bNumEndpoints == 3) {
			goto probe_combined_interface;
		} else if (call_intf_num > 0) {
			data_intf_num = call_intf_num;
			...
		} else {
			return -ENODEV;
		}
	} else {
		...
	}
			
Johan
