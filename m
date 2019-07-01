Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA52C214B5
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2019 09:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbfEQHmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 May 2019 03:42:54 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42043 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbfEQHmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 May 2019 03:42:54 -0400
Received: by mail-lj1-f195.google.com with SMTP id 188so5378670ljf.9;
        Fri, 17 May 2019 00:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oHNi3Q7jru9V7QHeQJrbcvrvhDMwQwJaNTkhpVbOPeY=;
        b=nlZN5KR0N7jvQqLFbSGPTwgMqSKoaX1LPjdM6GeU9/GZuJbZP7lltcJdgPioCZUBg/
         IM+F3bzOBkKSue/JToywsm4egduquenAUaHpVJpOt/xIuvEAyayMDk6Dbag9WRppVIRZ
         leYQM+v4rN89e7x+HTUTWSjKnvp6iP4G+07Wphaw5BI5o4aay0mZqdGjzBJho34c+0fb
         z1pES0fjwLPl9t5LgYLVVpHpavqzn1iF85ROkTGv9EGt9Kb+3mCK/OQ1FvJ/FhdoFWAn
         7fF7t5bHcDv/+Psav4h//ww0Z+dSENcTYk/I7wdvsglM8FIrFxpH0lTIIKEb/JUzfENP
         nl5A==
X-Gm-Message-State: APjAAAV/PChIFX84d5kI1iqEHOozsWnn4I+hAptMkKRdGarAwdTydSPf
        Ofdat4jGlhqHaKhDKUF5V/Mq+Czg
X-Google-Smtp-Source: APXvYqxr66sn/KNjZu/bBP4IB6022Cmga4g3l932SwBwSoNm8SDJXM0CuwDynX5Xkv2GevcPszIh7Q==
X-Received: by 2002:a2e:84a:: with SMTP id g10mr16425895ljd.98.1558078972663;
        Fri, 17 May 2019 00:42:52 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id k81sm1290928ljb.77.2019.05.17.00.42.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 00:42:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hRXVw-0002Pt-Lr; Fri, 17 May 2019 09:42:48 +0200
Date:   Fri, 17 May 2019 09:42:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     parna.naveenkumar@gmail.com
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mos7840: Prefer 'unsigned int' to bare use
 of 'unsigned'
Message-ID: <20190517074248.GD28564@localhost>
References: <20190516130759.12996-1-parna.naveenkumar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516130759.12996-1-parna.naveenkumar@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 16, 2019 at 06:37:59PM +0530, parna.naveenkumar@gmail.com wrote:
> From: Naveen Kumar Parna <parna.naveenkumar@gmail.com>
> 
> This fixes checkpatch.pl warning "WARNING: Prefer 'unsigned int' to
> bare use of 'unsigned'".

Please don't run checkpatch.pl on code that already in the kernel
(possibly with the exception of staging). Use it on your own patches
before you submit them if you want, and even then don't blindly follow
what checkpatch says.

Minor coding style issues are better left alone to avoid adding noise
and making code forensic and backports harder.

And in this case, there's not even anything wrong with the current code.

Johan
