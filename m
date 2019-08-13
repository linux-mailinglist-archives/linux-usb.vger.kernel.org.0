Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23198B33D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 11:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfHMJC2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 05:02:28 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39027 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfHMJC1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 05:02:27 -0400
Received: by mail-lj1-f193.google.com with SMTP id x4so8708674ljj.6;
        Tue, 13 Aug 2019 02:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wTepSsVHXSW1eYjUwZ1pH3F/70zTR4Vl8GGiERGTF58=;
        b=BJ553ZpMJar1x18XVn344g4dDsvDk+TE6Ifi4t/meZqWMR/HLmX1E0cba7nAS2XQo5
         HGg5Oqj9kO+xOhqPihS1cUGNZh/UllmgQrrIp8RsYGqm8GVTB9InuF5dHqAlH0ulKmHV
         q9XSam4sn8Srk9EjZYEDYwPIxVrHmxn1eRsuRwEIF8BjlFofc/c0AL8MsSXpny/odCDO
         TEv/jWPje6JARQ/8GZ31efMy/HsBzsxXCwjh76Cpk+Vv+eh4ZXU4z+yzzUF7DK2sNItT
         6K1vyEv6uG/hw0V3MG8nreu9oXHdtuJ0Eifvh/Nz9gLaBXBJBDgJDrb+G9MeNU3Hfdoj
         1ajg==
X-Gm-Message-State: APjAAAXMCSqBI2dtCyQscqw7Hq/FBpZDT5OeZeeD+77S3DAA0YG90B69
        6z3wzatvKg2KfMUHt7bp7cs=
X-Google-Smtp-Source: APXvYqyQDKfZciI/rmUWmSfMPVbOpC9DONeUAS0NpBb7V9bk9PSuAZCXunVTpeF0Jjfinv37w8/Kbw==
X-Received: by 2002:a2e:7001:: with SMTP id l1mr8898124ljc.48.1565686944801;
        Tue, 13 Aug 2019 02:02:24 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id a15sm5244210lfo.2.2019.08.13.02.02.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 02:02:24 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hxShA-0002zA-7R; Tue, 13 Aug 2019 11:02:20 +0200
Date:   Tue, 13 Aug 2019 11:02:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Matthew Michilot <mmichilot@gateworks.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Michilot <matthew.michilot@gmail.com>
Subject: Re: [PATCH] USB: serial: ftdi_sio: add support for FT232H CBUS gpios
Message-ID: <20190813090220.GC15556@localhost>
References: <20190808222348.4428-1-matthew.michilot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808222348.4428-1-matthew.michilot@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 10:23:48PM +0000, Matthew Michilot wrote:
> Enable support for cbus gpios on FT232H. The cbus configuration is
> stored in one word in the EEPROM at byte-offset 0x1a with the mux
> config for ACBUS5, ACBUS6, ACBUS8 and ACBUS9 (only pins that can be
> configured as I/O mode).
> 
> Tested using FT232H by configuring one ACBUS pin at a time.
> 
> Review-by: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>

Also make sure your SoB matches the From line.

Johan
