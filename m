Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0431606D
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 11:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfEGJQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 05:16:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36470 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfEGJQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 05:16:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id y10so4591954lfl.3;
        Tue, 07 May 2019 02:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DlEglguaiieWainmB6CookFpKtGQoycaJbZ7vQH3U5E=;
        b=h0fU9kKxjSE2GvZwLgXko/HuxiSvxwI1RFmbz8OH7icR/m9c+L/sc1LY261fEiqIQ9
         mshYbAjbaBltLS42RbSBgiD7JLCu7maYwYXw9q2Usn5weAa7cwaBOtLYGOsqRazp2Btj
         Te8FRJk4dolQfT+O1tbwX8r8cdS1OpHBPEAraqSSnSse4nG1783oYZBrAzb20nCFSW13
         i5qm6x+zsYlCgYpgZmF0hmr6CEB+hf0VgqW1wh+lZIj+Oikrzhvvp8+bM+vVEWZZQX0r
         rrHdUg2KMr1Ipx92mVQoFkKEV3KBzQTk8Ak9G/cLy7J3JlABp8/P7usCYSY5nTjWQu6A
         AFZA==
X-Gm-Message-State: APjAAAWHKY1sZVQRhJOc8GHwfQkSpQ3tWlGQ87ew8ovIH/IHyJx8/uI0
        uPtDV99gNg/1nA81lCNGvdM=
X-Google-Smtp-Source: APXvYqwUWM5dimsGaY25oe2quIiXimhjh2gmbGxD928C4b55GW28qRQQnInQRQnRzvDFeii/QvuG3A==
X-Received: by 2002:a19:4811:: with SMTP id v17mr15464511lfa.10.1557220597601;
        Tue, 07 May 2019 02:16:37 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id w3sm3085894lji.42.2019.05.07.02.16.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 02:16:36 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hNwDE-0007EU-37; Tue, 07 May 2019 11:16:36 +0200
Date:   Tue, 7 May 2019 11:16:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, peter_hong@fintek.com.tw,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: Re: [PATCH V9 4/4] USB: serial: f81232: implement break control
Message-ID: <20190507091636.GE4333@localhost>
References: <1556587352-19500-1-git-send-email-hpeter+linux_kernel@gmail.com>
 <1556587352-19500-4-git-send-email-hpeter+linux_kernel@gmail.com>
 <20190503065917.GA26546@localhost>
 <84cff579-79bd-9456-aa85-cb4510d916ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84cff579-79bd-9456-aa85-cb4510d916ed@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 06, 2019 at 10:52:27AM +0800, Ji-Ze Hong (Peter Hong) wrote:

> > You forgot to update shadow_lcr here so the line settings would be
> > corrupted (e.g set to 5 bit words) whenever a break is signalled.
> > 
> > Did you not test this version of the patch?
> > 
> > I added the missing update, but please test the code that's in my
> > usb-next branch in a minute and confirm everything works as expected.
> > 
> 
> Thanks for mention and patch the lost parts. I had only tested the
> break signal and forgot to test full LCR. I'll add it to my test items
> and it tested well on new usb-next branch after your fix.

Thanks for confirming!

> BTW, Should I disable break control when port close ?

Yes, that would be good even if many tty drivers currently fail to do
so.

Johan
