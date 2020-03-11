Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067B6181305
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 09:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgCKIdX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 04:33:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41072 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbgCKIdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 04:33:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id o10so1298395ljc.8
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 01:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8lgtwICNGuDTpGGtKnsw0OPis7+rbGTkiihNiXubVJc=;
        b=sESvrKyWQnmclmkVli50guL7gBsYwmvOyCf3c5BxkbKQFYFyAPslv4ZvwZRN6AhRfF
         DWEi4ALNNZsJv5VDRNly0rqoSLhXvr5TIiMpEzYyHNYTJlqlMDj2rFHWeGvfR5OYy3Tu
         xX6voIPA8O2a99OOQcjNYg3el9YgAxbx4FHf5j/mkQ9BWkxG+/MCEdFYZqr6rCf6cglA
         b59yRzdNzsoEO5uc33QwlhiDGJmf4rK0jWpop/eDQzD4J9ilJuZl1Rb8PzgjW6d7jsBf
         c4yW9e5Ta8LRwHPQ6/zpfQPqfc0SxDQN1lkj7sjNExXZQ7jVnTea34n9vmPpYoWhhfL1
         B5Hg==
X-Gm-Message-State: ANhLgQ2hQXl8Mcz3a/U45lGmiqRThsZ5UKOlpAbagb0cZpQlJ7ux5/3v
        O7TSS8lgSeNxCj7bzOxrmbx+gDfU
X-Google-Smtp-Source: ADFU+vvoZcglCLT0wz32w/v0DLp4Ti9IReqmBXmGV30xhK1fGPOAduLEXpGht0jOlzqLJe2tVdLa0w==
X-Received: by 2002:a2e:a556:: with SMTP id e22mr1452147ljn.130.1583915601397;
        Wed, 11 Mar 2020 01:33:21 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id m17sm3842326ljb.61.2020.03.11.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 01:33:20 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jBwnc-0000rc-8s; Wed, 11 Mar 2020 09:33:08 +0100
Date:   Wed, 11 Mar 2020 09:33:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: serial: option: add ME910G1 ECM composition
 0x110b
Message-ID: <20200311083308.GE14211@localhost>
References: <20200304104310.2938-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304104310.2938-1-dnlplm@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 04, 2020 at 11:43:10AM +0100, Daniele Palmas wrote:
> Add ME910G1 ECM composition 0x110b: tty, tty, tty, ecm
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Hi Johan,
> 
> following the lsusb output, thanks.

Thanks, Daniele. Now applied.

Johan
