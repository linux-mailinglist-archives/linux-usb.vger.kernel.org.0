Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5931F24B8D
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 11:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfEUJa5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 05:30:57 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45656 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfEUJa5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 05:30:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id n22so12481198lfe.12
        for <linux-usb@vger.kernel.org>; Tue, 21 May 2019 02:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gfnizI+7Mqtqn/mcADi8sQQq1aQCn9xpDJJCvngM8c4=;
        b=CM1Ahu+b2Y9Rcwbn2nbnAHkFVu5743ajUSvZt2e4YiLE0b2kZPZnxOEBagqFCtyIfZ
         z+tg0Qcfwuu+UcIjIhEZGPiHbaT6kxxV6UHOxRRNHpRtVN2eLgMtkXiGL7GJxeyquwri
         cTc96Z0ufF21yLqn8CNDJnDl43+rNYrN+5oL8yREThQegvv6U5XBFG2yspEWk2u/tQux
         +HzQizQNzayXpqrWrNLWh+8CLN1muuotC1Pd5SBQdKmO4V1u0LuVS6lATmX9LZTx4x1R
         Dro569S2TDcAby+tbVUdBXNdjyQ3F0vv5wfgvRiS30zwh/GUq5I3XU2xPFv1QxZaFD45
         8a3Q==
X-Gm-Message-State: APjAAAXtbfjuHhD0Koi+H+JtkptWHBhNNrSo3dfdhIxYRIs2WutUmLLI
        OaBFYStWX5Sw2V+ldU6ryG8=
X-Google-Smtp-Source: APXvYqzdKAWb/JUQyy53PoBK0FQIE5SXqMB1mUB0c/btMZILS7aj1dytINBL/65AWmKerJ2Cdk5BYw==
X-Received: by 2002:a05:6512:1c1:: with SMTP id f1mr1090408lfp.125.1558431055275;
        Tue, 21 May 2019 02:30:55 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id n9sm1185066ljj.10.2019.05.21.02.30.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:30:54 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hT16g-0007Pe-4Y; Tue, 21 May 2019 11:30:50 +0200
Date:   Tue, 21 May 2019 11:30:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit 0x1260 and 0x1261
 compositions
Message-ID: <20190521093050.GP568@localhost>
References: <1557934069-8389-1-git-send-email-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557934069-8389-1-git-send-email-dnlplm@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 15, 2019 at 05:27:49PM +0200, Daniele Palmas wrote:
> Added support for Telit LE910Cx 0x1260 and 0x1261 compositions.
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied, thanks.

Johan
