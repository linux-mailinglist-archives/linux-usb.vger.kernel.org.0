Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3BA12047D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 12:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfLPL4L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 06:56:11 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42208 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfLPL4L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 06:56:11 -0500
Received: by mail-lj1-f196.google.com with SMTP id e28so6456660ljo.9
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2019 03:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cymcoWZwZtY1DlrJCl2F/rsYYlQ6eY3w9iDQzuZBCVc=;
        b=P/RSYLGjesm7By3a3e/phZyD/KWKzvgKjgtarOCZUtpPDSdYEUj00fw94qUqxXczQ0
         f55RoPRmFZ2yKczy1MrOcw6RFnQQhlOYcF2q8SQ81tgEdaBZfd7pZY5wCJr/0HuuZ8VI
         sBQBTmWxYNh3n6/1UaZzmCDx6nAvMp2DZPBaEd4raEIK4jWq02njxr45pxcjxwJdobcv
         H22oo7NYvBk/PF/JPbGuJF1JwHAFhmfbisnYSnEvldpsTo8Anzp22Gj3xdaW1OhGM18P
         oxrkF3lR5I0/R2w5d7O/vJlkL7BojgT2uG5uKD3lw6yIF9RAPkvbzxIewlL5xgkzJbx5
         /ZZA==
X-Gm-Message-State: APjAAAXANq5mx3qvqFK1NDzbGCylGVHyFR6ww2gCLI1V3bSREBqnruEl
        Np3mQTqXJC4qxWoh4XTfC6E=
X-Google-Smtp-Source: APXvYqxXNIfJOxb10VlF1g7i5j6eE4mnyPHb8xfDwleKjH7t4UzG8eh+7FPItCx1DnPWjTAoQ6Fpsg==
X-Received: by 2002:a2e:8416:: with SMTP id z22mr18617070ljg.162.1576497369264;
        Mon, 16 Dec 2019 03:56:09 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id b17sm8665157lfp.15.2019.12.16.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 03:56:08 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1igoys-0003gt-5X; Mon, 16 Dec 2019 12:56:06 +0100
Date:   Mon, 16 Dec 2019 12:56:06 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit ME910G1 0x110a
 composition
Message-ID: <20191216115606.GB22665@localhost>
References: <20191213135615.24286-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213135615.24286-1-dnlplm@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 13, 2019 at 02:56:15PM +0100, Daniele Palmas wrote:
> This patch adds the following Telit ME910G1 composition:
> 
> 0x110a: tty, tty, tty, rmnet
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied, thanks.

Johan
