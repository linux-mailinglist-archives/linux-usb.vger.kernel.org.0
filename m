Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9ED881843
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 13:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfHELgP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 07:36:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43502 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfHELgP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 07:36:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id c19so57663973lfm.10
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 04:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dPLfC8gHI3sZNkICGipvyJtZYpCb+woagnSYN8BemIE=;
        b=e1tgHh5tGEMwC29YUF9Cj5T6sZV4oiHuWn8fTUYl2FSXIx+Lh/Oy3Jm13W6g+qC/qJ
         ejw2ik9ZWJ9ImZayZX7vTZoxdJwyZaTGqs02xo5GRxBTOaabGjDKT4UFYsB75eE7yaZR
         dkbdYwDPTP0eEF+iBSb9Q6S3vQMJ+wySqCaynjiKBnHWUm2qimZElNDnsEoEvUoX3wNN
         0KWprZfb8kIOVnTHTybbShh8q5kxvUzm26Qmpq2zzELzUGQPqNCMIxKhPg5T3+Q9j5sm
         zRW8TnYHV73a2w7PGnydITo3CAmYSO1e54kfJ689RN6rAZrZ831yoff9pfNTdpCMdHDv
         NrFQ==
X-Gm-Message-State: APjAAAXEm4f0Bv4VQfy+wu431f7BcgqVFRRlxMN+9c3PlHgV5T7D01xK
        pgVpqR18So6QdGTnh7Zt2pg=
X-Google-Smtp-Source: APXvYqzUGzlzoUxHbPjLFluVrgI/NLaAPGdAljUavjad6irklL5IqVO9RB0UY5uyGL/ugCjNDggVvQ==
X-Received: by 2002:a19:a83:: with SMTP id 125mr51374964lfk.150.1565004973024;
        Mon, 05 Aug 2019 04:36:13 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id u27sm14850299lfn.87.2019.08.05.04.36.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 04:36:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hubHe-00066f-6x; Mon, 05 Aug 2019 13:36:10 +0200
Date:   Mon, 5 Aug 2019 13:36:10 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rogan Dawes <rogan@dawes.za.net>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v6] USB: serial: option: add D-Link DWM-222 device ID
Message-ID: <20190805113610.GE3574@localhost>
References: <CAOYdKdjBtYt_2CuBxaTYKXCt7En+ESdOKeJ+kEEvvcNhkYs_7w@mail.gmail.com>
 <20190717091134.GA5179@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717091134.GA5179@lisa.dawes.za.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 17, 2019 at 11:11:34AM +0200, Rogan Dawes wrote:
> Add device id for D-Link DWM-222 A2.
> 
> MI_00 D-Link HS-USB Diagnostics
> MI_01 D-Link HS-USB Modem
> MI_02 D-Link HS-USB AT Port
> MI_03 D-Link HS-USB NMEA
> MI_04 D-Link HS-USB WWAN Adapter (qmi_wwan)
> MI_05 USB Mass Storage Device
> 
> Cc: stable@vger.kernel.org
> Signed-Off-By: Rogan Dawes <rogan@dawes.za.net>

Now applied, thanks.

Johan
