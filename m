Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6807B6A4A0
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 11:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731843AbfGPJLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 05:11:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45604 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfGPJLZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 05:11:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so19117027lje.12
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 02:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ok0ZGcg062QiA2kaa4L+/wHJtdASFn4F6meD81tpvsk=;
        b=hyInzkzHYhvUOcwujd76r7CND289hMffqd+wyW5ambFYdiobCfBcLwP45FNMoAUidk
         gbOTfaU5i1ug9OI+Orx7HqENl/+Wu614KZboRODjxfuDlHF0lCjRnA5izqMUP/dQKBoi
         tCasACm5RLhTnhgWt7o4P/A9JZbl2yiaWM6mqYKZTGBX4+gUkdexSv1s2FF8H5ya4QsA
         1Eu2PFcsZMcfJl+TYYJTXZpSfmkfgFFdz1i66+cJnXOU5Na2UOnkuicxsxmEJYfsK5dn
         2P9ILoCAMye7c5W2yc2OK5WO+NlJMOj0fCm4SJvjUrPJdTFgQA5Z2NqOKOukuNSzFrYZ
         8vLw==
X-Gm-Message-State: APjAAAVLOvLnFdiRRsLATIqELJuNnUWYt90MR5D1Fzs4E/S1669UtyIv
        gau1n+mJm1EKItpS8yWdpJpTVWH+UuY=
X-Google-Smtp-Source: APXvYqyAYEhPpLKy1AK6AEtmdGjsdDiPv9snUxjUfatd//t9fr8XB1fRKpOu46499xq4G1RDNGrz5Q==
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr16543635lji.231.1563268283676;
        Tue, 16 Jul 2019 02:11:23 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id t137sm2712965lff.78.2019.07.16.02.11.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 02:11:22 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnJUY-00044Y-1N; Tue, 16 Jul 2019 11:11:22 +0200
Date:   Tue, 16 Jul 2019 11:11:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rogan Dawes <rogan@dawes.za.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
 [version 2]
Message-ID: <20190716091122.GB3522@localhost>
References: <20190711094012.GA16316@lisa.dawes.za.net>
 <20190711103457.GA17414@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711103457.GA17414@lisa.dawes.za.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 11, 2019 at 12:34:57PM +0200, Rogan Dawes wrote:
> Add device id for D-Link DWM-222.
> 
> Cc: stable@vger.kernel.org
> Signed-Off-By: Rogan Dawes <rogan@dawes.za.net>
> ---
> Apologies, a typo crept in when submitting this previously.

Thanks for the patch, all looks good, but next time add the version
information inside the "[PATCH v2]" prefix so that it doesn't end up the
commit logs.

Would you mind posting also the output of usb-devices (or lsusb -v) for
this device for completeness? The former is compact enough to be
included in the commit message.

No need to resend unless you prefer to. I'll apply this one after the
merge window closes.

Thanks,
Johan
