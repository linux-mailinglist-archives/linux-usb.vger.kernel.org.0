Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D7024B5B
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfEUJVe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 05:21:34 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44605 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfEUJVe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 05:21:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id e13so15134062ljl.11
        for <linux-usb@vger.kernel.org>; Tue, 21 May 2019 02:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GjXeY36K9eURZGlESSdjq/2Rivy4FImcA1WN1oLuKWo=;
        b=eZwd18tkqC9fQW2UvoJpauRtMCiCFD3PmJhfyGXhOQXFd5UmMcU+djjq8p4kkSl6Bx
         bYPB7nfrTNs4Rq0OvLn/XZevauf7aAxMmQvLOvsKNbyogNqRXI3U/7DKu21+irIJqC0l
         g/Zc5POzNPhoZMA/omU2C8thUAMUxxzLGNvVcU+wpbCplcryUPil/S3M+ZHRiS8/+xB5
         Z/aiv1P3GsNCRQOkTe6lETLeZu5cTbcRrBpoTsq1jUNUHNgv30qOGuIoWWAlkqSBtkhY
         iVCcgmmUF9oGgOxGG4nbDP4aAMtbo5HNH4XbT4Cd5WXyINrFHtzZndiGvx1beFfBuBiy
         2E5g==
X-Gm-Message-State: APjAAAWnbPnOSLfzaWJaSPA59p8u4Ydv125CRCwhELExReF9/ur+pHh3
        MMFu6GC1r7XNi9AkEXNjwtRFfUiJM8Y=
X-Google-Smtp-Source: APXvYqzofapQ7sks7P3tAb4kd9i3bu99P4oq9jU8mFmU/IVmlhSVtM2GsBxxbDLznbagtu2HEzY95A==
X-Received: by 2002:a2e:5d4f:: with SMTP id r76mr25002299ljb.49.1558430492385;
        Tue, 21 May 2019 02:21:32 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id i187sm4665786lfe.64.2019.05.21.02.21.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:21:31 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hT0xb-0003ig-6k; Tue, 21 May 2019 11:21:27 +0200
Date:   Tue, 21 May 2019 11:21:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?iso-8859-1?Q?J=F6rgen?= Storvist <jorgen.storvist@gmail.com>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for Simcom
 SIM7500/SIM7600 RNDIS mode
Message-ID: <20190521092127.GN568@localhost>
References: <20190513183752.00005ee2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190513183752.00005ee2@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 13, 2019 at 06:37:52PM +0200, Jörgen Storvist wrote:
> Added IDs for Simcom SIM7500/SIM7600 series cellular module in RNDIS
> mode. Reserved the interface for ADB.

> Signed-off-by: Jörgen Storvist <jorgen.storvist@gmail.com>

Applied, thanks.

Johan
