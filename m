Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF01B24B6F
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfEUJ0w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 05:26:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36809 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfEUJ0w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 05:26:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id z1so15206488ljb.3;
        Tue, 21 May 2019 02:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jqkCAzcDBAVsT/gX9w1UAejB6xZQAwav9MJN5UCwHY8=;
        b=IWIqd0C96bJThCDMX9WhN9Dc0WnGlGGSLy1mubGz4rntQWW+d6/xdIxlThEO3gMIGZ
         2GMG92IieCSrNMtJ74ERMFmKKGv1uiIsIEx085EZtqyVqaQIjBU9Z9XBYnBJW1n4XNG8
         Wg6CKIeGao2QwZAwFMFTGgrhn3Vj2bwCiulq2FYBCBlsJuf6gukhsSp1hGw8wuLGt/tm
         KWwY2v/pvaQf3w5re4tC8IrnLovpNc142cdHdL32XmFPk6eXb4lpTtA7038jjdK9dpwS
         2y/vxxZ6UoqByIpEReyLoNpEQpbP32SwTamPVNK0SDyqJ7iLxpJQvvJCBC1qZKVfGu8o
         qnaA==
X-Gm-Message-State: APjAAAVS+l0T9hUUBR2Jff04DARxlyf6kJTHfeKUZT2FabZSOeWKtV1N
        W7rNgexlVstEP+lStxcV+BQ=
X-Google-Smtp-Source: APXvYqxiFm1Nhplm0aBpDjW+CtMLh8UI9p7lo+6fwkCCxahVt+Msy5VPviPpPChfxIeg3iUeROtNjQ==
X-Received: by 2002:a2e:655b:: with SMTP id z88mr36540813ljb.108.1558430810192;
        Tue, 21 May 2019 02:26:50 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id m5sm4604581lfb.47.2019.05.21.02.26.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:26:49 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hT12i-000677-Vd; Tue, 21 May 2019 11:26:45 +0200
Date:   Tue, 21 May 2019 11:26:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: pl2303: add Allied Telesis VT-Kit3
Message-ID: <20190521092644.GO568@localhost>
References: <20190514053542.28047-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514053542.28047-1-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 14, 2019 at 05:35:42PM +1200, Chris Packham wrote:
> This is adds the vendor and device id for the AT-VT-Kit3 which is a
> pl2303-based device.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Now applied, thanks.

Johan
