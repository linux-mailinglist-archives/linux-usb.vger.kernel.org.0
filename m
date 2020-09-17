Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DAD26E2DD
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 19:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgIQRtz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 13:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIQRtv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 13:49:51 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C868AC06174A
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 10:49:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j34so1787658pgi.7
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 10:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uJOZjCz22rsb2M8KHMxFT3T5/rPSE/Xa1w1ssZk6pgk=;
        b=XsB0DSd6yKSu2xDT5MTIShNJE2ZrsyKcqCHH26pjFQtCfw9f5u1e2LdZ0tjdfJVDMO
         K7uzLcFH4YlH0JA78PwfzUkEl4tFfVidcWNKh3XcxDbC4OWtILub09T1i9Wv5U+cxznR
         9m4N4nwdxXd+FKicebrlij1Rh8cgSfx1izRo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uJOZjCz22rsb2M8KHMxFT3T5/rPSE/Xa1w1ssZk6pgk=;
        b=OAliOTUKGLBiWLHFvmI+d/+DgCw/HyTiS3y0iyLuj6AZmFlFSmwEDpbMCJVOum1jf9
         bJhWsZAYbLKU6EgeM/5+aVtRtr7xtn7vrlA/0yZ6BLEBdMiPbdRNoOU3agvmMhRboI9d
         N6g/3HZ3hCGHmPRO7UOHykcWn5zTwibwlwzxghdNWQDB0tRdT1TlvZHVtsUsQiKjXDIN
         +1dsR+8XNbGfKOT77PzmpapJZ4tnOLY7kG6Mgu5FmYJr6Lg9kIzy3pMy4RDDN3gYfWIp
         cqiIDpOdcJhyLGN5937rKWE5K5P0R0F2KWlotzG5n8+WdRwwI/PeV+sIkOb5eZFDK2Zh
         5KtQ==
X-Gm-Message-State: AOAM531L1zR+bZT0PmzlvS6Bzu2Gb2IAcEFLdK9RTcStD+gM7TnKyoLB
        roJGN9F1g/CocFVcXO4sA3q2NA==
X-Google-Smtp-Source: ABdhPJyL8AlprIli3UvWZa206kMZ2e7LH427dBdFcdUIBFhcgUDSr9PuXb11XL83nxb8Q3wX9gz3Gg==
X-Received: by 2002:a62:3812:0:b029:13e:d13d:a062 with SMTP id f18-20020a6238120000b029013ed13da062mr26565176pfa.40.1600364983426;
        Thu, 17 Sep 2020 10:49:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id c201sm239745pfb.216.2020.09.17.10.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 10:49:43 -0700 (PDT)
Date:   Thu, 17 Sep 2020 10:49:42 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 5/7] usb: host: xhci-plat: add wakeup entry at sysfs
Message-ID: <20200917174942.GB21107@google.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
 <20200817094440.23202-6-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817094440.23202-6-peter.chen@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 05:44:38PM +0800, Peter Chen wrote:
> With this change, there will be a wakeup entry at /sys/../power/wakeup,
> and the user could use this entry to choose whether enable xhci wakeup
> features (wake up system from suspend) or not.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
