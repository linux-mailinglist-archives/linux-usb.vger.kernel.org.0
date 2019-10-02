Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2FFC4AF5
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 12:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfJBKDk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 06:03:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39029 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJBKDk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 06:03:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id y3so16473033ljj.6
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 03:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7v/pPWiarTyQPCnBXZxgu015OwwwwQUCX5bNLonlHlk=;
        b=W7NaAQb5HdGcTRwekBk/Srs8dbmndax3PXRbRlFV8hTOkutxmLKPDUma4f7KJ6zBSV
         MXVqGsG8Q2BlK1va1BSMIloZe9o5M7ZGGBpUR7lkjf3uT45IuCz3KpgWzppMyQ0czeiS
         dm+cszGcjC5+hOVgIb9nUHYOGmQBb6NIR1m94Lwy4oLzaXlNXq5cmsQilwkme1+Pc+SG
         eHfV9Bl5aYp2JJcTtAdJtIJ0riXL3wElEOKOG/MJaTvt3/rgbLPZkJdjQJeHjhwnBwOR
         dUyZm7vYxWT2x3c/OIubQLahuVfIvj9Y1EYpK2RsxNA7RK0fL4YqITayBAFZ27ZF/g6K
         LE6w==
X-Gm-Message-State: APjAAAUxzFPVwhp2RKMaNCXKI4t579ACwvCVWlUw1rKnNl7BR6OyqHBz
        fs2E6zTr5RU9ZCBLmhFifyU=
X-Google-Smtp-Source: APXvYqzNmcCrJyPRENV+Tx12mS2yMfF9LhCshCTEMG2EqYnq4x8D8GYw2+EtLHDLSucwmMIsVu3ACg==
X-Received: by 2002:a2e:a316:: with SMTP id l22mr1823330lje.211.1570010618738;
        Wed, 02 Oct 2019 03:03:38 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id c21sm4586235lff.61.2019.10.02.03.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 03:03:37 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iFbU3-0008H9-IW; Wed, 02 Oct 2019 12:03:47 +0200
Date:   Wed, 2 Oct 2019 12:03:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: serial: option: add Telit FN980 compositions
Message-ID: <20191002100347.GS13531@localhost>
References: <20190923102328.10627-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923102328.10627-1-dnlplm@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 12:23:28PM +0200, Daniele Palmas wrote:
> This patch adds the following Telit FN980 compositions:
> 
> 0x1050: tty, adb, rmnet, tty, tty, tty, tty
> 0x1051: tty, adb, mbim, tty, tty, tty, tty
> 0x1052: rndis, tty, adb, tty, tty, tty, tty
> 0x1053: tty, adb, ecm, tty, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Sorry, forgot to add Signed-off-by tag...
> 
> v2: added Signed-off-by tag

Now applied, thanks.

Johan
