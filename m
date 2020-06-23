Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A94E204D36
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 10:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbgFWI7e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 04:59:34 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38043 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731887AbgFWI7d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 04:59:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id t9so2317962lfl.5
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fvAEFObXPwowlhY3utZTnpUVnmZUs8+hrFXRQcv5crE=;
        b=ZjQiD+zOC19q3xsqMB9TZQZCSCR9v4DW3dtBszT9aVzJQOvZ6MKnKZrOGFVyZ+RyYU
         6l3XQB9+5eLmv5AV569GSoRxw7qTaM5cuW4QtCkmvhRS2IWuG00eXPlxOVCYQ39r/mG5
         uWT4gxHRCxAE6s1qj//zs9/oURa5MFsHF5E+ZtJJOR+JmB9LitIfh/kInKBa+S/+Gaap
         KYnOSQrs6psID6GND1q7NH6+GVW15hj7dVu/AVclPl9bazZdIRlBCycRRL6yxtN8DS9N
         QiErfIpX0Y2pH/NLHIwDQEjyaOn9rc7L/CmmV7yRS7NhvZbdJbHTFq+A6T4I/5FhBDOj
         +Tww==
X-Gm-Message-State: AOAM53326yiam+6xCOz6QuNHCyokjvbmmzVtarah9VsAYQOi/dZB0KS+
        QWoYDYm4xBzbwLbRYNIblYo=
X-Google-Smtp-Source: ABdhPJy8I/A5Nj2SSAwAq05alz2pgtG9cwR+crFP+T7jXZtjolZHgJ35lUkWlC2rC8Qc8MOltyi4UA==
X-Received: by 2002:a19:2292:: with SMTP id i140mr11869641lfi.95.1592902771670;
        Tue, 23 Jun 2020 01:59:31 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o19sm3136918ljc.23.2020.06.23.01.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 01:59:30 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jnemA-0002vG-0B; Tue, 23 Jun 2020 10:59:30 +0200
Date:   Tue, 23 Jun 2020 10:59:29 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Igor Moura <imphilippini@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: serial: ch341: add new Product ID for CH340
Message-ID: <20200623085929.GH3334@localhost>
References: <20200623081111.288952-1-imphilippini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623081111.288952-1-imphilippini@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 23, 2020 at 05:11:11AM -0300, Igor Moura wrote:
> Add PID for CH340 that's found on some ESP8266 dev boards made by
> LilyGO. The specific device that contains such serial converter can be
> seen here: https://github.com/LilyGO/LILYGO-T-OI.
> 
> Apparently, it's a regular CH340, but I've confirmed with others that
> also bought this board that the PID found on this device (0x7522)
> differs from other devices with the "same" converter (0x7523). 
> Simply adding its PID to the driver and rebuilding it made it work
> as expected.
> 
> Signed-off by: Igor Moura <imphilippini@gmail.com>

There's a missing '-' here in the SOB tag, which I added.

Now applied, thanks.

Johan
