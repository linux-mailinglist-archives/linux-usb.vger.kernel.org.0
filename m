Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D47F429C6
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 16:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732555AbfFLOrq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 10:47:46 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35869 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbfFLOrp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jun 2019 10:47:45 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so15364263ljj.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2019 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uIQDRabCfmjZ92D5uexPHtee+FQNiKE+mEbCN3RV92c=;
        b=iwz+0A5IhHUmh62gf7sVxDhjZEtMnzMCUJiDTwrH9XxcK8NxeF8n07V8EgYOJOp3QY
         Ca0bd1vK6DGEStbvIhsRQJJ9n7sXa2a9iyFEduJIbhyMDtAl9AD06weNpaMZXmT71Arr
         3kouIXtwZe2AFrupRDg1BBqET2xs1P/pw2c+EtRN8Ry8Y0o7zIQJ2vxHdFtlUi1u4YFY
         0iyAAyzSTfJyZTKvW4aUUlHmKIoQx/W5oZ0RYxaDN9UYa9CrXJ+uunyipIwxAj/IaLKm
         FxQLHSs4rNIpUybLfhixnvHrN5N7wB3WPQBTbl2cPDWem0pabnorkATxtapgg01rql/d
         ekMA==
X-Gm-Message-State: APjAAAXb8abY8vlpkpdy0lFFp4QlGcZeRqtp0Bu49bFlgbjn76AhF9Xk
        DkSnRqfDddbCGAzjH3DjUdAYakUAQMw=
X-Google-Smtp-Source: APXvYqzP3FvvysMeLqwwKWcV06nKC6e/ojmI7Tf9HXyYpzQmNip2HuBRPwwVyemVIVn3WG431PnXUw==
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr43254259ljc.135.1560350863793;
        Wed, 12 Jun 2019 07:47:43 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id j11sm14667lfm.29.2019.06.12.07.47.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:47:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hb4XS-0004ly-Va; Wed, 12 Jun 2019 16:47:47 +0200
Date:   Wed, 12 Jun 2019 16:47:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN
 (TYPE_HXN)
Message-ID: <20190612144746.GA18153@localhost>
References: <20190612131842.4200-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612131842.4200-1-charlesyeh522@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 12, 2019 at 09:18:41PM +0800, Charles Yeh wrote:
> Prolific has developed a new USB to UART chip: PL2303HXN
> PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> the existing PL2303 series (TYPE_HX & TYPE_01).
> Therefore, different Vendor requests are used to issue related commands.

> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---

As I've asked you several times already, make sure to

 - add a patch version to your subject (e.g. [PATCH v5], or which
   version number you're currently at)

 - include a changelog here, below the --- line, so we know what changed
   since previous versions

 - fix up your subject line (add a space after each colon)

Please fix up and resend.

Thanks,
Johan
