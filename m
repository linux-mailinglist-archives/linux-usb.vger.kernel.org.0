Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB17B2A61B1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 11:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgKDKfK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 05:35:10 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42424 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgKDKfK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 05:35:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id k25so22413569lji.9
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2020 02:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qYOZjaUNy9zsoXmjp5F2pdKHK9lZuEmr6Z7OgwMyA+Q=;
        b=BvSIPNnRB/mwlDT9hvWhZ+GNMIqXBk0npp+uqf4MCXPiP0Y3LuNoI7dInRc8sEvxnH
         clJ7iG/CcwRXpF3CzcR74VvVH0QJQtNl5kgp+5ZKfVuvUXBib3SVTmj5VDBJpHkrBykn
         9bBBqWxVPPmCRjNBxhs+mR66V8c5GArz5D/G+4B0HWeH0P2t6uExZmaxp5Yz6GRiPgmG
         BzwR7faDhdoKich2tc+mwWjvsSfEeIK1bj5a0GNCPuvXvs06EBy3wDsDXDqD6Xpo8COM
         VlXrto9zCN6Cdvyc54ktTeT3xZT1BLhpTT0cGj4Y1hVoh7aFSc1h498C92I8uClOacBA
         ZsWw==
X-Gm-Message-State: AOAM53269dZ7ET6kWlsu/t1U+WzPCXJJWXhbFuZxVvTixxSQyerGy8na
        ZgeTFWFFqN+fYrBfIYBpRyc=
X-Google-Smtp-Source: ABdhPJwNINEJ83I3xfU1U4TMzLTTcBeAfYlwdnqI3LZ+v91jnLOb1fQNXYOo+IyVMFtps7OlH7pMIw==
X-Received: by 2002:a05:651c:103b:: with SMTP id w27mr10039674ljm.323.1604486108606;
        Wed, 04 Nov 2020 02:35:08 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id i63sm369187lfi.53.2020.11.04.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 02:35:07 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kaG8F-0003f2-Tw; Wed, 04 Nov 2020 11:35:11 +0100
Date:   Wed, 4 Nov 2020 11:35:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit FN980 composition
 0x1055
Message-ID: <20201104103511.GU4085@localhost>
References: <20201103124425.12940-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103124425.12940-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 03, 2020 at 01:44:25PM +0100, Daniele Palmas wrote:
> Add the following Telit FN980 composition:
> 
> 0x1055: tty, adb, tty, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Hi Johan,
> 
> following lsusb verbose output for the composition:

Applied, thanks.

Johan
