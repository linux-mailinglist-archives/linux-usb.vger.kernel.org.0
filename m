Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EEB21883B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgGHM6g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:58:36 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:47007 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728941AbgGHM6f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:58:35 -0400
Received: by mail-lj1-f194.google.com with SMTP id h19so54166249ljg.13;
        Wed, 08 Jul 2020 05:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sGpd2PUy5VM8ZILsyUW1Q12OP3ayONQskEG+3a+KNbU=;
        b=EzfvnTWmGLztu8bt5Jj47Sko+62oeqxEMZL0E+zoeivE7Ep7BDzjtcenWaLPTrz9gN
         NiSmIHx7GOAricqZUTUERLyUTc3+nWTYgxniVpu8NnuXh3yNZgPzc9lU2DCuEbJIMX0r
         SWS1I8vyjqutd65nlBkV+Z4GG6kiUlengWbYWPFJLRJCAUjlytiAsXvDO7bITueutVbc
         0ZJgpMs4Ml5/+r1ylJyRxowX/G0NrwdI6Sx9enWWo4r4lgeYeTEDtVmtTjKZmlVw/s3B
         Em84h47H6PMxZnzSFsv7COMAjfSTUyOxHNddYQRXD9SyGG+maGn0f/iafy81Cew4tRun
         M4XQ==
X-Gm-Message-State: AOAM531uzJ8Sc5gR06y0xGCsjXvKS0k5lQVlFe7kr7tT0La60cXBdg/c
        llmZkUUEjHrBDHBPVp+rCt8=
X-Google-Smtp-Source: ABdhPJznZiR8oJaewi1llCYkBKGEonMv71o28/oCSXtfDWctn++zoVYni+a0ElxlWcXQb1lkJE73hw==
X-Received: by 2002:a2e:9c95:: with SMTP id x21mr26617675lji.234.1594213113940;
        Wed, 08 Jul 2020 05:58:33 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y2sm10371747lfh.1.2020.07.08.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:58:33 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jt9eg-0005bc-NS; Wed, 08 Jul 2020 14:58:30 +0200
Date:   Wed, 8 Jul 2020 14:58:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Use fallthrough pseudo-keyword
Message-ID: <20200708125830.GO3453@localhost>
References: <20200707195747.GA4354@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707195747.GA4354@embeddedor>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 07, 2020 at 02:57:47PM -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thanks.

Johan
