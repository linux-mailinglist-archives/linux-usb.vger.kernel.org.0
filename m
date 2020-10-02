Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2D6280DC2
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 09:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgJBHB7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 03:01:59 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46203 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBHB6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 03:01:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so326740ljp.13
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 00:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1BnrX27+prQRJRNwGZWZtT64hnMA+2EyDsdJm6xJ93M=;
        b=E5StnfiG5iXtDpqWJdYCdPSSVpt7tJh18/k40L8ZS0uuWwPY/H7YOSC+uMj261k8Zi
         kqzGCRWOsdYwBPER0kK2nGD8HsgPs5A+9lp4ufv2ygJePCSMqcWnxJ5M2Nmj53XLFXwg
         RditZiFmmbc1+oMhnd6x1hIim0+yvlwaN9w5/wUEQJS8wAyZf92l/YtlwyZeMu1D/9d3
         kBlDTMz+08vm9vR0GPGmE2sMnThea6e3yBw4g2+BDPSs0vji+2GaE+zHB8dER6dk5jZa
         qiD+p87UcxG6ctZ6wMvk8tnXRR80H1vPyGELg6ZN88UvqvAw316e9IA+h6ETBHRfQnYk
         SIgQ==
X-Gm-Message-State: AOAM532HWlF4iwwYXA6yM9vL1LIsJYSlqO/EXcsNHY8z8CO9TJLNfe8P
        AI5978Zu44j6Ub/JdXchHi0=
X-Google-Smtp-Source: ABdhPJxW1Tk2JxQ+maDf6wrBO7TafFTVckMrtWZS8LgXYyBnZdAFerWPD4+HDiXL5MJ8D74nAMv1AQ==
X-Received: by 2002:a2e:8705:: with SMTP id m5mr264643lji.459.1601622116684;
        Fri, 02 Oct 2020 00:01:56 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k14sm127280lfm.90.2020.10.02.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 00:01:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kOF4e-0006VY-L1; Fri, 02 Oct 2020 09:01:48 +0200
Date:   Fri, 2 Oct 2020 09:01:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [RFC] ftdi_sio driver: use altsetting or cur_altsetting?
Message-ID: <20201002070148.GF5141@localhost>
References: <CA+uuBqbCtc3EB0zPUE1WJ9s_+=Oyc5aHzYqUug7D4GpcsgoJcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqbCtc3EB0zPUE1WJ9s_+=Oyc5aHzYqUug7D4GpcsgoJcA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 01, 2020 at 11:20:08AM -0800, Mychaela Falconia wrote:
> Hello esteemed linux-usb folks,
> 
> While I am trying to get a little quirk for my custom hardware device
> added to the ftdi_sio driver, I noticed an inconsistency between use
> of interface->altsetting vs. interface->cur_altsetting in the existing
> driver code.  Specifically:
> 
> * ftdi_determine_type() function uses this construct to get the number
>   of the interface it is operating on:
> 
>   inter = serial->interface->altsetting->desc.bInterfaceNumber;
> 
> * ftdi_set_max_packet_size() uses interface->cur_altsetting to get to
>   desc.bNumEndpoints and endpoint[i].desc
> 
> * The JTAG cleanup patch which Johan just applied uses
>   intf->cur_altsetting->desc.bInterfaceNumber

Yeah, I noticed that too.

> So which is the right one to use, intf->altsetting or intf->cur_altsetting?
> The comments in include/linux/usb.h say that the altsetting member
> points to an array of struct usb_host_interface stored in no particular
> order, so using that pointer in ftdi_determine_type() seems wrong -
> but then I am a total novice in this area, hence I am hoping that
> someone more knowledgeable could confirm.

As long as you only access bNumInterfaces, which by definition is
identical for all altsettings, it's not wrong per se. But in general,
drivers should use cur_altsetting to not have to worry about such
subtleties and as a safe guard in case further fields are ever needed.
 
> The most recent version of my DUART28C quirk adding patch uses
> serial->interface->altsetting, copied from ftdi_determine_type() -
> should I change my proposed patch to use cur_altsetting instead?

Yes, please use that for new code.

> Should I also make a patch to ftdi_determine_type() changing it to use
> cur_altsetting as well?

Sure; it's not needed for correctness, but let's do it for consistency.

Johan
