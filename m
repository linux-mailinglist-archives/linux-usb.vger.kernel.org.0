Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0451A14632D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 09:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgAWIRb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 03:17:31 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42335 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgAWIRa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jan 2020 03:17:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id y4so2213019ljj.9;
        Thu, 23 Jan 2020 00:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9GTPaar5aE0tOtbRNaaUNbpax0uU828acGGECrevW8=;
        b=WrA/gkR1vzAXoaUaXO7zIr5dx400WT9+gcGzWZp/Tqzl5dxnd9YY9Wt51bT3N7rcbu
         piMXjEAt3JMvtfxVUVSfI0YDSGBZfq6hk4H2Pp5HBokQuWK0AZOkjtwpb63wvKiZ53vj
         B10LQi65VDgSqZtQpGyKSNr8ACwGFoxwRl4MX5QaBSFq8m0Tbyzr+xhaCRqiCF9GGnGV
         oFPCTrPzIDubsAGY3WkEwCUa32ycydZ0UUgwS8Jz7xZ4GvvJcJKh/DU/t+mg5VYdrd7O
         kJLnJ2b8HvXxvp40M4IJGCu/xoM6DVyk43PLyIs5cf8ezb8e8KO7ycDt/x3cdOg7mA6h
         M6Eg==
X-Gm-Message-State: APjAAAV/Ft4XAafRah44PuOzz45DHBKnKVfVX323UjE5/85YtN6nqRUN
        tCuougqsgThswmEGONw4slkeV2A/
X-Google-Smtp-Source: APXvYqygxodQS2zX6OmaUQosbre6s51cwrezgdx5y6e3eeya9A6s4urmjzPyt7+hvDMRDTh19gWEUQ==
X-Received: by 2002:a2e:3a12:: with SMTP id h18mr22615722lja.81.1579767448416;
        Thu, 23 Jan 2020 00:17:28 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id r21sm703627ljn.64.2020.01.23.00.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 00:17:27 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iuXg6-0001f2-9e; Thu, 23 Jan 2020 09:17:26 +0100
Date:   Thu, 23 Jan 2020 09:17:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cyberjack: fix spelling mistake "To" ->
 "Too"
Message-ID: <20200123081726.GG8375@localhost>
References: <20200122233955.2829493-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122233955.2829493-1-colin.king@canonical.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 22, 2020 at 11:39:55PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

Johan
